<%@ LANGUAGE="VBSCRIPT" %>

<%

Response.Buffer = true
Response.Expires=0

	gameid 		= request("gameid")
	seq			= request("seq")
	memo 		= request("memo")
	memberNick	= request("memberNick")
%>
<HTML>
<HEAD>
<TITLE></TITLE>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" bgcolor="#67BAF0" topmargin="0" leftmargin="0">
<form action="/gift/gift_step_02.asp" method="post" name="backForm">
<input type="hidden" name="gameid" value="<%=gameid%>">
<input type="hidden" name="memberNick" value="<%=memberNick%>">
<input type="hidden" name="memo" value="<%=memo%>">
</form>
</BODY>
</HTML>


<%
	Set Conn = Server.CreateObject ("ADODB.Connection")
	Conn.Open (Application("Connection_ConnectionString"))

	IF seq <> "" Then
		SQL="DELETE FROM TB_GIFT_IMSI_CART WHERE memberID='" & gameid & "' AND i_seq=" & seq
		Conn.execute(SQL)
	ELSEIF seq = "" Then
		SQL="DELETE FROM TB_GIFT_IMSI_CART WHERE memberID='" & gameid & "'"
		Conn.execute(SQL)
	END IF

	Conn.Close
	Set Conn = Nothing
%>


	<script language="javascript">
		alert("ÏîÄ¿ÒÑÉ¾³ı.");
		document.backForm.submit();
	</script>
