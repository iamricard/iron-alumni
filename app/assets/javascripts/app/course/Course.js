angular
  .module('ironalumni')
  .factory('Course', ['$resource', function($resource) {
    return $resource('/courses/:id.json');
  }]);