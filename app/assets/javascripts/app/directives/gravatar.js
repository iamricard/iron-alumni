angular
  .module('ironalumni')
  .directive('gravatarImage', [function () {
    return {
      restrict: 'A',
      link: function (scope, element, attrs) {
        scope.$watch(function() { return attrs.gravatarEmail; }, function(email) {
          var hash = CryptoJS.MD5(email.toLowerCase());
          var src = 'https://secure.gravatar.com/avatar/' + hash + '?s=400&d=mm';
          element.attr('src', src);
        });
      }
    };
  }]);
