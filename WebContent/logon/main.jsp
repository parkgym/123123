<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ include file="./color.jsp" %>
<%@ page import = "util.CookieBox" %>
<html>
<head>
<title>메인입니다.</title>
<link href="style.css" rel="stylesheet" type="text/css">
<%
try{
	if(session.getAttribute("memId")==null){
%>
<script language="javascript">
<!--
function focusIt()
{
  document.inform.id.focus();	
}

function checkIt()
{
  inputForm=eval("document.inform");
  if(!inputForm.id.value){
	  alert("아이디를 입력하세요..");
inputForm.id.focus();
return false;
  }
  if(!inputForm.passwd.value){
	  alert("비밀번호를 입력하세요..");
inputForm.passwd.focus();
return false;
  }
}
//-->
</script>
</head>

<body onLoad="focusIt();" bgcolor="<%= bodyback_c %>">
<%
  CookieBox cookieBox = new CookieBox(request);
%>
  <table width=500 cellpadding="0" cellspacing="2" align="center" border="1">
    <tr>
      <td width="300" bgcolor="<%= bodyback_c %>" height="20">
      &nbsp;
      </td>
      <form name="inform" method="post" action="loginPro.jsp" onSubmit="return checkIt();">
      <%
 if(cookieBox.exists("ID")){
%> 
      <td bgcolor="<%=title_c %>" width="100" align="right">아이디</td>
      <td width="100" bgcolor="<%= value_c %>">
        <input type="text" name="id" size="15" maclength="10" value="<%= cookieBox.getValue("ID") %>"></td>
<% } else { %>
      <td bgcolor="<%=title_c %>" width="100" align="right">아이디</td>
      <td width="100" bgcolor="<%= value_c %>">
        <input type="text" name="id" size="15" maclength="10" ></td>
<% } %>
    </tr>
    <tr>
      <td rowspan="3" bgcolor="<%= bodyback_c %>" width="300" > 메인입니다.</td>
      <td bgcolor="<%= title_c %>" width="100" align="right"> 패스워드</td>
      <td width="100" bgcolor="<%= value_c %>">
        <input type="password" name="passwd" size="15" maxlength="10"></td>
    </tr>
    <tr>
      <td colspan="3" bgcolor="<%= title_c %>" align="center">
        <input type="submit" name="Submit" value="로그인">
        <input type="button" value="회원가입" onclick="javascript:window.location='inputForm.jsp'">
        <input type="checkbox" name="save" value="true">id저장
        </td></tr>
    <tr>
      <td colspan="3" bgcolor="<%= title_c %>" align="center">
        <input type="button" value="id/pass찾기" onclick="javascript:window.location='find.jsp'">
      </td></form></table>
    </tr>
      <%}else{ %>
        <table width=500 cellpadding="0" cellspacing="0" align="center" border="1" >
          <tr>
            <td width="300" bgcolor="<%= bodyback_c %>" height="20">네이버</td>
            <td rowspan="3" bgcolor="<%= value_c %>" align="center">
              <%= session.getAttribute("memId") %> 님이 <br>
              방문하셨습니다.
        <form method="post" action="logout.jsp">
          <input type="submit" value="로그아웃">
          <input type="button" value="회원정보변경" onclick="javascript:window.location='modify.jsp'">
        </form>
      </td>
    </tr>
    <tr>
      <td rowspan="2" bgcolor="<%= bodyback_c %>" width="300" >메인입니다. </td>
    </tr>  
  </table> 
  <br>
<% }
} catch(NullPointerException e){}
%>
</body>

</html>