<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =" java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	
	String hakbun = request.getParameter("hakbun");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement("select * from sungjuk where hakbun=?");
		pstmt.setString(1, hakbun);
		rs = pstmt.executeQuery();
		
		if(!rs.next()){
			out.println("�ش��й��� �����Ͱ� ���� ���� �ʽ��ϴ�.");
		}else{
		
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������Ʈ ���μ���</title>
</head>
<body>
	<form action="sungjukUpdateResult.jsp" name ="sungjukUpdateForm">
		<table>
			<tr><td>�й�</td><td><input type="text" name="hakbun" value='<%=hakbun %>' readonly></td></tr>
			<tr><td>�̸�</td><td><input type="text" name="hakbun" value='<%=rs.getString("irum") %>' readonly></td></tr>
			<tr><td>����</td><td><input type="text" name="kor" value='<%=rs.getString("kor") %>'></td></tr>
			<tr><td>����</td><td><input type="text" name="kor" value='<%=rs.getString("eng") %>'></td></tr>
			<tr><td>����</td><td><input type="text" name="kor" value='<%=rs.getString("math") %>'></td></tr>
			<tr><td>����</td><td><input type="text" name="kor" value='<%=rs.getString("tot") %>'></td></tr>
			<tr><td>���</td><td><input type="text" name="kor" value='<%=rs.getString("avg")%>'></td></tr>
			<tr><td>���</td><td><input type="text" name="kor" value='<%=rs.getString("grade")%>'></td></tr>
			<tr><td colspan=2><input type="submit" value="����"></td></tr>
		</table>
	<% }
	}catch(Exception e){
		e.printStackTrace();
	}%>
	
	</form>
</body>
</html>