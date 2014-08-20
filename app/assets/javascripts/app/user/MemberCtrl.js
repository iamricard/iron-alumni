angular
  .module('ironalumni')
  .controller('MemberCtrl', ['$scope', '$rootScope', '$location', 'Auth', function($scope, $rootScope, $location, Auth) {
    'use strict';

    $scope.email = '';
    $scope.password = '';

    $scope.signin = function() {
      var credentials = {
        email: $scope.email,
        password: $scope.password
      };

      Auth.login(credentials)
        .then(function(loggedInUser) {
          $rootScope.member = loggedInUser;
          $location.path('/');
        }, function(err) {
          console.log(err);
          // handle error
        });
    };

    $scope.register = function() {
      var credentials = {
        email: $scope.email,
        password: $scope.password
      };

      Auth.register(credentials)
        .then(function(registeredUser) {
          // handle successful registration
        }, function(err) {
          console.log(err);
          // handle error
        });
    };
  }]);
