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
	
	Dim strLinkString
	
	Dim strMsgLinkStringA, strMsgLinkStringB
	Dim strMessageImg
	
	Dim nResult
	Dim bError
	Dim strResult
	
	Dim strNoOperation
	
	strUserID = Trim(Request.QueryString("MyID"))
	strNoOperation = Trim(Request.QueryString("OP"))
	
	strMessageImg = "game_memo_off"
	strMsgLinkStringA = ""
	strMsgLinkStringB = ""
	
	IF Len( strNoOperation ) < 1 THEN
		strLinkString = "MyID=" + strUSerID
	
		sStored_proc = "P_o2jam_Message_Check_Not_Read_2"
		
		sConnection_string = Application("c_Connection_ConnectionString") ' �ش� DB ���� ���� �Ҵ� Global.asa�� ���Ե� ��'��ȣ��
'	
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
		Set oRs = oComm.Execute()
		
		Set oComm = Nothing
	
		nResult = CInt(oRs("Result"))
		
		oRs.Close
		Set oRs = Nothing
		
		oConn.Close
		Set oConn = Nothing	
	
		IF nResult > 0 THEN
			strMessageImg = "game_memo_on"
			strMsgLinkStringA = "<a target='CFList' href='./gamefind_recmess.asp?" + strLinkString + "&TS=" + CStr(timer()) + "'>"
			strMsgLinkStringB = "</a>"
		END IF
		
		'********************************************
		'====================================================
		'Error�߻��� ������ error file�� �̵��Ѵ�.
		'====================================================
		if Err.Number <> 0 then
			strResult = "<B>[ERROR] Msg Box Error"
			Err.Clear 
			bError = true
		else
			bError = false
		end if	
	END IF	
%>
<html>
<head>
<title></title>
<link href="gamefind.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body background="/images/gamefind/game_bg00.gif" leftmargin="0" topmargin="0"  OnContextMenu="return false;" OnSelectStart="return false;">
  <table width="170" height="146" border="0" cellpadding="0" cellspacing="0" background="/images/gamefind/game_bg01.gif">
<% IF bError THEN %>
  <tr> 
    <td height="35" align="center" class="txtwhite" valign="bottom"><% Response.Write(strResult)%></td>
  </tr>
<% ELSE %>
  <tr> 
    <td height="35" align="center" class="txtwhite" valign="bottom"><% Response.Write(strMsgLinkStringA) %><img border="0" src="/images/gamefind/<% Response.Write(strMessageImg) %>.gif" width="156" height="31"><% Response.Write(strMsgLinkStringB) %></td>
  </tr>
<% END IF %>  
  <tr> 
   <td align="center" valign="top"><iframe frameborder=0 width="156" height="102" src="/gamefind/gamefind_message_banner_iframe.asp"></iframe></td>
  </tr>
 </table>
</body>
</html>
