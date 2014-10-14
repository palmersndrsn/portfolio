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
		$scope.linkLayer1 = false
		$scope.screenshot1 = true
		$scope.linkLayer2 = false
		$scope.screenshot2 = true
		$scope.linkLayer3 = false
		$scope.screenshot3 = true

	# need to add logic for left and right buttons
	$scope.leftArrow = ->
		console.log("left")
		# need to figure out how to switch between the projects
		# some how implent an index of boxes.

	$scope.rightArrow = ->
		console.log("right")



	$scope.hideScreenshot = (num) ->
		console.log("hovering")
		if num == 1
			$scope.linkLayer1 = true
			$scope.linkLayer2 = false
			$scope.linkLayer3 = false
			$scope.screenshot1 = false
			$scope.screenshot2 = true
			$scope.screenshot3 = true
		else if num == 2
			$scope.linkLayer2 = true
			$scope.linkLayer1 = false
			$scope.linkLayer3 = false
			$scope.screenshot2 = false
			$scope.screenshot1 = true
			$scope.screenshot3 = true
		else if num == 3
			$scope.linkLayer3 = true
			$scope.linkLayer1 = false
			$scope.linkLayer2 = false
			$scope.screenshot3 = false
			$scope.screenshot2 =true
			$scope.screenshot1 = true
		else
			$scope.linkLayer1 = false
			$scope.linkLayer2 = false
			$scope.linkLayer3 = false
			$scope.screenshot1 = true
			$scope.screenshot2 = true
			$scope.screenshot3 = true

	$scope.showScreenshot = (num) ->
		console.log("mouseout")
		if num == 1
			$scope.linkLayer1 = false
			$scope.screenshot1 = true
		else if num == 2
			$scope.linkLayer2 = false
			$scope.screenshot2 = true
		else if num = 3
			$scope.linkLayer3 = false
			$scope.screenshot3 = true

	$scope.init()
]

portfolio.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]