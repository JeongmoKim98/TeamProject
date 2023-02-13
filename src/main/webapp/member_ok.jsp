<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<HTML>
<HEAD>
<TITLE> 회원 인증 </TITLE> 
</HEAD>

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	         {font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

<BODY>

<center><font size='3'><b> 회원 인증 </b></font>   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<TABLE cellSpacing='0' cellPadding='30' align='center' border='0' >
	
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String sessionID = "yes";

try{

if (id == "" || pass == "") {
%>
<TR>
	<TD align='center'>
	<font size=2>ID와 비밀번호를 입력하세요.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href="member.jsp">[로그인]</a>
	</TD>
</TR>
<%
} else {
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://127.0.0.1:3306/Test";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"root","1234");
	
	Statement stmt = conn.createStatement();

	String strSQL = "SELECT * FROM tblmember where id='" + id + "'";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	rs.next();
	
	String logid = rs.getString("id");
	String logpass = rs.getString("pass");

	if (!id.equals(logid)){
%>
<TR>
	<TD align="center">
	<font size='2'>회원 ID가 아닙니다.</font>
	</TD>
</TR>
<TR>
	<TD align="center">
	<a href="member.jsp">[로그인]</a>
	</TD>
</TR>
<%
	} else { 
		if (!pass.equals(logpass)){
%>

<TR>
	<TD align='center'>
	<font size=2>비밀번호가 일치하지 않습니다.</font>
	</TD>
</TR>
<TR>
	<TD align='center'>
	<a href="member.jsp">[로그인]</a>
	</TD>
</TR>

<%
		} else {
			session.setAttribute("user",sessionID);
			response.sendRedirect("member_homepage.jsp");
		}
	}	
}

} catch(Exception e){
%>
<TR>
	<TD align="center">
	<font size='2'>회원 ID가 아닙니다.</font>
	</TD>
</TR>
<TR>
	<TD align="center">
	<a href="member.jsp">[로그인]</a>
	</TD>
</TR>

<%
}
%>

</TABLE>

</BODY>
</HTML>
