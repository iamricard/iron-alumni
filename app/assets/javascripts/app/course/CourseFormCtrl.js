angular
  .module('ironalumni')
  .controller('CourseFormCtrl', ['$scope', '$rootScope', '$routeParams', 'Course', function($scope, $rootScope, $routeParams, Course) {
    'use strict';

    $scope.newCourse = function() {
      var course = new Course($scope.course);
      course.$save().then(function(course) {
        $rootScope.notification = { message: 'Course successfully created', type: 'success' };
      }, function(err) {
        $rootScope.notification = { message: 'Something went wrong', type: 'error' };
      });
    };
  }]);
