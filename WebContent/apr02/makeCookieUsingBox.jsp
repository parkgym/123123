<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "util.CookieBox" %>
<%
  response.addCookie(CookieBox.createCookie("name", "최범균"));
  response.addCookie(CookieBox.createCookie("id", "madvirus","/KH10", -1));
%>
<html>
<head>
<title>사용 예</title>
</head>
<body>
CookieBox를 사용하여 쿠키 생성
</body>
</html>