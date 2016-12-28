events       = require 'events'
event_stream = require 'event-stream'
ng_classify  = require 'ng-classify'
gulp_util    = require 'gulp-util'
unindent     = require 'unindent'
indent       = require 'indent-string'


module.exports = (opt) ->
	modifyFile = (file) ->
		# Handle Events
		emitter = new events.EventEmitter

		return if file.isNull()
			emitter.emit 'data', file

		return if file.isStream()
			emitter.emit 'error', new gulp_util.PluginError 'gulp-require-classify', 'Streaming not supported'

		fileString = file.contents.toString 'utf8'

		file.contents = new Buffer fileString.replace /@classify((.|\n|\t|\r)*)@!classify/g, (Match, subMatch, lastCharacter, numberOfCharacters, completeString)->
			# Preparing Data
			processString = subMatch.match(/^((\n|\t|\r)*?)[#|a-z]/i)[1]
			tabSize = processString.substr(processString.lastIndexOf('\n'), processString.length).split('\t').length - 1

			# Processing Data
			try
				# Applying Options
				isFunction = opt instanceof Function
				options    = if isFunction then opt(file) else opt

				# Unindenting
				for value in [1..tabSize]
					subMatch = unindent subMatch 

				# Compiling
				data       = ''
				data       = ng_classify subMatch, options

				# Reindenting
				return indent data, tabSize, '\t'

			catch err
				# Catching Errors
				err.filename = file.path
				console.log 'Error in :=> ' + err.filename
				return emitter.emit 'error', new gulp_util.PluginError 'gulp-require-classify', err

		@emit 'data', file

	event_stream.through modifyFile
