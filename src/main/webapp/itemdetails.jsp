<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item Details</title>
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
	<c:if test="${fn:containsIgnoreCase(role,'d')}">
		<a href="viewUserDetails">${username}</a>
		<a href="logout">Log out</a>
		<a href="shoppingCart">Shopping Cart: ${shoppingCartQuantity}</a>
	</c:if>

	<h2>Item ID:</h2>
	${item.id}
	<h2>Name:</h2>
	${item.name}
	<h2>Description:</h2>
	${item.description}
	<h2>Sale Price:</h2>
	${item.price}
	<h2>Inventory:</h2>
	${item.inventory}
	<h2>Supplier Name:</h2>
	${item.supplier.name}
	<c:if test="${fn:containsIgnoreCase(role,'l')}">
		<h2>Supplier Cost:</h2> ${item.cost}
</c:if>

</body>
</html>