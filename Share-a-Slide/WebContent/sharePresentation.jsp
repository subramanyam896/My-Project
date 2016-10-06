<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Share Presentation</title>
</head>
<script type="text/javascript">
function checkShare()
{
	var topic="",type="",pur="",desc="",develop="",present="",tag="",f="";
	topic=document.forms["regForm"]["topic"].value;
	type=document.forms["regForm"]["type"].value;
	pur=document.forms["regForm"]["purpose"].value;
	develop=document.forms["regForm"]["developmentTime"].value;
	present=document.forms["regForm"]["presentedTo"].value;
	//tag=document.forms["registrationForm"]["tag"].value;
	f=document.forms["regForm"]["presentationfile"].value;
	
	if(topic=="" ||topic==null)
	{
		document.getElementById("registerText").innerHTML="* Topic can't be blank";
		return false;
	}
	
	else if(pur==""||pur==null)
	{
		document.getElementById("registerText").innerHTML="* Purpose can't blank";
		return false;
	}
	
	else if(develop==""||develop==null)
	{
		document.getElementById("registerText").innerHTML="* Please enter the Development Time";
		return false;
	}
	
	else if(f==""||f==null)
	{
		document.getElementById("registerText").innerHTML="* Please select a file";
		return false;
	}
	else
		document.getElementById("registerText").innerHTML="";
}
</script>

<body>
	<%
		Object obj=session.getAttribute("username");
		if(obj==null ||obj=="")
		{
			response.sendRedirect("loginMessage.jsp");
		}
		else
		{
	%>
		<jsp:include page="home.jsp"></jsp:include>
		<div class="showContentTable">
		<form name="regForm" action="upload.do" onsubmit="return checkShare()" enctype="multipart/form-data" method="post">
		<font size="4">		
			<table>
			<tr>
				<td>
					<fieldset><legend><font color="red" size=5>Share a Presentation</font></legend>
							<table  height=400px width=600px cellpadding="2px" cellspacing="5px" >
							<tr><td colspan="2"><font color="red"><label id="registerText"></label></font></td></tr>
							<tr><td>Presentation Topic</td><td><input size="25" type="text" name="topic" id="topic"></td></tr>
							<tr>
								<td>Presentation Type</td><td> 
									<select name="type" id="type">
										<option>Sales pitch</option>
										<option>Branding</option>
										<option>Strategy</option>
										<option>Products</option>
										<option>CBA</option>
										<option>Events</option>
										<option>Others</option>
									</select>
								</td>
							</tr>
							<tr><td>Purpose</td><td><input size="25" type="text" name="purpose" id="purpose"></td></tr>
							<tr><td>Brief Description</td><td><textarea cols="30" rows="10" name="description" id="description"></textarea></td></tr>
							<tr><td>Development Time(in minutes)</td><td><input  size="25" type="text" name="developmentTime" id="developmentTime"></td></tr>
							<tr><td>Presented To</td><td><select name="presentedTo" id="presentedTo">
															<option>Internal Management</option>
															<option>Top Management</option>
															<option>External Management</option>
													</select>
							</td></tr>
							<tr><td>Attach File</td><td><input size="25" type="file" name="presentationfile" id="presentationfile"></td></tr>
							<tr><td align="center"><input class="button" type="submit" name="share" value="Share"></td>
								<td><input class="button" type="reset" name="reset" value="Reset"></td>
							</tr>
							</table>	
					</fieldset>
				</td>
			</tr>
		</table>
		</font>
		</form>
	</div>
	<%} %>
</body>
</html>