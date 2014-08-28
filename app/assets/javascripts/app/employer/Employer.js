angular
  .module('ironalumni')
  .factory('Employer', ['$resource', function($resource) {
    return $resource('/employers/:id.json', {}, {
      update: { method: 'PUT' }
    });
  }]);
