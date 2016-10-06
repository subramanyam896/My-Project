<%@page import="connectionProvider.ConnectionProvider,java.sql.*,java.io.ByteArrayInputStream"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<body>
<%
		int id=0;
		int d=0;
		String i=request.getParameter("id");
		if(i!=null && i!="")
		{
			id = Integer.parseInt(i);
		}
		//System.out.println("1"+id);
		Blob Content=null;
		//System.out.println("2");
		Statement stmt=null;
		//System.out.println("3");
		Connection con=null;
		
		try
		
		{
		
			String filename="presentation"+id+".ppt";
			//System.out.println("4");		
			con = ConnectionProvider.getInstance().getConnection(); 
			//System.out.println("5");
			stmt=con.createStatement();
			//System.out.println("6");
			String qry = "select * from presentation where pr_id="+id+"";
			ResultSet rst= stmt.executeQuery(qry);
			//System.out.println("7");
			if(rst.next())
			{
				//System.out.println("8");
					Content=rst.getBlob(9);
			}
	    	else
			{
			      System.out.println("Error");
			}
			qry="select downloads from presentation where pr_id="+id;
			Statement stmt1=(Statement)con.createStatement();
			ResultSet rs=stmt1.executeQuery(qry);
			if(rs.next())
			{
				d=rs.getInt("downloads");
				++d;
				rs.close();
			}
			else
			{
				rs.close();
			}
			qry="update presentation set downloads="+d+" where pr_id="+id;
			int i1=stmt1.executeUpdate(qry);
			if(i1>0)
			{
				stmt1.close();
			}
			else
			{
				stmt1.close();
			}
			byte requestBytes[] = Content.getBytes((long)1,(int) Content.length());
			ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
			response.reset();
			//System.out.println("9");
			response.setContentType("application/text");
			response.setHeader("Content-disposition","attachment; filename=" +filename);
			//System.out.println("10");
			byte[] buf = new byte[1024];
			int len;
			//System.out.print("11");
			while ((len = bis.read(buf)) > 0)
			{
			  response.getOutputStream().write(buf, 0, len);
			  //System.out.print("12");
			}
			bis.close();
			//System.out.println("13");
			//response.getOutputStream().flush(); 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			con.close();
		}
%>
</body>
</html>