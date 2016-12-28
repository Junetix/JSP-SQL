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
    	  out.println("alert('조회할 학번을 다시 입력하세요!!!')");
    	  out.println("history.back();");
    	  out.println("</script>");
      }
      else
      {
%>
<table border="1" align="center">
  <tr>
    <td>학번 : </td>
    <td><%=sungjuk.getHakbun() %></td>
  </tr>
  <tr>
    <td>이름 : </td>
    <td><%=sungjuk.getIrum() %></td>
  </tr>
  <tr>
    <td>국어 : </td>
    <td><%=sungjuk.getKor() %></td>
  </tr>
  <tr>
    <td>영어 : </td>
    <td><%=sungjuk.getEng() %></td>
  </tr>
  <tr>
    <td>수학 : </td>
    <td><%=sungjuk.getMath() %></td>
  </tr>
  <tr>
    <td>총점 : </td>
    <td><%=sungjuk.getTot() %></td>
  </tr>
  <tr>
    <td>평균 : </td>
    <td><%=sungjuk.getAvg() %></td>
  </tr>
  <tr>
    <td>등급 : </td>
    <td><%=sungjuk.getGrade() %></td>
  </tr>
<%
        }
}
%>
</table>
