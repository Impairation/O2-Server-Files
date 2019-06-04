<% Option Explicit %>
<%
	Dim strUserID
	 
	strUserID = Trim(Request.QueryString("MyID"))
%> 
<html>
<head>
<title></title>
<style type="text/css">
<!--
body{
scrollbar-face-color: #74ACFA; scrollbar-shadow-color: #62A1FC; 
scrollbar-highlight-color: #94C5E2; scrollbar-3dlight-color:#9AC3FB; 
scrollbar-darkshadow-color:#1D62BE; scrollbar-track-color: #4288E4; 
scrollbar-arrow-color:#1355B0;} 
--> 
</style>
<link href="gameboard.css" rel="stylesheet" type="text/css">
<link href="gamefind.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
function ReloadUserList()
{
	while( oUserListTable.rows.length != 0 ) 
	{
		oUserListTable.deleteRow(0) ;
	}
	
	LoadUserList();
}
//-->
</script>
<SCRIPT language=JavaScript>
<!--#include file="new_toolbar.js"-->

</SCRIPT>
<Script Language="JavaScript">
<!--#include file="userList.js"-->
</Script>
</head>
<!-- <body OnLoad="LoadUserList();" bgcolor="#12377F" topmargin="0" leftmargin="0" OnContextMenu="return false;" OnSelectStart="return false;"> -->
<body bgcolor="#12377F" topmargin="0" leftmargin="0" OnContextMenu="return false;" OnSelectStart="return false;">
<input type="hidden" name="MyID" value="<% Response.Write(strUserID) %>">
<input type="hidden" name="NowPageNo" value="1">
<input type="hidden" name="SelectedUserID" value="">
<input type="hidden" name="SelectedUserNickName" value="">
<div id="NFCTX" style="position:absolute; left:29px; top:26px; width:85px; height:72px; z-index:1; visibility: hidden;"  OnMouseOver="Show_Context_ForLayer('NFCTX', 0);" OnMouseOut="Show_Context_ForLayer('NFCTX', 1);"> 
  <table width="85" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="2"><img src="/images/gamefind/game_box_bg01.gif" width="85" height="2"></td>
    </tr>
    <tr> 
      <td align="center" background="/images/gamefind/game_box_bg02.gif">
        <table width="95%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td class="txtBlue" onclick="SetWhisper();Show_Context_ForLayer('NFCTX', 1);" onmouseover="mouseOnTR(this, true);" onmouseout="mouseOnTR(this, false);">·¢ËÍÇÄÇÄ»°</td>
          </tr>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="/images/gamefind/game_bg06.gif"><img src="/images/gamefind/game_bg06.gif" width="3" height="2"></td>
          </tr>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="3">
          <tr> 
            <td class="txtBlue" OnClick="return Send_Message('MyID', 'SelectedUserID', 'SelectedUserNickName');" onmouseover="mouseOnTR(this, true);" onmouseout="mouseOnTR(this, false);">·¢ËÍÁôÑÔ</td>
          </tr>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="/images/gamefind/game_bg06.gif"><img src="/images/gamefind/game_bg06.gif" width="3" height="2"></td>
          </tr>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="3">
          <tr> 
            <td class="txtBlue" OnClick="return Add_Friend('MyID', 'SelectedUserID', 'SelectedUserNickName');" onmouseover="mouseOnTR(this, true);" onmouseout="mouseOnTR(this, false);">Ìí¼ÓÎªºÃÓÑ</td>
          </tr>
        </table>
        </td>
    </tr>
    <tr> 
      <td height="2"><img src="/images/gamefind/game_box_bg03.gif" width="85" height="2"></td>
    </tr>
  </table> 
</div>
<div id="FCTX" style="position:absolute; left:29px; top:26px; width:85px; height:72px; z-index:1; visibility: hidden;"  OnMouseOver="Show_Context_ForLayer('FCTX', 0);" OnMouseOut="Show_Context_ForLayer('FCTX', 1);"> 
  <table width="85" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="2"><img src="/images/gamefind/game_box_bg01.gif" width="85" height="2"></td>
    </tr>
    <tr> 
      <td align="center" background="/images/gamefind/game_box_bg02.gif"><table width="95%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td class="txtBlue"  onclick="SetWhisper();Show_Context_ForLayer('NFCTX', 1);" onmouseover="mouseOnTR(this, true);" onmouseout="mouseOnTR(this, false);"><a href="#">·¢ËÍÇÄÇÄ»°</a></td>
          </tr>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td background="/images/gamefind/game_bg06.gif"><img src="/images/gamefind/game_bg06.gif" width="3" height="2"></td>
          </tr>
        </table>
        <table width="95%" border="0" cellspacing="0" cellpadding="3">
          <tr> 
            <td class="txtBlue" OnClick="return Send_Message('MyID', 'SelectedUserID', 'SelectedUserNickName');" onmouseover="mouseOnTR(this, true);" onmouseout="mouseOnTR(this, false);">·¢ËÍÁôÑÔ</td>
          </tr>
        </table>
        </td>
    </tr>
    <tr> 
      <td height="2"><img src="/images/gamefind/game_box_bg03.gif" width="85" height="2"></td>
    </tr>
  </table> 
</div>
<table height="10" width="100%" border="0" bordercolor="#6495ed" cellpadding="0" cellspacing="0">
<table width="180" border="0" cellpadding="0" cellspacing="0" height="225">
 <tr>
  <td valign="top">
  <table id="oUserListTable" width="180" border="0" cellpadding="0" cellspacing="0">
  </table>
  </td>
 </tr>
</table>
<table id="oUserListIndex" width="100%" bordercolor="#6495ed"  border="1" cellpadding="0" cellspacing="0" height="10">
</table>
</body>
</html>