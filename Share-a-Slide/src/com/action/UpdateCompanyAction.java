package com.action;

import java.sql.Connection;



import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UpdateCompanyAction extends Action
{
	public static String targetPage=null;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		
		
		String cmpid=request.getParameter("ID");
		String name=request.getParameter("Name");
		String lname=request.getParameter("Location");
		
			
		PreparedStatement stmt=null;
		Connection con=null;
		String query="update company set companyname=?,location=? where companyid='"+cmpid+"'";
		
		try
		{
		
			
			con=connectionProvider.ConnectionProvider.getInstance().getConnection();
	
			stmt=con.prepareStatement(query);
			
			stmt.setString(1, name);
			stmt.setString(2, lname);
			
			int a=stmt.executeUpdate();
	
			if(a>0)
			{
				targetPage="success";
	
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
			try
			{
			con.close();
			}
			catch(Exception ex)
			{
				ex.getMessage();
			}
		}
		
		return mapping.findForward(targetPage);
	}	
}
