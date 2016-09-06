<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<html>
<head>
  <link rel="stylesheet" href='<x:url value="/resources/css/bootstrap.min.css"></x:url>' />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
 <h1>Welcome... <%=session.getAttribute("loggedInUser")%></h1>
    <div class="container">
        
<div ng-app="myApp" ng-controller="customersCtrl">
<input type="text" class="form-control" ng-model="searchBy.name"/>
<table class="table table-hover table-bordered">
  <tr>
      	<th>Product Id</th>
       <th>Product Name</th>
       <th> Quantity</th>
       <th>Product Price</th>
       <th>Product Description</th>
      <th>Action</th>
  </tr>
  <tr ng-repeat="x in names | filter:searchBy">
    <td>{{x.Id}}</td>
    <td>{{x.Name}}</td>
    <td> {{x.quantity}}</td>
    <td>{{x.Price}}</td>
    <td>{{x.Description}}</td>
    <td>
    <a href="${pageContext.servletContext.contextPath}/view?id={{x.Id}}"><span>View</span></a>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
    <a href="${pageContext.servletContext.contextPath}/edit?id={{x.Id}}"><span>| Edit |</span></a>
    <a href="${pageContext.servletContext.contextPath}/delete?id={{x.Id}}"><span>Delete</span></a>
   </sec:authorize>
   </td>  
  </tr>
</table>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="AddProduct" class="btn btn-info">Add Product</a>
</sec:authorize>

</div>

<script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
    $http.get("list")
    .then(function (response) {$scope.names = response.data;});
});
</script>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>



