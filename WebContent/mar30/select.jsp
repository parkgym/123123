<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>�ɼ� ���� ȭ��</title>
</head>
<body>

<form action="<%= request.getContextPath() %>/mar30/view.jsp">
<form action="view.jsp">

���� ���� ������ ����:
  <select name="code">
    <option value="A">A������</option>
    <option value="B">B������</option>
    <option value="C">C������</option>
  </selct>
  
<input type="submit" value="�̵�">

</form>
</body>
</html>