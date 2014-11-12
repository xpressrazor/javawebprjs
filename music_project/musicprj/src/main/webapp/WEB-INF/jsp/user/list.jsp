<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset='utf-8'>
		
		<title>User List</title>	
		
	</head>
	<body>
	<a href="<c:url value="/user/add" />">Add User</a>
	<table border="1" width="50%">
						<tr class="heading">
							<td width="10%">Id</td>
							<td width="20%">Name</td>							
							<td width="20%">username</td>							
						</tr>
						<c:forEach items="${userList}" var="user" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="view/${user.id}">${user.firstName} ${user.lastName }</a></td>
								<td>${user.username}</td>
								<c:if test="${user.username != 'admin'}">								
								<td><a href="edit/${user.id}">edit</a> &nbsp;<a
									href="delete/${user.id}">delete</a></td>
									</c:if>
							</tr>
						</c:forEach>
					</table>
	</body>
</html>