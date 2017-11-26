<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Details</title>
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
	<a href="viewUserDetails">${username}</a>
	<a href="logout">Log out</a>
	<a href="shoppingCart">Shopping Cart: ${shoppingcart}</a>



	<h2>Order ID:</h2>
	${order.id}
	<h2>Ordered Date:</h2>
	${order.placementDate}
	<h2>Delivery Date:</h2>
	${order.deliveryDate}
	<h2>User ID:</h2>
	${order.user_id}
	<h2>Username:</h2>
	<a href="viewUserDetails?uid=${order.user_id}">${user.username}</a>
	<h2>Item ID:</h2>
	${order.item_id}
	<h2>Item Name:</h2>
	<a href="viewItemDetails?iid=${order.item_id}">${item.name}</a>
	<h2>Num. Items:</h2>
	${order.quantity}
	<h2>Total:</h2>
	${order.price}
	<h2>Status:</h2>
	${order.status}

</body>
</html>