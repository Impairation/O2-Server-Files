<%

			strSQL 		= "p_o2jam_SETITEM_DATA_DETAIL "&pid
			Set objDBrsChk 	= Conn1.Execute(strSQL)
				If Not(objDBrsChk.BOF or objDBrsChk.EOF) Then
					TGEM	= 0
					TWON	= 0
					TO2Cash	= 0

					Do until objDBrsChk.EOF

						PartItemID 	= objDBrsChk("PartItemID")	'�Ϸù�ȣ
						ItemName 	= objDBrsChk("ItemName")		'�������̸�
						ItemKind 	= objDBrsChk("ItemKind")		'(?)
						ItemType 	= objDBrsChk("ItemType")		'(1:Item,2:Music)
						ItemID 		= objDBrsChk("ItemID")		'ITEM ���̵�
						ItemGem	= objDBrsChk("ItemGem")	'��Ӵ�
						ItemMCash 	= objDBrsChk("ItemCash")	'��ĳ��

							If ItemType = 1 Then
								%>
								<table width="98%" border="0" cellspacing="0" cellpadding="3">
								  <tr class="txtWhite">
								    <td width="11%" align="center"><img src='/images/gameboard/community/commu_free_bullet01.gif'></td>
								    <td width="17%" class="txtYellow">��������</td>
								    <td width="37%" class="txtYellow"><%=ItemName%></td>
								    <td width="16%" class="txtYellow">
									<% If ItemMCash <> 0 Then %>
										<%=FormatNumber(ItemMCash,0)%> �͡�120%
									<% ElseIf ItemGem <> 0 Then %>
										<%=FormatNumber(ItemGem,0)%> ��
									<% End If %>
									</td>
								    <td width="14%"></td>
								    <td width="8%"></td>
								  </tr>
								</table>
								<%

							ElseIf ItemType = 2 Then
								%>
								<table width="98%" border="0" cellspacing="0" cellpadding="3">
								  <tr class="txtWhite">
								    <td width="11%" align="center"><img src='/images/gameboard/community/commu_free_bullet01.gif'></td>
								    <td width="17%" class="txtYellow">����</td>
								    <td width="37%" class="txtYellow"><%=ItemName%></td>
								    <td width="16%" class="txtYellow">
									<% If ItemMCash <> 0 Then %>
										<%=FormatNumber(ItemMCash,0)%> �͡�120%
									<% ElseIf ItemGem <> 0 Then %>
										<%=FormatNumber(ItemGem,0)%> ��
									<% End If %>
									</td>
								    <td width="14%"></td>
								    <td width="8%"></td>
								  </tr>
								</table>
								<%

							End If

						objDBrsChk.MoveNext
						TGEM	= TGEM + ItemGem		'��Ʈ�����ۿ��� �����ϰ� �ִ� �������� ���� ������ ������ �� 		
						TWON	= TWON + ItemMCash	'��Ʈ�����ۿ��� �����ϰ� �ִ� �������� ������ ������ ��ĳ�� ����

						If ItemType = 1 Then
							strCashMethod = strCashMethod & "I"
						ElseIf ItemType = 2 Then
							strCashMethod = strCashMethod & "S"
						End If
					Loop

				End If

		objDBrsChk.Close
		Set objDBrsChk = Nothing
%>