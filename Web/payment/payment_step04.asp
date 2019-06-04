<%
	'OrderNo				= Trim(Request.Form ("OrderNo"))
	'gameid				= Trim(Request.Form ("gameid"))
	'chkCashType		= Trim(Request.Form ("chkCashType"))
	'sumGem			= Trim(Request.Form ("sumGem"))
	'OrderPrice			= Trim(Request.Form ("OrderPrice"))
	OrderNo				= Trim(Request("OrderNo"))
	gameid				= Trim(Request("gameid"))
	chkCashType			= Trim(Request("chkCashType"))
	sumGem				= Trim(Request("sumGem"))
	OrderPrice			= Trim(Request("OrderPrice"))
	
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<title>最后检查!!</title>
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
<table width="710" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/payment/payment_title_shop.gif" width="86" height="44"></td>
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
			'叼厚 积己
			Set Conn1 = Server.CreateObject("ADODB.Connection")
			Conn1.Open(Application("c_Connection_ConnectionString"))
	
			Set Conn = Server.CreateObject("ADODB.Connection")
			Conn.Open(Application("Connection_ConnectionString"))
	
			'USER_INDEX_ID 甫 备茄促...
			strSQL = "P_O2JAM_MY_SIMPLE_INFO '"& gameid &"'"
			Set objDBrs	= 	Conn1.Execute(strSQL)

			USER_INDEX_ID	= objDBrs("USER_INDEX_ID")
			Set objDBrs = Nothing
			
			'沮某浆甫 力寇茄 备概
			If chkCashType = "MC" or chkCashType = "AC" or chkCashType = "OC" Then
				'促弗某浆
				strSQL = "PROC_PAYMENT_CASHLOG_COMMAND_INSERT '" & OrderNo & "', '',0,'',0,0,0,'A',0,'L',0,0"
				Set objDBrs	= Conn.Execute(strSQL)
				
				i = 1
				ea = 0
				sum = 0
				sumPoint = 0
				sumPrice = 0
				sumGem = 0
				
				If Not(objDBrs.BOF or objDBrs.EOF) Then
					Do until objDBrs.BOF or objDBrs.EOF
						o_seq 		= objDBrs(0)
						orderNo 	= objDBrs(1)
						memberID 	= objDBrs(2)
						pid			= objDBrs(3)
						gName		= objDBrs(4)
						o_Gem 		= objDBrs(5)
						o_price	 	= objDBrs(6)
						o_point		= objDBrs(7)
						gFlag 		= objDBrs(8)
						regDate		= objDBrs(9)
						%>	
						<table width="98%" border="0" cellspacing="0" cellpadding="3" ID="Table3">
						<tr class="txtWhite"> 
							<td width="10%"><%=i%></td>
							<% If gFlag = "I" Then %>
								<td width="17%">人物形象</td>
							<% ElseIf gFlag = "S" Then %>
								<td width="17%">音乐</td>
							<% ElseIf gFlag = "T" Then %>
								<td width="17%">套装</td>
							<% End If %>
								<td class="txtYellowB"><%=gName%></td>
								<td width="16%" class="txtWhiteB">
							<% If o_price <> 0 Then %>
								<%=formatnumber(o_price,0)%> Ｍ
							<% ElseIf o_Gem <> 0 Then %>
								<%=formatnumber(o_Gem,0)%> Ｇ
							<% End If %>
							</td>
							<td width="9%"><!-- <%=formatnumber(o_point,0)%>点 --></td>
						</tr>
						</table>
						<table width="98%" border="0" cellspacing="0" cellpadding="0" ID="Table4">
						<tr>
							<td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
						</tr>
						</table>
						<%
						objDBrs.Movenext

						ea = ea + 1
						sum = sum + o_price
						sumPoint = sumPoint + o_point
						sumPrice = sumPrice + o_price
						sumGem = sumGem + o_Gem
						i = i + 1
					Loop
				End If

				objDBrs.Close
				Set objDBrs = Nothing
				
				'离
				strSQL = "SELECT o_seq,OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate FROM TB_LOG_LIST Where OrderNo='"& OrderNo &"'"
				Set objDBrs	= Conn.Execute(strSQL)
				
				If Not(objDBrs.BOF or objDBrs.EOF) Then
					Do until objDBrs.BOF or objDBrs.EOF
						o_seq 		= objDBrs(0)
						orderNo 	= objDBrs(1)
						memberID 	= objDBrs(2)
						pid			= objDBrs(3)
						gName		= objDBrs(4)
						o_Gem 		= objDBrs(5)
						o_price	 	= objDBrs(6)
						o_point		= objDBrs(7)
						gFlag 		= objDBrs(8)
						regDate		= objDBrs(9)
						%>	
						<table width="98%" border="0" cellspacing="0" cellpadding="3" ID="Table5">
						<tr class="txtWhite"> 
							<td width="10%"><%=i%></td>
							<% If gFlag = "I" Then %>
								<td width="17%">人物形象</td>
							<% ElseIf gFlag = "S" Then %>
								<td width="17%">音乐</td>
							<% ElseIf gFlag = "T" Then %>
								<td width="17%">套装</td>
							<% End If %>
								<td class="txtYellowB"><%=gName%></td>
								<td width="16%" class="txtWhiteB">
							<% If o_price <> 0 Then %>
								<%=formatnumber(o_price,0)%> Ｍ
							<% ElseIf o_Gem <> 0 Then %>
								<%=formatnumber(o_Gem,0)%> Ｇ
							<% End If %>
							</td>
							<td width="9%"><!-- <%=formatnumber(o_point,0)%>点 --></td>
						</tr>
						</table>
						<table width="98%" border="0" cellspacing="0" cellpadding="0" ID="Table6">
						<tr>
							<td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
						</tr>
						</table>
						<%
						objDBrs.Movenext

						ea = ea + 1
						sum = sum + o_price
						sumPoint = sumPoint + o_point
						sumPrice = sumPrice + o_price
						sumGem = sumGem + o_Gem
						i = i + 1
					Loop
				End If

				objDBrs.Close
				Set objDBrs = Nothing
				
				
				
			'骏某浆唱 离栏肺父 备概
			Else

			
				strSQL = "SELECT o_seq,OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate FROM TB_LOG_LIST Where OrderNo='"& OrderNo &"'"
				Set objDBrs	= Conn.Execute(strSQL)
				If Not(objDBrs.BOF or objDBrs.EOF) Then
					i = 1
					ea = 0
					sum = 0
					sumPoint = 0
					sumPrice = 0
					sumGem = 0

					Do until objDBrs.BOF or objDBrs.EOF
						o_seq 		= objDBrs(0)
						orderNo 	= objDBrs(1)
						memberID 	= objDBrs(2)
						pid			= objDBrs(3)
						gName		= objDBrs(4)
						o_Gem 		= objDBrs(5)
						o_price	 	= objDBrs(6)
						o_point		= objDBrs(7)
						gFlag 		= objDBrs(8)
						regDate		= objDBrs(9)
						%>	
						<table width="98%" border="0" cellspacing="0" cellpadding="3" ID="Table1">
						<tr class="txtWhite"> 
							<td width="10%"><%=i%></td>
							<% If gFlag = "I" Then %>
								<td width="17%">人物形象</td>
							<% ElseIf gFlag = "S" Then %>
								<td width="17%">音乐</td>
							<% ElseIf gFlag = "T" Then %>
								<td width="17%">套装</td>
							<% End If %>
								<td class="txtYellowB"><%=gName%></td>
								<td width="16%" class="txtWhiteB">
							<% If o_price <> 0 Then %>
								<%=formatnumber(o_price,0)%> Ｍ
							<% ElseIf o_Gem <> 0 Then %>
								<%=formatnumber(o_Gem,0)%> Ｇ
							<% End If %>
							</td>
							<td width="9%"><!-- <%=formatnumber(o_point,0)%>点 --></td>
						</tr>
						</table>
						<table width="98%" border="0" cellspacing="0" cellpadding="0" ID="Table2">
						<tr>
							<td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
						</tr>
						</table>
						<%
						objDBrs.Movenext

						ea = ea + 1
						sum = sum + o_price
						sumPoint = sumPoint + o_point
						sumPrice = sumPrice + o_price
						sumGem = sumGem + o_Gem
						i = i + 1
					Loop
				End If

				objDBrs.Close
				Set objDBrs = Nothing
			End IF
			
			
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
                <td align="right" class="txtWhite">所有编号(<span class="txtYellowB"><strong><%=ea%></strong></span>物品清单)
				<% If sumPrice <> 0 Then %>
                  : <span class="txtYellowB"><%=formatNumber(sumPrice,0)%> Ｍ</span>
				<% ElseIf sumGem <> 0 Then %>	
                  : <span class="txtYellowB"><%=formatNumber(sumGem,0)%> Ｇ</span>
				<% End If %>
				</td>
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
      <br>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/payment/payment_title_finsh.gif" width="96" height="31"></td>
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
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="20">&nbsp;</td>
          <td align="center" class="txtDarkblue">
				<strong><font color="#990033">支付完成. </font></strong><br>
				现在可以在游戏中确认您所购买的物品.谢谢您的选购.<br>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center" class="txtDarkblue">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td background="/images/payment/payment_bg02.gif"><img src="/images/main/blank.gif" width="1" height="2"></td>
                    </tr>
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                  </table> 
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right"><!-- <span class="txtDarkviolet">总额</span> 
                        :: --></td>
                      <td width="20%" align="right" class="txtDarkviolet"><!-- <strong><%=FormatNumber(sumPrice,0)%> Ｍ</strong> --></td>
                    </tr>
                  </table>
                  
                  <!--#include virtual="/payment/INC_VIEW_USERCASH.asp"-->
                  <%
					Conn.Close
					Set Conn = Nothing
					Conn1.Close
					Set Conn1 = Nothing
					%>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <% If chkCashType = "-PC" Then %>
						  <td align="right" class="txtDarkviolet">使用剩余点数 :: </td>
                      <% ElseIf chkCashType = "-OC" Then %>
					     <td align="right" class="txtDarkviolet">使用储备金 :: </td>
                      <% ElseIf chkCashType = "-MC" Then %>
						  <td align="right" class="txtDarkviolet">已使用的音乐货币 :: </td>
                      <% ElseIf chkCashType = "-AC" Then %>
			              <td align="right" class="txtDarkviolet">已使用的道具货币 :: </td>
                      <% End If %>
					  <td align="right" class="txtDarkviolet">已使用的Ｍ币 :: </td>
                      <td width="20%" align="right" class="txtDarkviolet"><strong><%=FormatNumber(sumPrice,0)%><%''FormatNumber(OrderPrice,0)%> Ｍ</strong></td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right" class="txtDarkviolet">已使用的Ｇ币 :: </td>
                      <td width="20%" align="right" class="txtDarkviolet"><strong><%=formatnumber(sumGem,0)%> Ｇ</strong></td>
                    </tr>
                  </table> 
                  <%If o2cash = 0 Then %>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right" class="txtDarkviolet"><!-- 储备金 :: --></td>
                      <td width="20%" align="right" class="txtDarkviolet"><!-- <strong><%=sumPoint%> 点</strong> --></td>
                    </tr>
                  </table>

					<% Else %>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right" class="txtDarkviolet"><!-- 储备金 :: --></td>
                      <td width="20%" align="right" class="txtDarkviolet"><!-- <strong>0 点</strong> --></td>
                    </tr>
                  </table>
					<% End If %>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td background="/images/payment/payment_bg02.gif"><img src="/images/main/blank.gif" width="1" height="2"></td>
                    </tr>
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right">剩余的Ｍ币 ::</td>
                      <td width="20%" align="right"><strong><%=FormatNumber(MCash,0)%></strong> Ｍ</td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right">剩余的Ｇ币 ::</td>
                      <td width="20%" align="right"><strong><%=FormatNumber(Gem,0)%></strong> Ｇ</td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right"><!-- 使用储备金 :: --></td>
                      <td width="20%" align="right"><!-- <strong><%=FormatNumber(O2Cash,0)%></strong> 点 --></td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right"><!-- 已使用的音乐货币 :: --></td>
                      <td width="20%" align="right"><!-- <strong><%=FormatNumber(MusicCash,0)%></strong> 点 --></td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right"><!-- 已使用的道具货币 :: --></td>
                      <td width="20%" align="right"><strong><!-- <%=FormatNumber(ItemCash,0)%></strong> 点 --></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table> 
            
          </td>
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
      <table width="100%" border="0" cellspacing="0" cellpadding="5">
        <tr> 
          <td align="right" class="txtDarkblue">&nbsp;</td>
          <td width="125" align="right">&nbsp;</td>
        </tr>
      </table><td width="10">&nbsp;</td>
  </tr>
</table>
</body>
</html>