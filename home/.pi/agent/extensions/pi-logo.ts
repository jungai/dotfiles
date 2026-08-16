import type { ExtensionAPI, Theme } from "@earendil-works/pi-coding-agent";

function getPiLogo(theme: Theme): string[] {
	const white = (text: string) => theme.fg("accent", text);
	const black = (text: string) => theme.fg("dim", text);
	const W = "██";
	const B = "  ";

	// Pixel-style version of Pi's round black mark and white angular glyph.
	return [
		"",
		`       ${black("  ●●●  ")}`,
		`     ${black("●●")} ${black(B)} ${black("●●")}`,
		`    ${black("●")} ${white(W.repeat(3))} ${black("●")}`,
		`    ${black("●")} ${white(W)}${B}${white(W)}${black("●")}`,
		`    ${black("●")} ${white(W.repeat(2))}${B}${white(W)}${black("●")}`,
		`    ${black("●")} ${white(W)}${B.repeat(2)}${white(W)}${black("●")}`,
		`     ${black("●●")} ${black(B)} ${black("●●")}`,
		`       ${black("  ●●●  ")}`,
		"",
	];
}

export default function (pi: ExtensionAPI) {
	pi.on("session_start", (_event, ctx) => {
		if (ctx.mode !== "tui") return;

		ctx.ui.setHeader((_tui, theme) => ({
			render(_width: number): string[] {
				return getPiLogo(theme);
			},
			invalidate() {},
		}));
	});
}
