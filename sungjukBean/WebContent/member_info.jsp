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
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ���� ����)</title>
</head>
<body>
<center>
<table border=1 width=300>
	<tr align=center><td>�й� : </td><td><%=memberdata.getHakbun() %></td></tr>
	<tr align=center><td>��й�ȣ : </td><td><%=memberdata.getPw() %></td></tr>
	<tr align=center><td>�̸� : </td><td><%=memberdata.getIrum() %></td></tr>
	<tr align=center><td>���� : </td><td><%=memberdata.getAge() %></td></tr>
	<tr align=center><td>���� : </td><td><%=memberdata.getGender() %></td></tr>
	<tr align=center><td>�̸��� �ּ� : </td><td><%=memberdata.getEmail() %></td></tr>
	<tr align=center>
		<td colspan=2><a href="template.jsp?page=member_list">����Ʈ�� ���ư���</a></td>
	</tr>
</table>
</center>
</body>
</html>
