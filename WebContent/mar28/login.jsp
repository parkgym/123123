<%@ page contentType="text/html; charset=EUC-KR" %>
<%
  String id = request.getParameter("memberId"); 
  if(id.equals("KH10")){
	  response.sendRedirect("/KH10/mar28/now.jsp");
  } else {
%>
<html>
<head>
<title>�α��� ����</title>
</head>
<body>
���̵� KH10�� �ƴմϴ�.
</body>
</html>
<%
  }
%>