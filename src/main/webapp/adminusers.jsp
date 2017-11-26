<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>

</head>
<body>
	<nav>
		<ul>
			<li class="navOption active"><a href="index">Products</a></li>

			<c:if test="${fn:containsIgnoreCase(role,'d')}">
				<li><a class="navOption" href="delivery">Delivery</a></li>
			</c:if>
			<c:if test="${fn:containsIgnoreCase(role,'a')}">
				<li><a class="navOption" href="admin">Users</a></li>
			</c:if>
			<c:if test="${fn:containsIgnoreCase(role,'l')}">
				<li><a class="navOption" href="logistics">Logistics</a></li>
			</c:if>
		</ul>
	</nav>
	<div style="float: left; width: 50%;">
		<a href="viewUserDetails">${username}</a> <a href="logout">Log out</a>
		<a href="shoppingCart">Shopping Cart: ${shoppingCartQuantity}</a>

		<table style="width: 100%">
			<tr>
				<th>Name</th>
				<th>Username</th>
				<th>User ID</th>
				<th>Address</th>
				<th>Phone</th>
				<th></th>
			</tr>
			<c:forEach items="${users}" var="user">
				<tr>
					<td><a href="viewUserDetails?uid=${user.id}">${user.name}</a></td>
					<td>${user.username}</td>
					<td>${user.id}</td>
					<td>${user.address}</td>
					<td>${user.phone}</td>

					<td><form action="admin" method="post">
							<input type="hidden" name="userEdited" value="${user.id}" />
							<div style="display: inline-block">
								<label><input style="display: block" type="checkbox"
									name="isClient" value="c"
									<c:if test="${fn:containsIgnoreCase(user.role,'c')}">checked="checked"</c:if> />Client</label>
							</div>
							<div style="display: inline-block">
								<label><input style="display: block" type="checkbox"
									name="isDelivery" value="d"
									<c:if test="${fn:containsIgnoreCase(user.role,'d')}">checked="checked"</c:if> />Delivery</label>
							</div>
							<div style="display: inline-block">
								<label><input style="display: block" type="checkbox"
									name="isLogistic" value="l"
									<c:if test="${fn:containsIgnoreCase(user.role,'l')}">checked="checked"</c:if> />Logistic</label>
							</div>
							<div style="display: inline-block">
								<label><input style="display: block" type="checkbox"
									name="isAdmin" value="a"
									<c:if test="${fn:containsIgnoreCase(user.role,'a')}">checked="checked"</c:if> />Admin</label>
							</div>
							<input type="submit" value="Save" />
						</form></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>