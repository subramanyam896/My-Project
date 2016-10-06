<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Invalid User</title>
<link rel="stylesheet" type="text/css" href="styles.css"></link>
</head>
<style type="text/css">
	
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="userMsg">
		<center><h1>Sorry,This Username/Password is not correct!!!!!<br>
		Try Again....</h1><br>
		<h2>
		<a href="index.jsp">Login Again....</a><br><br>
		<a href="index.jsp">Go to Home...</a>
		</h2></center>
	</div>
</body>
</html>