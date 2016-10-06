<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Page</title>
<link rel="stylesheet" type="text/css" href="styles.css">

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
	function adminAction(id)
	{
		if(id=="newCompany")
			{
			document.getElementById(id).style.visibility="visible";
			document.getElementById("newBranch").style.visibility="hidden";
			document.getElementById("editCompany").style.visibility="hidden";
			document.getElementById("editBranch").style.visibility="hidden";
			}
		else if(id=="newBranch")
			{
			document.getElementById(id).style.visibility="visible";
			document.getElementById("newCompany").style.visibility="hidden";
			document.getElementById("editCompany").style.visibility="hidden";
			document.getElementById("editBranch").style.visibility="hidden";
			}
		else if(id=="editCompany")
		{
			document.getElementById(id).style.visibility="visible";
			document.getElementById("newBranch").style.visibility="hidden";
			document.getElementById("newCompany").style.visibility="hidden";
			document.getElementById("editBranch").style.visibility="hidden";
		}
		else if(id=="editBranch")
		{
			document.getElementById(id).style.visibility="visible";
			document.getElementById("newBranch").style.visibility="hidden";
			document.getElementById("newCompany").style.visibility="hidden";
			document.getElementById("editCompany").style.visibility="hidden";
		}
		
	}
	function hidden2()
	{
		document.getElementById("newCompany").style.visibility="hidden";
		document.getElementById("newBranch").style.visibility="hidden";
		
		document.getElementById("editCompany").style.visibility="hidden";
		document.getElementById("editBranch").style.visibility="hidden";
	}
	function checks()
	{
		var a="",b="",c="";
		a=document.forms["registrationForm1"]["companyID"].value;;
		b=document.forms["registrationForm1"]["companyName"].value;;
		c=document.forms["registrationForm1"]["companyLocation"].value;;
		if(a==null||a==""||b==null||b==""||c==null||c=="")
			{
			document.getElementById("l").innerHTML="*Enter values in all fields";
			return false;
			}
		else
			{
			document.getElementById("l").innerHTML="";
			}
	}
	function checks1()
	{
		var aa="",bb="",cc="",dd="",ee="";
		aa=document.forms["registrationForm11"]["companyID"].value;
		bb=document.forms["registrationForm11"]["companyName"].value;
		cc=document.forms["registrationForm11"]["branchName"].value;
		dd=document.forms["registrationForm11"]["branchLocation"].value;
		ee=document.forms["registrationForm11"]["branchID"].value;
		if(aa==null||aa==""||bb==null||bb==""||cc==null||cc==""||dd==null||dd==""||ee==null||ee=="")
			{
			document.getElementById("l1").innerHTML="*Enter values in all fields";
			return false;
			}
		else
			{
			document.getElementById("l1").innerHTML="";
			}
	}
	
</script>
</head>
<body onload="hidden2()">
	<jsp:include page="header.jsp"></jsp:include><br>
	<%
		Object obj=session.getAttribute("username");
		
		if(obj==null || obj=="")
		{
				response.sendRedirect("admiLogin.jsp");		
		}
		else
		{
	%>
		
			<div class="pictureTop">
				<div class="navigation">
					<ul>
						<li>
							<font color="green" size="4">User Name</font>&nbsp;&nbsp;
							<img src="images/icon_dropdown_hover.png" alt="arrow image" height="15px" width="15px"></img>
							<ul>
								<li></li><br>
									<div class="accountTable">
									<table height="150px" width="200px" background="images/accountPanel1.jpg">
										<tr>
											<td colspan="3"><font color="black">ADMIN</font><br>
															<font color="gray"> E-mail ID</font><br><br>
															<a href="#">Edit Profile</a>
											</td>
										</tr>
										<tr></tr>
										<tr></tr>
										<tr></tr>
										<tr>
											<td colspan="2" align="center"><form action="logout.jsp"><input class="button" type="submit" value="Logout"/></form></td>
										</tr>
									</table>
						</div>
				</ul>
				</li>
				
				</ul>
			</div>
			</div>
	
		<table height=450px width=250px background="images/gray.jpg">
		<tr><td>	
		<div class="userpicture">
		<center><a id="text" href="#"><img src="images/defaultUserImage.png" alt="user pic" height="90px" width="80px"></img></a></center></div><br><br>
			<div class="content">
			<br>
			<a href="#"><center>ADMIN</center><hr></a>
			<a href="#" onclick="adminAction('newCompany')">Add New Company Details<hr></a>
			<a href="#" onclick="adminAction('editCompany')">Edit Existing Company Details<hr></a>
			<a href="#" onclick="adminAction('newBranch')">Add New Branch Details<hr></a>
			<a href="#" onclick="adminAction('editBranch')">Edit Existing Branch Details<hr></a>
			
			<a href="logout.jsp">Logout<hr></a>
			</div>
		</td></tr>
		</table>
		<form name="registrationForm1" action="company.do" method="post" onsubmit="return checks()"> 
		<div id="newCompany" class="showContentTable">
		<font size="4">
		
			<table>
				<tr><td><fieldset><legend><font color="red" size=5>Add New Company Details</font></legend>
					<table height="200px" width="300px">
						<tr><td colspan=2><font color="red"><label id="l"></label></font></td></tr>
						<tr><td>Company ID</td><td><input type="text" name="companyID" id="a"></td></tr>
						<tr><td>Company Name</td><td><input type="text" name="companyName" id="b"></td></tr>
						<tr><td>Company Location</td><td><input type="text" name="companyLocation" id="c"></td></tr>
						
						<tr><td colspan="2" align="center"><input class="button" type="submit" name="addCompany" value="Submit"></td></tr>
					</table>
				</fieldset>
				</td>
				</tr>
			</table>
		
		</font>	
		</div>
		</form>
		<form name="registrationForm11" action="branch.do" method="post" onsubmit="return checks1()">
		<div id="newBranch" class="showContentTable">
		<font size="4">
		
			<table>
				<tr><td><fieldset><legend><font color="red" size=5>Add New Branch Details</font></legend>
					<table height="200px" width="300px">
						<tr><td colspan=2><font color="red"><label id="l1"></label></font></td></tr>
						<tr><td>Company ID</td><td><input type="text" name="companyID" id="aa"></td></tr>
						<tr><td>Company Name</td><td><input type="text" name="companyName" id="bb"></td></tr>
						<tr><td>Branch Name</td><td><input type="text" name="branchName" id="cc"></td></tr>
						<tr><td>Branch Location</td><td><input type="text" name="branchLocation" id="dd"></td></tr>
						<tr><td>Branch ID</td><td><input type="text" name="branchID" id="ee"></td></tr>
						<tr><td colspan="2" align="center"><input class="button" type="submit" name="addBranch" value="Submit"></td></tr>
					</table>
				</fieldset>
				</td>
				</tr>
			</table>
			
		</font>	
		</div>
		</form>
		<font size="4">
		<div id="editCompany" class="showContentTable">
		<form action="updateCompany.jsp" method="post">
		<table>
		<tr><td>Enter Company ID</td><td><input type="text" name="cid"></td></tr>
		<tr><td colspan=2 align="center"><input class="button" type="submit" value="submit" onclick="showC()"></td></tr>
		</table>
		</form>	
		</div>
		</font>
		<font size="4">
		<div id="editBranch" class="showContentTable">
		<form action="updateBranch.jsp" method="post">
		<table>
		<tr><td>Enter Branch ID</td><td><input type="text" name="bid"></td></tr>
		<tr><td colspan=2 align="center"><input class="button" type="submit" value="submit" onclick=""></td></tr>
		</table>
		</form>	
		</div>
		</font>
		<%} %>
</body>
</html>		