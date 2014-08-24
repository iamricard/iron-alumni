angular
  .module('ironalumni')
  .controller('CourseDetailCtrl', ['$scope', '$rootScope', '$routeParams', 'Course', 'Member', function($scope, $rootScope, $routeParams, Course, Member) {
    'use strict';

    $scope.newMember = '';
    $scope.course = Course.get({ id: $routeParams.id });
    $scope.addMember= function() {
      Member.query({ email: $scope.newMember }).$promise.then(function(m) {
        Course.addMember({ id: $scope.course.id, member_id: m[0].id }).$promise.then(function(c) {
          $scope.course = c;
          $rootScope.notification = { message: 'Member added successfully to the course', type: 'success' };
        }, function(error) {
          $rootScope.notitication = { message: 'Something did not go as expected', type: 'error' };
        });
      }, function(error) {
        $rootScope.notitication = { message: 'Something did not go as expected', type: 'error' };
      });
    };
  }]);
