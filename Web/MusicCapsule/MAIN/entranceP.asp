<%
'------------------------------------------------
'		   MainBoard
'	   By —©“πŒﬁ…˘(§Ë§Î§Œ§Ê§≠üo…˘)
'------------------------------------------------
'∂¡»° ˝æ›≤¢«“º”“‘—È÷§
	Dim Userid,UserPWD,UserNick,UserSex
	Dim objDBrs1,objDBrs
	Dim strSQL1,strSQL
	Dim CaIndexID,CaTitle,Ca
	Userid 	= Request.Form("cuid")
	UserPWD = Request.Form("cupwd")

	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open(Application("Connection_ConnectionString"))
	
	Set Conn1 = Server.CreateObject("ADODB.Connection")
	Conn1.Open(Application("c_Connection_ConnectionString"))

	if Userid<>"" and UserPWD<>"" then
	strSQL1 = "Select * From member where userid='" & Userid & "' and passwd='" & UserPWD & "'"
	Set objDBrs=Conn.Execute (strSQL)
		If Not(objDBrs1.EOF or objDBrs1.BOF) Then
			UserNick=objDBrs1("USernick")
			UserSex=objDBrs1("sex")
			'ºÏ≤È”√ªß «∑Ò”–◊¢≤·
			strSQL="Select * From TB_CAPSULE_USER_INDEX_INFO Where strUserID='" & Userid & "'"
			Set objDBrs=Conn.Execute (strSQL)
				If Not(objDBrs.EOF or objDBrs.BOF) Then
					CaIndexID=objDBrs("intCapsuleIndexID")
					conn.close
					'’“≥ˆ…Á«¯ª˘±æ–≈œ¢
					Set Conn = Server.CreateObject("ADODB.Connection")
					Conn.Open(Application("Connection_ConnectionString"))
					strSQL="Select * From TB_CAPSULE_INFO Where intCapsuleIndexID='" & CaIndexID& "'"
					Set objDBrs=Conn.Execute (strSQL)	
					If Not(objDBrs.EOF or objDBrs.BOF) Then
						CaTitle=objDBrs("strCapsuleTitle")
						CaIntroduce=objDBrs("strCapsuleIntroduce")
					Else
						Response.Write "<script>alert(' ˝æ›ø‚ÀªµªÚƒ˙Œ™∑«∑®≤Ÿ◊˜£°');</script>"
						Response.Write "<script>history.back();</script>"
						Response.End
					End if
				else
						'√ª”–æÕΩ®¡¢
						Set Conn = Server.CreateObject("ADODB.Connection")
						Conn.Open(Application("Connection_ConnectionString"))

						Set objCmd = Server.CreateObject("ADODB.Command")
						With objCmd
							ActiveConnection = Conn
							.CommandText = "PROC_CAPSULE_CREATE"
							.CommandType = adCmdStoredProc
							.Parameters.Append .CreateParameter("@intUserIndexID", adInteger, adParamInput, , UserIndexID)
							.Parameters.Append .CreateParameter("@strUserID", adVarChar, adParamInput, 20, USERID)
							.Parameters.Append .CreateParameter("@strUserID_MD5", adChar, adParamInput, 32, UserID)
							.Parameters.Append .CreateParameter("@strUserNickName", adVarChar, adParamInput, 20, USERNICK)
							.Parameters.Append .CreateParameter("@strSex", adInteger, adParamInput, , UserSEX)
							.Parameters.Append .CreateParameter("@strGuild", adVarChar, adParamInput, 50, "Null")
							.Parameters.Append .CreateParameter("@strCapsuleTitle", adVarChar, adParamInput,100 , UserNICK & "µƒ…Á«¯")
							.Parameters.Append .CreateParameter("@strCapsuleIntroduce", adVarChar, adParamInput, 1000, "±æ≥Ã–Ú”…NSISNÃ·π©")
							.Parameters.Append .CreateParameter("RetVal", adInteger, adParamReturnValue, 4)
							.Execute
							RESULT = .Parameters("RetVal")
						End with

			
				end if
		else
			Response.Write "<script>alert('Please Enter All Login Information.');</script>"
			Conn.Close
			Set Conn = Nothing
			Conn1.Close
			Set Conn1 = Nothing
			Response.Write "<script>history.back();</script>"
			Response.End
		End if
	Else
		Response.Write "<script>alert('Please Enter All Login Information.');</script>"
		Response.Write "<script>history.back();</script>"
		Response.End
	End if


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML><HEAD><TITLE>“Ù¿÷…Á«¯  by NSISN£®—©“πŒﬁ…˘£©</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="../CSS/musiccapsule.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript 
src="../IJS/disableRightClick.js"></SCRIPT>

<SCRIPT language=javascript 
src="../JS/layerMenu.js"></SCRIPT>

<SCRIPT language=javascript>		
		
			// ±‚∫ª ∏ﬁ¥∫π¯»£ º≥¡§ »®¿∫ 1∑Œ º≥¡§
			var numMenu = 1;						
			
			function fnChangeMenu(cid, num)
			{
				var strMainPath;
				
				numMenu = parseInt(num);
				
				// ≈¨∏Ø«— ∏ﬁ¥∫ ¡Ô, ¿Ãµø«“ ∏ﬁ¥∫¥¬ ∑—ø¿πˆ ¿ÃπÃ¡ˆ∑Œ πŸ≤Ÿ∞Ì
				//	≥™∏”¡ˆ ∏ﬁ¥∫µÈ¿∫ ∏µŒ ∑—æ∆øÙ ¿ÃπÃ¡ˆ∑Œ πŸ≤ﬁ...	
				for(i = 1; i <= 11; i++)
				{
					objImg = document.all["imgMenu" + i];
					// ∏ﬁ¥∫ ¿ÃπÃ¡ˆ∞° ¿÷¿ª ∞ÊøÏ ¡Ô, ¥Ÿ∏• ªÁ∂˜¿« π¬¡˜ƒ∏Ω∂¿« ∞ÊøÏ ∫∏¿Ã¡ˆ æ ¥¬ ∏ﬁ¥∫ø°º≠¥¬ ∑—ø¿πˆ, ∑—æ∆øÙ «œ∏È æ»µ 
					if(objImg != undefined)		
					{
						if(i == numMenu)
						{
							fnMenuOverOut(objImg, i, "over");
						}
						else
						{
							fnMenuOverOut(objImg, i, "out");
						}
					}
				}
				
				// ∏ﬁ¥∫ ¿Ãµø«“ ∞Ê∑Œ º≥¡§
				switch(num)
				{
					case "1" :
						strMainPath = "/MusicCapsule/main/musicCapsule_main_iframe.asp";
						break;
					case "2" :
						strMainPath = "/MusicCapsule/mymusic/musiccapsule_mymusic_list.asp";
						break;
					case "3" :
						strMainPath = "/MusicCapsule/board/List.asp";
						break;
					case "4" :
						strMainPath = "/MusicCapsule/guestbook/guestbook_main.asp";
						break;
					case "5" :
						strMainPath = "/MusicCapsule/friends/musicCapsule_friends.asp";
						break;
					case "52" :
						strMainPath = "/MusicCapsule/friends/musicCapsule_friends_request_fromFriend.asp";
						break;

					case "6" :
						strMainPath = "/MusicCapsule/admin/musicCapsule_admin.asp";
						break;
					case "7" :
						strMainPath = "/MusicCapsule/note/musicCapsule_ReceiveMemo.asp";
						break;
					case "8" :
						strMainPath = "/MusicCapsule/guide/musicCapsule_guide.asp";
						break;
					case "9" :
						strMainPath = "/MusicCapsule/event/owp/musicCapsule_owp_main.asp";
						break;
					case "10" :
						top.location.href = "/MusicCapsule/main/musicCapsule_gate.asp?cid=7&menu=" + num + "";
						break;
					case "11" :
						top.location.href = "http://club.9you.com/myclubo2.php?in=0&u_id=-1&u_name=1705403&u_nickname=Èõ™Â§úÊó†Â£∞&u_o2jam=6bb61e3b7bce0931da574d19d1d82c888dbea52d2ec1c20efaafdfeb48535859&cid=1015&u_area=o2test";
						break;
					default :
						strMainPath = "/MusicCapsule/main/musicCapsule_main_iframe.asp";
						break;
				}
				
				if(strMainPath != null)
				{			
					// IFRAME ∞Ê∑Œ º≥¡§, ¿Ãµø«“ ∆‰¿Ã¡ˆ ∞Ê∑Œ∏¶ πŸ≤ŸæÓ¡÷∞Ì, ∏ﬁ¥∫ ≈∏¿Ã∆≤ ∞Ê∑Œµµ πŸ≤ŸæÓ¡‹
					document.all["ifMenuTitle"].src = "/MusicCapsule/inc/incMenuTitle_iframe.asp?cid=" + cid + "&menu=" + num + "";
					document.all["ifMainContent"].src = strMainPath + "?cid=" + cid + "";			
				}
			}
			
			// ƒ£±∏ ƒ∏Ω∂∑Œ ¿Ãµø
			function fnGoFriendCapusule(cid)
			{
				if(cid.length > 0)
				{
					if(cid > 0)
					{
						top.location.href = "/MusicCapsule/main/musicCapsule_gate.asp?cid=" + cid + "";
					}
					else
					{
						alert("ƒ˙À˘—°‘Òµƒ∫√”—ªπ√ª”–¥¥Ω®“Ù¿÷…Á«¯");
					}
				}
			}
			
			// ∏ﬁ¥∫ ∑—ø¿πˆ, ∑—æ∆øÙ «“∂ß ¿ÃπÃ¡ˆ º≥¡§
			function fnMenuOverOut(objImg, num, chk)
			{
				if(numMenu != parseInt(num))
				{
					var strImgName;
						
					strImgName = objImg.src;
										
					if(chk == "over")
					{
						strImgName = strImgName.substr(0, strImgName.indexOf(".jpg"));
						objImg.src = strImgName + "_o.jpg";						
					}
					else
					{
						idx = strImgName.indexOf("_o.jpg");
						if(idx > 0)
						{
							strImgName = strImgName.substr(0, strImgName.indexOf("_o.jpg"));												
							objImg.src = strImgName + ".jpg";	
						}
					}
				}
			}
			
			function fnAlertMessage(msg)
			{
				alert(msg);
			}
			
		</SCRIPT>

<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>
<BODY bgColor=#001747 leftMargin=0 topMargin=0><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
<TABLE id=Table1 height=484 cellSpacing=0 cellPadding=0 width=752 
bgColor=#ffffff border=0>
  <TBODY>
  <TR>
    <TD align=middle><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
      <TABLE id=Table2 height=468 cellSpacing=0 cellPadding=0 width=736 
      bgColor=#00deff background=../Images/Main/mc_bg_468.jpg 
border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=middle><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
            <TABLE id=Table3 cellSpacing=0 cellPadding=0 width=716 border=0>
              <TBODY>
              <TR>
                <TD><IMG height=13 src="../Images/Main/bk.gif" 
                  width=1></TD></TR>
              <TR>
                <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                  <TABLE id=Table4 cellSpacing=0 cellPadding=0 width=716 
                  border=0>
                    <TBODY>
                    <TR>
                      <TD width=200><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                        <TABLE id=Table5 cellSpacing=0 cellPadding=0 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                              <TABLE id=Table6 height=40 cellSpacing=0 
                              cellPadding=0 width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD><IMG height=20 
                                src="../Images/Main/bk.gif" 
                                width=1></TD></TR>
                                <TR>
                                <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table7 cellSpacing=0 cellPadding=0 
                                width="95%" align=center border=0>
                                <TBODY>
                                <TR>
                                <TD width=7><IMG height=16 
                                src="../Images/Main/mc_count_l.gif" 
                                width=7></TD>
                                <TD width=176 bgColor=#00a7ef><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table8 height=16 cellSpacing=0 
                                cellPadding=0 width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width=10></TD>
                                <TD width=33><IMG height=16 
                                src="../Images/Main/mc_count_today.gif" 
                                width=33></TD>
                                <TD class=txtEnglishS_Or align=left width=36 
                                height=16>1</TD>
                                <TD align=left width=15><IMG height=16 
                                src="../Images/Main/mc_count_center.gif" 
                                width=1></TD>
                                <TD width=31><IMG height=16 
                                src="../Images/Main/mc_count_total.gif" 
                                width=31></TD>
                                <TD class=txtEnglishS align=left width=51 
                                height=16>1</TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD>
                                <TD width=7><IMG height=16 
                                src="../Images/Main/mc_count_r.gif" 
                                width=7></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR>
                                <TR>
                                <TD><IMG height=4 
                                src="../Images/Main/bk.gif" 
                                width=1></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR>
                          <TR>
                            <TD height=262>
                              <TABLE id=Table9 cellSpacing=0 cellPadding=0 
                              width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD 
                                background=../Images/Main/mc_basic_avatar_bg.jpg>
                                <TABLE id=Table10 cellSpacing=0 cellPadding=0 
                                width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD height=26><IMG height=26 
                                src="../Images/Main/bk.gif" 
                                width=1></TD></TR>
                                <TR><!--<td height="188"><img src="/O2JamFile/Avatar/mc_avatar_admin.gif" width="166" height="188"></td>-->
                                <TD height=188><IMG height=188 src="" 
                                width=136></TD>
                                <TR>
                                <TD height=11><IMG height=11 
                                src="../Images/Main/bk.gif" 
                                width=1></TD></TR></TBODY></TABLE></TD></TR>
                                <TR>
                                <TD vAlign=top>
                                <TABLE id=Table11 height=37 cellSpacing=0 
                                cellPadding=0 width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD vAlign=top 
                                background=../Images/Main/mc_owp_avatar_bg02.jpg 
                                height=37>
                                <TABLE id=Table12 height=27 cellSpacing=0 
                                cellPadding=0 width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width="11%"><IMG height=3 
                                src="../Images/Main/bk.gif" 
                                width=1></TD>
                                <TD width="77%">
                                <DIV align=center><A class=txtBlackS id=A2 
                                href="javascript:fnClickLayerMenu('1015',%20'1015',%20'1015',%20'f1');">Èõ™Â§úÊó†Â£∞</A></DIV></TD>
                                <TD width="12%"><IMG height=3 
                                src="../Images/Main/bk.gif" 
                                width=1></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD><IMG height=3 
                              src="../Images/Main/bk.gif" 
                          width=1></TD></TR>
                          <TR>
                            <TD vAlign=top height=124><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                              <TABLE id=Table14 cellSpacing=0 cellPadding=0 
                              width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width=16 height=145><IMG height=145 
                                src="../Images/Main/mc_pro_l.jpg" 
                                width=16></TD>
                                <TD 
                                background=../Images/Main/mc_pro_bg.jpg><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table15 height=94 cellSpacing=0 
                                cellPadding=0 width=168 border=0>
                                <TBODY>
                                <TR>
                                <TD vAlign=top><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table16 cellSpacing=0 cellPadding=0 
                                width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD align=left height=16><SPAN 
                                class=txtEnglishSB>1705403 </SPAN><SPAN 
                                class=txtEnglish_Or>(Lv 28)</SPAN> </TD></TR>
                                <TR>
                                <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table17 cellSpacing=0 cellPadding=0 
                                width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD align=left width=100 height=16>2005.12.01(+) 
                                <IMG height=12 
                                src="../Images/Main/mc_man.gif" 
                                width=11 align=absMiddle> </TD>
                                <TD align=left width=9 height=14><IMG height=14 
                                src="../Images/Main/mc_pro_i.gif" 
                                width=3></TD>
                                <TD align=left width=57><IMG 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '7')" height=10 
                                src="../Images/Main/mc_note_icon.gif" 
                                width=32 align=absMiddle> <SPAN 
                                class=txtEnglish_Or>0</SPAN> 
                                </TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR><!--
																								<tr>
																									<td align="left" height="16">æ¢¿÷”Œœ∑±“ :
																										
																										<span class="txtSkyblue">
																											71,420 
																										</span>G
																										
																									</td>
																								</tr>
																								<tr>
																									<td align="left" height="16">æ√”Œ–›œ–±“:
																										
																										<span class="txtSkyblue">
																											131,680 
																										</span>M
																										
																									</td>
																								</tr>
																								-->
                                <TR>
                                <TD align=left height=16>ªÓ∂Ø: <SPAN 
                                class=txtSkyblue>ÂàùÁ∫ß1/È¢ëÈÅì1 </SPAN></TD></TR>
                                <TR>
                                <TD align=left height=16>À˘ Ù: <SPAN 
                                class=txtSkyblue>Ê≤°ÊúâÊâÄÂ±û‰πêÈò? </SPAN></TD></TR><!--
																								<tr>
																									<td align="left" height="16">À˘‘⁄≥« –:
																										
																										<span class="txtSkyblue">
																											-
																										</span>
																										
																									</td>
																								</tr>
																								<tr>
																									<td align="left" height="16">ƒÍ¡‰:
																										
																										<span class="txtSkyblue">
																											20
																										</span>
																										
																									</td>
																								</tr>
																								<tr>
																									<td align="left" height="16">¡™œµ∑Ω Ω:
																										
																										<span class="txtSkyblue">
																											
																										</span>
																										
																									</td>
																								</tr>
																							-->
                                <TR>
                                <TD height=4><IMG height=4 
                                src="../Images/Main/bk.gif" 
                                width=1></TD></TR>
                                <TR>
                                <TD align=left><SELECT class=selsctbox 
                                id=Select1 
                                onchange=fnGoFriendCapusule(this.value) 
                                name=sltFriendList> <OPTION value="" 
                                selected>Œ“µƒ∫√”— -------------</OPTION> <OPTION 
                                value=1015>Ω¯»ÎŒ“µƒ“Ù¿÷…Á«¯</OPTION> <OPTION 
                                value="">----------------------</OPTION></SELECT> 
                                </TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD>
                                <TD width=16 height=145><IMG height=145 
                                src="../Images/Main/mc_pro_r.jpg" 
                                width=16></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD>
                      <TD><IMG height=1 src="../Images/Main/bk.gif" 
                        width=6></TD>
                      <TD vAlign=top width=439><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                        <TABLE id=Table18 cellSpacing=0 cellPadding=0 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                              <TABLE id=Table19 cellSpacing=0 cellPadding=0 
                              width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width=38 height=40><IMG style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '1')" height=40 
                                src="../Images/Main/mc_title_l.jpg" 
                                width=38 border=0></TD>
                                <TD 
                                background=../Images/Main/mc_title_bg.jpg><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table20 cellSpacing=0 cellPadding=0 
                                width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width=6></TD>
                                <TD class=txtBlackB align=left width=350>: 
                                Èõ™Â§úÊó†Â£∞ Èü≥‰πêÁ§æÂå∫Ê†áÈ¢ò. </TD>
                                <TD align=right width=60>
                                <TABLE id=Table30 cellSpacing=0 cellPadding=0 
                                width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width=7 height=16><IMG height=16 
                                src="../Images/Main/mc_fdq_bgl.jpg" 
                                width=7></TD>
                                <TD width=33 bgColor=#006ecc><IMG 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015','52');" height=16 
                                src="../Images/Main/mc_fdq_title.jpg" 
                                width=33 border=0></TD>
                                <TD class=txtEnglishS_Sb bgColor=#006ecc>0</TD>
                                <TD width=7 height=16><IMG height=16 
                                src="../Images/Main/mc_fdq_bgr.jpg" 
                                width=7></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD>
                                <TD width=15 height=40><IMG height=40 
                                src="../Images/Main/mc_title_r.jpg" 
                                width=15></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR>
                          <TR>
                            <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                              <TABLE id=Table21 cellSpacing=0 cellPadding=0 
                              width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD 
                                background=../Images/Main/mc_center_tbg.jpg 
                                height=47><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table22 cellSpacing=0 cellPadding=0 
                                width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width=49 height=47><IMG height=47 
                                src="../Images/Main/mc_center_lt.jpg" 
                                width=49></TD>
                                <TD height=47><IFRAME id=ifMenuTitle 
                                marginWidth=0 marginHeight=0 
                                src="../Images/Main/incMenuTitle_iframe.htm" 
                                frameBorder=0 width="100%" scrolling=no 
                                height="100%"></IFRAME></TD>
                                <TD width=20 height=47><IMG height=47 
                                src="../Images/Main/mc_center_rt.jpg" 
                                width=20></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR>
                                <TR>
                                <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table24 cellSpacing=0 cellPadding=0 
                                width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width=1 height=323><IMG height=323 
                                src="../Images/Main/mc_center_shadow_l.jpg" 
                                width=1></TD>
                                <TD width=11 
                                background=../Images/Main/mc_center_lc.jpg><IMG 
                                height=1 src="../Images/Main/bk.gif" 
                                width=11></TD>
                                <TD vAlign=top align=middle bgColor=#ffffff 
                                height=323 widht="407"><IFRAME id=ifMainContent 
                                marginWidth=0 marginHeight=0 
                                src="../Images/Main/musicCapsule_main_iframe.htm" 
                                frameBorder=0 width="100%" 
                                height="100%"></IFRAME></TD>
                                <TD width=11 
                                background=../Images/Main/mc_center_rc.jpg><IMG 
                                height=1 src="../Images/Main/bk.gif" 
                                width=11></TD>
                                <TD width=1 height=323><IMG height=323 
                                src="../Images/Main/mc_center_shadow_l.jpg" 
                                width=1></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR>
                                <TR>
                                <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table25 cellSpacing=0 cellPadding=0 
                                width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD width=19 height=19><IMG height=19 
                                src="../Images/Main/mc_center_lu.jpg" 
                                width=19></TD>
                                <TD 
                                background=../Images/Main/mc_center_ubg.jpg>&nbsp;</TD>
                                <TD width=19 height=19><IMG height=19 
                                src="../Images/Main/mc_center_ru.jpg" 
                                width=19></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD>
                      <TD vAlign=top width=71><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                        <TABLE id=Table26 cellSpacing=0 cellPadding=0 
                        width="100%" border=0>
                          <TBODY>
                          <TR>
                            <TD><IMG height=60 
                              src="../Images/Main/bk.gif" 
                          width=1></TD></TR>
                          <TR>
                            <TD><IMG height=61 
                              src="../Images/Main/mc_menu_t.jpg" 
                              width=71></TD></TR>
                          <TR>
                            <TD><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                              <TABLE id=Table27 cellSpacing=0 cellPadding=0 
                              width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD vAlign=top 
                                background=../Images/Main/mc_menu_bg.jpg><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table28 height=203 cellSpacing=0 
                                cellPadding=0 width="100%" border=0>
                                <TBODY>
                                <TR>
                                <TD vAlign=top width=55><!-- ≈◊¿Ã∫Ì¿« Ω√¿€ -->
                                <TABLE id=Table29 cellSpacing=0 cellPadding=0 
                                width=55 border=0>
                                <TBODY>
                                <TR>
                                <TD vAlign=top align=right><IMG id=imgMenu1 
                                onmouseover="fnMenuOverOut(this, '1', 'over')" 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '1')" 
                                onmouseout="fnMenuOverOut(this, '1', 'out')" 
                                height=17 
                                src="../Images/Main/mc_button_home_o.jpg" 
                                width=49 border=0 name=imgMenu1></TD></TR>
                                <TR>
                                <TD height=10><IMG height=4 
                                src="../Images/Main/mc_menu_line.jpg" 
                                width=55></TD></TR>
                                <TR>
                                <TD vAlign=top align=right><IMG id=imgMenu11 
                                onmouseover="fnMenuOverOut(this, '11', 'over')" 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '11')" 
                                onmouseout="fnMenuOverOut(this, '11', 'out')" 
                                height=17 
                                src="../Images/Main/mc_button_mymall.jpg" 
                                width=49 border=0 name=imgMenu11></TD></TR>
                                <TR>
                                <TD height=10><IMG height=4 
                                src="../Images/Main/mc_menu_line.jpg" 
                                width=55></TD></TR>
                                <TR>
                                <TD vAlign=top align=right><IMG id=imgMenu2 
                                onmouseover="fnMenuOverOut(this, '2', 'over')" 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '2')" 
                                onmouseout="fnMenuOverOut(this, '2', 'out')" 
                                height=17 
                                src="../Images/Main/mc_button_mymsic.jpg" 
                                width=49 border=0 name=imgMenu2></TD></TR>
                                <TR>
                                <TD height=10><IMG height=4 
                                src="../Images/Main/mc_menu_line.jpg" 
                                width=55></TD></TR>
                                <TR>
                                <TD vAlign=top align=right><IMG id=imgMenu3 
                                onmouseover="fnMenuOverOut(this, '3', 'over')" 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '3')" 
                                onmouseout="fnMenuOverOut(this, '3', 'out')" 
                                height=17 
                                src="../Images/Main/mc_button_board.jpg" 
                                width=49 border=0 name=imgMenu3></TD></TR>
                                <TR>
                                <TD height=10><IMG height=4 
                                src="../Images/Main/mc_menu_line.jpg" 
                                width=55></TD></TR>
                                <TR>
                                <TD vAlign=top align=right><IMG id=imgMenu4 
                                onmouseover="fnMenuOverOut(this, '4', 'over')" 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '4')" 
                                onmouseout="fnMenuOverOut(this, '4', 'out')" 
                                height=17 
                                src="../Images/Main/mc_button_guest.jpg" 
                                width=49 border=0 name=imgMenu4></TD></TR>
                                <TR>
                                <TD height=10><IMG height=4 
                                src="../Images/Main/mc_menu_line.jpg" 
                                width=55></TD></TR>
                                <TR>
                                <TD vAlign=top align=right><IMG id=imgMenu5 
                                onmouseover="fnMenuOverOut(this, '5', 'over')" 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '5')" 
                                onmouseout="fnMenuOverOut(this, '5', 'out')" 
                                height=17 
                                src="../Images/Main/mc_button_friends.jpg" 
                                width=49 border=0 name=imgMenu5></TD></TR>
                                <TR>
                                <TD height=10><IMG height=4 
                                src="../Images/Main/mc_menu_line.jpg" 
                                width=55></TD></TR>
                                <TR>
                                <TD vAlign=top align=right><IMG id=imgMenu7 
                                onmouseover="fnMenuOverOut(this, '7', 'over')" 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '7')" 
                                onmouseout="fnMenuOverOut(this, '7', 'out')" 
                                height=17 
                                src="../Images/Main/mc_button_note.jpg" 
                                width=49 border=0 name=imgMenu7></TD></TR>
                                <TR>
                                <TD height=10><IMG height=4 
                                src="../Images/Main/mc_menu_line.jpg" 
                                width=55></TD></TR>
                                <TR>
                                <TD vAlign=top align=right><IMG id=imgMenu6 
                                onmouseover="fnMenuOverOut(this, '6', 'over')" 
                                style="CURSOR: hand" 
                                onclick="fnChangeMenu('1015', '6')" 
                                onmouseout="fnMenuOverOut(this, '6', 'out')" 
                                height=17 
                                src="../Images/Main/mc_button_admin.jpg" 
                                width=49 border=0 
                                name=imgMenu6></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD>
                                <TD width=15><IMG height=1 
                                src="../Images/Main/bk.gif" 
                                width=15></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD>
                                <TD vAlign=top width=1 bgColor=#009dcf 
                                height=203><IMG height=203 
                                src="../Images/Main/mc_menu_shadow.jpg" 
                                width=1></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR>
                          <TR>
                            <TD><IMG height=18 
                              src="../Images/Main/mc_menu_u.jpg" 
                              width=71></TD></TR>
                          <TR>
                            <TD><IMG height=7 
                              src="../Images/Main/bk.gif" 
                          width=1></TD></TR>
                          <TR>
                            <TD><A 
                              href="http://tradesf.7907.com:15000/MusicCapsule/main/musicCapsule_gate.asp?cid=1015"><IMG 
                              height=25 
                              src="../Images/Main/mc_menu_mygo.jpg" 
                              width=71 border=0></A></TD></TR>
                          <TR>
                            <TD><IMG height=7 
                              src="../Images/Main/bk.gif" 
                          width=1></TD></TR>
                          <TR>
                            <TD><A 
                              href="http://tradesf.7907.com:15000/MusicCapsule/main/musicCapsule_main_random_capsule.asp"><IMG 
                              height=25 
                              src="../Images/Main/mc_menu_rango.jpg" 
                              width=71 border=0></A></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR></TBODY></TABLE><!-- ≈◊¿Ã∫Ì¿« ≥° --></TD></TR></TBODY></TABLE></BODY></HTML>
