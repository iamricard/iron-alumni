angular
  .module('ironalumni')
  .factory('Course', ['$resource', function($resource) {
    return $resource('/courses/:id.json', {}, {
      update: { method: 'PUT' },
      addMember: {
        params: { id: '@id', member_id: '@member_id' },
        method: 'PUT',
        url: '/courses/:id/members/:member_id.json'
      }
    });
  }]);