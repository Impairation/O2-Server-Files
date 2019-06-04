<%
'개별아이템일 경우 로그리스트 만들기


	imlogSQL = "Select i_seq,pid,gName,i_gem,i_price,i_point,gFlag From TB_GIFT_IMSI_CART"
	imlogSQL = imlogSQL & " Where gFlag!='T' AND memberID = '"&gameid&"'"
	Set imlogRS = Conn.Execute(imlogSQL)

	if Not(imlogRS.BOF or imlogRS.EOF) then 

		imlog_pointsum = 0
		Do until imlogRS.EOF
			imlog_seq 		= imlogRS(0)
			imlog_pid 		= imlogRS(1)
			imlog_gName 	= imlogRS(2)
			imlog_gName		= replace(imlog_gName,"'","''")
			imlog_gem	 	= imlogRS(3)
			imlog_price 	= imlogRS(4)

		if o2cash = 0 THEN
			imlog_point 	= imlogRS(5)
		else
			imlog_point 	= 0
		end if

		imlog_gFlag 		= imlogRS(6)

			iimlogSQL = "Insert into TB_ORDER_LIST (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName)"
			iimlogSQL = iimlogSQL & " values "
			iimlogSQL = iimlogSQL & "('"& OrderNo &"','"& gameid &"',"& imlog_pid &",'"& imlog_gName &"',"& imlog_gem &","
			iimlogSQL = iimlogSQL & ""& imlog_price &","&imlog_point&",'"&imlog_gFlag&"',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"')"

			Conn.Execute iimlogSQL

		imlogRS.Movenext
		imlog_pointsum = imlog_pointsum + imlog_point
	Loop
	end if

	imlogRS.Close
	Set imlogRS = Nothing


'세트아이템일 경우 주문리스트 만들기

	imlogSQL = "Select pid From TB_GIFT_IMSI_CART Where gFlag='T' AND memberID = '"&gameid&"'"
	Set imlogRS = Conn.Execute(imlogSQL)

	IF Not(imlogRS.BOF or imlogRS.EOF) THEN 
		Do until imlogRS.EOF
			imlog_pid 		= imlogRS(0)

			SetChkSQL 		= "p_o2jam_SETITEM_DATA_DETAIL "&imlog_pid
			Set SetChkRS 	= Conn1.Execute(SetChkSQL)
				IF Not(SetChkRS.BOF or SetChkRS.EOF) THEN

					Do until SetChkRS.EOF

						PartItemID 	= SetChkRS("PartItemID")	'일련번호
						ItemName 	= SetChkRS("ItemName")		'아이템이름
						ItemKind 	= SetChkRS("ItemKind")		'(?)
						ItemType 	= SetChkRS("ItemType")		'(1:Item,2:Music)
						ItemID 		= SetChkRS("ItemID")		'ITEM 아이디
						ItemGem 	= SetChkRS("ItemGem")		'잼머니
						ItemMCash 	= SetChkRS("ItemCash")		'엠캐쉬

						'ITEM 데이타일경우	

							IF ItemType = 1 Then

								iimlogSQL = "Insert into TB_ORDER_LIST (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName,SetItemID)"
								iimlogSQL = iimlogSQL & " values "
								iimlogSQL = iimlogSQL & "('"& OrderNo &"','"& gameid &"',"& ItemID &",'"& ItemName &"',"& ItemGem &","
								iimlogSQL = iimlogSQL & ""& ItemMCash &",0,'I',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&imlog_pid&")"
								Conn.Execute iimlogSQL

						'MUSIC 데이타일경우		

							ELSEIF ItemType = 2 Then

								iimlogSQL = "Insert into TB_ORDER_LIST (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName,SetItemID)"
								iimlogSQL = iimlogSQL & " values "
								iimlogSQL = iimlogSQL & "('"& OrderNo &"','"& gameid &"',"& ItemID &",'"& ItemName &"',"& ItemGem &","
								iimlogSQL = iimlogSQL & ""& ItemMCash &",0,'S',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&imlog_pid&")"
								Conn.Execute iimlogSQL

							END IF

					SetChkRS.Movenext
					Loop

				END IF

		SetChkRS.Close
		Set SetChkRS=Nothing

		imlogRS.Movenext
	Loop
	END IF

	imlogRS.Close
	Set imlogRS = Nothing
%>