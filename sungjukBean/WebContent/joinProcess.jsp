<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="sungjuk.DBBean"%>

<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="memberdata" class="sungjuk.MemberDataBean">
	<jsp:setProperty name="memberdata" property="*"/>
</jsp:useBean>
<%	
	DBBean manager = DBBean.getInstance();
	int result = manager.insertMember(memberdata);
		
  	if(result!=0){  			
  		out.println("<script>");
		out.println("alert('회원가입 성공!!!')");
  		out.println("location.href='./template.jsp?page=loginForm'");
  		out.println("</script>");
  		
	}else{
		out.println("<script>");
    	out.println("alert('회원가입 오류!!!')");
    	out.println("history.back()");
    	out.println("</script>"); 
 	}
%>
