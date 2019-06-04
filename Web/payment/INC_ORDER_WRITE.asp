<%
		'개별아이템일 경우 로그리스트 만들기
		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'I'"
		Set objDBrs = Conn.Execute(strSQL)

		If Not(objDBrs.BOF or objDBrs.EOF) Then
		
			imlog_pointsum = 0
			Do until objDBrs.EOF
				imlog_seq 			= objDBrs(0)
				imlog_pid 			= objDBrs(1)
				imlog_gName 	= objDBrs(2)
				imlog_gName		= replace(imlog_gName,"'","''")
				imlog_gem			= objDBrs(3)
				imlog_price		= objDBrs(4)

				If o2cash = 0 Then
					imlog_point 	= objDBrs(5)
				Else
					imlog_point 	= 0
				End If

				imlog_gFlag 		= objDBrs(6)

				Set objCmd = Server.CreateObject("ADODB.Command")
					
				With objCmd
					.ActiveConnection = Conn
					.CommandText = "PROC_PAYMENT_ORDERLOG_COMMAND_INSERT"
					.CommandType = adCmdStoredProc     
	
					.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
					.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
					.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , imlog_pid)
					.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, imlog_gName)
					.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , imlog_gem)
					.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , imlog_price)
					.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , imlog_point)
					.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, imlog_gFlag)
					.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , 0)
					.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "I")
					.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
					.Execute
					RESULT = .Parameters("ERRNO")
				End with
			
				Set objCmd = Nothing
				
				objDBrs.MoveNext
				imlog_pointsum = imlog_pointsum + imlog_point
			Loop
		End If

		objDBrs.Close
		Set objDBrs = Nothing
		
		'세트아이템일 경우 주문리스트 만들기
		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'T'"
		Set objDBrs = Conn.Execute(strSQL)

		If Not(objDBrs.BOF OR objDBrs.EOF) Then
		
			Do until objDBrs.EOF

				pid 		= objDBrs("pid")'세트아이템 아이디

				strSQL 		= "P_O2JAM_SETITEM_DATA_DETAIL "&pid
				Set objDBrsChk 	= Conn1.Execute(strSQL)
					If Not(objDBrsChk.BOF OR objDBrsChk.EOF) Then
					
						Do until objDBrsChk.EOF

							PartItemID 	= objDBrsChk("PartItemID")		'일련번호
							ItemName 	= objDBrsChk("ItemName")		'아이템이름
							ItemKind 	= objDBrsChk("ItemKind")			'(?)
							ItemType 	= objDBrsChk("ItemType")		'(1:Item,2:Music)
							ItemID 		= objDBrsChk("ItemID")			'ITEM 아이디
				
								'ITEM 데이타일경우 이미 가지고 있는 아이템이 포함 되었는지 체크한다		
								If ItemType = 1 Then
									strSQL 	= "p_o2jam_SETITEM_DUP_ITEM_CHECK_2 " & USER_INDEX_ID & ", " & ItemID
									Set objDBrsChkITEM 	= Conn1.Execute(strSQL)
									ChkItem =objDBrsChkITEM(0)
									
									objDBrsChkITEM.Close
									Set objDBrsChkITEM = Nothing

									If ChkItem = 1 Then
										ItemGem1		= 0									'잼머니
										ItemCash1 	= 0									'엠캐쉬							
									ElseIf ChkItem = 0 Then
										ItemGem1 		= objDBrsChk("ItemGem")	'잼머니
										ItemCash1 	= objDBrsChk("ItemCash")	'엠캐쉬
										PartItemID1		= PartItemID 						'일련번호
										ItemName1	= ItemName 						'아이템이름
										ItemKind1		= ItemKind 							'(?)
										ItemType1		= ItemType							'(1:Item,2:Music)
										ItemID1			= ItemID 							'ITEM 아이디
										
										'프로시져 호출
										Set objCmd = Server.CreateObject("ADODB.Command")
											
										With objCmd
											.ActiveConnection = Conn
											.CommandText = "PROC_PAYMENT_ORDERLOG_COMMAND_INSERT"
											.CommandType = adCmdStoredProc     
	
											.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
											.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
											.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , ItemID1)
											.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, ItemName1)
											.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , ItemGem1)
											.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , ItemCash1)
											.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , 0)
											.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, "I")
											.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , pid)
											.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "T")
											.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
											.Execute
											RESULT = .Parameters("ERRNO")
										End with
			
										Set objCmd = Nothing
										
									End If
								
								'MUSIC 데이타일경우	이미 가지고 있는 아이템이 포함 되었는지 체크한다			
								ElseIf ItemType = 2 Then
									strSQL 	= "P_O2JAM_SETITEM_DUP_MUSIC_CHECK '" & USER_INDEX_ID & "', " & ItemID
									Set objDBrsChkMUSIC 	= Conn1.Execute(strSQL)
									ChkItem =objDBrsChkMUSIC(0)
									
									objDBrsChkMUSIC.Close
									Set objDBrsChkMUSIC = Nothing

									If ChkItem = 1 Then
										ItemGem1		= 0										'잼머니
										ItemCash1 	= 0										'엠캐쉬									
									ElseIf ChkItem 	= 0 Then
										ItemGem1 		= objDBrsChk("ItemGem")		'잼머니
										ItemCash1 	= objDBrsChk("ItemCash")		'엠캐쉬
										PartItemID1		= PartItemID							'일련번호
										ItemName1	= ItemName 							'아이템이름
										ItemKind1		= ItemKind 								'(?)
										ItemType1		= ItemType								'(1:Item,2:Music)
										ItemID1			= ItemID 								'ITEM 아이디

										'프로시져 호출
										Set objCmd = Server.CreateObject("ADODB.Command")
											
										With objCmd
											.ActiveConnection = Conn
											.CommandText = "PROC_PAYMENT_ORDERLOG_COMMAND_INSERT"
											.CommandType = adCmdStoredProc     
	
											.Parameters.Append .CreateParameter("@OrderNo", adVarChar, adParamInput, 150, OrderNo)
											.Parameters.Append .CreateParameter("@gameID", adVarChar, adParamInput, 30, gameid)
											.Parameters.Append .CreateParameter("@pid", adInteger, adParamInput, , ItemID1)
											.Parameters.Append .CreateParameter("@gName", adVarChar, adParamInput, 150, ItemName1)
											.Parameters.Append .CreateParameter("@GoodGem", adInteger, adParamInput, , ItemGem1)
											.Parameters.Append .CreateParameter("@GoodPrice", adInteger, adParamInput, , ItemCash1)
											.Parameters.Append .CreateParameter("@o_point", adInteger, adParamInput, , 0)
											.Parameters.Append .CreateParameter("@gFlag", adChar, adParamInput, 1, "S")
											.Parameters.Append .CreateParameter("@SetItemID", adInteger, adParamInput, , pid)
											.Parameters.Append .CreateParameter("@itemType", adChar, adParamInput, 1, "T")
											.Parameters.Append .CreateParameter("ERRNO", adInteger, adParamReturnValue, 4)
											.Execute
											RESULT = .Parameters("ERRNO")
										End with
			
										Set objCmd = Nothing
									End If
								End If

						objDBrsChk.Movenext
						Loop

					End If

				objDBrsChk.Close
				Set objDBrsChk=Nothing

			objDBrs.MoveNext
			Loop

		End If
		
		objDBrs.Close
		Set objDBrs = Nothing
%>