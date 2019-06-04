<%@ LANGUAGE="VBSCRIPT" %>

<%
Response.Buffer = true
Response.Expires = 0


Dim Conn, RS, SQL
	
Set Conn = Server.CreateObject ("ADODB.Connection")	
	
Conn.Open(Application("Connection_ConnectionString"))

musicID			= Trim(Request.Form("musicID"))	
MusicList		= Trim(Request.Form("MusicList"))
MusicKind		= Trim(Request.Form("MusicKind"))
ID_produce		= Trim(Request.Form("ID_produce"))
ID_composer	= Trim(Request.Form("ID_composer"))
ID_notemaker	= Trim(Request.Form("ID_notemaker"))

subject			= Trim(Request.Form("subject"))
subject			= replace(subject,"'","´")

List_value		= Trim(Request.Form("List_Value"))

BPM 				= Trim(Request.Form("BPM"))
min 				= Trim(Request.Form("min"))
sec 				= Trim(Request.Form("sec"))

NEasy 			= Trim(Request.Form("NEasy"))
NNormal 		= Trim(Request.Form("NNormal"))
NHard 			= Trim(Request.Form("NHard"))
	
content			= Trim(Request.Form("content"))
content			= replace(content,"'","´")
content1			= Trim(Request.Form("content1"))
content1			= replace(content1,"'","´")

jelly				= Trim(Request.Form("jelly"))
gem				= Trim(Request.Form("gem"))

MEasy 			= Trim(Request.Form("MEasy"))
MNormal 		= Trim(Request.Form("MNormal"))
MHard 			= Trim(Request.Form("MHard"))

MoneyType	= Trim(Request.Form("MoneyType"))

intHtml1 		= Trim(Request.Form("intHtml1"))
intHtml2 		= Trim(Request.Form("intHtml2"))
	
pic_1		 		= Trim(Request.Form("pic_1"))
	
ID_category= ""
url = ""
url1 = ""
pic_2 = ""	
content = ""
content1 = ""
intHtml1 = "1"
intHtml2 = "2"

	
Conn.BeginTrans
		
SQL = "Insert into TB_JAMBOX(j_musicID,j_subject,j_ListFlag,j_category,j_kind,m_kind,j_produce,"
SQL = SQL & "j_BPM,j_min,j_sec,NEasy,NNormal,NHard,MEasy,MNormal,MHard,p_name,n_name,j_url,j_url1,"
SQL = SQL & "p_pic,p_pic2,j_MoneyType,j_jelly,j_gem,content,content1,RegDate,intHtml1,intHtml2,readnum) values ("
SQL = SQL & ""&musicID&",'"& subject &"','"& List_Value &"','"& ID_category &"','"& MusicList &"','"& MusicKind &"','"& ID_PRODUCE &"',"
SQL = SQL & "'"& BPM &"','"& min &"','"& sec &"','"& NEasy &"','"& NNormal &"','"& NHard &"',"
SQL = SQL & "'"& MEasy &"','"& MNormal &"','"& MHard &"','"& ID_composer&"','"& ID_notemaker &"',"
SQL = SQL & "'"& url &"','"& url1 &"','"& pic_1 &"','"& pic_2 &"','"& MoneyType &"',"
SQL = SQL & "'"& jelly &"','"& gem &"','"& content &"','"& content1 &"',getdate(),"& intHtml1 &","& intHtml2 &",1)"
		
Conn.Execute SQL
errcnt = errcnt + Conn.Errors.Count
		
If errcnt = 0 Then
	Conn.CommitTrans
	%><input type="button" value="Approve!" onclick="goMain()"><%	
Else  
	Conn.RollbackTrans
	%>
	<script language="javascript">
		//alert("정보 등록 도중에러 발생 했습니다. 잠시후에 다시 등록 해주십시요");
		alert("Cause Error at register information, please wait. Try again.");
		document.location.href = "music_add.asp"
	</script>		
	<% 
End If
	
Conn.Close
Set Conn = Nothing
%>

<script language = "javascript">
	function goMain()
	{
		document.location.href = "music_add.asp"
	}
</script>