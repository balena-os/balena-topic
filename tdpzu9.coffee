deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'tdpzu9'
	aliases: []
	name: 'Topic Florida Plus V1R2 (tdpzu9)'
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
		machine: 'tdpzu9'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-zeus'
		deployArtifact: 'balena-image-tdpzu9.balenaos-img'

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
