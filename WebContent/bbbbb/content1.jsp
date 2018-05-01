<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="board.*" %>
<%@ page import="java.util.*" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm");
	
	try{
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.getArticle(num);
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>�ۺ���</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<div id="wrap">
	<div id="header"><h1>�ۺ���</h1></div>
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
					<th>�۹�ȣ</th>
					<td><%= article.getNum() %></td>
					<th>��ȸ��</th>
					<td><%= article.getReadcount() %></td>
				</tr>
				<tr>
					<th>�ۼ���</th>
					<td><%= article.getWriter() %></td>
					<th>�ۼ���</th>
					<td><%= sdf.format(article.getReg_date()) %></td>
				</tr>
				<tr>
					<th>����</th>
					<td colspan="3"><%= article.getSubject() %></td>
				</tr>
				<tr>
					<th>����</th>
					<td colspan="3"><textarea name="content"><%= article.getContent() %></textarea></td>
				</tr>		
			</table>
		</div>
		<div id="footer">
			<input type="button" value="�ۼ���" onclick="javascript:window.location='updateForm.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>'" />
			<input type="button" value="�ۻ���" onclick="javascript:window.location='deleteForm.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>'"/>
			<input type="button" value="��۾���" onclick="javascript:window.location='writeFrom.jsp?num=<%= num %>&ref=<%= ref %>&re_step=<%= re_step %>&re_level=<%= re_level %>'" />
			<input type="button" value="���" onclick="javascript:window.location='list.jsp?<%= pageNum %>'" />
		</div>
<%
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
	</form>
</div>

</body>
</html>