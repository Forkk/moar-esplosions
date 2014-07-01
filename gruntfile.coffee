###
forkk\moar-esplosions

Licensed under the MIT license
For full copyright and license information, please see the LICENSE file

@author     Forkk <forkk@forkk.net>
@copyright  2014 Forkk
@link       https://github.com/Forkk/moar-esplosions
@license    http://choosealicense.com/licenses/MIT  MIT License
###

module.exports = (grunt) ->
	fs = require("fs")
	pkginfo = grunt.file.readJSON("package.json")
	
	# Project configuration
	grunt.initConfig
		pkg: pkginfo

		watch:
			uikit:
				files: [ "src/**.coffee" ]
				tasks: [ "coffee" ]

		coffee:
			compile:
				files: "dist/esplosions.js": "src/**.coffee"

	# Load grunt tasks from NPM packages
	grunt.loadNpmTasks "grunt-contrib-coffee"
	grunt.loadNpmTasks "grunt-contrib-watch"

	# Default task.
	grunt.registerTask "default", ["build"]
	grunt.registerTask "build", ["coffee"]

