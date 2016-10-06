<%@page import="connectionProvider.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Share-a-Slide</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style type="text/css">
	.navigation
{
		
}
.navigation ul
{
	width:180px;
}
.navigation ul li
{
	
	list-style:none;
}
.navigation ul li ul
{
	
	height:70px;
	width:90px;
	color:blue;
	font:normal medium;
	display:none;
}
.navigation ul li ul li
{
	float:left;
}
.navigation ul a
{
	text-decoration:none;
}
.navigation ul li:hover > ul
{
	display:block;
}
.accountTable
{
	position:absolute;
	top:50px;
	left:0px;
	
}
</style>
<script type="text/javascript">
	
</script>
<body>
	<jsp:include page="header.jsp"></jsp:include><br>
	<%
		Object obj=session.getAttribute("username");

		Connection con=null;
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
			Statement stmt=con.createStatement();

			String query="select * from registration where username='"+obj.toString()+"'";
			ResultSet rs=stmt.executeQuery(query);

			if(!rs.next())
				response.sendRedirect("failure.jsp");
			else
			{
			String fname=rs.getString(1);
			String mname=rs.getString(2);

			String lname=rs.getString(3);

			String email=rs.getString(6);

			String firstname="";
			if(fname==null || fname=="")	fname="";
			else if(fname.length()>0)
			{
				firstname=fname.substring(0,1);
				fname=firstname+fname.substring(1).toLowerCase();
			}

			if(mname==null || fname=="")	mname="";
			else if(mname.length()>0)
			{
				firstname=mname.substring(0,1);
				mname=firstname+mname.substring(1).toLowerCase();
		
			}

			if(lname==null || fname=="")	lname="";
			else if(lname.length()>0)
			{
				firstname=lname.substring(0,1);
				lname=firstname+lname.substring(1).toLowerCase();
			}

			if(email==null || email=="")	email="";

			
			
	%>
	
			<div class="pictureTop">
				<div class="navigation">
					<ul>
						<li>
							<font color="green" size="4"><%=fname+" "+mname %></font>&nbsp;&nbsp;
							<img src="images/icon_dropdown_hover.png" alt="arrow image" height="15px" width="15px"></img>
							<ul>
								<li></li><br>
									<div class="accountTable">
									
									<table height="150px" width="200px" background="images/accountTable1.jpg">
										<tr>
											<td colspan="3"><font color="black"><%=fname+" "+mname+" "+lname %></font><br>
															<font color="gray"><%=email %></font><br><br>
															<a href="userProfile.jsp">Edit Profile</a>
											</td>
										</tr>
										<tr></tr>
										<tr></tr>
										<tr></tr>
										<tr>
										
											<td colspan="2" align="center">
												<form action="logout.jsp" method="post">
													<input class="button" type="submit" value="Logout">
												</form>
											</td>
										</tr>
									</table>
									
						</div>
				</ul>
				</li>
				
				</ul>
			</div>
			</div>
	
		<table height=480px width=200px background="images/gray.jpg">
		<tr><td>	
		<div class="userpicture">
		<a id="text" href="#"><img src="images/defaultUserImage.png" alt="user pic" height="90px" width="80px"></img></a></div><br><br>
			<div class="content">
			<br>
			<center><a href="userProfile.jsp"><%=fname+" "+mname+" "+lname%></a></center><hr>
			<a href="sharePresentation.jsp">Share Presentation<hr></a>
			<a href="myPresentations.jsp">My Presentations<hr></a>
			<a href="myFavorites.jsp">My Favorites<hr></a>
			<a href="myFollowers.jsp">My Followers<hr></a>
			<a href="myFollowing.jsp">My Following<hr></a>
			<a href="viewUsers.jsp">View Users<hr></a>
			<a href="logout.jsp">Logout<hr></a>
			</div>
		</td></tr>
		</table>
			
		<%
			}
			}
			catch(Exception ex)
			{
			}
			finally
			{
				con.close();
			}
		}
		%>
</body>
</html>