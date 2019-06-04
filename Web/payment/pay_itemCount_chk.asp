<%
Dim USER_INDEX_ID, totalitemRecord
	
	strSQL = "P_O2JAM_MY_SIMPLE_INFO '"& gameid &"'"
	Set objDBrs	= 	Conn1.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) Then
		USER_INDEX_ID = objDBrs("USER_INDEX_ID")
	End If

	objDBrs.Close
	Set objDBrs = Nothing	

	strSQL = "P_O2JAM_LOAD_ITEM_BAG "& USER_INDEX_ID
	Set objDBrs	= 	Conn1.Execute(strSQL)

	If objDBrs.BOF or objDBrs.EOF THEN
		Response.Write "<script>	alert('相应数据不存在');	history.back();</script>"
		
		objDBrs.Close
		Set objDBrs = Nothing
	Else
		totalitemRecord = 0
			
		For i = 0 to 29
			If int(objDBrs(i)) = 0 Then
				totalitemRecord = totalitemRecord + 1
			End If
		Next
	End If

	objDBrs.Close
	Set objDBrs = Nothing	
%>
