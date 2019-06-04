	<OBJECT RUNAT = Server PROGID = ADODB.Connection id = Conn></OBJECT>
<%	
	Conn.Open(Application("Connection_ConnectionString"))
%>