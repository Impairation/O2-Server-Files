<%'ҳ���������
Server.ScriptTimeout = 30000
REFERER_Page = "/gift/gift_step_02.asp"
HTTP_REFERER = Request.ServerVariables("HTTP_REFERER")
If Len(REFERER_Page) = 0 Then
	If Len(HTTP_REFERER) = 0 Then		
		Response.Write "<div align='center'>��������..<br><br>��������������������.</div>"
		Response.End
	End If
Else	
	REFERER_Page = "http://" & Request.ServerVariables("HTTP_HOST") & REFERER_Page & ""
	If InStr(HTTP_REFERER, "?") > 0 Then		
		HTTP_REFERER = Mid(HTTP_REFERER, 1,  InStr(HTTP_REFERER, "?") -1)
	End If
	If(HTTP_REFERER <> REFERER_Page)	Then
		Response.Write "HTTP_REFERER 		: " & HTTP_REFERER & "<br>"
		Response.Write "REFERER_Page 		: " & REFERER_Page & "<br>"		
		Response.Write("<div align='center'>" & HTTP_REFERER & "��������.<br><br>��������������������.</div>")
		Response.End
	End If
End If
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#67BAF0" topmargin="0" leftmargin="0"  oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<%'��������
dim gameid, strUserID, chkCashType, strUserPwd, memo, ToWhoID, memberNick
dim strSQL
dim objDBrs, objDBrsI
dim Conn1,Conn
dim OrderNo, curtime, dateYY, dateMM, dateDD, dateHH, dateMI, dateSE	'���������
dim USER_INDEX_ID, USER_ID, USER_NICKNAME
dim nick_USER_INDEX_ID, nick_USER_ID, nick_USER_NICKNAME, nick_SEX
dim Gem,O2Cash,MusicCash,ItemCash,MCash		'���˻���
dim emptyBag, ShopBag(29)	'�����
	emptyBag=0
dim transactCheck1, transactCheck2	'�����жϱ�־
	transactCheck1=0
	transactCheck2=0
dim totalRecord_seq, totalRecord_gem, totalRecord_price	'������ۼƼ۸�
	totalRecord_seq = 0
	totalRecord_gem = 0
	totalRecord_price = 0
dim sumName
dim U9_mchk, U9_itemnuma, U9_itemnumb, arrayU9_itemnuma	'���������ļ�¼
	'U9_mchk=3
	U9_itemnuma=""
	U9_itemnumb=""
dim objDBrsJZ
%>

<% '�Զ��庯��
function connClose()'�ͷ����ݿ�����
	Conn1.close
	Conn.close
	set Conn1 = nothing
	set Conn  = nothing
end function

function RTgem(gem)
RTgem = CLng(gem * 1)
end function

function RTmcash(mcash)
RTmcash = CLng(mcash * 1.2)
end function

function RTo2cash(o2cash)
RTo2cash = CLng(o2cash * 1)
end function
%>

<%'��ò���
gameid		= UCASE(Trim(Request.Form("gameid")))
gameid2		= Trim(Request.Form("gameid"))
strUserID	= gameid
chkCashType	= Trim(Request.Form("chkCashType"))
strUserPwd	= Trim(Request.Form("UserPwd"))
memo		= Trim(Request.Form("memo"))
ToWhoID		= Trim(Request.Form("ToWhoID"))
'memberNick	= Trim(Request.Form("memberNick"))
%>

<%'���ڹ���
If strUserPwd = "" or gameid = "" or ToWhoID = "" or memo = "" Then
	Response.Write "<script>alert('�û���Ϣ����.');history.back();</script>"
	Response.end
End If
%>

<%'���ɶ������
curtime = Now  
dateYY		= year(curtime)
dateMM		= month(curtime)
If Len(dateMM) < 2 Then dateMM = "0" & dateMM
dateDD		= day(curtime)
If Len(dateDD) < 2 Then dateDD = "0" & dateDD
dateHH		= hour(curtime)
If Len(dateHH) < 2 Then dateHH = "0" & dateHH
dateMI		= minute(curtime)
If Len(dateMI) < 2 Then dateMI = "0" & dateMI
dateSE		= second(curtime)
If Len(dateSE) < 2 Then dateSE = "0" & dateSE
OrderNo = gameid & "-" & dateYY & dateMM & dateDD & dateHH & dateMI & dateSE
%>

<%'�������ݿ�����
'gamedb
Set Conn1 = Server.CreateObject("ADODB.Connection")
Conn1.Open(Application("c_Connection_ConnectionString"))
'tradedb
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open(Application("Connection_ConnectionString"))
%>


<%'��ȡ�û�USER_INDEX_ID
strSQL = "P_O2JAM_MY_SIMPLE_INFO '"& gameid &"'"
Set objDBrs	= 	Conn1.Execute(strSQL)
if not(objDBrs.eof or objDBrs.bof) then
	USER_INDEX_ID	= int(objDBrs("USER_INDEX_ID"))
	USER_ID			= Trim(objDBrs("USER_ID"))
	USER_NICKNAME	= Trim(objDBrs("USER_NICKNAME"))
	USER_NICKNAME	= replace(USER_NICKNAME,"'","''")
else
	objDBrs.close
	Set objDBrs = Nothing
	connClose()
	Response.Write "<script>alert('�û�������.');history.back();</script>"
	Response.end
end if
objDBrs.close
Set objDBrs = Nothing
%>

<%'�ж��û�����
strSQL = "SELECT passwd FROM member WHERE userid = '" & gameid & "'"
Set objDBrs = Conn1.Execute(strSQL)
If objDBrs.EOF Or objDBrs.BOF Then
	objDBrs.close
	Set objDBrs = Nothing
	connClose()
	Response.Write "<script>alert('�û�������.');history.back();</script>"
	Response.end
else
	if Trim(objDBrs("passwd")) = strUserPwd then
	else
		objDBrs.close
		Set objDBrs = Nothing
		connClose()
		Response.Write "<script>alert('���벻��ȷ.');history.back();</script>"
		Response.end
	end if
end if
%>



<%'�ж϶Է��û�	nick_USER_INDEX_ID
strSQL = "P_O2JAM_MY_SIMPLE_INFO '"& ToWhoID &"'"
Set objDBrs	= 	Conn1.Execute(strSQL)
if not(objDBrs.eof or objDBrs.bof) then
	nick_USER_INDEX_ID	= int(objDBrs("USER_INDEX_ID"))
	nick_USER_ID		= Trim(objDBrs("USER_ID"))
	nick_USER_NICKNAME	= Trim(objDBrs("USER_NICKNAME"))
	nick_USER_NICKNAME	= replace(nick_USER_NICKNAME,"'","''")
	if Trim(objDBrs("SEX"))="m" then
		nick_SEX = 1
	else
		nick_SEX = 0
	end if
else
	objDBrs.close
	Set objDBrs = Nothing
	connClose()
	Response.Write "<script>alert('�����û�������.');history.back();</script>"
	Response.end
end if
objDBrs.close
Set objDBrs = Nothing
%>


<!-- #include file="INC_VIEW_USERCASH.asp" --><%'��ȡ�û����˻���%>


<%'������Ʒ�հ���	emptyBag
dim i
strSQL = "P_o2jam_load_item_bag " & nick_USER_INDEX_ID
set objDBrs = Conn1.Execute(strSQL)
If not(objDBrs.BOF or objDBrs.EOF) Then
	for i = 0 to 29
		ShopBag(i) = objDBrs(i)
		if objDBrs(i)=0 then
			emptyBag = emptyBag +1
		end if
	next
end if
objDBrs.close
set objDBrs = nothing
%>

<%'��������
Conn.BeginTrans 
Conn1.BeginTrans
%>

<%
'������ߺ�����
strSQL = "select * from TB_GIFT_IMSI_CART where gFlag != 'T' and memberID='" & gameid & "'"
set objDBrs=server.CreateObject ("ADODB.Recordset") 
objDBrs.open strSQL ,Conn,1 ,3
'set objDBrs = Conn.Execute(strSQL)
If not(objDBrs.BOF or objDBrs.EOF) Then		'�жϹ��ﳵ���Ƿ������ֺ͵���
	while not(objDBrs.BOF or objDBrs.EOF)	'�������ֺ͵���
		'��Ʒ>>����
		if objDBrs("gFlag") = "I" then		
			set objDBrsI = Conn1.Execute("U9_ITEM_CHECK "& nick_USER_INDEX_ID &", " & objDBrs("pid") )	'����Ƿ��Ѿ����ڸõ���
			if objDBrsI.eof or objDBrsI.bof then
				set objDBrsIb = Conn1.Execute("U9_ITEM_SELECT "& objDBrs("pid"))	'���ظõ�����Ϣ
				if objDBrsIb("VAL")=2 or objDBrsIb("VAL")=nick_SEX then	'�Ա���
					totalRecord_seq = totalRecord_seq +1
					'�����߼��빺����־
					Conn.Execute "U9_BILL_LOG_INSERT '"& OrderNo &"', '"& gameid &"', "& objDBrsIb("ID") &", '"& objDBrsIb("NAME") &"', "& RTgem(objDBrsIb("GEM")) &", "& RTmcash(objDBrsIb("MCASH")) & ",0,'I','"& curtime &"', '1','"& nick_USER_ID &"', '"& nick_USER_NICKNAME &"', 0, 0" ,transactCheck1
'response.write
'transactCheck2=1


					'���󲶻�
					if transactCheck1 <> 1 or conn.Errors.Count>0 then
						conn.Errors.Clear
						transactCheck2=transactCheck2+1
						transactCheck1=0
						response.write "sp_error_226<br>"
					else
						transactCheck1=0
					end if
					'�ۼƽ��
					totalRecord_gem = totalRecord_gem + RTgem(objDBrsIb("GEM"))
					totalRecord_price = totalRecord_price + RTmcash(objDBrsIb("MCASH"))
					'�ۼƹ���ĵ���
					U9_itemnuma = U9_itemnuma & objDBrs("pid") & "-"
					'�ۼƹ���ĵ�������
					sumName = sumName & "," & objDBrsIb("NAME")

					'�����߼���Է����ݿ�
					Conn1.Execute "P_o2jam_gift_item_buy "& nick_USER_INDEX_ID &", "& objDBrsIb("ID") &", "& USER_INDEX_ID &", '"& USER_NICKNAME & "'" & "," &totalrecord_price,transactCheck1
					'���󲶻�
					if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
						Conn1.Errors.Clear
						transactCheck2=transactCheck2+1
						transactCheck1=0
						response.write "sp_error_245<br>"
					else
						transactCheck1=0
					end if

					'ʶ���ָ���
					JZ_count=0
					strSQLJZ = "select * from T_o2jam_item_data_attribute where ITEM_INDEX_ID = " & objDBrsIb("ID")
					set objDBrsJZ=server.CreateObject ("ADODB.Recordset") 
					objDBrsJZ.open strSQLJZ ,Conn1,1 ,3
					check_JZ = 0
					check_JZ2 = 0
					if NOT(objDBrsJZ.eof or objDBrsJZ.bof) then	'��ָ����
						JZ_count = objDBrsJZ("ITEM_USE_COUNT")
						check_JZ = 1
					end if
					objDBrsJZ.close
					set objDBrsJZ = nothing


					'�ж��û����޸ý�ָ��ʹ�ô�����¼
					strSQLJZ = "select * from T_o2jam_char_Attr_Item where ITEM_INDEX_ID = " & objDBrsIb("ID") & " AND USER_INDEX_ID=" & nick_USER_INDEX_ID
					set objDBrsJZ=server.CreateObject ("ADODB.Recordset") 
					objDBrsJZ.open strSQLJZ ,Conn1,1 ,3
					if (objDBrsJZ.eof or objDBrsJZ.bof) then	'�û�û�иý�ָ
						check_JZ2 = 1
					end if
					objDBrsJZ.close
					set objDBrsJZ = nothing


					IF check_JZ=1 and check_JZ2=1 THEN 
						'response.write "INSERT INTO T_O2JAM_CHAR_ATTR_ITEM(USER_INDEX_ID,ITEM_INDEX_ID,USED_COUNT)VALUES(" & nick_USER_INDEX_ID & ", " & int(objDBrsIb("ID"))&", "& JZ_count
						'transactCheck2=10

						Conn1.Execute("INSERT INTO T_O2JAM_CHAR_ATTR_ITEM(USER_INDEX_ID,ITEM_INDEX_ID,USED_COUNT)VALUES(" & nick_USER_INDEX_ID & ", " & int(objDBrsIb("ID"))&", "& JZ_count&")"), transactCheck1
						'���󲶻�
						if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
							Conn1.Errors.Clear
							transactCheck2=transactCheck2+1
							transactCheck1=0
							response.write "sp_error_286<br>"
						else
							transactCheck1=0
						end if
					elseif check_JZ=1 and  check_JZ2 = 0 then
						Conn1.Execute("UPDATE T_O2JAM_CHAR_ATTR_ITEM set USED_COUNT = " & JZ_count &" where ITEM_INDEX_ID = "& objDBrsIb("ID") & " AND USER_INDEX_ID=" & nick_USER_INDEX_ID), transactCheck1
						'���󲶻�
						if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
							Conn1.Errors.Clear
							transactCheck2=transactCheck2+1
							transactCheck1=0
							response.write "sp_error_297<br>"
						else
							transactCheck1=0
						end if
					END IF
					'��ָend


				end if
				objDBrsIb.close
				set objDBrsIb = nothing
			end if
			objDBrsI.close
			set objDBrsI = nothing
		'��Ʒ>>����
		elseif objDBrs("gFlag") = "S" then	
			set objDBrsS = Conn1.Execute("U9_MUSIC_CHECK "& nick_USER_INDEX_ID &", " & objDBrs("pid") )	'����Ƿ��Ѿ����ڸ�����
			if objDBrsS.eof or objDBrsS.bof then
				set objDBrsSb = Conn1.Execute("U9_MUSIC_SELECT "& objDBrs("pid"))	'��ȡ������Ϣ
				'�����ּ��빺����־
				Conn.Execute "U9_BILL_LOG_INSERT '"& OrderNo &"', '"& gameid &"', "& objDBrsSb("ID") &", '"& objDBrsSb("TITLE") &"', "& RTgem(objDBrsSb("GEM")) &", "& RTmcash(objDBrsSb("MCASH")) & ",0,'S','"& curtime &"', '1','"& nick_USER_ID &"', '"& nick_USER_NICKNAME &"', 0, 0" , transactCheck1
				'���󲶻�
				if transactCheck1 <> 1 or Conn.Errors.Count>0 then
					Conn.Errors.Clear 
					transactCheck2=transactCheck2+1
					transactCheck1=0
					response.write "sp_error_160<br>"
				else
					transactCheck1=0
				end if
				'�ۼƽ��
				totalRecord_gem = totalRecord_gem + RTgem(objDBrsSb("GEM"))
				totalRecord_price = totalRecord_price + RTmcash(objDBrsSb("MCASH"))
				sumName = sumName & "," & objDBrsSb("TITLE")



				'������ָ��û�
				Conn1.Execute "P_o2jam_gift_music_buy "& nick_USER_INDEX_ID &", "& objDBrsSb("ID") &", "& USER_INDEX_ID &", '"& USER_NICKNAME & "'" ,transactCheck1
				'���󲶻�
				if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
					Conn1.Errors.Clear
					transactCheck2=transactCheck2+1
					transactCheck1=0
					response.write "sp_error_255<br>"
				else
					transactCheck1=0
				end if

				'������ָ��û�
				'Conn1.Execute "U9_MUSIC_INSERT " & nick_USER_INDEX_ID & ", " & objDBrs("pid") ,transactCheck1
				'���󲶻�
				'if transactCheck1 <> 1 or conn1.Errors.Count>0 then
				'	conn1.Errors.Clear 
				'	transactCheck2=transactCheck2+1
				'	transactCheck1=0
				'	response.write "sp_error_176<br>"
				'else
				'	transactCheck1=0
				'end if
				objDBrsSb.close
				set objDBrsSb = nothing

			end if
			objDBrsS.close
			set objDBrsS = nothing
		end if
		objDBrs.movenext
	wend
end if
objDBrs.close
set objDBrs = nothing



'��װ
strSQL = "select * from TB_GIFT_IMSI_CART where gFlag='T' and memberID='" & gameid & "'"
set objDBrs=server.CreateObject ("ADODB.Recordset") 
objDBrs.open strSQL ,Conn,1 ,3
'set objDBrs = Conn.Execute (strSQL)
If not(objDBrs.BOF or objDBrs.EOF) Then		'�жϹ��ﳵ���Ƿ�����װ
	While not(objDBrs.BOF or objDBrs.EOF)
		'������װ�еĵ���
		'set objDBrsT = Conn1.Execute ("select * from T_o2jam_SetItem_Data where ItemType='1' and SetItemID = " & objDBrs("pid") )
		strSQL = "select * from T_o2jam_SetItem_Data where ItemType='1' and SetItemID = " & objDBrs("pid")
		set objDBrsT=server.CreateObject ("ADODB.Recordset") 
		objDBrsT.open strSQL ,Conn1,1 ,3
		if not(objDBrsT.BOF or objDBrsT.EOF) then
		While not(objDBrsT.BOF or objDBrsT.EOF)
			set objDBrsTb = Conn1.Execute("U9_ITEM_CHECK "& nick_USER_INDEX_ID &", " & objDBrsT("ItemID"))	'�ж��û��Ƿ�����õ���
			if objDBrsTb.eof or objDBrsTb.bof then
				set objDBrsTc = Conn1.Execute("U9_ITEM_SELECT "& objDBrsT("ItemID"))	'���ص�����Ϣ
				if objDBrsTc("VAL")=2 or objDBrsTc("VAL")=nick_SEX then	'�Ա���
					totalRecord_seq = totalRecord_seq +1
					'�����߼��빺����־
					Conn.Execute "U9_BILL_LOG_INSERT '"& OrderNo &"', '"& gameid &"', "& objDBrsTc("ID") &", '"& objDBrsTc("NAME") &"', "& RTgem(objDBrsT("ItemGem")) &", "& RTmcash(objDBrsT("ItemMCash")) & ",0,'I','"& curtime &"', '1','"& nick_USER_ID &"', '"& nick_USER_NICKNAME &"', 0, " & objDBrs("pid") , transactCheck1
					'���󲶻�
					if transactCheck1 <> 1 or Conn.Errors.Count>0 then
						Conn.Errors.Clear 
						transactCheck2=transactCheck2+1
						transactCheck1=0
						response.write "sp_error_355<br>"
					else
						transactCheck1=0
					end if
					'�ۼƽ��
					totalRecord_gem = totalRecord_gem + RTgem(objDBrsT("ItemGem"))
					totalRecord_price = totalRecord_price + RTmcash(objDBrsT("ItemMCash"))

					U9_itemnuma = U9_itemnuma & objDBrsT("ItemID") & "-"
					'�ۼƹ���ĵ�������
					sumName = sumName & "," & objDBrsTc("NAME")

					'�����߼���Է����ݿ�
					Conn1.Execute "P_o2jam_gift_item_buy "& nick_USER_INDEX_ID &", "& objDBrsTc("ID") &", "& USER_INDEX_ID &", '"& USER_NICKNAME & "'" ,transactCheck1
					'���󲶻�
					if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
						Conn1.Errors.Clear
						transactCheck2=transactCheck2+1
						transactCheck1=0
						response.write "sp_error_374<br>"
					else
						transactCheck1=0
					end if

					'ʶ���ָ���
					JZ_count=0
					strSQLJZ = "select * from T_o2jam_item_data_attribute where ITEM_INDEX_ID = " & int(objDBrsTc("ID"))
					set objDBrsJZ=server.CreateObject ("ADODB.Recordset") 
					objDBrsJZ.open strSQLJZ ,Conn1,1 ,3
					check_JZ = 0
					check_JZ2 = 0
					if NOT(objDBrsJZ.eof or objDBrsJZ.bof) then	'��ָ����
						JZ_count = objDBrsJZ("ITEM_USE_COUNT")
						check_JZ = 1
					end if
					objDBrsJZ.close
					set objDBrsJZ = nothing


					'�ж��û����޸ý�ָ��ʹ�ô�����¼
					strSQLJZ = "select * from T_o2jam_char_Attr_Item where ITEM_INDEX_ID = " & int(objDBrsTc("ID")) & " AND USER_INDEX_ID=" & nick_USER_INDEX_ID
					set objDBrsJZ=server.CreateObject ("ADODB.Recordset") 
					objDBrsJZ.open strSQLJZ ,Conn1,1 ,3
					if (objDBrsJZ.eof or objDBrsJZ.bof) then	'�û�û�иý�ָ
						check_JZ2 = 1
					end if
					objDBrsJZ.close
					set objDBrsJZ = nothing


					IF check_JZ=1 and check_JZ2=1 THEN '��ָ����,�û�û�иý�ָ
						Conn1.Execute("INSERT INTO T_O2JAM_CHAR_ATTR_ITEM(USER_INDEX_ID,ITEM_INDEX_ID,USED_COUNT)VALUES(" & nick_USER_INDEX_ID & ", " & int(objDBrsTc("ID"))&", "& JZ_count&")"), transactCheck1
						'���󲶻�
						if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
							Conn1.Errors.Clear
							transactCheck2=transactCheck2+1
							transactCheck1=0
							response.write "sp_error_465<br>"
						else
							transactCheck1=0
						end if
					elseif check_JZ=1 and  check_JZ2 = 0 then'��ָ����,�û��иý�ָ
						Conn1.Execute("UPDATE T_O2JAM_CHAR_ATTR_ITEM set USED_COUNT = " & JZ_count &" where ITEM_INDEX_ID = "& int(objDBrsTc("ID")) & " AND USER_INDEX_ID=" & nick_USER_INDEX_ID), transactCheck1
						'���󲶻�
						if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
							Conn1.Errors.Clear
							transactCheck2=transactCheck2+1
							transactCheck1=0
							response.write "sp_error_476<br>"
						else
							transactCheck1=0
						end if
					END IF
					'ʶ���ָ���end

				end if
				objDBrsTc.close
				set objDBrsTc = nothing

			end if
			objDBrsTb.close
			set objDBrsTb = nothing
			objDBrsT.movenext
		wend
		end if
		objDBrsT.close
		set objDBrsT = nothing

		'������װ�е�����
		'set objDBrsT = Conn1.Execute ("select * from T_o2jam_SetItem_Data where ItemType!='1' and SetItemID = " & objDBrs("pid") )
		strSQL = "select * from T_o2jam_SetItem_Data where ItemType!='1' and SetItemID = " & objDBrs("pid")
		set objDBrsT=server.CreateObject ("ADODB.Recordset") 
		objDBrsT.open strSQL ,Conn1,1 ,3
		if not(objDBrsT.BOF or objDBrsT.EOF) then
		While not(objDBrsT.BOF or objDBrsT.EOF)
			set objDBrsTb = Conn1.Execute("U9_MUSIC_CHECK "& nick_USER_INDEX_ID &", " & objDBrsT("ItemID"))	'�����Ƿ��Ѿ������
			if objDBrsTb.eof or objDBrsTb.bof then			
				set objDBrsTc = Conn1.Execute("U9_MUSIC_SELECT "& objDBrsT("ItemID"))	'��ȡ������Ϣ

				'�����ּ��빺����־
				Conn.Execute "U9_BILL_LOG_INSERT '"& OrderNo &"', '"& gameid &"', "& objDBrsTc("ID") &", '"& objDBrsTc("TITLE") &"', "& RTgem(objDBrsT("ItemGem")) &", "& RTmcash(objDBrsT("ItemMCash")) & ",0,'S','"& curtime &"', '1','"& nick_USER_ID &"', '"& nick_USER_NICKNAME &"', 0, "& objDBrs("pid") , transactCheck1
				'���󲶻�
				if transactCheck1 <> 1 or Conn.Errors.Count>0 then
					Conn.Errors.Clear 
					transactCheck2=transactCheck2+1
					transactCheck1=0
					response.write "sp_error_420<br>"
				else
					transactCheck1=0
				end if
				'�ۼƽ��
				totalRecord_gem = totalRecord_gem + RTgem(objDBrsT("ItemGem"))
				totalRecord_price = totalRecord_price + RTmcash(objDBrsT("ItemMCash"))
				sumName = sumName & "," & objDBrsTc("TITLE")


				'������ָ��û�
				Conn1.Execute "P_o2jam_gift_music_buy "& nick_USER_INDEX_ID &", "& objDBrsTc("ID") &", "& USER_INDEX_ID &", '"& USER_NICKNAME & "'" ,transactCheck1
				'���󲶻�
				if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
					Conn1.Errors.Clear
					transactCheck2=transactCheck2+1
					transactCheck1=0
					response.write "sp_error_437<br>"
				else
					transactCheck1=0
				end if

				'������ָ��û�
				'Conn1.Execute "U9_MUSIC_INSERT " & nick_USER_INDEX_ID & ", " & objDBrsT("ItemID") , transactCheck1
				'���󲶻�
				'if transactCheck1 <> 1 or conn.Errors.Count>0 then
				'	conn.Errors.Clear 
				'	transactCheck2=transactCheck2+1
				'	transactCheck1=0
				'	response.write "sp_error_370<br>�����װ�е�����ʧ��"
				'else
				'	transactCheck1=0
				'end if
				objDBrsTc.close
				set objDBrsTc = nothing

			end if
			objDBrsTb.close
			set objDBrsTb = nothing

			objDBrsT.movenext
		wend
		end if
		objDBrsT.close
		set objDBrsT = nothing

		objDBrs.movenext
	wend

End if
objDBrs.close
set objDBrs = nothing

%>









<%'������ߵĹ�������
if len(U9_itemnuma) >1 then 
	U9_itemnuma = left(U9_itemnuma,len(U9_itemnuma)-1)
end if
arrayU9_itemnuma = split(U9_itemnuma,"-")
if (ubound(arrayU9_itemnuma)>=0) then
	if ubound(arrayU9_itemnuma)+1 <= emptyBag then 
		dim u,o
		u=0
		o=0
		while u <= ubound(arrayU9_itemnuma)
			for o=0 to 29
				if ShopBag(o)=0 then
					ShopBag(o)=arrayU9_itemnuma(u)
					u=u+1
					exit for
				else
				end if
			next
			
		wend
	else
		'@@error	�ع�
		'response.write "�����հ���"

		'���󲶻�
		transactCheck2=transactCheck2+1
		response.write "sp_error_510����Ʒ��������<br>"

	end if
end if
%>

<%'���µ���
'strSQL = "U9_BILL_ITEM_UPDATE " & nick_USER_INDEX_ID
'for p=0 to 29
'	strSQL = strSQL & ", " & ShopBag(p)
'next
'Conn1.Execute strSQL ,transactCheck1
'���󲶻�
'if transactCheck1 <> 1 or conn1.Errors.Count>0 then
'	conn1.Errors.Clear 
'	transactCheck2=transactCheck2+1
'	transactCheck1=0
'	response.write "sp_error_323<br>"
'else
'	transactCheck1=0
'end if
%>

<%'�˶��û��Ľ������Ƿ��㹻
if  Gem< totalRecord_gem then 
	'@@error �ع�
	transactCheck2=transactCheck2+1
	response.write "sp_error_537��G�Ҳ���<br>"
	'response.write "GEM���㣬�޷�����"
else
	If chkCashType = "PC" Then
		if MCash< totalRecord_price then
			'@@error �ع�
			transactCheck2=transactCheck2+1
			response.write "sp_error_544��Mcash����<br>"
		else
			MCash = MCash - totalRecord_price
			Gem = Gem - totalRecord_gem
		end if
	ElseIf chkCashType = "OC" Then
		if O2Cash< totalRecord_price then
			'@@error �ع�
			transactCheck2=transactCheck2+1
			response.write "sp_error_553��O2cash����<br>"
		else
			O2Cash = O2Cash - totalRecord_price
			Gem = Gem - totalRecord_gem
		end if
	ElseIf chkCashType = "MC" Then
		if MusicCash< totalRecord_price then
			'@@error �ع�
			transactCheck2=transactCheck2+1
			response.write "sp_error_562��MUSICcash����<br>"
		else
			MusicCash = MusicCash - totalRecord_price
			Gem = Gem - totalRecord_gem
		end if
	ElseIf chkCashType = "AC" Then
		if ItemCash< totalRecord_price then
			'@@error �ع�
			transactCheck2=transactCheck2+1
			response.write "sp_error_571��ITEMCash����<br>"
		else
			ItemCash = ItemCash - totalRecord_price
			Gem = Gem - totalRecord_gem
		end if
	else
		if totalRecord_price > 0 Then	'Mcash����0����û��ѡ���κ�Cash��֧����ʽ
			'@@error �ع�
			transactCheck2=transactCheck2+1
			response.write "sp_error_580��û��ѡ����ȷ��֧������<br>"
		else
			Gem = Gem - totalRecord_gem
		end if
	End If
End If
%>

<%'�۷ѽ���
'�����û��Ļ��Ҽ�¼
strSQL = "U9_BILL_CASH_UPDATE " & USER_INDEX_ID & ", " & gem & ", " & MCash & ", " & O2Cash & ", " & MusicCash & ", " & ItemCash
'�����û���USERMCASH���Mcash��¼
strSQLb= "U9_BILL_USERMCASH_UPDATE '" & gameid2 & "', " & MCash
'�����û��Ĺ��ﳵ
strSQLc= "U9_BILL_GIFT_CART_DEL '" & gameid & "'"


'������
Conn1.Execute strSQL , transactCheck1
'���󲶻�
if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
	Conn1.Errors.Clear 
	transactCheck2=transactCheck2+1
	transactCheck1=0
	response.write "sp_error_604<br>"'���۷�ʧ��1
else
	transactCheck1=0
end if

if chkCashType = "PC" and totalRecord_price >0 Then
	Conn.Execute  strSQLb, transactCheck1
	'���󲶻�
	if transactCheck1 <> 1 or Conn.Errors.Count>0 then
		Conn.Errors.Clear 
		transactCheck2=transactCheck2+1
		transactCheck1=0
		response.write "sp_error_616<br>"'���۷�ʧ��2
	else
		transactCheck1=0
	end if
end if


'���󲶻�
'if transactCheck1 < 1 or conn.Errors.Count>0 then
'	conn.Errors.Clear 
'	transactCheck2=transactCheck2+1
'	transactCheck1=0
'	response.write "sp_error_419�����ﳵ���ʧ��<br>"
'else
'	transactCheck1=0
'end if
%>



<%

memo	= replace(memo,"'","''")

gmiSQL = "U9_Message_Insert '"& USER_ID &"',"& USER_INDEX_ID &",'"& USER_NICKNAME &"',"
gmiSQL = gmiSQL & "'"& nick_USER_ID &"',"& nick_USER_INDEX_ID &",'"& nick_USER_NICKNAME &"','"& memo &"','"& sumName &"'"
'��������
Conn1.Execute gmiSQL, transactCheck1
'���󲶻�
if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
	Conn1.Errors.Clear 
	transactCheck2=transactCheck2+1
	transactCheck1=0
	response.write "sp_650<br>"'������ʧ��
else
	transactCheck1=0
end if
%>

<%
if transactCheck2 > 0 then 
	'conn.Errors.Clear 
	'conn1.Errors.Clear 
	Conn.RollBackTrans
	Conn1.RollBackTrans
	response.write "spmain_665<br>"'����ʧ��
	Conn.Execute(strSQLc)
	connClose()
	response.end
else
	Conn.CommitTrans
	Conn1.CommitTrans
	'response.write "���׳ɹ�"
	Conn.Execute(strSQLc)
	connClose()
	getURL = "gift_step_05.asp?OrderNo=" & OrderNo & "&gameid=" & gameid & "&chkCashType=" & chkCashType & "&sumGem=" & totalRecord_gem & "&OrderPrice=" & totalRecord_price
	Response.Redirect getURL
	%>
<!--<form name="frmGoLastCharge">
	<input type=hidden name="OrderNo" value="<%=OrderNo%>">
	<input type=hidden name="gameid" value="<%=gameid%>">
	<input type=hidden name="chkCashType" value="<%=chkCashType%>">
	<input type=hidden name="sumGem" value="<%=totalRecord_gem%>">
	<input type=hidden name="OrderPrice" value="<%=totalRecord_price%>">
</form>
<script language="javascript">
	frmGoLastCharge.method	= "POST";
	frmGoLastCharge.action	= "gift_step_05.asp";
	frmGoLastCharge.submit();
</script>
-->
<%end if%>
</body>
</html>
<%response.end%>