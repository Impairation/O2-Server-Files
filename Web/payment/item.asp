<%
	strSQL = "P_O2JAM_LOAD_ITEM_BAG " & USER_INDEX_ID

	Set objDBrs = Conn1.Execute(strSQL)

	ReDim BAG(30)
	
	 For i = 0 to 29
		If Not(objDBrs.BOF or objDBrs.EOF) Then
			BAG(i) 	= objDBrs(i)
		End If
	Next

	objDBrs.Close
	Set objDBrs = Nothing

	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'E'"
	'���ڵ带 ȭ��� �ѷ��ֱ� ���� �б�
	Set objDBrs = Conn.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) Then
		Do until objDBrs.EOF
			itemID = int(objDBrs("pid"))
			
			For i = 0 to 29
				If BAG(i) = 0 Then
					BAG(i) = int(itemID)
					Exit for
				End If
			Next
			objDBrs.MoveNext
		Loop
	End If
	
	objDBrs.Close
	Set objDBrs = Nothing
	

	'��Ʈ�������� ��� �������� �ִ� ���
	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'B'"
	
	'���ڵ带 ȭ��� �ѷ��ֱ� ���� �б�
	Set objDBrs = Conn.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) then
		Do until objDBrs.EOF
			SetItemID = objDBrs(0)

			strSQL = "p_o2jam_SETITEM_DATA_DETAIL " & SetItemID
			Set SetChkRS = Conn1.Execute(strSQL)
				If Not(SetChkRS.BOF or SetChkRS.EOF) Then
					Do until SetChkRS.EOF
						
						ItemType 	= SetChkRS("ItemType")	'(1:Item,2:Music)
						ItemID 		= SetChkRS("ItemID")		'ITEM ���̵�
						
						'ITEM ����Ÿ�ϰ�� �̹� ������ �ִ� �������� ���� �Ǿ����� üũ�Ѵ�
						If ItemType = 1 Then
							strSQL = "p_o2jam_SETITEM_DUP_ITEM_CHECK_2 "& USER_INDEX_ID & ", " & ItemID
							Set Chk1RS 	= Conn1.Execute(strSQL)
							ChkItem = Chk1RS(0)

							If ChkItem = 0 Then	'���� �������̸�
								For i = 0 to 29
									If BAG(i) = 0 Then
										BAG(i) = int(ItemID)
										Exit for
									End If
								Next
							End If
						End If
						SetChkRS.MoveNext
					Loop
				End If

		SetChkRS.Close
		Set SetChkRS = Nothing

		objDBrs.Movenext
		Loop
	End If

	objDBrs.Close
	Set objDBrs = Nothing

	
	strSQL = "P_O2JAM_BUY_ITEM '" & gameid & "', "
	For i = 0 to 29
		strSQL =  strSQL & BAG(i) & " ,"
	Next
	strSQL =  strSQL & int(Gem) & ", " & int(intMoney) & ", " & int(O2Cash) & ", " & int(MusicCash) & ", " & int(ItemCash)
	Conn1.Execute(strSQL)
	
	
	'���ο� ������ ���� ȣ��
	strSQL = "SELECT gFlag, pid FROM TB_IMSI_CART WHERE memberID = '" & gameid & "'"
	Set objDBrs = Conn.Execute(strSQL)
	
	Do until objDBrs.BOF or objDBrs.EOF
		If Trim(objDBrs("gFlag"))	= "I"  Then	'���� �������� ���
			
			strSQL	= "P_o2jam_buy_attr_item " & USER_INDEX_ID & ", " & int(objDBrs("pid"))
			Conn1.Execute(strSQL)
		
		ElseIf Trim(objDBrs("gFlag"))	= "T"  Then	'��Ʈ �������� ���
		
			strSQL				= "SELECT ItemType, ItemID FROM T_O2JAM_SETITEM_DATA WHERE SetItemID = " & int(objDBrs("pid"))
			Set objDBrsChk	= Conn1.Execute(strSQL)

			Do until objDBrsChk.BOF or objDBrsChk.EOF
				If 1 = int(objDBrsChk("ItemType")) Then
					strSQL						= "p_o2jam_SETITEM_DUP_ITEM_CHECK_2 " & USER_INDEX_ID & ", " & int(objDBrsChk("ItemID"))
					Set objDBrsItemChk	= Conn1.Execute(strSQL)
					ChkItem						= objDBrsItemChk(0)
				
					objDBrsItemChk.Close
					Set objDBrsItemChk = Nothing

					If ChkItem	= 0 Then '�����ϰ� ���� ���� ���
						strSQL	= "P_o2jam_buy_attr_item " & USER_INDEX_ID & ", " & int(objDBrs("pid"))
						Conn1.Execute(strSQL)
					End If
				End If
				objDBrsChk.MoveNext
			Loop
				
			objDBrsChk.Close
			Set objDBrsChk = Nothing
		End If
		objDBrs.MoveNext
	Loop
				
	objDBrs.Close
	Set objDBrs = nothing
%>