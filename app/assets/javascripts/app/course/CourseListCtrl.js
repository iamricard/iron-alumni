angular
  .module('ironalumni')
  .controller('CourseListCtrl', ['$scope', '$routeParams', 'Course', function($scope, $routeParams, Course) {
    'use strict';
    $scope.courses = Course.query();
  }]);
