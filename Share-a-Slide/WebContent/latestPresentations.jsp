
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Latest Presentations</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<script type="text/javascript" src="javaScriptFile.js">
</script>
<body>
	
	
			<%
			try{
			Object obj=session.getAttribute("username");
			Connection con=null;
			Statement stmt=null,stmt1=null;
			String query=null,favorite="Make Favorite";
			String prid="";
			ResultSet rs=null,rs1=null;
			int check=0;
			if(obj==null || obj=="")
			{
				response.sendRedirect("loginMessage.jsp");
				
				return;
			}
			else
			{
				try
				{
					int i;
					
					con=connectionProvider.ConnectionProvider.getInstance().getConnection();
					stmt=con.createStatement();
				    query="select * from presentation order by latest desc";
					
					rs=stmt.executeQuery(query);
					if(rs==null)
					{
			%>
			<jsp:include page="home.jsp"></jsp:include>
			<div class="userMsg">
			<h2>Sorry,No data found!!!<br>
				Try again later
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
				<h2 class="tableColor">Top 10 Latest Presentations:</h2>
				<table border="1">
					
					
					<thead>
					<tr class="tableColor">
						<td width="80px">Topic</td>
						<td width="60px">Type</td>
						<td width="100px">Purpose</td>
						<td width="150px">Description</td>
						<td width="50px">Development Time</td>
						<td width="80px">Presented To</td>
						<td>Date</td>
						<td></td>
						<td></td>
						</tr>
					</thead>
					
					
					
			<%
						i=0;
						{
						while(rs.next())
						{
							check=1;
							prid=rs.getLong("pr_id")+"";
							favorite="Make Favorite";
							query="select * from favorite where myfavorites='"+obj.toString()+"' and pr_id="+rs.getString("pr_id");
							stmt1=con.createStatement();
							rs1=stmt1.executeQuery(query);
							if(rs1.next())
							{
								//System.out.println("if2");
								favorite="Favorite";
								rs1.close();
							}
							else
							{
								//System.out.println("else2");
								rs1.close();
							}
			%>
						
						<tr>
							<td><%=rs.getString(2) %></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4) %></td>
							<td><%=rs.getString(5) %></td>
							<td><%=rs.getString(6) %></td>
							<td><%=rs.getString(7) %></td>
							<td><%=rs.getString("latest") %></td>
							<%
								if(favorite.equalsIgnoreCase("Make Favorite"))
								{
							%>
							<td><a href="#" onclick="showFavorite('<%=prid %>')" id="<%=prid%>"><%=favorite %></a></td>
							<%	}
								else
								{
								
							%>
							<td><a href="#"><%=favorite %></a></td>
							<%
								}
							%>
							<td><a href="fileDownload.jsp?id=<%=prid%>">Download</a></td>
						</tr>
			<%
						i++;
						if(i==10)
						{
							break;
						}
						}
						}
			%>
				
				</table>
				</font>
				</div>
			<%
					}
					if(check==0)
					{
			%>
						<div class="userMsg">
						<h2>Sorry,No data found!!!<br>
							Try again later
						</h2>
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
					
				}
			}
			}
			catch(Exception e)
			{
				out.println("Sorry,Some problem is occured!!!!");
			}
			%>
		
</body>
</html>