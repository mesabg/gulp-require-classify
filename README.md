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

Using tag "@classify" and "@!classify" code inside of them are going to be compiled using ng-classify plug in, no matter indentation.

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
		constructor: ($scope, $location) ->
			$scope.msg = "Running"
	@!classify
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Moisés Berenguer** - *Initial work* - [CaryLandholt](https://github.com/CaryLandholt)

## License

This is an unlicensed project - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Solve ng-classify problem using requireJS
