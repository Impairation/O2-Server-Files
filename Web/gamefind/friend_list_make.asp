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

	Dim strUserID			'QueryString���� �޴� ����� ���̵�
	Dim strLinkString			'Redirection�� ���� ���ڿ�
	
	'====================================================
	'ģ�� ����Ʈ�� �����ϴ� �迭
	'====================================================
	Dim aList
	
	'====================================================
	'���� �����ִ� page�� ���� ������ ���Ǵ� ����
	'====================================================
	Dim iTotalRecord
	Dim nCount
	
	'====================================================
	'ģ���� ������ �����ϴ� ����
	'====================================================
	Dim strFriendID, strFriendNickName
	Dim nFriendLevel
	Dim nIsLogIn
	Dim nMainCH
	Dim nSubCH
	Dim nPlanetNum
	Dim nChannelNum
	Dim strGateWAddr
	Dim nGateWPort
	
	strUserID = Trim(Request.QueryString("MyID"))

	strLinkString = "MyID=" + strUSerID
	
	sStored_proc = "P_o2jam_friend_list"
	
	sConnection_string = Application("c_Connection_ConnectionString") ' �ش� DB ���� ���� �Ҵ� Global.asa�� ���Ե� ����ȣ��

	'*************************** error check block
	'On Error Resume Next	
	
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
	
	'====================================================
	'pgqe �Ҵ�� ������ �迭 ������ data�� �����Ѵ�.
	'====================================================
	IF oRs.EOF THEN
		iTotalRecord = 0
	ELSE
		oRs.PageSize = 60 
		oRs.AbsolutePage = 1
		aList = oRs.GetRows(60 * 2)	'DB�� ������ �迭�� �����Ѵ�.
		iTotalRecord = UBound(aList,2) + 1		'�Խù��� ������ ����  
	END IF

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
		Response.Redirect("gamefind_error.asp?" & strLinkString & "&EN=10")
	end if	
	
	 'OnLoad="MakeFriendList();" OnContextMenu="return false;" OnSelectStart="return false;"
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<Script Language="JavaScript">
<!--#include file="friendListMake.js"-->
</Script>
</head>
<body  OnLoad="MakeFriendList();"  height="0" topmargin="0" leftmargin="0" >
<input type="hidden" name="MyID" value="<% Response.Write(strUserID) %>">
<% 	  
'====================================================  
'DB���� ������ DATA�� Display  
'====================================================  
	nCount = 0  
	
	DO WHILE nCount < iTotalRecord
		nIsLogIn = CInt(aList(3,nCount))  
	  	
		IF nIsLogIn = -1 THEN
			EXIT DO
		ELSE	
			strFriendID = Trim(aList(0,nCount))
			strFriendNickName = Trim(aList(1,nCount))  
			nFriendLevel = CInt(aList(2,nCount))  
			
			IF IsNull( aList(4,nCount) ) THEN
				nMainCH = 0
			ELSE
				nMainCH = CInt(aList(4,nCount))
			END IF
			
			IF IsNull( aList(5,nCount) ) THEN
				nSubCH = 0
			ELSE
				nSubCH = CInt(aList(5,nCount))
			END IF
			
			IF IsNull( aList(6,nCount) ) THEN
				strGateWAddr = ""
				nGateWPort = 0
			ELSE
				strGateWAddr = Trim(aList(6,nCount))
				nGateWPort = CInt(aList(7,nCount))
			END IF
			
		  	IF nMainCH < 0 THEN
		  		nPlanetNum = 0
		  		nChannelNum = 0
		  	ELSE
		  		nPlanetNum = GetPlanet( strGateWAddr, nGateWPort )
		  		nChannelNum = GetChannel( nMainCH, nSubCH )
		  	END IF
%>
<input type="hidden" name="FRuserID<% Response.Write(nCount) %>" value="<% Response.WRite(strFriendID) %>">
<input type="hidden" name="FRuserNickName<% Response.Write(nCount) %>" value="<% Response.WRite(strFriendNickName) %>">
<input type="hidden" name="FRuserLevel<% Response.Write(nCount) %>" value="<% Response.WRite(nFriendLevel) %>">
<input type="hidden" name="FRuserIsLogIn<% Response.Write(nCount) %>" value="<% Response.WRite(nIsLogIn) %>">
<input type="hidden" name="FRuserMCH<% Response.Write(nCount) %>" value="<% Response.WRite(nPlanetNum) %>">
<input type="hidden" name="FRuserSCH<% Response.Write(nCount) %>" value="<% Response.WRite(nChannelNum) %>">
<% 	
		END IF
		
		nCount = nCount + 1        
	LOOP %>  
<input type="hidden" name="FRTotalCount" value="<% Response.Write(nCount) %>">
</body>
</html>
<%
	'61.152.150.180	15010	1	�ʱ�1
	'61.152.150.181	15010	2	�ʱ�1
	'61.152.150.183	15011	3	�ʱ�2
	'61.152.150.184	15011	4	�ʱ�2
	'61.152.150.185	15012	5	�߱�1
	'61.152.150.187	15013	6	�߱�2
	'61.152.150.189	15014	7	���

	Function GetPlanet( strGateAddr, nGatePort )
		Dim nRealPlanet
		
		SELECT CASE strGateAddr 
			CASE "10.10.11.180"
				nRealPlanet = 1
			CASE "10.10.11.181"
				nRealPlanet = 1
			CASE "10.10.11.183"
				nRealPlanet = 2
			CASE "10.10.11.184"
				nRealPlanet = 2
			CASE "10.10.11.185"
				nRealPlanet = 3
			CASE "10.10.11.187"
				nRealPlanet = 4			
			CASE "10.10.11.189"
				nRealPlanet = 5
			CASE ELSE
				nRealPlanet = 0
		END SELECT
		
		GetPlanet = nRealPlanet
	End Function

	'�ʱ� 1
	'0/0~0/29
	'1/0~1/9
	'�ʱ� 2
	'0/0~0/29
	'1/0~1/9
	'�ʱ� 3
	'0/0~0/19
	'�߱�
	'0/0~0/19
	'���
	'0/0~0/19
	'�����̾�
	'0/0~0/19
	Function GetChannel( nMainChannel, nSubChannel )
		Dim nRealChannel
		
		SELECT CASE nMainChannel 
			CASE -1
				nRealChannel = 0
			CASE 0
				nRealChannel = nSubChannel + 1
			CASE 1
				nRealChannel = nSubChannel + 31
			CASE ELSE
				nRealChannel = 0
		END SELECT
		
		GetChannel = nRealChannel
	End Function
%>
