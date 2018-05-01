<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="sul.boardr.ReadArticleService" %>
<%@ page import="sul.boardr.ArticleNotFoundException" %>
<%@ page import="sul.boardr.Article" %>
<%
  int articleId = Integer.parseInt(request.getParameter("articleId"));
  String viewPage = null;
  try{
	  Article article = ReadArticleService.getInstance().readArticle(articleId);
	  request.setAttribute("article", article);
	  viewPage = "read_view.jsp";
  } catch(ArticleNotFoundException ex){
	  viewPage = "article_not_found.jsp";
  }
%>
<jsp:forward page="<%= viewPage %>"/>