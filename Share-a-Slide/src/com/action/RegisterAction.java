package com.action;

import java.sql.Connection;



import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class RegisterAction extends Action
{
	public static String targetPage=null;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		
		
		String firstName=request.getParameter("fname");
		String middleName=request.getParameter("mname");
		String lastName=request.getParameter("lname");
		String userName=request.getParameter("uname");
		String password=request.getParameter("pass");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		
		String mobile=request.getParameter("mobile");
		String month=request.getParameter("bmonth");
		String day=request.getParameter("bday");
		String year=request.getParameter("byear");
		if(month==null ||month==""||month.equalsIgnoreCase("none")) month="";
		if(day==null ||day==""||day.equalsIgnoreCase("none")) day="";
		if(year==null ||year==""||year.equalsIgnoreCase("none")) year="";
		
		String birth=year+"-"+month+"-"+day;
		
		String cmpName=request.getParameter("cmpName");
		String cmpID=request.getParameter("cmpID");
		String branchName=request.getParameter("branchName");
		String branchID=request.getParameter("branchID");
		if(firstName==null ||firstName=="") firstName="";
		if(middleName==null ||middleName=="") middleName="";
		if(lastName==null ||lastName=="") lastName="";
		if(userName==null ||userName=="") userName="";
		if(password==null ||password=="") password="";
		if(email==null ||email=="") email="";
		if(gender==null ||gender=="") gender="";
		if(mobile==null ||mobile=="") mobile="";
		
		if(cmpName==null ||cmpName=="") cmpName="";
		if(cmpID==null ||cmpID=="") cmpID="";
		if(branchName==null ||branchName=="") branchName="";
		if(branchID==null ||branchID=="") branchID="";
		
		PreparedStatement stmt=null;
		Connection con=null;

		long mo=Long.parseLong(mobile);

		String query="insert into registration values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try
		{
		
			
			con=connectionProvider.ConnectionProvider.getInstance().getConnection();
			
			stmt=con.prepareStatement(query);
			stmt.setString(1, firstName.toUpperCase());
			stmt.setString(2, middleName.toUpperCase());
			stmt.setString(3, lastName.toUpperCase());
			stmt.setString(4, userName);
			stmt.setString(5, password);
			stmt.setString(6, email);
			stmt.setString(7, gender);
			stmt.setLong(8, mo);
			stmt.setString(9, birth);
			stmt.setString(10, cmpName);
			stmt.setString(11, cmpID);
			stmt.setString(12, branchName);
			stmt.setString(13, branchID);
			stmt.setInt(14,0);
			stmt.setInt(15, 0);
		
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
