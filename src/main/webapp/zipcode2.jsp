<%@ page contentType = "text/html; charset=UTF-8" %>

<SCRIPT LANGUAGE="Javascript">
function zipsubmit(){
	if (document.zipform.fdong.value == "") {
		alert("'동' 이름이 비어있습니다");
		document.zipform.fdong.focus();
		return;
	}
	document.zipform.submit();
}
</SCRIPT>    

<HTML>
<HEAD>
<TITLE> 우편번호 검색 </TITLE>
</HEAD>
<BODY>
     
<FORM name="zipform" method="post" action="zipcode3.jsp">

<BR><BR>
	<TABLE border="1" align="center">
	<TR>
		<TD width="430" height=20 align="center">
			<FONT size=2>찾는 주소의 <b>'동'</b> 이름을 입력하세요.</FONT>
		</TD>
	</TR>
	<TR>
		<TD width="430" height=50 align="center">
			<FONT size=2>주 소 ('동' 이름)  : 
			<INPUT type="text" name="fdong" value="" size="12">
			<INPUT type="button" value="검색" onclick="zipsubmit()">
			<BR></FONT>
		</TD>
	</TR>
	</TABLE>


</FORM>

<TABLE border="0" cellpadding="0" cellspacing="0" width="430" align="center">
	<TR>
		<TD align="center" width="430"><a href=javascript:close()>[닫 기]</a></TD>
	</TR>
</TABLE>

</BODY>
</HTML>