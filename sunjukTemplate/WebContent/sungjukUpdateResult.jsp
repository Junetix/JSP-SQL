<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =" java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>    
<%
	request.setCharacterEncoding("euc-kr");
	String hakbun = request.getParameter("hakbun");
	String irum = request.getParameter("irum");
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
		
		pstmt = conn.prepareStatement("UPDATE sungjuk SET kor=?,eng=?,math=?,tot=?,avg=?,grade=? WHERE hakbun=?");
		
		pstmt.setInt(1, kor);
		pstmt.setInt(2,eng);
		pstmt.setInt(3, math);
		
		int tot = kor+eng+math;
		double avg = tot/3.0;
		String grade = null;
		
		switch(tot/3/10){
		case 10:
		case 9:
			grade="수";
			break;
		case 8:
			grade="우";
			break;
		case 7:
			grade="미";
			break;
		case 6:
			grade="양";
			break;
		default:
			grade="가";
			break;
		}
		pstmt.setInt(4,tot);
		pstmt.setDouble(5, avg);
		pstmt.setString(6, grade);
		pstmt.setString(7, hakbun);
		
		int result = pstmt.executeUpdate();
		
		if(result>0){
			out.println("<scrpit>");
			out.println("location.href='template.jsp?page=main'");
			out.println("</scrpit>");
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