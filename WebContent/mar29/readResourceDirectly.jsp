<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.io.*" %>
<html>
<head>
<title>���� ��� ����Ͽ� �ڿ� �б�</title>
</head>
<body>
<%
  FileReader fr = null;
  char[] buff = new char[512];
  int len = -1;
  
  try{
	  fr = new FileReader("C:\\Users\\user1\\eclipse-workspace\\KH10\\WebContent"+
			  "\\mar29\\message\\notice\\notice.txt");
	  while((len = fr.read(buff)) != -1){
		  out.print(new String(buff, 0, len));
	  }
  }catch(IOException ex){
	  out.println("���� �߻�: "+ex.getMessage());
  }finally{
	  if(fr != null) try { fr.close(); } catch(IOException ex){}
  }
%>
</body>
</html>