angular
  .module('ironalumni')
  .controller('MemberProfileCtrl', ['$scope', '$rootScope', '$routeParams', 'Member', function($scope, $rootScope, $routeParams, Member) {

    $scope.member = Member.get({ id: $rootScope.member.id });
    $scope.updateAttrs = function(member) {
      member.$update().then(function(member) {
        $rootScope.notification = { message: 'Profile updated successfully', type: 'success' };
      }, function(err) {
        $rootScope.notification = { message: 'Error updating your profile', type: 'error' };
      });
    };

  }]);
