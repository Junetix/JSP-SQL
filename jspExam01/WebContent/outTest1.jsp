<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>1부터 100까지의 합은 <%
int sum = 0;
for(int i=0;i<=100;i++){
	sum+=i;
}
out.print(sum+"입니다.</h2>");
%></h2>
</body>
</html>