<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "soldesk.LogonDBBean" %>
<%@ page import = "util.CookieBox" %>
<% request.setCharacterEncoding("euc-kr"); %>

<% 
  String id = request.getParameter("id");
String passwd = request.getParameter("passwd");


LogonDBBean manager = LogonDBBean.getInstance();
int check = manager.userCheck(id,passwd);



if(check==1){
	if(request.getParameter("save") == null){
		   response.addCookie(
			CookieBox.createCookie("ID", "", "/", -1));
	}else{
		   response.addCookie(
		CookieBox.createCookie("ID", id, "/", -1));
	}
		
	session.setAttribute("memId", id);
	response.sendRedirect("main.jsp");
	
} else if(check==0){ %>
<script>
alert("��й�ȣ�� ���� �ʽ��ϴ�.");
history.go(-1);
</script>
<% }else{%>
<script>
alert("���̵� ���� �ʽ��ϴ�..");
history.go(-1);

</script>
<%} %>