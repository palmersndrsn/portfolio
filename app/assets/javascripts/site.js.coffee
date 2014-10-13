portfolio = angular.module "portfolio", ["ngRoute", "templates"]

portfolio.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when "/",
			templateUrl: "index.html",
			controller: "siteCtrl"
	.otherwise
		redirectTo: "/"

	$locationProvider.html5Mode(true)

]


portfolio.controller "siteCtrl", ["$scope", "$http", ($scope, $http) ->


	# set project 1 to center on page load
	$scope.init = ->

	# need to add logic for left and right buttons
	$scope.leftArrow = ->
		console.log("left")

	$scope.rightArrow = ->
		console.log("right")

	$scope.boxClicked = (num) ->
		console.log(num)


# do I add a backend with all the projects and depoly to heroku?
# to I try and hard code all of this on the front end?


]


portfolio.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]