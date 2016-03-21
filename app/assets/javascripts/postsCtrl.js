

(function() {
  "use strict";

  app.controller("postsCtrl",["$scope", "$http", function($scope, $http){
      
      $scope.setup = function(){
        $http.get('../api/v1/posts.json').then(function(response){
          $scope.posts = response.data;
          
        });
      };

      $scope.descending = false;
 
      $scope.sortBy = function(sortAttribute) {
        if (sortAttribute != $scope.sortByAttribute) {
          $scope.descending = true;
        } else {
          $scope.descending = !$scope.descending;
        }
        $scope.sortByAttribute = sortAttribute;
      };

      window.scope = $scope; 
    }]);
}());



