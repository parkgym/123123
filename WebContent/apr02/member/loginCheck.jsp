<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "util.CookieBox" %>
<%
  CookieBox cookieBox = new CookieBox(request);
  boolean login = cookieBox.exists("LOGIN") &&  
		  cookieBox.getValue("LOGIN").equals("SUCCESS");
%>
<html>
<head>
<title>�α��� ���� �˻�</title>
</head>
<body>
<%
  if(login){
%>
���̵� "<%= cookieBox.getValue("ID") %>"�� �α��� �� ����
<%
  }else{
%>
�α������� ���� ����
<%
  }
%>
</body>
</html>