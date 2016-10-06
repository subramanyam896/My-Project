package com.action;

import org.apache.struts.action.Action;


import org.apache.struts.action.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AdminLoginAction extends Action 
{
	
	public static String targetPage=null;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		
		String username=request.getParameter("username");
		String password=request.getParameter("pass");
		//System.out.println("1"+username+password);
		try
		{
		
				 if(username.equalsIgnoreCase("user0") && password.equalsIgnoreCase("user0"))
				{
					 //System.out.println("2");
					targetPage="success";
					HttpSession session=request.getSession();
					session.setAttribute("username", username);
				}
				
				else
				{
					//System.out.println("3");
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
				//System.out.println("4");
			}
			
		}
		
		return mapping.findForward(targetPage);
		
	}
}
