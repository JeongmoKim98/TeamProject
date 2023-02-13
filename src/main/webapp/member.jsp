<%@ page contentType = "text/html; charset=UTF-8" %>

<HTML>
<HEAD>
<TITLE>회원 인증</TITLE> 

<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:blue;text-decoration:none;}
	a:visited	{font-family:"";color:blue;text-decoration:none;}
	a:hover		{font-family:"";color:blue;text-decoration:underline;}
-->
</style>

<SCRIPT language="JavaScript">
function Check()
{
if (Member.id.value.length < 1){
	alert("아이디를 입력하세요.");
	Member.id.focus();
	return false;
}

if (Member.pass.value.length < 1){
	alert("비밀번호를 입력하세요.");
	Member.pass.focus();
	return false;
}
Member.submit();
} 
</SCRIPT>

</HEAD>

<BODY>

<center><font size='3'><b> 회원 인증 </b></font>   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>


<FORM Name='Member' Method='post' Action='member_ok.jsp'>

<TABLE align=center width='300' border='0' cellpadding='10' cellspacing='0'>
<TR>
	<TD bgcolor='cccccc' align='right'>
		<font size='2'>ID :</font>
	</TD>
	<TD bgcolor='cccccc' align='center'>
		<input type=text maxlength=10 size=10 name=id>
	</TD>
	<TD bgcolor='cccccc' align='left'>
		<input onclick='Check()' type='button' value='로그인'>
	</TD>
</TR>
<TR>
	<TD bgcolor='cccccc' align='right'>
		<font size='2'>비밀번호 :
	</TD>
	<TD bgcolor='cccccc' align='center'>
		<input type='password' maxlength='10' size='10' name='pass'>
	</TD>
	<TD bgcolor='cccccc'>
		<font size='2'>
		<a href="member_input.jsp">[회원가입]</a></font>
	</TD>
</TR>

</TABLE>

</FORM>

</BODY>
</HTML>
