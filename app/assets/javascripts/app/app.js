angular
  .module('ironalumni', ['ngRoute', 'Devise'])
  .config(['$routeProvider', 'AuthProvider', function($routeProvider, AuthProvider) {
    'use strict';

    $routeProvider.when('/signup', {
      controller: 'UserCtrl',
      templateUrl: '../templates/signup.html'
    }).when('/signin', {
      controller: 'UserCtrl',
      templateUrl: '../templates/signin.html'
    }).otherwise({
      redirectTo: '/signup'
    });

    AuthProvider.loginPath('/members/sign_in.json');
    AuthProvider.logoutPath('/members/sign_out.json');
    AuthProvider.registerPath('/members.json');
  }])
  .run(['$rootScope', 'Auth', function($rootScope, Auth) {
    $rootScope.signout = function() {
      Auth.logout().then(function(oldUser) {
        console.log(oldUser);
      }, function(error) {
        console.log(error);
      });
    };
  }]);
