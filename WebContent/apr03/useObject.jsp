<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="member" scope="request" class="member.MemberInfo" />
<html>
<head>
<title>�λ縻</title>
</head>
<body>
<%= member.getName() %> (<%= member.getId() %>)ȸ����
�ȳ��ϼ���.

</body>
</html>