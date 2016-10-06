<%@page import="java.sql.*,connectionProvider.*"%>
<html>
<body>
<%
Connection conn=null;
try
{
Object obj11=session.getAttribute("username");
String id=request.getParameter("id");


int prid; 
if(id==null)
{
		prid=0;
}
else
{
	
	prid=Integer.parseInt(id);
}
System.out.println("2");
if(obj11==null)
	response.sendRedirect("loginMessage.jsp");
else
{
	try
	{	
		//System.out.println("marked asfavorited="+id);
		String query="insert into favorite(pr_id,myfavorites) values(?,?)";
		conn=ConnectionProvider.getInstance().getConnection();
		//System.out.println("5");
		PreparedStatement pstmtt=conn.prepareStatement(query);
		pstmtt.setLong(1,prid);
		pstmtt.setString(2, obj11.toString());
		//System.out.println("6");
		int a=pstmtt.executeUpdate();
		//System.out.println("7");
		if(a>0)
		{
			
			//System.out.println("8");
			//response.sendRedirect("searchUsers.jsp");
		}
		else
		{
		//System.out.println("9");
			
			response.sendRedirect("failure.jsp");
		}
		int t=0;
		query="select favorite from presentation where pr_id="+id;
		Statement stmt1=(Statement)conn.createStatement();
		ResultSet rs=stmt1.executeQuery(query);
		if(rs.next())
		{
			t=rs.getInt("favorite");
			++t;
			rs.close();
		}
		else
		{
			rs.close();
		}
		query="update presentation set favorite="+t+" where pr_id="+id;
		int i=stmt1.executeUpdate(query);
		if(i>0)
		{
			stmt1.close();
		}
		else
		{
			stmt1.close();
		}
		
	}
	
	catch(Exception ex)
	{
		
	}
	finally
	{
		conn.close();
	}
}
}
	catch(Exception ex)
	{
		///out.println("Sorry,Some problem occured!!");
	}
	

%>
</body>
</html>