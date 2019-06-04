<% Option Explicit %>
<%
	Response.expires = 0
	Response.AddHeader "pragma" , "no-cache"

	Dim strUserID
	Dim strLinkString
	
	strUserID = Trim(Request.QueryString("MyID"))

	strLinkString = "MyID=" & strUserID 
%>
<script language="jscript">

 	var CTuser_id = new Array(150);
	var CTuser_nickname = new Array(150);
	var CTuser_level = new Array(150);
	var CTuser_count = 0;
	
	var FDuser_id = new Array(60);
	var FDuser_nickname = new Array(60);
	var FDuser_level = new Array(60);
	var FDuser_IsLogIn = new Array(60);
	var FDuser_MCH = new Array(60);
	var FDuser_SCH = new Array(60);
	var FDuser_count = 0;
	
function ReloadConnUserList()
{
	userNfriendList.userList.ReloadUserList();
}
</script>
<script id="EventBridge" Language="jscript">
</script>
<script id="GlobalBlock" Language="JavaScript">
</script>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body background="/images/gamefind/game_bg00.gif" leftmargin="0" topmargin="0" SCROLL="no">
<input type="hidden" id="SelectedUserID" value="">
<input type="hidden" id="SelectedUserNickName" value="">
<table width="171" height="512" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="171" height="146" valign="top">
      <iframe name="MyFriendsList" src="friend_list_make.asp?<% Response.Write( strLinkString ) %>&TS=<% Response.Write(timer()) %>" frameborder="0" scrolling="no" width="0" height="0"></iframe>
      <iframe name="MyMsgBox" src="gamefind_message.asp?<% Response.Write( strLinkString ) %>&TS=<% Response.Write(timer()) %>" frameborder="0" scrolling="no" width="170" height="146"></iframe>
    </td>
  </tr>
  <tr> 
    <td height="4"><img src="/images/gamefind/game_bg02.gif" width="170" height="4"></td>
  </tr>
  <tr> 
    <td  valign="top"><iframe SCROLLING="no" name="CFList" src="gamefind_user_list.asp?<% Response.Write( strLinkString ) %>&TS=<% Response.Write(timer()) %>" frameborder="0" scrolling="no"  height="352" id="userNfriendList"></iframe>
    </td>
  </tr>
</table>

</body>
</html>
