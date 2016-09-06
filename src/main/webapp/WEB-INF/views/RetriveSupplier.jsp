<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
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
 <h1>Hello... <%=session.getAttribute("loggedInUser")%></h1>
    <div class="container">
        
<div ng-app="myApp" ng-controller="customersCtrl">
<input type="text" class="form-control" ng-model="searchBy.name"/>
<table class="table table-hover table-bordered">
  <tr>
      	<th>Supplier Id</th> 
       <th>Supplier name</th>
       <th>Supplier address</th>
       <th>Supplier Categoryid</th>
       <th>Supplier Category name</th>
       <th>Supplier product id</th>
       <th>Supplier product name</th>      
  </tr>
  <tr ng-repeat="s in names | filter:searchBy">
    <td>{{s.supid}}</td>
    <td>{{s.supname}}</td>
    <td>{{s.suplocation}}</td>
    <td>{{s.categoryid}}</td>
     <td>{{s.categoryname}}</td>
      <td>{{s.productid}}</td>
      <td>{{s.productname}}</td>
     
    <td>
    <a href="${pageContext.servletContext.contextPath}/viewsupplier?id={{s.id}}"><span>View</span></a>
    <a href="${pageContext.servletContext.contextPath}/editsupplier?id={{s.id}}"><span>| Edit |</span></a>
    <a href="${pageContext.servletContext.contextPath}/deletesupplier?id={{s.id}}"><span>Delete</span></a>
   </td>  
  </tr>
</table>
<a href="AddSupplier" class="btn btn-info">Add Supplier</a>
</div>
<script>
var app = angular.module('myApp', []);
app.controller('customersCtrl', function($scope, $http) {
    $http.get("list2")
    .then(function (response) {$scope.names = response.data;});
});
</script>
</div>
 <%@ include file="/WEB-INF/views/footer.jsp" %>s
</body>
</html>