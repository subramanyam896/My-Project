<%@page import="connectionProvider.ConnectionProvider,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Company Details</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	Connection con=null;
		try
		{	
			String cid=request.getParameter("cid");
			
			con=ConnectionProvider.getInstance().getConnection();
			String query="select * from company where companyid='"+cid+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			if(rs.next())
			{
	%>
		<form name="registrationForm1" action="updateCompany.do" method="post" onsubmit="return checks()"> 
		<div id="newCompany" class="showContentTable">
		<font size="4">
		
			<table>
				<tr><td><fieldset><legend><font color="red" size=5>Edit Company Details</font></legend>
					<table height="200px" width="300px">
						<tr><td colspan=2><font color="red"><label id="l"></label></font></td></tr>
						<tr><td>Company ID</td><td><input type="text" name="ID" id="a" value="<%=rs.getString(1)%>" editable="false"></td></tr>
						<tr><td>Company Name</td><td><input type="text" name="Name" id="b"  value="<%=rs.getString(2)%>"></td></tr>
						<tr><td>Company Location</td><td><input type="text" name="Location" id="c"  value="<%=rs.getString(3)%>"></td></tr>
						
						<tr><td colspan="2" align="center"><input class="button" type="submit" name="addCompany" value="Submit"></td></tr>
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