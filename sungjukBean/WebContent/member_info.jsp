<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="sungjuk.*" %>

<%
	if ((session.getAttribute("hakbun")==null) || 
			(!((String)session.getAttribute("hakbun")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='template.jsp?page=mamber_info'");
		out.println("</script>");
	}
	
	String info_hakbun=request.getParameter("hakbun");

	DBBean manager = DBBean.getInstance();
	MemberDataBean memberdata = manager.selectMember(info_hakbun);
	
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
<center>
<table border=1 width=300>
	<tr align=center><td>학번 : </td><td><%=memberdata.getHakbun() %></td></tr>
	<tr align=center><td>비밀번호 : </td><td><%=memberdata.getPw() %></td></tr>
	<tr align=center><td>이름 : </td><td><%=memberdata.getIrum() %></td></tr>
	<tr align=center><td>나이 : </td><td><%=memberdata.getAge() %></td></tr>
	<tr align=center><td>성별 : </td><td><%=memberdata.getGender() %></td></tr>
	<tr align=center><td>이메일 주소 : </td><td><%=memberdata.getEmail() %></td></tr>
	<tr align=center>
		<td colspan=2><a href="template.jsp?page=member_list">리스트로 돌아가기</a></td>
	</tr>
</table>
</center>
</body>
</html>
