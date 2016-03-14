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

    //   $scope.color =(box, weef){
    //   if (weef.emotion_id == "1") {
    //     box.className = "green";
    //   } else if (weef.emotion_id == "2") {
    //     box.className = "purple";
    //   } else if (weef.emotion_id == "3") {
    //     box.className = "blue";
    //   } else if (weef.emotion_id == "4") {
    //     box.className = "red";
    //   }
      $scope.descending = false;
    // }
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