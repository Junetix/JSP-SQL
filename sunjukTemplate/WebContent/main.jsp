<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String hakbun = null;
	if(session.getAttribute("hakbun")!=null){
		hakbun = (String) session.getAttribute("hakbun");
	}else{
		out.println("<script>");
		out.println("location.href='template.jsp?page=login'");
		out.println("</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ �ý��� ���� ������</title>
</head>
<body>
	<h3><%=hakbun %>�� �α����ϼ̽��ϴ�.</h3>
	<%if(hakbun.equals("admin")){ %>
	<h3>������ ���� ���� �ϼ̽��ϴ�.</h3>
	<%} %>
</body>
</html>