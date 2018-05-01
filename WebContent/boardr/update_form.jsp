<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="sul.boardr.ReadArticleService" %>
<%@ page import="sul.boardr.Article" %>
<%@ page import="sul.boardr.ArticleNotFoundException" %>
<%
  String viewPage = null;
  try{
	  int articleId = Integer.parseInt(request.getParameter("articleId"));
	  Article article = ReadArticleService.getInstance().getArticle(articleId);
	  viewPage = "update_form_view.jsp";
	  request.setAttribute("article", article);
  } catch (ArticleNotFoundException ex){
	  viewPage = "article_not_found.jsp";
  }
%>
<jsp:forward page="<%= viewPage %>"/>