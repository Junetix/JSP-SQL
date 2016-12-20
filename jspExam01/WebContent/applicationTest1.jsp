<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ApplicationTest</title>
</head>
<body>
	<h2>어플리케이션 테스트</h2>
	<table border="1">
		<tr>
			<td>JSP버전</td>
			<td><%=application.getMajorVersion() %>.<%=application.getMinorVersion() %></td>
			<!-- 메이저버전.마이너버전 ex 3.1 
			웹 프로젝트에 하나의 객체만 존재한다.
			주 용도: 사용자간의정보공유가 필요할때
			서버에 웹프로젝트가 시작되면 생성
			서버에서 종료되면 소멸
			
			-->
		</tr>
		<tr>
			<td>컨테이너정보</td>
			<td><%=application.getServerInfo() %></td>
		</tr>
		<tr>
			<td>웹 어플리케이션의 실제 파일시스템 경로</td>
			<td><%=application.getRealPath("/") %></td>
		</tr>
	</table>
</body>
</html>