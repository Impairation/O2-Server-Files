<%

'개별아이템 선물일경우 주문리스트 만들기

	immiSQL = "Select pid From TB_GIFT_IMSI_CART Where memberID = '"& gameid &"' AND gFlag = 'I'"
	'레코드를 화면상에 뿌려주기 위해 읽기
	Set immiRS = Conn.Execute(immiSQL)

	if NOT(immiRS.BOF or immiRS.EOF) then
		Do until immiRS.EOF
			ItemID 	 = immiRS(0)

			'중복된 아이템 ID가넘어오면 ERROR
			itemSQL = "P_o2jam_gift_item_buy "& ToWhoIndexID &","& ItemID &","& FromWhoIndexID &",'"& FromWhoNickName &"'"
			Conn1.Execute(itemSQL)

		immiRS.Movenext
		Loop
	end if

	'세트아이템 선물일 경우 주문리스트 만들기
	immiSQL = "Select pid From TB_GIFT_IMSI_CART Where memberID = '"& gameid &"' AND gFlag = 'T'"
	'레코드를 화면상에 뿌려주기 위해 읽기
	Set immiRS = Conn.Execute(immiSQL)

	if NOT(immiRS.BOF or immiRS.EOF) then
		Do until immiRS.EOF
			pid		= immiRS(0)

			'중복된 아이템 ID가넘어오면 ERROR
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
	
							itemSQL = "P_o2jam_gift_item_buy "& ToWhoIndexID &","& ItemID &","& FromWhoIndexID &",'"& FromWhoNickName &"'"
							Conn1.Execute(itemSQL)

						END IF

					SetChkRS.Movenext
					Loop

				END IF

		SetChkRS.Close
		Set SetChkRS=Nothing

		immiRS.Movenext
		Loop
	end if
%>