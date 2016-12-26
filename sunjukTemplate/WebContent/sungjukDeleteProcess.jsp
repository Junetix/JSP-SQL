<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =" java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
    
<%
	request.setCharacterEncoding("euc-kr");

	String hakbun = request.getParameter("hakbun");
	
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		
		pstmt = conn.prepareStatement("DELETE FROM sungjuk where hakbun=?");
		pstmt.setString(1, hakbun);
		
		int result = pstmt.executeUpdate();
		
		if(result>0){
			out.println("<script>");
			out.println("alert('"+hakbun+"번을 제거 하였습니다.')");
			out.println("location.href='template.jsp?page=main'");
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
<title>Insert title here</title>
</head>
<body>

</body>
</html>