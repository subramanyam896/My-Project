<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Followings</title>
<link rel="stylesheet" type="text/css" href="styels.css">
</head>
<style type="text/css">

</style>
<body>
			<%
			
			Object obj=session.getAttribute("username");
			Connection con=null;
			int check=0;
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
					String query="select * from registration where username in (select username from users where followingname='"+obj.toString()+"')";
					ResultSet rs=stmt.executeQuery(query);
					if(rs==null)
					{
			%>
			<jsp:include page="home.jsp"></jsp:include>
			<div class="userMsg">
		
			<h2>No following!!!!!<br>
				
			</h2>
			</div>		
			<%
					}
					else
					{
						
						
						
				
						
			%>
				<jsp:include page="home.jsp"></jsp:include>
				<div class="userMsg">
							
				<font size="4">
				
					<%
						int i=0;
						while(rs.next())
						{
							check=1;
							String name="";
							String fname=rs.getString(1),mname=rs.getString(2),lname=rs.getString(3);
							String email=rs.getString(6);
							 
							String firstname="";
							 if(fname==null)	fname="";
								else if(fname.length()>0)
								{
									firstname=fname.substring(0,1);
									fname=firstname+fname.substring(1).toLowerCase();
								}
								if(mname==null)	mname="";
								else if(mname.length()>0)
								{
									firstname=mname.substring(0,1);
									mname=firstname+mname.substring(1).toLowerCase();
							
								}
								if(lname==null)	lname="";
								else if(lname.length()>0)
								{
									firstname=lname.substring(0,1);
									lname=firstname+lname.substring(1).toLowerCase();
								}
							name=fname+" "+mname+" "+lname;
						
					%>
					<table border=1>
					<tr>
					<td>
						<table>
							<tr>
								
								<td width=200px><%= name%></td>
								<td width=250px><%=email %></td>
								<td width=50px><a href="#">Following</a></td>
							</tr>
						</table>
					</td>
				</tr>
				</table>
				<br>
				<%
						i++;
						if(i==10)
						{
							break;
						}
						}
				%>
				
				</font>
				</div>
				<%
					}
					if(check==0)
					{
			%>
						<div class="userMsg">
					
						<h2>No following!!!!!<br>
							
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
					con.close();
				}
			}
			%>
		
</body>
</html>