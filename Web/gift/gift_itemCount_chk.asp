<%
	strSQL = "SELECT count(pid) FROM TB_GIFT_IMSI_CART Where memberID = '"& gameid &"' AND gFlag = 'I'"
	Set objDBrs = Conn.Execute(strSQL)
	totalitemRecord = objDBrs(0)
	objDBrs.Close
	Set objDBrs = Nothing

	strSQL = "P_o2jam_load_item_BAG " & USER_INDEX_ID
	Set objDBrs = Conn1.Execute(strSQL)

	If objDBrs.BOF or objDBrs.EOF Then
		Response.Write "<script>alert('无相应数据.');presendit();</script>"
	Else
		totalitemRecord1 = 0
		
		Dim BAG(30)
		
		For i = 0 to 29
			BAG(i) = objDBrs(i)
		Next
	End If
	
	objDBrs.Close
	Set objDBrs = Nothing	

	For i = 0 to 29
		If int(BAG(i)) = 0 Then
			totalitemRecord1 = totalitemRecord1 + 1
		End If
	Next

	If int(totalitemRecord) > int(totalitemRecord1) Then
		Response.Write "<script>	alert('获赠者的个人房间已无剩余空间.');presendit();</script>"
	End If
%>