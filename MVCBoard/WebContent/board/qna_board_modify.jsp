<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="net.board.db.*" %>

<% BoardBean board = (BoardBean)request.getAttribute("boarddata"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
</head>
<body>
<!-- 게시판 수정 -->
	<form action="./BoardModifyAction.bo" method="post" name="modifyform">
	<input type=hidden name="BOARD_NUM" value=<%=board.getBOARD_NUM() %>>
		<table cellpadding="0" cellspacing=0>
			<tr align=center valign=middle>
				<td colspan=5>MVC 게시판 </td>
			</tr>
			<tr>
				<td style="font-family:돋움;font-size:12" height=16>
					<div align=center>제 목</div>
				</td>
				<td>
					<input name="BOARD_SUBJECT" type=text size=50 maxlength=100 value="<%=board.getBOARD_SUBJECT()%>"/>
				</td>
			</tr>
			<tr>
				<td style="font-family:돋움;font-size:12">
					<div align=center>내 용</div>
				</td>
				<td>
					<textarea name="BOARD_CONTENT" cols=67 rows=15><%=board.getBOARD_CONTENT() %></textarea>
				</td>
			</tr>
			<% if(!(board.getBOARD_FILE()==null)){ %>
			<tr>
				<td style="font-family:돋움;font-size:12">
					<div align=center>파일첨부</div>
				</td>
				<td>
					&nbsp;&nbsp;<%=board.getBOARD_FILE() %>
				</td>
			</tr>
			<%} %>
			<tr>
				<td height=16 style="font-family:돋움; font-size:12;">
					<div align="center">비밀번호</div>
				</td>
				<td>
					<input type="password" name="BOARD_PASS">
				</td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan=2 style=height:1px;>
				</td>
			</tr>	
			<tr><td colspan=2>&nbsp;</td></tr>
			<tr align=center valign=middle>
				<td colspan=5>
				<font size=2>
					<a href="javascript:modifyboard()">[등록]</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;		
				</font>
				</td>
			</tr>
		
		</table>
	
	
	</form>
<!-- 게시판 수정 종료 -->
</body>
</html>