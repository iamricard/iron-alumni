angular
  .module('ironalumni')
  .factory('Member', ['$resource', function($resource) {
    return $resource('/members/:id.json', {}, { update: { method: 'PUT' }});
  }]);
