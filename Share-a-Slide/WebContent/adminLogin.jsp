<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" href="styles.css" type="text/css"></link>
</head>
<script>
function checkAdmin()
{
		var user="",pass="";
		user=document.getElementById("user").value;
		pass=document.getElementById("pass").value;
		if(user==""||user==null||pas==null||pas=="")
			{
			document.getElementById("label").innerHTML="*Enter username/password";
			return;
			}
		else
			document.getElementById("label").innerHTML="";
}
</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="login">
		    <form name="frm1" onsubmit="return checkAdmin()" action="adminLogin.do" method="post">
				<font size="4">
				<table align="right">
				<tr>
					<td>
						<fieldset>
							<legend><font color="red" size="5">Admin Login</font></legend>
								<table height="140px" width="280px">
									<tr>
									<td colspan="2"><font color="red"><label id="label"></label></font></td>
									</tr>
									<tr>
									<td>Username</td>
									<td><input type="text" name="username" id="user"></td>
									</tr>
									<tr>
									<td>Password</td><td><input type="password" name="pass" id="pass"></td>
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
</body>
</html>