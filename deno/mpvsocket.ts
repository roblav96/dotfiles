import 'https://raw.githubusercontent.com/roblav96/futon-media-iptv/main/src/console.ts'

import * as http from 'https://deno.land/std/http/mod.ts'

http.serve(
	async (request) => {
		try {
			console.log('request ->', await request.text())
			return new Response(null)
		} catch (error) {
			console.error('http.serve request ->', error)
			return new Response(error.toString(), {
				status: http.Status.InternalServerError,
			})
		}
	},
	{ hostname: '127.0.0.1', port: 12909 },
)

//

// import { MpvIPC } from 'https://deno.land/x/mpv_ipc/mod.ts'

// const client = await MpvIPC.connectSocket('/tmp/mpvsocket')

// for await (const event of client) {
// 	console.log('event ->', event)
// }
