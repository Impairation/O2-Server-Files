<%

Dim U9_mchk, U9_itemnuma, U9_itemnumb
U9_mchk=0
U9_itemnuma=""
U9_itemnumb=""

Server.ScriptTimeout = 30000

	REFERER_Page = "/gift/gift_step_02.asp"

	HTTP_REFERER = Request.ServerVariables("HTTP_REFERER")

	If Len(REFERER_Page) = 0 Then
		If Len(HTTP_REFERER) = 0 Then		
			Response.Write("<div align='center'>��������..<br><br>��������������������.</div>")
			Response.End
		End If
	Else	
		REFERER_Page = "http://" & Request.ServerVariables("HTTP_HOST") & REFERER_Page & ""
		
		If InStr(HTTP_REFERER, "?") > 0 Then		
			HTTP_REFERER = Mid(HTTP_REFERER, 1,  InStr(HTTP_REFERER, "?") -1)
		End If

		If(HTTP_REFERER <> REFERER_Page)	Then
			Response.Write "HTTP_REFERER 		: " & HTTP_REFERER & "<br>"
			Response.Write "REFERER_Page 		: " & REFERER_Page & "<br>"		
			Response.Write("<div align='center'>" & HTTP_REFERER & "��������.<br><br>��������������������.</div>")
			Response.End
		End If
	End If

	
	gameid				= UCASE(Trim(Request("gameid")))
	strUserID			= gameid
		
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open(Application("Connection_ConnectionString"))
	Set Conn1= Server.CreateObject("ADODB.Connection")
	Conn1.Open(Application("c_Connection_ConnectionString"))

	'USER_INDEX_ID �� ���Ѵ�...
	strSQL = "P_O2JAM_MY_SIMPLE_INFO '"& gameid &"'"
	Set objDBrs	= 	Conn1.Execute(strSQL)

	USER_INDEX_ID	= int(objDBrs("USER_INDEX_ID"))
	Set objDBrs = Nothing

	'����� ��� ĳ���� �����´�.
	%><!-- #include virtual="/gift/INC_VIEW_USERCASH.asp" --><%
	'����
	sumGem			= int(Trim(Request ("sumGem")))
	'�ѱ��űݾ�
	OrderPrice		= int(Trim(Request ("OrderPrice")))
	strGoodsNo	  	= Trim(Request("SumPid"))			' ������ ��ȣ
	strItemName 	= Trim(Request("SumgName")) 	' �����۸�
	MemoContent		= Trim(Request("MemoContent"))
	memo			= Trim(Request("memo"))
	memberNick		= Trim(Request("memberNick"))
	ToWhoID			= Trim(Request("ToWhoID"))
	strOthers		= Trim(Request("SumPid"))			' ��Ÿ����
	chkCashType		= Trim(Request("chkCashType"))	
	
	If chkCashType = "PC" Then
		totCash = MCASH
	ElseIf chkCashType = "OC" Then
		totCash = O2Cash
	ElseIf chkCashType = "MC" Then
		totCash = MusicCash
	ElseIf chkCashType = "AC" Then
		totCash = ItemCash
	End If

	If Gem < sumGem Then '������ ��Ӵϰ� ����� ��ӴϺ��� ������
		%><!-- #include virtual="/gift/mcash_error6.inc" --><%
		SUB_CONN_DIS()
		Responsae.End
	End If
	
	If Request.ServerVariables ("REMOTE_ADDR") = "61.33.107.99" Then
		Response.Write chkCashType
		'Response.End
	End If
	
	If totCash < OrderPrice Then
		If chkCashType = "PC" Then
			Response.Write "<script>	alert('ʣ���������֧��');document.location.href = 'payment_step02.asp?gameid="&strUserID&"'</script>"
			SUB_CONN_DIS()
			Response.End
		ElseIf chkCashType = "OC" Then
			Response.Write "<script>	alert('o2���ҽ��֧��');document.location.href = 'payment_step02.asp?gameid="&strUserID&"'</script>"
			SUB_CONN_DIS()
			Response.End
		ElseIf chkCashType = "MC" Then
			Response.Write "<script>	alert('���ֻ��ҽ���');document.location.href = 'payment_step02.asp?gameid="&strUserID&"'</script>"
			SUB_CONN_DIS()
			Response.End
		ElseIf chkCashType = "AC" Then
			Response.Write "<script>	alert('���߻��ҽ���');document.location.href = 'payment_step02.asp?gameid="&strUserID&"'</script>"
			SUB_CONN_DIS()
			Response.End
		Else
			Response.Write "<script>	alert('����֧������');document.location.href = 'payment_step02.asp?gameid="&strUserID&"'</script>"
			SUB_CONN_DIS()
			Response.End
		End If
	End If
	
	'������ ���
	'�ֹ� ��ȣ�� �����Ѵ�
	curtime = Now  
	dateYY		= year(curtime)
	dateMM		= month(curtime)
	If Len(dateMM) < 2 Then dateMM = "0" & dateMM
	
	dateDD		= day(curtime)
	If Len(dateDD) < 2 Then dateDD = "0" & dateDD
	
	dateHH		= hour(curtime)
	If Len(dateHH) < 2 Then dateHH = "0" & dateHH
	
	dateMI		= minute(curtime)
	If Len(dateMI) < 2 Then dateMI = "0" & dateMI
	
	dateSE		= second(curtime)
	If Len(dateSE) < 2 Then dateSE = "0" & dateSE
	
	OrderNo = gameid & "-" & dateYY & dateMM & dateDD & dateHH & dateMI & dateSE
	
	'�г��� ���� �������� �����Ѵ�
	%><!-- #include virtual="/gift/gift_nickInsert.asp" --><%
	
	If Not(chkCashType = "MC" or chkCashType = "AC" or chkCashType = "OC") Then
		%><!-- #include virtual="/gift/OrderLog.asp" --><%
	End If
	
	'ĳ�� �����ϴ� �κ�
	'��ĳ���� ��츸 ������Ʈ�� ȣ���Ͽ� ��������.
	'���� ������Ʈ�� ������ ������ ������ŭ ȣ���ϵ� �� ������ �ִ� �������� ����.
	'----------------------------------------------------------------------------------------------------------------------------------------------
	If chkCashType = "PC" Then
		strSQL = "SELECT pid, gName, i_price, gFlag FROM TB_GIFT_IMSI_CART WHERE memberID = '" & gameid & "' AND i_gem = 0"
		Set objDBrs = Conn.Execute(strSQL)
		
		Do Until	objDBrs.BOF or objDBrs.EOF
			
			strGoodsNo		= int(objDBrs("pid"))			'��ǰ��ȣ���̵�
			strItemName		= Trim(objDBrs("gName"))	'�������̸�
			intPrice				= int(objDBrs("i_price"))		'����
			gFlag					= Trim(objDBrs("gFlag"))
			strOthers			= strGoodsNo						'��Ÿ����
			
			'''==============================================================================================================
			'''===== Check and Update User Cash  Start !!
			'''==============================================================================================================
			On Error Resume Next

			strSQL2 = "SELECT id FROM UserMCash WHERE userid = '" & gameid & "'"
			Set objDBrs2 = Conn.Execute(strSQL2)

			If objDBrs2.BOF or objDBrs2.EOF Then
				intRetCode = 5

				objDBrs2.Close
				Set objDBrs2 = Nothing
			Else
				intMoney = MCash - intPrice

				strSQL2 = "UPDATE UserMCash SET MCASH = " & intMoney & ", changdate = GETDATE() WHERE userid = '" & gameid & "'"
				Set objDBrs2 = Conn.Execute(strSQL2)

				If Err.number <> 0 Then
					intRetCode = 4
					Err.Clear
				Else
					intRetCode = 1
				End If			
			
				'On Error Goto 0 �� �̿��Ͽ� ���� ó���� �Ұ����ϰ� �Ѵ�.
				On Error Goto 0

			End If
			
			Select Case intRetCode
				Case 1
					MCASH = intMoney
				Case 4
			%>
				<!-- #include virtual="/payment/mcash_error4.inc" -->
			<%
					SUB_CONN_DIS()
					Response.End
				Case 5
			%>
				<!-- #include virtual="/payment/mcash_error5.inc" -->
			<%
					SUB_CONN_DIS()
					Response.End
				Case Else
			%>
				<!-- #include virtual="/payment/mcash_error_net.inc" -->
			<%
					SUB_CONN_DIS()
					Response.End
			End Select		
			'''==============================================================================================================
			'''===== Check and Update User Cash  End !!
			'''==============================================================================================================
						
			objDBrs.Movenext
		Loop
		
		objDBrs.Close
		Set objDBrs = Nothing
	'----------------------------------------------------------------------------------------------------------------------------------------------
	ElseIf chkCashType = "OC" Then
		O2Cash = O2Cash - OrderPrice
	ElseIf chkCashType = "MC" Then
		MusicCash = MusicCash - OrderPrice
	ElseIf chkCashType = "AC" Then
		ItemCash = ItemCash - OrderPrice
	ElseIf chkCashType = "GC" Then
		'��
	Else
		'�����߻�
		Response.Write "<script>alert('����!');history.back();</script>"
		SUB_CONN_DIS()
	End If
	
	intMoney = MCASH
	'�� ����
	Gem = Gem - sumGem
	
	'ĳ�� �����ϴ� ������ ȣ���Ͽ� �˸��� ĳ���� �����Ѵ�
	'�Ʒ� ��Ŭ��� ���ϻ� ĳ�� �����Ѵ� �κ��� �����Ѵ�.
	If chkCashType = "MC" or chkCashType = "AC" or chkCashType = "OC" Then
		%><!-- #include virtual="/gift/OrderLog_MA.asp" --><%
	Else
		%><!-- #include virtual="/gift/cashDB.asp" --><%
	End If
	%>
	<!-- #include virtual="/gift/gift_memoInsert.asp" -->
	<!-- #include virtual="/gift/music.asp" -->
	<!-- #include virtual="/gift/item.asp" -->
	<!-- #include virtual="/gift/gift_m_o2cash.asp" -->
	<%
	strSQL = "DELETE TB_GIFT_IMSI_CART WHERE memberID = '" & gameid & "'"
	Conn.Execute (strSQL)
				
	'����Է� END
		
	Conn.Close
	Set Conn = Nothing
	Conn1.Close
	Set Conn1 = Nothing
	%>
<%
Response.Redirect "gift_step_05.asp?OrderNo="&OrderNo&"&gameid="&gameid&"&chkCashType="&chkCashType&"&sumGem="&sumGem&"&OrderPrice="&OrderPrice
%>
	<%
	Sub SUB_CONN_DIS()
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
	End Sub
	%>