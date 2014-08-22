angular
  .module('ironalumni')
  .controller('CourseDetailCtrl', ['$scope', '$routeParams', 'Course', 'Member', function($scope, $routeParams, Course, Member) {
    'use strict';

    $scope.new_member = '';
    $scope.course = Course.get({ id: $routeParams.id });
    $scope.addMember= function() {
      Member.query({ email: $scope.new_member }, function(m, a) {
        Course.addMember({ id: $scope.course.id, member_id: m[0].id }, function(course) {
          console.log('course', course);
          $scope.course = course;
        }, function(err) {
          console.log(err);
          // handle error
        });
      });
    };
  }]);
