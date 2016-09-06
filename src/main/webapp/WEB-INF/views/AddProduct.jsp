<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
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
  
  <style>

</style>
</head>
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
    <div class="container" ng-app="imgApp" ng-controller="imgCtrl"> 
    <c:url var="AddProduct" value="AddProduct"></c:url>
   <form:form commandName="Product" method="post" action="storeproduct" enctype="multipart/form-data">
       <table class="table table-bordered" >
           
           <tr><td><form:label path="name">Product Name :</form:label></td>
               <td><form:input path="name"/>
               <font color="red"><form:errors path="name"></form:errors></font></td>
           </tr>
           <tr><td><form:label path="price">Product Price :</form:label></td>
               <td><form:input path="price"/>
               <font color="red"><form:errors path="price"></form:errors></font></td>
           </tr>
           <tr><td><form:label path="description">Description :</form:label></td>
               <td><form:input path="description"/>
               <font color="red"><form:errors path="description"></form:errors></font></td>
           </tr>           
               <tr><td><form:label path="img">product Image :</form:label></td>
               <td><form:input path="img" type="file"/>
               <font color="red"><form:errors path="img"></form:errors></font></td>
           </tr>
             <tr><td><form:label path="quantity">quantity :</form:label></td>
               <td><form:input path="quantity"/>
               <font color="red"><form:errors path="quantity"></form:errors></font></td>
           </tr>
           <tr><td><form:label path="Supplier">Supplier Name:</form:label></td>
               <td><select name="Supplier.id" >
   				 <option value="">---Select---</option>
   				 <c:forEach var="Supplier" items="${suppliers}">
   				 <option value="${Supplier.id}">${Supplier.supname}</option>
    		</c:forEach>
    		</select></td></tr>
           <tr><td></td>
               <td><input type="submit" value="submit" class="btn"/></td>
           </tr>   
       </table>
   </form:form>
   <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html> 