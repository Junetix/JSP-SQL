<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% 
 
  if (session.getAttribute("hakbun") == null)
  {
%>
<a href="./template.jsp?page=loginForm">Login</a> |
<a href="./template.jsp?page=joinForm">Join</a>
<%
  }
  else
  {
%>
<a href="./template.jsp?page=logout">Logout</a> 
<a href="./template.jsp?page=member_list">회원 목록</a>
<b><%=session.getAttribute("irum") %></b>
<%
  }
%>