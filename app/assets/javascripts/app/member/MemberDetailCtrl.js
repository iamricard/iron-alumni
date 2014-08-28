angular
  .module('ironalumni')
  .controller('MemberDetailCtrl', ['$scope', '$rootScope', '$routeParams', 'Member', function($scope, $rootScope, $routeParams, Member) {

    $scope.member = Member.get({id: $routeParams.id});
  }]);
