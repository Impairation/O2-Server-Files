<%
	'''This is User's MCash Searching
	'''==============================
	strSQL = "SELECT MCASH FROM UserMcash WHERE userid = '"  & gameid & "'"
	Set objDBrsCASH = Conn.Execute(strSQL)

	If Not(objDBrsCASH.BOF or objDBrsCASH.EOF) Then		
		MCash	= int(objDBrsCASH("MCash"))
	Else
		MCash	= 0
	End If

	objDBrsCASH.Close
	Set objDBrsCASH = Nothing
	'''==============================
	
	strSQL = "P_O2JAM_LOAD_CASH " & USER_INDEX_ID '모든 결제가 성공했을시
	Set objDBrsCASH = Conn1.Execute(strSQL)
					
	If Not(objDBrsCASH.BOF or objDBrsCASH.EOF) Then
		Gem				= int(objDBrsCASH("Gem"))
		O2Cash			= int(objDBrsCASH("O2Cash"))
		MusicCash	= int(objDBrsCASH("MusicCash"))
		ItemCash		= int(objDBrsCASH("ItemCash"))
	Else
		Gem				= 0
		O2Cash			= 0
		MusicCash	= 0
		ItemCash		= 0
	End If
			
	objDBrsCASH.Close
	Set objDBrsCASH = Nothing

%>