<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Followers</title>
<link rel="stylesheet" type="text/css" href="styels.css">
</head>
<style type="text/css">

</style>
<body>
			<%
			
			Object obj=session.getAttribute("username");
			int check=0;
			Connection con=null;
			Statement stmt=null,stmt1=null;
			ResultSet rs=null,rs1=null;
			if(obj==null)
			{
				response.sendRedirect("loginMessage.jsp");
				return;
			}
			else
			{
				try
				{
					 con=connectionProvider.ConnectionProvider.getInstance().getConnection();
					stmt=con.createStatement();
					String query="select * from registration where username in (select followingname from users where username='"+obj.toString()+"')";
					rs=stmt.executeQuery(query);
					if(rs==null)
					{
			%>
			<jsp:include page="home.jsp"></jsp:include>
			<div class="userMsg">
		
			<h2>Sorry, No followers for you<br>
				
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
								<td width=50px><a href="#">Follower</a></td>
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
					
						<h2>No followers for you<br>
							
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