<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="member" scope="request" class="member.MemberInfo" />
<%
  member.setId("KH");
  member.setName("���̿���ġ");
%>
<jsp:forward page="./useObject.jsp" />