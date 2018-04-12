<%@ page contentType="text/html; charset=EUC-KR" %>
<%
  Cookie cookie = new Cookie("oneh", "1minute");
  cookie.setMaxAge(60 * 1);
  response.addCookie(cookie);
%>
<html>
<head>
<title>쿠키 유효 시간 설정</title>
</head>
<body>
유효 시간이 1분인 oneh 쿠키 생성.
</body>
</html>