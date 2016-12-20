<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%!
	private String getStr(){ //클래스의 메소드가 된다.
	str+=" 테스트 입니다.";
	return str;
}
	private String str="선언문"; //필드(필드의 멤버변수)가 된다.
%><%--스크립틀릿이라고 부른다. --%>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>
<%=getStr()
//
%></h1>
</body>
</html>