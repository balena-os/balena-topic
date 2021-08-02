deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'tdkzu6'
	aliases: [ 'tdkzu6' ]
	name: 'TOPIC tdkzu6'
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
		machine: 'tdkzu6'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-zeus'
		deployArtifact: 'balena-image-tdkzu6.balenaos-img'

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
