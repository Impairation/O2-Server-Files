<%
'���������� �����ϰ�� �ֹ�����Ʈ �����

	UserID = gameid

	immsSQL = "Select pid From TB_GIFT_IMSI_CART Where memberID = '"&UserID&"' AND gFlag = 'S'"
	'���ڵ带 ȭ��� �ѷ��ֱ� ���� �б�
	Set immsRS = Conn.Execute(immsSQL)

	If NOT(immsRS.BOF or immsRS.EOF) Then
		Do until immsRS.EOF
			MusicID 	 = immsRS(0)

			'�ߺ������� ID���Ѿ���� ERROR

			musicSQL = "P_O2JAM_GIFT_MUSIC_BUY "&ToWhoIndexID&","&MusicID&","&FromWhoIndexID&",'"& FromWhoNickName &"'"
			Conn1.Execute(musicSQL)

		immsRS.Movenext
		Loop
	End If


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