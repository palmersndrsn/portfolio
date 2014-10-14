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

	# $scope.boxClicked = (num) ->
	# 	console.log(num)
	# 	# $window.open(url, windowName, attributes)
	# 	$scope.window.open("http://ramen-hunter.herokuapp.com", "ramen-hunter")

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



# do I add a backend with all the projects and depoly to heroku?
# to I try and hard code all of this on the front end?

	$scope.projects = [{id: "1"
		, title: "Is it Cool?"
		, desc: "Is It Cool is a SPA made with mobile in mind.
		The idea came from wanting to know if an event is cool or not in real time. Users can create
		events and reviews on events they are attending. The most difficult part of this project was
		working with angular and rails to achieve secure authentication/authorization."
		, tech: "Rails, JavaScript, AngularJS, CoffeeScript, Twitter REST API, Postgres, and bootstrap."
		, img_url: ""
		, link: "http://is-it-cool.herokuapp.com"},
		{id: "2"
		,title: "Backyard Application"
		, desc: "Backyard App was was created by four people using rails and assorted gems, as a way for users to rent backyards
		 or pools. The design and functionality was inspired from our love for airbnb. My focus was handling the geolocation, ajax calls, map functionality,
		 search, and styling, but we touched everything."
		 , tech: "Rails, JavaScript, Handlebars, Mapbox, AJAX, Postgres, and Bootstrap."
		 , img_url: ""
		 , link: "http://backyardapp.herokuapp.com"},
		 {id: "3"
		 , title: "Ramen Hunter"
		 , desc: "Ramen Hunter is the first web app I ever built. I chose to build it because of my love for ramen and yelp has never worked well for finding it. "
		 , tech: "NodeJS, Express, Postgres, Sequelize, Foundation, HTML 5 Geolocation, Bcrypt, and Passport Local."
		 , img_url: ""
		 , link: "http://ramen-hunter.herokuapp.com"}]

	$scope.init()
]

portfolio.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]