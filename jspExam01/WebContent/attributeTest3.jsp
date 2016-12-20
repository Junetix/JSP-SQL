<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Enumeration" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Attribute Test</title>
</head>
<body>
	<h2>영역과 속성 테스트</h2>
	<table border="1">
		<tr>
			<td colspan="2">Application 영역에 저장된 내용들 </td></tr>
		<tr>
			<td>이름</td>
			<td><%=application.getAttribute("name") %></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=application.getAttribute("id") %></td>
		</tr>
	
	</table>
	
	<br>
	<table border="1">
		<tr>
			<td colspan="2">Session 영역에 저장된 내용들</td></tr>
		<%
		Enumeration<String> e = session.getAttributeNames();
		while(e.hasMoreElements()){
			String attributeName = e.nextElement();
			String attributeValue = (String)session.getAttribute(attributeName);
		
		%>
		<tr>
			<td><%=attributeName %></td>
			<td><%=attributeValue %></td>
		</tr>
	
	<%
		}
	%>
	
	</table>
	
</body>
</html>