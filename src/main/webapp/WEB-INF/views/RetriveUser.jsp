<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"	xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<style type="text/css">
</style>
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
       <li><a href="Categories">Categories</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="RetriveProducts">Manage Products</a></li>
          <li><a href="RetriveCategory">Manage Categories</a></li>
          <li><a href="RetriveUser">Manage Users</a></li>
          <li><a href="RetriveSupplier">Manage Supplier</a></li>
        </ul>
      </li>
     
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <li><a href="${pageContext.request.contextPath}"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      
    </ul>
  </div>
</nav>
				<sec:authorize var="loggedIn" access="isAuthenticated()" />
				<sec:authorize access="permitAll">
					
				</sec:authorize>

				<!-- <li><a href="j_spring_security_logout">Logout</a></li> -->
			</ul>
		</div>
	</nav>
	<h1>
		Hello...
		<%=session.getAttribute("loggedInUser")%></h1>
	<div class="container">

		<div ng-app="myApp" ng-controller="customersCtrl">
			<input type="text" class="form-control" ng-model="searchBy.Productid" />
			<table class="table table-hover table-bordered">
				<tr>
					<th>user Id</th>
					<th>user Name</th>
					<th>user Role</th>
					<th>user Status</th>
					<th>user password</th>
					<th>Action</th>
				</tr>
				<tr ng-repeat="u in names | filter:searchBy">
					<td>{{u.id}}</td>
					<td>{{u.username}}</td> 
					<td>{{u.role}}</td>
					<td>{{u.status}}</td>
					<td>{{u.password}}</td>
				
					<td><a href="${pageContext.request.contextPath}/edituser?id={{u.id}}"><span>Edit</span></a>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<td><a href="${pageContext.request.contextPath}/deleteuser?id={{u.id}}"><span>Delete</span></a>
						</sec:authorize></td>
				</tr>
			</table>
		</div>

			<script>
			var app = angular.module('myApp', []);
			app.controller('customersCtrl', function($scope, $http) {
				$http.get("list3").then(function(response) {
					$scope.names = response.data;
				});
			});
		</script>
	</div>
 <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>



