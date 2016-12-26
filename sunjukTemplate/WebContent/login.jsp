<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원관리 시스템 로그인 페이지</title>
</head>
<body>
	<form name="loginform" action="loginProcess.jsp" method="post">
		<center>
			<table border=1>
				<tr>
					<td colspan=2 align=center>
						<b><font size=5>로그인 페이지</font></b>
					</td>
				</tr>
				<tr><td>아이디:</td><td><input type="text" name="hakbun"/></td></tr>
				<tr><td>비밀번호:</td><td><input type="password" name="pass"/></td></tr>
				<tr>
					<td colspan=2 align=center>
						<a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;
						<a href="template.jsp?page=join">회원가입</a>
			
			</table>
		</center>
	</form>
</body>
</html>