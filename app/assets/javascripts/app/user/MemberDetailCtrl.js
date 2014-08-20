angular
  .module('ironalumni')
  .controller('MemberDetailCtrl', ['$scope', '$routeParams', 'Member', function($scope, $routeParams, Member) {

    $scope.member = Member.get({id: $routeParams.id});
    $scope.updateAttrs = function(member) {
      member.$update().then(function(member) {
        console.log(member);
      }, function(err) {
        console.log(err);
      });
    };

  }]);
