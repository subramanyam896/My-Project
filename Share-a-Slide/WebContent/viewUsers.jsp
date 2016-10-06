<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Users</title>
<link rel="stylesheet" type="text/css" href="styels.css">
</head>
<body>
		<%
		Object obj=session.getAttribute("username");
		Connection con=null;
		if(obj==null)
		{
			response.sendRedirect("invalidUser.jsp");
			return;
		}
		else
		{
			
		
		%>
		<jsp:include page="home.jsp"></jsp:include>
		<div class="showContentTable">
		
		<font size="4">		
		<form action="searchUsers.jsp" method="get">
				<table>
					<tr>
						<td colspan="2" align="center">
							<table cellpadding="2px" cellspacing="5px">
							<tr>
								<td>Enter User Name</td>
								<td><input class="searchTextBox" type="text" name="searchName"></td>
								<td><input class="button" type="submit" name="a" value="Search"></td>
								<td><input class="button" type="submit" name="a" value="View All"></td>
							</tr>
							</table>
						</td>
					</tr>
				</table>
				</form>
				</font>
				
		</div>
		<%} %>					
</body>
</html>