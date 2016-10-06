<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Share-a-Slide Presentation Hub</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<style type="text/css">
</style>
<script type="text/javascript">
		function check()
		{
			var user=document.forms["frm1"]["username"].value;
			var pass=document.forms["frm1"]["pass"].value;
			
			if(user==null || user=="")
			{		document.getElementById("label1").innerHTML="* Enter username/password";
				
					return false;
			}
			else if(pass==null || pass=="")
			{	
				document.getElementById("label1").innerHTML="* Enter username/password";
				return false;
			}
			else
				document.getElementById("label1").innerHTML="";
		}
		function hidden1()
		{
			document.getElementById("labelText").style.visibility="hidden";
		}
		i=1;
		setInterval("repeatImage()",3000);
		function repeatImage()
		{
			document.getElementById("img1").src="images/"+i+".jpg";
			i++;
			if(i>5)
				{
					i=1;
				}
		}
</script>
<body >
		<%
		Object obj=session.getAttribute("username");
		if(obj==null)
		{
			
		
			
	%>
		<div class="container"></div>
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="signuptext"><a id="text" href="registration.jsp"><font size="5" color="green">Sign up</font></a></div>
		<table  height="750px" width="1250px">
		<tr><td>
			<div class="login">
		    <form name="frm1" onsubmit="return check()" action="login.do" method="post">
				<font size="4">
				<table align="right" >
				<tr>
					<td>
						<fieldset>
							<legend><font color="red" size="5">Login</font></legend>
								<table height="140px" width="280px">
									<tr>
									<td colspan="2"><font color="red"><label id="label1"></label></font></td>
									</tr>
									<tr>
									<td>Username</td>
									<td><input type="text" name="username"></td>
									</tr>
									<tr>
									<td>Password</td><td><input type="password" name="pass"></td>
									</tr>
									<tr>
										<td colspan="2"><center><input type="submit" value="Login" name="login" class="button"></center></td>
									</tr>
									<tr>
										<td colspan="2">&nbsp;&nbsp;&nbsp;Create New Account?&nbsp;&nbsp; <a href="registration.jsp">Register</a></td>
									</tr>
									
								</table>
						</fieldset>
					</td>
				</tr>
				</table>
				</font>
			</form>
			
		</div>
		</td></tr>
		</table>
	

	
	<%
		}
		else
		{
			String fname="",mname="";
			try
			{
			Connection con=connectionProvider.ConnectionProvider.getInstance().getConnection();
			Statement stmt=con.createStatement();
			String query="select * from registration where username='"+obj.toString()+"'";
			ResultSet rs=stmt.executeQuery(query);
			if(!rs.next())
			{	
				response.sendRedirect("failure.jsp");
				fname="Sign up";
			}	
			else
			{
			 fname=rs.getString(1);
			 mname=rs.getString(2);
			 String firstname="";
			 if(fname==null)	fname="";
				else
				{
					firstname=fname.substring(0,1);
					fname=firstname+fname.substring(1).toLowerCase();
				}
				if(mname==null)	mname="";
				else
				{
					firstname=mname.substring(0,1);
					mname=firstname+mname.substring(1).toLowerCase();
			
				}
			}	
			
		
	%>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
	
	<div class="signuptext">
		<a id="text" href="home.jsp"><font size="5" color="green"><%=fname+" "+mname %></font></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="text" href="logout.jsp">Logout</a>
		</div>
			<div class="login">
		    <form name="frm1" onsubmit="return check()" action="login.do" method="post">
				<font size="4">
				<table align="right">
				<tr>
					<td>
						<fieldset>
							<legend><font color="red" size="5">Login</font></legend>
								<table height="140px" width="280px">
									<tr>
									<td colspan="2"><font color="red"><label id="label1"></label></font></td>
									</tr>
									<tr>
									<td>Username</td>
									<td><input type="text" name="username"></td>
									</tr>
									<tr>
									<td>Password</td><td><input type="password" name="pass"></td>
									</tr>
									<tr>
										<td colspan="2"><center><input type="submit" value="Login" name="login" class="button"></center></td>
									</tr>
									<tr>
										<td colspan="2">&nbsp;&nbsp;&nbsp;Create New Account?&nbsp;&nbsp; <a href="registration.jsp">Register</a></td>
									</tr>
									
								</table>
						</fieldset>
					</td>
				</tr>
				</table>
				</font>
			</form>
			
		</div>
		
	</div>	
	<%
			}
			catch(Exception ex)
			{
				
			}
		}
	%>
<div class="indexImage"><img src="images/1.jpg" id="img1" height="400" width="500"/></div>
</body>
</html>