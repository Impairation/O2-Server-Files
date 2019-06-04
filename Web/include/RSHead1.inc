<OBJECT RUNAT = Server PROGID = ADODB.Connection id = Conn></OBJECT>
<OBJECT RUNAT = Server PROGID = ADODB.RecordSet id = RS></OBJECT>
<%	
	Conn.Open(Application("Connection_ConnectionString"))
%>