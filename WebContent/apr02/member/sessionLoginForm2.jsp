<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "util.CookieBox" %>
<html>
<head>
<title>로그인 폼</title>
</head>
<body>
<%
  CookieBox cookieBox = new CookieBox(request);
%>
<form action="<%= request.getContextPath() %>/apr02/member/sessionLogin2.jsp"
method="post">
<%
  if(cookieBox.exists("ID")){
%>
아이디 <input type="text" name="id" size="10" value="<%= cookieBox.getValue("ID") %>">
<% }else{ %>
아이디 <input type="text" name="id" size="10">
<%} %>
암호 <input type="password" name="password" size="10">
<%
  if(cookieBox.exists("ID")){
%>
아이디 저장 <input type="checkbox" name="save" value="true" checked>
<% }else{ %>
아이디 저장 <input type="checkbox" name="save" value="true">
<% } %>
<input type = "submit" value="로그인">
</form>
</body>
</html>