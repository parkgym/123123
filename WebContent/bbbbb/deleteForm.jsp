<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>�ۻ���</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<div id="wrap">
	<div id="header"><h1>�ۻ���</h1></div>
	<form name="delForm" action="deletePro.jsp?pageNum=<%= pageNum %>" onsubmit="return deleteSave()">
		<input type="hidden" name="num" value="<%= num %>" />
		<div id="content">
			<div class="delForm">
				<p>��й�ȣ�� �Է����ּ���.</p>
				<dl>
					<dt>��й�ȣ</dt>
					<dd><input type="text" name="passwd" /></dd>
				</dl>
			</div>
		</div>
		<div id="footer" class="deleteBtn">
			<input type="submit" value="�ۻ���" />
			<input type="button" value="���" onclick="javascript:window.location='list.jsp?pageNum=<%= pageNum %>'" />
		</div>
	</form>
</div>	
</body>
</html>