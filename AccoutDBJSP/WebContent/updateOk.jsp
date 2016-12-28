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
	request.setCharacterEncoding("euc-kr");

	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	Connection con = null;
	PreparedStatement pstmt =  null;
	String sql ="update members set password=?,email=?,phone=? where id =?";
	int n=0;
	
	try{
		con = DBConnection.getCon();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, pass);
		pstmt.setString(2, email);
		pstmt.setString(3, phone);
		pstmt.setString(4, id);
		
		n=pstmt.executeUpdate();
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(con!=null)	con.close();
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
%>

<script type="text/javascript">
	if(<%=n%>>0){
		alert("수정되었습니다.");
	}else{
		alert("수정실패")
		history.go(-1);
	}



</script>
</body>
</html>