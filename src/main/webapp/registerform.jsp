<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
	<form method="post" action="registeruser">
		<label>Name: </label><input type="text" name="regName"
			required="required"> <label>Username: </label><input
			type="text" name="regUsername" required="required"> <label>Email:
		</label><input type="email" name="regEmail" required="required"> <label>Address:
		</label><input type="text" name="regAddress" required="required"> <label>Phone:
		</label><input type="number" name="regPhone" required="required"> <label>Password:
		</label><input type="password" name="regPassword" required="required">
		<label>Confirm Password: </label><input type="password"
			name="regConfirmPassword" required="required"> <input
			type="submit" value="Register">
	</form>
</body>
</html>