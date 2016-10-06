<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Successfully Share Presentation</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<script type="text/javascript">
		function sub()
		{
			var tag1="",tag2="",tag3="",tag4="",tag5="",tag6="",tag7="",tag8="",tag9="",tag10="",tag11="",tag12="",tag13="";
			tag1=document.forms["reg"]["tag1"].value;
			tag2=document.forms["reg"]["tag2"].value;
			tag3=document.forms["reg"]["tag3"].value;
			tag4=document.forms["reg"]["tag4"].value;
			tag5=document.forms["reg"]["tag5"].value;
			tag6=document.forms["reg"]["tag6"].value;
			tag7=document.forms["reg"]["tag7"].value;
			tag8=document.forms["reg"]["tag8"].value;
			tag9=document.forms["reg"]["tag9"].value;
			tag10=document.forms["reg"]["tag10"].value;
			tag11=document.forms["reg"]["tag11"].value;
			tag12=document.forms["reg"]["tag12"].value;
			tag13=document.forms["reg"]["tag13"].value;
			if(tag1=="" && tag2==""&& tag3==""&& tag4==""&& tag5==""&& tag6==""&& tag7==""&& tag8==""&& tag9==""&& tag10==""&& tag11==""&& tag12==""&& tag13=="")
			{
				alert("No username found");
				return false;
			}
			
		}
		function h()
		{
			document.getElementById("moretag").style.display="none";
		}
		function h1()
		{
			document.getElementById("moretag").style.display="block";
		}
		  

</script>
<body onload="h()">
	<%
		Object obj=session.getAttribute("username");
		if(obj==null || obj=="")
		{
			response.sendRedirect("loginMessage.jsp");
		}
		else
		{
	%>
	<jsp:include page="home.jsp"></jsp:include>
		<div class="userMsg">
		<font color="blue">
		<h2>Successfully uploaded!!!!!!!!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="home.jsp">Go to Your page..Click here</a><br><br>
		
		
		
		Tag this Presentation...<br></h2>
		</font>
		<h3>
		<form name="reg" action="tagPresentation.do" onsubmit="return sub()"method="post">
		<table>
		<tr><td colspan=3><font color=red size=3>*Username must be the login username of which you want to tag</font></td></tr>
		<tr>
			<td>Enter Username:</td>
			<td><input type="text" name="tag1" id="tag1" value="" onkeyup="showState(this.value,'tag1')"></td><td><a href="#"  onclick="h1()">Add more</a></td></tr>																
				
		<tr><td colspan="2">
		
		<div  id="moretag">
		<table>
		<tr><td>Enter Username:</td><td><input type="text" name="tag1" id="tag1" value="" ></td></tr>
		
		<tr><td>Enter Username:</td><td><input type="text" name="tag2" id="tag2" value="" ></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag3" id="tag3" value="" ></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag4" id="tag4" value="" ></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag5" id="tag5" value="" ></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag6" id="tag6" value="" ></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag7" id="tag7" value="" ></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag8" id="tag8" value="" ></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag9" id="tag9" value=""></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag10" id="tag10" value=""></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag11" id="tag11" value=""></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag12" id="tag12" value=""><br></td></tr>
		<tr><td>Enter Username:</td><td><input type="text" name="tag13" id="tag13" value=""><br></td></tr>
		</table></div></td></tr>
		<tr><td colspan="2" align="center"><input class="button" type="submit" value="Go"></td></tr>
		</table>
		</form>
		<br>
		<font color="blue">
			Share another Presentation...<a href="sharePresentation.jsp">Click Here</a></font>
		</h3>
	</div>
	<%} %>
</body>
</html>