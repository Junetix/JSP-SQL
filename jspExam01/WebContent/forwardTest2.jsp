<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>포워딩된 페이지</h2>
<table>
	<tr>
		<td>이름</td>
		<td><%=request.getParameter("name") %></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=request.getParameter("age") %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=request.getParameter("address") %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=request.getParameter("tel") %></td>
	</tr>
</table>
</body>
</html>