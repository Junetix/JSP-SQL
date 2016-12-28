<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
if (!session.getAttribute("hakbun").equals("admin"))
{
	out.println("<script>");
	out.println("history.back();");
	out.println("</script>");
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
	if (document.inputform.kor.value == "")
	{
	  alert("국어점수를 입력하세요!!!");
	  document.inputform.kor.focus();
	  return false;
	}
	else
	{
	  str = document.inputform.kor.value;
	  if (!num_check(str))
	  {
	    alert("국어점수 입력오류!!!");
	    document.inputform.kor.focus();
	    return false;
	  }
	}
	
	if (document.inputform.eng.value == "")
	{
	  alert("영어점수를 입력하세요!!!");
	  document.inputform.eng.focus();
	  return false;
	}
	else
	{
	  str = document.inputform.eng.value;
	  if (!num_check(str))
	  {
	    alert("영어점수 입력오류!!!");
	    document.inputform.eng.focus();
	    return false;
	  }
	}
	
	if (document.inputform.math.value == "")
	{
	  alert("수학점수를 입력하세요!!!");
	  document.inputform.math.focus();
	  return false;
	}
	else
	{
	  str = document.inputform.math.value;
	  if (!num_check(str))
	  {
	    alert("수학점수 입력오류!!!");
	    document.inputform.math.focus();
	    return false;
	  }
	}
	
	document.inputform.submit();
}
</script>
</head>
<body>
<form name="inputform" action="./template.jsp?page=inputProcess" method="post">
<table border=1 align="center">
  <tr>
    <td colspan="2" align=center>
      <b><font size=4>성적입력</font></b>
    </td>
  </tr>
  <tr><td>학번 : </td><td><input type="text" name="hakbun" maxlength=5 size=7/></td></tr>
  <tr><td>이름 : </td><td><input type="text" name="irum" maxlength=10 size=7/></td></tr>
  <tr><td>국어 : </td><td><input type="text" name="kor" maxlength=3 size=5/></td></tr>
  <tr><td>영어 : </td><td><input type="text" name="eng" maxlength=3 size=5/></td></tr>
  <tr><td>수학 : </td><td><input type="text" name="math" maxlength=3 size=5/></td></tr>
  <tr>
    <td colspan="2" align=center>
      <a href="javascript:input_check()">성적입력</a>&nbsp;&nbsp;
      <a href="javascript:joinform.reset()">다시작성</a>
    </td>
  </tr>
</table>
</form>
</body>
</html>