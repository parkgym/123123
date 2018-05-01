<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="board.*"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="article" scope="page" class="board.BoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	String pageNum = request.getParameter("pageNum");
	BoardDBBean dbPro = BoardDBBean.getInstance();
	int check = dbPro.updateArticle(article);
	
	if(check == 1) {
%>
<script type="text/javascript">
	location.href="list.jsp?pageNum=<%= pageNum %>";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	history.go(-1);
</script>
<%	
	}
%>
