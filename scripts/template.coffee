deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'MACHINE'
	aliases: []	#[ 'MACHINE' ] FL-Removed for now, while we only support tdpzu9
	name: 'Topic Florida Plus V1R2 (MACHINE)' #FL - If we extent this again to support more boards this 'name' might be an issue.
	arch: 'aarch64'
	state: 'released'

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/'
		osx: 'https://www.balena.io/docs/learn/getting-started/'
		linux: 'https://www.balena.io/docs/learn/getting-started/'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'MACHINE'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-zeus'
		deployArtifact: 'balena-image-MACHINE.balenaos-img'

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
