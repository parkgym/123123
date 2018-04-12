<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page isErrorPage = "true" %>
<html>
<head>
<title>예외 발생</title>
</head>
<body>

요청 처리 과정에서 예외가 발생하였습니다.<br>
빠른시간 내에 문제를 해결하도록 하겠습니다.
<p>
에러 타입 : <%= exception.getClass().getName() %><br>
에러 메시지 : <b><%= exception.getMessage() %></b>

</body>
</html>
<!-- 만약 에러 페이지의 길이가 513 바이트 보다 작다면,
 인터넷 익스플로러는 이 페이지가 출력하는 에러 페이지를 출력하지 않고 자체적으로 제공하는
 'HTTP 오류 메시지' 화면을 출력할것이다.
 만약 에러 페이지의 길이가 513 바이트보다 작은데 에러페이지의 내용이 인터넷 익스플로러에서도 올바르게 출력되길
 원한다면, 응답 결과에 이 주석과 같은 내용을 포함시켜서dddddddddd
 에러 메시지의 길이가 513 바이트 이상이 되도록 해주어야 한다.
 참고로 이 주석은 456 바이트이다. -->