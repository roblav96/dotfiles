// import 'https://raw.githubusercontent.com/roblav96/jellyfin-debrids/main/src/devops/console.ts'

let { status, stdout, stderr } = await Deno.spawn('adb', {
	args: ['shell', 'dumpsys', 'media.audio_flinger'],
})
if (!status.success) {
	await Deno.writeAll(Deno.stderr, stderr)
	Deno.exit(status.code)
}

let output = new TextDecoder().decode(stdout)
let sections = output.split(/\n\n\b/).map((v) => {
	if (v.includes('Hal stream dump:')) {
		v = v.slice(0, v.indexOf('Hal stream dump:')).trimEnd()
	}
	return v
})
// console.log('sections.length ->', sections.length)
// sections.forEach((v) => console.log('\n\n█', v))

let outputs = [] as string[]
outputs.push(sections.find((v) => v.includes('Standby: no'))!)
outputs.push(sections.find((v) => v.startsWith('Nvidia Audio HAL HW Device:'))!)
let alsa = sections.find((v) => v.startsWith('ALSA devices:'))
if (alsa) {
	outputs.push(alsa.split('\n').filter(v => !v.includes('0    0       0')).join('\n')) // prettier-ignore
}
outputs.push(sections.find((v) => v.startsWith('AUX:'))!)
outputs.push(sections.find((v) => v.startsWith('Nvidia Audio Output streams'))!)

output = `${outputs.filter((v) => !!v).join('\n\n')}\n`
await Deno.writeAll(Deno.stdout, new TextEncoder().encode(output))
