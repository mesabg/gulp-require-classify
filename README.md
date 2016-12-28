# gulp-require-classify

Mix ng-classify with require js and using a simple syntax 

## Getting Started

These is a project created to solve a problem I have when I was trying to use ng-classify plug-in and requireJS

### Prerequisites

Nothing

### Installing

Run this command

```
npm install gulp-require-classify --save-dev
```

### Use

Using tags "@classify" and "@!classify" code inside of them are going to be compiled using ng-classify plug in, no matter indentation.

Input Code
```
# Main Application
define [
	
], () ->
	'use strict'
	
	@classify
	# Main Application Class
	class App extends App then constructor: -> return [
		'ngRoute'
	]

	# Main Controller Class
	class Main extends Controller
		constructor: ($scope) ->
			$scope.msg = "Running"
	@!classify
```

Output Code
```
# Main Application
define [
	
], () ->
	'use strict'
	
	
	# Main Application Class
	class App then constructor: -> return [
		'ngRoute'
	]

	# Main Controller Class
	class Main
		constructor: ($scope) ->
			$scope.msg = "Running"


	angular.module('app', new App())
	.controller('mainController', ['$scope', Main])
```

## Built With

* [ng-classify](https://www.npmjs.com/package/gulp-ng-classify) - Amazing Plug-in
* [unindent](https://www.npmjs.com/package/unindent) - Unindenting tool
* [indent-string](https://www.npmjs.com/package/indent-string) - Indenting tool
* [gulp-util](https://www.npmjs.com/package/gulp-util) - Gulp general use tool


## Authors

* **Moisés Berenguer** - *Initial work* - [CaryLandholt](https://github.com/CaryLandholt)

## License

This is an unlicensed project - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* Solving ng-classify problem using requireJS
