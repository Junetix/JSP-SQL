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
<% request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	try{
		con = DBConnection.getCon();
		String sql="select * from members where id =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		rset = pstmt.executeQuery();
		
		String pass = rset.getString("password");
		String email = rset.getString("email");
		String phone = rset.getString("phone");
		Timestamp regdate = rset.getTimestamp("regdate");
		
%>
	<form action="updateOk.jsp" method="post" name="form1">
		<table>
			<tr>
				<td>아이디</td>
				<td><%=id %><input type="hidden" name="id" value='<%=id %>'/>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="password" value='<%=pass %>'/>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value='<%=email %>'/>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value='<%=phone %>'/>
				</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td><%=regdate %></td>
				
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" name="btn1" value="저장" onclick="javascript:form1.submit();"/>
				<input type="button" name="btn2" value="목록" onclick="javascript:location.href='list.jsp';"/>		
				</td>
			</tr>
		</table>
	
	</form>
	<% 
	}catch(Exception e){
		System.out.println(e.getMessage());	
	}finally{
		try{
			if(rset!=null) rset.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null)	con.close();
		}catch(Exception e1){
			System.out.println(e1.getMessage());
		}
	}
	%>
	<script type="text/javascript">
		function update(){
			document.form1.submit();
		}
		function list(){
			location.href = "list.jsp";
		}
	
	
	</script>
</body>
</html>