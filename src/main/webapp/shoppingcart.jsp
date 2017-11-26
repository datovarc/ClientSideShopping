<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shopping Cart</title>

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

		<h2>Num. Of Items: ${shoppingCartQuantity}</h2>
		<table style="width: 100%">
			<tr>
				<th>Name</th>
				<th>ID</th>
				<th>Brand</th>
				<th>Quantity</th>
				<th>Price</th>
				<th></th>
			</tr>
			<c:forEach items="${tempitems}" var="item">
				<tr>
					<td><a href="viewItemDetails?iid=${item.id}">${item.name}</a></td>
					<td>${item.id}</td>
					<td>${item.supplier.name}</td>
					<td>${shoppingCart[item]}</td>
					<td>${item.price}</td>
					<td><form action="shoppingCart" method="get">
							<input type="hidden" name="itemRemoved" value="${item.id}" /> <input
								type="submit" value="Remove">
						</form></td>
			</c:forEach>
		</table>
		<h2>Total: ${total}</h2>
		<form action="purchaseItem" method="post">
			<input type="hidden" name="totalPaid" value="${total}" /> <input
				type="submit" value="Checkout">
		</form>
	</div>
</body>
</html>