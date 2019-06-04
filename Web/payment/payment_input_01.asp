<% Option Explicit %>
<%

	Response.buffer = true
	'〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	'〓〓 파일명			:	payment_input_01.asp
	'〓〓 주요 기능		:	아이템 결제, 저장 테스트 페이지 변수 강제로 지정, 가독성 용이 편집
	'〓〓 작성				:	문병준
	'〓〓 최초작성일		:	2004-04-26
	'〓〓 최종수정일		:	2004-06-4
	'〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	Response.Expires = 0 
	Response.Expiresabsolute = Now() - 3 
	Response.AddHeader "pragma","no-cache" 
	Response.AddHeader "cache-control","private" 
	Response.CacheControl = "no-cache" 
	

Dim Conn, Conn1, objDBrs, objDBrsDetail, objCmd
Dim aid(10), sid(10), tid(2)
Dim strSQL, gameid
Dim RESULT, i
Dim SetItemID, SetItemTitle
Dim TGEM, TWON, TO2Cash
Dim PartItemID, ItemName, ItemKind, ItemType, ItemID
Dim ChkItem
Dim ItemGem, ItemCash
Dim ChkBagTotNum2, ChkBagTotNum, ChkBagTotNum1
Dim imsi
								
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
	
	'장바구니에 기존에 있던 내 정보는 버립니다.
	strSQL = "PROC_PAYMENT_TEMPCART_NORMALITEM_INSERT '" & gameid & "', 0, 'D', 0"
	Conn.Execute (strSQL)	
	
	ChkBagTotNum1	 = 0
	
	
	'아이템 정보 저장
	'존재하는 아이템은 저장하지 않습니다.
	For i = 0 to 9
		If aid(i) <> "" Then
			'프로시져 호출
			RESULT = SUB_COMMAND_NORMAL (gameid, aid(i), "I", 4)
									
			'곡이 저장되었거나 존재하는 경우가 아니라면, 함수를 호출해라.
			If RESULT <> 0 and RESULT <> -3 Then
				RESULT_BACK RESULT, gameid, aid(i)
			End If
		End If
	Next
		
	'곡 정보 저장
	For i = 0 to 9
		If sid(i) <> "" Then
			'프로시져 호출
			RESULT = SUB_COMMAND_NORMAL (gameid, sid(i), "M", 4)
						
			'곡이 저장되었거나 존재하는 경우가 아니라면, 함수를 호출해라.
			If RESULT <> 0  and RESULT <> -3 Then
				RESULT_BACK RESULT, gameid, aid(i)
			End If
				
		End If
	Next

	'셋트 아이템 정보
	For i = 0 to 1
		If tid(i) <> "" Then
			
			SetItemID = tid(i)
			
			'셋트 아이템의 타이틀을 가져온다
			strSQL = "PROC_PAYMENT_TEMPCART_SETITEM_PRECHECK '"& gameid &"', "& SetItemID &", 'N', 0"
			Set objDBrs = Conn.Execute(strSQL)
			If Not(objDBrs.EOF or objDBrs.BOF) Then
				SetItemTitle = objDBrs("SetItemTitle")
			else
				Response.Write "<script>alert('宮壇鑒앴꼇닸瞳');//history.back();</script>"
				Conn.Close
				Set Conn = Nothing
				Conn1.Close
				Set Conn1 = Nothing
				
				Response.End
			end if
			objDBrs.Close
			Set objDBrs = Nothing
					
			'세트아이템에서 구매자가 가지고있는 아이템 데이타와 뮤직 데이타의 가격을 제외한 세트아이템의 합구하기!
			strSQL = "PROC_PAYMENT_TEMPCART_SETITEM_PRECHECK '"& gameid &"', "& SetItemID &", 'L', 0"
			Set objDBrsDetail = Conn.Execute(strSQL)
			
			TGEM		= 0
			TWON		= 0
			TO2Cash	= 0
			
			If Not(objDBrsDetail.EOF or objDBrsDetail.BOF) Then
			
				'셋트에 담긴 개별 아이템 만큼 루프를 돌아라
				Do until objDBrsDetail.EOF or objDBrsDetail.BOF
			
					PartItemID 	= objDBrsDetail("PartItemID")	'일련번호
					ItemName 	= objDBrsDetail("ItemName")	'아이템이름
					ItemKind 	= objDBrsDetail("ItemKind")		'(?)
					ItemType 	= objDBrsDetail("ItemType")		'(1:Item,2:Music)
					ItemID 		= objDBrsDetail("ItemID")			'ITEM 아이디
			
					'ITEM 데이타일경우 이미 가지고 있는 아이템이 포함 되었는지 체크한다		
					If ItemType = 1 Then
						
						'프로시져 호출
						ChkItem = SUB_COMMAND_SET (gameid, ItemID, "I", 4)
												
						If ChkItem		= -3 Then
							ItemGem 	= 0						'잼머니
							ItemCash 	= 0						'엠캐쉬									
						Elseif ChkItem = 0 Then
							ItemGem 	= objDBrsDetail("ItemGem")	'잼머니
							ItemCash 	= objDBrsDetail("ItemCash")	'엠캐쉬
						End If
						
					'Music 데이타일경우 이미 가지고 있는 아이템이 포함 되었는지 체크한다		
					ElseIf ItemType = 2 Then
						'프로시져 호출
						ChkItem = SUB_COMMAND_SET (gameid, ItemID, "M", 4)
														
						If ChkItem		= -3 Then
							ItemGem 	= 0						'잼머니
							ItemCash	= 0						'엠캐쉬									
						Elseif ChkItem = 0 Then
							ItemGem 	= objDBrsDetail("ItemGem")	'잼머니
							ItemCash 	= objDBrsDetail("ItemCash")	'엠캐쉬
						End If
					End If	
									
					objDBrsDetail.Movenext
					
					TGEM	= TGEM + ItemGem		'세트아이템에서 보유하고 있는 아이템의 잼을 제외한 잼의총 합
					TWON	= TWON + ItemCash	'세트아이템에서 보유하고 있는 아이템의 가격을 제외한 엠캐쉬 총합
					
				Loop
			Else
				Response.Write "<script>alert('宮壇鑒앴꼇닸瞳');//history.back();</script>"
				
				Conn.Close
				Set Conn = Nothing
				Conn1.Close
				Set Conn1 = Nothing
				
				Response.End
			End If
		
			
		'검출된 셋트 아이템 장바구니에 저장
		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_INSERT '"& gameid &"',"& SetItemID &",'"& SetItemTitle &"',"& TGEM &","& TWON &","& TO2Cash &",'T',0"
		Conn.Execute(strSQL)
		
		End If
	Next
	
	Conn.Close
	Set Conn = Nothing
	Conn1.Close
	Set Conn1 = Nothing
	
	
	
		
	
	'개별 아이템 커맨드 함수
	Private Function SUB_COMMAND_NORMAL (USER_ID, CART_ITEM, CASE_NUM, ErrNo)
		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "PROC_PAYMENT_TEMPCART_NORMALITEM_INSERT"
			.CommandType = adCmdStoredProc     
							  
			.Parameters.Append .CreateParameter("@USER_ID", adVarChar, adParamInput, 20, USER_ID)
			.Parameters.Append .CreateParameter("@CART_ITEM", adInteger, adParamInput, 4, CART_ITEM)
			.Parameters.Append .CreateParameter("@CASE_NUM", adChar, adParamInput, 1, CASE_NUM)
			.Parameters.Append .CreateParameter("ErrNo", adInteger, adParamReturnValue, ErrNo)
							
			.Execute
			RESULT = .Parameters("ERRNO")
		End with
		Set objCmd = Nothing
		
		SUB_COMMAND_NORMAL = RESULT
	End Function
	
	'셋트 아이템 커맨드 함수
	Private Function SUB_COMMAND_SET (USER_ID, CART_ITEM, CASE_NUM, ErrNo)
		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "PROC_PAYMENT_TEMPCART_SETITEM_PRECHECK"
			.CommandType = adCmdStoredProc     
							  
			.Parameters.Append .CreateParameter("@USER_ID", adVarChar, adParamInput, 20, USER_ID)
			.Parameters.Append .CreateParameter("@CART_ITEM", adInteger, adParamInput, 4, CART_ITEM)
			.Parameters.Append .CreateParameter("@CASE_NUM", adChar, adParamInput, 1, CASE_NUM)
			.Parameters.Append .CreateParameter("ErrNo", adInteger, adParamReturnValue, ErrNo)
							
			.Execute
			ChkItem = .Parameters("ERRNO")
		End with
		Set objCmd = Nothing
		
		SUB_COMMAND_SET = ChkItem
	End Function
		
	'예외 발생시, 함수 호출
	Private Sub RESULT_BACK(RESULT, gameid, asid)
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
				
		If RESULT = -1 Then
			Response.Write "<script>alert('슥弄법넋櫓놔君댄轎');//history.back();</script>"
			Response.End 
		ElseIf RESULT = -2 Then		
			Response.Write "<script>alert('늪ID깻꼇닸瞳');//history.back();</script>"
			Response.End 
		End If
		Response.End
	End Sub
	
	'ChkBagTotNum = ChkBagTotNum1 + ChkBagTotNum2
		
	Response.Redirect "payment_step01.asp?gameid="& gameid
	%>