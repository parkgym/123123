<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>옵션 선택 화면</title>
</head>
<body>

<form action="<%= request.getContextPath() %>/mar30/view.jsp">
<form action="view.jsp">

보고 싶은 페이지 선택:
  <select name="code">
    <option value="A">A페이지</option>
    <option value="B">B페이지</option>
    <option value="C">C페이지</option>
  </selct>
  
<input type="submit" value="이동">

</form>
</body>
</html>