<%@page import="sungjuk.DBBean"%>
<%@page import="sungjuk.MemberDataBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>
<%
	ArrayList<MemberDataBean> member_list = null;
	if ((session.getAttribute("hakbun")==null) || 
	  (!((String)session.getAttribute("hakbun")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='template.jsp?page=loginForm'");
		out.println("</script>");
	}
	DBBean manager = DBBean.getInstance();
	member_list = (ArrayList<MemberDataBean>)manager.getMemberlist();

%>
<html>
<head>
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ��� ����)</title>
</head>
<body>
<center>
<table border=1 width=300>
	<tr align=center><td colspan=2>ȸ�� ���</td></tr>
	 <%for(int i = 0 ; i<member_list.size(); i++){ 
		MemberDataBean memberdata = member_list.get(i);
	 
	 %>
	<tr align=center>
		<td>
			<a href="template.jsp?page=member_info&hakbun=<%=memberdata.getHakbun() %>">
				<%=memberdata.getHakbun() %>
			</a>
		</td>
		<td><a href="template.jsp?page=member_delete&hakbun=<%=memberdata.getHakbun() %>">����</a></td>
	</tr>
	<%} %>
</table>
</center>
</body>
</html>
