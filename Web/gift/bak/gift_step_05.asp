<%
	'OrderNo			= Trim(Request.Form ("OrderNo"))
	'gameid			= Trim(Request.Form ("gameid"))
	'chkCashType	= Trim(Request.Form ("chkCashType"))
	'sumGem		= Trim(Request.Form ("sumGem"))
	'OrderPrice		= Trim(Request.Form ("OrderPrice"))
	OrderNo		= Trim(Request("OrderNo"))
	gameid		= Trim(Request("gameid"))
	chkCashType	= Trim(Request("chkCashType"))
	sumGem		= Trim(Request("sumGem"))
	OrderPrice	= Trim(Request("OrderPrice"))

%>
<html>
<head>
<title>�����!!</title>
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
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" bgcolor="#67BAF0" topmargin="0" leftmargin="0">
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
	Set Conn = Server.CreateObject ("ADODB.Connection")
	Conn.Open (Application("Connection_ConnectionString"))
	Set Conn1 = Server.CreateObject ("ADODB.Connection")
	Conn1.Open (Application("c_Connection_ConnectionString"))
	
	'USER_INDEX_ID �� ���Ѵ�...
	strSQL = "P_O2JAM_MY_SIMPLE_INFO '"& gameid &"'"
	Set objDBrs	= 	Conn1.Execute(strSQL)

	USER_INDEX_ID	= objDBrs("USER_INDEX_ID")
	Set objDBrs = Nothing
	
	
	If chkCashType = "MC" or chkCashType = "AC" or chkCashType = "OC" Then
		SQL = "SELECT o_seq,OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate FROM TB_LOG_LIST_ITEM_MUSIC_CASH Where OrderNo='"& OrderNo &"'"
		Set RS	= Conn.Execute(SQL)
		i = 1
		ea = 0
		sum = 0
		sumPoint = 0
		sumPrice = 0
		sumGem = 0
		If Not(RS.BOF or RS.EOF) Then
			Do until RS.EOF
				o_seq 		= RS(0)
				orderNo 	= RS(1)
				memberID 	= RS(2)
				pid 			= RS(3)
				gName		= RS(4)
				o_Gem 		= RS(5)
				o_price	 	= RS(6)
				o_point		= RS(7)
				gFlag 		= RS(8)
				regDate		= RS(9)
				%>
				<table width="98%" border="0" cellspacing="0" cellpadding="3" ID="Table3">
				<tr class="txtWhite"> 
					<td width="10%"><%=i%></td>
					<%IF gFlag = "I" THEN%>
						<td width="17%">��������</td>
					<%ELSEIF gFlag = "S" THEN%>
						<td width="17%">����</td>
					<%ELSEIF gFlag = "T" THEN%>
						<td width="17%">��װ</td>
					<%END IF%>
					<td class="txtYellowB"><%=gName%></td>
					<td width="16%" class="txtWhiteB">
					<%IF o_price <> 0 THEN%>
						<%=formatnumber(o_price,0)%> ��
					<%ELSEIF o_Gem <> 0 THEN%>
						<%=formatnumber(o_Gem,0)%> GEM
					<%END IF%>
					</td>
					<td width="9%"><%=formatnumber(o_point,0)%>��</td>
				</tr>
				</table>
				<table width="98%" border="0" cellspacing="0" cellpadding="0" ID="Table4">
				<tr>
					<td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
				</tr>
				</table>
				<% 
				rs.Movenext

				ea = ea + 1
				sum = sum + o_price
				sumPoint = sumPoint + o_point
				sumPrice = sumPrice + o_price
				sumGem 	 = sumGem   + o_Gem
				i = i + 1
			Loop
		End If

		Rs.Close
		Set RS = Nothing
		
		SQL = "SELECT o_seq,OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate FROM TB_LOG_LIST Where OrderNo='"& OrderNo &"'"
		Set RS	= Conn.Execute(SQL)
		If Not(RS.BOF or RS.EOF) Then
			Do until RS.EOF
				o_seq 		= RS(0)
				orderNo 	= RS(1)
				memberID 	= RS(2)
				pid 			= RS(3)
				gName		= RS(4)
				o_Gem 		= RS(5)
				o_price	 	= RS(6)
				o_point		= RS(7)
				gFlag 		= RS(8)
				regDate		= RS(9)
				%>
				<table width="98%" border="0" cellspacing="0" cellpadding="3" ID="Table5">
				<tr class="txtWhite"> 
					<td width="10%"><%=i%></td>
					<%IF gFlag = "I" THEN%>
						<td width="17%">��������</td>
					<%ELSEIF gFlag = "S" THEN%>
						<td width="17%">����</td>
					<%ELSEIF gFlag = "T" THEN%>
						<td width="17%">��װ</td>
					<%END IF%>
					<td class="txtYellowB"><%=gName%></td>
					<td width="16%" class="txtWhiteB">
					<%IF o_price <> 0 THEN%>
						<%=formatnumber(o_price,0)%> ��
					<%ELSEIF o_Gem <> 0 THEN%>
						<%=formatnumber(o_Gem,0)%> GEM
					<%END IF%>
					</td>
					<td width="9%"><%=formatnumber(o_point,0)%>��</td>
				</tr>
				</table>
				<table width="98%" border="0" cellspacing="0" cellpadding="0" ID="Table6">
				<tr>
					<td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
				</tr>
				</table>
				<% 
				rs.Movenext

				ea = ea + 1
				sum = sum + o_price
				sumPoint = sumPoint + o_point
				sumPrice = sumPrice + o_price
				sumGem 	 = sumGem   + o_Gem
				i = i + 1
			Loop
		End If

		Rs.Close
		Set RS = Nothing
	Else
		SQL = "SELECT o_seq,OrderNo,gameID,pid,gName,GoodGem,GoodPrice,o_point,gFlag,regdate FROM TB_LOG_LIST Where OrderNo='"& OrderNo &"'"
		Set RS	= Conn.Execute(SQL)
		If Not(RS.BOF or RS.EOF) Then
			i = 1
			ea = 0
			sum = 0
			sumPoint = 0
			sumPrice = 0
			sumGem = 0
			Do until RS.EOF
				o_seq 		= RS(0)
				orderNo 	= RS(1)
				memberID 	= RS(2)
				pid 			= RS(3)
				gName		= RS(4)
				o_Gem 		= RS(5)
				o_price	 	= RS(6)
				o_point		= RS(7)
				gFlag 		= RS(8)
				regDate		= RS(9)
				%>
				<table width="98%" border="0" cellspacing="0" cellpadding="3" ID="Table1">
				<tr class="txtWhite"> 
					<td width="10%"><%=i%></td>
					<%IF gFlag = "I" THEN%>
						<td width="17%">��������</td>
					<%ELSEIF gFlag = "S" THEN%>
						<td width="17%">����</td>
					<%ELSEIF gFlag = "T" THEN%>
						<td width="17%">��װ</td>
					<%END IF%>
					<td class="txtYellowB"><%=gName%></td>
					<td width="16%" class="txtWhiteB">
					<%IF o_price <> 0 THEN%>
						<%=formatnumber(o_price,0)%> ��
					<%ELSEIF o_Gem <> 0 THEN%>
						<%=formatnumber(o_Gem,0)%> GEM
					<%END IF%>
					</td>
					<td width="9%"><%=formatnumber(o_point,0)%>��</td>
				</tr>
				</table>
				<table width="98%" border="0" cellspacing="0" cellpadding="0" ID="Table2">
				<tr>
					<td background="/images/payment/payment_bg03.gif"><img src="/images/main/blank.gif" width="1" height="1"></td>
				</tr>
				</table>
				<% 
				rs.Movenext

				ea = ea + 1
				sum = sum + o_price
				sumPoint = sumPoint + o_point
				sumPrice = sumPrice + o_price
				sumGem 	 = sumGem   + o_Gem
				i = i + 1
			Loop
		End If

		Rs.Close
		Set RS = Nothing
	End If
	
	
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
                <td align="right" class="txtWhite">���б��(<span class="txtYellowB"><strong><%=ea%></strong></span>��Ʒ�嵥) 
				<%IF sumPrice <> 0 THEN%>				 
                  : <span class="txtYellowB"><%=formatNumber(sumPrice,0)%>��</span>
				<%ELSEIF sumGem <> 0 THEN%>	
                  : <span class="txtYellowB"><%=formatNumber(sumGem,0)%> Gem</span>
				<%END IF%>
				(ʣ����� : <%=sumPoint%>��)</td>
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
				<strong><font color="#990033">֧�����. </font></strong><br>
				���ڿ�������Ϸ��ȷ�������������Ʒ.л����ѡ��.<br>
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
                      <td align="right"><span class="txtDarkviolet">�ܶ�</span> 
                        ::</td>
                      <td width="20%" align="right" class="txtDarkviolet"><strong><%=FormatNumber(sumPrice,0)%></strong> ��</td>
                    </tr>
                  </table>
                  
					<!--#include virtual="/gift/INC_VIEW_USERCASH.asp"-->
                  <%
					Conn.Close
					Set Conn = Nothing
					Conn1.Close
					Set Conn1 = Nothing
					%>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <% If chkCashType = "PC" Then %>
                      <td align="right" class="txtDarkviolet">ʹ��ʣ����� :: </td>
                      <% ElseIf chkCashType = "OC" Then %>
                      <td align="right" class="txtDarkviolet">ʹ�ô����� :: </td>
                      <% ElseIf chkCashType = "MC" Then %>
                      <td align="right" class="txtDarkviolet">��ʹ�õ����ֻ��� :: </td>
                      <% ElseIf chkCashType = "AC" Then %>
                      <td align="right" class="txtDarkviolet">��ʹ�õĵ��߻��� :: </td>
                      <% End If %>
                      <td width="20%" align="right" class="txtDarkviolet"><strong><%=FormatNumber(OrderPrice,0)%> ��</strong></td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right" class="txtDarkviolet">��ʹ�õ� GEM ::</td>
                      <td width="20%" align="right" class="txtDarkviolet"><strong><%=formatnumber(sumGem,0)%> Gem</strong></td>
                    </tr>
                  </table> 
                  <%If o2cash = 0 Then %>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right" class="txtDarkviolet">������ :: </td>
                      <td width="20%" align="right" class="txtDarkviolet"><strong><%=sumPoint%> ��</strong></td>
                    </tr>
                  </table>

					<% Else %>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right" class="txtDarkviolet">������ :: </td>
                      <td width="20%" align="right" class="txtDarkviolet"><strong>0 ��</strong></td>
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
                      <td align="right">ʣ����� ::</td>
                      <td width="20%" align="right"><strong><%=FormatNumber(MCash,0)%></strong> ��</td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right">ʣ�� Gem ::</td>
                      <td width="20%" align="right"><strong><%=FormatNumber(Gem,0)%></strong> ��</td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right"><!-- ʣ��o2���� :: --></td>
                      <td width="20%" align="right"><!-- <strong><%=FormatNumber(O2Cash,0)%></strong> �� --></td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right"><!-- ʣ�����ֻ��� :: --></td>
                      <td width="20%" align="right"><!-- <strong><%=FormatNumber(MusicCash,0)%></strong> �� --></td>
                    </tr>
                  </table>
                  <table width="95%" border="0" cellspacing="0" cellpadding="2">
                    <tr class="txtDarkblue"> 
                      <td align="right"><!-- ʣ����߻��� :: --></td>
                      <td width="20%" align="right"><!-- <strong><%=FormatNumber(ItemCash,0)%></strong> �� --></td>
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