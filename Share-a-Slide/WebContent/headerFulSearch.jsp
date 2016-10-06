<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style type="text/css">
	.navi a
	{
		text-decoration:none;
			
	}
	.navi ul li
	{
		list-style:none;
	}	
	.navi ul li ul li a
	{
		text-decoration:none;
		
	}
	.navi ul li:hover > ul
	{
		display:block;
	}
.dropdown
{
	position:relative
}
.dropdown-toggle
{
	*margin-bottom:-3px
}

.caret
{
display:inline-block;
width:0;
height:0;
vertical-align:middle;
border-left:4px solid transparent;
border-right:4px solid transparent;
border-top:4px solid #000;
opacity:.3;
filter:alpha(opacity=30);
content:""
}
.dropdown .caret
{
	margin-top:8px;margin-left:2px
}

.dropdown-menu{
	position:absolute;
	top:100%;
	left:0;z-index:1000;
	float:left;
	display:none;
	min-width:160px;
	padding:4px 0;margin:0;
	list-style:none;background-color:#f6f5ef;
	border-color:#ccc;border-color:rgba(0,0,0,0.2);
	border style:solid;
	border-width:1px;
	-webkit-border-radius:0 0 5px 5px;
	-moz-border-radius:0 0 5px 5px;
	border-radius:0 0 5px 5px;
	-webkit-box-shadow:0 5px 10px rgba(0,0,0,0.2);
	-moz-box-shadow:0 5px 10px rgba(0,0,0,0.2);
	box-shadow:0 5px 10px rgba(0,0,0,0.2);
	-webkit-background-clip:padding-box;
	-moz-background-clip:padding;
	background-clip:padding-box;
	*border-right-width:2px;*border-bottom-width:2px
}

.dropdown-menu a
{display:block;padding:3px 15px;clear:both;font-weight:normal;line-height:18px;color:#3b3835;white-space:nowrap}
.dropdown-menu li>a:hover,.dropdown-menu .active>a,.dropdown-menu .active>a:hover
{
	color:#f6f5ef;text-decoration:none;background-color:#716b65
}
</style>
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
</script>
<body class="body" onload="hidden()" id="body">
<div class="header">
	<form action="searchPresentation.jsp" method="get">
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
				<div class="logo">
				</div>
				
				<div class="search">
					
					<table>
					<tr><td><font size="4" color="blue">Search Presentations</font></td>
						<td><input class="searchTextBox" type="text" name="searchPresentation"/></td>
					    <td><input class="buttonImage" type="submit" name="searchbutton" value=""/></td>
					</tr>
					</table>
					
				</div>
				<div class="navi">
				
				<ul>
				<div class="search1">
				<li class="dropdown" id="browse">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" onmouseover="show('ul')"><font size="4">Search By</font> <span class="divider">&nbsp;</span><b class="caret"></b></a>
                    <ul class="dropdown-menu" id="ul" >
                        <li>
                            <a href="#" onclick="dropdown('ul1','ul2')">Tags</a>
                        </li>
                        <li>
                            <a href="#" onclick="dropdown('ul2','ul1')">Location</a>
                        </li>
                        
                    </ul>
                </li>    
                </div>
	                <div class="search2" id="ul1">
	                <li class="dropdown" >
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" onmouseover="show('ulBrowse')"><font size="4">Browse</font> <span class="divider">&nbsp;</span><b class="caret"></b></a>                	
	                	<ul class="dropdown-menu" id="ulBrowse">
	                		<li>
	                        <a href="#">Viewed</a>
	                        </li>
	                        <li>
	                            <a href="#">Downloaded</a>
	                        </li>
	                        <li>
	                            <a href="#">Favorited</a>
	                        </li>
	                        <li>
	                            <a href="#">Tagged</a>
	                        </li>
	                	</ul>
	                </li>
	                </div>	
                	<div class="search2" id="ul2">
                	<li>
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown" id="location" onmouseover="show('ulLocation')"> <font size="4">Location</font> <span class="divider">&nbsp;</span><b class="caret"></b></a>                	
                	<ul class="dropdown-menu" id="ulLocation" >
                		<li>
                        <a href="#" onclick="setLocation('Bangalore','ulLocation')">Bangalore</a>
                        </li>
                        <li>
                            <a href="#" onclick="setLocation('Delhi','ulLocation')">Delhi</a>
                        </li>
                        <li>
                            <a href="#" onclick="setLocation('Jaipur','ulLocation')">Jaipur</a>
                        </li>
                        <li>
                            <a href="#" onclick="setLocation('Kolkata','ulLocation')">Kolkata</a>
                        </li>
                        <li>
                            <a href="#" onclick="setLocation('Mumbai','ulLocation')">Mumbai</a>
                        </li>
                	</ul>
    				</li>            
                	</div>
                
                </div>            
            </ul>
				</form>
				</div>
		
	<div id="footer">
		<p>Copyright  2013. <a href="#">Privacy Policy</a> | <a href="#">Terms of Use</a> | <a href="#" title="This page created by Sohan Lal Kumawat"><abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a> | <a href="#" title="This page validates as CSS"><abbr title="Cascading Style Sheets">CSS</abbr></a></p> 
	<p>Design by <a href="#" title="Flash Templates">Flash Templates</a>
		</p>
	</div>
</body>
</html>
