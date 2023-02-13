<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<HTML>
<HEAD>
<TITLE> 회원 등록 성공 </TITLE> 
</HEAD>

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	         {font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

<%
String id = request.getParameter("id");
String pass = request.getParameter("pass"); 
String name = request.getParameter("name");
String juminnum1 = request.getParameter("juminnum1");
String juminnum2 = request.getParameter("juminnum2");
String zip = request.getParameter("zip");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

String check_ok = "yes";

if (id == "")
	check_ok = "no";

if (pass == "")
	check_ok = "no";

if (name == "")
	check_ok = "no";

if (juminnum1 == "")
	check_ok = "no";

if (juminnum2 == "")
	check_ok="no";

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://127.0.0.1:3306/Test";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url,"root","1234");

Statement stmt = conn.createStatement();

String strSQL = "SELECT id FROM tblmember where id='" + id + "'";
ResultSet rs = stmt.executeQuery(strSQL);

if (!rs.next())
	check_ok="yes";
else
	check_ok="no";

if (check_ok == "yes"){
	strSQL = "INSERT INTO tblmember(id,pass,name,juminnum1, juminnum2,zip,address1,address2,phone,email)";
	strSQL = strSQL +  "VALUES('" + id + "', '" + pass + "', '" + name + "', '" + juminnum1 + "',";
	strSQL = strSQL +  "'" + juminnum2 + "', '" + zip + "', '" + address1 + "',"; 
        strSQL = strSQL +  "'" + address2 + "', '" + phone + "', '" + email + "')";
	stmt.executeUpdate(strSQL);
%>

<BODY>

<center><font size='3'><b> 회원 가입 성공 </b></font>  
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>회원 가입을 축하합니다.<BR>로그인 하세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="member.jsp">[로그인]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>

<%
} else {
%>

<HTML>
<HEAD>
<TITLE> 회원 가입 실패 </TITLE> 
</HEAD>

<BODY>

<center><font size='3'><b> 회원 가입 실패 </b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
<TR>
	<TD align='center'>
		<font size='2'>회원 가입에 실패 했습니다. <BR>다시 가입서를 작성해 주세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
		<font size='2'><a href="member_input.jsp">[가입서 작성]</a></font>
	</TD>
</TR>
</TABLE>

</BODY>
</HTML>
<%
}

stmt.close();
conn.close();
%>
