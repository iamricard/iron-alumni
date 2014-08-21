angular
  .module('ironalumni')
  .controller('CourseCtrl', ['$scope', 'Course', function($scope, Course) {
    'use strict';
    $scope.courses = Course.query();
    $scope.newCourse = function() {
      var course = new Course($scope.course);
      course.$save().then(function(course) {
        // handle success
      }, function(err) {
        // handle error
        console.log(err);
      });
    };
  }]);
