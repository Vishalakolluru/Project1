<!DOCTYPE html>
<html lang="en">
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Home">Mobile Shopping</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="Home">Home</a></li>
				<li><a href="Products">Products</a></li>

			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="Login"><span class="glyphicon glyphicon-user"></span>
						Login</a></li>
				<li><a href="Register"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">

		<div ng-app="myApp" ng-controller="customersCtrl">
			<input type="text" class="form-control" ng-model="searchBy.name" />
			<table class="table table-hover table-bordered">
				<tr>
					<th>Category id</th>
					<th>Category name</th>
					<th>Category description</th>

				</tr>
				<tr ng-repeat="c in names | filter:searchBy">
					<td>{{c.id}}</td>
					<td>{{c.name}}</td>
					<td>{{c.description}}</td>
					<td><script>
						var app = angular.module('myApp', []);
						app.controller('customersCtrl',
								function($scope, $http) {
									$http.get("list1").then(function(response) {
										$scope.names = response.data;
									});
								});
					</script>
		</div>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>