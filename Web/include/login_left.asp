<%
	Response.Expires = 0 
	Response.Expiresabsolute = Now() - 3 
	Response.AddHeader "pragma","no-cache" 
	Response.AddHeader "cache-control","private" 
	Response.CacheControl = "no-cache" 
%>
<script language="Javascript" src="/Lib/common.js"></script>
<script language="javascript">
	function sendForm(form)
	{
		var objInput, objInput1, objInput2;

		// ������ưüũ��//

		if (form.LoginChk[0].checked == false && form.LoginChk[1].checked == false)
		{
		   	alert("������ȸ��/������ȸ���� ������ �ֽʽÿ�");
			form.LoginChk[0].focus();
			return;
		}

						
		// ���̵� �Է� üũ ���� //
		objInput = form.mgid;
		if(fnTrim(objInput.value) == "")
		{
			alert("���̵� �Է��� �ֽʽÿ�");
			objInput.select();
			objInput.focus();
					
			return;
		}		
		
		if (form.LoginChk[1].checked)
		{
			if(CheckAlphaNumeric_ID(objInput) == false)
			{
				alert("���̵�� ������ ����, -, _ �� �Է��� �ֽʽÿ�");
				objInput.select();				
				objInput.focus();
							
				return;
			}
		}
		
				
		// ��й�ȣ �Է� üũ ���� //
		objInput1 = form.mgpwd;		
		if(fnTrim(objInput1.value) == "")
		{
			alert("��й�ȣ�� �Է��� �ֽʽÿ�");
			objInput1.value="";
			objInput1.focus();
					
			return;
		}				

		else
		{
			if (form.LoginChk[1].checked) form.action = "/member/loginp.asp";

			form.submit();
		}
	}
	
	// Enter Key �Է� üũ
	function EnterCheck(event,form)
	{
		if(document.all)
		{
			if(event.keyCode ==13) 
			{
				sendForm(form);
			}
		}
		else
		{
			if(event.which == 13) 
			{
				sendForm(form);
			}
		}
	}
			
	function setStatus()
	{
		window.status = "O2Jam �� ���Ű��� ȯ���մϴ�";
	}
	
	function launch() {
		frLaunch.location.replace("/gameStart/launch_o2jam.asp");
	}
	
	function play()	{
		alert("�α����� �̿����ּ���");
		document.frmLogin.mgid.focus();
	}
	
	function srchPwd() {
		window.open("http://www.mgame.com/idpwsearch/", "idpwwin", "menubar=no,scrollbar=no,width=400,height=350,resizable=no,status=no,titlebar=no,toolbar=no");
		}
</script>

<!--�α׾ƿ� �κ� ����-->
<html>
	<head>
		<link href="/main.css" rel="stylesheet" type="text/css">
		<link href="/introduce/introduce.css" rel="stylesheet" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	</head>
<body leftmargin=0 topmargin=0 rightmargin=0 bottommargin=0 bgcolor=EFEFEF>
<center>
<% If Len(Request.Cookies("O2Jam")("memberID")) <= 0 And Len(Request.Cookies("MGAME")("ID")) <= 0 Then %>
<table width="182" border="0" cellpadding="0" cellspacing="0" ID="Table22">
	<tr> 
		<td width="8" height="8"><img src="/images/main/main_login_table_tl.gif" width="8" height="8"></td>
		<td background="/images/main/main_login_table_t.gif"><img src="/images/main/main_login_table_t.gif" width="2" height="8"></td>
		<td width="8" height="8"><img src="/images/main/main_login_table_tr.gif" width="8" height="8"></td>
	</tr>
	<tr>
		<td background="/images/main/main_login_table_l.gif"><img src="/images/main/main_login_table_l.gif" width="8" height="2"></td>
		<td align="center">
			<table width="158" height="188" border="0" cellpadding="0" cellspacing="0" ID="Table1">
				<tr> 
					<td>
						<table width="100%" border="0" cellspacing="3" cellpadding="0">
                                <tr>
                                  <td><img src="/images/main/main_login_bullet01.gif" width="6" height="6"><span class="txtGrayContents"> 
                                    ȸ���� �����ϼ���. </span></td>
                                </tr>
                              </table>
                              <table width="100%" border="0" cellpadding="0" cellspacing="0" background="/images/main/all_bgl02.gif" ID="Table3">
							<tr> 
								<td><img src="/images/main/blank.gif" width="1" height="2"></td>
							</tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="2" ID="Table2">
							<%
							'''= �α����Ŀ� ���ϵ� ��� �����ϴ� �κ��Դϴ�.
							Dim strRedirectURL
							strRedirectURL = "http://" & Request.ServerVariables ("HTTP_HOST") & Request.ServerVariables("PATH_INFO")
														
							If Len(Request.ServerVariables("QUERY_STRING")) > 0 Then
							strRedirectURL = strRedirectURL & "?" & Request.ServerVariables("QUERY_STRING")
							End If
														
							strRedirectURL = Server.URLEncode(strRedirectURL)
							
							%>
							<form name="frmLogin" method="post" action="https://www.mgame.com/member/login_action_pub.asp?tu=<%=strRedirectURL%>" ID="Form1">
							<input type="hidden" name="it" value="2">
							<tr> 
								<td class="txtGray"><input type="radio" name="LoginChk" value="M" ID="Radio1">������ ȸ��</td>
							</tr>
							<tr> 
								<td class="txtGray"><input type="radio" name="LoginChk" value="J" ID="Radio2"><font color="#FF1C39">�����̵�� ȸ��</font></td>
							</tr>
						</table>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" background="/images/main/all_bgl02.gif" ID="Table3">
							<tr> 
								<td><img src="/images/main/blank.gif" width="1" height="2"></td>
							</tr>
						</table>
						<table width="100%" border="0" cellspacing="0" cellpadding="3" ID="Table4">
							<tr> 
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table5">
										<tr> 
											<td height="18"><img src="/images/main/all_login_table_id.gif" width="30" height="12"></td>
										</tr>
										<tr> 
											<td><input name="mgid" type="text" class="input01" size="12"></td>
										</tr>
										<tr> 
											<td><img src="/images/main/all_login_table_pass.gif" width="43" height="12"></td>
										</tr>
										<tr> 
											<td><input name="mgpwd" type="password" onKeyDown="EnterCheck(event, frmLogin)" class="input01" size="12"></td>
										</tr>
									</table>
								</td>
								<td width="46" valign="bottom"><a href="JavaScript:sendForm(frmLogin);"><img src="/images/main/all_login_but_login.gif" width="46" height="53" border="0"></a></td>
							</tr>
							</form>
						</table>
						<script language="javascript">
							frmLogin.mgid.focus();
						</script>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
								  <tr> 
								    <td><img src="/images/main/blank.gif" width="1" height="5"></td>
								  </tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="0" background="/images/main/all_bgl02.gif">
                                <tr> 
                                  <td><img src="/images/main/blank.gif" width="1" height="2"></td>
                                </tr>
                              </table>
                              <table width="100%" border="0" cellpadding="0" cellspacing="0" background="/images/main/all_bgl02.gif">
                                <tr> 
                                  <td><img src="/images/main/blank.gif" width="1" height="2"></td>
                                </tr>
                              </table>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/main/blank.gif" width="1" height="7"></td>
                                </tr>
                              </table>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td align="center"><a href="/member/member_join.asp" target="_parent"><img src="/images/main/main_login_but_join.gif" width="81" height="38" border="0"></a></td>
                                  <td align="center"><a href="javascript:srchPwd()"><img src="/images/main/main_login_but_find.gif" width="80" height="38" border="0"></a></td>
                                </tr>
                              </table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
								  <tr> 
								    <td><img src="/images/main/blank.gif" width="1" height="7"></td>
								  </tr>
								</table>
								<table width="100%" border="0" cellpadding="0" cellspacing="0" background="/images/main/all_bgl02.gif">
                                <tr> 
                                  <td><img src="/images/main/blank.gif" width="1" height="2"></td>
                                </tr>
                              </table>
                              <table width="100%" border="0" cellpadding="0" cellspacing="0" background="/images/main/all_bgl02.gif">
                                <tr> 
                                  <td><img src="/images/main/blank.gif" width="1" height="2"></td>
                                </tr>
                              </table>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/main/blank.gif" width="1" height="7"></td>
                                </tr>
                              </table>
                              
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table12">
				<tr> 
					<td align="center"><a href="ftp://filedown.mgame.com/pub/wizgate/o2jam/o2jam_setup.exe"><img src="/images/main/main_login_but_down01.gif" width="77" height="33" border="0"></a></td>
					<td align="center"><img src="/images/main/main_login_but_nick01.gif" width="77" height="33" border="0" style="cursor:hand" onclick="javascript:alert('�α��� �ϼ���~!');frmLogin.mgid.focus();"></td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table13">
				<tr> 
					<td><img src="http://image.o2jam.com/images01/main/blank.gif" width="1" height="5"></td>
				</tr>
			</table>
		</td>
		<td background="/images/main/main_login_table_r.gif"><img src="/images/main/main_login_table_r.gif" width="8" height="8"></td>
	</tr>
	<tr> 
		<td width="8" height="5"><img src="/images/main/main_login_table_bl.gif" width="8" height="5"></td>
		<td background="/images/main/main_login_table_b.gif"><img src="/images/main/main_login_table_b.gif" width="2" height="5"></td>
		<td><img src="/images/main/main_login_table_br.gif" width="8" height="5"></td>
	</tr>
</table>
<!--�α׾ƿ� �κ� ��-->


<!--������ �α���-->
<% ElseIf Len(Request.Cookies("MGAME")("ID")) > 0 Then %>
<%
	'������ �г����� ������ ������ �г����� �Ҵ��Ѵ�
	If Len(Request.Cookies("O2Jam")("chkNick")) <= 0 Then
		Dim objDBConnLogin, objRsLogin, objRsAvatar, strSqlLogin, strSqlAvatar
		Dim O2JamNickName
		Dim FILE_PATH
		
		'���� �г��� ��񿡼� �����´�~
		Set objDBConnLogin = Server.CreateObject("ADODB.Connection")
		objDBConnLogin.Open Application("c_Connection_ConnectionString")
			
		strSqlLogin 	= "P_o2jam_UserID_check '" & Request.Cookies("MGAME")("ID") &"'"
		Set objRsLogin = objDBConnLogin.Execute(strSqlLogin)
		
		'��� ������ ���̵� �г������� �Ҵ�, ������ �ִ°� �Ҵ�			
		If objRsLogin.EOF Or objRsLogin.BOF Then
			O2JamNickName = Request.Cookies("MGAME")("ID")
		Else
			O2JamNickName = objRsLogin.Fields("USER_NICKNAME").Value
		End If
			
		objRsLogin.Close
		Set objRsLogin = Nothing
			
		'�ƹ�Ÿ �̹��� ��� ������
		If Len(Request.Cookies("O2Jam")("O2JamAvatarPATH")) <= 0 Then
			strSqlAvatar = "P_o2jam_load_char_add '" & Trim(Request.Cookies("MGAME")("ID")) & "'"
			Set objRsAvatar = objDBConnLogin.Execute(strSqlAvatar)
			
			If objRsAvatar.EOF Or objRsAvatar.BOF Then '���ε��� �̹����� ������� ����Ʈ�� �ѷ���
				If Request.Cookies("MGAME")("SEX") = 1 Then '����
					FILE_PATH = "/O2jamFile/Avatar/avatar_man_normal_main.gif"
				Elseif Request.Cookies("MGAME")("SEX") = 2 Then '����
					FILE_PATH = "/O2jamFile/Avatar/avatar_woman_normal_main.gif"
				Else '��Ű���� �� ������
					FILE_PATH = "/O2jamFile/Avatar/avatar_woman_normal_main.gif"
				End If
			Else
				FILE_PATH = Trim(objRsAvatar.Fields("FILE_PATH").Value)
			End If
			
			objRsAvatar.Close
			Set objRsAvatar = Nothing
			
		End If
		
		
		objDBConnLogin.Close
		Set objDBConnLogin = Nothing
				
		Response.Cookies("O2Jam")("chkNick")	= O2JamNickName
		Response.Cookies("O2Jam")("O2JamAvatarPATH") = FILE_PATH
		Response.Cookies("O2Jam")("NICK")	= O2JamNickName

	End If
%>
<% 
	'''= NX-SSF �Ⱓ���� �α����ϸ� �̺�Ʈ �������� �̵�	
	'''= NX �̺�Ʈ �Ⱓ���� �ѽ����� ����
	'''= �̺�Ʈ ���� nx_main.asp ���� 
	'''= Response.Cookies ("O2Jam")("chkViewEvent") = "y" ������
	If Trim(Request.Cookies ("O2Jam")("chkViewEvent")) <> "y" Then 
%>
<script language="javascript">
	window.parent.location.href = "/nx/nx_main.asp";	
</script>
<% End If %>

<script language="javascript">	
	function popNickChange()
	{
		window.open("/member/nickname/nickname.asp", "nickchange", "width=422,height=237");
	}
	
	function fnShowAvatar(chk)
	{		
		if(chk =="MGame")
		{
			document.images["imgSelectO2Jam"].src = "/images/main/main_login_but_ava_o2_off.gif";
			document.images["imgSelectMGame"].src = "/images/main/main_login_but_ava_m_on.gif";
			
			document.all["divO2jamAvatar"].style.display = "none";
			document.all["divO2jamNickName"].style.display = "none";
			document.all["divMGameAvatar"].style.display = "block";
		}
		else
		{
			document.images["imgSelectO2Jam"].src = "/images/main/main_login_but_ava_o2_on.gif";
			document.images["imgSelectMGame"].src = "/images/main/main_login_but_ava_m_off.gif";
			
			document.all["divO2jamAvatar"].style.display = "block";
			document.all["divO2jamNickName"].style.display = "block";
			document.all["divMGameAvatar"].style.display = "none";
		}
	}
</script>
<!--�α��� �κ�-->

<div id="Layer1" style="position:absolute; left:8px; top:8px; width:165px; height:187px; z-index:1"><img src="/images/main/main_login_top01.gif" width="166" height="188"></div>
<div id="divO2jamNickName" style="position:absolute;left:15px;top:25px;width:163px;height:25px;z-index:2">
<% If Not(Request.Cookies("O2Jam")("O2JamAvatarPATH") = "/O2jamFile/Avatar/avatar_man_normal_main.gif" or Request.Cookies("O2Jam")("O2JamAvatarPATH") = "/O2jamFile/Avatar/avatar_woman_normal_main.gif") Then %>
	<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center"><span style="color:#FFFFFF;font-weight:bolder"><%=Request.Cookies("O2Jam")("NICK")%></span></td></tr></table>
<% End If %>
</div>
	<table border="0" cellspacing="0" cellpadding="0" align=center>
		<tr> 
			<td width="8" height="8"><img src="/images/main/main_login_table_tl.gif" width="8" height="8"></td>
			<td background="/images/main/main_login_table_t.gif"><img src="/images/main/main_login_table_t.gif" width="2" height="8"></td>
			<td width="8" height="8"><img src="/images/main/main_login_table_tr.gif" width="8" height="8"></td>
		</tr>
		<tr> 
			<td background="/images/main/main_login_table_l.gif"><img src="/images/main/main_login_table_l.gif" width="8" height="2"></td>
			<td height="225" align="center" valign="top"> 
				<div id="divO2jamAvatar" style="display:block">					
				<table width="155" height="188" border="0" cellpadding="0" cellspacing="0">
					<tr> 
						<td bgcolor="#CACACA" background="http://o2file.mgame.com/O2jamFile/Avatar/avatar_back.jpg"><img src="http://o2file.mgame.com<%=Trim(Request.Cookies("O2Jam")("O2JamAvatarPATH"))%>" width="166" height="188"></td>
					</tr>
				</table>
				</div>
				<div id="divMGameAvatar" style="display:none">				
				<table width="155" height="178" border=0 cellspacing="0" cellpadding="0" ID="Table15">
					<tr> 
						<td><img src="/images/main/blank.gif" width="1" height="5"></td>
					</tr>
					<tr> 
						<td class=font06 align=center><%=UCASE(Request.Cookies("MGAME")("ID"))%></td>
					</tr>
					<tr> 
						<td style="padding:5 0 0 0px" align=center height="120" width="150"><iframe scrolling=no name=avatar width=120 height=150 src=http://www.mgame.com/avatar/avatar_main.asp marginheight=0 marginwidth=0 frameborder=0 align=middle scrollbar=no>���� �ƹ�Ÿ</iframe></td>
					</tr>						 			
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr> 
						<td><img src="/images/main/blank.gif" width="1" height="10"></td>
					</tr>
				</table>				
				</div>
				<table width="166" border="0" cellspacing="0" cellpadding="0">
					<tr> 
						<td><img src="/images/main/main_login_but_ava_o2_on.gif" width="83" height="21" border="0" name="imgSelectO2Jam" onClick="fnShowAvatar('O2Jam')" style="cursor:hand"></td>
						<td><img src="/images/main/main_login_but_ava_m_off.gif" width="83" height="21" border="0" name="imgSelectMGame" onClick="fnShowAvatar('MGame')" style="cursor:hand"></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr> 
						<td><img src="/images/main/blank.gif" width="1" height="5"></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table19">
					<tr> 
						<td align="center"><a href="ftp://filedown.mgame.com/pub/wizgate/o2jam/o2jam_setup.exe"><img src="/images/main/main_login_but_down.gif" width="77" height="44" border="0"></a></td>
						<td align="center"><img src="/images/main/main_login_but_nick.gif" width="77" height="44" border="0" onClick="popNickChange()" style="cursor:hand"></td>
					</tr>
				</table>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr> 
						<td><img src="/images/main/blank.gif" width="1" height="5"></td>
					</tr>
				</table>
			</td>
			<td background="/images/main/main_login_table_r.gif"><img src="images/main/main_login_table_r.gif" width="8" height="2"></td>
		</tr>
		<tr> 
			<td width="8" height="5"><img src="/images/main/main_login_table_bl.gif" width="8" height="5"></td>
			<td background="/images/main/main_login_table_b.gif"><img src="/images/main/main_login_table_b.gif" width="2" height="5"></td>
			<td><img src="/images/main/main_login_table_br.gif" width="8" height="5"></td>
		</tr>
	</table>		
<!--�����ӷα��� �κг�-->


<!--�����̵�� �α���-->
<% ElseIf Len(Request.Cookies("O2Jam")("memberID")) > 0 Then %>
<%
	'�ƹ�Ÿ �̹��� ��� ������
	If Len(Request.Cookies("O2Jam")("O2JamAvatarPATH")) <= 0 Then
		
		Set objDBConnLogin = Server.CreateObject("ADODB.Connection")
		objDBConnLogin.Open Application("c_Connection_ConnectionString")
				
		strSqlLogin 	= "P_o2jam_UserID_check '" & Trim(Request.Cookies("O2Jam")("GameMemberID")) &"'"
		Set objRsLogin = objDBConnLogin.Execute(strSqlLogin)
		
		'��� ������ ���̵� �г������� �Ҵ�, ������ �ִ°� �Ҵ�			
		If objRsLogin.EOF Or objRsLogin.BOF Then
			O2JamNickName = Request.Cookies("O2Jam")("memberID")
		Else
			O2JamNickName = objRsLogin.Fields("USER_NICKNAME").Value
		End If
			
		objRsLogin.Close
		Set objRsLogin = Nothing
				
		strSqlAvatar = "P_o2jam_load_char_add '" & Trim(Request.Cookies("O2Jam")("GameMemberID")) & "'"
		Set objRsAvatar = objDBConnLogin.Execute(strSqlAvatar)
			
		If objRsAvatar.EOF Or objRsAvatar.BOF Then '���ε��� �̹����� ������� ����Ʈ�� �ѷ���
			If Request.Cookies("O2Jam")("memberSex") = "m" Then '����
				FILE_PATH = "/O2jamFile/Avatar/avatar_man_normal_main.gif"
			Elseif Request.Cookies("O2Jam")("memberSex") = "f" Then '����
				FILE_PATH = "/O2jamFile/Avatar/avatar_woman_normal_main.gif"
			Else '��Ű���� �� ������
				FILE_PATH = "/O2jamFile/Avatar/avatar_woman_normal_main.gif"
			End If
		Else
			FILE_PATH = Trim(objRsAvatar.Fields("FILE_PATH").Value)
		End If
		
		objRsAvatar.Close
		Set objRsAvatar = Nothing
		objDBConnLogin.Close
		Set objDBConnLogin = Nothing
				
		Response.Cookies("O2Jam")("memberNick") = O2JamNickName
		Response.Cookies("O2Jam")("O2JamAvatarPATH") = FILE_PATH
	End If
%>
<% 
	'''= NX-SSF �Ⱓ���� �α����ϸ� �̺�Ʈ �������� �̵�	
	'''= NX �̺�Ʈ �Ⱓ���� �ѽ����� ����
	'''= �̺�Ʈ ���� nx_main.asp ���� 
	'''= Response.Cookies ("O2Jam")("chkViewEvent") = "y" ������
	If Trim(Request.Cookies ("O2Jam")("chkViewEvent")) <> "y" Then 
%>
<script language="javascript">
	window.parent.location.href = "/nx/nx_main.asp";	
</script>
<% End If %>

<script language="javascript">	
	function popNickChange()
	{
		window.open("/member/nickname/nickname.asp", "nickchange", "width=422,height=237");
	}
</script>
<!--�α��� �κ�-->

<div id="Layer1" style="position:absolute; left:8px; top:8px; width:165px; height:187px; z-index:1"><img src="/images/main/main_login_top01.gif" width="166" height="188"></div>
<div id="divO2jamNickName" style="position:absolute;left:15px;top:25px;width:163px;height:25px;z-index:2">
<% If Not(Request.Cookies("O2Jam")("O2JamAvatarPATH") = "/O2jamFile/Avatar/avatar_man_normal_main.gif" or Request.Cookies("O2Jam")("O2JamAvatarPATH") = "/O2jamFile/Avatar/avatar_woman_normal_main.gif") Then %>
	<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center"><span style="color:#FFFFFF;font-weight:bolder"><%=Request.Cookies("O2Jam")("memberNick")%></span></td></tr></table>
<% End If %>
</div>
<table width="182" border="0" cellpadding="0" cellspacing="0" ID="Table14">
	<tr> 
		<td width="8" height="8"><img src="/images/main/main_login_table_tl.gif" width="8" height="8"></td>
		<td background="/images/main/main_login_table_t.gif"><img src="/images/main/main_login_table_t.gif" width="2" height="8"></td>
		<td width="8" height="8"><img src="/images/main/main_login_table_tr.gif" width="8" height="8"></td>
	</tr>
	<tr> 
		<td background="/images/main/main_login_table_l.gif"><img src="/images/main/main_login_table_l.gif" width="8" height="2"></td>
		<td>
			<table width="155" height="188" border="0" cellpadding="0" cellspacing="0" ID="Table15">
				<tr> 
					<!--���⿡ �ƹ�Ÿ ���ϴ�-->
					<td bgcolor="#CACACA" background="http://o2file.mgame.com/O2jamFile/Avatar/avatar_back.jpg"><img src="http://o2file.mgame.com<%=Trim(Request.Cookies("O2Jam")("O2JamAvatarPATH"))%>" width="166" height="188"></td>
					
					<!--���⿡ �ƹ�Ÿ ���ϴ� ��-->
				</tr>
			</table>
			<%
			'''= �α׾ƿ��Ŀ� ���ϵ� ��� �����ϴ� �κ��Դϴ�.
			
			strRedirectURL = "http://" & Request.ServerVariables ("HTTP_HOST") & Request.ServerVariables("PATH_INFO")
																	
			If Len(Request.ServerVariables("QUERY_STRING")) > 0 Then
				strRedirectURL = strRedirectURL & "?" & Request.ServerVariables("QUERY_STRING")
			End If
																	
			strRedirectURL = Server.URLEncode(strRedirectURL)
			%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td><img src="/images/main/main_login_but_logout.gif" height="21" onClick="subLogOut('<%=strRedirectURL%>');" style="cursor:hand"></td>
			    <td><img src="/images/main/main_login_but_logout_right.gif"  height="21"></td>
			  </tr>
			</table>
			<script language="javascript">
				function subLogOut(strURL) {
					if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?") == true) {
						location.href = "/member/logout.asp?RedirectURL=" + strURL;
					}
				}
			</script>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table16">
				<tr> 
					<td><img src="http://image.o2jam.com/images01/main/blank.gif" width="1" height="5"></td>
				</tr>
			</table>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" background="/images/main/all_bgl02.gif">
			  <tr> 
			    <td><img src="/images/main/blank.gif" width="1" height="2"></td>
			  </tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table18">
				<tr> 
					<td><img src="http://image.o2jam.com/images01/main/blank.gif" width="1" height="5"></td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table19">
				<tr> 
					<td align="center"><a href="ftp://filedown.mgame.com/pub/wizgate/o2jam/o2jam_setup.exe"><img src="/images/main/main_login_but_down01.gif" width="77" height="33" border="0"></a></td>
					<td align="center"><img src="/images/main/main_login_but_nick01.gif" width="77" height="33" border="0" onClick="popNickChange()" style="cursor:hand"></td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" ID="Table20">
				<tr> 
					<td><img src="http://image.o2jam.com/images01/main/blank.gif" width="1" height="5"></td>
				</tr>
			</table>
		</td>
		<td background="/images/main/main_login_table_r.gif"><img src="/images/main/main_login_table_r.gif" width="8" height="2"></td>
	</tr>
	<tr> 
		<td width="8" height="5"><img src="/images/main/main_login_table_bl.gif" width="8" height="5"></td>
		<td background="/images/main/main_login_table_b.gif"><img src="/images/main/main_login_table_b.gif" width="2" height="5"></td>
		<td><img src="/images/main/main_login_table_br.gif" width="8" height="5"></td>
	</tr>
</table>
<!--�α��� �κг�-->
<% End if %>
</body>
</html>
