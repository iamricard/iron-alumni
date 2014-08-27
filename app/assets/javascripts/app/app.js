angular
  .module('ironalumni', ['ngRoute', 'ngResource', 'ngAnimate', 'ngMaterial', 'Devise'])
  .run(['$rootScope', '$location', '$materialSidenav', 'Auth', function($rootScope, $location, $materialSidenav, Auth) {
    Auth.currentUser().then(function(member) {
      $rootScope.member = member;
    }, function(err) {
      window.location = '/';
    });

    // TODO: this probably needs to be handled different instead of the rootScope
    $rootScope.$on('devise:unauthorized', function(event, xhr, deferred) {
      if (xhr.status === 401) window.location = '/';
    });

    $rootScope.dismissNotification = function() {
      $rootScope.notification = null;
    };

    $rootScope.goto = function(path) {
      $location.path(path);
    };

    $rootScope.signout = function() {
      Auth.logout().finally(function(oldUser) {
        $rootScope.member = null;
        window.location = '/';
      });
    };

    $rootScope.openSidenav = function() {
      $materialSidenav('left').toggle();
    };

    $rootScope.closeSidenav = function() {
      $materialSidenav('left').close();
    };

    $rootScope.styles = {
      web: 'material-theme-green',
      mobile: 'material-theme-light',
      highlight: {
        input: 'material-input-group-theme-light',
        button: 'material-button-raised material-theme-light'
      }
    };
  }]);
