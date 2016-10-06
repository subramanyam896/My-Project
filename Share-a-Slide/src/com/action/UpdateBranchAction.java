package com.action;

import java.sql.Connection;



import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UpdateBranchAction extends Action
{
	public static String targetPage=null;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		
		
		String cmpid=request.getParameter("companyID");
		String cname=request.getParameter("companyName");
		String bname=request.getParameter("branchName");
		String bloc=request.getParameter("branchLocation");
		String bid=request.getParameter("branchID");
		
				
		PreparedStatement stmt=null;
		Connection con=null;
		String query="update branch set companyid=?,companyname=?,branchname=?,branchlocation=? where branchid='"+bid+"'";
		
		try
		{
		
			
			con=connectionProvider.ConnectionProvider.getInstance().getConnection();
		
			stmt=con.prepareStatement(query);
			stmt.setString(1, cmpid);
			stmt.setString(2, cname);
			stmt.setString(3, bname);
			stmt.setString(4, bloc);
			
			int a=stmt.executeUpdate();
		
			if(a>0)
			{
				targetPage="success";
				System.out.println("4");
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
