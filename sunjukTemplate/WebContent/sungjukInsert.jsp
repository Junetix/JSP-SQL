<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>성적 입력</title>
</head>
<body>
	<center>
	<form action="sungjukInsertProcess.jsp" method="post" name="sungjukInsertForm">
		<table border=1>
			<tr>
				<td align="right">학번:</td><td><input type="text" name="hakbun"></td></tr>
			<tr><td align="right">이름:</td><td><input type="text" name="name"></td></tr>
			<tr><td align="right">국어:</td><td><input type="text" name="kor"></td></tr>
			<tr><td align="right">영어:</td><td><input type="text" name="eng"></td></tr>
			<tr><td align="right">수학:</td><td><input type="text" name="math"></td></tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입"/>
					<input type="reset" value="다시작성"/>
				</td>
			</tr>
		
		</table>
	
	
	
	
	</form>
	
	
	</center>

</body>
</html>