<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>회원관리 시스템 로그인 페이지</title>
<script>
function input_check()
{
  if (document.loginform.hakbun.value == "")
  {
    alert("학번을 입력하세요!!!");
    document.loginform.hakbun.focus();
    return false;
  }
  if (document.loginform.pw.value == "")
  {
    alert("비밀번호를 입력하세요!!!");
    document.loginform.pw.focus();
    return false;
  }
  
  document.loginform.submit();
}
</script>
</head>
<body>
<form name="loginform" action="./template.jsp?page=loginProcess" method="post">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>로그인 페이지</font></b>
		</td>
	</tr>
	<tr><td>학번 : </td><td><input type="text" name="hakbun"/></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="pw"/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:input_check()">로그인</a>&nbsp;&nbsp;
			<a href="./template.jsp?page=joinForm">회원가입</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>
