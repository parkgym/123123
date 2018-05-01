<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>�ۼ���</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try {
		BoardDBBean dbPro = BoardDBBean.getInstance();
		BoardDataBean article = dbPro.updateGetArticle(num);
%>
<div id="wrap">
	<div id="header"><h1>�ۼ���</h1></div>
	<form name="writeform" method="post" action="updatePro.jsp?pageNum=<%= pageNum %>" onsubmit="return writeSave()">
		<div id="content">
			<table>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>�ۼ���</th>
					<td>
						<input type="text" name="writer" value="<%= article.getWriter() %>" />
						<input type="hidden" name="num" value="<%=article.getNum()%>" />
					</td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="text" name="subject" value="<%= article.getSubject() %>" /></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" name="email" value="<%= article.getEmail() %>" /></td>
				</tr>
				<tr>
					<th>����</th>
					<td><textarea name="content"><%= article.getContent() %></textarea></td>
				</tr>
				<tr>
					<th>��й�ȣ</th>
					<td><input type="password" name="passwd" /></td>
				</tr>	
			</table>
		</div>
		<div id="footer">
			<input type="submit" value="�ۼ���" />
			<input type="reset" value="�ٽ��ۼ�" />
			<input type="button" value="���" onclick="javascript:window.location='list.jsp?<%= pageNum %>'" />
		</div>
	</form>
<%
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
	
</div>
</body>
</html>