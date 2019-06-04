<!--METADATA TYPE="typelib"  NAME="ADODB Type Library UUID= "00000205-0000-0010-8000-00AA006D2EA4" -->
<% Option Explicit %>
<%
	'====================================================
	'DB에 접속하기 위하여 필요한 변수
	'====================================================
 	Dim oConn    			'connection object
 	Dim oComm    			'command object
 	Dim oRs      			'recordset object
	Dim sConnection_string		'connection string
 	Dim sStored_proc     		'sql 문자열 변수

	Dim strUserID
	
	Dim strLinkString
	
	Dim strResult
	dim interrorno
	Dim aList
	Dim nMessageCount

	Dim nSeq
	Dim strSenderID, strSenderNickName, strTitle, strContent, strWriteDate
	Dim nTypeFlag
	
	Dim strOnImage
	Dim strMsgLinkStringA, strMsgLinkStringB
	
	strOnImage = "off"
	strMsgLinkStringA = ""
	strMsgLinkStringB = ""
	
	strUserID = Trim(Request.QueryString("MyID"))
	
	strLinkString = "MyID=" + strUSerID

	sStored_proc = "P_o2jam_Message_Detail_View_2"
	
	sConnection_string = Application("c_Connection_ConnectionString") ' 해당 DB 연결 정보 할당 Global.asa에 포함된 내용호출
	
	'*************************** error check block
	On Error Resume Next	
	
	Set oConn = Server.CreateObject("ADODB.Connection")
	Set oComm = Server.CreateObject("ADODB.Command")

	oConn.CursorLocation = adUseClient
   	oConn.Open sConnection_string

	oComm.ActiveConnection = oConn
	oComm.CommandType = adCmdStoredProc
	oComm.CommandText = sStored_proc
	oComm.Parameters.Append oComm.CreateParameter("@UserID", adVarChar, adParamInput, LenB(strUserID), strUserID)
	Set oRs = oComm.Execute
	
	Set oComm = Nothing

	IF oRs.EOF then
		nMessageCount = 0
	ELSE
		oRs.PageSize = 1
		oRs.AbsolutePage = 1
		nMessageCount = oRs.Recordcount   
		aList = oRs.GetRows(2)	'DB의 내용을 배열에 저장한다.
	END IF

	oRs.Close
	Set oRs = Nothing

	IF nMessageCount > 0 THEN
		nSeq = Trim(aList(0,0))
		strSenderID = Trim(aList(1,0))  
		strSenderNickName = Trim(aList(2,0))  
		strTitle = Trim(aList(5,0))  
		strContent = Trim(aList(6,0))  
		strWriteDate = Trim(aList(7,0))  
		nTypeFlag = CInt(aList(8,0))  
		
		strContent = strWriteDate + chr(13) + "--------------------------" + chr(13) + strContent

		'sStored_proc = "P_o2jam_Message_Read_Flag_Set_2" 
		sStored_proc = "P_o2jam_Message_Delete_2"
		Set oComm = Server.CreateObject("ADODB.Command")
	
		oComm.ActiveConnection = oConn
		oComm.CommandType = adCmdStoredProc
		oComm.CommandText = sStored_proc
		oComm.Parameters.Append oComm.CreateParameter("@UserID", adVarChar, adParamInput, LenB(strUserID), strUserID)
		oComm.Parameters.Append oComm.CreateParameter("@MsgSeq", adInteger, adParamInput, 4, nSeq)
		oComm.Parameters.Append oComm.CreateParameter("@Errno", adInteger, adParamoutput, 4, interrorno)
		oComm.Execute
	
		Set oComm = Nothing

		nMessageCount = nMessageCount - 1
	END IF
	
	oConn.Close
	Set oConn = Nothing	
	
	'********************************************
	'====================================================
	'Error발생시 지정된 error file로 이동한다.
	'====================================================
	if Err.Number <> 0 then
		Err.Clear 
		Response.Redirect("gamefind_error.asp?" & strLinkString & "&EN=3")
	end if	

	IF nMessageCount > 0 THEN
		strOnImage = "on"
		strMsgLinkStringA = "<a href='gamefind_recmess.asp?" + strLinkString + "&TS=" + CStr(timer()) + "'>"
		strMsgLinkStringB = "</a>"
	END IF
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="gamefind.css" rel="stylesheet" type="text/css">
</head>

<body background="/images/gamefind/game_bg00.gif" leftmargin="0" topmargin="0"  OnContextMenu="return false;" OnSelectStart="return false;">
 <table width="171" height="502" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top"><table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/gamefind/game_tit_recmessage.gif" width="170" height="27"></td>
        </tr>
        <tr> 
          <td align="center" background="/images/gamefind/game_table_bg01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_bg07.gif" width="170" height="18"></td>
              </tr>
            </table>
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background="/images/gamefind/game_table_bg05.gif"><img src="/images/gamefind/game_table_bg05.gif" width="3" height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><input ReadOnly name="textfield" type="text" size="21" class="input01" value="<% Response.Write( strSenderNickName ) %>"> 
                </td>
              </tr>
            </table>
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background="/images/gamefind/game_table_bg05.gif"><img src="/images/gamefind/game_table_bg05.gif" width="3" height="2"></td>
              </tr>
            </table>
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="3"></td>
              </tr>
            </table>
            <table width="86%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_word01.gif" width="37" height="11"> 
                </td>
              </tr>
            </table>
            <textarea name="textarea2" ReadOnly cols="22" rows="1" class="input01"  style="OVERFLOW: hidden;BACKGROUND-COLOR: #12377F; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; colorvc_resdate: #000000"><% Response.Write( strTitle ) %></textarea>
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background="/images/gamefind/game_table_bg05.gif"><img src="/images/gamefind/game_table_bg05.gif" width="3" height="2"></td>
              </tr>
            </table>
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="3"></td>
              </tr>
            </table> 
            <table width="86%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_word06.gif" width="37" height="11"> 
                </td>
              </tr>
            </table>
            <textarea name="textarea" ReadOnly cols="22" rows="10" class="input01"  style="OVERFLOW: hidden;BACKGROUND-COLOR: #12377F; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; colorvc_resdate: #000000"><% Response.Write( strContent ) %></textarea>
            <table width="134" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="15"><img src="/images/gamefind/game_num_bg01.gif" width="15" height="25"></td>
                <td align="center" background="/images/gamefind/game_num_bg02.gif"><table border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><% Response.Write( strMsgLinkStringA ) %><img src="/images/gamefind/game_word07_<% Response.Write( strOnImage ) %>.gif" width="66" height="11" border="0" align="absmiddle"><span class="txtwhite"><strong><% Response.Write( CStr( nMessageCount ) ) %></strong></span><% Response.Write( strMsgLinkStringB ) %></td>
                    </tr>
                  </table></td>
                <td width="15"><img src="/images/gamefind/game_num_bg03.gif" width="15" height="25"></td>
              </tr>
            </table> 
            <table width="90%" border="0" cellspacing="0" cellpadding="3">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="10"></td>
              </tr>
            </table>
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background="/images/gamefind/game_table_bg05.gif"><img src="/images/gamefind/game_table_bg05.gif" width="3" height="2"></td>
              </tr>
            </table>
            <table width="90%" border="0" cellspacing="0" cellpadding="1">
              <tr> 
                <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="center"><a href="gamefind_user_list.asp?<% Response.Write( strLinkString ) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_ok_off.gif" width="69" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_ok_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_ok_off.gif'"></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><img src="/images/gamefind/game_table_bg04.gif" width="170" height="17"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
<% IF nMessageCount < 1 THEN %>
<Script Language="jscript">
	parent.document.all("MyMsgBox").src = "./gamefind_message.asp?<% Response.Write( strLinkString  ) %>&TS=<% Response.Write(timer()) %>";
</Script>
<% END IF %>
