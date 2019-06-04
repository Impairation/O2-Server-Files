<%
dim strDBCon,objConn
function conncreat()
	Dim strDBCon
	strDBCon = "DRIVER={SQL Server};SERVER=192.168.1.12; database=O2JAM;UID=sa;PWD=123456;"
	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Open(strDBCon)
end function

function connclose()
	objConn.close
	set objConn = nothing
end function
%>