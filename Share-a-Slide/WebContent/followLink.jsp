
<%@page import="java.sql.*,connectionProvider.*" %>

<html>
<body>
	<%
	Connection con1=null;
try
	{
	
	
	Object obj1=session.getAttribute("username");
	
	String username1=request.getParameter("id");
	//System.out.println("followlink"+username1);
	String id="";
	
	if(obj1==null)
		response.sendRedirect("loginMessage.jsp");
	else if(username1==null || username1=="")
	{
		response.sendRedirect("failure.jsp");
	}
	else
	{
		try
		{
			id=username1+obj1.toString();
		//	System.out.println("followlink"+username1);
			String query="insert into users(id,username,followingname) values(?,?,?)";
			con1=ConnectionProvider.getInstance().getConnection();
			PreparedStatement pstmt5=con1.prepareStatement(query);
			pstmt5.setString(1,id);
			pstmt5.setString(2,username1);
			pstmt5.setString(3, obj1.toString());
			
			int a=pstmt5.executeUpdate();
			if(a>0)
			{
				//con1.close();
				//response.sendRedirect("searchUsers.jsp");
			}
			else
			{
				//con1.close();
				response.sendRedirect("failure.jsp");
			}
			
		}
		catch(Exception ex)
		{
		}
		finally
		{
			con1.close();
		}
	}
	}
	catch(Exception ex)
	{
		//System.out.println("Problem occured!!");
	}
finally
{
	con1.close();
}
%>

</body>
</html>