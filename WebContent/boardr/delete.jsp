<%@ page contentType="text/html; charset=EUC-KR" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="sul.boardr.DeleteArticleService" %>
<jsp:useBean id="deleteRequest" class="sul.boardr.DeleteRequest" />
<jsp:setProperty name="deleteRequest" property="*"/>
<%
  String viewPage = null;
  try{
	  DeleteArticleService.getInstance().deleteArticle(deleteRequest);
	  viewPage = "delete_success.jsp";
  } catch (Exception ex){
	  request.setAttribute("deleteException", ex);
	  viewPage = "delete_error.jsp";
  }
%>
<jsp:forward page="<%= viewPage %>"/>