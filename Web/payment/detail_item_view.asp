<%

strSQL 		= "p_o2jam_SETITEM_DATA_DETAIL "&pid

Set objDBrs 	= Conn1.Execute(strSQL)

Dim TGEM, TWON, TO2Cash
Dim objDBrsChk
Dim PartItemID, ItemName, ItemKind, ItemType, ItemID
Dim ItemGem1, ItemCash1, PartItemID1, ItemName1, ItemKind1, ItemType1, ItemID1
Dim ChkItem, ItemGem, ItemCASH

	If Not(objDBrs.BOF or objDBrs.EOF) Then
		TGEM	= 0
		TWON	= 0
		TO2Cash	= 0

		Do until objDBrs.EOF

			PartItemID 	= objDBrs("PartItemID")
			ItemName 	= objDBrs("ItemName")
			ItemKind 	= objDBrs("ItemKind")
			ItemType 	= objDBrs("ItemType")
			ItemID 		= objDBrs("ItemID")

			If ItemType = 1 Then
				strSQL 	= "p_o2jam_SETITEM_DUP_ITEM_CHECK_2 "&USER_INDEX_ID&","&ItemID
				Set objDBrsChk 	= Conn1.Execute(strSQL)
				ChkItem =objDBrsChk(0)
				
				objDBrsChk.Close
				Set objDBrsChk = Nothing

				If ChkItem = 1 Then
					ItemGem1 	= 0
					ItemCash1 	= 0
				Elseif ChkItem = 0 Then
				
					ItemGem1 	= objDBrs("ItemGem")
					ItemCash1 	= objDBrs("ItemCash")
					PartItemID1	= PartItemID
					ItemName1	= ItemName
					ItemKind1	= ItemKind
					ItemType1	= ItemType
					ItemID1		= ItemID
					%>
					<table width="98%" border="0" cellspacing="0" cellpadding="3">
						<tr class="txtWhite">
							<td width="11%" align="center"><img src='/images/gameboard/community/commu_free_bullet01.gif'></td>
							<td width="17%" class="txtYellow">人物形象</td>
							<td class="txtYellow"><%=ItemName1%></td>
							<td width="16%" class="txtYellow">
							<%IF ItemCash1 <> 0 Then%>
								<%=FormatNumber(ItemCash1,0)%> Ｍ
							<%ELSEIF ItemGem1 <> 0 Then%>
								<%=FormatNumber(ItemGem1,0)%> Ｇ
							<%END IF%>
							</td>
							<td width="14%"></td>
							<td width="8%"></td>
							<td width="4%"></td>
						</tr>
					</table>
					<%
				End If

			Elseif ItemType = 2 Then
				strSQL 	= "P_o2jam_SETITEM_DUP_MUSIC_CHECK '"&USER_INDEX_ID&"',"&ItemID
				Set objDBrsChk 	= Conn1.Execute(strSQL)
				ChkItem = objDBrsChk(0)
			
				objDBrsChk.Close
				Set objDBrsChk = Nothing
				
				If ChkItem = 1 Then
					ItemGem1 	= 0
					ItemCash1 	= 0
				Elseif ChkItem = 0 Then
					ItemGem1 	= objDBrs("ItemGem")
					ItemCash1 	= objDBrs("ItemCash")
					PartItemID1	= PartItemID
					ItemName1	= ItemName
					ItemKind1	= ItemKind
					ItemType1	= ItemType
					ItemID1		= ItemID
					%>
					<table width="98%" border="0" cellspacing="0" cellpadding="3">
						<tr class="txtWhite">
							<td width="11%" align="center"><img src='/images/gameboard/community/commu_free_bullet01.gif'></td>
							<td width="17%" class="txtYellow">歌曲</td>
							<td class="txtYellow"><%=ItemName1%></td>
							<td width="16%" class="txtYellow">
							<%If ItemCash1 <> 0 Then%>
								<%=FormatNumber(ItemCash1,0)%> Ｍ
							<%Elseif ItemGem1 <> 0 Then%>
								<%=FormatNumber(ItemGem1,0)%> Ｇ
							<%End If%>
							</td>
							<td width="14%"></td>
							<td width="8%"></td>
							<td width="4%"></td>
						</tr>
					</table>
					<%
				End If
			End If

			objDBrs.Movenext
			TGEM	= TGEM + ItemGem
			TWON	= TWON + ItemCash
			
			If ItemType = 1 Then
				strCashMethod = strCashMethod & "I"
			ElseIf ItemType = 2 Then
				strCashMethod = strCashMethod & "S"
			End If
		Loop

	End If

	objDBrs.Close
	Set objDBrs=Nothing
	%>