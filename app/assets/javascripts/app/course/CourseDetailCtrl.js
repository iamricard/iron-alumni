angular
  .module('ironalumni')
  .controller('CourseDetailCtrl', ['$scope', '$routeParams', 'Course', 'Member', function($scope, $routeParams, Course, Member) {
    'use strict';

    $scope.newMember = '';
    $scope.course = Course.get({ id: $routeParams.id });
    $scope.addMember= function() {
      Member.query({ email: $scope.newMember }).$promise.then(function(m) {
        Course.addMember({ id: $scope.course.id, member_id: m[0].id }).$promise.then(function(c) {
          $scope.course = c;
        }, function(error) {
          console.log(error);
        });
      }, function(error) {
        alert('ERROR');
        console.log(error);
      });
    };
  }]);
