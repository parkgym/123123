<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page errorPage="errorView.jsp" %>
<%@ page import="ssol.Message" %>
<%@ page import="ssol.service.WriteMessageService" %>
<%
  request.setCharacterEncoding("euc-kr");
 %>
 <jsp:useBean id="message" class="ssol.Message">
   <jsp:setProperty name="message" property="*" />
 </jsp:useBean>
 <%
   WriteMessageService writeService = WriteMessageService.getInstance();
   writeService.write(message);
 %>
<html>
<head>
<title>���� �޽��� ����</title>
</head>
<body>
���Ͽ� �޽����� ������ϴ�.
<br/>
<a href="list.jsp">[��� ����]</a>
</body>
</html>