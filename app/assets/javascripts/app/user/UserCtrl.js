angular
  .module('ironalumni')
  .controller('UserCtrl', ['$scope', 'Auth', function($scope, Auth) {
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
          console.log(loggedInUser);
        }, function(err) {
          console.log(err);
        });
    };

    $scope.register = function() {
      var credentials = {
        email: $scope.email,
        password: $scope.password
      };

      Auth.register(credentials)
        .then(function(registeredUser) {
          console.log(registeredUser);
          return;
        }, function(err) {
          console.log(err);
        });
    };
  }]);
