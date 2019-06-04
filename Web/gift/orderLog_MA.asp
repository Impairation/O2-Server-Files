<%
'개별아이템일 경우 로그리스트 만들기

	imlogSQL = "Select i_seq,pid,gName,i_gem,i_price,i_point,gFlag From TB_GIFT_IMSI_CART"
	imlogSQL = imlogSQL & " Where gFlag!='T' AND memberID = '"&gameid&"'"
	Set imlogRS = Conn.Execute(imlogSQL)
	
	If Not(imlogRS.BOF or imlogRS.EOF) Then

		imlog_pointsum = 0
		Do until imlogRS.EOF
			imlog_seq 		= imlogRS(0)
			imlog_pid 		= imlogRS(1)
			imlog_gName 	= imlogRS(2)
			imlog_gName		= replace(imlog_gName,"'","''")
			imlog_gem	 	= int(imlogRS(3))
			imlog_price 	= imlogRS(4)

		If o2cash = 0 Then
			imlog_point 	= imlogRS(5)
		Else
			imlog_point 	= 0
		End If

		imlog_gFlag 		= imlogRS(6)

			If imlog_gem > 0 Then
				iimlogSQL = "Insert into TB_LOG_LIST (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName)"
			Else
				iimlogSQL = "Insert into TB_LOG_LIST_ITEM_MUSIC_CASH (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName, CashCase)"
			End If
			iimlogSQL = iimlogSQL & " VALUES "
			iimlogSQL = iimlogSQL & "('"& OrderNo &"','"& gameid &"',"& imlog_pid &",'"& imlog_gName &"',"& imlog_gem &","
			
			if imlog_gem > 0 Then
				iimlogSQL = iimlogSQL & ""& imlog_price &","&imlog_point&",'"&imlog_gFlag&"',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"')"
			ElseIf chkCashType = "OC" Then
				iimlogSQL = iimlogSQL & ""& imlog_price &","&imlog_point&",'"&imlog_gFlag&"',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"', 'O')"
			ElseIf chkCashType = "MC" Then
				iimlogSQL = iimlogSQL & ""& imlog_price &","&imlog_point&",'"&imlog_gFlag&"',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"', 'M')"
			ElseIf chkCashType = "AC" Then
				iimlogSQL = iimlogSQL & ""& imlog_price &","&imlog_point&",'"&imlog_gFlag&"',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"', 'I')"
			End If

			
			
			
			Conn.Execute iimlogSQL

		imlogRS.Movenext
		imlog_pointsum = imlog_pointsum + imlog_point
	Loop
	End If

	imlogRS.Close
	Set imlogRS = Nothing


'세트아이템일 경우 주문리스트 만들기

	imlogSQL = "Select pid From TB_GIFT_IMSI_CART Where gFlag='T' AND memberID = '"&gameid&"'"
	Set imlogRS = Conn.Execute(imlogSQL)

	If Not(imlogRS.BOF or imlogRS.EOF) Then
		Do until imlogRS.EOF
			imlog_pid 		= imlogRS(0)

			SetChkSQL 		= "p_o2jam_SETITEM_DATA_DETAIL "&imlog_pid
			Set SetChkRS 	= Conn1.Execute(SetChkSQL)
				If Not(SetChkRS.BOF or SetChkRS.EOF) Then

					Do until SetChkRS.EOF

						PartItemID 	= SetChkRS("PartItemID")	'일련번호
						ItemName 	= SetChkRS("ItemName")		'아이템이름
						ItemKind 	= SetChkRS("ItemKind")		'(?)
						ItemType 	= SetChkRS("ItemType")		'(1:Item,2:Music)
						ItemID 		= SetChkRS("ItemID")		'ITEM 아이디
						ItemGem 	= int(SetChkRS("ItemGem"))		'잼머니
						ItemMCash 	= SetChkRS("ItemCash")		'엠캐쉬

						'ITEM 데이타일경우	

							If ItemType = 1 Then

								If ItemGem > 0 Then
									iimlogSQL = "Insert into TB_LOG_LIST (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName,SetItemID)"
								Else
									iimlogSQL = "Insert into TB_LOG_LIST_ITEM_MUSIC_CASH (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName,SetItemID, CashCase)"
								End If
								iimlogSQL = iimlogSQL & " values "
								iimlogSQL = iimlogSQL & "('"& OrderNo &"','"& gameid &"',"& ItemID &",'"& ItemName &"',"& ItemGem &","
								If chkCashType = "OC" Then
									iimlogSQL = iimlogSQL & ""& ItemMCash &",0,'I',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&imlog_pid&", 'O')"
								ElseIf chkCashType = "MC" Then
									iimlogSQL = iimlogSQL & ""& ItemMCash &",0,'I',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&imlog_pid&", 'M')"
								ElseIf chkCashType = "AC" Then
									iimlogSQL = iimlogSQL & ""& ItemMCash &",0,'I',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&imlog_pid&", 'I')"
								End If
								Conn.Execute iimlogSQL

						'MUSIC 데이타일경우		

							ElseIf ItemType = 2 Then

								If ItemGem > 0 Then
									iimlogSQL = "Insert into TB_LOG_LIST (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName,SetItemID)"
								Else
									iimlogSQL = "Insert into TB_LOG_LIST_ITEM_MUSIC_CASH (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName,SetItemID, CashCase)"
								End If
								iimlogSQL = iimlogSQL & " values "
								iimlogSQL = iimlogSQL & "('"& OrderNo &"','"& gameid &"',"& ItemID &",'"& ItemName &"',"& ItemGem &","
								If chkCashType = "OC" Then
									iimlogSQL = iimlogSQL & ""& ItemMCash &",0,'I',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&imlog_pid&", 'O')"
								ElseIf chkCashType = "MC" Then
									iimlogSQL = iimlogSQL & ""& ItemMCash &",0,'I',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&imlog_pid&", 'M')"
								ElseIf chkCashType = "AC" Then
									iimlogSQL = iimlogSQL & ""& ItemMCash &",0,'I',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&imlog_pid&", 'I')"
								End If
								Conn.Execute iimlogSQL

							End If

					SetChkRS.Movenext
					Loop

				End If

		SetChkRS.Close
		Set SetChkRS=Nothing

		imlogRS.Movenext
	Loop
	End If

	imlogRS.Close
	Set imlogRS = Nothing
%>