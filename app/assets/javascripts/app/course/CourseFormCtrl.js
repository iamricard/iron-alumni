angular
  .module('ironalumni')
  .controller('CourseFormCtrl', ['$scope', '$routeParams', 'Course', function($scope, $routeParams, Course) {
    'use strict';

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
