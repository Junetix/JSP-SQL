<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import =" java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<%
	request.setCharacterEncoding("euc-kr");
	
	String hakbun = request.getParameter("hakbun");
	String irum = request.getParameter("name");
	
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
		
		pstmt = conn.prepareStatement("SELECT * FROM s_member where hakbun=?");
		pstmt.setString(1, hakbun);
		rs = pstmt.executeQuery();
		
		if(!rs.next()){
			out.println("<script>");
			out.println("location.href='template.jsp?page=main'");
			out.println("</script>");
		}else{
			
			pstmt = conn.prepareStatement("INSERT INTO sungjuk VALUES(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, hakbun);
			pstmt.setString(2, irum);
			pstmt.setInt(3, kor);
			pstmt.setInt(4, eng);
			pstmt.setInt(5, math);
			
			int tot = kor+eng+math;
			double avg = tot/3.0;
			String grade = null;
			
			switch(tot/3/10){
			case 10:
			case 9:
				grade="��";
				break;
			case 8:
				grade="��";
				break;
			case 7:
				grade="��";
				break;
			case 6:
				grade="��";
				break;
			default:
				grade="��";
				break;
			}
			pstmt.setInt(6,tot);
			pstmt.setDouble(7, avg);
			pstmt.setString(8, grade);
			
			int result = pstmt.executeUpdate();
			
			if(result!=0){
				out.println("<script>");
				out.println("alert('���� �Է� ����')");
				out.println("location.href = 'template.jsp?page=main'");
				out.println("</script>");
			}else{
				out.println("<scrpit>");
				out.println("alert('���� �Է� ����')");
				out.println("location.href = 'template.jsp?page=sungjukInsert'");
				out.println("</script>");
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Է� ���μ���</title>
</head>
<body>

</body>
</html>