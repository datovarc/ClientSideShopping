<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Details</title>
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
	<a href="shoppingCart">Shopping Cart: ${shoppingCartQuantity}</a>

	<c:choose>
		<c:when test="${delivery == false}">
			<div style="display: block">
				<form action="viewUserDetails" method="post">
					<label><input type="hidden" name="userEdited"
						value="${userdetailed.id}" /></label>
					<p>
						<label>User ID: <input type="number" name="userid"
							value="${userdetailed.id}" readonly /></label>
					</p>
					<p>
						<label>Name: <input type="text" name="name"
							value="${userdetailed.name}" /></label>
					</p>
					<p>
						<label>Username: <input type="text" name="userUsername"
							value="${userdetailed.username}" /></label>
					</p>
					<p>
						<label>Address: <input type="text" name="userAddress"
							value="${userdetailed.address}" /></label>
					</p>
					<p>
						<label>Phone: <input type="text" name="userPhone"
							value="${userdetailed.phone}" /></label>
					</p>
					<p>
						<label>Email: <input type="text" name="userEmail"
							value="${userdetailed.email}" /></label>
					</p>
					<p>
						<label>Role: <input type="text" name="userRole"
							value="${userdetailed.role}" readonly /></label>
					</p>
					<p>
						<label>Old Password: <input type="password" name="oldPass" /></label>
					</p>
					<p>
						<label>New Password: <input type="password" name="newPass" /></label>
					</p>
					<p>
						<label>Confirm New Password: <input type="password"
							name="confirmNewPass" /></label>
					</p>
					<input type="submit" value="Edit">
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div style="display: block">
				<form action="viewUserDetails" method="post">
					<label><input type="hidden" name="userEdited"
						value="${userdetailed.id}" /></label>
					<p>
						<label>User ID: <input type="number" name="userid"
							value="${userdetailed.id}" readonly /></label>
					</p>
					<p>
						<label>Name: <input type="text" name="name"
							value="${userdetailed.name}" readonly /></label>
					</p>
					<p>
						<label>Username: <input type="text" name="userUsername"
							value="${userdetailed.username}" readonly /></label>
					</p>
					<p>
						<label>Address: <input type="text" name="userAddress"
							value="${userdetailed.address}" readonly /></label>
					</p>
					<p>
						<label>Phone: <input type="text" name="userPhone"
							value="${userdetailed.phone}" readonly /></label>
					</p>
					<p>
						<label>Email: <input type="text" name="userEmail"
							value="${userdetailed.email}" readonly /></label>
					</p>
					<p>
						<label>Role: <input type="text" name="userRole"
							value="${userdetailed.role}" readonly /></label>
					</p>
					<input type="submit" value="Edit">
				</form>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>