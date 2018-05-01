<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="sul.boardr.UpdateArticleService" %>
<%@ page import="sul.boardr.Article" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="updateRequest" class="sul.boardr.UpdateRequest"/>
<jsp:setProperty name="updateRequest" property="*" />
<%
  String viewPage = null;
  try{
	  Article article = UpdateArticleService.getInstance().update(updateRequest);
	  request.setAttribute("updatedArticle", article);
	  viewPage = "update_success.jsp";
  } catch (Exception ex){
	  request.setAttribute("updateException", ex);
	  viewPage = "update_error.jsp";
  }
%>
<jsp:forward page="<%=viewPage %>"/>