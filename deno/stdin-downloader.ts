// import 'https://raw.githubusercontent.com/roblav96/jellyfin-debrids/main/src/devops/console.ts'

import * as io from 'https://deno.land/std/io/mod.ts'
import * as signal from 'https://deno.land/std/signal/mod.ts'
import * as streams from 'https://deno.land/std/streams/mod.ts'
import R from 'https://esm.sh/rambdax?dev'

Deno.setRaw(Deno.stdin.rid, true)
for await (let stdin of io.iterateReader(Deno.stdin)) {
	if (stdin.at(0) == 3) Deno.exit(130)
	let line = new TextDecoder().decode(stdin)
	console.log('line ->', line)
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
