package com.action;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.mysql.jdbc.Statement;




public class TagPresentationAction extends Action
{
	public static String targetPage=null;
	public Connection con=null;
	
	public void share(int id,String tag)
	{
		int t=0;
		try
		{
			//System.out.println("share");
			String query1="insert into tags values(?,?)";
			PreparedStatement stmt=con.prepareStatement(query1);
			stmt.setInt(1, id);
			stmt.setString(2, tag);
			int s=stmt.executeUpdate();
			if(s>0)
			{
				stmt.close();
				query1="select tags from presentation where pr_id="+id;
				Statement stmt1=(Statement)con.createStatement();
				ResultSet rs1=stmt1.executeQuery(query1);
				if(rs1.next())
				{
					t=rs1.getInt("tags");
					++t;
					rs1.close();
				}
				else
				{
					rs1.close();
				}
				query1="update presentation set tags="+t+" where pr_id="+id;
				int i=stmt1.executeUpdate(query1);
				if(i>0)
				{
					stmt1.close();
				}
				else
				{
					stmt1.close();
				}
				targetPage="success";
			}
			else
			{
				targetPage="failure";
				stmt.close();
			}
		}
		catch(SQLException ex)
		{
			ex.getMessage();
		}
		
	}
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		
		try
		{
			HttpSession session=request.getSession(true);
			String username=session.getAttribute("username").toString();
			int id=Integer.parseInt(session.getAttribute("sharePresentationID").toString());
			String tag1="",tag2="",tag3="",tag4="",tag5="",tag6="",tag7="",tag8="",tag9="",tag10="",tag11="",tag12="",tag13="";
			tag1=request.getParameter("tag1");
			tag2=request.getParameter("tag2");
			tag3=request.getParameter("tag3");
			tag4=request.getParameter("tag4");
			tag5=request.getParameter("tag5");
			tag6=request.getParameter("tag6");
			tag7=request.getParameter("tag7");
			tag8=request.getParameter("tag8");
			tag9=request.getParameter("tag9");
			tag10=request.getParameter("tag10");
			tag11=request.getParameter("tag11");
			tag12=request.getParameter("tag12");
			tag13=request.getParameter("tag13");
			//System.out.println(tag1+tag2+tag3+tag4+tag5+tag6+tag7+tag8+tag9+tag10+tag11+tag12+tag12+tag13);
			con=connectionProvider.ConnectionProvider.getInstance().getConnection();
			Statement st1=(Statement) con.createStatement();
			String query="";
			ResultSet rs=null;
		
			if(tag1!="" && tag1!=null)
			{
				query="select username from registration where username='"+tag1+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag1);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("1");
			}
			if(tag2!="" && tag2!=null)
			{
				query="select username from registration where username='"+tag2+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag2);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("2");
			}
			if(tag3!="" && tag3!=null)
			{
				query="select username from registration where username='"+tag3+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag3);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("3");
			}
			if(tag4!="" && tag4!=null)
			{
				query="select username from registration where username='"+tag4+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag4);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("4");
			}
			if(tag5!="" && tag5!=null)
			{
				query="select username from registration where username='"+tag5+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag5);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("5");
			}
			if(tag6!="" && tag6!=null)
			{
				query="select username from registration where username='"+tag6+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag6);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("6");
			}
			if(tag7!="" && tag7!=null)
			{
				query="select username from registration where username='"+tag7+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag7);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("7");
			}
			if(tag8!="" && tag8!=null)
			{
				query="select username from registration where username='"+tag8+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag8);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("8");
			}
			if(tag9!="" && tag9!=null)
			{
				query="select username from registration where username='"+tag9+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag9);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("9");
			}
			if(tag10!="" && tag10!=null)
			{
				query="select username from registration where username='"+tag10+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag10);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("10");
			}
			if(tag11!="" && tag11!=null)
			{
				query="select username from registration where username='"+tag11+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag11);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("11");
			}
			if(tag12!="" && tag12!=null)
			{
				query="select username from registration where username='"+tag12+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag12);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("12");
			}
			
			if(tag13!="" && tag13!=null)
			{
				query="select username from registration where username='"+tag13+"'";
				rs=st1.executeQuery(query);
				if(rs.next())
				{
					share(id,tag13);
					rs.close();
				}
				else
				{
					rs.close();
				}
				System.out.print("13");
			}
		}
		catch(Exception ex)
		{
			ex.getMessage();
		}
		finally
		{
			try
			{
			con.close();
			if(targetPage==null)
			{
				targetPage="failure";
			}
			}
			catch(Exception e)
			{
				e.getMessage();
				
			}
		}
		return mapping.findForward(targetPage);
	}
	
}