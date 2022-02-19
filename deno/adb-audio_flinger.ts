// import 'https://raw.githubusercontent.com/roblav96/jellyfin-debrids/main/src/devops/console.ts'

let adb = Deno.run({
	cmd: ['adb', 'exec-out', 'dumpsys', 'media.audio_flinger'],
	stdout: 'piped',
})
// console.log('adb ->', adb)

let { success, code } = await adb.status()
if (!success) {
	Deno.exit(code)
}

let stdout = new TextDecoder().decode(await adb.output())
let sections = stdout.split(/\n\n\b/)
// console.log('sections.length ->', sections.length)
// sections.forEach((v) => console.log('█', v))

let output = [] as string []

let audioout = sections.find((v) => v.includes('Standby: no'))!
output.push(audioout.split('Hal stream dump')[0].trim())
output.push(sections.find((v) => v.startsWith('Nvidia Audio HAL HW Device:'))!)
output.push(sections.find((v) => v.startsWith('ALSA devices:'))!)
output.push(sections.find((v) => v.startsWith('AUX:'))!)

Deno.stdout.writeSync(new TextEncoder().encode(output.join('\n\n')))

Deno.exit(code)

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
