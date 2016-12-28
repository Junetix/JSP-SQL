<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	String hakbun = null;
    	if(session.getAttribute("hakbun")!=null){
    		hakbun = (String) session.getAttribute("hakbun");
    		out.println(hakbun+"님의 로그인 메뉴<br/>");
    		
    		if(hakbun.equals("admin")){
    			out.println("<a href='template.jsp?page=sungjukInsert'>성적 입력</a><br/>");
    			out.println("<a href='template.jsp?page=sungjukList'>성적 출력</a><br/>");
    			out.println("<a href='template.jsp?page=sungjukQuery'>성적 조회</a><br/>");
    			out.println("<a href='template.jsp?page=sungjukUpdate'>성적 수정</a><br/>");
    			out.println("<a href='template.jsp?page=sungjukDelete'>성적 삭제</a><br/>");
    		}else{
    			out.println("<a href='template.jsp?page=sungjukQuery'>성적 조회</a><br/>");
    		}
    	}else{
			out.println("로그인 하세요!");
		}
    
    
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>