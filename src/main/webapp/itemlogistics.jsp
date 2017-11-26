<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logistics</title>

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
				<th>ID</th>
				<th>Brand</th>
				<th>Description</th>
				<th>Available</th>
				<th>Manage</th>
			</tr>

			<c:forEach items="${items}" var="item">
				<tr>
					<td><a href="viewItemDetails?iid=${item.id}">${item.name}</a></td>
					<td>${item.supplier.name}</td>
					<td>${item.price}</td>
					<td>${item.description}</td>
					<td>${item.inventory}</td>
					<td><form action="requestSupplier" method="post">
							<input type="hidden" name="itemOrdered" value="${item.id}" /> <input
								type="number" name="itemQuantity" min="0" max="10000"
								value="${item.inventory}"> <input type="submit"
								value="Request">
						</form></td>
				<tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>