<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<head>
<title> 게시판 삭제 </title>
<meta http-equiv='Contnet-Type' content='text/html; charset=UTF-8'>
<style ype='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>
</head>

<body>

<%
String num = request.getParameter("num");
%>

<center><font size='3'><b>비밀번호 확인</b></font>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
	</TR>
</TABLE>

<Form Action='delete_input.jsp' METHOD='post'>
<input type='hidden' name='num' value='<%=num %>'>

<TABLE border='0' width='300' align='center'>
	<TR>
		<TD align='center'>
			<font size=2><B>비밀번호</B></font>
		</TD>
		<TD>
			<input type='password' name='pass' size=20 maxlength=20>
			<input type='submit' value=' 확 인 ' style='background-color:cccccc; font-weight:bolder'>
		</TD>
	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
	</TR>
</TABLE>

<center><a href='member_homepage.jsp'>[목록 보기]</a></center>

</Form>

</body>
</HTML>