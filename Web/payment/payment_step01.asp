<%
'‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰
'‰‰ 颇老疙			:	payment_step01.asp
'‰‰ 林夸 扁瓷			:	酒捞袍 搬力, 历厘 抛胶飘 其捞瘤 函荐 碍力肺 瘤沥, 啊刀己 侩捞 祈笼
'‰‰ 累己				:	巩捍霖
'‰‰ 弥檬累己老		:	2004-04-26
'‰‰ 弥辆荐沥老		:	2004-06-4
'‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰‰
	
Dim Conn, Conn1, objDBrsLoop, objDBrs
Dim strSQL
Dim gameid
Dim ChkBagTotNum
Dim totalRecord_seq, totalRecord_gem, totalRecord_price, totalRecord_GemPrice
Dim i, ea, sum, sumPoint, sumGem
Dim i_seq, memberID, pid, gName, i_gem, i_price, i_point, gFlag, regDate
Dim s, s_ea, s_sum, s_sumPoint, s_sumGem
Dim s_seq, s_memberID, s_pid, s_gName, s_Gem, s_price, s_point, sFlag, s_regDate
Dim strCashMethod, strCashType
'dim gem, mcash


'---start 建立游戏库和交易库的数据库连接
Set Conn = Server.CreateObject ("ADODB.Connection")
Conn.Open (Application("Connection_ConnectionString"))

Set Conn1 = Server.CreateObject ("ADODB.Connection")
Conn1.Open (Application("c_Connection_ConnectionString"))
'---end
	
gameid = Request("gameid")
	
'---start 返回用户信息	FROM T_o2jam_userinfo
strSQL = "P_o2jam_My_Simple_Info '"& gameid &"'"
Set objDBrs = Conn1.Execute(strSQL)
If Not(objDBrs.BOF or objDBrs.EOF) Then
	USER_INDEX_ID		= objDBrs("USER_INDEX_ID")
	USER_ID				= objDBrs("USER_ID")
	USER_NICKNAME		= objDBrs("USER_NICKNAME")
	SEX					= objDBrs("SEX")

Else
	objDBrs.Close
	Set objDBrs = Nothing
	Conn.Close
	Set Conn = Nothing
	Conn1.Close
	Set Conn1 = Nothing
	Response.Write "<script>alert('用户信息出错!');history.back();</script>"
	Response.End

End If
objDBrs.Close
Set objDBrs = Nothing
'---end

%>
<!--#include virtual="/payment/INC_VIEW_USERCASH.asp"--><%'获取用户的5种货币的值 FROM T_o2jam_charCash   返回到变量:Gem O2Cash MusicCash ItemCash MCash%>
<!--#include virtual="/payment/pay_itemCount_chk.asp" --><%'获取用户的空包数   返回到totalitemRecord%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>::支付::</title>
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
<body bgcolor="#67BAF0" topmargin="0" leftmargin="0"  oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<table width="710" border="0" cellspacing="0" cellpadding="0"><FORM method="post" name="payform" action="payment_step02.asp" onsubmit="return Order()">
	  <tr> 
	    <td width="20">&nbsp;</td>
	    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
	        <tr>
	          <td><img src="/images/payment/payment_title_shop.gif" width="86" height="44"></td>
			  <td align="right">

	<%
		'---start 查询用户购物篮中的记录
		strSQL = "SELECT gFlag, pid, i_gem ,i_price FROM TB_IMSI_CART WHERE memberID = '" & gameid & "'"
		Set objDBrs = Conn.Execute(strSQL)
		'---end

		'初始化
		totalRecord_AItem	= 0		'道具数量总值			
		totalRecord_seq		= 0		'物品数量总值			
		totalRecord_gem		= 0		'GEM总值				
		totalRecord_price	= 0		'CASH总值				
		
		'---start 计算购物篮中的物品价格、数量
		Do until objDBrs.BOF or objDBrs.EOF
			If Trim(objDBrs("gFlag")) = "I" or Trim(objDBrs("gFlag")) = "S" Then	'---start 物品是道具或音乐	

				If Trim(objDBrs("gFlag")) = "I" Then totalRecord_AItem = totalRecord_AItem + 1

				totalRecord_seq		= totalRecord_seq + 1
				totalRecord_gem		= totalRecord_gem + int(objDBrs("i_gem"))
				totalRecord_price	= totalRecord_price + int(objDBrs("i_price"))
				'---end
				
			Else	
				'---start 物品是套装		
				strSQL = "SELECT ItemType, ItemID, ItemGem, ItemMCash FROM T_O2JAM_SETITEM_DATA WHERE SetItemID = " & int(objDBrs("pid"))
				Set objDBrsChk = Conn1.Execute(strSQL)			'返回套装中的全部物品

				Do until objDBrsChk.BOF or objDBrsChk.EOF
					If 1 = int(objDBrsChk("ItemType")) Then		'如果物品是道具
						'---start 判断道具是否已经有了
						strSQL 	= "p_o2jam_SETITEM_DUP_ITEM_CHECK_2 " & USER_INDEX_ID & ", " & int(objDBrsChk("ItemID"))
						Set objDBrsItemChk 	= Conn1.Execute(strSQL)
						ChkItem = objDBrsItemChk(0)
						objDBrsItemChk.Close
						Set objDBrsItemChk = Nothing
						'---end
						If ChkItem = 1 Then
							'totalRecord_AItem	= totalRecord_AItem + 0
							'totalRecord_seq		= totalRecord_seq + 0
							'totalRecord_gem		= totalRecord_gem + 0
							'totalRecord_price	= totalRecord_price + 0
						Elseif ChkItem = 0 Then		'道具没有
							totalRecord_AItem	= totalRecord_AItem + 1
							totalRecord_seq		= totalRecord_seq + 1
							totalRecord_gem		= totalRecord_gem + int(objDBrsChk("ItemGem"))
							totalRecord_price	= totalRecord_price + int(objDBrsChk("ItemMCash"))
						End If
					ElseIf 2 = int(objDBrsChk("ItemType")) Then		'如果物品是音乐
						'---start 判断音乐是否已经存在
						strSQL 	= "P_o2jam_SETITEM_DUP_MUSIC_CHECK " & USER_INDEX_ID & ", " & int(objDBrsChk("ItemID"))
						Set objDBrsItemChk 	= Conn1.Execute(strSQL)
						ChkItem = objDBrsItemChk(0)
						objDBrsItemChk.Close
						Set objDBrsItemChk = Nothing
						'---end

						If ChkItem = 1 Then
							'totalRecord_seq = totalRecord_seq + 0
							'totalRecord_gem = totalRecord_gem + 0
							'totalRecord_price = totalRecord_price + 0
						Elseif ChkItem = 0 Then			'音乐没有
							totalRecord_seq = totalRecord_seq + 1
							totalRecord_gem = totalRecord_gem + int(objDBrsChk("ItemGem"))
							totalRecord_price = totalRecord_price + int(objDBrsChk("ItemMCash"))
						End If

					End If
					objDBrsChk.MoveNext
				Loop
				
				objDBrsChk.Close
				Set objDBrsChk = Nothing
				'---end
			End If
			objDBrs.MoveNext
		Loop
		'---end
				
		objDBrs.Close
		Set objDBrs = nothing
			
		'返回用户GEM+price																											'醚 啊拜苞 离阑 钦茄促
		totalRecord_GemPrice = totalRecord_gem + totalRecord_price

	
	%>
	<%'---start 判断购买按钮	%>

	<%If totalRecord_seq < 1 Then '物品数量小于1%>
		<img src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'" onClick="OrderNo(1)" style="cursor:hand">
	<%ElseIf totalRecord_GemPrice < 1 or mcash<totalRecord_price or gem<totalRecord_gem Then  'G+W币小于1%>
		<img src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'" onClick="OrderNo(2)" style="cursor:hand">
	<%Else%>
		<%If totalRecord_AItem > totalitemRecord Then'道具数量超出个人物品包可放的数量%>
			<img src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'" onClick="OrderNo(3)" style="cursor:hand">
		<%Else	'正常%>
			<input type="image" src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'" >
		<%End If%>
	<%End If%>
	<%'---end	%>
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
	          <td width="8%"><img src="/images/payment/payment_word_save.gif" width="36" height="15"></td>
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
				'---start 返回该用户购物篮内的全部数据		FROM TB_IMSI_CART
				strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_SELECT '" & gameid & "', 'L'"
				Set objDBrsLoop = Conn.Execute(strSQL)
				
				If Not(objDBrsLoop.BOF or objDBrsLoop.EOF) Then
					i = 1
					ea = 0
					sumPoint = 0
										
					strCashMethod = ""
					
					Do until objDBrsLoop.EOF
						i_seq 		= objDBrsLoop("i_seq")
						memberID 	= objDBrsLoop("memberID")
						pid 		= objDBrsLoop("pid")
						gName 		= objDBrsLoop("gName")
						i_gem	 	= objDBrsLoop("i_gem")
						i_price		= objDBrsLoop("i_price")
						i_point		= objDBrsLoop("i_point")
						gFlag 		= objDBrsLoop("gFlag")
						regDate		= objDBrsLoop("regDate")
						
						%>		
						<table width="98%" border="0" cellspacing="0" cellpadding="3">
			              <tr class="txtWhite">
							
							<%IF gFlag = "T" THEN%>
								<td width="11%" class="txtYellowB"><%=i%></td>
							<%ELSE%>
								<td width="11%"><%=i%></td>
							<%END IF%>

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
								<%IF i_price <> 0 Then%>
									<%=FormatNumber(i_price,0)%> Ｍ
								<%ELSEIF i_gem <> 0 Then%>
									<%=FormatNumber(i_gem,0)%> Ｇ
								<%END IF%>
								</td>
							
							<%ELSE%>
								<td width="16%" class="txtWhiteB">
								<%IF i_price <> 0 Then%>
									<%=FormatNumber(i_price,0)%> Ｍ
								<%ELSEIF i_gem <> 0 Then%>
									<%=FormatNumber(i_gem,0)%> Ｇ
								<%END IF%>
								</td>
							<%END IF%>

							<%IF gFlag = "T" THEN%>
								<td width="14%" class="txtYellowB"><%'=i_point%> </td>
							<%ELSE%>
								<td width="14%"><%'=i_point%> </td>
							<%END IF%>
							
								<td width="8%"><a href="javascript:delit('<%=i_seq%>','<%=gameid%>')" onfocus='this.blur()'><img src="/images/payment/payment_but_delete_off.gif" name="image01" width="16" height="15" border="0" onMouseOver="this.src='/images/payment/payment_but_delete_on.gif'" onMouseOut="this.src='/images/payment/payment_but_delete_off.gif'"></a></td>
								
                  <td width="4%"><img src="/images/payment/payment_but_save_off.gif" name="image01" width="16" height="15" border="0" onMouseOver="this.src='/images/payment/payment_but_save_on.gif'" onMouseOut="this.src='/images/payment/payment_but_save_off.gif'"></td>
								</tr></table>
							
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
						ea = ea + 1
						sumPoint = sumPoint + i_point
						i = i + 1
						
						If Not(gFlag = "T") Then
							strCashMethod = strCashMethod & gFlag
						End If
					Loop
				End If
				
				objDBrsLoop.Close
				Set objDBrsLoop = Nothing
				
				'---start 判断strCashMethod字符串中包含I、S的情况
				strCashMethod = Trim(strCashMethod)
				
				If InStr(1, strCashMethod, "I") > 0 and InStr(1, strCashMethod, "S") > 0 Then '酒捞袍苞 孤流捞 粮犁且锭
					strCashType = 3
				ElseIf InStr(1, strCashMethod, "I") > 0 and InStr(1, strCashMethod, "S") = 0 Then '酒捞袍父 粮犁且锭
					strCashType = 1
				ElseIf InStr(1, strCashMethod, "I") = 0 and InStr(1, strCashMethod, "S") > 0 Then '孤流父 粮犁且锭
					strCashType = 2
				
				End If
				'--end
				
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
                  <td align="right" class="txtWhite">合计(<span class="txtYellowB"><strong><%=ea%></strong></span>种) : <span class="txtYellowB"><%=FormatNumber(totalRecord_price,0)%> Ｍ / <%=FormatNumber(totalRecord_gem,0)%> Ｇ</span> 
                    <!-- (储备金 : <%=FormatNumber(sumPoint,0)%>点) -->
                  </td>
                  <td width="52" align="right"><a href="javascript:delitALL('<%=gameid%>')" onFocus='this.blur()'><img src="/images/payment/payment_but_all_delete_off.gif" width="54" height="20" onMouseOver="this.src='/images/payment/payment_but_all_delete_on.gif'" onMouseOut="this.src='/images/payment/payment_but_all_delete_off.gif'" border="0"></a></td>
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
		<input type="hidden" name="gameid" value="<%=gameid%>">
	<tr>
		<td class="txtDarkblue">
			
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="txtDarkblue">
				<tr>
					<td valign=top>
						<p><!-- *使用点数购买时不能累加 --></p>
					</td>
				</tr>
			</table>
		
		</td>
			<td align="right">
			<%'---start 判断购买按钮	%>
			<%If totalRecord_seq < 1 Then %>
				<img src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'" onClick="OrderNo(1)" style="cursor:hand">
			<%ElseIf totalRecord_GemPrice < 1  or mcash<totalRecord_price or gem<totalRecord_gem Then %>
				<img src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'" onClick="OrderNo(2)" style="cursor:hand">
			<%Else%>
				<%If totalRecord_AItem > totalitemRecord Then%>
					<img src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'" onClick="OrderNo(3)" style="cursor:hand">
				<%Else%>
					<input type="image" src="/images/payment/payment_but_order01_off.gif" width="125" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_order01_on.gif'" onMouseOut="this.src='/images/payment/payment_but_order01_off.gif'">
				<%End If%>
			<%End If%>
			<%'---end	%>
				</td>
			 </tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="txtDarkblue">
				<tr><td colspan=4><!-- <img src="/images/payment/payment_word06.gif" width="165" height="14"> --></td></tr>
				<tr align=center>
				<% If totalRecord_price < 1 and totalRecord_Gem > 0 Then '离 父栏肺 拱扒备概 %>
					<input type=hidden name="chkCashOnlyGem" value="Y">
					<% If totalRecord_gem > Gem Then %>
						<input type=hidden name="chkCashGemABLE" value="N">
					<% Else %>
						<input type=hidden name="chkCashGemABLE" value="Y">
					<% End If %>
					<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="PC" disabled><b>MCASH</b>(<%=FormatNumber(MCash,0)%> 点)</span></td>
					<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="OC" disabled><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%> 点)</span></td>
					<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="AC" disabled><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%> 点)</span></td>
					<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="MC" disabled><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%> 点)</span></td>
					
				<% Else %>
					<input type=hidden name="chkCashOnlyGem" value="N">
					<% If sumGem > Gem Then %>
						<input type=hidden name="chkCashGemABLE" value="N">
					<% Else %>
						<input type=hidden name="chkCashGemABLE" value="Y">
					<% End If %>

					<% If strCashType = 1 Then 	'所购物品只有道具					'酒官鸥 酒捞袍老 版快%>
						<td width="25%"><span style="display:none"><input checked type=radio name="chkCashType" value="PC"<%If MCash < totalRecord_price Then%> disabled<%End If%>><b>MCASH</b>(<%=FormatNumber(MCash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="OC"<%If O2Cash < totalRecord_price Then%> disabled<%End If%>><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="AC"<%If ItemCash < totalRecord_price Then%> disabled<%End If%>><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="MC" disabled><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%> 点)</span></td>
					<% ElseIf strCashType = 2 Then	'所购物品只有音乐					 '孤流 酒捞袍老 版快%>
						<td width="25%"><span style="display:none"><input checked type=radio name="chkCashType" value="PC"<%If MCash < totalRecord_price Then%> disabled<%End If%>><b>MCASH</b>(<%=FormatNumber(MCash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="OC"<%If O2Cash < totalRecord_price Then%> disabled<%End If%>><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="AC" disabled><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="MC"<%If MusicCash < totalRecord_price Then%> disabled<%End If%>><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%> 点)</span></td>
					<% ElseIf strCashType = 3 Then  '所购物品有道具和音乐					'去钦 酒捞袍老 版快%>
						<td width="25%"><span style="display:none"><input checked type=radio name="chkCashType" value="PC"<%If MCash < totalRecord_price Then%> disabled<%End If%>><b>MCASH</b>(<%=FormatNumber(MCash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="OC"<%If O2Cash < totalRecord_price Then%> disabled<%End If%>><b>O2Cash</b>(<%=FormatNumber(O2Cash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="AC" disabled><b>ItemCash</b>(<%=FormatNumber(ItemCash,0)%> 点)</span></td>
						<td width="25%"><span style="display:none"><input type=radio name="chkCashType" value="MC" disabled><b>MusicCash</b>(<%=FormatNumber(MusicCash,0)%> 点)</span></td>
					<% End If %>

				<% End If %>
				</tr>
			</table>
        <!-- 
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr><td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td></tr>
				<tr><td background="/images/payment/payment_bg01.gif"><img src="/images/main/blank.gif" width="1" height="2"></td></tr>
				<tr><td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td></tr>
			</table>
			-->
      <td width="10">&nbsp;</td>
	  </tr></form>
	</table>
	</body>
	</html>
	<%
	Conn.Close
	Set Conn = Nothing
	Conn1.Close
	Set Conn1 = Nothing
	%>
	<script language = "javascript">
	<!--  
	function Order()
	{
		var OnlyGem = payform.chkCashOnlyGem.value;
		var GemABLE = payform.chkCashGemABLE.value;
		//alert("dd");
		//return false;
		//离父栏肺 拱扒备概
		if (OnlyGem == 'Y') {
			if (GemABLE == 'N') {
				alert('Gem <%=formatnumber(totalRecord_gem - gem, 0)%> 不足');
				return false;
			}
		}
		
		else {
			if (GemABLE == 'N') {
				alert('Gem <%=formatnumber(totalRecord_gem - gem, 0)%> 不足');
				return false;
			}
			
			var chkCashTypeVAR = 'N';
			
			for (i=0;i<4;i++) {
				if (payform.chkCashType[i].checked) {chkCashTypeVAR = 'Y';}
			}
			
			if (chkCashTypeVAR == 'N') {
				alert('选择支付形式!');
				return false;
			}
		}
		
		//payform.method = "POST";
		//payform.action = "payment_step02.asp";
		//payform.submit();
		
	}
	
	
	function delit(seq,gameid)
	{
		ans = confirm("删除已选项目.")
		if(ans == true){
			document.location.href = "cart_del_ok.asp?gameid="+gameid+"&seq=" + seq
		}	
	}

	function savedelit(seq,gameid)
	{
		ans = confirm("删除从储存箱中所选的项目.")
		if(ans == true){
			document.location.href = "cart_save_del_ok.asp?gameid="+gameid+"&seq=" + seq
		}	
	}


	function item_save(seq,gameid)
	{
		ans = confirm("储存已选择的项目.")
		if(ans == true){
			document.location.href = "cart_item_save.asp?gameid="+gameid+"&seq=" + seq
		}	
	}


	function delitALL(gameid)
	{
		ans = confirm("删除购物袋中所有项目.")
		if(ans == true){
			document.location.href = "cart_del_ok.asp?gameid="+gameid
		}	
	}

	function savedelitALL(gameid)
	{
		ans = confirm("删除储存箱中所有项目.")
		if(ans == true){
			document.location.href = "cart_save_del_ok.asp?gameid="+gameid
		}	
	}

	function item_saveALL(gameid)
	{
		ans = confirm("储存所有已选项目.")
		if(ans == true){
			document.location.href = "cart_item_save.asp?gameid="+gameid
		}	
	}

	function reSave()
	{
		ans = confirm("是否购买已选择的项目?\n\n(当你选中,物品将被放入购物袋.)")
		if(ans == true){
			document.payform.action = "resave.asp"
			document.payform.submit();
		}	
	}

	function ToggleCheck(flag) {
		for (var i=0;i < document.payform.elements.length; i++) {
			if (document.payform.elements[i].name == 's_seq') {
				document.payform.elements[i].checked=(flag == 'Check') ? 1 : 0;
			}
		}
	}

	function OrderNo(varNum)
	{
		if (varNum == 1)		{alert("没有能购买的道具.");}
		else if (varNum == 2)	{alert("货币金额不足");}
		else if (varNum == 3)	{alert("您的购物袋已满/您的购物袋没有多余的位置");}
	}
	//-->
	</script>