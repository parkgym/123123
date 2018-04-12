<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.net.URLEncoder" %>
<%
  Cookie cookie = new Cookie("name",URLEncoder.encode("최범균","euc-kr"));
  response.addCookie(cookie);
%>
<html>
<head>
<title>쿠키 생성</title>
</head>
<body>

<%= cookie.getName() %> 쿠키의 값 = "<%= cookie.getValue() %>"
</body>
</html>