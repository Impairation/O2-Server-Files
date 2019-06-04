	<OBJECT RUNAT = Server PROGID = ADODB.Connection id = Conn></OBJECT>
<%	
	Conn.Open(Application("c_Connection_ConnectionString"))
%>