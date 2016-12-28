<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="sungjuk.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	if (session.getAttribute("hakbun") == null || (!session.getAttribute("hakbun").equals("admin")))
	{
	  out.println("<script>");
	  out.println("history.back();");
	  out.println("</script>");
	}

	String delete_hakbun = request.getParameter("hakbun");
	DBBean manager = DBBean.getInstance();
 	int result = manager.deleteMember(delete_hakbun);
    if (result == 0){
        out.println("<script>");
        out.println("alert('삭제할 학번을 다시 입력하세요!!!')");
        out.println("history.back();");
        out.println("</script>");
    }else{
    	out.println("<script>");
        out.println("alert('성적 삭제 성공!!!')");
        out.println("location.href='./template.jsp?page=member_list'");
        out.println("</script>"); 
      }
  

%>
