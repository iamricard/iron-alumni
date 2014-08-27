angular
  .module('ironalumni')
  .controller('MemberListCtrl', ['$scope', 'Member', 'Course', '$location', 'Auth', function($scope, Member, Course, $location, Auth) {
    'use strict';

    $scope.styles = { web: 'material-theme-green', mobile: 'material-button-colored' };
    $scope.course = { members: Member.query() };
    $scope.courses = Course.query();
    $scope.filterByCourse = function(course) {
      if (!course) $scope.course = { members: Member.query() }
      else $scope.course = Course.get({ id: course.id });
    };
  }]);
