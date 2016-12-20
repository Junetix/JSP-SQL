<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
 	pageContext.setAttribute("pageScope", "pageValue"); //페이지 컨텍스트는 포워딩이후 어트리뷰트가 사라진다.
	request.setAttribute("requestScope", "requestValue"); //리퀘스트 객체는 공유된다.
%>
<jsp:forward page= "attributeTest5Result.jsp"></jsp:forward>
</body>
</html>