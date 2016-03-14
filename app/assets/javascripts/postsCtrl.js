(function() {
  "use strict";

  angular.module("app").controller("postsCtrl", function($scope, $http){
      
      $scope.setup = function(){

        $http.get('../api/v1/posts.json').then(function(response){
          $scope.posts = response.data;
          console.log(response.data);
        });
      };

      $scope.descending = false;
 
      $scope.sortBy = function(sortAttribute) {
        if (sortAttribute != $scope.sortByAttribute) {
          $scope.descending = false;
        } else {
          $scope.descending = !$scope.descending;
        }
        $scope.sortByAttribute = sortAttribute;
      };

      window.scope = $scope; 
    });
}());


// postsCtrl.$inject = ['$scope', '$http'];
