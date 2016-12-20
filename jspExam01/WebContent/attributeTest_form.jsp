<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>영역과 속성 테스트</h2>
	<form action="attributeTest1.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2">Application 영역에 저장할 내용들</td>
				<!-- 세션과 어플리케이션 객체의 사용영역을 알아보는 예정 -->
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
		</table>
		
	
	
	</form>
</body>
</html>