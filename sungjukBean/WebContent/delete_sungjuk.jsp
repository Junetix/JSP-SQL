<%@page import="sungjuk.DBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	request.setCharacterEncoding("euc-kr");
	if (session.getAttribute("hakbun") == null || (!session.getAttribute("hakbun").equals("admin")))
	{
	  out.println("<script>");
	  out.println("history.back();");
	  out.println("</script>");
	}
	
%>
<script>
function input_check()
{
  if (document.deleteform.hakbun.value == "")
  {
    alert("������ �й��� �Է��ϼ���!!!");
    document.deleteform.hakbun.focus();
    return false;
  }
  document.deleteform.submit();
}
</script>
<form name="deleteform" action="./template.jsp?page=deleteProcess" method="post">
<table border="0" align="center">
  <tr><td>�й� : </td>
  <td><input type="text" name="hakbun" size="7"/></td>
  <td><a href="javascript:input_check()">����</a></td>
  </tr>
</table>
</form>
