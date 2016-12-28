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
<title>회원관리 시스템 메인 페이지</title>
</head>
<body>
	<h3><%=hakbun %>로 로그인하셨습니다.</h3>
	<%if(hakbun.equals("admin")){ %>
	<h3>관리자 모드로 접속 하셨습니다.</h3>
	<%} %>
</body>
</html>