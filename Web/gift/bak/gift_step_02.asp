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
		Response.Write "<script>alert('�û���Ϣ���� !');history.back();</script>"

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
<%If ToWhoID = gameid Then '�ڽſ��� �����Ҽ��� ����...%>
<script language = "javascript">
	alert("���ܷ�����Ʒ���Լ�.\n����.")
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
		alert("����������ǳƲ�����.\n���ٴμ��.")
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
<title>�����</title>
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
	                <td width="17%">��������</td>
				<%ElseIf gFlag = "S" Then%>
	                <td width="17%">����</td>
				<%ElseIf gFlag = "T" Then%>
	                <td width="17%">��װ</td>
				<%End If%>
                <td width="37%" class="txtYellowB"><%=gName%></td>
                <td width="16%" class="txtWhiteB">
				<%If i_price <> 0 Then%>
					<%=FormatNumber(i_price,0)%> ��
				<%ElseIf i_gem <> 0 Then%>
					<%=FormatNumber(i_gem,0)%> GEM
				<%End If%>
				</td>
                <td width="14%" ><%=i_point%>��</td>
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
		response.write "<br><br><span style=""font-size: 9pt"" ><font color='white'>����δ�ɹ��������ǶԷ����Ա�����Ʒ��ƥ�䣬��Է��Ѿ�ӵ���˸���Ʒ���뷵�ز�������ԣ�</font></span><br><br>"
		End If

		objDBrs.Close
		Set objDBrs = Nothing
		
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
		
		strCashMethod = Trim(strCashMethod)
				
		If InStr(1, strCashMethod, "I") > 0 and InStr(1, strCashMethod, "S") > 0 Then '�����۰� ������ �����Ҷ�
			strCashType = 3
		ElseIf InStr(1, strCashMethod, "I") > 0 and InStr(1, strCashMethod, "S") = 0 Then '�����۸� �����Ҷ�
			strCashType = 1
		ElseIf InStr(1, strCashMethod, "I") = 0 and InStr(1, strCashMethod, "S") > 0 Then '������ �����Ҷ�
			strCashType = 2
		Else
			'Response.Write "<script>alert('�����г���û����ӵ�еĵ��߻���ѡ��ĵ���.');//history.back();</script>"
			'Response.End
		End If
				
		'strCashType �� 1 �̸� ��� �ƹ�Ÿ	(PC, OC, AC)
		'strCashType �� 2 �̸� ��� ��			(PC, OC, MC)
		'strCashType �� 3 �̸� ȥ��				(PC, OC)
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
                <td align="right" class="txtWhite">������(<span class="txtYellowB"><strong><%=ea%></strong></span>��Ʒ�嵥) 
                  : <span class="txtYellowB"><%=FormatNumber(sum,0)%> �� / <%=FormatNumber(sumGem,0)%> Gem</span>(������ : <%=FormatNumber(sumPoint,0)%>��)</td>
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
					<td valign=top><!-- *֧��ʱʹ�õĴ������ܴ���. --></td>
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
				<% If sum < 1 and sumGem > 0 Then '�� ������ ���Ǳ��� %>
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
												
					<% If strCashType = 1 Then '�ƹ�Ÿ �������� ���%>
						<td width="25%"><input type=radio name="chkCashType" value="PC"<%If MCash < sum Then%> disabled<%End If%>><b>MCASH</b>(<%=FormatNumber(MCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="OC"<%If O2Cash < sum Then%> disabled<%End If%>><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="AC"<%If ItemCash < sum Then%> disabled<%End If%>><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="MC" disabled><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%>)</td>
					<% ElseIf strCashType = 2 Then '���� �������� ���%>
						<td width="25%"><input type=radio name="chkCashType" value="PC"<%If MCash < sum Then%> disabled<%End If%>><b>MCASH</b>(<%=FormatNumber(MCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="OC"<%If O2Cash < sum Then%> disabled<%End If%>><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="AC" disabled><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%>)</td>
						<td width="25%"><input type=radio name="chkCashType" value="MC"<%If MusicCash < sum Then%> disabled<%End If%>><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%>)</td>
					<% ElseIf strCashType = 3 Then 'ȥ�� �������� ���%>
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
			    <td align="right" class="txtDarkblue"><font color="#CC3300"><b>��������������: </b></font></td>
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
      
      			<!-- ���� �ֹ��ϴ� �� Gem -->
				<input type="hidden" name="sumGem" value="<%=sumGem%>">
				<!-- ���� �������ִ� �� ��ĳ�� -->
				<input type="hidden" name="total_mcash" value="<%=intMoney%>">
				<!-- �� �ֹ��� -->
				<input type=hidden name=orderprice value="<%=sum%>">
				<!-- ������ ���̵� -->
				<input type="hidden" name="gameid" value="<%=gameid%>">
				<!-- ���� ��ǰ���ڵ� -->
				<input type="hidden" name="SumPid" value="<%=SumPid%>">
				<!-- ���� ��ǰ�� -->
				<input type="hidden" name="SumgName" value="<%=SumgName%>">
				<!-- �޸𿡳��� ��ǰ�� -->
				<input type="hidden" name="MemoContent" value="<%=MemoContent%>">
				<!-- �޸� -->
				<input type="hidden" name="memo" value="<%=memo%>">
				<!-- �����ְ����ϴ� ��� �г��� -->
				<input type="hidden" name="memberNick" value="<%=memberNick%>">
				<!-- �����ְ����ϴ� ��� ���̵� -->
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
	ans = confirm("ɾ��ѡ����Ŀ.")
	if(ans == true){
		document.location.href = "cart_del_ok.asp?gameid="+gameid+"&memberNick="+memberNick+"&memo="+memo+"&seq=" + seq
	}	
}

function delitALL(gameid,memberNick,memo)
{
	ans = confirm("ɾ���������������Ʒ.")
	if(ans == true){
		document.location.href = "cart_del_ok.asp?gameid="+gameid+"&memberNick="+memberNick+"&memo="+memo
	}	
}

function sendit()
{
	var OnlyGem = order_info.chkCashOnlyGem.value;
	var GemABLE = order_info.chkCashGemABLE.value;
		
	//�븸���� ���Ǳ���
	if (OnlyGem == 'Y') {
		if (GemABLE == 'N') {
			alert('Gem <%=formatnumber(sumGem - gem, 0)%> ����.');
			return false;
		}
	}
		
	else {
		if (GemABLE == 'N') {
			alert('Gem <%=formatnumber(sumGem - gem, 0)%> ����.');
			return false;
		}
			
		var chkCashTypeVAR = 'N';
		
		for (i=0;i<4;i++) {
			if (order_info.chkCashType[i].checked) {chkCashTypeVAR = 'Y';}
		}
		
		if (chkCashTypeVAR == 'N') {
			alert('��ѡ��֧����ʽ!');
			return false;
		}
	}
		
	objInput = order_info.UserPwd;
	if(fnTrim(objInput.value) == "")
	{
		alert("����������");
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