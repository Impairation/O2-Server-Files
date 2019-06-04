<% Option Explicit %>
<%
	Dim strUserID		'QueryString栏肺 罐绰 荤侩磊 酒捞叼
	Dim strLinkString		'Redirection阑 困茄 巩磊凯
	
	strUserID = Trim(Request.QueryString("MyID"))

	strLinkString = "MyID=" + strUSerID
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
          <td><img src="/images/gamefind/game_tit_userlist.gif" width="170" height="27"></td>
        </tr>
        <tr> 
          <td align="center" background="/images/gamefind/game_table_bg01.gif">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="right"><a href="gamefind_user_list.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_list_all_off.gif" width="79" height="26" border="0" onMouseOver="this.src='/images/gamefind/game_but_list_all_over.gif'" onMouseOut="this.src='/images/gamefind/game_but_list_all_off.gif'"></a></td>
                <td><img src="/images/gamefind/game_but_list_friend_on.gif" width="79" height="26"></td>
              </tr>
            </table>
            <table width="146" height="22" border="0" cellpadding="0" cellspacing="0" background="/images/gamefind/game_table_bg03_01.gif">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="5"></td>
                <td id="FriendsCnt" width="35%" valign="bottom" align="right" class="txtwhite"></td>
              </tr>
              <tr>
                <td><img src="/images/main/blank.gif" width="1" height="3"></td>
                <td height="3" class="txtwhite"><img src="/images/main/blank.gif" width="1" height="3"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="5"></td>
              </tr>
            </table>
            <table width="140" height="250" border="0" cellpadding="0" cellspacing="0" bgcolor="#12377F">
              <tr> 
                <td><iframe marginwidth="0" marginheight="0" name="IFFriendList" SCROLLING="no" src="friend_list.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>" frameborder="0" width="140" height="243"></iframe></td>
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
            </td>
        </tr>
        <tr> 
          <td><img src="/images/gamefind/game_table_bg04.gif" width="170" height="17"></td>
        </tr>
    </table>
</body>
</html>
