<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
<head> 
<title>�亯����</title>
</head>
<body>

<form action="reply.jsp" method="post">
<input type="hidden" name="parentArticleId" value="${param.parentId }" />
<input type="hidden" name="p" value="${param.p }" />
����: <input type="text" name="title" value="re: " /><br/>
�ۼ���: <input type="text" name="writerName" /><br/>
�۾�ȣ: <input type="password" name="password" /><br/>
�۳���: <br/>
<textarea name="content" cols="40" rows="5"></textarea>
<br/>
<input type="submit" value="����" />
</form>
</body>
</html>


