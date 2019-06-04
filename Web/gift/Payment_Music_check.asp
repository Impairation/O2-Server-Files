<%	
	'酒捞袍 历厘
	aid(0) = Trim(Request.QueryString ("aid1"))
	aid(1) = Trim(Request.QueryString ("aid2"))
	aid(2) = Trim(Request.QueryString ("aid3"))
	aid(3) = Trim(Request.QueryString ("aid4"))
	aid(4) = Trim(Request.QueryString ("aid5"))
	aid(5) = Trim(Request.QueryString ("aid6"))
	aid(6) = Trim(Request.QueryString ("aid7"))
	aid(7) = Trim(Request.QueryString ("aid8"))
	aid(8) = Trim(Request.QueryString ("aid9"))
	aid(9) = Trim(Request.QueryString ("aid10"))
		
	'邦 历厘
	sid(0) = Trim(Request.QueryString ("sid1"))
	sid(1) = Trim(Request.QueryString ("sid2"))
	sid(2) = Trim(Request.QueryString ("sid3"))
	sid(3) = Trim(Request.QueryString ("sid4"))
	sid(4) = Trim(Request.QueryString ("sid5"))
	sid(5) = Trim(Request.QueryString ("sid6"))
	sid(6) = Trim(Request.QueryString ("sid7"))
	sid(7) = Trim(Request.QueryString ("sid8"))
	sid(8) = Trim(Request.QueryString ("sid9"))
	sid(9) = Trim(Request.QueryString ("sid10"))
	
	tid(0) = Trim(Request.QueryString ("tid1"))
	tid(1) = Trim(Request.QueryString ("tid2"))
	
	'魄概啊 啊瓷茄 邦牢瘤 眉农
	'buyDisableType = "X" 魄概老矫吝瘤
	'buyDisableType = "Z" 魄概辆丰
	'buyDisableType = "W" HOMEPAGE 俊辑父 备概啊瓷
	'buyDisableType = "T" 技飘肺父 备概啊瓷
	For i = 0 To 9
		If sid(i) <> "" Then
			Select Case sid(i)
			Case 235
				SUB_CHECK_SONG("Z")
				Response.End
			End Select
		End If
	Next
	
	'魄概啊 啊瓷茄 酒捞袍牢瘤 眉农
	For i = 0 To 9
		If aid(i) <> "" Then
			Select Case aid(i)
			Case 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443,160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174
				SUB_CHECK_ITEM("Z")
				Response.End
			End Select
		End If
	Next

	For i = 0 To 1
		If tid(i) <> "" Then
			Select Case tid(i)
			Case 24, 25, 26, 27
				SUB_CHECK_ITEM("Z")
				Response.End
			End Select
		End If
	Next
	
	Public Function SUB_CHECK_ITEM(buyDisableType)
		%>
		<html>
		<head>
		<style type="text/css">
			<!--
			body{
			scrollbar-face-color: #C0DCF6; scrollbar-shadow-color: #5DA5E8; 
			scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#C0DCF6; 
			scrollbar-darkshadow-color:#1D76C9; scrollbar-track-color: #4FA5EB; 
			scrollbar-arrow-color:#114677;}
			td {font-size:9pt}
			--> 
		</style>
		</head>
		<body bgcolor="#67BAF0" topmargin="0" leftmargin="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<table width="100%" height="100%" border=0 cellspacing=0 cellpadding=0>
			<tr>
				<td align=center>
					<table width="626" height="290" border=0 cellspacing=0 cellpadding=0 background="http://o2jamp.mgame.com/images/payment/payment_mess_error_bg05.gif">
						<tr><td colspan=3 height=50></td></tr>
						<tr>
							<td width="15%"></td>
							<td>
							<%
							If buyDisableType = "X" Then
								Response.Write "您的选择中有暂时停止销售的道具"
							ElseIf buyDisableType = "Z" Then
								Response.Write "所选择的道具中有已停止销售的道具"
							ElseIf buyDisableType = "W" Then
								Response.Write "所选择的道具中有只能在主页上购买"
							ElseIf buyDisableType = "T" Then
								Response.Write "所选择的道具中有只能用套装购买的道具"
							End If
							%>
							</td>
							<td width="40%"></td>
						</tr>
					</table>
					<table border=0 cellspacing=0 cellpadding=0>
						<tr> 
							<td><img src="/images/payment/payment_mess_error_bg03.gif" width="626" height="16"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</body>
		</html>
		<%
	End Function
	
	Public Function SUB_CHECK_SONG(buyDisableType)
		%>
		<html>
		<head>
		<style type="text/css">
			<!--
			body{
			scrollbar-face-color: #C0DCF6; scrollbar-shadow-color: #5DA5E8; 
			scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#C0DCF6; 
			scrollbar-darkshadow-color:#1D76C9; scrollbar-track-color: #4FA5EB; 
			scrollbar-arrow-color:#114677;}
			td {font-size:9pt}
			--> 
		</style>
		</head>
		<body bgcolor="#67BAF0" topmargin="0" leftmargin="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<table width="100%" height="100%" border=0 cellspacing=0 cellpadding=0>
			<tr>
				<td align=center>
					<table width="626" height="290" border=0 cellspacing=0 cellpadding=0 background="http://o2jamp.mgame.com/images/payment/payment_mess_error_bg05.gif">
						<tr><td colspan=3 height=50></td></tr>
						<tr>
							<td width="15%"></td>
							<td>
							<%
							If buyDisableType = "X" Then
								Response.Write "所选择的歌曲中有暂时停止销售的歌曲"
							ElseIf buyDisableType = "Z" Then
								Response.Write "所选择的歌曲中有已停止销售的歌曲"
							ElseIf buyDisableType = "W" Then
								Response.Write "所选择的歌曲中有只能在主页上购买的歌曲"
							ElseIf buyDisableType = "T" Then
								Response.Write "所选择的歌曲中有只能用套装购买的道具"
							End If
							%>
							</td>
							<td width="40%"></td>
						</tr>
					</table>
					<table border=0 cellspacing=0 cellpadding=0>
						<tr> 
							<td><img src="/images/payment/payment_mess_error_bg03.gif" width="626" height="16"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</body>
		</html>
		<%
	End Function
%>