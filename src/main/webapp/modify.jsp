<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<title> 게시판 </title>

<script language="JavaScript">
function Check()
{
if (Modify.name.value.length <1) {
	alert("작성자를 입력하세요.");
	Modify.name.focus();
		return false;
	}

if (Modify.pass.value.length <1){
	alert("비밀번호를 입력하세요.");
	Modify.pass.focus();
	return false;
	}
}
if (Modify.email.value.indexOf("@")+""== "-1"||
	Modify.email.value.indexOf(".")+""== "-1"||	
	Modify.email.value == "")
	{
		alert("E-mail을 입력하세요.");
		Modify.email.focus();
		return false;
	}
if (Modify.title.value.length <1){
	alert("글제목을 입력하세요.");
	Modify.title.focus();
	return false;
	}
	
if (Modify.contests.value.length < 1){
	alert("글내용을 입력하세요.");
	Modify.contents.focus();
	return false;
	}

Modify.submit();
}

function list()
{
location.href = "member_homepage.jsp";
}
	
</script>
</head>

<body>

<%
String num = request.getParameter("num");

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://127.0.0.1:3306/Test";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url,"root","1234");

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM tblboard WHERE num = ?";
pstmt = conn.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String name = rs.getString("name");
String email = rs.getString("email");
String title = rs.getString("title");
String contents = rs.getString("contents").trim();
String writedate = rs.getString("writedate");
int readcount = rs.getInt("readcount");
%>

<center><font size='3'><b> 게시판 글 수정 </b></font>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
	</TR>
</TABLE>

<FORM Name='Modify' Action ='modify_output.jsp' Method='POST' OnSubmit='return Check()'>
<input type='hidden' name='num' value='<%=num %>'>

<TABLE border='0' width='600'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성자</center></font>
		</TD>
		<TD>
			<p><input type='text' size='12' name='name' value="<%=name %>"> * 필수 </p>
		</TD>
	</TR>
	
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>비밀번호</center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'> * 필수 </p>
		</TD>
	</TR>
	
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='40' maxlength='50' name='email' value="<%=email %>"></font>
		</TD>
	</TR>
	
	<TR>
		<TD colspan='2'>
			<hr size='1' noshade>
		</TD>
	</TR>
	
	<TR>
		<TD width = '100' bgcolor='cccccc'>
			<font size='2'><cener><b>글 제목</b></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='title' value="<%=title %>"></font>
		</TD>
	</TR>
	
	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>글 내용</b></center></font>
		</TD>
		<TD>
			<font size='2'>
			<textarea cols='70' rows='15' wrap='virtual' name='contents'><%=contents %></textarea>
			</font>
		</TD>
	</TR>
	
	<TR>
		<TD colspan='2'><hr size='1' noshade></TD>
	</TR>
	
	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='200' align='center'>
					<input Type = 'Reset' Value = '다시 작성'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' Value = '수정완료'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Button' Value = '목록' Name='Page' onClick='list();'>
				</TD>
			</TR>
		</TABLE>
		</TD>	
	</TR>
	
</TABLE>

<%
}catch(SQLException e){
	out.print("SQL에러 "+ e.toString());
}catch(Exception ex){
	out.print("JSP에러 "+ ex.toString());
}finally{
	rs.close();
	pstmt.close();
	conn.close();
}
%>

</body>
</html>