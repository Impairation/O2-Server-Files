<%
	'개별아이템 선물일경우 주문리스트 만들기
	imSQL = "Select i_seq,pid,gName,i_gem,i_price,i_point,gFlag"
	imSQL = imSQL & " From TB_GIFT_IMSI_CART Where gFlag != 'T' And memberID = '"&gameid&"'"
	'레코드를 화면상에 뿌려주기 위해 읽기
	Set imRS = Conn.Execute(imSQL)

	IF imRS.BOF or imRS.EOF THEN 

	ELSE
		pointsum = 0		
		Do until imRS.EOF

			i_seq 		= imRS(0)
			pid 		= imRS(1)
			gName 		= imRS(2)
			gName		= replace(gName,"'","''")
			i_gem	 	= imRS(3)
			i_price 	= imRS(4)

			IF o2point = 0 THEN
						i_point 	= imRS(5)
			ELSE
						i_point 	= 0
			END IF

			gFlag 		= imRS(6)

			iSQL = "INSERT INTO TB_LOG_LIST (OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName)"
			iSQL = iSQL & " values "
			iSQL = iSQL & "('"& OrderNo &"','"& gameid &"',"& pid &",'"& gName &"',"& i_gem &","& i_price &","&i_point&",'"&gFlag&"',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"')"
			Conn.Execute iSQL

			imRS.Movenext
			pointsum = pointsum + i_point
		Loop

	END IF


	'선물 받을 회원정보 가져오기 ToWhoIndexID,ToWhoID,ToWhoNickName,ToWhoSex
	imSQL = "Select pid From TB_GIFT_IMSI_CART Where gFlag='T' AND memberID = '"&gameid&"'"
	'레코드를 화면상에 뿌려주기 위해 읽기
	Set imRS = Conn.Execute(imSQL)

	IF imRS.BOF or imRS.EOF then 

	ELSE	
		Do until imRS.EOF

			pid 		= imRS("pid")'세트아이템 아이디

			SetChkSQL 		= "p_o2jam_SETITEM_DATA_DETAIL "&pid
			
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

						IF ItemType = 1 Then
							isSQL = "Insert into TB_LOG_LIST(OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName,SetItemID)"
							isSQL = isSQL & " values "
							isSQL = isSQL & "('"& OrderNo &"','"& gameid &"',"& ItemID &",'"& ItemName &"',"& ItemGem &","& ItemMCash &",0,'I',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&pid&")"
							Conn.Execute isSQL
						ELSEIF ItemType = 2 Then
							isSQL = "Insert into TB_LOG_LIST(OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate,BuyType,ToWhoID,ToWhoNickName,SetItemID)"
							isSQL = isSQL & " values "
							isSQL = isSQL & "('"& OrderNo &"','"& gameid &"',"& ItemID &",'"& ItemName &"',"& ItemGem &","& ItemMCash &",0,'S',getdate(),1,'"& ToWhoID &"','"& ToWhoNickName &"',"&pid&")"
							Conn.Execute isSQL
						END IF

					SetChkRS.Movenext
					Loop

				END IF

		SetChkRS.Close
		Set SetChkRS=Nothing

		imRS.Movenext
		Loop

	END IF
%>












