<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Login"><span class="glyphicon glyphicon-user"></span> Login</a></li>
       <li><a href="Register"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
    </ul>
  </div>
</nav>
<br>
<br>
<div class="container">
<c:if test="${error=='true'}">
  <div class="errorblock">
   Enter Your UserName and Password....
  </div>
 </c:if>
 <c:if test="${not empty logoutmsg }">
   <div class="logoutblock">
   <c:out value="${logoutmsg}" />
   </div>
 </c:if>
<form role="form" action="j_spring_security_check" method="post" commandName="Login" >
  <div class="form-group">
    <label for="username">UserName:</label>
    <input type="text"  name="username"  class="form-control" placeholder="Enter User Name" />
  </div>
  <div class="form-group">
    <label for="password">Password:</label>
    <input type="password" class="form-control" name="password" placeholder="Enter Password" /> 
  </div>
  <button type="submit"  class="btn btn-default" >Submit</button>
</form>
<h4>Not A User ? <a href="Register">Sign Up Here</a></h4>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>