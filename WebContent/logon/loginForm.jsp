<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ include file="./color.jsp" %>
<%@ page import = "util.CookieBox" %>
<html>
<head>
<title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
  <script language="javascript">
  <!--
    function begin(){
	  document.myform.id.focus();
  }
  function checkIt(){
	  if(!document.myform.id.value){
		  alert("이름을 입력하지 않으셨습니다.");
		  document.myform.id.focus();
		  return false;
	  }
	  if(!document.myform.passwd.value){
		  alert("비밀번호를 입력하지 않으셨습니다.");
		  document.myform.passwd.focus();
		  return false;
	  }
  }
  -->
  
  </script>
</head>
<body onload="begin()" bgcolor="<%=bodyback_c%>">
<%
  CookieBox cookieBox = new CookieBox(request);
%>
<form name="myform" action="loginPro.jsp" method="post" onSubmit="return checkIt()">

<TABLE cellSpacing=1 cellPadding=1 width="260" border=1 align="center">
  <TR height="30">
    <TD colspan="2" align="middle" bgcolor="<%= title_c%>"><STRONG>회원로그인</STRONG></TD></TR>
  <TR height="30">
<%
 if(cookieBox.exists("ID")){
%>
    <TD width="110" bgcolor="<%= title_c %>" align=center>">아이디</TD>
    <TD width="150" bgcolor="<%= value_c %>" align=center>
      <INPUT type="text" name="id" size="15" maxlength="12" value="<%= cookieBox.getValue("ID") %>"></TD></TR>
<%}else{ %>
    <TD width="110" bgcolor="<%= title_c %>" align=center>아이디</TD>
    <TD width="150" bgcolor="<%= value_c %>" align=center>
      <INPUT type="text" name="id" size="15" maxlength="12"></TD></TR>
<% } %>
  <TR height="30">
    <TD width="110" bgcolor="<%= title_c %>" align=center>비밀번호</TD>
    <TD width="150" bgcolor="<%= value_c %>" align=center>
      <INPUT type=password name="passwd" size="15" maxlength="12"></TD></TR>
  <TR height="30">
    <TD colspan="2" align="middle" bgcolor="<%=title_c %>">
      <INPUT type=submit value="로그인">
      <INPUT type=reset value="다시입력">
      <input type="button" value="회원가입" onclick="javascript:window.location='inputForm.jsp'"></TR>
      <input type="checkbox" name="save" value="true">id저장</TD>
</TABLE>
</form>
</body>
</html>