<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ApplicationTest</title>
</head>
<body>
	<h2>���ø����̼� �׽�Ʈ</h2>
	<table border="1">
		<tr>
			<td>JSP����</td>
			<td><%=application.getMajorVersion() %>.<%=application.getMinorVersion() %></td>
			<!-- ����������.���̳ʹ��� ex 3.1 
			�� ������Ʈ�� �ϳ��� ��ü�� �����Ѵ�.
			�� �뵵: ����ڰ������������� �ʿ��Ҷ�
			������ ��������Ʈ�� ���۵Ǹ� ����
			�������� ����Ǹ� �Ҹ�
			
			-->
		</tr>
		<tr>
			<td>�����̳�����</td>
			<td><%=application.getServerInfo() %></td>
		</tr>
		<tr>
			<td>�� ���ø����̼��� ���� ���Ͻý��� ���</td>
			<td><%=application.getRealPath("/") %></td>
		</tr>
	</table>
</body>
</html>