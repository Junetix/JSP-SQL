<%@page import="sungjuk.DBBean"%>
<%@page import="sungjuk.SungjukDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<jsp:useBean id="sungjuk" class="sungjuk.SungjukDataBean">
	<jsp:setProperty name="sungjuk" property="*" />
</jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");
	if (session.getAttribute("hakbun") == null || (!session.getAttribute("hakbun").equals("admin"))) {
		out.println("<script>");
		out.println("history.back();");
		out.println("</script>");
	} else {
		DBBean manager = DBBean.getInstance();
		int result = manager.insertSungjuk(sungjuk);

		if (result == 0) {
			out.println("<script>");
			out.println("alert('성적 입력 실패!!!')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('성적 입력 성공!!!')");
			out.println("location.href='./template.jsp?page=output_sungjuk'");
			out.println("</script>");
		}
	}
%>