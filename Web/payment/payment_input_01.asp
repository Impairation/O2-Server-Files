<% Option Explicit %>
<%

	Response.buffer = true
	'������������������������������������������������������������
	'��� ���ϸ�			:	payment_input_01.asp
	'��� �ֿ� ���		:	������ ����, ���� �׽�Ʈ ������ ���� ������ ����, ������ ���� ����
	'��� �ۼ�				:	������
	'��� �����ۼ���		:	2004-04-26
	'��� ����������		:	2004-06-4
	'������������������������������������������������������������
	
	Response.Expires = 0 
	Response.Expiresabsolute = Now() - 3 
	Response.AddHeader "pragma","no-cache" 
	Response.AddHeader "cache-control","private" 
	Response.CacheControl = "no-cache" 
	

Dim Conn, Conn1, objDBrs, objDBrsDetail, objCmd
Dim aid(10), sid(10), tid(2)
Dim strSQL, gameid
Dim RESULT, i
Dim SetItemID, SetItemTitle
Dim TGEM, TWON, TO2Cash
Dim PartItemID, ItemName, ItemKind, ItemType, ItemID
Dim ChkItem
Dim ItemGem, ItemCash
Dim ChkBagTotNum2, ChkBagTotNum, ChkBagTotNum1
Dim imsi
								
	gameid = Trim(Request.QueryString("gameid"))
	%>	
	<!--�����˻�-->
	<!--#include file="Payment_Music_check.asp"-->
	<!--�����˻�-->
	<%
	'������
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open(Application("Connection_ConnectionString"))
	
	Set Conn1 = Server.CreateObject("ADODB.Connection")
	Conn1.Open(Application("c_Connection_ConnectionString"))
	
	'��ٱ��Ͽ� ������ �ִ� �� ������ �����ϴ�.
	strSQL = "PROC_PAYMENT_TEMPCART_NORMALITEM_INSERT '" & gameid & "', 0, 'D', 0"
	Conn.Execute (strSQL)	
	
	ChkBagTotNum1	 = 0
	
	
	'������ ���� ����
	'�����ϴ� �������� �������� �ʽ��ϴ�.
	For i = 0 to 9
		If aid(i) <> "" Then
			'���ν��� ȣ��
			RESULT = SUB_COMMAND_NORMAL (gameid, aid(i), "I", 4)
									
			'���� ����Ǿ��ų� �����ϴ� ��찡 �ƴ϶��, �Լ��� ȣ���ض�.
			If RESULT <> 0 and RESULT <> -3 Then
				RESULT_BACK RESULT, gameid, aid(i)
			End If
		End If
	Next
		
	'�� ���� ����
	For i = 0 to 9
		If sid(i) <> "" Then
			'���ν��� ȣ��
			RESULT = SUB_COMMAND_NORMAL (gameid, sid(i), "M", 4)
						
			'���� ����Ǿ��ų� �����ϴ� ��찡 �ƴ϶��, �Լ��� ȣ���ض�.
			If RESULT <> 0  and RESULT <> -3 Then
				RESULT_BACK RESULT, gameid, aid(i)
			End If
				
		End If
	Next

	'��Ʈ ������ ����
	For i = 0 to 1
		If tid(i) <> "" Then
			
			SetItemID = tid(i)
			
			'��Ʈ �������� Ÿ��Ʋ�� �����´�
			strSQL = "PROC_PAYMENT_TEMPCART_SETITEM_PRECHECK '"& gameid &"', "& SetItemID &", 'N', 0"
			Set objDBrs = Conn.Execute(strSQL)
			If Not(objDBrs.EOF or objDBrs.BOF) Then
				SetItemTitle = objDBrs("SetItemTitle")
			else
				Response.Write "<script>alert('��Ӧ���ݲ�����');//history.back();</script>"
				Conn.Close
				Set Conn = Nothing
				Conn1.Close
				Set Conn1 = Nothing
				
				Response.End
			end if
			objDBrs.Close
			Set objDBrs = Nothing
					
			'��Ʈ�����ۿ��� �����ڰ� �������ִ� ������ ����Ÿ�� ���� ����Ÿ�� ������ ������ ��Ʈ�������� �ձ��ϱ�!
			strSQL = "PROC_PAYMENT_TEMPCART_SETITEM_PRECHECK '"& gameid &"', "& SetItemID &", 'L', 0"
			Set objDBrsDetail = Conn.Execute(strSQL)
			
			TGEM		= 0
			TWON		= 0
			TO2Cash	= 0
			
			If Not(objDBrsDetail.EOF or objDBrsDetail.BOF) Then
			
				'��Ʈ�� ��� ���� ������ ��ŭ ������ ���ƶ�
				Do until objDBrsDetail.EOF or objDBrsDetail.BOF
			
					PartItemID 	= objDBrsDetail("PartItemID")	'�Ϸù�ȣ
					ItemName 	= objDBrsDetail("ItemName")	'�������̸�
					ItemKind 	= objDBrsDetail("ItemKind")		'(?)
					ItemType 	= objDBrsDetail("ItemType")		'(1:Item,2:Music)
					ItemID 		= objDBrsDetail("ItemID")			'ITEM ���̵�
			
					'ITEM ����Ÿ�ϰ�� �̹� ������ �ִ� �������� ���� �Ǿ����� üũ�Ѵ�		
					If ItemType = 1 Then
						
						'���ν��� ȣ��
						ChkItem = SUB_COMMAND_SET (gameid, ItemID, "I", 4)
												
						If ChkItem		= -3 Then
							ItemGem 	= 0						'��Ӵ�
							ItemCash 	= 0						'��ĳ��									
						Elseif ChkItem = 0 Then
							ItemGem 	= objDBrsDetail("ItemGem")	'��Ӵ�
							ItemCash 	= objDBrsDetail("ItemCash")	'��ĳ��
						End If
						
					'Music ����Ÿ�ϰ�� �̹� ������ �ִ� �������� ���� �Ǿ����� üũ�Ѵ�		
					ElseIf ItemType = 2 Then
						'���ν��� ȣ��
						ChkItem = SUB_COMMAND_SET (gameid, ItemID, "M", 4)
														
						If ChkItem		= -3 Then
							ItemGem 	= 0						'��Ӵ�
							ItemCash	= 0						'��ĳ��									
						Elseif ChkItem = 0 Then
							ItemGem 	= objDBrsDetail("ItemGem")	'��Ӵ�
							ItemCash 	= objDBrsDetail("ItemCash")	'��ĳ��
						End If
					End If	
									
					objDBrsDetail.Movenext
					
					TGEM	= TGEM + ItemGem		'��Ʈ�����ۿ��� �����ϰ� �ִ� �������� ���� ������ ������ ��
					TWON	= TWON + ItemCash	'��Ʈ�����ۿ��� �����ϰ� �ִ� �������� ������ ������ ��ĳ�� ����
					
				Loop
			Else
				Response.Write "<script>alert('��Ӧ���ݲ�����');//history.back();</script>"
				
				Conn.Close
				Set Conn = Nothing
				Conn1.Close
				Set Conn1 = Nothing
				
				Response.End
			End If
		
			
		'����� ��Ʈ ������ ��ٱ��Ͽ� ����
		strSQL = "PROC_PAYMENT_TEMPCART_COMMAND_INSERT '"& gameid &"',"& SetItemID &",'"& SetItemTitle &"',"& TGEM &","& TWON &","& TO2Cash &",'T',0"
		Conn.Execute(strSQL)
		
		End If
	Next
	
	Conn.Close
	Set Conn = Nothing
	Conn1.Close
	Set Conn1 = Nothing
	
	
	
		
	
	'���� ������ Ŀ�ǵ� �Լ�
	Private Function SUB_COMMAND_NORMAL (USER_ID, CART_ITEM, CASE_NUM, ErrNo)
		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "PROC_PAYMENT_TEMPCART_NORMALITEM_INSERT"
			.CommandType = adCmdStoredProc     
							  
			.Parameters.Append .CreateParameter("@USER_ID", adVarChar, adParamInput, 20, USER_ID)
			.Parameters.Append .CreateParameter("@CART_ITEM", adInteger, adParamInput, 4, CART_ITEM)
			.Parameters.Append .CreateParameter("@CASE_NUM", adChar, adParamInput, 1, CASE_NUM)
			.Parameters.Append .CreateParameter("ErrNo", adInteger, adParamReturnValue, ErrNo)
							
			.Execute
			RESULT = .Parameters("ERRNO")
		End with
		Set objCmd = Nothing
		
		SUB_COMMAND_NORMAL = RESULT
	End Function
	
	'��Ʈ ������ Ŀ�ǵ� �Լ�
	Private Function SUB_COMMAND_SET (USER_ID, CART_ITEM, CASE_NUM, ErrNo)
		Set objCmd = Server.CreateObject("ADODB.Command")
		With objCmd
			.ActiveConnection = Conn
			.CommandText = "PROC_PAYMENT_TEMPCART_SETITEM_PRECHECK"
			.CommandType = adCmdStoredProc     
							  
			.Parameters.Append .CreateParameter("@USER_ID", adVarChar, adParamInput, 20, USER_ID)
			.Parameters.Append .CreateParameter("@CART_ITEM", adInteger, adParamInput, 4, CART_ITEM)
			.Parameters.Append .CreateParameter("@CASE_NUM", adChar, adParamInput, 1, CASE_NUM)
			.Parameters.Append .CreateParameter("ErrNo", adInteger, adParamReturnValue, ErrNo)
							
			.Execute
			ChkItem = .Parameters("ERRNO")
		End with
		Set objCmd = Nothing
		
		SUB_COMMAND_SET = ChkItem
	End Function
		
	'���� �߻���, �Լ� ȣ��
	Private Sub RESULT_BACK(RESULT, gameid, asid)
		Conn.Close
		Set Conn = Nothing
		Conn1.Close
		Set Conn1 = Nothing
				
		If RESULT = -1 Then
			Response.Write "<script>alert('���׹����г��ִ���');//history.back();</script>"
			Response.End 
		ElseIf RESULT = -2 Then		
			Response.Write "<script>alert('��ID��������');//history.back();</script>"
			Response.End 
		End If
		Response.End
	End Sub
	
	'ChkBagTotNum = ChkBagTotNum1 + ChkBagTotNum2
		
	Response.Redirect "payment_step01.asp?gameid="& gameid
	%>