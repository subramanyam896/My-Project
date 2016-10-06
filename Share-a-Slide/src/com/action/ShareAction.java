package com.action;

import java.io.*;



import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;


import java.sql.*;
import java.util.*;
import java.util.regex.*;



public class ShareAction extends Action
{
	public static String targetPage=null;
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession(true);
		String username=session.getAttribute("username").toString();
		//int favorite=0,downloads=0,tags=0,views=0;
		//System.out.println("00"+username);
		String topic="";
		String type="";
		String purpose="";
		String description="";
		int developmentTime=0;
		String presentedTo="";
		String tag="";
		Connection con=null;
		PreparedStatement st=null;
		
		
		Calendar cal=Calendar.getInstance();
	    String currentDate;
	        
	        int month=cal.get(Calendar.MONTH);
	        int day=cal.get(Calendar.DATE);
	        if(month==11 || month==12) currentDate=cal.get(Calendar.YEAR)+"-"+cal.get(Calendar.MONTH);
	        else	currentDate=cal.get(Calendar.YEAR)+"-0"+cal.get(Calendar.MONTH);
	        if(day<10)  currentDate=currentDate+"-0"+cal.get(Calendar.DATE);
	        else		currentDate=currentDate+"-"+cal.get(Calendar.DATE);
	        
	        //System.out.println("date"+currentDate);
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			  //System.out.println("request: "+request);
			  if (!isMultipart) 
			  {
			  System.out.println("File Not Uploaded");
				  targetPage="failure";
			  } 
			  else 
			  {
			        FileItemFactory factory = new DiskFileItemFactory();
			        ServletFileUpload upload;
			          upload = new ServletFileUpload(factory);
			          //ServletFileDownload download;
			        ArrayList items = null;

			        try 
			        {
			            items =(ArrayList)upload.parseRequest(request);
			           // System.out.println("items: "+items);
			        } 
			        catch (FileUploadException e) 
			        {
			                e.printStackTrace();
			        }
			        
			        ListIterator itr = items.listIterator();

			        while (itr.hasNext()) 
			        {
			        FileItem item = (FileItem) itr.next();
			        if (item.isFormField())
			        {
			            String name = item.getFieldName();
			            System.out.println("name: "+name);
			            String value = item.getString();
			            System.out.println("value: "+value);
			            if(name.equals("topic")) topic=value;
			            if(name.equals("type")) type=value;
			            if(name.equals("purpose")) purpose=value;
			            if(name.equals("description")) description=value;
			            if(name.equals("developmentTime"))
			            {
			            	if(value==""|| value==null)
			            	{
			            		developmentTime=0;
			            	}
			            	else
			            	{
			            		developmentTime=Integer.parseInt(value);
			            	}
			            }
			            if(name.equals("presentedTo")) presentedTo=value;
			              
			        } 
			        else 
			        {
			                try 
			                {
			                    String itemName = item.getName();
			                    Random generator = new Random();
			                    int r = Math.abs(generator.nextInt());
			                    String reg = "[.*]";
			                    String replacingtext = "";
			                    //System.out.println("Text before replacing is:-" +itemName);
			                    Pattern pattern = Pattern.compile(reg);
			                    Matcher matcher = pattern.matcher(itemName);
			                    StringBuffer buffer = new StringBuffer();

			                    while (matcher.find()) 
			                    {
			                        matcher.appendReplacement(buffer, replacingtext);
			                    }
			                    int IndexOf = itemName.indexOf("."); 
			                    String domainName = itemName.substring(IndexOf);
			                    //System.out.println("domainName: "+domainName);

			                    String finalimage = buffer.toString()+"_"+r+domainName;
			                    //System.out.println("Final Image==="+finalimage);

			                    File savedFile = new File("D:/"+"images\\"+finalimage);
			                    item.write(savedFile);
			                   
			                    String strQuery = null;
			                    
			                 
			                    String path="D:/"+"images\\"+finalimage;
			                    File f=new File(path);
			                    FileInputStream fis = new FileInputStream(f);
			                    //System.out.println("file path"+f.getAbsolutePath()+"length="+f.length());
			                 
			                    
			                    try 
			                    {
			                    	int prid=0;
			                    	con=connectionProvider.ConnectionProvider.getInstance().getConnection();
			                    	strQuery="select max(pr_id) from presentation";
			                    	Statement stmt=con.createStatement();
			                    	ResultSet rs=stmt.executeQuery(strQuery);
			                    	if(rs.next())
			                    	{
			                    		prid=rs.getInt(1);
			                    		rs.close();
			                    		stmt.close();
			                    	}
			                    	else
			                    	{
			                    		rs.close();
			                    		stmt.close();
			                    	}
				                    strQuery = "insert into presentation values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				                    
				                    
				                    st = con.prepareStatement(strQuery);
				                    
				                    prid=prid+1;
				                    session.setAttribute("sharePresentationID", prid);
				                    System.out.println(prid);
				                    st.setInt(1,prid);
				                    st.setString(2, topic);
				                    st.setString(3, type);
				                    st.setString(4, purpose);
				                    st.setString(5, description);
				                    st.setInt(6, developmentTime);
				                    st.setString(7, presentedTo);
				                    st.setString(8, tag);
				                    st.setBinaryStream(9, (InputStream)fis, (int)(f.length()));
				                    st.setString(10, username);
				                    st.setInt(11, 0);
				                    st.setInt(12, 0);
				                    st.setInt(13, 0);
				                    st.setInt(14, 0);
				                    st.setString(15, "no");
				                    st.setString(16, currentDate);
				                    System.out.println("00001");
				                    int s = st.executeUpdate();
				                    System.out.println("00002");
				                    if(s>0)
				                    {
				                        
				                        targetPage="success";
				                    
				                    }
				                    else
				                    {
				                        targetPage="failure";
				                    }
				                    
			                    }
			                    catch (Exception e) 
			                    {
			                        e.getStackTrace();
			                    } 
			                    finally 
			                    {
			                    	if(targetPage==null)
			                    	{
			                    		targetPage="failure";
			                    	}
			                        con.close();
			                    } 
			                }
			                catch(Exception e)
			                {
			                	e.getMessage();
			                }
			                finally
			                {
			                	if(targetPage==null)
		                    	{
		                    		targetPage="failure";
		                    	}
			                }
			                
			           }
			        }
			      }
		return mapping.findForward(targetPage);
	}
}