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
	<h2>회원목록</h2>
	<table border="1" width="600">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td>가입일</td>
			<td>삭제</td>
			<td>수정</td>
		</tr>
		<%
			//DB에서 회원목록 얻어오기
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			try{
				con =DBConnection.getCon();
				String sql = "select * from members";
				pstmt = con.prepareStatement(sql);
				rset = pstmt.executeQuery();
				while(rset.next()){
					String id = rset.getString("id");
					String pass = rset.getString("password");
					String email = rset.getString("email");
					String phone = rset.getString("phone");
					Timestamp regdate = rset.getTimestamp("regdate");
		%>
			<tr>
				<td><%=id %></td>
				<td><%=pass %></td>
				<td><%=email %></td>
				<td><%=phone %></td>
				<td><%=regdate %></td>
				<td><a href="delete.jsp?id=<%=id %>">삭제</a></td>
				<td><a href="update.jsp?id=<%=id %>">수정</a></td>
			</tr>
			<%
	}
				
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
		
			
	
	</table>
</body>
</html>