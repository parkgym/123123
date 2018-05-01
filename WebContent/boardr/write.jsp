<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="sul.boardr.WriteArticleService" %>
<%@ page import="sul.boardr.Article" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="writingRequest"
 class="sul.boardr.WritingRequest" />
<jsp:setProperty name="writingRequest" property="*" />
<%
  Article postedArticle = 
  WriteArticleService.getInstance().write(writingRequest);
  request.setAttribute("postedArticle", postedArticle);
%>
<html>
<head>
<title>�Խñ� �ۼ�</title>
</head>
<body>
�Խñ��� ����߽��ϴ�.
<br/>
<a href="<c:url value='list.jsp'/>">��Ϻ���</a>
<a href="<c:url value='read.jsp?articleId=${postedArticle.id }'/>">�Խñ� �б�</a>
</body>
</html>