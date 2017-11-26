<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delivery</title>
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
		<a href="shoppingCart">Shopping Cart: ${shoppingCartQuantity}</a> <br>
		<br> <br>
		<table style="width: 100%">
			<tr>
				<th>Order ID</th>
				<th>Order Date</th>
				<th>Address</th>
				<th>Delivery Date</th>
				<th>User ID</th>
				<th>Item ID</th>
				<th>Quantity</th>
				<th>Total</th>
				<th>Status</th>
			</tr>
			<c:forEach items="${orders}" var="order">
				<tr>
					<td>${order.id}</td>
					<td>${order.placementDate}</td>
					<td>${order.address}</td>
					<td>${order.deliveryDate}</td>
					<td><a href="viewUserDetails?uid=${order.userId}">${order.userId}</a></td>
					<td><a href="viewItemDetails?iid=${order.itemId}">${order.itemId}</a></td>
					<td>${order.quantity}</td>
					<td>${order.price}</td>
					<td><form style="display: inline-block" action="delivery"
							method="post" id="statusForm${order.id}">
							<input type="hidden" name="orderEdited" value="${order.id}" /> <select
								name="orderStatus" form="statusForm${order.id}">
								<c:if test="${order.status == 'Pending'}">
									<option selected value="Pending">Pending</option>
									<option value="In Progress">In Progress</option>
									<option value="Delivered">Delivered</option>
								</c:if>
								<c:if test="${order.status == 'In Progress'}">
									<option value="Pending">Pending</option>
									<option selected value="In Progress">In Progress</option>
									<option value="Delivered">Delivered</option>
								</c:if>
								<c:if test="${order.status == 'Delivered'}">
									<option value="Pending">Pending</option>
									<option value="In Progress">In Progress</option>
									<option selected value="Delivered">Delivered</option>
								</c:if>
							</select> <input type="submit" value="Update">
						</form></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>