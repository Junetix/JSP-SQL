<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<center>
<% 
  if (session.getAttribute("hakbun") == null)
  {
%>
    �α���<br>�ϼ���!
<%
  }
  else if (!session.getAttribute("hakbun").equals("admin"))
  {
%>
<a href="./template.jsp?page=search_sungjuk">������ȸ</a><br><br>
<br><br><br><br><br><br>
<%
  }
  else 
  {
%>
<a href="./template.jsp?page=input_sungjuk">�����Է�</a><br><br>
<a href="./template.jsp?page=output_sungjuk">�������</a><br><br>
<a href="./template.jsp?page=search_sungjuk">������ȸ</a><br><br>
<a href="./template.jsp?page=update_sungjuk">��������</a><br><br>
<a href="./template.jsp?page=delete_sungjuk">��������</a><br><br>
<%
  }
%>
</center>
<br/><br/><br/><br/><br/><br/>
