<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<script type="text/javascript">
	function dropdown(id,id1)
	{
		
		if(id=="ul1")
			{
				
				document.getElementById(id).style.visibility="visible";
				document.getElementById(id1).style.visibility="hidden";
				document.getElementById("ul").style.visibility="hidden";
				
			}
		else if(id=="ul2")
			{
			
				
				document.getElementById(id).style.visibility="visible";
				document.getElementById(id1).style.visibility="hidden";
				document.getElementById("ul").style.visibility="hidden";
			}
		
	}
	function hidden()
	{
		document.getElementById("ul1").style.visibility="hidden";
		document.getElementById("ul2").style.visibility="hidden";
		
	}
	function show(id)
	{
		document.getElementById(id).style.visibility="visible";
	}
	function setLocation(id,id1)
	{
		var i=document.getElementById("location");
		i.innerHTML=id;
		document.getElementById(id1).style.visibility="hidden";
		
	}
	function checkEmpty()
	{
		var c=document.getElementById("content").value;
		if(c==null || c=="")
			{
				return false;
			}
	}
</script>
<body class="body" onload="hidden()" id="body">
<div class="header">
	<form action="searchPresentation.jsp" method="get" onsubmit="return checkEmpty()">
			<div class="menu">
					<ul>
						<li><a href="index.jsp">Home</a></li>&nbsp;
						<li><a href="latestPresentations.jsp">Latest Presentations</a></li>&nbsp;
						<li><a href="topFavorites.jsp">Top Favorites</a></li>&nbsp;
						<li><a href="mostDownloads.jsp">Most Downloaded</a></li>&nbsp;
						<li><a href="topTags.jsp">Top Tags</a></li>&nbsp;
						<li><a href="about.jsp">About us</a></li>&nbsp;
					</ul>
				</div>
				<div class="logo"><img src="images/share.GIF" height=130px width=250px>
				</div>
				
				<div class="search">
					
					<table>
					<tr><td><font size="4" color="blue">Search Presentations</font></td>
						<td><input class="searchTextBox" type="text" name="searchPresentation" id="content"/></td>
					    <td><input class="buttonImage" type="submit" name="searchbutton" value=""/></td>
					</tr>
					</table>
					
				</div>
				
				</form>
				</div>
		
	<div id="footer">
		<p>Copyright  2013. <a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a> | <a href="#" title="This page created by Sohan Lal Kumawat"><abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a> | <a href="#" title="This page validates as CSS"><abbr title="Cascading Style Sheets">CSS</abbr></a></p> 
	<p>Design by <a href="#" title="Flash Templates">Flash Templates</a>
		</p>
	</div>
</body>
</html>

						
                        