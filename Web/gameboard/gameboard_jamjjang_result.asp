<%  User_NickName= Request.Form("User_NickName")
	User_NickName= Replace(User_NickName,"'","ⅴ")
%>
<script language="javascript" src="/Lib/common2.js"></script>
<script language="JavaScript">
<!--
	function goAuto() {
	var vSearchStr=document.form1.User_NickName.value ;
	var objInput = document.form1.User_NickName;
		if(	vSearchStr=='' ||
			vSearchStr==document.form1.User_NickName.defaultValue ||
			vSearchStr.indexOf(' ')!=-1 ||
			vSearchStr=='about' ||
			vSearchStr=='1' ||
			vSearchStr=='after' ||
			vSearchStr=='2' ||
			vSearchStr=='all' ||
			vSearchStr=='also' ||
			vSearchStr=='3' ||
			vSearchStr=='an' ||
			vSearchStr=='4' ||
			vSearchStr=='and' ||
			vSearchStr=='5' ||
			vSearchStr=='another' ||
			vSearchStr=='6' ||
			vSearchStr=='any' ||
			vSearchStr=='7' ||
			vSearchStr=='are' ||
			vSearchStr=='8' ||
			vSearchStr=='as' ||
			vSearchStr=='9' ||
			vSearchStr=='at' ||
			vSearchStr=='0' ||
			vSearchStr=='be' ||
			vSearchStr=='$' ||
			vSearchStr=='because' ||
			vSearchStr=='been' ||
			vSearchStr=='before' ||
			vSearchStr=='being' ||
			vSearchStr=='between' ||
			vSearchStr=='both' ||
			vSearchStr=='but' ||
			vSearchStr=='by'||
			vSearchStr=='came' ||
			vSearchStr=='can' ||
			vSearchStr=='come' ||
			vSearchStr=='could' ||
			vSearchStr=='did' ||
			vSearchStr=='do' ||
			vSearchStr=='each' ||
			vSearchStr=='for' ||
			vSearchStr=='from' ||
			vSearchStr=='get' ||
			vSearchStr=='got' ||
			vSearchStr=='has' ||
			vSearchStr=='had' ||
			vSearchStr=='he' ||
			vSearchStr=='have' ||
			vSearchStr=='her' ||
			vSearchStr=='here' ||
			vSearchStr=='him' ||
			vSearchStr=='himself' ||
			vSearchStr=='his' ||
			vSearchStr=='how' ||
			vSearchStr=='if' ||
			vSearchStr=='in' ||
			vSearchStr=='into' ||
			vSearchStr=='is' ||
			vSearchStr=='it' ||
			vSearchStr=='like' ||
			vSearchStr=='make' ||
			vSearchStr=='many' ||
			vSearchStr=='me' ||
			vSearchStr=='might' ||
			vSearchStr=='more' ||
			vSearchStr=='most' ||
			vSearchStr=='much' ||
			vSearchStr=='must' ||
			vSearchStr=='my' ||
			vSearchStr=='never' ||
			vSearchStr=='now' ||
			vSearchStr=='of' ||
			vSearchStr=='on' ||
			vSearchStr=='only' ||
			vSearchStr=='or' ||
			vSearchStr=='other' ||
			vSearchStr=='our' ||
			vSearchStr=='out' ||
			vSearchStr=='over' ||
			vSearchStr=='said' ||
			vSearchStr=='same' ||
			vSearchStr=='see' ||
			vSearchStr=='should' ||
			vSearchStr=='since' ||
			vSearchStr=='some' ||
			vSearchStr=='still' ||
			vSearchStr=='such' ||
			vSearchStr=='take' ||
			vSearchStr=='than' ||
			vSearchStr=='that' ||
			vSearchStr=='the' ||
			vSearchStr=='their' ||
			vSearchStr=='them' ||
			vSearchStr=='then' ||
			vSearchStr=='there' ||
			vSearchStr=='these' ||
			vSearchStr=='they' ||
			vSearchStr=='this' ||
			vSearchStr=='those' ||
			vSearchStr=='through' ||
			vSearchStr=='to' ||
			vSearchStr=='too' ||
			vSearchStr=='under' ||
			vSearchStr=='up' ||
			vSearchStr=='very' ||
			vSearchStr=='was' ||
			vSearchStr=='way' ||
			vSearchStr=='we' ||
			vSearchStr=='well' ||
			vSearchStr=='were' ||
			vSearchStr=='what' ||
			vSearchStr=='where' ||
			vSearchStr=='which' ||
			vSearchStr=='while' ||
			vSearchStr=='who' ||
			vSearchStr=='with' ||
			vSearchStr=='would' ||
			vSearchStr=='you' ||
			vSearchStr=='your' ||
			vSearchStr=='a' ||
			vSearchStr=='b' || 
			vSearchStr=='c' || 
			vSearchStr=='d' || 
			vSearchStr=='e' || 
			vSearchStr=='f' || 
			vSearchStr=='g' || 
			vSearchStr=='h' || 
			vSearchStr=='i' || 
			vSearchStr=='j' || 
			vSearchStr=='k' || 
			vSearchStr=='l' || 
			vSearchStr=='m' || 
			vSearchStr=='n' || 
			vSearchStr=='o' || 
			vSearchStr=='p' || 
			vSearchStr=='q' || 
			vSearchStr=='r' || 
			vSearchStr=='s' || 
			vSearchStr=='t' || 
			vSearchStr=='u' || 
			vSearchStr=='v' || 
			vSearchStr=='w' || 
			vSearchStr=='x' || 
			vSearchStr=='y' || 
			vSearchStr=='z'			
			) 
		{
			alert('您输入的词无法搜索，请输入其他词.');
			objInput.focus();
			return;
		} 
		else if (fnTrim(objInput.value).length < 2)
		{
		
			alert ("请输入2字以上搜索词");
			objInput.value = "";
			objInput.focus();
			return;
		}
		else 
		{
			document.form1.action="gameboard_jamjjang_result.asp";
			document.form1.submit();
		}
	}
//-->

</script>

<%
	Set Conn = Server.CreateObject ("ADODB.Connection")
	Conn.Open (Application("Connection_ConnectionString"))

	SQL = "PROC_RANKING_UPDATE_DATE" 
	Set RS	= Conn.Execute(SQL)

	If RS.BOF or RS.EOF Then

	Else
		WriteDate = RS("WriteDate")
	End If

	RS.Close
	Set RS = Nothing
	
	Conn.Close
	Set Conn = Nothing
	
	pagesize=10
	GotoPage = Request.QueryString("GotoPage")

	If GotoPage = "" Then
 		GotoPage = 1
	End If
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>::排名::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body{
scrollbar-face-color: #8BD7EF; scrollbar-shadow-color: #52ACD3; 
scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#A6E1F1; 
scrollbar-darkshadow-color:#287395; scrollbar-track-color: #3DAAD4; 
scrollbar-arrow-color:#1D6786;} 
--> 
</style>
<link href="gameboard.css" rel="stylesheet" type="text/css">
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" bgcolor="#008EAD" topmargin="0" leftmargin="0">
<table width="745" height="450" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="6" align="center"><img src="/images/main/blank.gif" width="1" height="6"></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="98%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top"><table width="583" height="54" border="0" cellpadding="0" cellspacing="0" background="/images/gameboard/jamjjang/jjang_top.gif">
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="right"><table width="180" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="txtWhite">Updated at <%if IsDate(WriteDate) then %><%=DateValue(WriteDate)%><%else%><%end if%></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><img src="/images/main/blank.gif" width="1" height="8"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="8"><img src="/images/gameboard/jamjjang/jjang_topbg01_01.gif" width="8" height="29"></td>
                <td align="center" background="/images/gameboard/jamjjang/jjang_topbg01_02.gif">
<table width="97%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="13%" align="center"><img src="/images/gameboard/jamjjang/jjang_word01.gif"></td>
                      <td width="1%"><img src="/images/gameboard/jamjjang/jjang_gab.gif" width="2" height="20"></td>
                      <td align="center"><img src="/images/gameboard/jamjjang/jjang_word02.gif"></td>
                      <td width="1%"><img src="/images/gameboard/jamjjang/jjang_gab.gif" width="2" height="20"></td>
                      <td width="6%" align="center"><img src="/images/gameboard/jamjjang/jjang_word03.gif"></td>
                      <td width="1%"><img src="/images/gameboard/jamjjang/jjang_gab.gif" width="2" height="20"></td>
                      <td width="10%" align="center"><img src="/images/gameboard/jamjjang/jjang_word04.gif"></td>
                      <td width="1%"><img src="/images/gameboard/jamjjang/jjang_gab.gif" width="2" height="20"></td>
                      <td width="9%" align="center"><img src="/images/gameboard/jamjjang/jjang_word05.gif"></td>
                      <td width="1%"><img src="/images/gameboard/jamjjang/jjang_gab.gif" width="2" height="20"></td>
                      <td width="7%" align="center"><img src="/images/gameboard/jamjjang/jjang_word06.gif"></td>
                      <td width="1%"><img src="/images/gameboard/jamjjang/jjang_gab.gif" width="2" height="20"></td>
                      <td width="7%" align="center"><img src="/images/gameboard/jamjjang/jjang_word07.gif"></td>
                      <td width="1%"><img src="/images/gameboard/jamjjang/jjang_gab.gif" width="2" height="20"></td>
                      <td width="7%" align="center"><img src="/images/gameboard/jamjjang/jjang_word09.gif"></td>
                      <td width="1%"><img src="/images/gameboard/jamjjang/jjang_gab.gif" width="2" height="20"></td>
                      <td width="8%" align="center"><img src="/images/gameboard/jamjjang/jjang_word10.gif"></td>
                    </tr>
                  </table></td>
                <td width="8"><img src="/images/gameboard/jamjjang/jjang_topbg01_03.gif" width="8" height="29"></td>
              </tr>
            </table> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="/images/main/blank.gif" width="1" height="50"></td>
              </tr>
            </table>
            <table width="100%" height="200" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="9" height="9"><img src="/images/gameboard/jamjjang/jjang_table01_tl.gif" width="18" height="18"></td>
                <td background="/images/gameboard/jamjjang/jjang_table01_t.gif"><img src="/images/gameboard/jamjjang/jjang_table01_t.gif" width="2" height="18"></td>
                <td width="9" height="9"><img src="/images/gameboard/jamjjang/jjang_table01_tr.gif" width="18" height="18"></td>
              </tr>
              <tr> 
                <td background="/images/gameboard/jamjjang/jjang_table01_l.gif"><img src="/images/gameboard/jamjjang/jjang_table01_l.gif" width="18" height="2"></td>
                <td align="center" bgcolor="#1A6587"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFFFFF"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                  </table>

<iframe src="gameboard_jamjjang_result_01.asp?User_NickName=<%=User_NickName%>" frameborder="0" width="700" height="150" scrolling="yes" vspace="5"></iframe>


                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#FFFFFF"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                  </table>
                </td>
                <td background="/images/gameboard/jamjjang/jjang_table01_r.gif"><img src="/images/gameboard/jamjjang/jjang_table01_r.gif" width="18" height="2"></td>
              </tr>
              <tr>
<form Method="POST" action="javascript:goAuto()" name="form1">
                <td width="9" height="9"><img src="/images/gameboard/jamjjang/jjang_table01_bl.gif" width="18" height="79"></td>
                <td align="center" background="/images/gameboard/jamjjang/jjang_table01_b.gif">
				  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="12"><img src="/images/gameboard/jamjjang/jjang_bg01_01.gif" width="12" height="58"></td>
                      <td align="center" background="/images/gameboard/jamjjang/jjang_bg01_02.gif">
                      <table width="80%" border="0" cellspacing="0" cellpadding="5">
                          <tr> 
                            <td align="center" class="txtDarkblue">请再搜索一次</td>
                          </tr>
                        </table>
                        <table width="80%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center" class="txtWhite">
                            <table border="0" cellspacing="0" cellpadding="2">
                                <tr> 
                                  <td><img src="/images/gameboard/jamjjang/jjang_word_nick.gif"></td>
                                  <td><input name="User_NickName" type="text" class="input03" size="30"></td>
                                  <td><img src="/images/gameboard/jamjjang/jjang_but_search.gif" onclick="goAuto();" style="cursor:hand"></td>
                                </tr>
                              </table></td>
                          </tr>
                        </table></td>
                      <td width="12"><img src="/images/gameboard/jamjjang/jjang_bg01_03.gif" width="12" height="58"></td>
                    </tr>
                  </table></td>
</form>
                <td width="9" height="9"><img src="/images/gameboard/jamjjang/jjang_table01_br.gif" width="18" height="79"></td>
              </tr>
            </table> </td>
          <td><img src="/images/gameboard/jamjjang/jjang_title.gif" width="146" height="466"><br>
          </td>
        </tr>
      </table>
      
    </td>
  </tr>
</table>
</body>
</html>
