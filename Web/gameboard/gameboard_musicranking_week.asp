<%@ LANGUAGE="VBSCRIPT" %>

<%
	Response.Buffer = true
	Response.Expires=0

	'====================================================
	'DB에 접속하기 위하여 필요한 변수들이다.
	'====================================================
	Dim oConn    			'connection object
	Dim oRs      			'recordset object
	Dim sConnection_string		'connection string
	Dim sStored_proc     		'sql 문자열 변수	
	
	Dim dateUpdateDate		
	Dim sUpdateDateDay		'Update 일자
	Dim sUpdateDateWeek		'Update 일자
	Dim sUpdateDateMonth		'Update 일자
	
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
	'DB에서 data를 가져옴
	'====================================================
	sStored_proc = "PROC_MUSIC_RANKING_UPDATE_DATE @RankingType='d'"
	
	sConnection_string = Application("Connection_ConnectionString") ' 해당 DB 연결 정보 할당 Global.asa에 포함된 내용호출

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
    	
    	sUpdateDateDay = CStr( Year(dateUpdateDate) ) & "년 " & CStr( Month(dateUpdateDate) ) & "월 " & CStr( Day(dateUpdateDate) ) & "일 " & CStr( Weekdayname( Weekday(dateUpdateDate) ) )
    	
    	dateUpdateStartWeek = DateAdd( "d", 1 - Weekday(dateUpdateDate) - 7, dateUpdateDate ) 
    	
    	iStartWeekMonth = Month(dateUpdateStartWeek)
    	iStartWeekDay = Day(dateUpdateStartWeek)
    	
    	dateUpdateEndWeek = DateAdd( "d", 7 - Weekday(dateUpdateDate) - 7 , dateUpdateDate ) 
    	
    	iEndWeekMonth = Month(dateUpdateEndWeek)
    	iEndWeekDay = Day(dateUpdateEndWeek)

   	dateMonthFirstDay = CStr( Year(dateUpdateEndWeek) ) & "-" & CStr( Month(dateUpdateEndWeek) ) & "-01"
   	
   	iWeekCount = DateDiff("ww", dateMonthFirstDay, dateUpdateEndWeek)
    	
    	sUpdateDateWeek = iStartWeekMonth & "/" & iStartWeekDay & "~" & iEndWeekMonth & "/" & iEndWeekDay

    	dateUpdateEndWeek = DateAdd( "d", 7 - Weekday(dateUpdateDate) - 7 , dateUpdateDate ) 
    	
    	datePreMonth = DateAdd( "m", -1 , dateUpdateDate )

	sUpdateDateMonth = CStr( Year(datePreMonth) ) & "년 " & CStr( Month(datePreMonth) ) & "월 순위"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>::주간::</title>
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
<!--<body bgcolor="#A3A4E4" oncontextmenu="return false" ondragstart="return false" onselectstart="return false" topmargin="0" leftmargin="0">-->
<body bgcolor="#A3A4E4" topmargin="0" leftmargin="0">
<table width="730" height="430" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="6" align="center"><img src="/images/main/blank.gif" width="1" height="6"></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="15"><img src="/images/gameboard/musicranking/music_topbg_01.gif" width="15" height="36"></td>
                <td background="/images/gameboard/musicranking/music_topbg_02.gif"><table border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="130"><a href="gameboard_musicranking_day.asp"><img src="/images/gameboard/musicranking/music_but01_off.gif" width="115" height="31"  border="0"  onMouseOver="this.src='/images/gameboard/musicranking/music_but01_on.gif'" onMouseOut="this.src='/images/gameboard/musicranking/music_but01_off.gif'"></a></td>
                      <td width="130"><a href="gameboard_musicranking_week.asp"><img src="/images/gameboard/musicranking/music_but02_off.gif" width="116" height="31"  border="0"  onMouseOver="this.src='/images/gameboard/musicranking/music_but02_on.gif'" onMouseOut="this.src='/images/gameboard/musicranking/music_but02_off.gif'"></a></td>
                      <td><a href="gameboard_musicranking_month.asp"><img src="/images/gameboard/musicranking/music_but03_off.gif" width="116" height="31"  border="0"  onMouseOver="this.src='/images/gameboard/musicranking/music_but03_on.gif'" onMouseOut="this.src='/images/gameboard/musicranking/music_but03_off.gif'"></a></td>
                    </tr>
                  </table></td>
                <td align="right" background="/images/gameboard/musicranking/music_topbg_02.gif"><table border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="9"><img src="/images/gameboard/musicranking/music_topbg01_01.gif" width="9" height="25"></td>
                      <td width="130" align="center" background="/images/gameboard/musicranking/music_topbg01_02.gif" class="txtWhite"><font size=1><%=sUpdateDateWeek%></font></td>
                      <td width="9"><img src="/images/gameboard/musicranking/music_topbg01_03.gif" width="9" height="25"></td>
                    </tr>
                  </table></td>
                <td width="15"><img src="/images/gameboard/musicranking/music_topbg_03.gif" width="15" height="36"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="8"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="7"><img src="/images/gameboard/musicranking/music_topbg02_01.gif" width="7" height="29"></td>
                <td background="/images/gameboard/musicranking/music_topbg02_02.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="10%" align="center"><img src="/images/gameboard/musicranking/music_word_num.gif"></td>
                      <td width="1%"><img src="/images/gameboard/musicranking/music_gab01.gif" width="2" height="19"></td>
                      <td align="center"><img src="/images/gameboard/musicranking/music_word_title.gif"></td>
                      <td width="1%"><img src="/images/gameboard/musicranking/music_gab01.gif" width="2" height="19"></td>
                      <td width="18%" align="center"><img src="/images/gameboard/musicranking/music_word_make.gif"></td>
                      <td width="1%"><img src="/images/gameboard/musicranking/music_gab01.gif" width="2" height="19"></td>
                      <td width="18%" align="center"><img src="/images/gameboard/musicranking/music_word_note.gif"></td>
                      <td width="1%"><img src="/images/gameboard/musicranking/music_gab01.gif" width="2" height="19"></td>
                      <td width="12%" align="center"><img src="/images/gameboard/musicranking/music_word_updown.gif"></td>
                    </tr>
                  </table></td>
                <td width="7"><img src="/images/gameboard/musicranking/music_topbg02_03.gif" width="7" height="29"></td>
              </tr>
            </table> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="/images/main/blank.gif" width="1" height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="9" height="9"><img src="/images/gameboard/musicranking/music_table01_tl.gif" width="18" height="18"></td>
                <td background="/images/gameboard/musicranking/music_table01_t.gif"><img src="/images/gameboard/musicranking/music_table01_t.gif" width="2" height="18"></td>
                <td width="9" height="9"><img src="/images/gameboard/musicranking/music_table01_tr.gif" width="18" height="18"></td>
              </tr>
              <tr> 
                <td background="/images/gameboard/musicranking/music_table01_l.gif"><img src="/images/gameboard/musicranking/music_table01_l.gif" width="18" height="2"></td>
                <td align="center" bgcolor="#414188">
<iframe src="r_week.asp" frameborder="0" width="560" height="340" scrolling="yes" vspace="5"></iframe></td>
                <td background="/images/gameboard/musicranking/music_table01_r.gif"><img src="/images/gameboard/musicranking/music_table01_r.gif" width="18" height="2"></td>
              </tr>
              <tr> 
                <td width="9" height="9"><img src="/images/gameboard/musicranking/music_table01_bl.gif" width="18" height="18"></td>
                <td background="/images/gameboard/musicranking/music_table01_b.gif"><img src="/images/gameboard/musicranking/music_table01_b.gif" width="2" height="18"></td>
                <td width="9" height="9"><img src="/images/gameboard/musicranking/music_table01_br.gif" width="18" height="18"></td>
              </tr>
            </table> </td>
          <td><img src="/images/gameboard/musicranking/music_title.gif" width="136" height="130"><br>
            <table width="145" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="/images/gameboard/musicranking/music_table02_t.gif" width="145" height="44"></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="38"><img src="/images/gameboard/musicranking/music_table02_l.gif" width="38" height="267"></td>
                      <td bgcolor="#93B2E4"><!-- #include virtual="/gameboard/banner.inc" --></td>
                      <td width="27" align="right"><img src="/images/gameboard/musicranking/music_table02_r.gif" width="27" height="267"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td><img src="/images/gameboard/musicranking/music_table02_b.gif" width="145" height="23"></td>
              </tr>
            </table> </td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
<img src="/images/main/blank.gif" width="1" height="1"> 
</body>
</html>
