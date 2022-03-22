// import 'https://raw.githubusercontent.com/roblav96/jellyfin-debrids/main/src/devops/console.ts'

// let adb = Deno.run({
// 	cmd: ['adb', 'exec-out', 'dumpsys', 'media.audio_flinger'],
// 	stdout: 'piped',
// })
// // console.log('adb ->', adb)
// let status = await adb.status()
// // console.log('status ->', status)
// if (!status.success) {
// 	Deno.exit(status.code)
// }
// let stdout = new TextDecoder().decode(await adb.output())
// // console.log('stdout ->', stdout)

let stdout = new TextDecoder().decode(
	await Deno.run({
		cmd: ['adb', 'exec-out', 'dumpsys', 'media.audio_flinger'],
		stdout: 'piped',
	}).output(),
)
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
// output.push(sections.find((v) => v.startsWith('Output thread'))!)
output.push(sections.find((v) => v.includes('Standby: no'))!)
output.push(sections.find((v) => v.startsWith('Nvidia Audio HAL HW Device:'))!)
let alsa = sections.find((v) => v.startsWith('ALSA devices:'))
if (alsa) {
	output.push(alsa.split('\n').filter(v => !v.includes('0    0       0')).join('\n')) // prettier-ignore
}
output.push(sections.find((v) => v.startsWith('AUX:'))!)
output.push(sections.find((v) => v.startsWith('Nvidia Audio Output streams'))!)

Deno.stdout.writeSync(new TextEncoder().encode(`${output.filter((v) => !!v).join('\n\n')}\n`))

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
