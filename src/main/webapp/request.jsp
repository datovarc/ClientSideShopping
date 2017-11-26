<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request Supplies</title>
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
	<p>Confirm request of:</p>
	<table style="width: 100%">
		<tr>
			<th>Item Name</th>
			<th>Item ID</th>
			<th>Brand</th>
			<th>Quantity</th>
			<th>Cost</th>
		</tr>
		<tr>
			<td><a href="viewItemDetails?iid=${item.id}">${item.name}</a></td>
			<td>${item.id}</td>
			<td>${item.supplier.name}</td>
			<td>${itemQuantity}</td>
			<td>${item.cost}</td>
		</tr>
	</table>
	<br>
	<h2>Total: ${totalCost}</h2>
	<br>
	<form action="logistics" method="post">
		<input type="hidden" name="itemOrdered" value="${item.id}" /> <input
			type="hidden" name="itemQuantity" value="${itemQuantity}" /> <input
			type="submit" value="Confirm">
	</form>
</body>
</html>