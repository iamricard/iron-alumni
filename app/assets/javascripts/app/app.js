angular
  .module('ironalumni', ['ngRoute', 'ngResource', 'Devise'])
  .run(['$rootScope', '$location', 'Auth', function($rootScope, $location, Auth) {
    Auth.currentUser().then(function(member) {
      $rootScope.member = member;
    }, function(err) {
      window.location = '/';
    });

    // TODO: this probably needs to be handled different instead of the rootScope
    $rootScope.$on('devise:unauthorized', function(event, xhr, deferred) {
      if (xhr.status === 401) window.location = '/';
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
