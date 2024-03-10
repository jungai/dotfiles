#!/usr/bin/env zx

try {
	const processId =
		await $`docker ps | fzf --reverse | awk 'BEGIN{FS="[ ]"} {print $1}'`;

	await $`docker stop ${processId} && docker rm ${processId}`;

	console.log(chalk.green("Success 🎉"));
} catch (_e) {}