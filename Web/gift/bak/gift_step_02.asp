<%
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open(Application("Connection_ConnectionString"))

Set Conn1 = Server.CreateObject("ADODB.Connection")
Conn1.Open(Application("c_Connection_ConnectionString"))


	gameid	 		= UCASE(request("gameid"))
	memberNick		= request.Form("memberNick")
	memo			= request.Form("memo")
	chkIDNick		= Request.Form("chkIDNick")

	If chkIDNick = "id" Then
		strSQL 	= "P_O2JAM_USERID_CHECK '" & memberNick & "'"
	Else
		strSQL 	= "P_O2JAM_NICKNAME_CHECK '" & memberNick & "'"
	End If
	
	Set objDBrs 	= Conn1.Execute(strSQL)
	If Not(objDBrs.BOF or objDBrs.EOF) Then
		ToWhoID			= objDBrs("USER_ID")
		ToWhoID 		= UCASE(ToWhoID) 
		ToWhoNickName 	= objDBrs("USER_NICKNAME")
	End If
	objDBrs.Close
	Set objDBrs = Nothing
	
	strSQL = "P_O2JAM_MY_SIMPLE_INFO '"& gameid &"'"
	Set objDBrs = Conn1.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) Then
		USER_INDEX_ID	= objDBrs("USER_INDEX_ID")
		USER_ID			= objDBrs("USER_ID")
		USER_NICKNAME	= objDBrs("USER_NICKNAME")
		SEX				= objDBrs("SEX")
	Else
		Response.Write "<script>alert('用户信息出错 !');history.back();</script>"

		objDBrs.Close
		Set objDBrs = Nothing
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
		Response.End
	End If
%>

<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>
<body bgcolor="#67BAF0" topmargin="0" leftmargin="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
</BODY>
</HTML>
<%If ToWhoID = gameid Then '磊脚俊霸 急拱且荐绰 绝促...%>
<script language = "javascript">
	alert("不能发送赠品给自己.\n请检查.")
	document.location.href = "gift_step_01.asp?gameid=<%=gameid%>"
</script>
	<%
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
		
		Response.End
	%>
<%End If%>
<%If ToWhoNickName = "" Then%>
	<script language = "javascript">
		alert("你所输入的昵称不存在.\n请再次检查.")
		document.location.href = "gift_step_01.asp?gameid=<%=gameid%>"
	</script>
	<%
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
		
		Response.End
	%>
<%End IF%>

<html>
<head>
<title>购物袋</title>
<style type="text/css">
<!--
body{
scrollbar-face-color: #C0DCF6; scrollbar-shadow-color: #5DA5E8; 
scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#C0DCF6; 
scrollbar-darkshadow-color:#1D76C9; scrollbar-track-color: #4FA5EB; 
scrollbar-arrow-color:#114677;} 
--> 
</style>

<!--#include virtual="/gift/INC_VIEW_USERCASH.asp"-->
<link href="payment.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#67BAF0" topmargin="0" leftmargin="0">
<!-- #include virtual="/gift/progressbar.asp" --> 
<table width="710" border="0" cellspacing="0" cellpadding="0"><form  method = "post"  name="order_info" action = "gift_step_03.asp" onSubmit="return sendit()">
  <tr> 
    <td width="20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/payment/payment_title_shop.gif" width="86" height="44"></td>
		  <td align="right">
		<%
			strSQL 	= "Select Count(i_seq) From TB_GIFT_IMSI_CART Where memberID='"& gameid &"'"
			Set objDBrs	= Conn.Execute(strSQL)
			totalRecord = objDBrs(0)
		%>
		<%If totalRecord = 0 Then%>
			<img src="/images/payment/payment_but_back_off.gif" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_back_on.gif'" onMouseOut="this.src='/images/payment/payment_but_back_off.gif'">
			<img src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'">
		<%Else%>
			<a href="gift_step_01.asp?gameid=<%=gameid%>" onfocus='this.blur()'><img src="/images/payment/payment_but_back_off.gif" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_back_on.gif'" onMouseOut="this.src='/images/payment/payment_but_back_off.gif'"></a>
			<input type="image" src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'" >
		<%End If %>
		<%
		objDBrs.Close
		Set objDBrs = Nothing
		%>
	</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr valign="bottom">
          <td width="10%"><img src="/images/payment/payment_word_num.gif" width="40" height="20"></td>
          <td width="17%"><img src="/images/payment/payment_word_sort.gif" width="62" height="20"></td>
          <td><img src="/images/payment/payment_word_product.gif" height="20"></td>
          <td width="16%"><img src="/images/payment/payment_word_cash.gif" width="35" height="20"></td>
          <td width="12%"><img src="/images/payment/payment_word_point.gif" width="45" height="20"></td>
          <td width="8%"><img src="/images/payment/payment_word_delete.gif" width="26" height="15"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="9" height="9"><img src="/images/payment/payment_table01_tl.gif" width="9" height="9"></td>
          <td background="/images/payment/payment_table01_t.gif"><img src="/images/payment/payment_table01_t.gif" width="1" height="9"></td>
          <td width="9" height="9"><img src="/images/payment/payment_table01_tr.gif" width="9" height="9"></td>
        </tr>
        <tr>
          <td background="/images/payment/payment_table01_l.gif"><img src="/images/payment/payment_table01_l.gif" width="9" height="1"></td>
          <td align="center" bgcolor="#0075BA">
<%
	strSQL 	= "SELECT Count(i_seq) FROM TB_GIFT_IMSI_CART WHERE memberID='"& gameid &"'"
	Set objDBrs	= Conn.Execute(strSQL)
	totalRecord = objDBrs(0)
	
	objDBrs.Close
	Set objDBrs = Nothing

	strSQL = "SELECT i_seq,memberID,pid,gName,i_gem,i_price,i_point,gFlag,regDate FROM TB_GIFT_IMSI_CART Where memberID='"& gameid &"'"  
	Set objDBrs	= Conn.Execute(strSQL)
	
	If Not(objDBrs.BOF or objDBrs.EOF) Then
		i = 1
		ea = 0
		sum = 0
		sumPoint = 0
		sumGem = 0
		
		strCashMethod = ""

		Do until objDBrs.EOF	
			i_seq 		= objDBrs(0)
			memberID 	= objDBrs(1)
			pid 			= objDBrs(2)
			gName 		= objDBrs(3)
			i_gem	 	= objDBrs(4)
			i_price		= objDBrs(5)
			i_point		= objDBrs(6)
			gFlag 		= objDBrs(7)
			regDate		= objDBrs(8)
			%>		
			<table width="98%" border="0" cellspacing="0" cellpadding="3">
              <tr class="txtWhite">
                <td width="11%"><%=i%></td>
				<%If gFlag = "I" Then%>
	                <td width="17%">人物形象</td>
				<%ElseIf gFlag = "S" Then%>
	                <td width="17%">音乐</td>
				<%ElseIf gFlag = "T" Then%>
	                <td width="17%">套装</td>
				<%End If%>
                <td width="37%" class="txtYellowB"><%=gName%></td>
                <td width="16%" class="txtWhiteB">
				<%If i_price <> 0 Then%>
					<%=FormatNumber(i_price,0)%> 点
				<%ElseIf i_gem <> 0 Then%>
					<%=FormatNumber(i_gem,0)%> GEM
				<%End If%>
				</td>
                <td width="14%" ><%=i_point%>盔</td>
                <td width="8%"><a href="javascript:delit('<%=i_seq%>','<%=gameid%>','<%=memberNick%>','<%=memo%>')" onfocus='this.blur()'><img src="/images/payment/payment_but_delete_off.gif" name="image01" width="16" height="15" border="0" onMouseOver="this.src='/images/payment/payment_but_delete_on.gif'" onMouseOut="this.src='/images/payment/payment_but_delete_off.gif'"></a></td>
              </tr>
            </table>
			<%If gFlag = "T" Then%>
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
              </tr>
            </table>
			<!-- #include virtual="/gift/gift_detail_item_view.asp" -->
			<%End If%>
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
              </tr>
            </table>
			<% 
			    objDBrs.Movenext

				If i = 1 Then
					SumPid = pid 		
				Else
					SumPid = pid 
				End If

				If i = 1 Then
					SumgName = gName
					MemoContent = SumgName 		
				Else
					SumgName = gName 
					MemoContent = MemoContent& "," &gName 
				End If

				ea = ea + 1
				sum = sum + i_price
				sumPoint = sumPoint + i_point
				sumGem = sumGem + i_Gem
			    i = i + 1
				
				If Not(gFlag = "T") Then
					strCashMethod = strCashMethod & gFlag
				End If
		    Loop
		else
		response.write "<br><br><span style=""font-size: 9pt"" ><font color='white'>赠送未成功，可能是对方的性别与物品不匹配，或对方已经拥有了该物品，请返回查验后重试！</font></span><br><br>"
		End If

		objDBrs.Close
		Set objDBrs = Nothing
		
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
		
		strCashMethod = Trim(strCashMethod)
				
		If InStr(1, strCashMethod, "I") > 0 and InStr(1, strCashMethod, "S") > 0 Then '酒捞袍苞 孤流捞 粮犁且锭
			strCashType = 3
		ElseIf InStr(1, strCashMethod, "I") > 0 and InStr(1, strCashMethod, "S") = 0 Then '酒捞袍父 粮犁且锭
			strCashType = 1
		ElseIf InStr(1, strCashMethod, "I") = 0 and InStr(1, strCashMethod, "S") > 0 Then '孤流父 粮犁且锭
			strCashType = 2
		Else
			'Response.Write "<script>alert('结算中出错，没有所拥有的道具或所选择的道具.');//history.back();</script>"
			'Response.End
		End If
				
		'strCashType 捞 1 捞搁 葛滴 酒官鸥	(PC, OC, AC)
		'strCashType 捞 2 捞搁 葛滴 邦			(PC, OC, MC)
		'strCashType 捞 3 捞搁 去钦				(PC, OC)
		%>
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
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
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="right" class="txtWhite">总数量(<span class="txtYellowB"><strong><%=ea%></strong></span>物品清单) 
                  : <span class="txtYellowB"><%=FormatNumber(sum,0)%> 点 / <%=FormatNumber(sumGem,0)%> Gem</span>(储备金 : <%=FormatNumber(sumPoint,0)%>点)</td>
                <td width="60" align="right" ><a href="javascript:delitALL('<%=gameid%>','<%=memberNick%>','<%=memo%>')" onfocus='this.blur()'><img src="/images/payment/payment_but_all_delete_off.gif" width="54" height="20" onMouseOver="this.src='/images/payment/payment_but_all_delete_on.gif'" onMouseOut="this.src='/images/payment/payment_but_all_delete_off.gif'" border="0"></a></td>
              </tr>
            </table>
            
          </td>
          <td background="/images/payment/payment_table01_r.gif"><img src="/images/payment/payment_table01_r.gif" width="9" height="1"></td>
        </tr>
        <tr>
          <td width="9" height="9"><img src="/images/payment/payment_table01_bl.gif" width="9" height="9"></td>
          <td background="/images/payment/payment_table01_b.gif"><img src="/images/payment/payment_table01_b.gif" width="1" height="9"></td>
          <td width="9" height="9"><img src="/images/payment/payment_table01_br.gif" width="9" height="9"></td>
        </tr>
      </table> 
      <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <td class="txtDarkblue">
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="txtDarkblue">
				<tr>
					<td valign=top><!-- *支付时使用的储备金不能储备. --></td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td></tr>
				<tr><td background="/images/payment/payment_bg01.gif"><img src="/images/main/blank.gif" width="1" height="2"></td></tr>
				<tr><td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td></tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="txtDarkblue">
				<tr><td colspan=4><img src="/images/payment/payment_word06.gif" width="165" height="14"></td></tr>
				<tr align=center>
				<% If sum < 1 and sumGem > 0 Then '离 父栏肺 拱扒备概 %>
					<input type=hidden name="chkCashOnlyGem" value="Y">
					<% If sumGem > Gem Then %>
						<input type=hidden name="chkCashGemABLE" value="N">
					<% Else %>
						<input type=hidden name="chkCashGemABLE" value="Y">
					<% End If %>
					<td width="25%"><input type=radio name="chkCashType" value="PC" disabled><b>MCASH</b>(<%=FormatNumber(MCash,0)%>)</td>
					<td width="25%"><input type=radio name="chkCashType" value="OC" disabled><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%>)</td>
					<td width="25%"><input type=radio name="chkCashType" value="AC" disabled><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%>)</td>
					<td width="25%"><input type=radio name="chkCashType" value="MC" disabled><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%>)</td>
				<% Else %>
					<input type=hidden name="chkCashOnlyGem" value="N">
					<% If sumGem > Gem Then %>
						<input type=hidden name="chkCashGemABLE" value="N">
					<% Else %>
						<input type=hidden name="chkCashGemABLE" value="Y">
					<% End If %>
												
					<% If strCashType = 1 Then '酒官鸥 酒捞袍老 版快%>
						<td width="25%"><input type=radio name="chkCashType" value="PC"<%If MCash < sum Then%> disabled<%End If%>><b>MCASH</b>(<%=FormatNumber(MCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="OC"<%If O2Cash < sum Then%> disabled<%End If%>><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="AC"<%If ItemCash < sum Then%> disabled<%End If%>><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="MC" disabled><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%>)</td>
					<% ElseIf strCashType = 2 Then '孤流 酒捞袍老 版快%>
						<td width="25%"><input type=radio name="chkCashType" value="PC"<%If MCash < sum Then%> disabled<%End If%>><b>MCASH</b>(<%=FormatNumber(MCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="OC"<%If O2Cash < sum Then%> disabled<%End If%>><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="AC" disabled><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="MC"<%If MusicCash < sum Then%> disabled<%End If%>><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%>)</td>
					<% ElseIf strCashType = 3 Then '去钦 酒捞袍老 版快%>
						<td width="25%"><input type=radio name="chkCashType" value="PC"<%If MCash < sum Then%> disabled<%End If%>><b>MCASH</b>(<%=FormatNumber(MCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="OC"<%If O2Cash < sum Then%> disabled<%End If%>><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="AC" disabled><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="MC" disabled><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%>)</td>
					<% End If %>
				<% End If %>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td></tr>
				<tr><td background="/images/payment/payment_bg01.gif"><img src="/images/main/blank.gif" width="1" height="2"></td></tr>
				<tr><td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td></tr>
			</table>
		</td>
		</tr>
		<tr>
			<td>
			 <br>
			<table width="100%" border="0" cellspacing="0" cellpadding="5">
			  <tr> 
			    <td align="right" class="txtDarkblue"><font color="#CC3300"><b>请输入您的密码: </b></font></td>
			    <td width="100" align="right"><input type="password" name="UserPwd" size="15" class="input02"></td>
			  </tr>			  
			</table>
		</td>
		</tr>
        <tr>
          <td class="txtDarkblue" align="right">
		<%If totalRecord = 0 Then%>
			<img src="/images/payment/payment_but_back_off.gif" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_back_on.gif'" onMouseOut="this.src='/images/payment/payment_but_back_off.gif'">
			<img src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'">
		<%Else%>
			<a href="gift_step_01.asp?gameid=<%=gameid%>" onfocus='this.blur()'><img src="/images/payment/payment_but_back_off.gif" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_back_on.gif'" onMouseOut="this.src='/images/payment/payment_but_back_off.gif'"></a>
			<input type="image" src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'">
		<%End If%>
		 </td>
        </tr>
      </table> 
      
      			<!-- 郴啊 林巩窍绰 醚 Gem -->
				<input type="hidden" name="sumGem" value="<%=sumGem%>">
				<!-- 郴啊 啊瘤绊乐绰 醚 骏某浆 -->
				<input type="hidden" name="total_mcash" value="<%=intMoney%>">
				<!-- 醚 林巩咀 -->
				<input type=hidden name=orderprice value="<%=sum%>">
				<!-- 备概磊 酒捞叼 -->
				<input type="hidden" name="gameid" value="<%=gameid%>">
				<!-- 弥辆 惑前疙内靛 -->
				<input type="hidden" name="SumPid" value="<%=SumPid%>">
				<!-- 弥辆 惑前疙 -->
				<input type="hidden" name="SumgName" value="<%=SumgName%>">
				<!-- 皋葛俊巢辨 惑前疙 -->
				<input type="hidden" name="MemoContent" value="<%=MemoContent%>">
				<!-- 皋葛 -->
				<input type="hidden" name="memo" value="<%=memo%>">
				<!-- 急拱林绊磊窍绰 惑措 葱匙烙 -->
				<input type="hidden" name="memberNick" value="<%=memberNick%>">
				<!-- 急拱林绊磊窍绰 惑措 酒捞叼 -->
				<input type="hidden" name="ToWhoID" value="<%=ToWhoID%>">

              </tr>
            </table> 
			</td>
        </tr>
      </table>
      <br>
<td width="10">&nbsp;</td>
  </tr></form>
</table>
</body>
</html>

<script language="javascript" src="/Lib/common2.js"></script>
<script language = "javascript">
<!--  
function delit(seq,gameid,memberNick,memo)
{
	ans = confirm("删除选中项目.")
	if(ans == true){
		document.location.href = "cart_del_ok.asp?gameid="+gameid+"&memberNick="+memberNick+"&memo="+memo+"&seq=" + seq
	}	
}

function delitALL(gameid,memberNick,memo)
{
	ans = confirm("删除购物袋中所有物品.")
	if(ans == true){
		document.location.href = "cart_del_ok.asp?gameid="+gameid+"&memberNick="+memberNick+"&memo="+memo
	}	
}

function sendit()
{
	var OnlyGem = order_info.chkCashOnlyGem.value;
	var GemABLE = order_info.chkCashGemABLE.value;
		
	//离父栏肺 拱扒备概
	if (OnlyGem == 'Y') {
		if (GemABLE == 'N') {
			alert('Gem <%=formatnumber(sumGem - gem, 0)%> 不足.');
			return false;
		}
	}
		
	else {
		if (GemABLE == 'N') {
			alert('Gem <%=formatnumber(sumGem - gem, 0)%> 不足.');
			return false;
		}
			
		var chkCashTypeVAR = 'N';
		
		for (i=0;i<4;i++) {
			if (order_info.chkCashType[i].checked) {chkCashTypeVAR = 'Y';}
		}
		
		if (chkCashTypeVAR == 'N') {
			alert('请选择支付方式!');
			return false;
		}
	}
		
	objInput = order_info.UserPwd;
	if(fnTrim(objInput.value) == "")
	{
		alert("请输入密码");
		objInput.value = "";
		objInput.focus();
		
		//return false;
	}
	else
	{
		//order_info.method = "POST";
		//order_info.action = "gift_step_03.asp"
		//order_info.submit();
	
		show_progressbar();
	}	
}

//-->
</script>