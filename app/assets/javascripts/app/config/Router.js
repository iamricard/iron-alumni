angular
  .module('ironalumni')
  .config(['$routeProvider', 'AuthProvider', function($routeProvider, AuthProvider) {
    'use strict';

    $routeProvider.when('/signup', {
      controller: 'MemberCtrl',
      templateUrl: '../templates/signup.html'
    }).when('/profile', {
      templateUrl: '../templates/memberProfileTpl.html',
      controller: 'MemberProfileCtrl'
    }).when('/members/:id', {
      controller: 'MemberDetailCtrl',
      templateUrl: '../templates/memberDetailTpl.html'
    }).when('/members', {
      controller: 'MemberListCtrl',
      templateUrl: '../templates/memberListTpl.html'
    }).when('/courses', {
      controller: 'CourseListCtrl',
      templateUrl: '../templates/courseListTpl.html'
    }).when('/courses/new', {
      controller: 'CourseFormCtrl',
      templateUrl: '../templates/courseFormTpl.html'
    }).when('/courses/:id', {
      controller: 'CourseDetailCtrl',
      templateUrl: '../templates/courseDetailTpl.html'
    }).otherwise({
      redirectTo: '/members'
    });

    AuthProvider.loginPath('/members/sign_in.json');
    AuthProvider.logoutPath('/members/sign_out.json');
    AuthProvider.registerPath('/members.json');
  }]);
