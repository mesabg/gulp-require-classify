es         = require 'event-stream'
ngClassify = require 'ng-classify'
gutil      = require 'gulp-util'
unindent   = require 'unindent'
indent     = require 'indent-string'


module.exports = (opt) ->
	modifyFile = (file) ->
		return if file.isNull()
			@emit 'data', file

		return if file.isStream()
			@emit 'error', new gutil.PluginError 'gulp-require-classify', 'Streaming not supported'

		fileString = file.contents.toString 'utf8'

		fileData = ''

		fileString.split("@classify").map (element) -> 
			# Compiling Element
			tab = 0
			chain = ''

			for character in element
				if character.match /[a-zA-Z0-9#]/ 
					break
				else 
					chain += character

			for character in chain
				if character == '\t'
					tab++

			if element.lastIndexOf "\n" > 0
				element = element.substring 0, element.lastIndexOf "\n"

			try
				isFunction = opt instanceof Function
				options    = if isFunction then opt(file) else opt

				for value in [1..tab]
					element    = unindent element 

				data       = ''
				data       = ngClassify element, options
				data       = indent data, tab, '\t'
				fileData   += data

			catch err
				err.filename = file.path
				return @emit 'error', new gutil.PluginError 'gulp-require-classify', err

		file.contents = new Buffer fileData

		@emit 'data', file

	es.through modifyFile
