<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String irum=null;

	if (session.getAttribute("hakbun")==null){
		out.println("<script>");
		out.println("location.href='./template.jsp?page=loginForm'");
		out.println("</script>");
	}
		
	else{
		irum=(String)session.getAttribute("irum");
%>

<h3><%=irum %> �� �α����ϼ̽��ϴ�.</h3>
<%
	}
%>
