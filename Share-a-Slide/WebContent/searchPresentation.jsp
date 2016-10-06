<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Presentations</title>
<link rel="stylesheet" type="text/css" href="styels.css">
</head>
<body>
		<%
			Object obj=session.getAttribute("username");
			Connection con=null;
			
			String search=request.getParameter("searchPresentation");
					
			String name="";
			String query=null;
			if(obj==null)
			{
				
				response.sendRedirect("invalidUser.jsp");
				return;
			}
			else
			{
			
				try
				{
					String sname="";
					int len=search.length();
					if(len<3)
					{
						sname=search.toUpperCase();
					}
					else
					{
						sname=((search.substring(0,2)).toUpperCase());
					}
					if(len<1)
					{
						
					}
					else
					{
						query="select * from presentation where pr_topic like '"+sname+"%'";
					}
					con=connectionProvider.ConnectionProvider.getInstance().getConnection();
					Statement stmt=con.createStatement();
					
					
					ResultSet rs=stmt.executeQuery(query);
					if(!rs.next())
					{
			%>
			<jsp:include page="home.jsp"></jsp:include>
			<div class="userMsg">
			<h2>No Match found!!!<br>
			</h2>
			</div>		
			<%
					}
					else
					{
						
			%>
			<jsp:include page="home.jsp"></jsp:include>
			<div class="userMsg">
				<font size="3">
				
				<table border="1">
					
					
					<thead>
					<tr class="tableColor">
						<td width="80px">Topic</td>
						<td width="60px">Type</td>
						<td width="100px">Purpose</td>
						<td width="150px">Description</td>
						<td width="50px">Development Time</td>
						<td width="80px">Presented To</td>
						<td width="100px">Tags</td>
						<td width="100px">File</td>
						<td></td>
						</tr>
					</thead>
					
					
					
					<tr>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7) %></td>
						<td><%=rs.getString(8) %></td>
						<td><%=rs.getString(10) %></td>
						<td><a href="#">Download</a></td>
					</tr>
			<%
						for(int i=1;i<=10;i++)
						{
						while(rs.next())
						{
			%>
						
						<tr>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(5) %></td>
							<td><%=rs.getString(6) %></td>
							<td><%=rs.getString(7) %></td>
							<td><%=rs.getString(8) %></td>
							<td><%=rs.getString(10) %></td>
							<td><a href="#">Download</a></td>
						</tr>
			<%
						}
						}
			%>
				
				</table>
				</font>
				</div>
			<%
					}
				}
				catch(Exception ex)
				{
					ex.getStackTrace();
				}
				finally
				{
					try
					{
					con.close();
					}
					catch(SQLException exx)
					{
						exx.getMessage();
					}
				}
			}


			%>
		
</body>
</html>