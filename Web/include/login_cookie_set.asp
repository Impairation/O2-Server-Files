
<% 
	'''= 로그인한 상태이면 팝업창 닫기
	If Len(setGameID) > 0 And Len(setNick) <= 0 Then 
		'''= 엠게임 로그인
		If Len(Request.Cookies("MGAME")("ID")) > 0 Then
		
			'오투잼 닉네임이 없을시 오투잼 닉네임을 할당한다
			If Len(Request.Cookies("O2Jam")("chkNick")) <= 0 Then
				Dim objDBConnLogin, objRsLogin, objRsAvatar, strSqlLogin, strSqlAvatar
				Dim O2JamNickName
				Dim FILE_PATH
				
				'오투 닉네임 디비에서 가져온다~
				Set objDBConnLogin = Server.CreateObject("ADODB.Connection")
				objDBConnLogin.Open Application("c_Connection_ConnectionString")
					
				strSqlLogin 	= "P_o2jam_UserID_check '" & Request.Cookies("MGAME")("ID") &"'"
				Set objRsLogin = objDBConnLogin.Execute(strSqlLogin)
				
				'디비에 없으면 아이디를 닉네임으로 할당, 있으면 있는것 할당			
				If objRsLogin.EOF Or objRsLogin.BOF Then
					O2JamNickName = Request.Cookies("MGAME")("ID")
				Else
					O2JamNickName = objRsLogin.Fields("USER_NICKNAME").Value
				End If
					
				objRsLogin.Close
				Set objRsLogin = Nothing
					
				'아바타 이미지 경로 가져옴
				If Len(Request.Cookies("O2Jam")("O2JamAvatarPATH")) <= 0 Then
					strSqlAvatar = "P_o2jam_load_char_add '" & Trim(Request.Cookies("MGAME")("ID")) & "'"
					Set objRsAvatar = objDBConnLogin.Execute(strSqlAvatar)
					
					If objRsAvatar.EOF Or objRsAvatar.BOF Then '업로드한 이미지가 없을경우 디폴트를 뿌려라
						If Request.Cookies("MGAME")("SEX") = 1 Then '남자
							FILE_PATH = "/O2jamFile/Avatar/avatar_man_normal_main.gif"
						Elseif Request.Cookies("MGAME")("SEX") = 2 Then '여자
							FILE_PATH = "/O2jamFile/Avatar/avatar_woman_normal_main.gif"
						Else '쿠키값을 못 읽을때
							FILE_PATH = "/O2jamFile/Avatar/avatar_woman_normal_main.gif"
						End If
					Else
						FILE_PATH = Trim(objRsAvatar.Fields("FILE_PATH").Value)
					End If
					
					objRsAvatar.Close
					Set objRsAvatar = Nothing
				End If
				
				
				objDBConnLogin.Close
				Set objDBConnLogin = Nothing
						
				Response.Cookies("O2Jam")("chkNick")	= O2JamNickName
				Response.Cookies("O2Jam")("O2JamAvatarPATH") = FILE_PATH
				Response.Cookies("O2Jam")("NICK")	= O2JamNickName

			End If
		ElseIf Len(Request.Cookies("O2Jam")("memberID")) > 0 Then 
			'아바타 이미지 경로 가져옴
			If Len(Request.Cookies("O2Jam")("O2JamAvatarPATH")) <= 0 Then
				
				Set objDBConnLogin = Server.CreateObject("ADODB.Connection")
				objDBConnLogin.Open Application("c_Connection_ConnectionString")
						
				strSqlLogin 	= "P_o2jam_UserID_check '" & Trim(Request.Cookies("O2Jam")("GameMemberID")) &"'"
				Set objRsLogin = objDBConnLogin.Execute(strSqlLogin)
				
				'디비에 없으면 아이디를 닉네임으로 할당, 있으면 있는것 할당			
				If objRsLogin.EOF Or objRsLogin.BOF Then
					O2JamNickName = Request.Cookies("O2Jam")("memberID")
				Else
					O2JamNickName = objRsLogin.Fields("USER_NICKNAME").Value
				End If
					
				objRsLogin.Close
				Set objRsLogin = Nothing
						
				strSqlAvatar = "P_o2jam_load_char_add '" & Trim(Request.Cookies("O2Jam")("GameMemberID")) & "'"
				Set objRsAvatar = objDBConnLogin.Execute(strSqlAvatar)
					
				If objRsAvatar.EOF Or objRsAvatar.BOF Then '업로드한 이미지가 없을경우 디폴트를 뿌려라
					If Request.Cookies("O2Jam")("memberSex") = "m" Then '남자
						FILE_PATH = "/O2jamFile/Avatar/avatar_man_normal_main.gif"
					Elseif Request.Cookies("O2Jam")("memberSex") = "f" Then '여자
						FILE_PATH = "/O2jamFile/Avatar/avatar_woman_normal_main.gif"
					Else '쿠키값을 못 읽을때
						FILE_PATH = "/O2jamFile/Avatar/avatar_woman_normal_main.gif"
					End If
				Else
					FILE_PATH = Trim(objRsAvatar.Fields("FILE_PATH").Value)
				End If
				
				objRsAvatar.Close
				Set objRsAvatar = Nothing
				objDBConnLogin.Close
				Set objDBConnLogin = Nothing
						
				Response.Cookies("O2Jam")("memberNick") = O2JamNickName
				Response.Cookies("O2Jam")("O2JamAvatarPATH") = FILE_PATH
			End If
		End If
	End If
%>