import { readFile } from "node:fs/promises";
import { homedir } from "node:os";
import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";

type Auth = { access?: string; accountId?: string; chatgptAccountId?: string };
type Usage = { rate_limit?: { primary_window?: Window; secondary_window?: Window } };
type Window = { used_percent?: number; reset_at?: number; limit_window_seconds?: number };

async function fetchCodexUsage(signal?: AbortSignal): Promise<string> {
  const authFile = await readFile(`${homedir()}/.pi/agent/auth.json`, "utf8");
  const auth = JSON.parse(authFile) as Record<string, Auth>;
  const credential = auth["openai-codex"];
  if (!credential?.access) return "codex usage unavailable";

  const headers: Record<string, string> = { Authorization: `Bearer ${credential.access}` };
  const account = credential.accountId ?? credential.chatgptAccountId;
  if (account) headers["chatgpt-account-id"] = account;
  const response = await fetch("https://chatgpt.com/backend-api/wham/usage", { headers, signal });
  if (!response.ok) throw new Error(`Codex returned ${response.status}`);
  const usage = (await response.json()) as Usage;
  const primary = usage.rate_limit?.primary_window;
  const weekly = usage.rate_limit?.secondary_window;
  const parts = ["codex"];
  if (typeof primary?.used_percent === "number") {
    parts.push(`${Math.round(primary.used_percent)}% ${windowLabel(primary)}${formatReset(primary?.reset_at)}`);
  }
  if (typeof weekly?.used_percent === "number") {
    const remaining = Math.max(0, 100 - weekly.used_percent);
    parts.push(`${Math.round(weekly.used_percent)}% ${windowLabel(weekly)} used / ${Math.round(remaining)}% left${formatReset(weekly.reset_at)}`);
  }
  return parts.length > 1 ? parts.join(" · ") : "codex usage unavailable";
}

function windowLabel(window: Window): string {
  const seconds = window.limit_window_seconds;
  if (seconds === 604_800) return "weekly";
  if (seconds === 86_400) return "daily";
  if (seconds === 18_000) return "5h";
  return "usage";
}

function formatReset(timestamp?: number): string {
  if (typeof timestamp !== "number") return "";
  const hours = Math.max(0, Math.ceil((timestamp * 1000 - Date.now()) / 3_600_000));
  if (hours < 24) return ` (${hours}h)`;
  return ` (${Math.ceil(hours / 24)}d)`;
}

export default function (pi: ExtensionAPI) {
  let timer: ReturnType<typeof setInterval> | undefined;

  const refresh = async (ctx: ExtensionContext) => {
    try {
      ctx.ui.setStatus("usage-extra", await fetchCodexUsage());
    } catch (error) {
      ctx.ui.setStatus(
        "usage-extra",
        `usage: ${error instanceof Error ? error.message : "request failed"}`,
      );
    }
  };

  pi.on("session_start", (_event, ctx) => {
    if (ctx.mode !== "tui") return;
    void refresh(ctx);
    timer = setInterval(() => void refresh(ctx), 5 * 60 * 1000);
  });

  pi.on("session_shutdown", () => {
    if (timer) clearInterval(timer);
  });

  pi.registerCommand("usage-extra", {
    description: "Refresh Codex usage",
    handler: async (_args, ctx) => {
      await refresh(ctx);
      ctx.ui.notify("Usage refreshed", "info");
    },
  });
}
