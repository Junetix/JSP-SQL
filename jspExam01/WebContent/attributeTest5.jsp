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
 	pageContext.setAttribute("pageScope", "pageValue"); //������ ���ؽ�Ʈ�� ���������� ��Ʈ����Ʈ�� �������.
	request.setAttribute("requestScope", "requestValue"); //������Ʈ ��ü�� �����ȴ�.
%>
<jsp:forward page= "attributeTest5Result.jsp"></jsp:forward>
</body>
</html>