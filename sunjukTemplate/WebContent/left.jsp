<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	String hakbun = null;
    	if(session.getAttribute("hakbun")!=null){
    		hakbun = (String) session.getAttribute("hakbun");
    		out.println(hakbun+"���� �α��� �޴�<br/>");
    		
    		if(hakbun.equals("admin")){
    			out.println("<a href='template.jsp?page=sungjukInsert'>���� �Է�</a><br/>");
    			out.println("<a href='template.jsp?page=sungjukList'>���� ���</a><br/>");
    			out.println("<a href='template.jsp?page=sungjukQuery'>���� ��ȸ</a><br/>");
    			out.println("<a href='template.jsp?page=sungjukUpdate'>���� ����</a><br/>");
    			out.println("<a href='template.jsp?page=sungjukDelete'>���� ����</a><br/>");
    		}else{
    			out.println("<a href='template.jsp?page=sungjukQuery'>���� ��ȸ</a><br/>");
    		}
    	}else{
			out.println("�α��� �ϼ���!");
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