<%User_NickName= Request("User_NickName")%>
<html>
<head>
<title>::排名::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body{
scrollbar-face-color: #8BD7EF; scrollbar-shadow-color: #52ACD3; 
scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#A6E1F1; 
scrollbar-darkshadow-color:#287395; scrollbar-track-color: #3DAAD4; 
scrollbar-arrow-color:#1D6786;} 
--> 
</style>
<link href="gameboard.css" rel="stylesheet" type="text/css">

</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" bgcolor="#1A6587" topmargin="0" leftmargin="0">
<%
	Set Conn = server.CreateObject ("ADODB.Connection")
	Conn.Open (Application("Connection_ConnectionString"))

	SQL = "PROC_RANKING_SEARCH '"&User_NickName&"'" 
	Set objDBrs	= Conn.Execute(SQL)

	If objDBrs.BOF or objDBrs.EOF Then
		%>
		<table width="100%" border="0" cellspacing="0" cellpadding="3">
			<tr class="txtWhite"> 
				<td align="center"><%' Not inTop 1000 O2Jammers%>此玩家未进入排名1000以内</td>
			</tr>
		</table>
		<%	
	Else
		Do until objDBrs.BOF or objDBrs.EOF
			Ranking				= objDBrs("Ranking")
			User_Index_ID	= objDBrs("User_Index_ID")
			User_ID				= objDBrs("User_ID")
			User_NickName	= objDBrs("User_NickName")
			Sex					= objDBrs("Sex")
			Level					= objDBrs("Level")
			Battle					= objDBrs("Battle")
			Win					= objDBrs("Win")
			Draw					= objDBrs("Draw")
			Lose					= objDBrs("Lose")
			Experience		= objDBrs("Experience")
			ChangeType		= objDBrs("ChangeType")
			ChangeRanking	= objDBrs("ChangeRanking")
			%>
			<table width="100%" border="0" cellspacing="0" cellpadding="1">
				<tr class="txtWhite"> 
				<td width="14%" align="center"><%=Ranking%></td>
				<td align="left"><%=User_NickName%></td>
				<td width="7%" align="center">Lv.<%=Level%></td>
				<td width="10%" align="center"><%=Experience%></td>
				<td width="12%" align="center"><%=Battle%></td>
				<td width="7%" align="center"><%=Win%></td>
				<td width="7%" align="center"><%=Lose%></td>
				<td width="7%" align="center"><%=Draw%></td>
				<td width="4%">
				<%
				If ChangeType = 1 Then
					%><img src="/images/gameboard/jamjjang/jjang_bullet_up.gif" width="19" height="19"><%
				ElseIf ChangeType = 0 Then
					%><img src="/images/gameboard/jamjjang/jjang_bullet_down.gif" width="19" height="19"><%
				ElseIf ChangeType = 2 Then
					%><img src="/images/gameboard/jamjjang/jjang_bullet_none.gif" width="19" height="19"><%
				ElseIf ChangeType = 3 Then
					%><img src="/images/gameboard/jamjjang/jjang_bullet_new.gif" width="19" height="19"><%
				End If
				%>
			</td>
			<td width="5%"><%=ChangeRanking%></td>
			</tr>
			</table>
			<%
			objDBrs.Movenext
		Loop
	End If
	
	objDBrs.Close
	Set objDBrs = Nothing
	
	Conn.Close
	Set Conn = Nothing
%>

</body>
</html>