<%@ page contentType="text/html; charset=EUC-KR" %>
<%
  String id = request.getParameter("memberId"); 
  if(id.equals("KH10")){
	  response.sendRedirect("/KH10/mar28/now.jsp");
  } else {
%>
<html>
<head>
<title>로그인 실패</title>
</head>
<body>
아이디가 KH10이 아닙니다.
</body>
</html>
<%
  }
%>