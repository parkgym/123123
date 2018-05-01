<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
<head> 
<title>답변쓰기</title>
</head>
<body>

<form action="reply.jsp" method="post">
<input type="hidden" name="parentArticleId" value="${param.parentId }" />
<input type="hidden" name="p" value="${param.p }" />
제목: <input type="text" name="title" value="re: " /><br/>
작성자: <input type="text" name="writerName" /><br/>
글암호: <input type="password" name="password" /><br/>
글내용: <br/>
<textarea name="content" cols="40" rows="5"></textarea>
<br/>
<input type="submit" value="전송" />
</form>
</body>
</html>


