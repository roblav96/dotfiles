// import 'https://raw.githubusercontent.com/roblav96/jellyfin-debrids/main/src/devops/console.ts'

let adb = Deno.run({
	cmd: ['adb', 'exec-out', 'dumpsys', 'media.audio_flinger'],
	stdout: 'piped',
})
// console.log('adb ->', adb)

let status = await adb.status()
// console.log('status ->', status)
if (!status.success) {
	Deno.exit(status.code)
}

let stdout = new TextDecoder().decode(await adb.output())
// console.log('stdout ->', stdout)

// let stdout = new TextDecoder().decode(
// 	await Deno.run({
// 		cmd: ['adb', 'exec-out', 'dumpsys', 'media.audio_flinger'],
// 		stdout: 'piped',
// 	}).output(),
// )
// console.log('stdout ->', stdout)

let sections = stdout.split(/\n\n\b/).map((v) => {
	if (v.includes('Hal stream dump:')) {
		v = v.split('Hal stream dump:')[0].trim()
	}
	return v
})
// console.log('sections.length ->', sections.length)
// sections.forEach((v) => console.log('\n\n█', v))

let output = [] as string[]
output.push(sections.find((v) => v.startsWith('Standby: no'))!)
output.push(sections.find((v) => v.startsWith('Nvidia Audio HAL HW Device:'))!)
output.push(sections.find((v) => v.startsWith('ALSA devices:'))!)
output.push(sections.find((v) => v.startsWith('AUX:'))!)

Deno.stdout.writeSync(new TextEncoder().encode(output.filter((v) => !!v).join('\n\n')))
Deno.exit(status.code)

// let stderr = decoder.decode(await adb.stderrOutput())
// await Deno.stdout.write(output)
// console.log('stdout ->', stdout)

// await Deno.stdout.write(await adb.output())

// let stdout = new TextDecoder().decode(await adb.output())
// adb.close()
// console.log('stdout ->', stdout)
// // await p.status()
// // p.close()

// declare global {
//     namespace Deno {
//         interface Core {
//             print(msg: string, code?: number): void
//         }
//         var core: Core
//     }
// }
