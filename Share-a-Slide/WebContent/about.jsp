<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="tab">
		<table height="200px" width="500px">
		<tr>
		<td>
			<font color="green"><h1>Why should you use Share-a-Slide? </h1></font>
			<h3>Share-a-Slide is the world's best community for sharing presentations.
			Share-a-Slide features a vibrant professional and educational community that regularly comments, favorites and downloads content.
		    SlideShare content spreads virally through blogs and social networks such as Facebook and Twitter.
		    Individuals & organizations upload documents to SlideShare to share ideas, conduct research, connect with others, and generate leads for their businesses. 
		    Anyone can view presentations & documents on topics that interest them, download them and reuse or remix for their own work.
		    </h3>
		</td>
		</tr>
		</table>
		
		<table height="200px" width="500px"><tr><td>
			<font color="green"><h2>Some things that you can do on Share-a-Slide</h2></font>
			<h3>
			<ul type="square">
			<li>Upload presentations
			<li>Download presentations
			<li>Tag presentations
			<li>Share a presentations
			<li>Follow a user
			<li>Search a presentations
			<li>Share on Twitter, Facebook
			</h3></ul>
		</td></tr></table>
	</div>
	<div class="contact">
		<table height="200px" width="200px">
		<tr>
		<td>
<pre>
<font color="green" size=6>
Contact us:
</font><font color="green" size=5>
  Address:</font><font size=4>
		Banglore
		NIIT BTM Layout,
		Near JaiDeva FlyOver,
		BTM Layout,
		Banglore, India
  </font><font color="green" size=5>
  Mobile:</font><font size=4>
	      	+91-9950020128
	      	+91-9916001305
  </font><font color="green" size=5>
  E-mail:</font><font size=4>
		<a href="http://www.gmail.com">slk.kumawat@gmail.com</a>
		<a href="http://www.gmail.com">sohanlalkumawat1989@gmail.com</a>
	</font>
</pre>
		</td>
		</tr>
		</table>
	</div>
	
	<%
		Object obj=session.getAttribute("username");
		Connection con=null;
		if(obj==null || obj=="")
		{
	%>
	<div class="signuptext"><a id="text" href="registration.jsp"><font size="5" color="green">Sign up</font></a></div>
	<%
		}
		else
		{
			String fname="",mname="";
			try
			{
				con=connectionProvider.ConnectionProvider.getInstance().getConnection();
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
	
	<div class="signuptext">
		<a id="text" href="home.jsp"><font size="5" color="green"><%=fname+" "+mname %></font></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="text" href="logout.jsp">Logout</a>
		</div>
	
	
	
	
	<%
		}
			catch(Exception e)
			{
				e.getMessage();
			}
			finally
			{
				con.close();
			}
		}
	%>
</body>
</html>