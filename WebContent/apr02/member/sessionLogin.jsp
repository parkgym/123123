<%@ page contentType="text/html; charset=EUC-KR" %>
<%
  String id = request.getParameter("id");
  String password = request.getParameter("password");
  
  if(id.equals(password)){
	  session.setAttribute("MEMBERID", id);
%>
<html>
<head>
<title>�α��� ����</title>
</head>
<body>

�α��ο� �����߽��ϴ�.

</body>
</html>
<%
  } else{ //�α��� ���н�
%>
<script>
alert("�α��ο� �����Ͽ����ϴ�.");
history.go(-1);
</script>
<%
  }
%>