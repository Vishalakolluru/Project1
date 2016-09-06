<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Edit</title>
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
      <a class="navbar-brand" href="hai">Home</a>
    </div>
  </div>
</nav><nav class="navbar navbar-inverse">
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
     
  <form:form  modelAttribute="Supplier" method="post" action="updatesupplier" >
  <table>
     <tr><td><form:label path="supid">Supplier Id:</form:label></td>
               <td><form:input path="supid" value="${Supplier.supid}"/></td>
           </tr>
      <tr><td><form:label path="supname">Supplier Name :</form:label></td>
               <td><form:input path="supname" value="${Supplier.supname}"/></td>
           </tr>
           <tr><td><form:label path="suplocation">Supplier Address :</form:label></td>
               <td><form:input path="suplocation" value="${Supplier.suplocation}"/></td>
           </tr>
           <tr><td><form:label path="categoryid">category id :</form:label></td>
               <td><form:input path="categoryid" value="${Supplier.categoryid}"/></td>
           </tr>
           <tr><td><form:label path="categoryname">category name :</form:label></td>
               <td><form:input path="categoryname" value="${Supplier.categoryname}"/></td>
           </tr>
           <tr><td><form:label path="productid">product id :</form:label></td>
               <td><form:input path="productid" value="${Supplier.productid}"/></td>
           </tr>
           <tr><td><form:label path="productname">product name :</form:label></td>
               <td><form:input path="productname" value="${Supplier.productname}"/></td>
           </tr>
               <tr><td></td>
               <td><input type="submit" value="submit"/></td>
           </tr>
           </table>      
  </form:form>   
  <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>