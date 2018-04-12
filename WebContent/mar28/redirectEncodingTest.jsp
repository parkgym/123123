<%@ page import = "java.net.URLEncoder" %>
<%@ page pageEncoding="euc-kr" %>
<%
  String value = "자바";
  String encodedValue = URLEncoder.encode(value, "euc-kr");
  response.sendRedirect("/KH10/mar28/now.jsp?name=" + encodedValue);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>