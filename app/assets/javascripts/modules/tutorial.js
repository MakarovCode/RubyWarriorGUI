(function(){
	var module = angular.module("tutorial-module",[]);

	module.controller('TutorialController',['$scope', '$http', function($scope,$http){

		this.tutorial = false; 

		this.toggleTutorial = function(tutorial) {
        	this.tutorial = this.tutorial === false ? true: false;
    	};
	}]);
})();