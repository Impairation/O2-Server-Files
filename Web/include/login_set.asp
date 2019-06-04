<%
	'''= Trim 추가 by staeho 2004-07-06
	Dim setGameID, setNick, setsex
	
	If Len(Trim(Request.Cookies ("MGAME")("ID"))) > 0 Then
		setGameID = Trim(Request.Cookies ("MGAME")("ID"))
		setNick = Trim(Request.Cookies("O2Jam")("NICK"))
		setSex = Trim(Request.Cookies ("MGAME")("SEX"))
	ElseIf Len(Trim(Request.Cookies("O2Jam")("memberID"))) > 0 Then
		setGameID = Trim(Request.Cookies ("O2Jam")("GameMemberID"))
		setNick = Trim(Request.Cookies("O2Jam")("memberNick"))
		setSex = Trim(Request.Cookies ("O2Jam")("memberSex"))
	Else
		setGameID = ""
		setNick = ""
		setSex = ""
	End If

%>
<SCRIPT LANGUAGE="JavaScript">
<!--
	function play()
	{
		alert("로그인후 이용해주세요");
		if ((document.frmLogin.mgid) != "undefined") 	
			{document.frmLogin.mgid.focus();}
	}

	// NX 에서 씀 (로그인이 화면에 없음)
	function playno()
	{
		alert("로그인후 이용해주세요");
	
	}
//-->
</SCRIPT>