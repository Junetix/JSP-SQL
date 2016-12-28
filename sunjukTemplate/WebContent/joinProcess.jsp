<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import =" java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<%
	request.setCharacterEncoding("euc-kr");
	String hakbun = request.getParameter("hakbun");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("INSERT INTO s_member values(?,?,?,?,?,?)");
		pstmt.setString(1, hakbun);
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setInt(4, age);
		pstmt.setString(5, gender);
		pstmt.setString(6, email);
		
		int result = pstmt.executeUpdate();
		
		if(result != 0){
			out.println("<script>");
			out.println("location.href='template.jsp?page=login'");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("location.href='template.jsp?page=join'");
			out.println("</script>");
			
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Join Process</title>
</head>
<body>

</body>
</html>