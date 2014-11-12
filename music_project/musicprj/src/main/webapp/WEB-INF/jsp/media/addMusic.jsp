<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Music</title>
</head>
<body>
	<h4>Add New Music</h4>
	<form:form method="post" action="addMusic" commandName="music">
		<p>
			<form:label path="title">
				Title
			</form:label>
			<form:input path="title" />
		</p>
		<p>
			<form:label path="genere">
				Genere
			</form:label>
			<form:input path="genere" />
		</p>
		<p>
			<form:label path="description">
				Description
			</form:label>
			<form:input path="description" />
		</p>			
		<p>
			<input type="submit" value='Add' /> <input type="button"
				onclick="window.location='<c:url value="/media/" />'"
				value="Cancel" />
		</p>
	</form:form>
</body>
</html>