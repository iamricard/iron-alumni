angular
  .module('ironalumni')
  .controller('MemberDetailCtrl', ['$scope', '$rootScope', 'Member', function($scope, $rootScope, Member) {

    $scope.member = Member.get({id: $rootScope.member.id});
    $scope.updateAttrs = function(member) {
      console.log(member);
      member.$update().then(function(member) {
        console.log(member);
      }, function(err) {
        console.log(err);
      });
    };

  }]);