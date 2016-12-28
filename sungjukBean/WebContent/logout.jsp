<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
session.invalidate();
out.println("<script>");
out.println("location.href='./template.jsp'");
out.println("</script>");
%>