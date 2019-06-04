<% Option Explicit %>
<%
	Dim strUserID
	Dim strTargetID
	Dim strTargetNickName
	Dim strLinkString
	
	strUserID = Trim(Request.QueryString("MyID"))
	strTargetID = Trim(Request.QueryString("TargetID"))
	strTargetNickName = Trim(Request.QueryString("TargetNickName"))

	strLinkString = "MyID=" + strUSerID
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="gamefind.css" rel="stylesheet" type="text/css">
<Script Language="JavaScript">
<!--#include file="SendMsg_check.js"-->
</Script> 
</head>

<body OnLoad="O2MsgWrite.MsgTitle.focus();" background="/images/gamefind/game_bg00.gif" leftmargin="0" topmargin="0"  OnContextMenu="return false;" OnSelectStart="return false;">
<div id="LYErrMsgBox" style="position:absolute; left:15px; top:100px; width:70px; height:72px; z-index:1; visibility: hidden;" align="center"> 
  
  
  <table width="136" border="0" cellspacing="0" cellpadding="0">
    
    <tr height="1">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#595859"></td>
      <td width="130" bgcolor="#595859"></td>
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="1">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#EFE3EF"></td>
      <td width="1" bgcolor="#EFE3EF"></td>
      <td width="130" bgcolor="#EFE3EF"></td>
      <td width="1" bgcolor="#EFE3EF"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="1">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#EFE3EF"></td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td width="130" bgcolor="#8CC7FF"></td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="15">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#EFE3EF"></td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td width="130" bgcolor="#3975D6"  align="center" valign="baseline" class="txtwhite">O2Jam Error!!</td>
      <td width="1" bgcolor="#8CC7F"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="5">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#EFE3EF"></td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td width="130" bgcolor="#8CC7FF"></td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="30">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#EFE3EF"></td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td id="ErrMsg" class="txtBlack" width="130" bgcolor="#8CC7FF" align="center" valign="middle"></td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="30">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#EFE3EF"></td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td width="130" bgcolor="#8CC7FF" align="center" valign="middle">
        <input type="button" id="ErrBtn"  class="errbtn" width="80" height="10" OnClick="ErrMsgBox( 'LYErrMsgBox', 1 );" value=" 犬牢 "></td>
      </td>
      <td width="1" bgcolor="#8CC7FF"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>

    <tr height="1">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="130" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="1">
      <td width="1" bgcolor="#595859"></td>
      <td width="1" bgcolor="#000000"></td>
      <td width="1" bgcolor="#000000"></td>
      <td width="130" bgcolor="#000000"></td>
      <td width="1" bgcolor="#000000"></td>
      <td width="1" bgcolor="#000000"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
  </table> 
  
    <!--<table width="136" border="0" cellspacing="0" cellpadding="0">
    
    <tr height="1">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="130" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="1">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#E7E3D6"></td>
      <td width="1" bgcolor="#E7E3D6"></td>
      <td width="130" bgcolor="#E7E3D6"></td>
      <td width="1" bgcolor="#E7E3D6"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="1">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#E7E3D6"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="130" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="15">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#E7E3D6"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="130" bgcolor="#840400"  align="center" valign="baseline" class="txtwhite">O2Jam Error!!</td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="5">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#E7E3D6"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="130" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="30">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#E7E3D6"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td id="ErrMsg" class="txtBlack" width="130" bgcolor="#C6BEA5" align="center" valign="middle"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="30">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#E7E3D6"></td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="130" bgcolor="#C6BEA5" align="center" valign="middle">
        <input type="button" id="ErrBtn"  class="errbtn" width="80" height="10" OnClick="ErrMsgBox( 'LYErrMsgBox', 1 );" value=" 犬牢 "></td>
      </td>
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>

    <tr height="1">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="130" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#8C8A63"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
    <tr height="1">
      <td width="1" bgcolor="#C6BEA5"></td>
      <td width="1" bgcolor="#000000"></td>
      <td width="1" bgcolor="#000000"></td>
      <td width="130" bgcolor="#000000"></td>
      <td width="1" bgcolor="#000000"></td>
      <td width="1" bgcolor="#000000"></td>
      <td width="1" bgcolor="#000000"></td>
    </tr>
    
  </table> -->
 
</div>
   <table width="170" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/gamefind/game_tit_sendmessage.gif" width="170" height="27"></td>
        </tr>
        <tr> 
          <Form name="O2MsgWrite" action="gamefind_sendmess_end.asp" method="POST" OnSubmit="return sendForm(this)">
            <input type="hidden" name="MyID" value="<% Response.Write(strUserID) %>">
            <input type="hidden" name="TargetID" value="<% Response.Write(strTargetID) %>">
          <td align="center" background="/images/gamefind/game_table_bg01.gif">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_bg04.gif" width="170" height="18"></td>
              </tr>
            </table>
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background="/images/gamefind/game_table_bg05.gif"><img src="/images/gamefind/game_table_bg05.gif" width="3" height="2"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><input readonly name="TargetNickName"  class="input01" type="text" size="22" class="input01" value="<% Response.Write(strTargetNickName) %>"></td>
              </tr>
            </table>
            <table width="85%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td background="/images/gamefind/game_table_bg05.gif"><img src="/images/gamefind/game_table_bg05.gif" width="3" height="2"></td>
              </tr>
            </table>
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="3"></td>
              </tr>
            </table>
            <table width="86%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_word01.gif" width="37" height="11"> 
                </td>
              </tr>
            </table>
            <textarea name="MsgTitle" cols="23" rows="2" class="input01"  style="OVERFLOW: hidden;BACKGROUND-COLOR: #12377F; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; colorvc_resdate: #000000"></textarea>
            <table width="86%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/gamefind/game_word02.gif" width="91" height="11"> 
                </td>
<!--                <td width="50" id="NowCharCount" align="right" valign="center" class="txtwhite">0/200&nbsp;&nbsp;</td> -->
                <td width="50" id="NowCharCount" align="right" valign="center" class="txtwhite"></td>
              </tr>
            </table> 
            <textarea name="MsgContent" class="txtwhite" cols="23" rows="12" class="input01" style="OVERFLOW: hidden;BACKGROUND-COLOR: #12377F; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; colorvc_resdate: #000000"></textarea>
            <table width="90%" border="0" cellspacing="0" cellpadding="3">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="5"></td>
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
                      <td align="center"><input type="image" src="/images/gamefind/game_but_send_off.gif" width="69" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_send_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_send_off.gif'"></td>
                      <td><a href="gamefind_user_list.asp?<% Response.Write(strLinkString) %>&TS=<% Response.Write(timer()) %>"><img src="/images/gamefind/game_but_cancel_off.gif" width="69" height="25" border="0"  onMouseOver="this.src='/images/gamefind/game_but_cancel_on.gif'" onMouseOut="this.src='/images/gamefind/game_but_cancel_off.gif'"></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            </td>
            </FORM>
        </tr>
        <tr> 
          <td><img src="/images/gamefind/game_table_bg04.gif" width="170" height="17"></td>
        </tr>
   </table>
</body>
</html>
