portfolio = angular.module "portfolio", ["ngRoute", "templates"]

portfolio.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when "/",
			templateUrl: "index.html",
			contoller: "siteCtrl"
	.otherwise
		redirectTo: "/"

	$locationProvider.html5Mode(true)

]


portfolio.controller "siteCtrl", ["$scope", "$http", "$rootScope", ($scope, $http, $rootScope) ->


]


portfolio.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]