<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="sungjuk.*"%>

<%
	request.setCharacterEncoding("euc-kr");
	String hakbun=request.getParameter("hakbun");
	String password=request.getParameter("pw");
	
	DBBean manager = DBBean.getInstance();
	int check = manager.userCheck(hakbun, password);
	MemberDataBean memberdata =  manager.selectMember(hakbun);
	String irum = memberdata.getIrum();
	if(check==1){
		session.setAttribute("hakbun",hakbun);
		session.setAttribute("irum",irum);
  		out.println("<script>");
  		out.println("location.href='./template.jsp?page=main'");
  		out.println("</script>");
  			
  	}else if(check==0){
		out.println("<script>");
		out.println("alert('�н����尡 �ٸ��ϴ�.')");
		out.println("location.href='./template.jsp?page=loginForm'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('���̵�� �н����带 �ٽ� �Է��ϼ���.')");
		out.println("location.href='./template.jsp?page=loginForm'");
		out.println("</script>");
	}
%>
