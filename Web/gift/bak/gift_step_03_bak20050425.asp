<%'页面浏览过滤
Server.ScriptTimeout = 30000
REFERER_Page = "/gift/gift_step_02.asp"
HTTP_REFERER = Request.ServerVariables("HTTP_REFERER")
If Len(REFERER_Page) = 0 Then
	If Len(HTTP_REFERER) = 0 Then		
		Response.Write "<div align='center'>方法错误..<br><br>请用正常步骤输入数据.</div>"
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
		Response.Write("<div align='center'>" & HTTP_REFERER & "方法错误.<br><br>请用正常步骤输入数据.</div>")
		Response.End
	End If
End If
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body bgcolor="#67BAF0" topmargin="0" leftmargin="0"  oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<%'变量定义
dim gameid, strUserID, chkCashType, strUserPwd, memo, ToWhoID, memberNick
dim strSQL
dim objDBrs, objDBrsI
dim Conn1,Conn
dim OrderNo, curtime, dateYY, dateMM, dateDD, dateHH, dateMI, dateSE	'定单编号类
dim USER_INDEX_ID, USER_ID, USER_NICKNAME
dim nick_USER_INDEX_ID, nick_USER_ID, nick_USER_NICKNAME, nick_SEX
dim Gem,O2Cash,MusicCash,ItemCash,MCash		'个人货币
dim emptyBag, ShopBag(29)	'购物包
	emptyBag=0
dim transactCheck1, transactCheck2	'事务判断标志
	transactCheck1=0
	transactCheck2=0
dim totalRecord_seq, totalRecord_gem, totalRecord_price	'购买的累计价格
	totalRecord_seq = 0
	totalRecord_gem = 0
	totalRecord_price = 0
dim sumName
dim U9_mchk, U9_itemnuma, U9_itemnumb, arrayU9_itemnuma	'道具数量的记录
	'U9_mchk=3
	U9_itemnuma=""
	U9_itemnumb=""
dim objDBrsJZ
%>

<% '自定义函数
function connClose()'释放数据库连接
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

<%'获得参数
gameid		= UCASE(Trim(Request.Form("gameid")))
gameid2		= Trim(Request.Form("gameid"))
strUserID	= gameid
chkCashType	= Trim(Request.Form("chkCashType"))
strUserPwd	= Trim(Request.Form("UserPwd"))
memo		= Trim(Request.Form("memo"))
ToWhoID		= Trim(Request.Form("ToWhoID"))
'memberNick	= Trim(Request.Form("memberNick"))
%>

<%'窗口过滤
If strUserPwd = "" or gameid = "" or ToWhoID = "" or memo = "" Then
	Response.Write "<script>alert('用户信息出错.');history.back();</script>"
	Response.end
End If
%>

<%'生成定单编号
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

<%'建立数据库连接
'gamedb
Set Conn1 = Server.CreateObject("ADODB.Connection")
Conn1.Open(Application("c_Connection_ConnectionString"))
'tradedb
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open(Application("Connection_ConnectionString"))
%>


<%'获取用户USER_INDEX_ID
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
	Response.Write "<script>alert('用户不存在.');history.back();</script>"
	Response.end
end if
objDBrs.close
Set objDBrs = Nothing
%>

<%'判断用户密码
strSQL = "SELECT passwd FROM member WHERE userid = '" & gameid & "'"
Set objDBrs = Conn1.Execute(strSQL)
If objDBrs.EOF Or objDBrs.BOF Then
	objDBrs.close
	Set objDBrs = Nothing
	connClose()
	Response.Write "<script>alert('用户不存在.');history.back();</script>"
	Response.end
else
	if Trim(objDBrs("passwd")) = strUserPwd then
	else
		objDBrs.close
		Set objDBrs = Nothing
		connClose()
		Response.Write "<script>alert('密码不正确.');history.back();</script>"
		Response.end
	end if
end if
%>



<%'判断对方用户	nick_USER_INDEX_ID
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
	Response.Write "<script>alert('接受用户不存在.');history.back();</script>"
	Response.end
end if
objDBrs.close
Set objDBrs = Nothing
%>


<!-- #include file="INC_VIEW_USERCASH.asp" --><%'读取用户个人货币%>


<%'计算物品空包数	emptyBag
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

<%'事务启动
Conn.BeginTrans 
Conn1.BeginTrans
%>

<%
'购买道具和音乐
strSQL = "select * from TB_GIFT_IMSI_CART where gFlag != 'T' and memberID='" & gameid & "'"
set objDBrs=server.CreateObject ("ADODB.Recordset") 
objDBrs.open strSQL ,Conn,1 ,3
'set objDBrs = Conn.Execute(strSQL)
If not(objDBrs.BOF or objDBrs.EOF) Then		'判断购物车内是否有音乐和道具
	while not(objDBrs.BOF or objDBrs.EOF)	'罗列音乐和道具
		'物品>>道具
		if objDBrs("gFlag") = "I" then		
			set objDBrsI = Conn1.Execute("U9_ITEM_CHECK "& nick_USER_INDEX_ID &", " & objDBrs("pid") )	'检查是否已经存在该道具
			if objDBrsI.eof or objDBrsI.bof then
				set objDBrsIb = Conn1.Execute("U9_ITEM_SELECT "& objDBrs("pid"))	'返回该道具信息
				if objDBrsIb("VAL")=2 or objDBrsIb("VAL")=nick_SEX then	'性别检查
					totalRecord_seq = totalRecord_seq +1
					'将道具加入购买日志
					Conn.Execute "U9_BILL_LOG_INSERT '"& OrderNo &"', '"& gameid &"', "& objDBrsIb("ID") &", '"& objDBrsIb("NAME") &"', "& RTgem(objDBrsIb("GEM")) &", "& RTmcash(objDBrsIb("MCASH")) & ",0,'I','"& curtime &"', '1','"& nick_USER_ID &"', '"& nick_USER_NICKNAME &"', 0, 0" ,transactCheck1
'response.write
'transactCheck2=1


					'错误捕获
					if transactCheck1 <> 1 or conn.Errors.Count>0 then
						conn.Errors.Clear
						transactCheck2=transactCheck2+1
						transactCheck1=0
						response.write "sp_error_226<br>"
					else
						transactCheck1=0
					end if
					'累计金额
					totalRecord_gem = totalRecord_gem + RTgem(objDBrsIb("GEM"))
					totalRecord_price = totalRecord_price + RTmcash(objDBrsIb("MCASH"))
					'累计购买的道具
					U9_itemnuma = U9_itemnuma & objDBrs("pid") & "-"
					'累计购买的道具名称
					sumName = sumName & "," & objDBrsIb("NAME")

					'将道具加入对方数据库
					Conn1.Execute "P_o2jam_gift_item_buy "& nick_USER_INDEX_ID &", "& objDBrsIb("ID") &", "& USER_INDEX_ID &", '"& USER_NICKNAME & "'" & "," &totalrecord_price,transactCheck1
					'错误捕获
					if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
						Conn1.Errors.Clear
						transactCheck2=transactCheck2+1
						transactCheck1=0
						response.write "sp_error_245<br>"
					else
						transactCheck1=0
					end if

					'识别戒指标记
					JZ_count=0
					strSQLJZ = "select * from T_o2jam_item_data_attribute where ITEM_INDEX_ID = " & objDBrsIb("ID")
					set objDBrsJZ=server.CreateObject ("ADODB.Recordset") 
					objDBrsJZ.open strSQLJZ ,Conn1,1 ,3
					check_JZ = 0
					check_JZ2 = 0
					if NOT(objDBrsJZ.eof or objDBrsJZ.bof) then	'戒指存在
						JZ_count = objDBrsJZ("ITEM_USE_COUNT")
						check_JZ = 1
					end if
					objDBrsJZ.close
					set objDBrsJZ = nothing


					'判断用户有无该戒指的使用次数记录
					strSQLJZ = "select * from T_o2jam_char_Attr_Item where ITEM_INDEX_ID = " & objDBrsIb("ID") & " AND USER_INDEX_ID=" & nick_USER_INDEX_ID
					set objDBrsJZ=server.CreateObject ("ADODB.Recordset") 
					objDBrsJZ.open strSQLJZ ,Conn1,1 ,3
					if (objDBrsJZ.eof or objDBrsJZ.bof) then	'用户没有该戒指
						check_JZ2 = 1
					end if
					objDBrsJZ.close
					set objDBrsJZ = nothing


					IF check_JZ=1 and check_JZ2=1 THEN 
						'response.write "INSERT INTO T_O2JAM_CHAR_ATTR_ITEM(USER_INDEX_ID,ITEM_INDEX_ID,USED_COUNT)VALUES(" & nick_USER_INDEX_ID & ", " & int(objDBrsIb("ID"))&", "& JZ_count
						'transactCheck2=10

						Conn1.Execute("INSERT INTO T_O2JAM_CHAR_ATTR_ITEM(USER_INDEX_ID,ITEM_INDEX_ID,USED_COUNT)VALUES(" & nick_USER_INDEX_ID & ", " & int(objDBrsIb("ID"))&", "& JZ_count&")"), transactCheck1
						'错误捕获
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
						'错误捕获
						if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
							Conn1.Errors.Clear
							transactCheck2=transactCheck2+1
							transactCheck1=0
							response.write "sp_error_297<br>"
						else
							transactCheck1=0
						end if
					END IF
					'戒指end


				end if
				objDBrsIb.close
				set objDBrsIb = nothing
			end if
			objDBrsI.close
			set objDBrsI = nothing
		'物品>>音乐
		elseif objDBrs("gFlag") = "S" then	
			set objDBrsS = Conn1.Execute("U9_MUSIC_CHECK "& nick_USER_INDEX_ID &", " & objDBrs("pid") )	'检查是否已经存在该音乐
			if objDBrsS.eof or objDBrsS.bof then
				set objDBrsSb = Conn1.Execute("U9_MUSIC_SELECT "& objDBrs("pid"))	'获取音乐信息
				'将音乐加入购买日志
				Conn.Execute "U9_BILL_LOG_INSERT '"& OrderNo &"', '"& gameid &"', "& objDBrsSb("ID") &", '"& objDBrsSb("TITLE") &"', "& RTgem(objDBrsSb("GEM")) &", "& RTmcash(objDBrsSb("MCASH")) & ",0,'S','"& curtime &"', '1','"& nick_USER_ID &"', '"& nick_USER_NICKNAME &"', 0, 0" , transactCheck1
				'错误捕获
				if transactCheck1 <> 1 or Conn.Errors.Count>0 then
					Conn.Errors.Clear 
					transactCheck2=transactCheck2+1
					transactCheck1=0
					response.write "sp_error_160<br>"
				else
					transactCheck1=0
				end if
				'累计金额
				totalRecord_gem = totalRecord_gem + RTgem(objDBrsSb("GEM"))
				totalRecord_price = totalRecord_price + RTmcash(objDBrsSb("MCASH"))
				sumName = sumName & "," & objDBrsSb("TITLE")



				'添加音乐给用户
				Conn1.Execute "P_o2jam_gift_music_buy "& nick_USER_INDEX_ID &", "& objDBrsSb("ID") &", "& USER_INDEX_ID &", '"& USER_NICKNAME & "'" ,transactCheck1
				'错误捕获
				if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
					Conn1.Errors.Clear
					transactCheck2=transactCheck2+1
					transactCheck1=0
					response.write "sp_error_255<br>"
				else
					transactCheck1=0
				end if

				'添加音乐给用户
				'Conn1.Execute "U9_MUSIC_INSERT " & nick_USER_INDEX_ID & ", " & objDBrs("pid") ,transactCheck1
				'错误捕获
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



'套装
strSQL = "select * from TB_GIFT_IMSI_CART where gFlag='T' and memberID='" & gameid & "'"
set objDBrs=server.CreateObject ("ADODB.Recordset") 
objDBrs.open strSQL ,Conn,1 ,3
'set objDBrs = Conn.Execute (strSQL)
If not(objDBrs.BOF or objDBrs.EOF) Then		'判断购物车内是否有套装
	While not(objDBrs.BOF or objDBrs.EOF)
		'购买套装中的道具
		'set objDBrsT = Conn1.Execute ("select * from T_o2jam_SetItem_Data where ItemType='1' and SetItemID = " & objDBrs("pid") )
		strSQL = "select * from T_o2jam_SetItem_Data where ItemType='1' and SetItemID = " & objDBrs("pid")
		set objDBrsT=server.CreateObject ("ADODB.Recordset") 
		objDBrsT.open strSQL ,Conn1,1 ,3
		if not(objDBrsT.BOF or objDBrsT.EOF) then
		While not(objDBrsT.BOF or objDBrsT.EOF)
			set objDBrsTb = Conn1.Execute("U9_ITEM_CHECK "& nick_USER_INDEX_ID &", " & objDBrsT("ItemID"))	'判断用户是否购买过该道具
			if objDBrsTb.eof or objDBrsTb.bof then
				set objDBrsTc = Conn1.Execute("U9_ITEM_SELECT "& objDBrsT("ItemID"))	'返回道具信息
				if objDBrsTc("VAL")=2 or objDBrsTc("VAL")=nick_SEX then	'性别检查
					totalRecord_seq = totalRecord_seq +1
					'将道具加入购买日志
					Conn.Execute "U9_BILL_LOG_INSERT '"& OrderNo &"', '"& gameid &"', "& objDBrsTc("ID") &", '"& objDBrsTc("NAME") &"', "& RTgem(objDBrsT("ItemGem")) &", "& RTmcash(objDBrsT("ItemMCash")) & ",0,'I','"& curtime &"', '1','"& nick_USER_ID &"', '"& nick_USER_NICKNAME &"', 0, " & objDBrs("pid") , transactCheck1
					'错误捕获
					if transactCheck1 <> 1 or Conn.Errors.Count>0 then
						Conn.Errors.Clear 
						transactCheck2=transactCheck2+1
						transactCheck1=0
						response.write "sp_error_355<br>"
					else
						transactCheck1=0
					end if
					'累计金额
					totalRecord_gem = totalRecord_gem + RTgem(objDBrsT("ItemGem"))
					totalRecord_price = totalRecord_price + RTmcash(objDBrsT("ItemMCash"))

					U9_itemnuma = U9_itemnuma & objDBrsT("ItemID") & "-"
					'累计购买的道具名称
					sumName = sumName & "," & objDBrsTc("NAME")

					'将道具加入对方数据库
					Conn1.Execute "P_o2jam_gift_item_buy "& nick_USER_INDEX_ID &", "& objDBrsTc("ID") &", "& USER_INDEX_ID &", '"& USER_NICKNAME & "'" ,transactCheck1
					'错误捕获
					if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
						Conn1.Errors.Clear
						transactCheck2=transactCheck2+1
						transactCheck1=0
						response.write "sp_error_374<br>"
					else
						transactCheck1=0
					end if

					'识别戒指标记
					JZ_count=0
					strSQLJZ = "select * from T_o2jam_item_data_attribute where ITEM_INDEX_ID = " & int(objDBrsTc("ID"))
					set objDBrsJZ=server.CreateObject ("ADODB.Recordset") 
					objDBrsJZ.open strSQLJZ ,Conn1,1 ,3
					check_JZ = 0
					check_JZ2 = 0
					if NOT(objDBrsJZ.eof or objDBrsJZ.bof) then	'戒指存在
						JZ_count = objDBrsJZ("ITEM_USE_COUNT")
						check_JZ = 1
					end if
					objDBrsJZ.close
					set objDBrsJZ = nothing


					'判断用户有无该戒指的使用次数记录
					strSQLJZ = "select * from T_o2jam_char_Attr_Item where ITEM_INDEX_ID = " & int(objDBrsTc("ID")) & " AND USER_INDEX_ID=" & nick_USER_INDEX_ID
					set objDBrsJZ=server.CreateObject ("ADODB.Recordset") 
					objDBrsJZ.open strSQLJZ ,Conn1,1 ,3
					if (objDBrsJZ.eof or objDBrsJZ.bof) then	'用户没有该戒指
						check_JZ2 = 1
					end if
					objDBrsJZ.close
					set objDBrsJZ = nothing


					IF check_JZ=1 and check_JZ2=1 THEN '戒指存在,用户没有该戒指
						Conn1.Execute("INSERT INTO T_O2JAM_CHAR_ATTR_ITEM(USER_INDEX_ID,ITEM_INDEX_ID,USED_COUNT)VALUES(" & nick_USER_INDEX_ID & ", " & int(objDBrsTc("ID"))&", "& JZ_count&")"), transactCheck1
						'错误捕获
						if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
							Conn1.Errors.Clear
							transactCheck2=transactCheck2+1
							transactCheck1=0
							response.write "sp_error_465<br>"
						else
							transactCheck1=0
						end if
					elseif check_JZ=1 and  check_JZ2 = 0 then'戒指存在,用户有该戒指
						Conn1.Execute("UPDATE T_O2JAM_CHAR_ATTR_ITEM set USED_COUNT = " & JZ_count &" where ITEM_INDEX_ID = "& int(objDBrsTc("ID")) & " AND USER_INDEX_ID=" & nick_USER_INDEX_ID), transactCheck1
						'错误捕获
						if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
							Conn1.Errors.Clear
							transactCheck2=transactCheck2+1
							transactCheck1=0
							response.write "sp_error_476<br>"
						else
							transactCheck1=0
						end if
					END IF
					'识别戒指标记end

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

		'购买套装中的音乐
		'set objDBrsT = Conn1.Execute ("select * from T_o2jam_SetItem_Data where ItemType!='1' and SetItemID = " & objDBrs("pid") )
		strSQL = "select * from T_o2jam_SetItem_Data where ItemType!='1' and SetItemID = " & objDBrs("pid")
		set objDBrsT=server.CreateObject ("ADODB.Recordset") 
		objDBrsT.open strSQL ,Conn1,1 ,3
		if not(objDBrsT.BOF or objDBrsT.EOF) then
		While not(objDBrsT.BOF or objDBrsT.EOF)
			set objDBrsTb = Conn1.Execute("U9_MUSIC_CHECK "& nick_USER_INDEX_ID &", " & objDBrsT("ItemID"))	'音乐是否已经购买过
			if objDBrsTb.eof or objDBrsTb.bof then			
				set objDBrsTc = Conn1.Execute("U9_MUSIC_SELECT "& objDBrsT("ItemID"))	'获取音乐信息

				'将音乐加入购买日志
				Conn.Execute "U9_BILL_LOG_INSERT '"& OrderNo &"', '"& gameid &"', "& objDBrsTc("ID") &", '"& objDBrsTc("TITLE") &"', "& RTgem(objDBrsT("ItemGem")) &", "& RTmcash(objDBrsT("ItemMCash")) & ",0,'S','"& curtime &"', '1','"& nick_USER_ID &"', '"& nick_USER_NICKNAME &"', 0, "& objDBrs("pid") , transactCheck1
				'错误捕获
				if transactCheck1 <> 1 or Conn.Errors.Count>0 then
					Conn.Errors.Clear 
					transactCheck2=transactCheck2+1
					transactCheck1=0
					response.write "sp_error_420<br>"
				else
					transactCheck1=0
				end if
				'累计金额
				totalRecord_gem = totalRecord_gem + RTgem(objDBrsT("ItemGem"))
				totalRecord_price = totalRecord_price + RTmcash(objDBrsT("ItemMCash"))
				sumName = sumName & "," & objDBrsTc("TITLE")


				'添加音乐给用户
				Conn1.Execute "P_o2jam_gift_music_buy "& nick_USER_INDEX_ID &", "& objDBrsTc("ID") &", "& USER_INDEX_ID &", '"& USER_NICKNAME & "'" ,transactCheck1
				'错误捕获
				if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
					Conn1.Errors.Clear
					transactCheck2=transactCheck2+1
					transactCheck1=0
					response.write "sp_error_437<br>"
				else
					transactCheck1=0
				end if

				'添加音乐给用户
				'Conn1.Execute "U9_MUSIC_INSERT " & nick_USER_INDEX_ID & ", " & objDBrsT("ItemID") , transactCheck1
				'错误捕获
				'if transactCheck1 <> 1 or conn.Errors.Count>0 then
				'	conn.Errors.Clear 
				'	transactCheck2=transactCheck2+1
				'	transactCheck1=0
				'	response.write "sp_error_370<br>添加套装中的音乐失败"
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









<%'整理道具的购买数量
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
		'@@error	回滚
		'response.write "超过空包数"

		'错误捕获
		transactCheck2=transactCheck2+1
		response.write "sp_error_510：物品数量超数<br>"

	end if
end if
%>

<%'更新道具
'strSQL = "U9_BILL_ITEM_UPDATE " & nick_USER_INDEX_ID
'for p=0 to 29
'	strSQL = strSQL & ", " & ShopBag(p)
'next
'Conn1.Execute strSQL ,transactCheck1
'错误捕获
'if transactCheck1 <> 1 or conn1.Errors.Count>0 then
'	conn1.Errors.Clear 
'	transactCheck2=transactCheck2+1
'	transactCheck1=0
'	response.write "sp_error_323<br>"
'else
'	transactCheck1=0
'end if
%>

<%'核对用户的结算金额是否足够
if  Gem< totalRecord_gem then 
	'@@error 回滚
	transactCheck2=transactCheck2+1
	response.write "sp_error_537：G币不足<br>"
	'response.write "GEM不足，无法购买"
else
	If chkCashType = "PC" Then
		if MCash< totalRecord_price then
			'@@error 回滚
			transactCheck2=transactCheck2+1
			response.write "sp_error_544：Mcash不足<br>"
		else
			MCash = MCash - totalRecord_price
			Gem = Gem - totalRecord_gem
		end if
	ElseIf chkCashType = "OC" Then
		if O2Cash< totalRecord_price then
			'@@error 回滚
			transactCheck2=transactCheck2+1
			response.write "sp_error_553：O2cash不足<br>"
		else
			O2Cash = O2Cash - totalRecord_price
			Gem = Gem - totalRecord_gem
		end if
	ElseIf chkCashType = "MC" Then
		if MusicCash< totalRecord_price then
			'@@error 回滚
			transactCheck2=transactCheck2+1
			response.write "sp_error_562：MUSICcash不足<br>"
		else
			MusicCash = MusicCash - totalRecord_price
			Gem = Gem - totalRecord_gem
		end if
	ElseIf chkCashType = "AC" Then
		if ItemCash< totalRecord_price then
			'@@error 回滚
			transactCheck2=transactCheck2+1
			response.write "sp_error_571：ITEMCash不足<br>"
		else
			ItemCash = ItemCash - totalRecord_price
			Gem = Gem - totalRecord_gem
		end if
	else
		if totalRecord_price > 0 Then	'Mcash大于0，而没有选择任何Cash的支付方式
			'@@error 回滚
			transactCheck2=transactCheck2+1
			response.write "sp_error_580：没有选择正确的支付货币<br>"
		else
			Gem = Gem - totalRecord_gem
		end if
	End If
End If
%>

<%'扣费结算
'更新用户的货币记录
strSQL = "U9_BILL_CASH_UPDATE " & USER_INDEX_ID & ", " & gem & ", " & MCash & ", " & O2Cash & ", " & MusicCash & ", " & ItemCash
'更新用户的USERMCASH表的Mcash记录
strSQLb= "U9_BILL_USERMCASH_UPDATE '" & gameid2 & "', " & MCash
'清理用户的购物车
strSQLc= "U9_BILL_GIFT_CART_DEL '" & gameid & "'"


'金额结算
Conn1.Execute strSQL , transactCheck1
'错误捕获
if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
	Conn1.Errors.Clear 
	transactCheck2=transactCheck2+1
	transactCheck1=0
	response.write "sp_error_604<br>"'：扣费失败1
else
	transactCheck1=0
end if

if chkCashType = "PC" and totalRecord_price >0 Then
	Conn.Execute  strSQLb, transactCheck1
	'错误捕获
	if transactCheck1 <> 1 or Conn.Errors.Count>0 then
		Conn.Errors.Clear 
		transactCheck2=transactCheck2+1
		transactCheck1=0
		response.write "sp_error_616<br>"'：扣费失败2
	else
		transactCheck1=0
	end if
end if


'错误捕获
'if transactCheck1 < 1 or conn.Errors.Count>0 then
'	conn.Errors.Clear 
'	transactCheck2=transactCheck2+1
'	transactCheck1=0
'	response.write "sp_error_419：购物车清空失败<br>"
'else
'	transactCheck1=0
'end if
%>



<%

memo	= replace(memo,"'","''")

gmiSQL = "U9_Message_Insert '"& USER_ID &"',"& USER_INDEX_ID &",'"& USER_NICKNAME &"',"
gmiSQL = gmiSQL & "'"& nick_USER_ID &"',"& nick_USER_INDEX_ID &",'"& nick_USER_NICKNAME &"','"& memo &"','"& sumName &"'"
'插入流言
Conn1.Execute gmiSQL, transactCheck1
'错误捕获
if transactCheck1 <> 1 or Conn1.Errors.Count>0 then
	Conn1.Errors.Clear 
	transactCheck2=transactCheck2+1
	transactCheck1=0
	response.write "sp_650<br>"'：留言失败
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
	response.write "spmain_665<br>"'交易失败
	Conn.Execute(strSQLc)
	connClose()
	response.end
else
	Conn.CommitTrans
	Conn1.CommitTrans
	'response.write "交易成功"
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