<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="x" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
  
  <style>

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
      <li><a href="logout"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      
    </ul>
  </div>
</nav>
</head>
 <h1>Hello... <%=session.getAttribute("loggedInUser")%></h1>
      <div class="container">
             <table class="table">
           <tbody>
            <tr class="danger"><td>Supplier id:       ${Supplier.supid}</td></tr>
            <tr class="info"><td>Supplier name:       ${Supplier.supname}</td></tr>
            <tr class="danger"><td>supplier location: ${Supplier.suplocation}</td></tr>
            <tr class="info"><td>category id:         ${Supplier.categoryid}</td></tr>
             <tr class="danger"><td>category name:    ${Supplier.categoryname}</td></tr>
             <tr class="info"><td>product id:         ${Supplier.productid}</td></tr>
             <tr class="danger"><td>product name:     ${Supplier.productname}</td></tr>
             </tbody>
            </table>
      </div>
     <%@ include file="/WEB-INF/views/footer.jsp" %>
   </body>
</html>