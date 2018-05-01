<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="sul.boardr.ReplyArticleService" %>
<%@ page import="sul.boardr.Article" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="replyingRequest" class="sul.boardr.ReplyingRequest" />
<jsp:setProperty name="replyingRequest" property="*" />
<%
  String viewPage = null;
  try{
	  Article postedArticle = ReplyArticleService.getInstance().
			  reply(replyingRequest);
	  request.setAttribute("postedArticle", postedArticle);
	  viewPage = "reply_success.jsp";
  } catch(Exception ex){
	  viewPage = "reply_error.jsp";
	  request.setAttribute("replyException", ex);
  }
%>
<jsp:forward page="<%=viewPage %>"/>