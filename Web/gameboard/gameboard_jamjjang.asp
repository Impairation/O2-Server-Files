<%
	If Request("memberID") <> "" Then
		Response.Cookies("O2Jam")("memberID") 	=  Request("memberID")
	End If

	User_NickName	= Request.Form("User_NickName")
	User_NickName	= Replace(User_NickName,"'","ⅴ")

	pagesize	= 10
	GotoPage	= Request.QueryString("GotoPage")

	If GotoPage = "" Then
 		GotoPage = 1
	End If
 
	Set Conn = Server.CreateObject ("ADODB.Connection")
	Conn.Open (Application("Connection_ConnectionString"))
 
 	strSQL			= "PROC_RANKING_UPDATE_DATE" 
	Set objDBrs	= Conn.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) Then
		WriteDate = objDBrs("WriteDate")
	End If

	objDBrs.Close
	Set objDBrs = Nothing
	Conn.Close
	Set Conn = Nothing
%>

<script language="javascript" src="/Lib/common2.js"></script>
<script language="JavaScript">

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
		}
		else if (fnTrim(objInput.value).length < 2)
		{
		
			alert ("请输入2字以上搜索词");
			objInput.value = "";
			objInput.focus();
			return (false);
		}
		else
		{
			document.form1.action="gameboard_jamjjang_result.asp";
			document.form1.submit();
		}
	}

</script>

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
                      <td align="center"><img src="/images/gameboard/jamjjang/jjang_word02.gif" width="53" height="14"></td>
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
                <td><img src="/images/main/blank.gif" width="1" height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="9" height="9"><img src="/images/gameboard/jamjjang/jjang_table01_tl.gif" width="18" height="18"></td>
                <td background="/images/gameboard/jamjjang/jjang_table01_t.gif"><img src="/images/gameboard/jamjjang/jjang_table01_t.gif" width="2" height="18"></td>
                <td width="9" height="9"><img src="/images/gameboard/jamjjang/jjang_table01_tr.gif" width="18" height="18"></td>
              </tr>
              <tr> 
                <td background="/images/gameboard/jamjjang/jjang_table01_l.gif"><img src="/images/gameboard/jamjjang/jjang_table01_l.gif" width="18" height="2"></td>
                <td align="center" bgcolor="#1A6587">

				<%
					Set Conn = Server.CreateObject ("ADODB.Connection")
					Conn.Open (Application("Connection_ConnectionString"))
					
					strSQL 	= "Select count(seq) FROM TB_Ranking WHERE ValidFlag = '1'"
					Set objDBrs	= Conn.Execute(strSQL)
					
					totalRecord = objDBrs(0)
					pagecount = Clng(totalRecord / pagesize)
					
					namuzi = (objDBrs(0) mod pagesize)/pagesize
					
					If namuzi > 0 And namuzi < 0.5 Then
						pagecount = pagecount + 1        
					End If
				 	
				 	objDBrs.Close
					Set objDBrs = Nothing
					
					strSQL = "PROC_RANKING_LIST_UP" 
					Set objDBrs	= Conn.Execute(strSQL)

					If Not(objDBrs.BOF or objDBrs.EOF) then

						objDBrs.Move pagesize * (GotoPage-1)  

						ib=1
						i = 1
						If Gotopage = 1 Then
							i = totalrecord
						Else
							i = totalrecord - (pagesize * (Gotopage - 1) )
						End If

						Do until objDBrs.EOF or i = totalrecord - (pagesize * Gotopage)	
							
							'Ranking					= objDBrs("Ranking")
							Ranking				= ib + pagesize * (Gotopage-1)
							User_Index_ID		= objDBrs("User_Index_ID")
							User_ID					= objDBrs("User_ID")
							User_NickName		= objDBrs("User_NickName")
							Sex						= objDBrs("Sex")
							Level						= objDBrs("Level")
							Battle						= objDBrs("Battle")
							Win						= objDBrs("Win")
							Draw						= objDBrs("Draw")
							Lose						= objDBrs("Lose")
							Experience			= objDBrs("Experience")
							ChangeType			= objDBrs("ChangeType")
							ChangeRanking		= objDBrs("ChangeRanking")
							%>
							<table width="100%" border="0" cellspacing="0" cellpadding="1">
								<tr class="txtWhite">
									<%
									If Ranking <= 10 Then
										%><td width="12%" align="center"><img src="/images/gameboard/jamjjang/jjang_bullet<%If Ranking = 10 Then%>10<%Else%>0<%=Ranking%><%End If%>.gif" width="21" height="22"></td><%
									Else
										%><td width="12%" align="center"><%=Ranking%></td><%
									End If
									%>
									<td align="left"><%=User_NickName%></td>
									<td width="7%" align="center">Lv.<%=Level%></td>
									<td width="10%" align="center"><%=Experience%></td>
									<td width="12%" align="center"><%=Battle%></td>
									<td width="7%" align="center"><%=Win%></td>
									<td width="7%" align="center"><%=Lose%></td>
									<td width="7%" align="center"><%=Draw%></td>
									<%
									If ChangeType = 0 Then
										%><td width="7%" align=right><img src="/images/gameboard/jamjjang/jjang_bullet_down.gif" width="19" height="19"></td><%
									ElseIf ChangeType = 1 Then
										%><td width="7%" align=right><img src="/images/gameboard/jamjjang/jjang_bullet_up.gif" width="19" height="19"></td><%
									ElseIf ChangeType = 2 Then
										%><td width="7%" align=right><img src="/images/gameboard/jamjjang/jjang_bullet_none.gif" width="19" height="19"></td><%
									ElseIf ChangeType = 3 Then
										%><td width="7%" align=right><img src="/images/gameboard/jamjjang/jjang_bullet_new.gif" width="19" height="19"></td><%
									End If
									%>
									<td width="5%"><%=ChangeRanking%></td>
								</tr>
							</table>
					
							<table width="98%" border="0" cellspacing="0" cellpadding="0">
								<tr> 
									<td background="/images/gameboard/jamjjang/jjang_bg_line01.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
								</tr>
							</table>
							<% 
							objDBrs.Movenext
							i = i - 1
							ib = ib +1
						Loop
					End If
					
					objDBrs.Close
					Set objDBrs = Nothing
					
					Conn.Close
					Set Conn = Nothing
					%>

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
				<td background="/images/gameboard/jamjjang/jjang_table01_r.gif"><img src="/images/gameboard/jamjjang/jjang_table01_r.gif" width="18" height="8"></td>
			</tr>
			<tr> 
				<td width="9" height="9"><img src="/images/gameboard/jamjjang/jjang_table01_bl.gif" width="18" height="79"></td>
				<td align="center" background="/images/gameboard/jamjjang/jjang_table01_b.gif">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="12"><img src="/images/gameboard/jamjjang/jjang_bg01_01.gif" width="12" height="58"></td>
							<td align="center" background="/images/gameboard/jamjjang/jjang_bg01_02.gif">
								<table width="100%" border="0" cellspacing="0" cellpadding="5">
									<tr> 
										<td align="center" class="txtWhite">
										<!-- 其捞隆 矫累 -->
										<%
										If Cint(GotoPage) <> 1 Then
											%><a href="gameboard_jamjjang.asp?GoTopage=1"><%
										End If
										%>
										<img src="/images/gameboard/community/commu_free_but_left.gif" width="17" height="17" border="0" align="absmiddle"></a>
										<%
										If Cint(GotoPage) <> 1 Then
											%></a><%
										End If

										blockPage=Int((GotoPage-1)/10)*10+1

										If blockPage = 1 Then
											Response.Write "<span class='txtWhite'>[Previous 10]</span>"
										Else
											%><a href="gameboard_jamjjang.asp?GotoPage=<%=blockPage-10%>"><span class='txtWhite'>[前10个]</span></a><%
										End If
												
										i=1

										Do Until i > 10 or blockPage > pagecount
											If blockPage=int(GotoPage) Then
												%><strong><span class="txtLightBlueB">[<%=blockPage%>]</span></strong><%
											Else
												%><a href="gameboard_jamjjang.asp?GotoPage=<%=blockPage%>"><span class='txtWhite'>[<%=blockPage%>]</span></a><%
											End If
														
											blockPage=blockPage+1
											i = i + 1
										Loop
													
										If blockPage > pagecount Then
											Response.Write "<span class='txtWhite'>[Next 10]</span>"
										Else
											%><a href="gameboard_jamjjang.asp?GotoPage=<%=blockPage%>"><span class='txtWhite'>[后10个]</span></a><%
										End If

										If Cint(GotoPage) <> Cint(pagecount) Then
											%><a href="gameboard_jamjjang.asp?GoTopage=<%=pagecount%>"><%
										End If
											%>
										<img src="/images/gameboard/community/commu_free_but_right.gif" width="17" height="17" border="0" align="absmiddle">
										<%
										If Cint(GotoPage) <> Cint(pagecount) Then
											%></a><%
										End If
										%>
										<!-- 其捞隆 场 -->
							</td>
                          </tr>
                        </table>
                        <table width="80%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
<form Method="POST" action='javascript:goAuto()' name="form1">
                            <td align="center" class="txtWhite">
								<table border="0" cellspacing="0" cellpadding="2">
                                <tr>
                                  <td><img src="/images/gameboard/jamjjang/jjang_word_nick.gif"></td>
                                  <td><input name="User_NickName" type="text" class="input03" size="30"></td>
                                  <td><img src="/images/gameboard/jamjjang/jjang_but_search.gif" name="btn" onclick="goAuto();" style="cursor:hand"></td>
                                </tr>
                              </table>
                              </td>
</form>
                          </tr>
                        </table></td>
                      <td width="12"><img src="/images/gameboard/jamjjang/jjang_bg01_03.gif" width="12" height="58"></td>
                    </tr>
                  </table></td>
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
