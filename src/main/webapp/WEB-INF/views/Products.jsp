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
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
	
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="Home">Mobile Shopping</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="Home">Home</a></li>
				<li><a href="Categories">Categories</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				
				<li><a href="Register"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			</ul>
		</div>
	</nav>
	<div class="container"></div>
	<div ng-app="myApp" ng-controller="customersCtrl">
		<input type="text" class="form-control" ng-model="searchBy.name" />
		<table class="table table-hover table-bordered">
			<tr>
				
       <th>Product Name</th>
      
       <th>Product Price</th>
       <th>Product Description</th>
      <th>Action</th>
  </tr>
  <tr ng-repeat="x in names | filter:searchBy">
   
    <td>{{x.Name}}</td>
    
    <td>{{x.Price}}</td>
    <td>{{x.Description}}</td>
    <td>
    <a href="${pageContext.servletContext.contextPath}/view?id={{x.Id}}"><span>View</span></a>
   			<td><script>
					var app = angular.module('myApp', []);
					app.controller('customersCtrl', function($scope, $http) {
						$http.get("list").then(function(response) {
							$scope.names = response.data;
						});
					});
				</script>
				</td>
				</tr>
				</table>
				 <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
