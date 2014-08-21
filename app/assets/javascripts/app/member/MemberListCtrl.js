angular
  .module('ironalumni')
  .controller('MemberListCtrl', ['$scope', 'Member', '$location', 'Auth', function($scope, Member, $location, Auth) {
    'use strict';

    $scope.members = Member.query();
  }]);
