<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<style type="text/css">
	
</style>
<script type="text/javascript">
	function checkFields()
	{
		var fn="",user="",pass1="",pass2="",email="",gender="",mobile="",bmonth="",bday="",byear="",cmpName="",cmpID="",branchName="",branchID="";
		fn=document.forms["registrationForm"]["fname"].value;
		user=document.forms["registrationForm"]["uname"].value;
		pass1=document.forms["registrationForm"]["pass"].value;
		pass2=document.forms["registrationForm"]["rpass"].value;
		email=document.forms["registrationForm"]["email"].value;
		mobile=document.forms["registrationForm"]["mobile"].value;
		bmonth=document.forms["registrationForm"]["bmonth"].value;
		bday=document.forms["registrationForm"]["bday"].value;
		dyear=document.forms["registrationForm"]["byear"].value;
		cmpName=document.forms["registrationForm"]["cmpName"].value;
		cmpID=document.forms["registrationForm"]["cmpID"].value;
		branchName=document.forms["registrationForm"]["branchName"].value;
		branchID=document.forms["registrationForm"]["branchID"].value;
		
		if(fn=="")
		{
			document.getElementById("registerText").innerHTML="* First Name can't be blank";
			return false;
		}
		else if(user=="")
		{
			document.getElementById("registerText").innerHTML="* Username can't be blank";
			return false;
		}
		else if(pass1=="" || pass2=="")
		{
			document.getElementById("registerText").innerHTML="* Password/Re-password can't be blank";
			return false;
		}
		
		else if(pass1!=pass2)
		{
			document.getElementById("registerText").innerHTML="* Both passwords are not same, enter same.";
			return false;
		}
		if(cmpName=="")
		{
			document.getElementById("registerText").innerHTML="* Company Name can't be blank";
			return false;
		}
		else if(cmpID=="")
		{
			document.getElementById("registerText").innerHTML="* Company ID can't be blank";
			return false;
		}
		
		else if(branchName=="")
		{
			document.getElementById("registerText").innerHTML="* Branch Name can't be blank";
			return false;
		}
		else if(branchID=="")
		{
			document.getElementById("registerText").innerHTML="* Branch ID can't be blank";
			return false;
		}
		else
			document.getElementById("registerText").innerHTML="";
	}
</script>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="tab">
	<font size="4">
		<form name="registrationForm" onsubmit="return checkFields()" action="register.do" method="post" >
			<table>
				<tr>
					<td>
						<fieldset>
							<legend><font color="red" size=5>Sign up</font></legend><br>
							<table width="400px" height="200px" cellpadding="2px" cellspacing="5px">
							<tr><td colspan="2"><font color="red"><label id="registerText"></label></font></td></tr>
							<tr><td>First Name</td><td><input type="text" name="fname"></td></tr>
							<tr><td>Middle Name</td><td> <input type="text" name="mname"></td></tr>
							<tr><td>Last Name</td><td><input type="text" name="lname"></td></tr>
							<tr><td>Username</td><td><input type="text" name="uname"></td></tr>
							<tr><td>Password</td><td><input type="password" name="pass"></td></tr>
							<tr><td>Re-Enter Password</td><td><input type="password" name="rpass"></td></tr>
							<tr><td>E-Mail</td><td><input type="text" name="email"></td></tr>
							<tr><td>Gender</td><td><input type="radio" name="gender" value="Male" >Male</td></tr>
							<tr><td></td><td><input type="radio" name="gender" value="Female">Female</td></tr>
							<tr><td>Mobile Number</td><td><input type="text" name="mobile"></td></tr>
							<tr><td>Birth Date</td><td>
													<select name="bmonth"><option value="none">Month:
														<option value="01">Jan<option value="02">Feb<option value="03">March<option value="04">April
														<option value="05">May<option value="06">June<option value="07">July<option value="08">Aug
														<option value="09">Sept
														<option value="10">Oct<option value="11">Nov<option value="12">Dec
													</select>
													<select name="bday"><option value="none">Day:
														<option value="01">1<option value="02">2<option value="03">3<option value="04">4
														<option value="05">5<option value="06">6<option value="07">7<option value="08">8
														<option value="09">9<option value="10">10<option value="11">11<option value="12">12
														<option value="13">13<option value="14">14<option value="15">15<option value="16">16
														<option value="17">17<option value="18">18<option value="19">19<option value="20">20
														<option value="21">21<option value="22">22<option value="23">23<option value="24">24
														<option value="25">25<option value="26">26<option value="27">27<option value="28">28
														<option value="29">29<option value="30">30<option value="31">31
													</select>
													<select name="byear"><option value="none">Year:
														<option value="2013">2013<option value="2012">2012<option value="2011">2011<option value="2010">2010
														<option value="2009">2009<option value="2008">2008<option value="2007">2007<option value="2006">2006
														<option value="2005">2005<option value="2004">2004<option value="2003">2003<option value="2002">2002
														<option value="2001">2001<option value="2000">2000<option value="1999">1999<option value="1998">1998
														<option value="1997">1997<option value="1996">1996<option value="1995">1995<option value="1994">1994
														<option value="1993">1993<option value="1992">1992<option value="1991">1991<option value="1990">1990
														<option value="1989">1989<option value="1988">1988<option value="1987">1987<option value="1986">1986
														<option value="1985">1985<option value="1984">1984<option value="1983">1983<option value="1982">1982
														<option value="1981">1981<option value="1980">1980<option value="1979">1979<option value="1978">1978
														<option value="1977">1977<option value="1976">1976<option value="1975">1975<option value="1974">1974
														<option value="1973">1973<option value="1972">1972<option value="1971">1971<option value="1970">1970
													</select></td></tr>
							
							<tr><td>Company Name</td><td><input type="text" name="cmpName"></td></tr>
							<tr><td>Company ID</td><td><input type="text" name="cmpID"></td></tr>
							<tr><td>Branch Location Name</td><td><input type="text" name="branchName"></td></tr>
							<tr><td>Branch Location ID</td><td><input type="text" name="branchID"></td></tr>
							<tr><td align="right"><input class="button" type="submit" name="signup" value="Sign Up"></td>
							<td align="center"><input class="button" type="button" name="reset" value="Reset"></td></tr>
							<tr align="center"><td colspan="2"><br><font color="green">Already have an account?</font>
																	 <a href="index.jsp">Login</a></td></tr>
							</table>	
						</fieldset>
					</td>
				</tr>
			</table>
			</form>	
			</font>
		</div>
</body>
</html>