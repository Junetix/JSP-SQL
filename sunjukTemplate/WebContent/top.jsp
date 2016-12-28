<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String hakbun = null;
	if(session.getAttribute("hakbun")!=null){
		hakbun = (String) session.getAttribute("hakbun");
		out.print(hakbun+"으로 로그인 하셨습니다.");
		out.print("<a href = 'logout.jsp'>로그아웃</a>");
		
	}else{
		out.print("<a href = './template.jsp?page=login'>Login</a>&nbsp;&nbsp;");
		out.print("<a href = './template.jsp?page=join'>Join</a>");
	}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>