<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>ȸ������ �ý��� ȸ������ ������</title>
<script>
function num_check(str)
{
	var i;
	for (i=0; i<str.length; i++)
	{
    if ((str.substring(i, i+1) < "0" || str.substring(i, i+1) > "9"))
    {
      return false;
    }
  }
  return true;
}

function input_check()
{
	if (document.joinform.hakbun.value == "")
	{
	  alert("�й��� �Է��ϼ���!!!");
	  document.joinform.hakbun.focus();
	  return false;
	}
	else
	{
		str = document.joinform.hakbun.value;
		for (i=0; i<str.length; i++)
	  {
	    ch = str.substring(i, i+1);
	    if (i == 0 && num_check(ch))
	    {
	    	alert("�й��� �ٽ� �Է��ϼ���!!!");
	      document.joinform.hakbun.focus();
	      return false;
	    }
	    else
	    {
	    	if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")))
	      {
	        alert("Ư�����ڰ� ����, �ٽ� �Է�!!!");
	        document.joinform.hakbun.focus();
	        return false;
	      }
	    }
	  }
	}
	
	if (document.joinform.pw.value == "")
	{
	  alert("�н����带 �Է��ϼ���!!!");
	  document.joinform.pw.focus();
	  return false;
	}
	else
	{
		str = document.joinform.pw.value;
	  for (i=0; i<str.length; i++)
	  {
		  ch = str.substring(i, i+1);
	    if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")))
	    {
	      alert("Ư�����ڰ� ����, �ٽ� �Է�!!!");
	      document.joinform.pw.focus();
	      return false;
	    }
	  }
	}
	
	if (document.joinform.irum.value == "")
	{
	  alert("�̸��� �Է��ϼ���!!!");
	  document.joinform.irum.focus();
	  return false;
	}
	
	if (document.joinform.age.value == "")
	{
	  alert("���̸� �Է��ϼ���!!!");
	  document.joinform.age.focus();
	  return false;
	}
	else
	{
	  str = document.joinform.age.value;
	  if (!num_check(str))
	  {
	    alert("���� �Է¿���!!!");
	    document.joinform.age.focus();
	    return false;
	  }
	}
	
	if (!(document.joinform.gender[0].checked == true 
			|| document.joinform.gender[1].checked == true))
  {
		alert("���� üũ�ϼ���!!!");
    return false;
  }

	if (document.joinform.email.value == "")
	{
	  alert("�̸����� �Է��ϼ���!!!");
	  document.joinform.email.focus();
	  return false;
	}
	else
	{
		str = document.joinform.email.value;
		if (str.indexOf("@") == -1) 
		{
			alert("�̸����� �ٽ� �Է��ϼ���!!!");
		  document.joinform.email.focus();
		  return false;
		}
	}
	
	document.joinform.submit();
}
</script>
</head>
<body>
<form name="joinform" action="./template.jsp?page=joinProcess" method="post">
<table border=1 align="center">
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>ȸ������ ������</font></b>
		</td>
	</tr>
	<tr><td>�й� : </td><td><input type="text" name="hakbun"/></td></tr>
	<tr><td>��й�ȣ : </td><td><input type="password" name="pw"/></td></tr>
	<tr><td>�̸� : </td><td><input type="text" name="irum"/></td></tr>
	<tr><td>���� : </td><td><input type="text" name="age" maxlength=2 size=5/></td></tr>
	<tr>
		<td>���� : </td>
		<td>
			<input type="radio" name="gender" value="��" checked/>����
			<input type="radio" name="gender" value="��"/>����
		</td>
	</tr>
	<tr><td>�̸��� �ּ� : </td><td><input type="text" name="email" size=30/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:input_check()">ȸ������</a>&nbsp;&nbsp;
			<a href="javascript:joinform.reset()">�ٽ��ۼ�</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
