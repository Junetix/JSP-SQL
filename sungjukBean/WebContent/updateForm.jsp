<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="sungjuk.*" %>
<%
request.setCharacterEncoding("euc-kr");
if (session.getAttribute("hakbun") == null || (!session.getAttribute("hakbun").equals("admin")))
{
  out.println("<script>");
  out.println("history.back();");
  out.println("</script>");
}
else
{
	 String hakbun = request.getParameter("hakbun");
	DBBean manager= DBBean.getInstance();
	SungjukDataBean sungjuk = manager.selectSungjuk(hakbun);
  	if (sungjuk==null)
      {
        out.println("<script>");
        out.println("alert('수정할 학번을 다시 입력하세요!!!')");
        out.println("history.back();");
        out.println("</script>");
      }
      else
      {
%>
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
  if (document.updateform2.kor.value == "")
  {
    alert("국어점수를 입력하세요!!!");
    document.updateform2.kor.focus();
    return false;
  }
  else
  {
    str = document.updateform2.kor.value;
    if (!num_check(str))
    {
      alert("국어점수 입력오류!!!");
      document.updateform2.kor.focus();
      return false;
    }
  }
  
  if (document.updateform2.eng.value == "")
  {
    alert("영어점수를 입력하세요!!!");
    document.updateform2.eng.focus();
    return false;
  }
  else
  {
    str = document.updateform2.eng.value;
    if (!num_check(str))
    {
      alert("영어점수 입력오류!!!");
      document.updateform2.eng.focus();
      return false;
    }
  }
  
  if (document.updateform2.math.value == "")
  {
    alert("수학점수를 입력하세요!!!");
    document.updateform2.math.focus();
    return false;
  }
  else
  {
    str = document.updateform2.math.value;
    if (!num_check(str))
    {
      alert("수학점수 입력오류!!!");
      document.updateform2.math.focus();
      return false;
    }
  }
  
  document.updateform2.submit();
}
</script>
<form name="updateform2" action="./template.jsp?page=updateProcess" method="post">
<input type="hidden" name="hakbun" value="<%=sungjuk.getHakbun() %>">
<input type="hidden" name="irum" value="<%=sungjuk.getIrum() %>">
<table border="1" align="center">
  <tr>
    <td>학번</td>
    <td><%=sungjuk.getHakbun() %></td>
  </tr>
  <tr>
    <td>이름 </td>
    <td><%=sungjuk.getIrum() %></td>
  </tr>
  <tr>
    <td>국어 </td>
    <td><input type="text" name="kor" size="5" maxlength="3" value=<%=sungjuk.getKor() %>></td>
  </tr>
  <tr>
    <td>영어 </td>
    <td><input type="text" name="eng" size="5" maxlength="3" value=<%=sungjuk.getEng() %>></td>
  </tr>
  <tr>
    <td>수학 </td>
    <td><input type="text" name="math" size="5" maxlength="3" value=<%=sungjuk.getMath()%>></td>
  </tr>
  <tr>
    <td colspan="2" align=center>
      <a href="javascript:input_check()">성적수정</a>&nbsp;&nbsp;
      <a href="javascript:joinform.reset()">다시작성</a>
    </td>
  </tr>
 <%
        }
}
%>
</table>
</form>

