<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	BoardDBBean dbPro = BoardDBBean.getInstance();
	int check = dbPro.deleteArticle(num, passwd);
	
	if(check == 1) {
%>
<script type="text/javascript">
	location.href= "list.jsp?pageNum=<%= pageNum %>";
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
