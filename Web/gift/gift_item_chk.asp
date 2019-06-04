<%
	strSQL = "SELECT pid FROM TB_GIFT_IMSI_CART Where memberID = '"& gameid &"' AND gFlag = 'I'"  
	Set objDBrs = Conn.Execute(strSQL)
	
	If Not(objDBrs.BOF or objDBrs.EOF) Then

		ChkItemRecord = 0

		Do until objDBrs.EOF	
			it_pid 		= objDBrs(0)

			strSQL = "P_O2JAM_LOAD_ITEM_BAG '"& USER_INDEX_ID &"'"
			Set ickRS	= 	Conn1.Execute(strSQL)

			If ickRS.BOF or ickRS.EOF Then
				Response.Write "<script>	alert('无相应数据.');	presendit();</script>"
			Else
				For i = 0 to 29
					BAG(i) 	= ickRS(i)
				Next	
			End If

			For i = 0 to 29
				If int(BAG(i)) = int(it_pid) Then
					ChkItemRecord = 1
					Exit For
				End If
			Next

			If ChkItemRecord > 0 Then
				Response.Write "<script>	alert('获赠者已经拥有此歌曲.');presendit();</script>"
			End If
			
			ickRS.Close
			Set ickRS = Nothing	

	    objDBrs.Movenext
    	Loop

	end if

	objDBrs.Close
	Set objDBrs = Nothing
%>