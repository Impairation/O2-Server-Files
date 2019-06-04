<%
'	急拱罐绰 荤恩狼 己喊 啊瘤绊 坷扁

	strSQL 	= "P_o2jam_UserID_check '"& ToWhoID &"'"
	Set objDBrs = Conn1.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) Then
		ToWhoIndexID	 	= objDBrs("USER_INDEX_ID") 
		ToWhoID				= objDBrs("USER_ID") 
		ToWhoNickName 	= objDBrs("USER_NICKNAME")
		ToWhoSex 			= int(objDBrs("SEX"))
	End If
	objDBrs.Close
	Set objDBrs = Nothing

	strSQL	 	= "SELECT pid FROM TB_GIFT_IMSI_CART Where memberID = '"& gameid &"' AND gFlag = 'I'"  
	Set objDBrs	= Conn.Execute(strSQL)
	
	If Not(objDBrs.BOF or objDBrs.EOF) Then
		Do until objDBrs.EOF	
			sex_pid	= objDBrs(0)

			strSQL	= "P_o2jam_item_data_certify_sex "& sex_pid &","& ToWhoSex &""
			Set objDBrsSEX = Conn1.Execute(strSQL)

			If Not(objDBrsSEX.BOF or objDBrsSEX.EOF) Then
				fchkRet 	= objDBrsSEX(0) 
			End If

			objDBrsSEX.Close
			Set objDBrsSEX = Nothing

			'chkRet - 1(己傍) - 0(角菩)
			If fchkRet = 0 Then
				Response.Write "<script>alert('获赠者的性别不适合此物品.');presendit();</script>"
			End If

			objDBrs.Movenext
    	Loop
	End If

	objDBrs.Close
	Set objDBrs = Nothing
%>