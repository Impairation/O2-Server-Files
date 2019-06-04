<% Option Explicit %>
<%
	Dim strUserID
	Dim nErrorNo
	
	Dim strErrorMsg
	
	strUserID = Trim(Request.QueryString("MyID"))
	nErrorNo = CInt(Request.QueryString("EN"))
	
	IF nErrorNO = 7 THEN
	%>
		<Script Language="jscript">
			parent.location="gamefind_error.asp?MyID=<% Response.Write(strUserID) %>&En=6";
		</Script>
	<%
	END IF
	
	SELECT CASE nErrorNo
		CASE 1:
			strErrorMsg = "<B>[ERROR]</B>添加好友时出错"
		CASE 2:
			strErrorMsg = "<B>[ERROR]</B>修改好友清单时出错"
		CASE 3:
			strErrorMsg = "<B>[ERROR]</B>打开接受到的留言时出错"
		CASE 4:
			strErrorMsg = "<B>[ERROR]</B>发送留言时出错"
		CASE 5:
			strErrorMsg = "<B>[ERROR]</B>打开联系清单时出错"
		CASE 6:
			strErrorMsg = "<B>[ERROR]</B>打开好友清单时出错"
		CASE 7:
			strErrorMsg = "<B>[ERROR]</B>修改好友清单时出错"
		CASE 8:
			strErrorMsg = "<B>[ERROR]</B>悄悄话模式时出错"
		CASE 11:
			strErrorMsg = "<B>[ERROR]</B>密码错误"
	END SELECT
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
          <td><img src="/images/gamefind/game_tit_error.gif" width="170" height="27"></td>
        </tr>
        <tr> 
          <td align="center" background="/images/gamefind/game_table_bg01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_bg05.gif" width="170" height="10"></td>
              </tr>
            </table>
            <table width="140" height="266" border="0" cellpadding="0" cellspacing="0" bgcolor="#12377F">
              <tr> 
                <td align="center" valign="bottom"> <table width="132" height="199" border="0" cellpadding="3" cellspacing="0" background="/images/gamefind/game_bg08.gif">
                    <tr> 
                      <td align="center" valign="top" class="txtwhite"><table width="95%" border="0" cellspacing="0" cellpadding="3">
                          <tr> 
                            <td height="10" align="center" class="txtwhite"><p>&nbsp;</p></td>
                          </tr>
                          <tr> 
                            <td class="txtwhite"><% Response.Write(strErrorMsg) %></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <br>
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
                      <td align="center"><a href="gamefind_user_list.asp?MyID=<% Response.Write(strUserID) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_ok_off.gif" width="69" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_ok_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_ok_off.gif'"></a></td>
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
