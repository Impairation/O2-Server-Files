<%	
	'������ ����
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
		
	'�� ����
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
	
	'�ǸŰ� ������ ������ üũ
	'buyDisableType = "X" �Ǹ��Ͻ�����
	'buyDisableType = "Z" �Ǹ�����
	'buyDisableType = "W" HOMEPAGE ������ ���Ű���
	'buyDisableType = "T" ��Ʈ�θ� ���Ű���
	For i = 0 To 9
		If sid(i) <> "" Then
			Select Case sid(i)
			Case 235
				SUB_CHECK_SONG("Z")
				Response.End
			End Select
		End If
	Next
	
	'�ǸŰ� ������ ���������� üũ
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
								Response.Write "����ѡ��������ʱֹͣ���۵ĵ���"
							ElseIf buyDisableType = "Z" Then
								Response.Write "��ѡ��ĵ���������ֹͣ���۵ĵ���"
							ElseIf buyDisableType = "W" Then
								Response.Write "��ѡ��ĵ�������ֻ������ҳ�Ϲ���"
							ElseIf buyDisableType = "T" Then
								Response.Write "��ѡ��ĵ�������ֻ������װ����ĵ���"
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
								Response.Write "��ѡ��ĸ���������ʱֹͣ���۵ĸ���"
							ElseIf buyDisableType = "Z" Then
								Response.Write "��ѡ��ĸ���������ֹͣ���۵ĸ���"
							ElseIf buyDisableType = "W" Then
								Response.Write "��ѡ��ĸ�������ֻ������ҳ�Ϲ���ĸ���"
							ElseIf buyDisableType = "T" Then
								Response.Write "��ѡ��ĸ�������ֻ������װ����ĵ���"
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