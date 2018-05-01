<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm");

	try {
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.getArticle(num);
		CommentDBBean cdb = CommentDBBean.getInstance();
		ArrayList comments = cdb.getComments(article.getNum());
		int count = cdb.getCommentCount(article.getNum());
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>글보기</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div id="wrap">
	<div id="header"><h1>글보기</h1></div>
	<form>
		<div id="content">	
			<table>
				<colgroup>
					<col width="20%" />
					<col width="*" />
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>글번호</th>
					<td><%= article.getNum() %></td>
					<th>조회수</th>
					<td><%= article.getReadcount() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%= article.getWriter() %></td>
					<th>작성일</th>
					<td><%= sdf.format(article.getReg_date()) %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%= article.getSubject() %></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea name="content"><%= article.getContent() %></textarea></td>
				</tr>		
			</table>
		</div>
		<div id="footer">
			<input type="button" value="글수정" onclick="javascript:window.location='updateForm.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>'" />
			<input type="button" value="글삭제" onclick="javascript:window.location='deleteForm.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>'"/>
			<input type="button" value="답글쓰기" onclick="javascript:window.location='writeFrom.jsp?num=<%= num %>&ref=<%= ref %>&re_step=<%= re_step %>&re_level=<%= re_level %>'" />
			<input type="button" value="목록" onclick="javascript:window.location='list.jsp?<%= pageNum %>'" />
		</div>
	</form>
		
	<div class="commentWrap">
		<form action="contentPro.jsp" method="post">
			<div class="commentWrite">
				<input type=hidden name=content_num value=<%=article.getNum() %> />
				<input type=hidden name=p_num value=<%=pageNum%> />
				<input type=hidden name=comment_num value=<%=count+1%> />
				<p class="writer">
					작성자 <input type="text" name="commenter" />
					비밀번호 <input type="password" name="passwd" />
				</p>
				<div class="commentCon">
					<textarea name="commentt"></textarea>
					<span><input type="submit" value="확인" /></span>
				</div>
			</div>
		</form>
		<% if(count > 0) { %>
		<div class="commentList">
			<p class="count">코멘트 수: <%= comments.size() %></p>
			<ul>
			<%
				for(int i = 0; i < comments.size(); i++) {
					CommentDataBean dbc = (CommentDataBean) comments.get(i);
			%>
				<li>
					<span class="writer"><%= dbc.getCommenter() %></span>님
					<span class="date">(<%= sdf.format(dbc.getReg_date()) %>)</span>
					<span class="ip">접속IP:<%=dbc.getIp() %></span>
					<span class="delBtn"><a href="delCommentForm.jsp?ctn=<%=dbc.getContent_num()%>&cmn=<%=dbc.getComment_num() %>" >X</a></span>
					<p><%= dbc.getCommentt() %></p>
					
				</li>
			<%
				}
			%>
			</ul>
		</div>
		<% } %>
	</div>
<%
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
	
</div>

</body>
</html>