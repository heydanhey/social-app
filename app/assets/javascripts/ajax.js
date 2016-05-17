(function() {
  "use strict";

  angular.module("app").controller("postsCtrl", function($scope, $http){
      
      $scope.setup = function(){

        $http.get('api/v1/posts.json').then(function(response){
          $scope.weefs = response.data;
        });
      };

      $scope.addPost = function(newPostName, newPostText, newPostEmotion_id){
        var newPost = {
          name: newPostName,
          text: newPostText,
          "emotion_id": newPostEmotion_id
        };

        $http.post('/api/v1/posts.json', newPost).then(function(response){
          $scope.weefs.push(response.data);
          $location.path("/weeks/" + response.data.id);
        }, function(response){
          $scope.errors = response.data.errors;
        });

        $scope.newPostUserId = "";
        $scope.newPostText = "";
        $scope.newPostEmotion_id = "";

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