<%
'개별아이템 선물일경우 주문리스트 만들기

	UserID = gameid

	immsSQL = "Select pid From TB_GIFT_IMSI_CART Where memberID = '"&UserID&"' AND gFlag = 'S'"
	'레코드를 화면상에 뿌려주기 위해 읽기
	Set immsRS = Conn.Execute(immsSQL)

	If NOT(immsRS.BOF or immsRS.EOF) Then
		Do until immsRS.EOF
			MusicID 	 = immsRS(0)

			'중복된음악 ID가넘어오면 ERROR

			musicSQL = "P_O2JAM_GIFT_MUSIC_BUY "&ToWhoIndexID&","&MusicID&","&FromWhoIndexID&",'"& FromWhoNickName &"'"
			Conn1.Execute(musicSQL)

		immsRS.Movenext
		Loop
	End If


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

						IF ItemType = 2 Then

							musicSQL = "P_O2JAM_GIFT_MUSIC_BUY "&ToWhoIndexID&","&ItemID&","&FromWhoIndexID&",'"& FromWhoNickName &"'"
							Conn1.Execute(musicSQL)

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