<%
	UserID = gameid

	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & UserID & "', 'A'"

	Set objDBrs = Conn.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) then
		Do until objDBrs.EOF
			MusicID 	 = objDBrs(0)

			strSQL = "P_O2JAM_BUY_MUSIC_W '"&UserID&"',"&MusicID
			Conn1.Execute(strSQL)

		objDBrs.Movenext
		Loop
	End If
	
	objDBrs.Close
	Set objDBrs = Nothing


'	��Ʈ�������� ��� MUSIC�� �ִ� ���
	
	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & UserID & "', 'B'"
	'���ڵ带 ȭ��� �ѷ��ֱ� ���� �б�
	Set objDBrs = Conn.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) Then
		Do until objDBrs.EOF
			imsmspid 	 = objDBrs(0)

			strSQL 		= "p_o2jam_SETITEM_DATA_DETAIL "&imsmspid
			Set objDBrsChk = Conn1.Execute(strSQL)
				If Not(objDBrsChk.BOF or objDBrsChk.EOF) Then
					Do until objDBrsChk.EOF

						ItemType 	= objDBrsChk("ItemType")		  '(1:Item,2:Music)
						ItemID 		= objDBrsChk("ItemID")		  'ITEM ���̵�

						'MUSIC ����Ÿ�ϰ�� �̹� ������ �ִ� �������� ���� �Ǿ����� üũ�Ѵ�		

						If ItemType = 2 Then
							strSQL 	= "p_o2jam_SETITEM_DUP_MUSIC_CHECK " & USER_INDEX_ID & "," & ItemID
							Set Chk1RS 	= Conn1.Execute(strSQL)
							ChkItem = Chk1RS(0)
							
							Chk1RS.Close
							Set Chk1RS = Nothing

								If ChkItem = 0 Then	'���� �����̸�
									musicSQL = "P_O2JAM_BUY_MUSIC_W '" & UserID & "'," & ItemID
									Conn1.Execute(musicSQL)
								End If

						End If
					objDBrsChk.Movenext
					Loop

				End If

		objDBrsChk.Close
		Set objDBrsChk = Nothing

		objDBrs.Movenext
		Loop
	End If

	objDBrs.Close
	Set objDBrs = Nothing
%>