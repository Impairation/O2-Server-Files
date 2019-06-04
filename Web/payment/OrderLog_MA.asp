<%
	Dim strLogLog, strLogCash
	
	'PROC_PAYMENT_ORDERLOG_COMMAND_INSERT	���ϰ�� ������ �����.
	'PROC_PAYMENT_CASHLOG_COMMAND_INSERT	��ĳ�� ����.
	
	'������������ ��� �ֹ�����Ʈ �����
	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'I'"
	Set objDBrs = Conn.Execute(strSQL)

	If objDBrs.BOF or objDBrs.EOF Then 

	Else
		pointsum = 0		
		Do until objDBrs.EOF

			i_seq 		= objDBrs(0)
			pid			= objDBrs(1)
			gName 		= objDBrs(2)
			gName		= replace(gName,"'","''")
			i_gem	 	= int(objDBrs(3))
			i_price	 	= objDBrs(4)

			If o2point = 0 Then
				i_point 	= objDBrs(5)
			Else
				i_point 	= 0
			End If
			gFlag	 =  objDBrs(6)

			'���ν��� ȣ��
			Set objCmd = Server.CreateObject("ADODB.Command")
					
			If i_gem > 0 Then	'������ ����
				With objCmd
					.ActiveConnection = Conn
					.CommandText = "PROC_PAYMENT_ORDERLOG_COMMAND_INSERT"
					.CommandType = adCmdStoredProc     
	
					.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
					.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
					.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , pid)
					.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, gName)
					.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , i_gem)
					.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , i_price)
					.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , i_point)
					.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, gFlag)
					.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , 0)
					.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "P")
					.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
					.Execute
					RESULT = .Parameters("ERRNO")
				End with
			Else
				With objCmd
					.ActiveConnection = Conn
					.CommandText = "PROC_PAYMENT_CASHLOG_COMMAND_INSERT"
					.CommandType = adCmdStoredProc     
	
					.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
					.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
					.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , pid)
					.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, gName)
					.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , i_gem)
					.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , i_price)
					.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , i_point)
					.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, gFlag)
					.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , 0)
					.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "P")
					If chkCashType = "OC" Then	'����ĳ��
						.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "O")
					ElseIf chkCashType = "MC" Then		'����ĳ��
						.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "M")
					ElseIf chkCashType = "AC" Then		'������ĳ��
						.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "I")
					End If
					.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
					.Execute
					RESULT = .Parameters("ERRNO")
				End with
			End If
			
			Set objCmd = Nothing

			objDBrs.Movenext
			pointsum = pointsum + i_point
		Loop
	End If


	'��Ʈ�������� ��� �ֹ�����Ʈ �����

	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'T'"
	'���ڵ带 ȭ��� �ѷ��ֱ� ���� �б�
	Set objDBrs = Conn.Execute(strSQL)

	If objDBrs.BOF or objDBrs.EOF then 

	Else
		Do until objDBrs.EOF

			pid 		= objDBrs("pid")'��Ʈ������ ���̵�

			strSQL = "P_O2JAM_SETITEM_DATA_DETAIL "& pid
			Set objDBrsChk 	= Conn1.Execute(strSQL)
				If Not(objDBrsChk.BOF or objDBrsChk.EOF) Then

					Do until objDBrsChk.EOF

						PartItemID 	= objDBrsChk("PartItemID")		'�Ϸù�ȣ
						ItemName 	= objDBrsChk("ItemName")		'�������̸�
						ItemKind 	= objDBrsChk("ItemKind")			'(?)
						ItemType 	= objDBrsChk("ItemType")		'(1:Item,2:Music)
						ItemID 		= objDBrsChk("ItemID")			'ITEM ���̵�


							If ItemType = 1 Then
								strSQL 	= "p_o2jam_SETITEM_DUP_ITEM_CHECK_2 "&USER_INDEX_ID&","&ItemID
								Set objDBrsChkITEM = Conn1.Execute(strSQL)
									ChkItem = objDBrsChkITEM(0)
									
									objDBrsChkITEM.Close
									Set objDBrsChkITEM = Nothing
									
									If ChkItem = 1 Then
										ItemGem1		= 0									'��Ӵ�
										ItemCash1 	= 0									'��ĳ��							
									ElseIf ChkItem = 0 Then
										ItemGem1 		= int(objDBrsChk("ItemGem"))	'��Ӵ�
										ItemCash1		= objDBrsChk("ItemCash")	'��ĳ��
										PartItemID1		= PartItemID 						'�Ϸù�ȣ
										ItemName1	= ItemName 						'�������̸�
										ItemKind1		= ItemKind 							'(?)
										ItemType1		= ItemType							'(1:Item,2:Music)
										ItemID1			= ItemID 							'ITEM ���̵�

										'���ν��� ȣ��
										Set objCmd = Server.CreateObject("ADODB.Command")
											
										If ItemGem1 > 0 Then
											With objCmd
												.ActiveConnection	= Conn
												.CommandText		= "PROC_PAYMENT_ORDERLOG_COMMAND_INSERT"
												.CommandType		= adCmdStoredProc     
	
												.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
												.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
												.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , ItemID1)
												.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, ItemName1)
												.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , ItemGem1)
												.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , ItemCash1)
												.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , 0)
												.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, "I")
												.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , pid)
												.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "S")
												.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
												.Execute
												RESULT = .Parameters("ERRNO")
											End with
										Else
											With objCmd
												.ActiveConnection	= Conn
												.CommandText		= "PROC_PAYMENT_CASHLOG_COMMAND_INSERT"
												.CommandType		= adCmdStoredProc     
	
												.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
												.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
												.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , ItemID1)
												.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, ItemName1)
												.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , ItemGem1)
												.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , ItemCash1)
												.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , 0)
												.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, "I")
												.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , pid)
												.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "S")
												If chkCashType = "OC" Then	'����ĳ��
													.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "O")
												ElseIf chkCashType = "MC" Then		'����ĳ��
													.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "M")
												ElseIf chkCashType = "AC" Then		'������ĳ��
													.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "I")
												End If
												.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
												.Execute
												RESULT = .Parameters("ERRNO")
											End with
										End If
										Set objCmd = Nothing
									End If


							ElseIf ItemType = 2 Then
								strSQL 	= "P_o2jam_SETITEM_DUP_MUSIC_CHECK '"&USER_INDEX_ID&"','"&ItemID&"'"
								Set objDBrsChkMUSIC 	= Conn1.Execute(strSQL)
									ChkItem =objDBrsChkMUSIC(0)
									
									objDBrsChkMUSIC.Close
									Set objDBrsChkMUSIC = Nothing

									If ChkItem = 1 Then
										ItemGem1		= 0									'��Ӵ�
										ItemCash1 	= 0									'��ĳ��									
									ElseIf ChkItem 	= 0 Then
										ItemGem1 		= int(objDBrsChk("ItemGem"))	'��Ӵ�
										ItemCash1 	= objDBrsChk("ItemCash")	'��ĳ��
										PartItemID1		= PartItemID 						'�Ϸù�ȣ
										ItemName1	= ItemName 						'�������̸�
										ItemKind1		= ItemKind 							'(?)
										ItemType1		= ItemType 						'(1:Item,2:Music)
										ItemID1			= ItemID 							'ITEM ���̵�

										'���ν��� ȣ��
										Set objCmd = Server.CreateObject("ADODB.Command")
											
										If ItemGem1 > 0 Then
											With objCmd
												.ActiveConnection	= Conn
												.CommandText		= "PROC_PAYMENT_ORDERLOG_COMMAND_INSERT"
												.CommandType		= adCmdStoredProc     
	
												.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
												.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
												.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , ItemID1)
												.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, ItemName1)
												.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , ItemGem1)
												.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , ItemCash1)
												.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , 0)
												.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, "S")
												.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , pid)
												.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "S")
												.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
												.Execute
												RESULT = .Parameters("ERRNO")
											End with
										Else
											With objCmd
												.ActiveConnection	= Conn
												.CommandText		= "PROC_PAYMENT_CASHLOG_COMMAND_INSERT"
												.CommandType		= adCmdStoredProc     
	
												.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
												.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
												.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , ItemID1)
												.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, ItemName1)
												.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , ItemGem1)
												.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , ItemCash1)
												.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , 0)
												.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, "S")
												.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , pid)
												.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "S")
												If chkCashType = "OC" Then	'����ĳ��
													.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "O")
												ElseIf chkCashType = "MC" Then		'����ĳ��
													.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "M")
												ElseIf chkCashType = "AC" Then		'������ĳ��
													.Parameters.Append .CreateParameter("@cashCase", adChar, adParamInput, 1, "I")
												End If
												.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
												.Execute
												RESULT = .Parameters("ERRNO")
											End with
										End If
			
										Set objCmd = Nothing
									End If

							End If

					objDBrsChk.Movenext
					Loop

				End If

		objDBrsChk.Close
		Set objDBrsChk=Nothing

		objDBrs.Movenext
		Loop

	End If
	objDBrs.Close
	Set objDBrs = Nothing
%>