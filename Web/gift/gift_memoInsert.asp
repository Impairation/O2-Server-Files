<%
'	자신의 정보를 가져오기
	fSQL 	= "P_o2jam_My_Simple_info '"& gameid &"'"
	Set fRS = Conn1.Execute(fSQL)

	if Not(fRS.BOF or fRS.EOF) then
		FromWhoIndexID 	= fRS("USER_INDEX_ID") 
		FromWhoID 		= fRS("USER_ID") 
		FromWhoNickName = fRS("USER_NICKNAME")
		FromWhoSex 		= fRS("SEX")
	END IF
	fRS.Close
	Set fRS = Nothing

	memo		= replace(memo,"'","''")
	FromWhoNickName		= replace(FromWhoNickName,"'","''")

	gmiSQL = "P_o2jam_Message_Insert '"& FromWhoID &"','"& FromWhoIndexID &"','"& FromWhoNickName &"',"
	gmiSQL = gmiSQL & "'"& ToWhoID &"','"& ToWhoIndexID &"','"& ToWhoNickName &"','"& memo &"','"& MemoContent &"',0"
	Conn1.Execute(gmiSQL)
%>