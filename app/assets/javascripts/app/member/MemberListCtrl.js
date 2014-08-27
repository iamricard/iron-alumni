angular
  .module('ironalumni')
  .controller('MemberListCtrl', ['$scope', '$filter', 'Member', 'Course', '$location', 'Auth', function($scope, $filter, Member, Course, $location, Auth) {
    'use strict';

    $scope.selectedCourse = '';
    $scope.course = { members: Member.query() };
    $scope.courses = Course.query();

    var formatDate = function(date) {
      return $filter('date')(date, 'MMM yyyy').toUpperCase();
    };

    $scope.formatCourse = function(c) {
      return [c.city.toUpperCase(), c.course_type.toUpperCase(), formatDate(c.start_date)].join(' ');
    };

    $scope.filterByCourse = function() {
      if (!$scope.selectedCourse) $scope.course = { members: Member.query() }
      else $scope.course = Course.get({ id: $scope.selectedCourse.id });
    };
  }]);
