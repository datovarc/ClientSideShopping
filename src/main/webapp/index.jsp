<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
<script src="js/onsubmit_event.js"></script>
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
		<c:choose>
			<c:when test="${empty role}">
				<form method="post" action="validateuser">
					<label>Username</label><input type="text" name="username"
						required="required"> <label>Password</label><input
						type="password" name="password" required="required"> <input
						type="submit" value="Login">
				</form>
				<a class="navOption" href="registeruser">Register</a>

			</c:when>
			<c:otherwise>
				<a href="viewUserDetails">${username}</a>
				<a href="logout">Log out</a>
				<a href="shoppingCart">Shopping Cart: ${shoppingCartQuantity}</a>
			</c:otherwise>
		</c:choose>
		<table style="width: 100%">
			<tr>
				<th>Item Name</th>
				<th>Item ID</th>
				<th>Brand</th>
				<th>Available</th>
				<th>Price</th>
				<c:if test="${fn:containsIgnoreCase(role,'c')}">
					<th></th>
				</c:if>
			</tr>
			<c:forEach items="${items}" var="item">
				<tr>
					<td><a href="viewItemDetails?iid=${item.id}">${item.name}</a></td>
					<td>${item.id}</td>
					<td>${item.supplier.name}</td>
					<td>${item.inventory}</td>
					<td>${item.price}</td>
					<c:if
						test="${fn:containsIgnoreCase(role,'c') && item.inventory > 0}">
						<td><form action="index" method="get">
								<input type="hidden" name="itemAdded" value="${item.id}" /> <input
									type="submit" value="Add to shopping cart">
							</form></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>