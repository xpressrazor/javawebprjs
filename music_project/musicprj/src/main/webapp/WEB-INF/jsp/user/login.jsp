<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<h4>Login</h4>
	<form:form method="post" action="login" commandName="user">
		<p>
			<form:label path="username">
				Username
			</form:label>
			<form:input path="username" />
		</p>
				<p>
			<form:label path="password">
				Password
			</form:label>			
			<form:password path="password"/>
		</p>			
		<p>
			<input type="submit" value='Login' /> <input type="button"
				onclick="window.location='<c:url value="/user/" />'"
				value="Cancel" />
		</p>
	</form:form>
	<a href="<c:url value='/user/add'/>">Register</a>
</body>
</html>