<%@page import="sungjuk.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
request.setCharacterEncoding("euc-kr");
if (session.getAttribute("hakbun") == null)
{
  out.println("<script>");
  out.println("history.back();");
  out.println("</script>");
}
else if (session.getAttribute("hakbun").equals("admin"))
{
%>
	<script>
	function input_check()
	{
	  if (document.searchform.hakbun.value == "")
	  {
	    alert("��ȸ�� �й��� �Է��ϼ���!!!");
	    document.searchform.hakbun.focus();
	    return false;
	  }
	  document.searchform.submit();
	}
	</script>
	<form name="searchform" action="./template.jsp?page=searchProcess" method="post">
	<table border="0" align="center">
	  <tr><td>�й� : </td>
	  <td><input type="text" name="hakbun" size="7"/></td>
	  <td><a href="javascript:input_check()">��ȸ</a></td>
	  </tr>
	</table>
	</form>
<%
}
else
{		
		String hakbun = (String)session.getAttribute("hakbun");
		DBBean manager = DBBean.getInstance();
		SungjukDataBean sungjuk = manager.selectSungjuk(hakbun);
		
		
%>
			<table border="1" align="center">
			  <tr>
			    <td>�й� : </td>
			    <td><%=sungjuk.getHakbun() %></td>
			  </tr>
			  <tr>
			    <td>�̸� : </td>
			    <td><%=sungjuk.getIrum() %></td>
			  </tr>
			  <tr>
			    <td>���� : </td>
			    <td><%=sungjuk.getKor() %></td>
			  </tr>
			  <tr>
			    <td>���� : </td>
			    <td><%=sungjuk.getEng() %></td>
			  </tr>
			  <tr>
			    <td>���� : </td>
			    <td><%=sungjuk.getMath() %></td>
			  </tr>
			  <tr>
			    <td>���� : </td>
			    <td><%=sungjuk.getTot() %></td>
			  </tr>
			  <tr>
			    <td>��� : </td>
			    <td><%=sungjuk.getAvg() %></td>
			  </tr>
			  <tr>
			    <td>��� : </td>
			    <td><%=sungjuk.getGrade() %></td>
			  </tr>
			 
<%	
		
      }
%>
</table>
	