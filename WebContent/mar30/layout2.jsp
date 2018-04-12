<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>layout2</title>
</head>
<body>

<table width="400" border="1" cellpadding="0" cellspacing="0">
<tr>
  <td colspan="2">
    <jsp:include page="/mar30/module/top.jsp" flush="false" />
  </td>
</tr>
<tr>
  <td width="100" valign="top">
    <jsp:include page="/mar30/module/left.jsp" flush="false" />
  </td>
  <td width="300" valign="top">
    이 부분은 layout2.jsp가 생성된다.<br>
    레이아웃 2
    <br><br><br>
  </td>
</tr>
<tr>
  <td colspan="2">
    <jsp:include page="/mar30/module/bottom.jsp" flush="false" />
  </td>
</tr>
  

</table>
</body>
</html>