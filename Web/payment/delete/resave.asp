<%@ LANGUAGE="VBSCRIPT" %>

<%
Response.Buffer = true
Response.Expires=0

	gameid 		= request("gameid")
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

	if request.form("s_seq").count then
	for intloop=1 to request.form("s_seq").count

	SEQ = request.form("s_seq")(intloop)

	SQL = "SELECT s_seq,memberID,pid,gName,s_Gem,s_price,s_point,gFlag,regDate"
	SQL = SQL & " FROM TB_SAVE_CART Where memberID='"& gameid &"' AND s_seq = "& SEQ  
	Set RS	= Conn.Execute(SQL)
	
	If Not(RS.BOF or RS.EOF) Then
		s_seq 		= RS(0)
		s_memberID 	= RS(1)
		s_pid 		= RS(2)
		s_gName 	= RS(3)
		s_Gem 		= RS(4)
		s_price 	= RS(5)
		s_point 	= RS(6)
		sFlag 		= RS(7)
		s_regDate 	= RS(8)
	End If
	
	RS.Close
	Set RS = Nothing

	iSQL = "Insert into TB_IMSI_CART(memberID,pid,gName,i_Gem,i_price,i_point,gFlag,regdate)"
	iSQL = iSQL & " values "
	iSQL = iSQL & "('"& gameid &"','"& s_pid &"','"& s_gName &"',"& s_Gem &","& s_price &",'"& s_point &"','"&sFlag&"',getdate())"
	Conn.Execute iSQL

	SQL="DELETE FROM TB_SAVE_CART WHERE memberID='" & gameid & "' AND s_seq=" & SEQ
	Conn.execute(SQL)
	next
%>
	<script language="javascript">
		alert("将选好的道具放入储存箱中.");
		document.location.href="payment_step01.asp?gameid=<%=gameid%>";
	</script>
<% else %>
	<script language="javascript">
		alert("您未选择任何道具.");
		history.go(-1);
	</script>
<%
	end if

Conn.Close
Set Conn = Nothing
%>
