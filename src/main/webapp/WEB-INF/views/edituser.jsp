 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
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
  <form:form modelAttribute="Login" method="post" action="updateuser">
    <table>
    <tr><td><form:label path="id">User ID:</form:label></td>
               <td><form:input path="id" value="${Login.id}" text="readonly"/></td>
           </tr>
           
      <tr><td><form:label path="username">User Name :</form:label></td>
               <td><form:input path="username" value="${Login.username}" text="readonly"/></td>
           </tr>
           
           <tr><td><form:label path="password">password:</form:label></td>
               <td><form:input path="password" value="${Login.password}" text="readonly"/></td>
           </tr>
           <tr><td><form:label path="status">status:</form:label></td>
             <td><form:input path="status" value="${Login.status}"/>
               </td>
           </tr>
           <tr><td><form:label path="role">role:</form:label></td>
               <td><form:input path="role" value="${Login.role}"/>
               </td>
           </tr>       
               <td><input type="submit" value="submit"/></td>
           </table>
  </form:form>
 
	  
	 <%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
 