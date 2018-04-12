<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.util.Calendar" %>
<%
  Calendar cal = Calendar.getInstance();
  request.setAttribute("time", cal);
%>
<jsp:forward page="../to/viewTime.jsp" />