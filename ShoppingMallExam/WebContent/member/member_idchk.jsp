<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<% 
	String id = (String)request.getAttribute("id");
	int check = ((Integer)(request.getAttribute("check"))).intValue();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑몰</title>
	<script type="text/javascript">
	 function windowclose(){
		 opener.document.joinform.MEMBER_ID.value="<%=id%>";
		 self.close();
	 }
	
	</script>


</head>
<body bgcolor="f5f5f5">
	<% if(check == 1){ %>

</body>
</html>