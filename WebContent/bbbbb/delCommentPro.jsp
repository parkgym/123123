<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	int content_num = Integer.parseInt(request.getParameter("content_num"));
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	//System.out.println(content_num+"&"+comment_num);
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	//System.out.println(request.getParameter("passwd"));
	
	CommentDBBean cmtPro = CommentDBBean.getInstance();
	int check = cmtPro.deleteComment(content_num, passwd, comment_num);
	
	if(check == 1) {
		//System.out.print(check);
%>
<script type="text/javascript">
	location.href="content1.jsp?num=<%= content_num %>&pageNum=<%=comment_num %>";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<%	
	}
%>