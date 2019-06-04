<%@ LANGUAGE="VBSCRIPT" %>

<%
Response.Buffer = true
Response.Expires=0
%>

<%
Dim Conn, RS, SQL
	
Set Conn = Server.CreateObject ("ADODB.Connection")	
	
Conn.Open(Application("Connection_ConnectionString"))


seq				= Trim(Request.Form("seq"))
musicID			= Trim(Request.Form("musicID"))
ID_category	= Trim(Request.Form("ID_category"))
MusicList		= Trim(Request.Form("MusicList"))
MusicKind		= Trim(Request.Form("MusicKind"))
ID_produce		= Trim(Request.Form("ID_produce"))
ID_composer	= Trim(Request.Form("ID_composer"))
ID_notemaker	= Trim(Request.Form("ID_notemaker"))

subject 			= Trim(Request.Form("subject"))
subject			= replace(subject,"'","¢¥")

List_value		= Trim(Request.Form("List_Value"))

BPM 				= Trim(Request.Form("BPM"))
min 				= Trim(Request.Form("min"))
sec 				= Trim(Request.Form("sec"))

NEasy 			= Trim(Request.Form("NEasy"))
NNormal 		= Trim(Request.Form("NNormal"))
NHard 			= Trim(Request.Form("NHard"))

url 				= Trim(Request.Form("url"))
url					= replace(url,"'","¢¥")

url1				= Trim(Request.Form("url1"))
url1				= replace(url1,"'","¢¥")

content			= Trim(Request.Form("content"))
content			= replace(content,"'","¢¥")
content1			= Trim(Request.Form("content1"))
content1			= replace(content1,"'","¢¥")

jelly				= Trim(Request.Form("jelly"))
gem				= Trim(Request.Form("gem"))

MEasy 			= Trim(Request.Form("MEasy"))
MNormal 		= Trim(Request.Form("MNormal"))
MHard 			= Trim(Request.Form("MHard"))

MoneyType 	= Trim(Request.Form("MoneyType"))

intHtml1 		= Trim(Request.Form("intHtml1"))
intHtml2 		= Trim(Request.Form("intHtml2"))
	
p_pic 			= Trim(Request.Form("pic_1"))
	
ID_category = ""
url = ""
url1 = ""
p_pic_2 = ""
content = ""
content1 = ""
intHtml1 = "1"
intHtml2 = "1"


Conn.BeginTrans

SQL = "Update TB_JAMBOX Set j_subject = '"& subject &"',"
SQL = SQL & "j_musicID = '"& musicID &"',"
SQL = SQL & "j_ListFlag = '"& List_Value &"',"
SQL = SQL & "j_category = '"& ID_category &"',j_kind = '"& MusicList &"',m_kind='"& MusicKind &"',j_produce = '"& ID_produce &"',"
SQL = SQL & "j_BPM ='"& BPM &"',j_min = '"& min &"',j_sec = '"& sec &"',"
SQL = SQL & "NEasy = '"& NEasy &"',NNormal = '"& NNormal &"',NHard = '"& NHard &"',"
SQL = SQL & "MEasy = '"& MEasy &"',MNormal = '"& MNormal &"',MHard = '"& MHard &"',"
SQL = SQL & "p_name = '"& ID_composer &"',n_name = '"& ID_notemaker &"',"
SQL = SQL & "j_url = '"& url &"',j_url1 = '"& url1 &"',"	
SQL = SQL & "p_pic = '"& p_pic &"',"
SQL = SQL & "p_pic2 = '"& p_pic2 &"',"
SQL = SQL & "j_MoneyType = '"& MoneyType &"',j_jelly = '"& jelly &"',j_gem = '"& gem &"',"
SQL = SQL & "content = '"& content &"',content1 = '"& content1 &"',intHtml1 = "& intHtml1 &",intHtml2 = "& intHtml2 &" Where j_seq = " & seq 
Conn.Execute SQL

errcnt = errcnt + Conn.Errors.Count
					
If errcnt = 0 Then
	Conn.CommitTrans
	%>
	<center>
	<input type="button" value="È®ÀÎ" OnClick = "goMain()" style="font: 9pt ±¼¸²; background-color:#E6F1FD; border:1 solid black;">
	</center>
	<%	
Else  
	Conn.RollbackTrans
	%>
	<script language="javascript">
	alert("Cause Error at register information. please wait. then, Try Again.");
	document.location.href = "JamBoxList.asp"
	</script>		
	<%	
End If
			
Conn.Close
Set Conn = Nothing
%>
	
<script language = "javascript">
function goMain()
{
	document.location.href = "JamBoxList.asp"
}
</script>