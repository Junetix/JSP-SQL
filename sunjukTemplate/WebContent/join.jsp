<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리 시스템 회원가입 페이지</title>
</head>
<body>
	<form name="joinform" action="joinProcess.jsp" method="post">
		<center>
			<table border="1">
				<tr>
					<td colspan="2" align="center">
						<b><font size="5">회원가입 페이지</font></b>
					</td>
				</tr>
				<tr><td>학번:</td><td><input type="text" name="hakbun"/></td></tr>
				<tr><td>비밀번호:</td><td><input type="password" name="pass"/></td></tr>
				<tr><td>이름:</td><td><input type="text" name="name"/></td></tr>
				<tr><td>나이:</td><td><input type="text" name="age" maxlength="2" size="5"/></td></tr>
				<tr>
					<td>성별:</td>
					<td>
						<input type="radio" name="gender" value="남" checked>남자
						<input type="radio" name="gender" value="여">여자
					</td>
				</tr>
				<tr><td>이메일주소:</td><td><input type="text" name="email" size="30"/></td></tr>
				<tr>
					<td colspan="2" align="center">
						<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
						<a href="javascript:joinform.reset()">다시작성</a>
					</td>
				</tr>
				
			</table>
		</center>
	
	</form>
</body>
</html>