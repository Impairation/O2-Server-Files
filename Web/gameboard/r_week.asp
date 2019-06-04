<%
	'====================================================
	'DB�� �����ϱ� ���Ͽ� �ʿ��� �������̴�.
	'====================================================
	Dim oConn    			'connection object
	Dim oRs      			'recordset object
	Dim sConnection_string		'connection string
	Dim sStored_proc     		'sql ���ڿ� ����	
	
	Dim dateUpdateDate		
	Dim sUpdateDateDay		'Update ����
	Dim sUpdateDateWeek		'Update ����
	Dim sUpdateDateMonth		'Update ����
	
	Dim iSeq
	Dim iRanking
	Dim iMusicID
	Dim sMusicTitle
	Dim sArtist
	Dim sEditor
	Dim iChangeType
	Dim iChangeRanking
	Dim sChangeImage
	Dim sChangeRanking
	
	Dim sWeek
		
    	Dim dateUpdateStartWeek
    	Dim dateUpdateEndWeek
   	Dim dateMonthFirstDay
   	Dim datePreMonth
   	Dim iWeekCount
   	Dim iStartWeekMonth
   	Dim iStartWeekDay
   	Dim iEndWeekMonth
   	Dim iEndWeekDay
				
	'====================================================
	'DB���� data�� ������
	'====================================================
	sStored_proc = "PROC_MUSIC_RANKING_UPDATE_DATE @RankingType='d'"
	
	sConnection_string = Application("Connection_ConnectionString") ' �ش� DB ���� ���� �Ҵ� Global.asa�� ���Ե� ����ȣ��

	'*************************** error check block
	'On Error Resume Next

	Set oConn = Server.CreateObject("ADODB.Connection")

	oConn.CursorLocation = adUseClient
   	oConn.Open sConnection_string

    	Set oRs = oConn.Execute(sStored_proc)
    	
    	IF NOT oRs.EOF THEN
    		dateUpdateDate = oRs("WriteDate")
    	END IF
    	
    	oRs.Close
    	Set oRs = Nothing
    	
    	sUpdateDateDay = CStr( Year(dateUpdateDate) ) & "�� " & CStr( Month(dateUpdateDate) ) & "�� " & CStr( Day(dateUpdateDate) ) & "�� " & CStr( Weekdayname( Weekday(dateUpdateDate) ) )
    	
    	dateUpdateStartWeek = DateAdd( "d", 1 - Weekday(dateUpdateDate) - 7, dateUpdateDate ) 
    	
    	iStartWeekMonth = Month(dateUpdateStartWeek)
    	iStartWeekDay = Day(dateUpdateStartWeek)
    	
    	dateUpdateEndWeek = DateAdd( "d", 7 - Weekday(dateUpdateDate) - 7 , dateUpdateDate ) 
    	
    	iEndWeekMonth = Month(dateUpdateEndWeek)
    	iEndWeekDay = Day(dateUpdateEndWeek)

   	dateMonthFirstDay = CStr( Year(dateUpdateEndWeek) ) & "-" & CStr( Month(dateUpdateEndWeek) ) & "-01"
   	
   	iWeekCount = DateDiff("ww", dateMonthFirstDay, dateUpdateEndWeek)
    	
    	sUpdateDateWeek = CStr(Year(dateUpdateEndWeek)) & "�� " & CStr(Month(dateUpdateEndWeek)) & "�� " & iWeekCount + 1 & "��°�� (" & iStartWeekMonth & "�� " & iStartWeekDay & "��~" & iEndWeekMonth & "�� " & iEndWeekDay & "��)����"

    	dateUpdateEndWeek = DateAdd( "d", 7 - Weekday(dateUpdateDate) - 7 , dateUpdateDate ) 
    	
    	datePreMonth = DateAdd( "m", -1 , dateUpdateDate )

	sUpdateDateMonth = CStr( Year(datePreMonth) ) & "�� " & CStr( Month(datePreMonth) ) & "�� ����"
%>

<html>
<head>
<title>::�ŷ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body{
scrollbar-face-color: #A5ADEF; scrollbar-shadow-color: #777BDA; 
scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#B8BEF6; 
scrollbar-darkshadow-color:#5456A4; scrollbar-track-color: #636BD9; 
scrollbar-arrow-color:#464B97;} 
--> 
</style>
<link href="gameboard.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#414188" oncontextmenu="return false" ondragstart="return false" onselectstart="return false" topmargin="0" leftmargin="0">
<%
				sStored_proc = "PROC_MUSIC_RANKING_LIST_UP @RankingType='w'"

				Set oRs = oConn.Execute(sStored_proc)
				
				While NOT oRs.EOF
					iSeq = oRs("j_Seq")
					iRanking = oRs("Ranking")
					iMusicID = oRs("MusicID")
					sMusicTitle = Trim(oRs("MusicTitle"))
					sArtist = Trim(oRs("Artist"))
					sEditor = Trim(oRs("Editor"))
					iChangeType = oRs("ChangeType")
					iChangeRanking = oRs("ChangeRanking")
					
					Select Case iChangeType
      						Case 0                ' Down
      							sChangeImage = "/images/gameboard/musicranking/music_bullet_down.gif"
      							sChangeRanking = CStr(iChangeRanking)
						Case 1                ' Up
      							sChangeImage = "/images/gameboard/musicranking/music_bullet_up.gif"
      							sChangeRanking = CStr(iChangeRanking)
						Case 2                ' Same
      							sChangeImage = "/images/gameboard/musicranking/music_bullet_none.gif"
      							sChangeRanking = "-"
						Case 3                'New Entry
      							sChangeImage = "/images/gameboard/musicranking/music_bullet_new.gif"
      							sChangeRanking = "-"
						Case Else
					End Select
%>
				  <table width="100%" border="0" cellspacing="0" cellpadding="4">
                    <tr class="txtWhite"> 
                      <td width="9%" align="center"> <% Response.Write( iRanking ) %></td>
                      <td align="left" class="txtWhiteB"><% Response.Write( sMusicTitle ) %></td>
                      <td width="22%" align="center"><% Response.Write( sArtist ) %></td>
                      <td width="20%" align="center"><% Response.Write( sEditor ) %></td>
                      <td width="5%" align="center"><img src="<% Response.Write( sChangeImage ) %>" width="19" height="19" align="absmiddle">
                      </td>
                      <td width="5%" align="center"><% Response.Write( sChangeRanking ) %></td>
                    </tr>
                  </table>
                  <table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td background="/images/gameboard/musicranking/music_bg_line.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                  </table>
<%
					oRs.MoveNext

				WEnd
				
				oRs.Close
				Set oRs =Nothing

%>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFFFFF"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                  </table>
<!--                   <table width="80%" border="0" cellspacing="0" cellpadding="3">
                    <tr> 
                      <td align="center" class="txtWhite"><a href="#"><img src="/images/gameboard/community/commu_free_but_left.gif" width="17" height="17" border="0" align="absmiddle"><span class="txtWhite"> 
                        ���� 10�� </span></a><strong><a href="#"><span class="txtLightBlueB">[1]</span></a></strong>[2][3][4][5][6][7][8][9][10] 
                        <a href="#"><span class="txtWhite">����10��</span> <img src="/images/gameboard/community/commu_free_but_right.gif" width="17" height="17" border="0" align="absmiddle"></a></td>
                    </tr>
                  </table> -->
</body>
</html>