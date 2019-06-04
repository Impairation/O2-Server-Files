<!--METADATA TYPE="typelib"  NAME="ADODB Type Library UUID= "00000205-0000-0010-8000-00AA006D2EA4" -->
<% Option Explicit %>
<%
	'====================================================
	'DB�� �����ϱ� ���Ͽ� �ʿ��� ����
	'====================================================
 	Dim oConn    			'connection object
 	Dim oComm    			'command object
 	Dim oRs      			'recordset object
	Dim sConnection_string		'connection string
 	Dim sStored_proc     		'sql ���ڿ� ����

	Dim strUserID
	Dim strTargetID
	
	Dim strTitle
	Dim strContent
	
	Dim strLinkString
	
	Dim strResult
	Dim nRetVal
	
	strUserID = Trim(Request.Form("MyID"))
	strTargetID = Trim(Request.Form("TargetID"))
	
	strTitle = Trim(Request.Form("MsgTitle"))
	strContent = Trim(Request.Form("MsgContent"))

	strLinkString = "MyID=" + strUSerID
	
	sStored_proc = "P_o2jam_Message_Simple_Insert"
	
	sConnection_string = Application("c_Connection_ConnectionString") ' �ش� DB ���� ���� �Ҵ� Global.asa�� ���Ե� ����ȣ��
	
	'*************************** error check block
	On Error Resume Next	
	
	Set oConn = Server.CreateObject("ADODB.Connection")
	Set oComm = Server.CreateObject("ADODB.Command")

	oConn.CursorLocation = adUseClient
   	oConn.Open sConnection_string

	oComm.ActiveConnection = oConn
	oComm.CommandType = adCmdStoredProc
	oComm.CommandText = sStored_proc
	oComm.Parameters.Append oComm.CreateParameter("@SenderID", adVarChar, adParamInput, LenB(strUserID), strUserID)
	oComm.Parameters.Append oComm.CreateParameter("@ReceiverID", adVarChar, adParamInput, LenB(strTargetID), strTargetID)
	oComm.Parameters.Append oComm.CreateParameter("@Title", adVarChar, adParamInput, LenB(strTitle), strTitle)
	oComm.Parameters.Append oComm.CreateParameter("@Content", adVarChar, adParamInput, LenB(strContent), strContent)
	Set oRs = oComm.Execute
	
	Set oComm = Nothing

	nRetVal = CInt(oRs("Result"))
	
	SELECT CASE nRetVal  
		CASE -1, -2 
			strResult = "<B>[ERROR]</B><br>���ʺŲ�����"
		CASE 0
			strResult = "��Ϣ�ѷ���."
	END SELECT
	
	oRs.Close
	Set oRs = Nothing
	
	oConn.Close
	Set oConn = Nothing	

	'********************************************
	'====================================================
	'Error�߻��� ������ error file�� �̵��Ѵ�.
	'====================================================
	if Err.Number <> 0 then
		Err.Clear 
		Response.Redirect("gamefind_error.asp?" & strLinkString & "&EN=4")
	end if	
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="gamefind.css" rel="stylesheet" type="text/css">
</head>

<body background="/images/gamefind/game_bg00.gif" leftmargin="0" topmargin="0"  OnContextMenu="return false;" OnSelectStart="return false;">
   <table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/gamefind/game_tit_sendmessage.gif" width="170" height="27"></td>
        </tr>
        <tr> 
          <td align="center" background="/images/gamefind/game_table_bg01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_bg05.gif" width="170" height="10"></td>
              </tr>
            </table>
            <table width="140" height="266" border="0" cellpadding="0" cellspacing="0" bgcolor="#12377F" class="bg01">
              <tr> 
                <td align="center"> <table width="90%" border="0" cellspacing="0" cellpadding="3">
                    <tr> 
                      <td class="txtwhite"><div align="center"><% Response.Write(strResult) %></div></td>
                    </tr>
                  </table>
                  
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
                      <td align="center"><a href="gamefind_user_list.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_ok_off.gif" width="69" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_ok_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_ok_off.gif'"></a></td>
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
