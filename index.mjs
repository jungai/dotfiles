#!/usr/bin/env zx

const arch = await os.arch();
const currentPath = await $`pwd`;
const homeDir = await os.homedir();

const configList = [
	{
		from: "/tmux/.tmux.conf",
		target: "/.tmux.conf",
	},
	{
		from: "/fish/starship.toml",
		target: "/.config/starship.toml",
	},
	{
		from: "/fish/m1.fish",
		target: "/.config/fish/config.fish",
	},
	{
		from: "/alacritty/alacritty.yml",
		target: "/.alacritty.yml",
	},
	{
		from: "/kitty/kitty.conf",
		target: "/.config/kitty/kitty.conf",
	},
	{
		from: "/gitui/key_bindings.ron",
		target: "/.config/gitui/key_bindings.ron",
	},
	{
		from: "/.gitconfig",
		target: "/.gitconfig",
	},
	{
		from: "/nvim",
		target: "/.config/nvim",
	},
	{
		from: "/zsh/.zshrc",
		target: "/.zshrc",
	},
];

async function createDir() {
	console.log(chalk.yellow("👉🏻 create dir"));

	await $`mkdir -p ${homeDir}/.config`;
	// await $`mkdir -p ${homeDir}/.config/fish`

	console.log(chalk.yellow("🍭 finish"));
}

async function clean() {
	console.log(chalk.yellow("👉🏻 clean"));

	await Promise.all(
		configList.map((config) => $`rm -f ${homeDir}${config.target}`)
	);

	console.log(chalk.yellow("🍭 finish"));
}

async function sync() {
	console.log(chalk.yellow("👉🏻 sync"));

	await Promise.all(
		configList.map(
			(config) =>
				$`ln -sf ${currentPath}${config.from} ${homeDir}${config.target}`
		)
	);

	console.log(chalk.yellow("🍭 finish"));
}

try {
	await clean();
	await createDir();
	await sync();
} catch (p) {
	console.log(`Exit code: ${p.exitCode}`);
	console.log(`Error: ${p.stderr}`);
}
