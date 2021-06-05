(function(){

	
	var module = angular.module("forem-module",[]);

	module.controller('ForemController',['$scope', '$http', function($scope, $http){
		
		this.foro_ppal = false; 
		
		this.toggleForem = function(foro_ppal) {
        	this.foro_ppal = this.foro_ppal === false ? true: false;




    	};
	}]);
})();