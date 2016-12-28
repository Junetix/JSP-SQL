<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =" java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%
	request.setCharacterEncoding("euc-kr");

	String hakbun = request.getParameter("hakbun");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("select * from sungjuk where hakbun =?");
		pstmt.setString(1, hakbun);
		
		rs = pstmt.executeQuery();
		
		if(!rs.next()){
			out.println("�ش� �й��� �����Ͱ� ���� ���� �ʽ��ϴ�.");
			out.println("<a href='#' onclick='history.back()'>�ڷΰ���</a>");
		}else{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr><td>�й�</td><td><%=hakbun %></td></tr>
		<tr><td>�̸�</td><td><%=rs.getString("irum") %></td></tr>
		<tr><td>����</td><td><%=rs.getString("kor") %></td></tr>
		<tr><td>����</td><td><%=rs.getString("eng") %></td></tr>
		<tr><td>����</td><td><%=rs.getString("math") %></td></tr>
		<tr><td>����</td><td><%=rs.getString("tot") %></td></tr>
		<tr><td>���</td><td><%=rs.getString("avg") %></td></tr>
		<tr><td>���</td><td><%=rs.getString("grade") %></td></tr>
	<%}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	</table>
</body>
</html>