	<OBJECT RUNAT = Server PROGID = ADODB.Connection id = Conn1></OBJECT>
<%	
	Conn1.Open(Application("c_Connection_ConnectionString"))
%>