	<OBJECT RUNAT = Server PROGID = ADODB.Connection id = Conn></OBJECT>
<%	
	Conn.Open(Application("m_Connection_ConnectionString"))
%>