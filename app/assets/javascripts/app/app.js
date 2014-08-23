angular
  .module('ironalumni', ['ngRoute', 'ngResource', 'Devise'])
  .run(['$rootScope', '$location', 'Auth', function($rootScope, $location, Auth) {
    Auth.currentUser().then(function(member) {
      $rootScope.member = member;
    }, function(err) {
      console.log('error', err);
    });

    $rootScope.goto = function(path) {
      $location.path(path);
    };

    $rootScope.signout = function() {
      Auth.logout().finally(function(oldUser) {
        $rootScope.member = null;
        window.location = '/';
      });
    };
  }]);
