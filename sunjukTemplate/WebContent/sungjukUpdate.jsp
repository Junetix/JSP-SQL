<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>성적 업데이트</title>
</head>
<body>
	<form action="sungjukUpdateProcess.jsp" name ="sungjukUpdateForm" method="post">
		<label for ="hakbun">학번</label>
		<input type="text" name = "hakbun">
		<input type="submit" name = "수정">
	</form>
</body>
</html>