<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page session="false" %>
<%@ taglib prefix="elfunc" uri="/WEB-INF/el-functions.tld" %>
<%
  java.util.Date today = new java.util.Date();
  request.setAttribute("today", today);
%>
<html>
<head>
<title>EL �Լ� ȣ��</title>
</head>
<body>

������ <b>${elfunc:dateFormat(today) }</b>�Դϴ�.

</body>
</html>