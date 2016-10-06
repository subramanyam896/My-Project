package com.action;

import java.sql.Connection;



import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class UpdateProfileAction extends Action
{
	public static String targetPage=null;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession(true);
		String username=session.getAttribute("username").toString();
		String firstName=request.getParameter("fname");
		String middleName=request.getParameter("mname");
		String lastName=request.getParameter("lname");
		//String password=request.getParameter("pass");
		//String cpassword=request.getParameter("cpass");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		
		String mobile=request.getParameter("mobile");
		String month=request.getParameter("bmonth");
		String day=request.getParameter("bday");
		String year=request.getParameter("byear");
		String birth=year+"-"+month+"-"+day;
		String cmpName=request.getParameter("cmpName");
		String cmpID=request.getParameter("cmpID");
		String branchName=request.getParameter("branchName");
		String branchID=request.getParameter("branchID");
		long mo=Long.parseLong(mobile);
		
		PreparedStatement stmt=null;
		Connection con=null;
		
		if(middleName==null) middleName="";
		if(lastName==null) lastName="";
		if(firstName==null || firstName=="" ||gender==null||gender=="")
		{
			targetPage="failure";
			
		}
		else if(month==null || month==""||month.equalsIgnoreCase("none"))
		{
			targetPage="failure";
			
		}
		else if(day==null || day=="" ||day.equalsIgnoreCase("none"))
		{
			targetPage="failure";
			
		}
		else if(year==null||day==""||day.equalsIgnoreCase("none"))
		{
			targetPage="failure";
			
		}
		else if(cmpName=="" || cmpName==null || cmpID==null || cmpID=="" || branchName==null || branchName=="" || branchID==null || branchID=="")
		{
			targetPage="failure";
			
		}
		else
		{
			
			
			String query="update registration set " +
						"firstname=?,middlename=?,lastname=?," +
						"email=?,gender=?,mobile=?,birth=?,companyname=?,companyid=?," +
						"branchname=?,branchid=? where username='"+username+"'";
			
			try
			{
			
				
				con=connectionProvider.ConnectionProvider.getInstance().getConnection();
			
				stmt=con.prepareStatement(query);
				stmt.setString(1, firstName.toUpperCase());
				stmt.setString(2, middleName.toUpperCase());
				stmt.setString(3, lastName.toUpperCase());
				//stmt.setString(4, userName);
				//stmt.setString(4, password);
				stmt.setString(4, email);
				stmt.setString(5, gender);
				stmt.setLong(6, mo);
				stmt.setString(7, birth);
				stmt.setString(8, cmpName);
				stmt.setString(9, cmpID);
				stmt.setString(10, branchName);
				stmt.setString(11, branchID);
				//stmt.setLong(14,0);
				//stmt.setLong(15, 0);
				
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
		}
		return mapping.findForward(targetPage);
	}	
}
