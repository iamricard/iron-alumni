angular
  .module('ironalumni')
  .controller('MemberListCtrl',
    ['$scope', '$filter', 'Member', 'Course', 'Employer', '$location', 'Auth',
    function($scope, $filter, Member, Course, Employer, $location, Auth) {
    'use strict';

    var all = Member.query();
    $scope.members = all;
    $scope.courses = Course.query();
    $scope.employers = Employer.query();

    var setMembers = function(data) {
      $scope.members = data.members;
    };

    var formatDate = function(date) {
      return $filter('date')(date, 'MMM yyyy').toUpperCase();
    };

    $scope.clearFilter = function() {
      $scope.course = null;
      $scope.employer = null;
      $scope.members = all;
    };

    $scope.formatCourse = function(c) {
      return [c.city.toUpperCase(), c.course_type.toUpperCase(), formatDate(c.start_date)].join(' ');
    };

    $scope.formatEmployer = function(e) {
      return e.name;
    };

    $scope.filterByCourse = function() {
      $scope.course = Course.get({ id: $scope.selectedCourse.id });
      $scope.employer = null;
      $scope.course.$promise.then(setMembers);
    };

    $scope.filterByEmployer = function() {
      $scope.employer = Employer.get({ id: $scope.selectedEmployer.id });
      $scope.course = null;
      $scope.employer.$promise.then(setMembers);
    };
  }]);
