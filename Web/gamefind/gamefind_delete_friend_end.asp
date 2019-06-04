<!--METADATA TYPE="typelib"  NAME="ADODB Type Library UUID= "00000205-0000-0010-8000-00AA006D2EA4" -->
<% Option Explicit %>
<%
	'====================================================
	'DB¿¡ Á¢¼ÓÇÏ±â À§ÇÏ¿© ÇÊ¿äÇÑ º¯¼ö
	'====================================================
 	Dim oConn    			'connection object
 	Dim oComm    			'command object
 	Dim oRs      			'recordset object
	Dim sConnection_string		'connection string
 	Dim sStored_proc     		'sql ¹®ÀÚ¿­ º¯¼ö
 	Dim sSql

	Dim strUserID
	Dim strTargetID
	Dim strTargetNickName
	Dim strNickNameTemp
	Dim strLinkString
	
	Dim strResult
	Dim nRetVal
	Dim nChkVal
	
	Dim strUserPwd, chkUserPwd
	
	strUserID = Trim(Request.QueryString("MyID"))
	strTargetID = Trim(Request.QueryString("TargetID"))
	strTargetNickName = Trim(Request.QueryString("TargetNickName"))
	
	strUserPwd = Trim(Request.Form("UserPwd"))

	strLinkString = "MyID=" + strUSerID
	
	sStored_proc = "P_o2jam_friend_delete"
	
	sConnection_string = Application("c_Connection_ConnectionString") ' ÇØ´ç DB ¿¬°á Á¤º¸ ÇÒ´ç Global.asa¿¡ Æ÷ÇÔµÈ ³»¿ëÈ£Ãâ
	
	'*************************** error check block
	On Error Resume Next	
	
	Set oConn = Server.CreateObject("ADODB.Connection")
	Set oComm = Server.CreateObject("ADODB.Command")

	oConn.CursorLocation = adUseClient
   	oConn.Open sConnection_string

	If Len(strUserPwd) <= 0 Then
   		nChkVal = "n"
   	Else
   		sSql = "SELECT passwd FROM member WHERE userid = '" & strUserID & "'"   		
   		Set oRs = oConn.Execute(sSql)
   		
   		If oRs.EOF Or oRs.BOF Then
   			nChkVal = "z"
   		Else
   			chkUserPwd = Trim(oRs.Fields("passwd").Value)
   			
   			If strUserPwd = chkUserPwd Then
   				nChkVal = "y"
   			Else
   				nChkVal = "x"
   			End If
   		End If
   	End If
	
	If nChkVal = "y" Then
		oComm.ActiveConnection = oConn
		oComm.CommandType = adCmdStoredProc
		oComm.CommandText = sStored_proc
		oComm.Parameters.Append oComm.CreateParameter("@UserID", adVarChar, adParamInput, LenB(strUserID), strUserID)
		oComm.Parameters.Append oComm.CreateParameter("@FriendID", adVarChar, adParamInput, LenB(strTargetID), strTargetID)
		Set oRs = oComm.Execute
		
		Set oComm = Nothing

		nRetVal = CInt(oRs("Result"))
		
		SELECT CASE nRetVal  
			CASE -1, -2 
				strResult = "<B>[ERROR]</B>´ËÕÊºÅ²»´æÔÚ"
			CASE 0
				strNickNameTemp = Replace( strTargetNickName, "<", "&lt;")
				strNickNameTemp = Replace( strNickNameTemp, ">", "&gt;")
				strResult = "'" + strNickNameTemp + "' ´ÓºÃÓÑÇåµ¥ÖÐÉ¾³ý"
		END SELECT
	Else
		Response.Redirect("gamefind_error.asp?" & strLinkString & "&EN=11")
	End If

	oRs.Close
	Set oRs = Nothing
	
	oConn.Close
	Set oConn = Nothing	

	'********************************************
	'====================================================
	'Error¹ß»ý½Ã ÁöÁ¤µÈ error file·Î ÀÌµ¿ÇÑ´Ù.
	'====================================================
	if Err.Number <> 0 then
		Err.Clear 
		Response.Redirect("gamefind_error.asp?" & strLinkString & "&EN=2")
	end if	
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="gamefind.css" rel="stylesheet" type="text/css">
<Script Language="jscript">
	parent.document.all("MyFriendsList").src = "./friend_list_make.asp?<% Response.Write( strLinkString ) %>&TS=<% Response.Write(timer()) %>";
</Script>
</head>

<body background="/images/gamefind/game_bg00.gif" leftmargin="0" topmargin="0"  OnContextMenu="return false;" OnSelectStart="return false;">
   <table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/gamefind/game_tit_deletefriend.gif" width="170" height="27"></td>
        </tr>
        <tr> 
          <td align="center" background="/images/gamefind/game_table_bg01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_bg05.gif" width="170" height="10"></td>
              </tr>
            </table>
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background="/images/gamefind/game_table_bg05.gif"><img src="/images/gamefind/game_table_bg05.gif" width="3" height="2"></td>
              </tr>
            </table>
            <table width="140" height="264" border="0" cellpadding="0" cellspacing="0" bgcolor="#12377F" class="bg01">
              <tr> 
                <td align="center">
	  <table width="95%" border="0" cellspacing="0" cellpadding="3">
                    <tr> 
                      <td class="txtwhite"><% Response.Write(strResult) %></td>
                    </tr>
                  </table>
                  </iframe>
                </td>
              </tr>
            </table> 
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="3"></td>
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
                      <td align="center"><a href="gamefind_friend_list.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_ok_off.gif" width="69" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_ok_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_ok_off.gif'"></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><img src="/images/gamefind/game_table_bg04.gif" width="170" height="17"></td>
        </tr>
   </table>
</body>
</html>
