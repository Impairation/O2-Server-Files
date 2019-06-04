<%
	strSQL = "SELECT pid FROM TB_GIFT_IMSI_CART Where memberID = '"& gameid &"' AND gFlag = 'S'"  
	Set objDBrs = Conn.Execute(strSQL)
	
	If Not(objDBrs.BOF or objDBrs.EOF) Then

		Do until objDBrs.EOF	
			m_pid 		= objDBrs(0)

			strSQL = "P_o2jam_My_Music_Check "& USER_INDEX_ID &",'"& m_pid &"'"
			Set mckRS	= 	Conn1.Execute(strSQL)

			If Not(mckRS.BOF or mckRS.EOF) Then
				Response.Write "<script>	alert('获赠者已有此物品.');presendit();</script>"
			End If

			mckRS.Close
			Set mckRS = Nothing	

	    objDBrs.Movenext
    	Loop
	End If

	objDBrs.Close
	Set objDBrs = Nothing
%>