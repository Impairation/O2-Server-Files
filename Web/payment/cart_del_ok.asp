<%
gameid 		= request("gameid")
seq			= request("seq")
%>
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<BODY BGCOLOR="#67BAF0" TEXT="#000000" LINK="#0000FF" VLINK="#800080">
</BODY>
</HTML>
<%
Set Conn = Server.CreateObject ("ADODB.Connection")
Conn.Open(Application("Connection_ConnectionString"))

	If seq <> "" Then '葛电 沥焊 昏力
		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_DELETE '" & gameid & "', " & seq & ", 'IN', 0"
		Conn.execute(strSQL)
	ElseIf seq = "" Then
		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_DELETE '" & gameid & "', 0, 'IA', 0"
		Conn.execute(strSQL)
	End If
Conn.Close
Set Conn = Nothing
%>
<script>	alert("项目已删除");	document.location.href="payment_step01.asp?gameid=<%=gameid%>";</script>
