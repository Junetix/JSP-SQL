<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>영역과 속성테스트</h2>
<%
	request.setCharacterEncoding("euc-kr");
	String email = request.getParameter("email");
	String address = request.getParameter("addr");
	String tel = request.getParameter("tel");
	session.setAttribute("email", email);
	session.setAttribute("address", address);
	session.setAttribute("tel", tel);
	
	String name = (String)application.getAttribute("name");
	//out.print(email);out.print(address);out.print(tel);
%>
<h3><%=name %>님의 정보가 모두 저장되었습니다.</h3>
<a href="attributeTest3.jsp">확인하러가기</a>
</body>
</html>