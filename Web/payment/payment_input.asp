<%
	gameid 	= Request.Form("gameid")
	aid1 	= Request.Form("aid1")
	aid2 	= Request.Form("aid2")
	aid3 	= Request.Form("aid3")
	aid4 	= Request.Form("aid4")
	aid5 	= Request.Form("aid5")
	aid6 	= Request.Form("aid6")
	aid7 	= Request.Form("aid7")
	aid8 	= Request.Form("aid8")
	aid9 	= Request.Form("aid9")
	aid10	= Request.Form("aid10")

	sid1 	= Request.Form("sid1")
	sid2 	= Request.Form("sid2")
	sid3 	= Request.Form("sid3")
	sid4 	= Request.Form("sid4")
	sid5 	= Request.Form("sid5")
	sid6 	= Request.Form("sid6")
	sid7 	= Request.Form("sid7")
	sid8 	= Request.Form("sid8")
	sid9 	= Request.Form("sid9")
	sid10	= Request.Form("sid10")

	tid1 	= Request.Form("tid1")
	tid2 	= Request.Form("tid2")
	
	gameid = Server.URLEncode (gameid)
%>
<html>
<head>
<title>::Ö§¸¶::</title>
</head>
<body bgcolor="#7BC9F4" leftmargin="10" topmargin="10" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<iframe src="payment_input_01.asp?gameid=<%=gameid%>&aid1=<%=aid1%>&aid2=<%=aid2%>&aid3=<%=aid3%>&aid4=<%=aid4%>&aid5=<%=aid5%>&aid6=<%=aid6%>&aid7=<%=aid7%>&aid8=<%=aid8%>&aid9=<%=aid9%>&aid10=<%=aid10%>&sid1=<%=sid1%>&sid2=<%=sid2%>&sid3=<%=sid3%>&sid4=<%=sid4%>&sid5=<%=sid5%>&sid6=<%=sid6%>&sid7=<%=sid7%>&sid8=<%=sid8%>&sid9=<%=sid9%>&sid10=<%=sid10%>&tid1=<%=tid1%>&tid2=<%=tid2%>" scrolling="auto" frameborder="0" width="727" height="401"></iframe>
</body>
</html>