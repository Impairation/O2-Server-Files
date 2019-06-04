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

		<script language="javascript" src="/Lib/common2.js"></script>
		<script language="javascript">
			function fnSendSubmit(form)
			{
				objInput = form.UserPwd;
				if(fnTrim(objInput.value) == "")
				{
					location.href = "gamefind_error.asp?MyID=<%=strUserID%>&EN=11"
				}
				else
				{
					form.submit();
				}
			}
		</script>
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
                <td align="center" valign="top"> 
					<table width="95%" border="0" cellspacing="0" cellpadding="3">		
						<tr>
							<td height="15">&nbsp;</td>
						</tr>				
						<tr> 
						   <td class="txtwhite">'<% Response.Write(strTargetNickName) %>' 从好友清单中删除?</td>
						</tr>	
						<tr>
							<td height="15">&nbsp;</td>
						</tr>								
						<tr>
							<td align="center" valign="top" class="txtwhite">&nbsp;请输入密码:</td>
						</tr>
						<tr>
							<form name="frmPwd" action="gamefind_delete_friend_end.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>" method="post" onSubmit="return fnSendSubmit(frmPwd)")>
							<td align="center" valign="top" class="txtwhite">
								<input type="password" name="UserPwd" size="15"  style="color:#FFFFFF;border:0px;BACKGROUND-COLOR: #2E63A4">
							</td>
							</form>
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
                      <td align="center"><img src="/images/gamefind/game_but_delete_off.gif" width="70" height="25" border="0"   onClick="fnSendSubmit(frmPwd)" style="cursor:hand" onMouseOver="this.src='/images/gamefind/game_but_delete_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_delete_off.gif'"></td>
                      <td><a href="gamefind_friend_list.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_back_off.gif" width="69" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_back_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_back_off.gif'"></a></td>
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
