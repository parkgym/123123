<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Calendar Ŭ���� ���</title>
</head>
<body>
<%
  java.util.Calendar cal = java.util.Calendar.getInstance();
%>
������
  <%= cal.get(java.util.Calendar.YEAR) %>��
  <%= cal.get(java.util.Calendar.MONTH) %>��
  <%= cal.get(java.util.Calendar.DATE) %>��
�Դϴ�.
</body>
</html>