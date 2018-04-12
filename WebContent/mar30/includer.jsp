<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>include 디렉티브</title>
</head>
<body>

<%
  int number = 10;
%>

<%@ include file="/mar30/includee.jspf" %>

공통변수 DATAFOLDER = "<%= dataFolder %>"
</body>
</html>