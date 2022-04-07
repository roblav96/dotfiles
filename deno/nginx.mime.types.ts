// import 'https://raw.githubusercontent.com/roblav96/jellyfin-debrids/main/src/devops/console.ts'

import * as collections from 'https://deno.land/std/collections/mod.ts'
import * as path from 'https://deno.land/std/path/mod.ts'
import sortKeys from 'https://esm.sh/sort-keys?dev'

let prefix = new TextDecoder().decode(
	await Deno.run({
		cmd: ['brew', '--prefix'],
		stdout: 'piped',
	}).output(),
)
let globs = await Deno.readTextFile(path.join(prefix.trim(), 'share/mime/globs'))
let lines = globs.split('\n').filter((v) => v.includes(':*.'))
let groups = collections.groupBy(lines, (v) => v.split(':*.')[0])
let mimes = sortKeys(collections.mapValues(groups, (v) => v!.map((v) => v.split(':*.')[1]).sort()))
let each = Object.entries(mimes).reduce((target, [key, value], index) => {
	return target.concat(`    ${key} ${value.join(' ')};`)
}, [] as string[])
let output = `
types {
${each.join('\n')}
}
`
console.log(output)
await Deno.writeTextFile(path.join(prefix.trim(), 'etc/nginx/mime.types'), output)
