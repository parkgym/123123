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
<title>방명록 메시지 남김</title>
</head>
<body>
방명록에 메시지를 남겼습니다.
<br/>
<a href="list.jsp">[목록 보기]</a>
</body>
</html>