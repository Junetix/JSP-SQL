<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import =" java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>   
<%
	request.setCharacterEncoding("euc-kr");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("SELECT * FROM sungjuk ORDER BY irum");
		rs = pstmt.executeQuery();
		
		
		
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>성적 리스트</title>
</head>
<body>
<table border=1>
	<tr>
		<td>학번</td>
		<td>이름</td>
		<td>국어</td>
		<td>영어</td>
		<td>수학</td>
		<td>총점</td>
		<td>평균</td>
		<td>등급</td>
	</tr>
	<%while(rs.next()){ %>
	<tr>
		<td><%=rs.getString("hakbun") %></td>
		<td><%=rs.getString("irum") %></td>
		<td><%=rs.getString("kor") %></td>
		<td><%=rs.getString("eng") %></td>
		<td><%=rs.getString("math") %></td>
		<td><%=rs.getString("tot") %></td>
		<td><%=rs.getString("avg") %></td>
		<td><%=rs.getString("grade") %></td>
	</tr>	
	<% }
	}catch(Exception e){
			e.printStackTrace();
	} %>
	
	
</table>
</body>
</html>