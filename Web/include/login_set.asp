<%
	'''= Trim �߰� by staeho 2004-07-06
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
		alert("�α����� �̿����ּ���");
		if ((document.frmLogin.mgid) != "undefined") 	
			{document.frmLogin.mgid.focus();}
	}

	// NX ���� �� (�α����� ȭ�鿡 ����)
	function playno()
	{
		alert("�α����� �̿����ּ���");
	
	}
//-->
</SCRIPT>