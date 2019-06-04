<%
	'''〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	'''〓〓〓 Request 값을 구하는 함수  〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	'''〓 GET 과 POST 두가지 방법 모두로 값이 넘어올 때에는						
	'''〓 Request.QueryString 과 Request.Form 두가지를 모두 사용해야 합니다
	'''〓 이럴때 보통 Request(아이템명) 이런 방법을 사용합니다.					
	'''〓 하지만 이렇게 사용하면 Request.ServerVariables 를 먼저 찾게 되어
	'''〓 성능이 떨어지게 됩니다. 그래서 일단 GET 를 먼저 그 다음 POST 를
	'''〓 찾아서 값을 가져오도록 합니다.
	'''〓 하지만 POST 를 먼저 받아야 할때도 있어 Method 를 선택할 수 있도록
	'''〓 파라미터로 받아서 처리하고 있습니다.
	'''〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	Function fnRequestValue(strRequestItem, method)
	
		Dim strRequestValue, strQueryString, strForm
		
		strQueryString = Trim(Request.QueryString (strRequestItem))
		strForm = Trim(Request.Form (strRequestItem))
		
		If method = "POST" Then
			If Len(strForm) > 0 Then	'''= POST 로 넘어오는 값이 있으면
				strRequestValue = strForm
			ElseIf Len(strQueryString) > 0 Then		'''= GET 로 넘어오는 값이 있으면
				strRequestValue = strQueryString
			Else
				strRequestValue = ""
			End If
		Else
			If Len(strQueryString) > 0 Then	'''= GET 로 넘어오는 값이 있으면
				strRequestValue = strQueryString
			ElseIf Len(strForm) > 0 Then		'''= POST 로 넘어오는 값이 있으면
				strRequestValue = strForm
			Else
				strRequestValue = ""
			End If
		End If
		
		fnRequestValue = strRequestValue
	
	End Function
	
	
	
	'''〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	'''〓〓〓 사용자 입력값중에서 특수문자를 치환하는 함수 〓〓〓〓〓〓〓〓〓
	
	'''〓 사용자가 입력한 값중에서 DB 에 영향을 주거나, HTML 페이지에
	'''〓 영향을 주는 문자는 다른 문자로 치환해야 합니다.
	'''〓 ' 작은 따옴표는 DB 에서 입력시 에러가 발생하고
	'''〓 < 와 > 는 HTML 의 열기, 닫기 태그로 각종 문제를 야기할 수 있습니다.
	'''〓 그래서 위 문자들을 다른 문자로 치환합니다.	
	'''〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓	
	
	Function fnReplaceChar(strInput)
	
		strInput = Replace(strInput, "'", "''")
		strInput = Replace(strInput, "<", "&lt;")
		strInput = Replace(strInput, ">", "&gt;")
		
		strInput = Replace(strInput, "''''", "''")
			
		fnReplaceChar = strInput
	
	End Function
	
	
	
	'''〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	'''〓 자리수가 모자랄때 앞자리에 필요한 자리수 만큼 "0" 을 채워주는 함수
	'''〓 예) CheckLength("1", 3) ==> "001"
	'''〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
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
	
	
	
	'''〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	'''〓〓〓〓〓〓〓 주문(결제, 거래) 번호(코드) 생성 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	
	'''〓 OID 예시 총 30 자리  
	'''〓 AL3LA4TCFG63YQKZ20030726165235
	'''〓 컨텐츠 구분 영문 1자리 + 랜덤 문자, 숫자 15 자리 + 날짜시간 14 자리 (YYYYMMDDHHMMSS)
	'''〓 
	'''〓 전체 자리수 변경이 필요할 경우 아래쪽 FOR 루프의 숫자를 조정하면 됩니다.
	'''〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓
	Function fnGenOID(OStr)
		
		Dim OID, i
		Dim arrValue, NowDate		
			
		'''== 육안으로 확인시 오해의 소지가 있는 숫자 문자 제외
		arrValue = Array("2", "3", "4", "5", "6", "7", "8", "9", "A", "C", "E", "F", "G", "H", "K", "P", "Q", "R", "S", "T", "X", "Y", "Z")
		
		Randomize   ' Initialize random-number generator.
		
		NowDate = Now()
		
		OID = OStr
		
		'''= 랜덤 문자, 숫자 15 자리 입니다. 전체 OID 의 자리수 조정이 필요할 경우 아래 숫자를 조정하면 됩니다. 14를 다른 숫자로 
		For i = 0 To 14
		   OID = OID & arrValue(Int((23 * Rnd) + 1) - 1)
		Next
			
		OID = OID & Year(NowDate) & CheckLength(Month(NowDate), 2) & CheckLength(Day(NowDate), 2) & CheckLength(Hour(NowDate), 2) & CheckLength(Minute(NowDate), 2) & CheckLength(Second(NowDate), 2)
			
		fnGenOID = OID
			
	End Function	
	
%>