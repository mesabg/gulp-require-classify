# gulp-require-classify
Mix ng-classify with require js and using a simple sintax 

Use


define [

], () ->
	'use strict'
	# Main Application Class

	@classify
	class App extends App then constructor: -> return [
		'ngRoute'
	]

	class Main extends Controller
		constructor: ($scope) ->
			$scope.msg = 'Application has started'

	@classify


Using tag "@classify" code inside of them are going to be compiled using ng-classify plug in, no matter indentation.

Note: great solution if you are using RequireJS, AngularJS, CoffeeScript, and ng-classify plugin  