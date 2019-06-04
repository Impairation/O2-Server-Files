<% Option Explicit %>

<!--#include virtual="/Lib/dbConnString.asp" -->

<% Response.Buffer = True %>
<%
	Dim objDBConn, objRs, objRs2, objRs3, strSql, strSql2, strSql3
	Dim count, CntLimit				
	Dim objFSO, objFile, NowURL
	Dim strFile, strFile1, strFile2, strFile3
	Dim j_seq, j_musicID, j_subject, j_kind, j_min, j_sec, MEasy, MNormal, MHard, p_name, n_name, p_pic, j_MoneyType, j_jelly, j_gem, RegDate
	Dim totalPoint, total_row, oPoint, ranking, strDate
	Dim i
	Dim arrTempArtist, arrTempGenre, arrTempSubject, arrTempEasy, arrTempPoint, arrTempPrice, arrTempDate
	Dim arrSortArtist, arrSortGenre, arrSortSubject, arrSortEasy, arrSortPoint, arrSortPrice, arrSortDate
	Dim strTempArtist, strTempGenre, strTempSubject, strTempEasy, strTempPoint, strTempPrice, strTempDate
	Dim strSort
		
	
	Set objDBConn = Server.CreateObject("ADODB.Connection")
	Set objRs = Server.CreateObject("ADODB.RecordSet")

	objDBConn.CursorLocation = 1'adUseClient
   	objDBConn.Open ConnOLEDB_Web ' Ω®¡¢ ˝æ›ø‚¡¨Ω”
   	
   	'ø™ º≤È’“”–πÿ ˝æ›°£
	strSql = "SELECT j_seq, j_musicID, j_subject, j_kind, j_min, j_sec, MEasy, MNormal, MHard, p_name, n_name, p_pic, j_MoneyType, j_jelly, j_gem, RegDate"
	strSql = strSql & " FROM TB_JAMBOX WHERE j_ListFlag != 3 AND j_ListFlag != 0 AND (j_jelly > 0 OR j_gem > 0) ORDER BY j_musicID DESC" 
		
	With objRs
		.ActiveConnection = objDBConn
		.Source = strSql
		.CursorType = adOpenForwardOnly
		.LockType = adLockReadOnly
		.Open
	End With
	
	count = 0
	
	Do Until objRs.EOF
	
		j_seq = Trim(objRs.Fields ("j_seq").Value)
		j_musicID = Trim(objRs.Fields ("j_musicID").Value)
		j_subject = Trim(objRs.Fields ("j_subject").Value)
		j_kind = Trim(objRs.Fields ("j_kind").Value)
		j_min = Trim(objRs.Fields ("j_min").Value)
		j_sec = Trim(objRs.Fields ("j_sec").Value)
		MEasy = Trim(objRs.Fields ("MEasy").Value)
		MNormal = Trim(objRs.Fields ("MNormal").Value)
		MHard = Trim(objRs.Fields ("MHard").Value)
		p_name = Trim(objRs.Fields ("p_name").Value)
		n_name = Trim(objRs.Fields ("n_name").Value)
		p_pic = Trim(objRs.Fields ("p_pic").Value)
		j_MoneyType = Trim(objRs.Fields ("j_MoneyType").Value)
		j_jelly = Trim(objRs.Fields ("j_jelly").Value)
		j_gem = Trim(objRs.Fields ("j_gem").Value)
		RegDate = Trim(objRs.Fields ("RegDate").Value)
		
		
		totalPoint = 0
	
		total_row = 0
		oPoint = 0
		
		If oPoint > 0 And oPoint <=1 Then
		   oPoint = 1	
		ElseIf oPoint > 1 And oPoint <=2 Then
		   oPoint = 2
		ElseIf oPoint > 2 And oPoint <=3 Then
		   oPoint = 3
		ElseIf oPoint > 3 And oPoint <=4 Then
		   oPoint = 4
		ElseIf oPoint > 4 And oPoint <=5 Then
		   oPoint = 5	
		Else
		   oPoint = 0
		End If
		
			ranking = 0
	
		strTempArtist = strTempArtist & "|" & p_name
		strTempGenre = strTempGenre & "|" & j_kind
		strTempSubject = strTempSubject & "|" & j_subject
		strTempEasy = strTempEasy & "|" & CheckLength(MEasy, 2)
		strTempPoint = strTempPoint & "|" & CheckLength(oPoint, 2)
		strTempPrice = strTempPrice & "|" & CheckLength(j_jelly, 5)
		
		strDate = Year(RegDate) & CheckLength(Month(RegDate), 2) & CheckLength(Day(RegDate), 2) & CheckLength(Hour(RegDate), 2) & CheckLength(Minute(RegDate), 2) & CheckLength(Second(RegDate), 2)
		strTempDate = strTempDate & "|" & strDate
		
		strSort = strSort & "|" & count
		
		strFile2 = strFile2 & "<br>" & "arrM[" & count & "]=['" & j_musicID & "','" & j_subject & "','" & p_name & "','" & n_name & "','" & j_kind & "','" & j_min & "min " & j_sec & "sec','" & MEasy & "','" & MNormal & "','" & MHard & "', '" & j_jelly & "','" & j_gem & "','" & oPoint & "','" & p_pic & "','" & strDate & "','" & ranking & "','y','" & j_MoneyType & "'];"
		
		
		count = count + 1
		
		objRs.MoveNext
		
	Loop	
	
	objRs.Close
	Set objRs = Nothing
	
	objDBConn.Close
	Set objDBConn = Nothing
	
	arrTempArtist = Split(Mid(strTempArtist, 2), "|")
	arrTempGenre = Split(Mid(strTempGenre, 2), "|")
	arrTempSubject = Split(Mid(strTempSubject, 2), "|")
	arrTempEasy = Split(Mid(strTempEasy, 2), "|")
	arrTempPoint = Split(Mid(strTempPoint, 2), "|")
	arrTempPrice = Split(Mid(strTempPrice, 2), "|")
	arrTempDate = Split(Mid(strTempDate, 2), "|")
		
	arrSortArtist = Split(Mid(strSort, 2), "|")
	arrSortGenre = Split(Mid(strSort, 2), "|")
	arrSortSubject = Split(Mid(strSort, 2), "|")
	arrSortEasy = Split(Mid(strSort, 2), "|")
	arrSortPoint = Split(Mid(strSort, 2), "|")
	arrSortPrice = Split(Mid(strSort, 2), "|")
	arrSortDate = Split(Mid(strSort, 2), "|")		
	
		
	subArraySort arrTempArtist, arrSortArtist, "ASC"
	subArraySort arrTempGenre, arrSortGenre, "ASC"
	subArraySort arrTempSubject, arrSortSubject, "ASC"
	subArraySort arrTempEasy, arrSortEasy, "ASC"
	subArraySort arrTempPoint, arrSortPoint, "DESC"
	subArraySort arrTempPrice, arrSortPrice, "ASC"	
	subArraySort arrTempDate, arrSortDate, "DESC"
	
	subStringMake arrSortArtist, "arrSortArtist", strFile3
	subStringMake arrSortGenre, "arrSortGenre", strFile3
	subStringMake arrSortSubject, "arrSortSubject", strFile3
	subStringMake arrSortEasy, "arrSortEasy", strFile3
	subStringMake arrSortPoint, "arrSortPoint", strFile3
	subStringMake arrSortPrice, "arrSortPrice", strFile3
	subStringMake arrSortDate, "arrSortDate", strFile3
	
	strFile1 = "var arrM = new Array();" & "<br>"
	strFile1 = strFile1 & "var arrSortArtist=new Array();" & "<br>"
	strFile1 = strFile1 & "var arrSortGenre=new Array();" & "<br>"
	strFile1 = strFile1 & "var arrSortSubject=new Array();" & "<br>"
	strFile1 = strFile1 & "var arrSortEasy=new Array();" & "<br>"
	strFile1 = strFile1 & "var arrSortPoint=new Array();" & "<br>"
	strFile1 = strFile1 & "var arrSortPrice=new Array();" & "<br>"
	strFile1 = strFile1 & "var arrSortDate=new Array();" & "<br>"
	strFile1 = strFile1 & "var arrKindSort=new Array();"
	
	Response.Write "<span style='color:#555555;font-size:9pt'>" & strFile1 & "</span><p>"
	Response.Write "<span style='color:#555555;font-size:9pt'>" & strFile2 & "</span><p>"
	Response.Write "<span style='color:#555555;font-size:9pt'>" & strFile3 & "</span><br>"
	Response.Flush ()
		

	strFile = Replace(strFile1, "<br>", vbCrLf) & vbCrLf & Replace(strFile2, "<br>", vbCrLf) & vbCrLf & vbCrLf & Replace(strFile3, "<br>", vbCrLf)

	NowURL = "/gamemusic/"
	NowURL = Server.MapPath (NowURL) & "\"
	
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	Set objFile = objFSO.CreateTextFile (NowURL & "gamemusic_info.js", True)
	
	objFile.WriteLine(strFile)
	
	objFile.Close
	Set objFile = Nothing
	
	Set objFSO = Nothing
	
	Response.Write ("<script language=javascript>alert('“Ù¿÷…ÃµÍ–≈œ¢∏¸–¬ÕÍ≥….\n\n«Î¡¨Ω””Œœ∑≤¢ºÏ≤È◊ ¡œµƒÕÍ’˚–‘∫Õø…”√–‘£°.');</script>")
	
	Response.End 
	
	'''°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î
	'''°Î Ω®¡¢”–πÿ ˝æ› ˝æ›∏Ò Ω£∫
	'''°Î arrSortArtist = [52, 57, 62, 63, 65, 78, 79];
	'''°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î
	Sub subStringMake(arrSort, strName, strTemp)
		
		Dim arrayLength
		Dim i, j, k
		
		arrayLength = UBound(arrSort)
		
		strTemp = strTemp & strName & "=["
		
		For i = 0 To arrayLength
			strTemp = strTemp & CInt(arrSort(i))
			If i <> arrayLength Then
				strTemp = strTemp & ","
			End If
		Next
		
		strTemp = strTemp & "];" & "<br>"
		
	End Sub
	
	'''°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î
	'''°Î πËø≠¿ª ¡§∑ƒ«œ¥¬ ∞˜¿‘¥œ¥Á.
	'''°Î πˆ∫Ì º“∆Æ ¿ÃøÎ
	'''°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î
	Sub subArraySort(arrTemp, arrSort, sortType)
			
		Dim arrayLength
		Dim i, j, k
				
		arrayLength = UBound(arrTemp)
				
		For i =  0   To arrayLength
		' ø©±‚º≠ ∫Œ≈Õ∞° πˆ∫Ì º“∆Æ ¿Ã¥Ÿ.  πËø≠¿« ±Ê¿Ã∏∏≈≠ ¥ŸΩ√ π›∫ππÆ¿ª µ∑¥Ÿ. 
			For j = 1   To arrayLength - i      ' 2¡ﬂ π›∫ππÆ¿Ã¥Ÿ. 
			'str_length - i ¿« ¿ÃπÃ¥¬ ¡¶¿œ ∏∂¡ˆ∏∑ø° ¿÷¥¬ ¡¶¿œ ≈´πÆ¿⁄¥¬ ¥ŸΩ√ ∫Ò±≥«“ « ø‰∞° æ¯æÓº≠¿Ã¥Ÿ. 
				
				If sortType = "ASC" Then
					If arrTemp(j - 1) > arrTemp(j) Then     ' "a" øÕ "s" ∏¶ ∫Ò±≥ «ÿº≠ 
						k = arrTemp(j - 1)                          ' "s"∞° ≈©∏È ¿”Ω√ ∫Øºˆø° ¿˙¿Â«ÿ≥ı∞Ì
						arrTemp(j - 1) = arrTemp(j)           '¿⁄∏Æ∏¶ º≠∑Œ πŸ≤€¥Ÿ. 
						arrTemp(j) = k
								              
						k = arrSort(j - 1)                          ' "s"∞° ≈©∏È ¿”Ω√ ∫Øºˆø° ¿˙¿Â«ÿ≥ı∞Ì
						arrSort(j - 1) = arrSort(j)           '¿⁄∏Æ∏¶ º≠∑Œ πŸ≤€¥Ÿ. 
						arrSort(j) = k
					End If
				Else
					If arrTemp(j - 1) < arrTemp(j) Then     ' "a" øÕ "s" ∏¶ ∫Ò±≥ «ÿº≠ 
						k = arrTemp(j - 1)                          ' "s"∞° ≈©∏È ¿”Ω√ ∫Øºˆø° ¿˙¿Â«ÿ≥ı∞Ì
						arrTemp(j - 1) = arrTemp(j)           '¿⁄∏Æ∏¶ º≠∑Œ πŸ≤€¥Ÿ. 
						arrTemp(j) = k
								              
						k = arrSort(j - 1)                          ' "s"∞° ≈©∏È ¿”Ω√ ∫Øºˆø° ¿˙¿Â«ÿ≥ı∞Ì
						arrSort(j - 1) = arrSort(j)           '¿⁄∏Æ∏¶ º≠∑Œ πŸ≤€¥Ÿ. 
						arrSort(j) = k
					End If
				End If

			Next
		Next
	End Sub



	'''°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î
	'''°Î ¿⁄∏Æºˆ∞° ∏¿⁄∂ˆ∂ß æ’¿⁄∏Æø° « ø‰«— ¿⁄∏Æºˆ ∏∏≈≠ "0" ¿ª √§øˆ¡÷¥¬ «‘ºˆ
	'''°Î øπ) CheckLength("1", 3) ==> "001"
	'''°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î°Î
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

Response.End 
%>