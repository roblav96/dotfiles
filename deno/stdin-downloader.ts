// import 'https://raw.githubusercontent.com/roblav96/jellyfin-debrids/main/src/devops/console.ts'

import * as io from 'https://deno.land/std/io/mod.ts'
import R from 'https://esm.sh/rambdax?dev'

Deno.setRaw(Deno.stdin.rid, true)
for await (let stdin of io.iterateReader(Deno.stdin)) {
	if (stdin.length == 1 && stdin.at(0) == 3) {
		Deno.setRaw(Deno.stdin.rid, false)
		Deno.exit(130)
	}
	// console.log('stdin ->', stdin)
	// Deno.stdout.writeSync(stdin)
	let input = new TextDecoder().decode(stdin)
	let lines = input.split('\r').filter(Boolean)
	// let lines = input.split('\r').filter(Boolean)

	console.log('lines ->', lines)
}

// // let p = Buffer.alloc(size || 16 * 1024)
// let stdin = await Deno.readAll(Deno.stdin)
// // let stdin = await Deno.stdin.read(p)
// console.log('stdin ->', stdin)

// Deno.addSignalListener('SIGINT', () => {
// 	console.log('interrupted!')
// 	Deno.exit()
// })
// setInterval(Function, 1 << 30)
