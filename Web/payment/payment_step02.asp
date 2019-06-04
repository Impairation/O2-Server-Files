<%
'叼厚 积己
Set Conn = Server.CreateObject ("ADODB.Connection")
Conn.Open (Application("Connection_ConnectionString"))

Set Conn1 = Server.CreateObject ("ADODB.Connection")
Conn1.Open (Application("c_Connection_ConnectionString"))

	gameid				= Trim(Request.Form ("gameid"))
	chkCashType		= Trim(Request.Form ("chkCashType"))

		
	If Trim(gameid) = "" Then
		Response.Write "<script>alert('用户信息出错.');history.back();</script>"
		Response.end
	End If

	If Trim(chkCashType) = "" Then chkCashType = "GC"

	strSQL = "P_o2jam_My_Simple_Info '"& gameid &"'"
	Set objDBrs = Conn1.Execute(strSQL)

	If Not(objDBrs.BOF or objDBrs.EOF) Then
		USER_INDEX_ID		= objDBrs("USER_INDEX_ID")
		USER_ID				= objDBrs("USER_ID")
		USER_NICKNAME		= objDBrs("USER_NICKNAME")
		SEX					= objDBrs("SEX")
	Else
		Response.Write "<script>alert('用户信息出错!');history.back();</script>"

		objDBrs.Close
		Set objDBrs = Nothing
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
	End If

	objDBrs.Close
	Set objDBrs = Nothing

%>
<!--#include virtual="/payment/INC_VIEW_USERCASH.asp"-->
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
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

<link href="payment.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#67BAF0" topmargin="0" leftmargin="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<!-- #include virtual="/payment/progressbar.asp" -->
<table width="710" border="0" cellspacing="0" cellpadding="0"><form name="order_info" method="post" action="payment_step03.asp" onSubmit="return sendit()">
  <tr> 
    <td width="20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/payment/payment_title_shop.gif" width="86" height="44"></td>
		  <td align="right">
      <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <tr> 
          <td align="right" class="txtDarkblue"><a href="payment_step01.asp?gameid=<%=gameid%>" onfocus='this.blur()'><img src="/images/payment/payment_but_back_off.gif" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_back_on.gif'" onMouseOut="this.src='/images/payment/payment_but_back_off.gif'"></a></td>
          <td width="125" align="right"><input type="image" src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'"  ></td>
        </tr>
      </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr valign="bottom"> 
          <td width="10%"><img src="/images/payment/payment_word_num.gif" width="40" height="20"></td>
          <td width="17%"><img src="/images/payment/payment_word_sort.gif" width="62" height="20"></td>
          <td><img src="/images/payment/payment_word_product.gif" height="20"></td>
          <td width="16%"><img src="/images/payment/payment_word_cash.gif" width="35" height="20"></td>
          <td width="12%"><img src="/images/payment/payment_word_point.gif" width="45" height="20"></td>
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
		'悸飘 酒捞袍 东矫
		strSQL = "SELECT gFlag, pid, i_gem ,i_price FROM TB_IMSI_CART WHERE memberID = '" & gameid & "'"
		Set objDBrs = Conn.Execute(strSQL)
		
		totalRecord_seq = 0		'急琶茄 酒捞袍 俺荐 掘绢柯促
		totalRecord_gem = 0	'急琶茄 离狼 醚 钦阑 备茄促
		totalRecord_price = 0	'急琶茄 醚 啊拜阑 备茄促
		
		Do until objDBrs.BOF or objDBrs.EOF
			If Trim(objDBrs("gFlag")) = "I" or Trim(objDBrs("gFlag")) = "S" Then
								
				totalRecord_seq = totalRecord_seq + 1
				totalRecord_gem = totalRecord_gem + int(objDBrs("i_gem"))
				totalRecord_price = totalRecord_price + int(objDBrs("i_price"))
							
			Else '悸飘 酒捞袍老 版快
							
				strSQL = "SELECT ItemType, ItemID, ItemGem, ItemMCash FROM T_O2JAM_SETITEM_DATA WHERE SetItemID = " & int(objDBrs("pid"))
				Set objDBrsChk = Conn1.Execute(strSQL)

				Do until objDBrsChk.BOF or objDBrsChk.EOF
					If 1 = int(objDBrsChk("ItemType")) Then
						strSQL 	= "p_o2jam_SETITEM_DUP_ITEM_CHECK_2 " & USER_INDEX_ID & ", " & int(objDBrsChk("ItemID"))
						Set objDBrsItemChk 	= Conn1.Execute(strSQL)
						ChkItem = objDBrsItemChk(0)
				
						objDBrsItemChk.Close
						Set objDBrsItemChk = Nothing

						If ChkItem = 1 Then
							totalRecord_seq = totalRecord_seq + 0
							totalRecord_gem = totalRecord_gem + 0
							totalRecord_price = totalRecord_price + 0
						Elseif ChkItem = 0 Then
							totalRecord_seq = totalRecord_seq + 1
							totalRecord_gem = totalRecord_gem + int(objDBrsChk("ItemGem"))
							totalRecord_price = totalRecord_price + int(objDBrsChk("ItemMCash"))
						End If
					ElseIf 2 = int(objDBrsChk("ItemType")) Then
						strSQL 	= "P_o2jam_SETITEM_DUP_MUSIC_CHECK " & USER_INDEX_ID & ", " & int(objDBrsChk("ItemID"))
						Set objDBrsItemChk 	= Conn1.Execute(strSQL)
						ChkItem = objDBrsItemChk(0)
				
						objDBrsItemChk.Close
						Set objDBrsItemChk = Nothing

						If ChkItem = 1 Then
							totalRecord_seq = totalRecord_seq + 0
							totalRecord_gem = totalRecord_gem + 0
							totalRecord_price = totalRecord_price + 0
						Elseif ChkItem = 0 Then
							totalRecord_seq = totalRecord_seq + 1
							totalRecord_gem = totalRecord_gem + int(objDBrsChk("ItemGem"))
							totalRecord_price = totalRecord_price + int(objDBrsChk("ItemMCash"))
						End If
					End If
					objDBrsChk.MoveNext
				Loop
				
				objDBrsChk.Close
				Set objDBrsChk = Nothing
			End If
			objDBrs.MoveNext
		Loop
				
		objDBrs.Close
		Set objDBrs = nothing
		
	
	strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'L'"
	Set objDBrsLoop	= Conn.Execute(strSQL)
	
	If Not(objDBrsLoop.BOF or objDBrsLoop.EOF) Then

		i = 1
		ea = 0
		sumPoint = 0
		SumPid	= ""
		SumgName	= ""

		Do until objDBrsLoop.EOF	
			i_seq 		= objDBrsLoop(0)
			memberID 	= objDBrsLoop(1)
			pid 			= objDBrsLoop(2)
			gName 		= objDBrsLoop(3)
			i_Gem	 	= objDBrsLoop(4)
			i_price 		= objDBrsLoop(5)
			i_point		= objDBrsLoop(6)
			gFlag 		= objDBrsLoop(7)
			regDate		= objDBrsLoop(8)
%>
			<table width="98%" border="0" cellspacing="0" cellpadding="3">
              <tr class="txtWhite"> 
                <td width="10%"><%=i%></td>
<%IF gFlag = "I" THEN%>
                <td width="17%">人物形象</td>
<%ELSEIF gFlag = "S" THEN%>
                <td width="17%">歌曲</td>
<%ELSEIF gFlag = "T" THEN%>
                <td width="17%" class="txtYellowB">套装</td>
<%END IF%>
                <td class="txtYellowB"><%=gName%></td>
<%IF gFlag = "T" THEN%>
               <td width="16%" class="txtYellowB">
				<%IF i_price <> 0 THEN%>
					<%=FormatNumber(i_price,0)%> Ｍ
				<%ELSEIF i_Gem <> 0 THEN%>				
					<%=FormatNumber(i_Gem,0)%> Ｇ
				<%END IF%>
			   </td>
<%ELSE%> 
               <td width="16%" class="txtWhiteB">
				<%IF i_price <> 0 THEN%>
					<%=FormatNumber(i_price,0)%> Ｍ
				<%ELSEIF i_Gem <> 0 THEN%>				
					<%=FormatNumber(i_Gem,0)%> Ｇ
				<%END IF%>
			   </td>
<%END IF%>

<%IF gFlag = "T" THEN%>
                <td width="9%" class="txtYellowB"><!-- <%=i_point%>点 --></td>
<%ELSE%>
                <td width="9%"><!-- <%=i_point%>点 --></td>
<%END IF%>
              </tr>
            </table>
<%IF gFlag = "T" THEN%>
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
              </tr>
            </table>
<!-- #include virtual="/payment/detail_item_view.asp" -->
<%END IF%>
            <table width="98%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
              </tr>
            </table>

<% 
    objDBrsLoop.Movenext

	IF i = 1 THEN
		SumPid = pid 		
	ELSE
		SumPid = pid 
	END IF

	IF i = 1 THEN
		SumgName = gName 		
	ELSE
		SumgName = gName 
	END IF

	ea = ea + 1
	sumPoint = sumPoint + i_point
	i = i + 1
    Loop
	end if

	objDBrsLoop.Close
	Set objDBrsLoop = Nothing

Conn.Close
Set Conn = Nothing
Conn1.Close
Set Conn1 = Nothing
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
                <td align="right" class="txtWhite">合计(<span class="txtYellowB"><strong><%=ea%></strong></span>种) 
                  : <span class="txtYellowB"><%=formatnumber(totalRecord_price,0)%> Ｍ / <%=formatnumber(totalRecord_Gem,0)%> Ｇ</span><!-- (储备金 : <%=formatnumber(sumPoint,0)%>点) --></td>
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
      <br><!--
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/payment/payment_title_o2cash.gif" width="124" height="27"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
        </tr>
        <tr> 
          <td background="/images/payment/payment_bg01.gif"><img src="/images/main/blank.gif" width="1" height="2"></td>
        </tr>
        <tr> 
          <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
        </tr>
      </table>
		-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20"></td>
          <td class="txtDarkblue"><!-- 使用剩余点数可进行部分支付. <br>
           不过用储备金支付时不累积储备金. <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
              </tr>
              <tr> 
                <td background="/images/payment/payment_bg02.gif"><img src="/images/main/blank.gif" width="1" height="2"></td>
              </tr>
              <tr> 
                <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
              </tr>
            </table> -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="110"><!-- <img src="/images/payment/payment_word01.gif" height="17"> --></td>
				<td class="txtDarkblue">
					<!-- 备概磊 酒捞叼 -->
					<input type="hidden" name="gameid" value="<%=gameid%>">
					<!-- 弥辆 惑前疙内靛 -->
					<input type="hidden" name="SumPid" value="<%=SumPid%>">
					<!-- 弥辆 惑前疙 -->
					<input type="hidden" name="SumgName" value="<%=SumgName%>">
					<!-- 荤侩且 某浆 -->
					<input type="hidden" name="chkCashType" value="<%=chkCashType%>">
				</td>				
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <tr> 
          <td align="right" class="txtDarkblue"><font color="#CC3300"><b>请输入您的密码: </b></font></td>
          <td width="100" align="right"><input type="password" name="UserPwd" size="15" class="input02"></td>
        </tr>
      </table>
      <br>
      <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <tr> 
          <td align="right" class="txtDarkblue"><a href="payment_step01.asp?gameid=<%=gameid%>" onfocus='this.blur()'><img src="/images/payment/payment_but_back_off.gif" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_back_on.gif'" onMouseOut="this.src='/images/payment/payment_but_back_off.gif'"></a></td>
          <td width="125" align="right"><input type="image" src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0"  onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'"></td>
        </tr>
      </table><td width="10">&nbsp;</td>
  </tr></form>
</table>
</body>
</html>

<script language="javascript" src="/Lib/common2.js"></script>
<script language="javascript">
<!-- 
function mile_chage() {
	mile = order_info.mile.value;
	string_check = "0";
	
	if(parseFloat(mile) == 0) {
		document.order_info.mile.value = "";
		mile = order_info.mile.value;
	}
		
	for(i= 0 ; i < mile.length ; i++) {
		var val = "0123456789";
			if ( parseInt(val.indexOf(mile.substring(i,i+1))) < 0) 
				string_check = "1";			
	}	
		
	if ( string_check == "1") {
		alert("键入编号");
		document.order_info.mile.value = "";
		document.order_info.mile.focus();
		return false;
	}

	if (parseFloat(mile) > parseFloat(parseFloat(document.order_info.orderprice.value))) {
		alert("要使用的剩余点数不能多余订金!\n\n请检查.");
		document.order_info.mile.value = ""
		document.order_info.mile.focus();
		return false;
	}

	if (parseFloat(mile) > parseFloat(order_info.total_mile_check.value)) {
		alert("要使用的剩余点数不能多于所拥有的剩余点数.\n\n请确认.");
		document.order_info.mile.value = "";
		document.order_info.mile.focus();
		return false;
	}

	if (mile.length > 2) {
		document.order_info.mile.value = mile.substr(0, mile.length-2) + "00"
		mile = document.order_info.mile.value;
	}

	if (mile != "") {		
		if (mile.length < 3 || parseInt(mile) < 0) {
			alert("最低消费为…");
			document.order_info.mile.value = ""			
		}		
	}
	
}

function sendit()
{
	objInput = order_info.UserPwd;
	if(fnTrim(objInput.value) == "")
	{
		alert("请输入密码");
		objInput.value = "";
		objInput.focus();
		
		return false;
	}
	else
	{
		show_progressbar();
		//order_info.submit();
	}	
}
//-->
</script>
