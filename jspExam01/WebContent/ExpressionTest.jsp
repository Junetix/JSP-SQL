<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%!//���� �� ���� Ŭ������ �Լ�
	public int sum() {
		int total = 0;
		for (int i = 0; i <= 100; i++) {
			total += i;
		}
		return total;
	}%>
<%
	String str = "1���� 100������ ��"; //���� ����
%>


<title>Insert title here</title>
</head>
<body>
	<h2><%=str%>��<b><%=sum()%></b>�Դϴ�.
	</h2>
	<br>
	<!-- ǥ������ %=�� ǥ���մϴ�. -->
	<h2><%=str%>��3�� ���ϸ�<b><%=sum() * 3%></b>�Դϴ�.
	</h2>
	<br>
	<h2><%=str%>�� 1000���� ������<b><%=sum() / 1000.%></b>�Դϴ�.
	</h2>
	<br>
</body>
</html>