<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>회원관리 시스템 회원가입 페이지</title>
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
	  alert("학번을 입력하세요!!!");
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
	    	alert("학번을 다시 입력하세요!!!");
	      document.joinform.hakbun.focus();
	      return false;
	    }
	    else
	    {
	    	if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z")))
	      {
	        alert("특수문자가 포함, 다시 입력!!!");
	        document.joinform.hakbun.focus();
	        return false;
	      }
	    }
	  }
	}
	
	if (document.joinform.pw.value == "")
	{
	  alert("패스워드를 입력하세요!!!");
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
	      alert("특수문자가 포함, 다시 입력!!!");
	      document.joinform.pw.focus();
	      return false;
	    }
	  }
	}
	
	if (document.joinform.irum.value == "")
	{
	  alert("이름을 입력하세요!!!");
	  document.joinform.irum.focus();
	  return false;
	}
	
	if (document.joinform.age.value == "")
	{
	  alert("나이를 입력하세요!!!");
	  document.joinform.age.focus();
	  return false;
	}
	else
	{
	  str = document.joinform.age.value;
	  if (!num_check(str))
	  {
	    alert("나이 입력오류!!!");
	    document.joinform.age.focus();
	    return false;
	  }
	}
	
	if (!(document.joinform.gender[0].checked == true 
			|| document.joinform.gender[1].checked == true))
  {
		alert("성별 체크하세요!!!");
    return false;
  }

	if (document.joinform.email.value == "")
	{
	  alert("이메일을 입력하세요!!!");
	  document.joinform.email.focus();
	  return false;
	}
	else
	{
		str = document.joinform.email.value;
		if (str.indexOf("@") == -1) 
		{
			alert("이메일을 다시 입력하세요!!!");
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
			<b><font size=5>회원가입 페이지</font></b>
		</td>
	</tr>
	<tr><td>학번 : </td><td><input type="text" name="hakbun"/></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="pw"/></td></tr>
	<tr><td>이름 : </td><td><input type="text" name="irum"/></td></tr>
	<tr><td>나이 : </td><td><input type="text" name="age" maxlength=2 size=5/></td></tr>
	<tr>
		<td>성별 : </td>
		<td>
			<input type="radio" name="gender" value="남" checked/>남자
			<input type="radio" name="gender" value="여"/>여자
		</td>
	</tr>
	<tr><td>이메일 주소 : </td><td><input type="text" name="email" size=30/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:input_check()">회원가입</a>&nbsp;&nbsp;
			<a href="javascript:joinform.reset()">다시작성</a>
		</td>
	</tr>
</table>
</form>
</body>
</html>
