<% Option Explicit %>
<%
	Dim strUserID
	Dim strTargetID
	Dim strTargetNickName
	Dim strTempNickName
	
	Dim strLinkString
	
	strUserID = Trim(Request.QueryString("MyID"))
	strTargetID = Trim(Request.QueryString("TargetID"))
	strTargetNickName = Trim(Request.QueryString("TargetNickName"))
	
	strTempNickName = Replace( strTargetNickName, "%", "%25")
	strTempNickName = Replace( strTempNickName, "#", "%23")
	strTempNickName = Replace( strTempNickName, "<", "%3C")
	strTempNickName = Replace( strTempNickName, ">", "%3E")
	strTempNickName = Replace( strTempNickName, "&", "%26")
	
	strLinkString = "MyID=" + strUSerID + "&TargetID=" + strTargetID + "&TargetNickName=" + strTempNickName
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
          <td><img src="/images/gamefind/game_tit_addfriend.gif" width="170" height="27"></td>
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
                <td align="center"> <table width="95%" border="0" cellspacing="0" cellpadding="3">
                    <tr> 
                      <td class="txtwhite">'<% Response.Write(strTargetNickName) %>' 显示为好友?</td>
                    </tr>
                  </table></td>
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
                <td align="center">
                   <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td align="center"><a href="gamefind_addfriend_end.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_add_off.gif" width="70" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_add_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_add_off.gif'"></a></td>
                      <td><a href="gamefind_user_list.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_back_off.gif" width="69" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_back_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_back_off.gif'"></a></td>
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
