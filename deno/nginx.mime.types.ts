// import 'https://raw.githubusercontent.com/roblav96/jellyfin-debrids/main/src/devops/console.ts'

import * as collections from 'https://deno.land/std/collections/mod.ts'
import * as path from 'https://deno.land/std/path/mod.ts'
import sortKeys from 'https://esm.sh/sort-keys?dev'

let db = (await (
	await fetch('https://raw.githubusercontent.com/jshttp/mime-db/master/db.json')
).json()) as {
	[mediaType: string]: {
		source: string
		compressible: boolean
		charset: string
		extensions: string[]
	}
}

let each = Object.entries(db).reduce((target, [key, value], index) => {
	if (!Array.isArray(value.extensions)) return target
	return target.concat(`    ${key} ${value.extensions.join(' ')};`)
}, [] as string[])

let output = `
types {
${each.join('\n')}
}
`
console.log(output)

let prefix = new TextDecoder().decode(
	await Deno.run({
		cmd: ['brew', '--prefix'],
		stdout: 'piped',
	}).output(),
)
await Deno.writeTextFile(path.join(prefix.trim(), 'etc/nginx/mime.types'), output)
