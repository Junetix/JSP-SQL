<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Out Test</title>
</head>
<body>
	<h2>Out test</h2>
	<table border="1">
		<tr>
			<td>auto flush</td>
			<td><%=out.isAutoFlush() %></td>
		</tr>
		<tr>
			<td>출력 버퍼의 크기</td>
			<td><%=out.getBufferSize() %>바이트</td>
		</tr>
		<tr>
			<td>출력버퍼의 남은 양</td>
			<td><%=out.getRemaining() %>바이트</td>
		</tr>
	
	</table>
</body>
</html>