package com.action;

import org.apache.struts.action.Action;


import org.apache.struts.action.*;
import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginAction extends Action 
{
	
	public static String targetPage=null;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		
		String username=request.getParameter("username");
		String password=request.getParameter("pass");
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try
		{
		
			con=connectionProvider.ConnectionProvider.getInstance().getConnection();
			stmt=con.createStatement();
		
			String query="select * from registration where username='"+username+"'";
			
			rs=stmt.executeQuery(query);
		
			if(rs.next())
			{
				 if(username.equalsIgnoreCase(rs.getString(4)) && password.equalsIgnoreCase(rs.getString(5)))
				{
			
					targetPage="success";
					HttpSession session=request.getSession();
					session.setAttribute("username", username);
				}
				
				else
				{
			
					targetPage="failure";
				}
				
			}
			else
			{
				targetPage="failure";
		
			}
		
		}
		catch(Exception ex)
		{
			ex.getStackTrace();
		}
		finally
		{
			if(targetPage==null)
			{
				targetPage="failure";
		
			}
			try{
			rs.close();
			con.close();}
			catch(Exception ex){ex.getMessage();}
		}
		
		return mapping.findForward(targetPage);
		
	}
}
