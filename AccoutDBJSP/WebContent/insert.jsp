<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="test.db.DBConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		//db query

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into members values(?,?,?,?,sysdate)";
		int n = 0;
		try{
			con = DBConnection.getCon();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2,pass);
			pstmt.setString(3,email);
			pstmt.setString(4,phone);
			
			n=pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally{
			try{
				if(con!=null) con.close();
				if(pstmt!=null) pstmt.close();
				
			}catch(Exception e1){
				System.out.println(e1.getMessage());
			}
			
		}
	%>
	<script type="text/javascript">
	 if(<%=n%>>0){
		 alert("정상가입되었습니다.");
		 location.href="index.html";
	 }else{
		 alert("회원가입 실패!");
		 history.go(-1);
	 }
	
	
	</script>
</body>
</html>