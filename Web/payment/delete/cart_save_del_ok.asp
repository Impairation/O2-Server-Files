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

	If seq <> "" Then
		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_DELETE '" & gameid & "', " & seq & ", 'SN', 0"
		Conn.execute(strSQL)
	Elseif seq = "" Then
		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_DELETE '" & gameid & "', 0, 'SA', 0"
		Conn.execute(strSQL)
	End If
Conn.Close
Set Conn = Nothing
%>
<script>	alert("´¢´æÏîÄ¿ÒÑÉ¾³ı");document.location.href="payment_step01.asp?gameid=<%=gameid%>";</script>