<%			
''' 아래쪽 배너 이미지를 랜덤하게 보여주기 위해 숫자를 랜덤하게 뽑아냅니다.
''' 랜덤하게 보여줄 이미지의 갯수는 rndCount
				
rndCount = 4
				
Randomize
				
rndNum = Int((rndCount * Rnd) + 1)
				
'rndNum = 2 ''' 배너 이미지 고정.....
				
Select Case rndNum
%>
<%Case 1%>
<table width="100%" height="267" border="0" cellpadding="0" cellspacing="0">
<!-- #include virtual="/include/RSHead2.inc" -->
<%
		nmSQL = "Select TOP 3 p_pic From TB_JAMBOX WHERE j_listflag=2 order by j_seq desc"
		Set nmRS=Conn.Execute(nmSQL)		
	   '레코드를 화면상에 뿌려주기 위해 읽기
	
		if Not(nmRS.BOF or nmRS.EOF) then 

			Do until nmRS.EOF
				p_pic 		= nmRS(0)
%>
	<tr>
		<td valign="top"><img src="/images/jambox/files/<%=p_pic%>" width="80" height="80"></td>
	</tr>
<%
			nmRS.Movenext
			Loop
		END IF
		nmRS.Close
		Set nmRS = nothing
%>
<!-- #include virtual="/include/RSTail2.inc" -->
</table>
<%Case 2%>
<table width="100%" height="267" border="0" cellpadding="0" cellspacing="0">
<!-- #include virtual="/include/RSHead2.inc" -->
<%
		nmSQL = "Select TOP 3 p_pic From TB_JAMBOX WHERE j_listflag=2 order by j_seq asc"
		Set nmRS=Conn.Execute(nmSQL)		
	   '레코드를 화면상에 뿌려주기 위해 읽기
	
		if Not(nmRS.BOF or nmRS.EOF) then 

			Do until nmRS.EOF
				p_pic 		= nmRS(0)
%>
	<tr>
		<td valign="top"><img src="/images/jambox/files/<%=p_pic%>" width="80" height="80"></td>
	</tr>
<%
			nmRS.Movenext
			Loop
		END IF
		nmRS.Close
		Set nmRS = nothing
%>
<!-- #include virtual="/include/RSTail2.inc" -->
</table>
<%Case 3%>
<table width="100%" height="267" border="0" cellpadding="0" cellspacing="0">
<!-- #include virtual="/include/RSHead2.inc" -->
<%
		nmSQL = "Select TOP 3 p_pic From TB_JAMBOX WHERE j_listflag=2 order by j_musicid asc"
		Set nmRS=Conn.Execute(nmSQL)		
	   '레코드를 화면상에 뿌려주기 위해 읽기
	
		if Not(nmRS.BOF or nmRS.EOF) then 

			Do until nmRS.EOF
				p_pic 		= nmRS(0)
%>
	<tr>
		<td valign="top"><img src="/images/jambox/files/<%=p_pic%>" width="80" height="80"></td>
	</tr>
<%
			nmRS.Movenext
			Loop
		END IF
		nmRS.Close
		Set nmRS = nothing
%>
<!-- #include virtual="/include/RSTail2.inc" -->
</table>
<%Case 4%>
<table width="100%" height="267" border="0" cellpadding="0" cellspacing="0">
<!-- #include virtual="/include/RSHead2.inc" -->
<%
		nmSQL = "Select TOP 3 p_pic From TB_JAMBOX WHERE j_listflag=2 order by j_musicid desc"
		Set nmRS=Conn.Execute(nmSQL)		
	   '레코드를 화면상에 뿌려주기 위해 읽기
	
		if Not(nmRS.BOF or nmRS.EOF) then 

			Do until nmRS.EOF
				p_pic 		= nmRS(0)
%>
	<tr>
		<td valign="top"><img src="/images/jambox/files/<%=p_pic%>" width="80" height="80"></td>
	</tr>
<%
			nmRS.Movenext
			Loop
		END IF
		nmRS.Close
		Set nmRS = nothing
%>
<!-- #include virtual="/include/RSTail2.inc" -->
</table>
<%End Select%>