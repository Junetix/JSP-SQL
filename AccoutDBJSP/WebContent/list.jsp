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
	<h2>ȸ�����</h2>
	<table border="1" width="600">
		<tr>
			<td>���̵�</td>
			<td>��й�ȣ</td>
			<td>�̸���</td>
			<td>��ȭ��ȣ</td>
			<td>������</td>
			<td>����</td>
			<td>����</td>
		</tr>
		<%
			//DB���� ȸ����� ������
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
				<td><a href="delete.jsp?id=<%=id %>">����</a></td>
				<td><a href="update.jsp?id=<%=id %>">����</a></td>
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