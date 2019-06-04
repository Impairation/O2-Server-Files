<%
'	선물 받을 회원정보 가져오기
	SQL 	= "P_o2jam_UserID_check '"& ToWhoID &"'"
	Set RS 	= Conn1.Execute(SQL)
	if Not(RS.BOF or RS.EOF) then
		ToWhoIndexID 	= RS("USER_INDEX_ID") 
		ToWhoID 		= RS("USER_ID") 
		ToWhoNickName 	= RS("USER_NICKNAME")
		ToWhoSex 		= RS("SEX")
	END IF
	RS.Close
	Set RS = Nothing

	uSQL = "Update TB_GIFT_IMSI_CART Set ToWhoID ='"& ToWhoID &"',ToWhoNickName = '"& ToWhoNickName &"' Where memberID = '"& gameid &"'"
	Conn.Execute(uSQL)
%>