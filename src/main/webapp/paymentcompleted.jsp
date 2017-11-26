<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Completed</title>
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
	<p>Payment of ${payment} completed.</p>
	<form action="index" method="get">
		<input type="submit" value="Go Home">
	</form>
</body>
</html>