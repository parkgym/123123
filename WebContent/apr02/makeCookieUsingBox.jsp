<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "util.CookieBox" %>
<%
  response.addCookie(CookieBox.createCookie("name", "�ֹ���"));
  response.addCookie(CookieBox.createCookie("id", "madvirus","/KH10", -1));
%>
<html>
<head>
<title>��� ��</title>
</head>
<body>
CookieBox�� ����Ͽ� ��Ű ����
</body>
</html>