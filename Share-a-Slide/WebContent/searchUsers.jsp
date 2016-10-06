<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,connectionProvider.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Users</title>
<link rel="stylesheet" type="text/css" href="styels.css">
</head>
<script type="text/javascript">
	
	function showCustomers(id)
	{
		//alert(" user="+id);
		var xmlhttp;
		if (id=="" || id==null)
	 	{
			return;
	  	}
		
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }

		var str="followLink.jsp?id="+id;
		//alert(str);
		xmlhttp.open("GET",str,true);
		xmlhttp.send();
		document.getElementById(id).innerHTML="Following";
		
	}
</script>
<body>
		<%
			Object obj=session.getAttribute("username");
			Connection con=null;
			String fuser="";
			String searchName=request.getParameter("searchName");
			String search=request.getParameter("a");
			
			//out.println(search);		
			String name="";
			String query=null;
			int presentations=0;
			ResultSet rs=null,rs1=null;
			Statement stmt=null,stmt1=null;
			PreparedStatement pstmt=null;
			String follow="Follow";
			int check=0;
			if(obj==null)
			{
				//out.println("search00");	
				response.sendRedirect("loginMessage.jsp");
				return;
			}
			else
			{
				//out.println("search01");
				try
				{
					
					con=connectionProvider.ConnectionProvider.getInstance().getConnection();
					stmt=con.createStatement();
					
					String sname="";
					int len=searchName.length();
					if(len<3)
					{
						sname=searchName.toUpperCase();
					}
					else
					{
						sname=((searchName.substring(0,2)).toUpperCase());
					}
					if(search.equalsIgnoreCase("Search"))
					{
						query="select * from registration where firstname like '"+sname+"%' and username !='"+obj.toString()+"'";
					}
					else
					{
						query="select * from registration where username !='"+obj.toString()+"'";
					}
					rs=stmt.executeQuery(query);
					
					if(rs==null)
					{
					
		%>
		<jsp:include page="home.jsp"></jsp:include>
		<div class="showContentTable">
		
		<font size="4">		
		<form action="searchUsers.jsp" method="get">
				<table>
					<tr>
						<td colspan="2" align="center">
							<table cellpadding="2px" cellspacing="5px">
							<tr>
								<td>Enter User Name</td>
								<td><input class="searchTextBox" type="text" name="searchName"></td>
								<td><input class="button" type="submit" name="a" value="Search"></td>
								<td><input class="button" type="submit" name="a" value="View All"></td>
							</tr>
							</table>
						</td>
					</tr>
				</table>
				</form>
				</font>
				
		
			<h2>No match found!!!!<br>
				
			</h2>
			
			</div>		
			<%
					}
					else
					{
						String fname,mname,lname,firstname;	
			%>
		<jsp:include page="home.jsp"></jsp:include>
		<div class="showContentTable">
		
		<font size="4">		
		<form action="searchUsers.jsp" method="get">
				<table>
					<tr>
						<td colspan="2" align="center">
							<table cellpadding="2px" cellspacing="5px">
							<tr>
								<td>Enter User Name</td>
								<td><input class="searchTextBox" type="text" name="searchName"></td>
								<td><input class="button" type="submit" name="a" value="Search"></td>
								<td><input class="button" type="submit" name="a" value="View All"></td>
							</tr>
							</table>
						</td>
					</tr>
				</table>
				<table>
											<%
									while(rs.next())
									{
										long following=0,follower=0;
										check=1;						
										fuser=rs.getString("username");										
							
										query="select count(pr_topic) from presentation where username='"+rs.getString("username")+"'";
										stmt1=con.createStatement();
										rs1=stmt1.executeQuery(query);
										//System.out.println("pres="+presentations);
										if(rs1.next())
										{
											presentations=rs1.getInt(1);
											rs1.close();
										}
										else
										{
											rs1.close();
										}
										//System.out.println("pres="+presentations);
										
										 fname=rs.getString(1);mname=rs.getString(2);lname=rs.getString(3);
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
										follow="Follow";
										query="select * from users where username='"+rs.getString("username")+"' and followingname='"+obj.toString()+"'";
										stmt1=con.createStatement();
										rs1=stmt1.executeQuery(query);
										if(rs1.next())
										{
											follow="Following";
											rs1.close();
										}
										else
										{
										
											rs1.close();
										}
										query="select * from users where username='"+obj.toString()+"' and followingname='"+rs.getString("username")+"'";
										stmt1=con.createStatement();
										rs1=stmt1.executeQuery(query);
										if(rs1.next())
										{
											follow="Follower";
											rs1.close();
										}
										else
										{
										
											rs1.close();
										}
										query="select count(followingname) from users where username='"+rs.getString("username")+"'";
										stmt1=con.createStatement();
										rs1=stmt1.executeQuery(query);
										if(rs1.next())
										{
											follower=rs1.getLong(1);
											rs1.close();
										}
										else
										{
											follower=0;
											rs1.close();
										}
										query="select count(username) from users where followingname='"+rs.getString("username")+"'";
										stmt1=con.createStatement();
										rs1=stmt1.executeQuery(query);
										if(rs1.next())
										{
											following=rs1.getLong(1);
											rs1.close();
										}
										else
										{
											following=0;
											rs1.close();
										}
								%>
								
							<table border="1">
							<tr><td>
								<table>
								<tr>
									
									<td width=100px><%=name %></td>
									<td width=100px><center>Followers<br> <%=follower %></center></td>
									<td width=100px><center>Following <br><%=following %></center></td>
									<td width=200px><center>Shared Presentations<br><%=presentations %></center></td>
									<%
										if(follow.equalsIgnoreCase("Follow"))
										{
									%>
									<td width=100px><a href="#" onclick="showCustomers('<%=fuser%>')" id="<%=fuser%>"><%=follow %></a></td>
									<%
									
										}
										else
										{
									%>
									<td width=100px><font color="blue"><a><%=follow %></a></font></td>
									<%
										}
									%>
								</tr>
								</table>
								
								</td>
								</tr>
							</table>
							<br>
							<% }%>
						
			</table>
			</form>		
		</font>
		
		</div>
			<%
					}
					if(check==0)
					{
			%>
						<div class="showContentTable">
		
				<font size="4">		
				<form action="searchUsers.jsp" method="get">
				<table>
					<tr>
						<td colspan="2" align="center">
							<table cellpadding="2px" cellspacing="5px">
							<tr>
								<td>Enter User Name</td>
								<td><input class="searchTextBox" type="text" name="searchName"></td>
								<td><input class="button" type="submit" name="a" value="Search"></td>
								<td><input class="button" type="submit" name="a" value="View All"></td>
							</tr>
							</table>
						</td>
					</tr>
				</table>
				</form>
				</font>
				
		
			<h2>No match found!!!!<br>
				
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
					try
					{
						rs.close();
						con.close();
					}
					catch(Exception e)
					{
						e.getMessage();
					}
					
				}
			
			}
		%>
		

		
</body>
</html>