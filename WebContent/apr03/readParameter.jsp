<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page errorPage = "./error/viewErrorMessage.jsp" %>
<html>
<head>
<title>�Ķ���� ���</title>
</head>
<body>

name �Ķ���� ��: <%= request.getParameter("name").toUpperCase() %>

</body>
</html>