<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="sungjuk.*" %>

<%
request.setCharacterEncoding("euc-kr");
if (session.getAttribute("hakbun") == null)
{
  out.println("<script>");
  out.println("history.back();");
  out.println("</script>");
}
else
{
	String hakbun = request.getParameter("hakbun");
	DBBean manager = DBBean.getInstance();
	SungjukDataBean sungjuk = manager.selectSungjuk(hakbun);
  
      if (sungjuk==null)
      {
    	  out.println("<script>");
    	  out.println("alert('��ȸ�� �й��� �ٽ� �Է��ϼ���!!!')");
    	  out.println("history.back();");
    	  out.println("</script>");
      }
      else
      {
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
}
%>
</table>
