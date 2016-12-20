<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="test.db.DBConnection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String id = request.getParameter("id");
	
	int n = 0;
	
	try{
		con = DBConnection.getCon();
		String sql = "delete from members where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		
		n = pstmt.executeUpdate();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	}
	
	response.sendRedirect("list.jsp");

%>
</body>
</html>