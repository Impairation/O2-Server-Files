<% Option Explicit %>
<%
	'〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	'〓〓 파일명			:	payment_input_01.asp
	'〓〓 주요 기능		:	아이템 결제, 저장 테스트 페이지 변수 강제로 지정, 가독성 용이 편집
	'〓〓 작성				:	문병준
	'〓〓 최초작성일		:	2004-04-26
	'〓〓 최종수정일		:	2004-06-7
	'〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
Response.Expires = 0 
Response.Expiresabsolute = Now() - 3 
Response.AddHeader "pragma","no-cache" 
Response.AddHeader "cache-control","private" 
Response.CacheControl = "no-cache" 
	
Dim aid(10), sid(10), tid(2)
Dim gameid, memberNick, chkNick, chkIDNick
Dim Conn, Conn1, objDBrs, objDBrsChk
Dim strSQL
Dim i
Dim ID, NAME, GEM, MCASH, O2CASH
Dim TITLE, WON
Dim SetItemID, SetItemTitle, DCRate, TGEM, TWON, TO2Cash
Dim PartItemID, ItemName, ItemKind, ItemType, ItemID, ItemGem, ItemCash

	gameid 			= Trim(Request.QueryString("gameid"))
	memberNick	= Trim(Request.QueryString("memberNick"))
	
	chkNick			= Trim(Request.QueryString ("chkNick"))
	chkIDNick		= Trim(Request.QueryString ("chkIDNick"))
	
	'= 아이디 검색인지 닉네임 검색인지 정보가 없으면 아이디 검색으로 설정합니다.
	If Len(chkIDNick) <= 0 Then
		chkIDNick = "id"
	End If

	gameid = Trim(Request.QueryString("gameid"))
	%>
	<!--뮤직검사-->
	<!--#include file="Payment_Music_check.asp"-->
	<!--뮤직검사-->
	<%
	'디비생성
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open(Application("Connection_ConnectionString"))
	
	Set Conn1 = Server.CreateObject("ADODB.Connection")
	Conn1.Open(Application("c_Connection_ConnectionString"))
	
	'선물바구니담기전에 비움
	strSQL = "DELETE TB_GIFT_IMSI_CART WHERE memberID = '" & gameid & "'"
	Conn.execute(strSQL)
	
	'아이템 담기
	For i = 0 to 9
		If aid(i) <> "" Then
			strSQL = "SELECT ID,NAME,GEM,MCASH,O2CASH FROM T_o2jam_item_data WHERE ID = " & int(aid(i))
			Set objDBrs = Conn1.Execute(strSQL)

			ID				= objDBrs(0)
			NAME	 	= objDBrs(1)
			NAME		= replace(NAME,"'","''")
			GEM			= objDBrs(2)
			MCASH 	= objDBrs(3)
			O2CASH 	= objDBrs(4)
			
			objDBrs.Close
			Set objDBrs = Nothing
			
			strSQL = "INSERT INTO TB_GIFT_IMSI_CART (memberID,ToWhoID,ToWhoNickName,pid,gName,i_gem,i_price,i_point,gFlag,regdate)"
			strSQL = strSQL & " VALUES "
			strSQL = strSQL & "('"& gameid &"','N','N',"& ID &",'"& NAME &"',"& GEM &","& MCASH &","& O2CASH &",'I',getdate())"
			Conn.Execute(strSQL)
		End If
	Next

	'곡 담기
	For i = 0 to 9
		If sid(i) <> "" Then
			strSQL = "SELECT ID,TITLE,GEM,MCash,O2Cash FROM T_o2jam_music_data WHERE ID = " & int(sid(i))
			Set objDBrs = Conn1.Execute(strSQL)
			
			ID				= objDBrs(0)
			TITLE		= trim(objDBrs(1))
			TITLE		= replace(TITLE,"'","''")
			GEM 		= objDBrs(2)
			WON 		= objDBrs(3)
			O2CASH 	= objDBrs(4)
			
			objDBrs.Close
			Set objDBrs = Nothing

			strSQL = "INSERT INTO TB_GIFT_IMSI_CART(memberID,ToWhoID,ToWhoNickName,pid,gName,i_gem,i_price,i_point,gFlag,regdate)"
			strSQL = strSQL & " VALUES "
			strSQL = strSQL & "('"& gameid &"','N','N',"& ID &",'"& TITLE &"',"& GEM &","& WON &","& O2CASH &",'S',getdate())"
			Conn.Execute(strSQL)
		End If
	Next

		
	'*세트아이템 아이디 처리부분
	For i = 0 to 1
		If tid(i) <> "" Then
			strSQL			= "SELECT SetItemID,SetItemTitle,DCRate FROM T_o2jam_setItem_Info WHERE SetItemID = " & int(tid(i))
			Set objDBrs	= Conn1.Execute(strSQL)

			If Not(objDBrs.BOF or objDBrs.EOF) Then

				Do until objDBrs.EOF
					SetItemID 		= objDBrs("SetItemID")
					SetItemTitle	= trim(objDBrs("SetItemTitle"))
					SetItemTitle	= replace(SetItemTitle,"'","''")
					DCRate			= trim(objDBrs("DCRate"))

					strSQL				= "p_o2jam_SETITEM_DATA_DETAIL " & SetItemID
					Set objDBrsChk	= Conn1.Execute(strSQL)

					If Not(objDBrsChk.BOF or objDBrsChk.EOF) Then
						TGEM	= 0
						TWON	= 0
						TO2Cash	= 0

						Do until objDBrsChk.EOF

							PartItemID 		= objDBrsChk("PartItemID")	'일련번호
							ItemName 		= objDBrsChk("ItemName")		'아이템이름
							ItemKind 		= objDBrsChk("ItemKind")		'(?)
							ItemType 		= objDBrsChk("ItemType")		'(1:Item,2:Music)
							ItemID 			= objDBrsChk("ItemID")		'ITEM 아이디
							ItemGem 		= objDBrsChk("ItemGem")		'잼머니
							ItemCash 		= objDBrsChk("ItemCash")		'엠캐쉬

							objDBrsChk.Movenext
				
							TGEM	= TGEM + ItemGem	'세트아이템에서 보유하고 있는 아이템의 잼을 제외한 잼의총 합 		
							TWON	= TWON + ItemCash	'세트아이템에서 보유하고 있는 아이템의 가격을 제외한 엠캐쉬 총합
						Loop
					End If

					objDBrsChk.Close
					Set objDBrsChk = Nothing

					strSQL = "INSERT INTO TB_GIFT_IMSI_CART(memberID,ToWhoID,ToWhoNickName,pid,gName,i_gem,i_price,i_point,gFlag,regdate)"
					strSQL = strSQL & " VALUES "
					strSQL = strSQL & "('"& gameid &"','N','N',"& SetItemID &",'"& SetItemTitle &"',"& TGEM &","& TWON &",0,'T',getdate())"
					Conn.Execute(strSQL)

					objDBrs.Movenext
			   	Loop
			End If
		
			objDBrs.Close
			Set objDBrs = Nothing
		End If
	Next

	Conn.Close
	Set Conn = Nothing
	Conn1.Close
	Set Conn1 = Nothing

Dim getURL

getURL = "gift_step_01.asp?gameid=" & gameid & "&memberNick=" & memberNick & "&chkNick=" & chkNick & "&chkIDNick=" & chkIDNick
Response.Redirect getURL
%>