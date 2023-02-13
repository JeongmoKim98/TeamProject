<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8"); 
%>
<%--사용자가 선택한 우편번호와 전체 주소를 처음 페이지에 넘겨준다.--%>
<SCRIPT language="JavaScript">
function strData(fzip, fadd) {
	opener.document.Member_Input.zip.value = fzip; 
	opener.document.Member_Input.address1.value = fadd;
	opener.document.Member_Input.address2.focus();
	window.close();
}
	
</SCRIPT>

<HTML>
<HEAD>
<TITLE> 우편번호 검색 </TITLE>
</HEAD>
<BODY>
<FORM>
<CENTER>
<TABLE border="1">
<%
String fdong = request.getParameter("fdong"); 

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://127.0.0.1:3306/Test";

Class.forName(driver);

try {
	Connection conn = DriverManager.getConnection(url,"root","1234");
	Statement stmt = conn.createStatement();
	
	// 우편번호 테이블 tblZipCode에서 검색어에 해당하는 '동'의 전체주소를 검색한다.
	String strSQL = "SELECT * FROM tblZipCode where 읍면동 like '%" + fdong + "%'";
	ResultSet rs = stmt.executeQuery(strSQL);
	
	// 쿼리문으로 검색된 결과가 없을 경우 아래와 같은 문장을 출력한다.
	if(!rs.next()) {
%>
	<TR>
		<TD align="center"><FONT size="2">찾는 주소가 없습니다.</FONT></TD>
	</TR> 
<%
	} else {
%> 
	
	<TR>
		<TD align="center" colspan="3">
		우편번호 검색 완료 
		</TD>
	</TR>
	<TR>
		<TD align="center"> 우편번호 </TD>
		<TD align="center"> 주 소 </TD>
		<TD align="center"> 선 택 </TD>
	</TR>
<%
	}
	
	while(rs.next()) {

		String code = rs.getString("우편번호");
		String sido = rs.getString("시도");
		String gungu = rs.getString("시군구");
		String dong = rs.getString("읍면동");
		String bungi = rs.getString("번지");
		
		// 전체주소에서 null문자를 제거해 준다.
		String address = sido+" "+gungu+" "+dong+" "+bungi;
		address = address.replaceAll("null", "");
%>
	<TR>
		<TD align="center"><FONT size=2><%= code%></FONT></TD>
		<TD><FONT size=2>&nbsp;<%= address%></FONT></TD>
		<TD align="center"><INPUT type=button value="선택" onClick ="strData('<%= code%>', '<%= sido%>&nbsp;<%= gungu%>&nbsp;<%= dong%>')"></TD>
	</TR>
<%
	}

	rs.close();
	stmt.close();
	conn.close();
	
} catch (Exception ex) {  }
%>
</TABLE>
</FORM><P>

<TABLE>
<TR>
	<TD><a href="zipcode2.jsp">[다시 검색하기]</a></TD>
	<TD><a href=javascript:close()>[닫 기]</a></TD>
</TR>
</TABLE>
</CENTER>
</BODY>
</HTML> 
