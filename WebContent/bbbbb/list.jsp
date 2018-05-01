<%@page import="board.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>�۸��</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
<%
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");

	int searchn = 0;

	if (pageNum == null) {
		pageNum = "1";
	}
	//pagenum�� parameter������ �Ѿ���� �ʾҴٸ�, �� ù��° ��������.

	if (search == null) {
		search = "";
	} else {
		searchn = Integer.parseInt(request.getParameter("searchn"));
	}

	int currentPage = Integer.parseInt(pageNum);
	//System.out.println(currentPage);
	int startRow = (currentPage * 10) - 9;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;

	List articleList = null;
	BoardDBBean dbPro = BoardDBBean.getInstance();

	if (search.equals("") || search == null) {
		count = dbPro.getArticleCount();
	} else {
		count = dbPro.getArticleCount(searchn, search);
	}
	
	CommentDBBean cdb = CommentDBBean.getInstance();

	if (count > 0) {
		if (search.equals("") || search == null) {
			articleList = dbPro.getArticles(startRow, endRow);
		} else {
			articleList = dbPro.getArticles(startRow, endRow, searchn, search);
		}
	}

	number = count - (currentPage - 1) * pageSize;
%>
<div id="wrap">
	<div id="header"><h1>�۸��(��ü��:<span class="count"><%= count %></span>)</h1></div>
		
	<div id="content">
		<%
			if(count == 0) {
		%>
			<p class="noData">�ۼ��� ���� �����ϴ�.</p>
		<%
			} else {
		%>
		<table class="listForm">
			<colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="15%" />
				<col width="20%" />
				<col width="9%" />
				<col width="15%" />
			</colgroup>
			<tr>
				<th>��ȣ</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>�ۼ���</th>
				<th>��ȸ��</th>
				<th>IP</th>	
			</tr>
			<%
				for (int i = 0; i < articleList.size(); i++) {
					BoardDataBean article = (BoardDataBean)articleList.get(i);
					int com_count = cdb.getCommentCount(article.getNum());
			%>
			<tr class="listCon">
				<td><%= number-- %></td>
				<td class="subject">
					<%
						//int wid = 0;
						if(article.getRe_level() > 0) {	// �亯���̶��
						//wid = 5*(article.getRe_level());
					%>
						&nbsp;&nbsp;<span class="reply">��&nbsp;[re]</span>
					<% } else {} %>
					
					<% if(com_count > 0) { %>
							<a href="content.jsp?num=<%= article.getNum() %>&pageNum=<%= currentPage %>"><%= article.getSubject() %></a>
							&nbsp;<span class="cmtCount">[<%=com_count %>]</span>
					<% } else { %>
							<a href="content.jsp?num=<%= article.getNum() %>&pageNum=<%= currentPage %>"><%= article.getSubject() %></a>
					<% }
						if(article.getReadcount() >= 20) { %>
						<span class="icoHot">HIT</span>
					<% } else {} %>
				</td>
				<td><a href="mailto:<%= article.getEmail() %>"><%= article.getWriter() %></a></td>
				<td><%= sdf.format(article.getReg_date())%></td>
				<td><%= article.getReadcount() %></td>
				<td><%= article.getIp() %></td>
			</tr>
			<%
				}
			%>
			
		</table>
		<%
			}
		%>
		<div class="paging">
			<%
				if(count > 0) {
					// // ��ü ������ ���� ����
					int pageCount	= count / pageSize + (count % pageSize == 0 ? 0 : 1);
					int startPage	= (currentPage / 5) * 5 + 1;
					int pageBlock	= 5;
					int endPage		= startPage + pageBlock-1;
					if(endPage > pageCount) {
						endPage = pageCount;
					}
					if(startPage > 5) {
						//���� ������
						if(search.equals("") || search == null) {
			%>
							<a href="list.jsp?pageNum=<%= startPage-5 %>" class="spot">[����]</a>
			<%
						} else {
			%>
							<a href="list.jsp?pageNum=<%= startPage-5 %>&search=<%=search %>&searchn=<%=searchn %>" class="spot">[����]</a>
			<%			
						}
					}
			%>
				<ol>
			<%
				for(int i = startPage; i <= endPage; i++) {
				// �ش��������� �̵�	
					if(search.equals("") || search == null) {
			%>		
					<li><a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a></li>
			<% 
					} else { 
			%>		
					<li><a href="list.jsp?pageNum=<%= i %>&search=<%=search %>&searchn=<%=searchn %>">[<%= i %>]</a></li>
			<% 		} 
				}
			%>
				</ol>
			<%
					if(endPage < pageCount) {
						// ����������
						if(search.equals("") || search == null) {
			%>
							<a href="list.jsp?pageNum=<%= endPage+5 %>" class="spot">[����]</a>
			<%
						} else {
			%>
							<a href="list.jsp?pageNum=<%= endPage+5 %>&search=<%=search %>&searchn=<%=searchn %>" class="spot">[����]</a>
			<%
						}
			
					}	
				}
			%>
		</div>
	</div>
	<form>
		<div class="searchWarp">
			<select name="searchn">
				<option value="0">�ۼ���</option>
				<option value="1">����</option>
				<option value="2">����</option>
			</select>
			<input type="text" name="search" />
			<input type="submit" value="�˻�" class="btn" />
		</div>
	</form>
	<div id="footer">
		<input type="button" value="�۾���" onclick="javascript:window.location='writeForm.jsp'" />
	</div>
</div>
</body>
</html>