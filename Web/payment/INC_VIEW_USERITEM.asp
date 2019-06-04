<%
	'결제할 캐쉬정보 정산
	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'L'"
	Set objDBrsLoop	= Conn.Execute(strSQL)
	
	If Not(objDBrsLoop.BOF or objDBrsLoop.EOF) Then

		i = 1
		ea = 0
		OrderPrice = 0
		sumPoint = 0
		sumGem	 = 0
		SumPid	= ""
		SumgName	= ""

		Do until objDBrsLoop.EOF	
			i_seq 		= objDBrsLoop(0)
			memberID 	= objDBrsLoop(1)
			pid 			= objDBrsLoop(2)
			gName 		= objDBrsLoop(3)
			i_Gem	 	= objDBrsLoop(4)
			i_price 		= objDBrsLoop(5)
			i_point		= objDBrsLoop(6)
			gFlag 		= objDBrsLoop(7)
			regDate		= objDBrsLoop(8)

			If gFlag = "T" Then
            	
            	strSQL 		= "p_o2jam_SETITEM_DATA_DETAIL " & pid

				Set objDBrs 	= Conn1.Execute(strSQL)

				Dim TGEM, TWON, TO2Cash
				Dim objDBrsChk
				Dim PartItemID, ItemName, ItemKind, ItemType, ItemID
				Dim ItemGem1, ItemCash1, PartItemID1, ItemName1, ItemKind1, ItemType1, ItemID1
				Dim ChkItem, ItemGem, ItemMCASH

					If Not(objDBrs.BOF or objDBrs.EOF) Then
						TGEM		= 0
						TWON		= 0
						TO2Cash	= 0

						Do until objDBrs.EOF

							PartItemID 	= objDBrs("PartItemID")
							ItemName 	= objDBrs("ItemName")
							ItemKind 	= objDBrs("ItemKind")
							ItemType 	= objDBrs("ItemType")
							ItemID 		= objDBrs("ItemID")

							If ItemType = 1 Then
								strSQL				= "p_o2jam_SETITEM_DUP_ITEM_CHECK_2 "&USER_INDEX_ID&","&ItemID
								Set objDBrsChk 	= Conn1.Execute(strSQL)
								ChkItem				= objDBrsChk(0)
								
								objDBrsChk.Close
								Set objDBrsChk	= Nothing

								If ChkItem = 1 Then
									ItemGem1		= 0
									ItemCash1 	= 0
								Elseif ChkItem = 0 Then
									ItemGem1		= objDBrs("ItemGem")
									ItemCash1 	= objDBrs("ItemCash")
									PartItemID1		= PartItemID
									ItemName1	= ItemName
									ItemKind1		= ItemKind
									ItemType1		= ItemType
									ItemID1			= ItemID
							
								End If

							Elseif ItemType = 2 Then
								strSQL 	= "P_o2jam_SETITEM_DUP_MUSIC_CHECK '"&USER_INDEX_ID&"',"&ItemID
								Set objDBrsChk 	= Conn1.Execute(strSQL)
								ChkItem = objDBrsChk(0)
							
								objDBrsChk.Close
								Set objDBrsChk = Nothing
								
								If ChkItem = 1 Then
									ItemGem1		= 0
									ItemCash1		= 0
								Elseif ChkItem = 0 Then
									ItemGem1		= objDBrs("ItemGem")
									ItemCash1 	= objDBrs("ItemCash")
									PartItemID1		= PartItemID
									ItemName1	= ItemName
									ItemKind1		= ItemKind
									ItemType1		= ItemType
									ItemID1			= ItemID
							
								End If
							End If

							objDBrs.Movenext
							TGEM	= TGEM + ItemGem
							TWON	= TWON + ItemMCash
						Loop

					End If

					objDBrs.Close
					Set objDBrs=Nothing
            	
			End If
			objDBrsLoop.Movenext

			If i = 1 Then
				SumPid = pid 		
			Else
				SumPid = pid 
			End If

			If i = 1 Then
				SumgName = gName 		
			Else
				SumgName = gName 
			End If

			ea = ea + 1
			sum = sum + i_price
			sumPoint = sumPoint + i_point
			sumGem = sumGem + i_Gem
			i = i + 1
	    Loop
	End If

	objDBrsLoop.Close
	Set objDBrsLoop = Nothing
		
	'내가 주문하는 총 Gem
	sumGem		= int(sumGem)
	OrderPrice		= int(sum)
	strGoodsNo	= int(SumPid)
	SungName		= Trim(SumgName)
	strOthers		= int(SumPid)
%>