<%@ page contentType="text/html; charset=EUC-KR" %>
<%
  Cookie cookie = new Cookie("oneh", "1minute");
  cookie.setMaxAge(60 * 1);
  response.addCookie(cookie);
%>
<html>
<head>
<title>��Ű ��ȿ �ð� ����</title>
</head>
<body>
��ȿ �ð��� 1���� oneh ��Ű ����.
</body>
</html>