<%
	'''�����������������������������������
	'''���� Request ���� ���ϴ� �Լ�  �������������������
	
	'''�� GET �� POST �ΰ��� ��� ��η� ���� �Ѿ�� ������						
	'''�� Request.QueryString �� Request.Form �ΰ����� ��� ����ؾ� �մϴ�
	'''�� �̷��� ���� Request(�����۸�) �̷� ����� ����մϴ�.					
	'''�� ������ �̷��� ����ϸ� Request.ServerVariables �� ���� ã�� �Ǿ�
	'''�� ������ �������� �˴ϴ�. �׷��� �ϴ� GET �� ���� �� ���� POST ��
	'''�� ã�Ƽ� ���� ���������� �մϴ�.
	'''�� ������ POST �� ���� �޾ƾ� �Ҷ��� �־� Method �� ������ �� �ֵ���
	'''�� �Ķ���ͷ� �޾Ƽ� ó���ϰ� �ֽ��ϴ�.
	'''�����������������������������������
	
	Function fnRequestValue(strRequestItem, method)
	
		Dim strRequestValue, strQueryString, strForm
		
		strQueryString = Trim(Request.QueryString (strRequestItem))
		strForm = Trim(Request.Form (strRequestItem))
		
		If method = "POST" Then
			If Len(strForm) > 0 Then	'''= POST �� �Ѿ���� ���� ������
				strRequestValue = strForm
			ElseIf Len(strQueryString) > 0 Then		'''= GET �� �Ѿ���� ���� ������
				strRequestValue = strQueryString
			Else
				strRequestValue = ""
			End If
		Else
			If Len(strQueryString) > 0 Then	'''= GET �� �Ѿ���� ���� ������
				strRequestValue = strQueryString
			ElseIf Len(strForm) > 0 Then		'''= POST �� �Ѿ���� ���� ������
				strRequestValue = strForm
			Else
				strRequestValue = ""
			End If
		End If
		
		fnRequestValue = strRequestValue
	
	End Function
	
	
	
	'''�����������������������������������
	'''���� ����� �Է°��߿��� Ư�����ڸ� ġȯ�ϴ� �Լ� ����������
	
	'''�� ����ڰ� �Է��� ���߿��� DB �� ������ �ְų�, HTML ��������
	'''�� ������ �ִ� ���ڴ� �ٸ� ���ڷ� ġȯ�ؾ� �մϴ�.
	'''�� ' ���� ����ǥ�� DB ���� �Է½� ������ �߻��ϰ�
	'''�� < �� > �� HTML �� ����, �ݱ� �±׷� ���� ������ �߱��� �� �ֽ��ϴ�.
	'''�� �׷��� �� ���ڵ��� �ٸ� ���ڷ� ġȯ�մϴ�.	
	'''�����������������������������������	
	
	Function fnReplaceChar(strInput)
	
		strInput = Replace(strInput, "'", "''")
		strInput = Replace(strInput, "<", "&lt;")
		strInput = Replace(strInput, ">", "&gt;")
		
		strInput = Replace(strInput, "''''", "''")
			
		fnReplaceChar = strInput
	
	End Function
	
	
	
	'''�����������������������������������
	'''�� �ڸ����� ���ڶ��� ���ڸ��� �ʿ��� �ڸ��� ��ŭ "0" �� ä���ִ� �Լ�
	'''�� ��) CheckLength("1", 3) ==> "001"
	'''�����������������������������������
	Function CheckLength(str, cnt)
		Dim strTemp, i, strLen
		
		strTemp = str
		strLen = Len(strTemp)
			
		If strLen < cnt Then
			For i = strLen + 1 To cnt
				strTemp = "0" & strTemp
			Next
		End If
			
		CheckLength = strTemp
	End Function
	
	
	
	'''�����������������������������������������������
	'''�������� �ֹ�(����, �ŷ�) ��ȣ(�ڵ�) ���� ������������������������
	
	'''�� OID ���� �� 30 �ڸ�  
	'''�� AL3LA4TCFG63YQKZ20030726165235
	'''�� ������ ���� ���� 1�ڸ� + ���� ����, ���� 15 �ڸ� + ��¥�ð� 14 �ڸ� (YYYYMMDDHHMMSS)
	'''�� 
	'''�� ��ü �ڸ��� ������ �ʿ��� ��� �Ʒ��� FOR ������ ���ڸ� �����ϸ� �˴ϴ�.
	'''�����������������������������������������������
	Function fnGenOID(OStr)
		
		Dim OID, i
		Dim arrValue, NowDate		
			
		'''== �������� Ȯ�ν� ������ ������ �ִ� ���� ���� ����
		arrValue = Array("2", "3", "4", "5", "6", "7", "8", "9", "A", "C", "E", "F", "G", "H", "K", "P", "Q", "R", "S", "T", "X", "Y", "Z")
		
		Randomize   ' Initialize random-number generator.
		
		NowDate = Now()
		
		OID = OStr
		
		'''= ���� ����, ���� 15 �ڸ� �Դϴ�. ��ü OID �� �ڸ��� ������ �ʿ��� ��� �Ʒ� ���ڸ� �����ϸ� �˴ϴ�. 14�� �ٸ� ���ڷ� 
		For i = 0 To 14
		   OID = OID & arrValue(Int((23 * Rnd) + 1) - 1)
		Next
			
		OID = OID & Year(NowDate) & CheckLength(Month(NowDate), 2) & CheckLength(Day(NowDate), 2) & CheckLength(Hour(NowDate), 2) & CheckLength(Minute(NowDate), 2) & CheckLength(Second(NowDate), 2)
			
		fnGenOID = OID
			
	End Function	
	
%>