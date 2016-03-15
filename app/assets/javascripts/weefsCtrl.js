(function() {
  "use strict";
  app.controller("weefsCtrl",["$scope", "$http", function($scope, $http){

      $scope.setup = function(){

        $http.get('../api/v1/weefs/' + gon.id + '.json?their_posts=id').then(function(response){
          $scope.posts = response.data;
        });

        $http.get('../api/v1/weefs/' + gon.id + '.json?their_weactions=id').then(function(response){
          $scope.weactions = response.data;
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