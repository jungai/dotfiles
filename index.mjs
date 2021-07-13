#!/usr/bin/env zx

const arch = await os.arch()
const currentPath = await $`pwd`
const homeDir = await os.homedir()

function getMyZsh() {
	switch (arch) {
		case 'arm64':
			return '/zsh/.m1.zshrc';
		default:
			return '/zsh/ubuntu.zshrc';
	}
}

const configList = [
	{
		from: '/vim/.vimrc',
		target: '/.vimrc',
	},
	{
		from: '/tmux/.tmux.conf',
		target: '/.tmux.conf',
	},
	{
		from: '/zsh/starship.toml',
		target: '/.config/starship.toml',
	},
	{
		from: getMyZsh(),
		target: '/.zshrc',
	},
	{
		from: '/zsh/fishy-jungai.zsh-theme',
		target: '/.oh-my-zsh/themes/fishy-jungai.zsh-theme',
	},
	// {
	// 	from: '/fish/config.fish',
	// 	target: '/.config/fish/config.fish',
	// },
]

async function createDir() {
	console.log(chalk.yellow('👉🏻 create dir'))

	await $`mkdir -p ${homeDir}/.config`
	// await $`mkdir -p ${homeDir}/.config/fish`

	console.log(chalk.yellow('🍭 finish'))
}

async function clean() {
	console.log(chalk.yellow('👉🏻 clean'))

	await Promise.all(
		configList.map(config => $`rm -f ${homeDir}${config.target}`)
	)

	console.log(chalk.yellow('🍭 finish'))
	
}

async function sync() {
	console.log(chalk.yellow('👉🏻 sync'))

	await Promise.all(
		configList.map(config => $`ln -sf ${currentPath}${config.from} ${homeDir}${config.target}`)
		)

	console.log(chalk.yellow('🍭 finish'))

}

try {
	await clean()
	await createDir()
	await sync()
} catch (p) {
	console.log(`Exit code: ${p.exitCode}`)
	console.log(`Error: ${p.stderr}`)
}