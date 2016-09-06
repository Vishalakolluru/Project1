<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <style type="text/css">
</style>
</head>
<body>

<br>
<br>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="Home">Mobile Shopping</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Home">Home</a></li>
       <li><a href="Products">Products</a></li>
       <li><a href="Categories">Categories</a></li>   
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="Login"><span class="glyphicon glyphicon-user"></span> Login</a></li>
       
    </ul>
  </div>
</nav>
<div class="container">
   <form:form commandName="Register" method="post" action="storeUser">
   <form:errors path="*" cssClass="errStyle" element="div" />
   <table>
			<tr>
				<td><form:label path="username">
						<spring:message text="User Name" />
					</form:label></td>

				<td><form:input path="username" required="true"
						title="name should not be empty" /></td><br>
			</tr>
			<tr>
				<td><form:label path="password">
						<spring:message text="Password" />
					</form:label></td>

				<td><form:input path="password" pattern=".{4,15}"
						required="true"
						title="password should contains 4 to 15 characters" /></td><br>
			</tr>
			<td><form:label path="confirmpassword">
						<spring:message text="confirmpassword" />
					</form:label></td>
			<td><form:input path="confirmpassword" pattern=".{4,15}"
						required="true"
						title="password should contains 4 to 15 characters" /></td><br>
			</tr>
			<tr>
				<td><form:label path="mobilenumber">
						<spring:message text="Mobile" />
					</form:label></td>

				<td><form:input type="tel" path="mobilenumber" pattern="^\d{10}$" required="true"
						title="Please enter valid mobile number" /></td><br>
			</tr>

			<tr>
				<td><form:label path="mail">
						<spring:message text="Email"
	 />
						
					</form:label></td>

				<td><form:input type="email" path="mail" /></td><br>
			</tr>

			<tr>
				<td><form:label path="address">
						<spring:message text="Address" />
					</form:label></td>

				<td><form:input path="address" required="true" /></td><br>
			</tr>

			<tr>

				<td><input type="submit"
					value="<spring:message text="Register"/>" /></td>
				<td><input type="reset" value="<spring:message text="Reset"/>" />
				</td><br>
 </table>
</form:form>
</div>
<br>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>