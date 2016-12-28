<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =" java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<%
	String hakbun = request.getParameter("hakbun");
	String pass = request.getParameter("pass");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet  rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("SELECT * FROM s_member where hakbun =? ");
		pstmt.setString(1, hakbun);
		rs = pstmt.executeQuery();
		
		
		if(rs.next()){
			if(pass.equals(rs.getString("pw"))){
				session.setAttribute("hakbun", hakbun);
				
				out.println("<script>");
				out.println("location.href = 'template.jsp?page=main'");
				out.println("</script>");
			}
		}
		
		out.println("<script>");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
	}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Login Process</title>
</head>
<body>

</body>
</html>