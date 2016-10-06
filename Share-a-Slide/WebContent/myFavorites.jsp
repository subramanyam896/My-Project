<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Favorites</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<script type="text/javascript" src="javaScriptFile.js">
</script>
<body>
		
			<%
			
			Object obj=session.getAttribute("username");
			Connection con=null;
			int prid=0;
			if(obj==null)
			{
				response.sendRedirect("invalidUser.jsp");
				return;
			}
			else
			{
				try
				{
					con=connectionProvider.ConnectionProvider.getInstance().getConnection();
					Statement stmt=con.createStatement();
					String query="select * from presentation where pr_id in (select pr_id from favorite where myfavorites='"+obj.toString()+"')";
					ResultSet rs=stmt.executeQuery(query);
					if(!rs.next())
					{
			%>
			<jsp:include page="home.jsp"></jsp:include>
			<div class="userMsg">
			<h2>Sorry, You did not make a single Presentation as favorite<br>
				
			</h2>		
			</div>
			<%
					}
					else
					{
						prid=rs.getInt("pr_id");
						
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
						<td></td>
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
						<td><a href="#">Favorite</a></td>
						<td><a href="fileDownload.jsp?id=<%=prid%>">Download</a></td>
					</tr>
			<%
						int i=0;
						while(rs.next())
						{
							prid=rs.getInt("pr_id");
			%>
						
						<tr>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(5) %></td>
							<td><%=rs.getString(6) %></td>
							<td><%=rs.getString(7) %></td>
							<td><a href="#">Favorite</a></td>							
							<td><a href="fileDownload.jsp?id=<%=prid%>">Download</a></td>
						</tr>
			<%
						i++;
						if(i==10)
						{
							break;
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
					con.close();
				}
			}
			%>
		
</body>
</html>