<%

'���������� �����ϰ�� �ֹ�����Ʈ �����

	immiSQL = "Select pid From TB_GIFT_IMSI_CART Where memberID = '"& gameid &"' AND gFlag = 'I'"
	'���ڵ带 ȭ��� �ѷ��ֱ� ���� �б�
	Set immiRS = Conn.Execute(immiSQL)

	if NOT(immiRS.BOF or immiRS.EOF) then
		Do until immiRS.EOF
			ItemID 	 = immiRS(0)

			'�ߺ��� ������ ID���Ѿ���� ERROR
			itemSQL = "P_o2jam_gift_item_buy "& ToWhoIndexID &","& ItemID &","& FromWhoIndexID &",'"& FromWhoNickName &"'"
			Conn1.Execute(itemSQL)

		immiRS.Movenext
		Loop
	end if

	'��Ʈ������ ������ ��� �ֹ�����Ʈ �����
	immiSQL = "Select pid From TB_GIFT_IMSI_CART Where memberID = '"& gameid &"' AND gFlag = 'T'"
	'���ڵ带 ȭ��� �ѷ��ֱ� ���� �б�
	Set immiRS = Conn.Execute(immiSQL)

	if NOT(immiRS.BOF or immiRS.EOF) then
		Do until immiRS.EOF
			pid		= immiRS(0)

			'�ߺ��� ������ ID���Ѿ���� ERROR
			SetChkSQL 		= "p_o2jam_SETITEM_DATA_DETAIL "&pid
			Set SetChkRS 	= Conn1.Execute(SetChkSQL)
				IF Not(SetChkRS.BOF or SetChkRS.EOF) THEN

					Do until SetChkRS.EOF

						PartItemID 	= SetChkRS("PartItemID")	'�Ϸù�ȣ
						ItemName 	= SetChkRS("ItemName")		'�������̸�
						ItemKind 	= SetChkRS("ItemKind")		'(?)
						ItemType 	= SetChkRS("ItemType")		'(1:Item,2:Music)
						ItemID 		= SetChkRS("ItemID")		'ITEM ���̵�
						ItemGem 	= SetChkRS("ItemGem")		'��Ӵ�
						ItemMCash 	= SetChkRS("ItemCash")		'��ĳ��

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