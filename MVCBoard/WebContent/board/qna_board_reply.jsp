<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "net.board.db.*" %>

<%
	BoardBean board = (BoardBean) request.getAttribute("boarddata");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MVC �Խ���</title>
<script language="javascript">
	function replyboard() {
		boardform.submit();
	}
</script>
</head>
<body>
<!-- �Խ��� �亯 -->
<form action="./BoardReplyAction.bo" method="post" name="boardform">
	<input type="hidden" name="BOARD_NUM" value="<%=board.getBOARD_NUM() %>">
	<input type="hidden" name="BOARD_RE_REF" value="<%=board.getBOARD_RE_REF() %>">
	<input type="hidden" name="BOARD_RE_LEV" value="<%=board.getBOARD_RE_LEV() %>">
	<input type="hidden" name="BOARD_RE_SEQ" value="<%=board.getBOARD_RE_SEQ() %>">
	
	<table cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="5">MVC �Խ���</td>
		</tr>
		<tr>
			<td style="font-famil:����; font-size:12" height="16">
				<div align="center">�۾���</div>
			</td>
			<td>
				<input name="BOARD_NAME" type="text"/>
			</td>
		</tr>
		<tr>
			<td style="font-famil:����; font-size:12" height="16">
				<div align="center">����</div>
			</td>
			<td>
				<input name="BOARD_SUBJECT" type="text" size="50" maxlength="100" value="Re:<%=board.getBOARD_SUBJECT() %>"/>
			</td>
		</tr>
		<tr>
			<td style="font-famil:����; font-size:12" height="16">
				<div align="center">����</div>
			</td>
			<td>
				<textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>
			</td>
		</tr>
		<tr>
			<td style="font-famil:����; font-size:12" height="16">
				<div align="center">��й�ȣ</div>
			</td>
			<td>
				<input name="BOARD_PASS" type="password">
			</td>
		</tr>
		
		<tr bgcolor="cccccc">
			<td colspan="2" style="height:1px;">
			</td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		
		<tr align="center" valign="middle">
			<td colspan="5">
			<a href="javascript:replyboard()">[���]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[�ڷ�]</a>
			</td>
		</tr>
		
	</table>
</form>
<!-- �Խ��� �亯 -->
</body>
</html>