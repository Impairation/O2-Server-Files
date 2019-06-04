
var strTable;
var strURL;
strURL='http://o2jam.9you.com/';


strTable='';
strTable += '<table width="170" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:5px "><tr><td><img src="'+ strURL +'image/index_top5_04.gif" width="170" height="28"></td></tr>';
strTable += '<tr><td background="'+strURL+'image/index_top5_02.gif"><img src="'+strURL+'image/blank.gif" width="5" height="5"></td></tr>';




<%
Function filter_func(filter_word)          //¹ýÂË²ÎÊý
    filter_word=replace(filter_word,"'","\'")
filter_func=filter_word
End function 



Set Conn = Server.CreateObject ("ADODB.Connection")
Conn.Open (Application("Connection_ConnectionString"))

strSQL = "PROC_RANKING_LIST_UP" 
set objDBrs=server.CreateObject ("ADODB.Recordset") 
objDBrs.open strSQL ,Conn,1 ,3
'Set objDBrs	= Conn.Execute(strSQL)


If Not(objDBrs.BOF or objDBrs.EOF) then

	dim a 
	a=1
response.write "" & Chr(13)
	while a <=5 and not (objDBrs.EOF)
		response.write"strTable+='<tr><td height=21 background=""'+strURL+'image/index_top5_02.gif""><img src=""'+strURL+'image/index_top5_icon" & a & ".gif"" width=15 height=15 hspace=10 align=absbottom>"& filter_func(objDBrs("User_NickName")) &"</td>';"  & Chr(13)

		//response.write a & " - "
		//response.write objDBrs("User_NickName")& "<br>"
		objDBrs.Movenext
		a=a+1
	wend

response.write "" & Chr(13)
%>

<%
objDBrs.Close
Set objDBrs = Nothing
Conn.Close
Set Conn = Nothing
end if
%>

strTable += '<tr><td background="'+strURL+'image/index_top5_02.gif"><img src="'+strURL+'image/blank.gif" width="5" height="5"></td></tr><tr><td><img src="'+strURL+'image/index_top5_03.gif" width="170" height="4"></td></tr></table>';
document.write(strTable);

<%
response.end
%>
