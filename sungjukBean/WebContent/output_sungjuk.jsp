<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
request.setCharacterEncoding("euc-kr");
if (session.getAttribute("hakbun") == null || (!session.getAttribute("hakbun").equals("admin")))
{
  out.println("<script>");
  out.println("history.back();");
  out.println("</script>");
}
else
{
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	try {
	    Context init = new InitialContext();
	    DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	    conn = ds.getConnection();
	    String sql1 = "select count(*) from sungjuk order by hakbun";
	    String sql2 = "select * from sungjuk order by hakbun";
	    
	    pstmt=conn.prepareStatement(sql1);
	    rs = pstmt.executeQuery();
	    rs.next();
	    if (rs.getInt(1) == 0)
	    {
%>
           출력할 성적 데이터가 없습니다...
<%
	    }
	    else
	    {
		    pstmt=conn.prepareStatement(sql2);
		    rs = pstmt.executeQuery();
%>
<table border="1" align="center">
<tr align="center">
    <td>학번</td>
    <td>이름</td>
    <td>국어</td>
    <td>영어</td>
    <td>수학</td>
    <td>총점</td>
    <td>평균</td>
    <td>등급</td>
  </tr>
<%	    
		    while(rs.next())
		    {
%>
  <tr align="center">
    <td><%=rs.getString("hakbun") %></td>
    <td><%=rs.getString("irum") %></td>
    <td><%=rs.getInt("kor") %></td>
    <td><%=rs.getInt("eng") %></td>
    <td><%=rs.getInt("math") %></td>
    <td><%=rs.getInt("tot") %></td>
    <td><%=rs.getDouble("avg") %></td>
    <td><%=rs.getString("grade") %></td>
  </tr>
<%
        }
%>
</table>
<%
	    }
	}catch(Exception e){
	  e.printStackTrace();
	}
}
%>

