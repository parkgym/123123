<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
  String memberID = request.getParameter("memberID");
%>
<html>
<head>
<title>ȸ�� ����</title>
</head>
<body>
<%
  Class.forName("oracle.jdbc.driver.OracleDriver");
  
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  
  try {
	  String jdbcDriver = "jdbc:oracle:thin:@istudy.iptime.org:7000:ORCL";
	  String dbUser = "KH10";
	  String dbPass = "oracle";
	  String query = "select * from MEM82R where MEMBERID = '"+memberID+"'";
	  
	  conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	  stmt = conn.createStatement();
	  
	  rs = stmt.executeQuery(query);
	  if(rs.next()){
%>
<table border="1">
<tr>
  <td>���̵�</td><td><%= memberID %></td>
</tr>
<tr>
  <td>��ȣ</td><td><%= rs.getString("PASSWORD") %></td>
</tr>
<tr>
  <td>�̸�</td><td><%= rs.getString("NAME") %></td>
</tr>
<tr>
  <td>�̸���</td><td><%= rs.getString("EMAIL") %></td>
</tr>

</table>
<%
	  }else{
%>
<%= memberID %>�� �ش��ϴ� ������ �������� �ʽ��ϴ�.
<%
	  }
  }catch(SQLException ex){
%>
���� �߻�: <%= ex.getMessage() %>
<%
  } finally{
	  if(rs != null) try { rs.close(); } catch(SQLException ex){}
	  if(stmt != null) try {stmt.close(); } catch(SQLException ex){}
	  if(conn != null) try {conn.close(); } catch(SQLException ex){}
  }
%>
</body>
</html>