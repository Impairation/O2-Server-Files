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

	Dim strUserID			'QueryString으로 받는 사용자 아이디
	Dim strLinkString			'Redirection을 위한 문자열
	
	'====================================================
	'친구 리스트를 저장하는 배열
	'====================================================
	Dim aList
	
	'====================================================
	'현재 보여주는 page에 대한 정보에 사용되는 변수
	'====================================================
	Dim iTotalRecord
	Dim nCount
	
	'====================================================
	'친구의 정보를 저장하는 변수
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
	
	sConnection_string = Application("c_Connection_ConnectionString") ' 해당 DB 연결 정보 할당 Global.asa에 포함된 내용호출

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
	'pgqe 할당과 지정된 배열 변수로 data를 저장한다.
	'====================================================
	IF oRs.EOF THEN
		iTotalRecord = 0
	ELSE
		oRs.PageSize = 60 
		oRs.AbsolutePage = 1
		aList = oRs.GetRows(60 * 2)	'DB의 내용을 배열에 저장한다.
		iTotalRecord = UBound(aList,2) + 1		'게시물의 갯수를 얻어옴  
	END IF

	oRs.Close
	Set oRs = Nothing
	
	oConn.Close
	Set oConn = Nothing
	
	'********************************************
	'====================================================
	'Error발생시 지정된 error file로 이동한다.
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
'DB에서 가져온 DATA를 Display  
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
	'61.152.150.180	15010	1	초급1
	'61.152.150.181	15010	2	초급1
	'61.152.150.183	15011	3	초급2
	'61.152.150.184	15011	4	초급2
	'61.152.150.185	15012	5	중급1
	'61.152.150.187	15013	6	중급2
	'61.152.150.189	15014	7	고급

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

	'초급 1
	'0/0~0/29
	'1/0~1/9
	'초급 2
	'0/0~0/29
	'1/0~1/9
	'초급 3
	'0/0~0/19
	'중급
	'0/0~0/19
	'고급
	'0/0~0/19
	'프리미엄
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
