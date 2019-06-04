-----------------------------------------------------<br>
Written by NoSoundin Snow<br>
Date:06.2.12<br>
Note:add music to jambox and to show in the musicshop<br>
-----------------------------------------------------<br>
<%
	Dim Conn, Conn1, objDBrs, objDBrs1,strsql,strsql1
	Dim Mcash,Gem
	Dim SType
	Dim MTYPE
	Dim EDITOR
	'连接数据库

	Set Conn1 = Server.CreateObject("ADODB.Connection")
	Conn1.Open(Application("c_Connection_ConnectionString"))
	'读取音乐数据
	strSQL = "Select * From T_o2jam_music_data"
	Set objDBrs = Conn1.Execute(strSQL)
	Do while not objdbrs.eof
	'好晕阿，这代码每面有点太!@#!@#!@$%@#%了吧，你们俩也应该帮帮忙吧？！:(
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open(Application("Connection_ConnectionString"))
	url="http://localhost:15000"
	pic_1="MUSIC" & objDBrs("id") & ".GIF"
	count=count+1
	'第二次添加
	Mcash=objDBrs("MCASH")
	GEM=objDBrs("GEM")
	if Mcash<>0 or GEM<>0 then
		Stype="P"
	else
		STYPE="F"
	end if
	if Len(objDBrs("EDITOR"))>11 then
		Editor=left(objDBrs("EDITOR"),8) & ".."
	else
		Editor=objDBrs("EDITOR")
	end if
	
	on error resume next
	strsql1 = "Insert into TB_JAMBOX(j_seq,j_musicID,j_subject,j_ListFlag,j_category,j_kind,m_kind,j_produce,"
	strsql1 = strsql1 & "j_BPM,j_min,j_sec,NEasy,NNormal,NHard,MEasy,MNormal,MHard,p_name,n_name,j_url,j_url1,"
	strsql1 = strsql1 & "p_pic,p_pic2,j_MoneyType,j_jelly,j_gem,content,content1,RegDate,intHtml1,intHtml2,readnum) values ("
	strsql1 = strsql1 & "" & Count & "," & objDBrs("ID") &",'"& objDBrs("TITLE") &"','"& "1" &"','"& ID_category &"','"& objDBrs("GEnRE") &"','"& "INSTRUMENTAL" &"','"& objDBrs("ARTIST") &"',"
	strsql1 = strsql1 & "'"& objDBrs("BPM") &"','"& int(objDBrs("play_time_easy")/60) &"','"& objDBrs("play_time_easy")-int(objDBrs("play_time_easy")/60)*60 &"','"
	strsql1 = strsql1 & objDBrs("NOTE_COUNT_EASY_ALL") &"','"& objDBrs("NOTE_COUNT_NORMAL_ALL") &"','"
	strsql1 = strsql1 & objDBrs("Note_count_hard_all") &"',"
	strsql1 = strsql1 & "'"& objDBrs("NOTE_LEVEL_EASY") &"','"& objDBrs("NOTE_LEVEL_Normal") &"','"& objDBrs("Cell_Count_Hard") &"','"& objDBrs("ARTIST") &"','"& EDITOR &"',"
	strsql1 = strsql1 & "'"& url &"','"& url &"','"& pic_1 &"','"& pic_1 &"','"& Stype &"',"
	strsql1 = strsql1 & "'" & Mcash & "','"& GEM &"','','',getdate(),1,1,1)"
	%>添加<B><%=objDBrs("Title")%>成功!</b><BR><%
	Set strsql1 = Conn.Execute(strSQL1)
	set strsql1=nothing
	conn.close
	
	objdbrs.movenext
	loop
%>