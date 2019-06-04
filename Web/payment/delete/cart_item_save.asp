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

If seq <> "" Then '한아이템만 보관함으로 옮긴다.
	strSQL = "SELECT pid,gName,i_Gem,i_price,i_point,gFlag FROM TB_IMSI_CART Where memberID='"& gameid &"' AND i_seq="&seq  

	Set objDBrs = Conn.Execute(strSQL)
	
	If Not(objDBrs.BOF or objDBrs.EOF) then
		pid	 		= objDBrs(0)
		gName 		= objDBrs(1)
		i_Gem	 	= objDBrs(2)
		i_price	 	= objDBrs(3)
		i_point		= objDBrs(4)
		gFlag 		= objDBrs(5)

		strSQL = "PROC_PAYMENT_SAVECART_COMMAND_INSERT"
		strSQL = strSQL & "'"&gameid&"',"&pid&",'"&gName&"',"&i_Gem&","&i_price&","&i_point&",'"&gFlag&"',0"
		Conn.Execute(strSQL)

		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_DELETE '" & gameid & "', " & seq & ", 'IN', 0"
		Conn.execute(strSQL)
	End IF
	objDBrs.Close
	Set objDBrs = Nothing

ELSEIF seq = "" Then '전체를 보관함으로 옮긴다

	strSQL = "SELECT pid,gName,i_Gem,i_price,i_point,gFlag,regDate FROM TB_IMSI_CART Where memberID='"& gameid &"'"  
	Set objDBrs	= Conn.Execute(strSQL)
		
	If Not(objDBrs.BOF or objDBrs.EOF) Then

		Do Until objDBrs.EOF
			pid 			= objDBrs(0)
			gName 		= objDBrs(1)
			i_Gem 		= objDBrs(2)
			i_price		= objDBrs(3)
			i_point		= objDBrs(4)
			gFlag 		= objDBrs(5)

			strSQL = "PROC_PAYMENT_SAVECART_COMMAND_INSERT"
			strSQL = strSQL & "'"&gameid&"',"&pid&",'"&gName&"',"&i_Gem&","&i_price&","&i_point&",'"&gFlag&"',0"
			Conn.Execute(strSQL)

			objDBrs.Movenext
			i = i + 1
		Loop
		objDBrs.Close
		Set objDBrs = Nothing
	End If

	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_DELETE '" & gameid & "', 0, 'IA', 0"
	Conn.execute(strSQL)

End If
Conn.Close
Set Conn = Nothing
%>
<script>	alert("淃커綠뇨닸");	document.location.href="payment_step01.asp?gameid=<%=gameid%>";</script>