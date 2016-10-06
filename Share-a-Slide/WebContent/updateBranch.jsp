<%@page import="connectionProvider.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Branch Details</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	Connection con=null;
		try
		{	
			String bid=request.getParameter("bid");
			
			con=ConnectionProvider.getInstance().getConnection();
			String query="select * from branch where branchid='"+bid+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			if(rs.next())
			{
	%>
		<form name="registrationForm11" action="updateBranch.do" method="post" onsubmit="return checks1()">
		<div id="newBranch" class="showContentTable">
		<font size="4">
		
			<table>
				<tr><td><fieldset><legend><font color="red" size=5>Edit Branch Details</font></legend>
					<table height="200px" width="300px">
						<tr><td colspan=2><font color="red"><label id="l1"></label></font></td></tr>
						<tr><td>Company ID</td><td><input type="text" name="companyID" id="aa" editable="false" value="<%=rs.getString(1)%>"></td></tr>
						<tr><td>Company Name</td><td><input type="text" name="companyName" id="bb" value="<%=rs.getString(2)%>"></td></tr>
						<tr><td>Branch Name</td><td><input type="text" name="branchName" id="cc" value="<%=rs.getString(3)%>"></td></tr>
						<tr><td>Branch Location</td><td><input type="text" name="branchLocation" id="dd" value="<%=rs.getString(4)%>"></td></tr>
						<tr><td>Branch ID</td><td><input type="text" name="branchID" id="ee" editable="false"  value="<%=rs.getString(5)%>"></td></tr>
						<tr><td colspan="2" align="center"><input class="button" type="submit" name="addBranch" value="Submit"></td></tr>
					</table>
				</fieldset>
				</td>
				</tr>
			</table>
			
		</font>	
		</div>
		</form>
		<%
			}
			else
			{
		%>
			<h1>This ID is not available!!!<br>
				Please enter right ID
			</h1>
		<%		
			}
		}
		catch(Exception ex)
		{
			ex.getMessage();
		}
		finally
		{
			try
			{
				con.close();
			}
			catch(Exception e)
			{
				
			}
		}
		%>
</body>
</html>