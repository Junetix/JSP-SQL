<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>ȸ������ �ý��� �α��� ������</title>
<script>
function input_check()
{
  if (document.loginform.hakbun.value == "")
  {
    alert("�й��� �Է��ϼ���!!!");
    document.loginform.hakbun.focus();
    return false;
  }
  if (document.loginform.pw.value == "")
  {
    alert("��й�ȣ�� �Է��ϼ���!!!");
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
			<b><font size=5>�α��� ������</font></b>
		</td>
	</tr>
	<tr><td>�й� : </td><td><input type="text" name="hakbun"/></td></tr>
	<tr><td>��й�ȣ : </td><td><input type="password" name="pw"/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:input_check()">�α���</a>&nbsp;&nbsp;
			<a href="./template.jsp?page=joinForm">ȸ������</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>
