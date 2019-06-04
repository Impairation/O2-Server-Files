<%@ LANGUAGE="VBSCRIPT" %>

<%
Response.Buffer = true
Response.Expires=0

seq = Request("seq")
	
	Set Conn = Server.CreateObject ("ADODB.Connection")
	Conn.Open (Application("Connection_ConnectionString"))

	SQL = "Select j_seq,j_musicID,j_subject,j_ListFlag,j_category,j_kind,m_kind,j_produce,j_BPM,j_min,j_sec,NEasy,NNormal,NHard,"
	SQL = SQL & "MEasy,MNormal,MHard,p_name,n_name,j_url,j_url1,p_pic,p_pic2,j_MoneyType,"
	SQL = SQL & "j_jelly,j_gem,content,content1,RegDate,intHtml1,intHtml2 From TB_JAMBOX Where j_seq = " & seq

	Set RS = Conn.Execute(SQL)
	
	If RS.Eof Then

	Else
		j_seq 			= Trim(RS(0))
		j_musicID		= Trim(RS(1))
		subject 			= Trim(RS(2))
		ListFlag			= Trim(RS(3))
		category		= Trim(RS(4))
		kind				= Trim(RS(5))
		m_kind			= Trim(RS(6))
		produce			= Trim(RS(7))
		BPM				= Trim(RS(8))
		min				= Trim(RS(9))
		sec				= Trim(RS(10))
		NEasy			= Trim(RS(11))
		NNormal		= Trim(RS(12))
		NHard			= Trim(RS(13))
		MEasy			= Trim(RS(14))
		MNormal		= Trim(RS(15))
		MHard			= Trim(RS(16))
		p_name			= Trim(RS(17))
		n_name			= Trim(RS(18))
		j_url				= Trim(RS(19))
		j_url1				= Trim(RS(20))
		p_pic				= Trim(RS(21))
		p_pic2			= Trim(RS(22))
		MoneyType	= Trim(RS(23))
		jelly				= Trim(RS(24))
		gem				= Trim(RS(25))
		content			= trim(RS(26))
		content1			= trim(RS(27))
		RegDate			= Trim(RS(28))
		intHtml1			= Trim(RS(29))
		intHtml2			= Trim(RS(30))
	End If
%>

<html>

<head>
<title>Jambox Management System(Music Info Edit)</title>
<style>
<!--
td           { font-size: 9pt; font-family: ±¼¸²; line-height: 10pt }

a:link       { color: black; text-decoration: none }
a:visited    { color: black; text-decoration: none }
a:active     { color: black; text-decoration: none }
A:hover {
  text-decoration: underline; none
}
 .text1  { font-family:±¼¸²,arial;  font-size:9pt; color: black; }
 .text1  A { text-decoration: none; color: #390000}
 .text1  A:hover { text-decoration: none; color: #840230}

 .text2  { font-family:±¼¸²,arial;  font-size:9pt; color: #390000; }
 .text2  A { text-decoration: none; color: #390000}
 .text2  A:hover { text-decoration: none; color: #840230}

 .text3  { font-family:±¼¸²,arial;  font-size:9pt; color: #0242A2; }
 .text3  A { text-decoration: none; color: #0242A2}
 .text3  A:hover { text-decoration: none; color: #07C02A}
 .text3 {  height: 50px; width: 200px}

 .text4  { font-family:±¼¸²,arial;  font-size:9pt; color: #004E3A; }
 .text4  A { text-decoration: none; color: #004E3A}
 .text4  A:hover { text-decoration: none; color: #FFA301}

 -->
</style>

<script language=javascript>

<!--
function goAuto(){
	
	
	//MusicList
	if (document.form.MusicList.value.length == 0)
	{
		alert ("Input Genre");
		document.form.MusicList.focus();
		return (false);
	}

	//MusicKind
	if (document.form.MusicKind.value.length == 0)
	{
		alert ("Input Classfy.");
		document.form.MusicKind.focus();
		return (false);
	}

	//Á¦ÀÛÀÚ
	if (document.form.ID_produce.value.length == 0)
	{
		alert ("Input Producer");
		document.form.ID_produce.focus();
		return (false);
	}

	//ÀÛ°îÀÚ
	if (document.form.ID_composer.value.length == 0)
	{
		alert ("Input Composer");
		document.form.ID_composer.focus();
		return (false);
	}

	//³ëÆ®Á¦ÀÛÀÚ
	if (document.form.ID_notemaker.value.length == 0)
	{
		alert ("Input Note Maker");
		document.form.ID_notemaker.focus();
		return (false);
	}

	//subject
	if (document.form.subject.value.length == 0)
	{
		alert ("Input Music Title");
		document.form.subject.value = "";
		document.form.subject.focus();
		return (false);
	}

	//BPM
	if (document.form.BPM.value == 0)
	{
		alert ("Input BPM");
		document.form.BPM.focus();
		return (false);
	}

	//ºÐ
	if (document.form.min.value == 0)
	{
		alert ("Input minute");
		document.form.min.focus();
		return (false);
	}

	//ÃÊ
	if (document.form.sec.value == 0)
	{
		alert ("Input second");
		document.form.sec.focus();
		return (false);
	}

	//³ëÆ®¼ö Easy
	if (document.form.NEasy.value == 0)
	{
		alert ("Input Note Count(Easy)");
		document.form.NEasy.focus();
		return (false);
	}

	//³ëÆ®¼ö Normal
	if (document.form.NNormal.value == 0)
	{
		alert ("Input Note Count(Normal)");
		document.form.NNormal.focus();
		return (false);
	}

	//³ëÆ®¼ö Hard
	if (document.form.NHard.value == 0)
	{
		alert ("Input Note Count(Hard)");
		document.form.NHard.focus();
		return (false);
	}

	//³­ÀÌµµ EASY
	if (document.form.MEasy.value == 0)
	{
		alert ("Input Difficulty(Easy)");
		document.form.MEasy.focus();
		return (false);
	}

	//³­ÀÌµµ NORMAL
	if (document.form.MNormal.value == 0)
	{
		alert ("Input Difficulty(Normal)");
		document.form.MNormal.focus();
		return (false);
	}

	//³­ÀÌµµ Hard
	if (document.form.MHard.value == 0)
	{
		alert ("Input Difficulty(Hard)");
		document.form.MHard.focus();
		return (false);
	}

	//°î°¡°Ý
	if (document.form.jelly.value.length == 0)
	{
		alert ("Input Epoints");
		document.form.jelly.focus();
		return (false);
	}

	//Àë°¡°Ý
	if (document.form.gem.value.length == 0)
	{
		alert ("Input Gem");
		document.form.gem.focus();
		return (false);
	}
	
	document.form.submit();
}


function goBack(){
	history.go(-1);
}

//-->
</script>

</head>

<body>

<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
        <td height="25" align="center" bgcolor="#E8E8E8"><a href="JamBoxList.asp"><b>[Go to List]</b></a></td>
    </tr>
</table>

<table border="0" width="100%">
    <tr>
        <td height="5" align="center" bgcolor="white"></td>
    </tr>
</table>

<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
        <td height="25" bgcolor="white" align="center">Jambox Management System(Music Info Edit)</td>
    </tr>
</table>

<table border="0" width="100%">
    <tr>
        <td height="5" align="center" bgcolor="white"></td>
    </tr>
</table>

<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
<form name = "form" method = "post" action = "music_modi_ok.asp">

		<td width="180" bgcolor="#E8E8E8">&nbsp;* Genre</td>
        <td width="800" bgcolor="white">
			&nbsp;<input type="text" name="MusicList" value="<%=kind%>" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>

    <tr>
		<td width="180" bgcolor="#E8E8E8">&nbsp;* Classfy&nbsp;</td>
        <td width="800" bgcolor="white">
			&nbsp;<input type="text" name="MusicKind" value="<%=m_kind%>" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>

    <tr>
		<td width="180" bgcolor="#E8E8E8" height="25">&nbsp;* Producer</td>
        <td width="800" bgcolor="white">			
            &nbsp;<input type="text" name="ID_produce" value="<%=produce%>" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>
    <tr>
		<td width="180" bgcolor="#E8E8E8" height="25">
			&nbsp;* Composer
		</td>
        <td width="800" bgcolor="white" height="25">			
           &nbsp;<input type="text" name="ID_composer" value="<%=p_name%>" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>
    <tr>
		<td width="180" bgcolor="#E8E8E8" height="25">
			&nbsp;* Note Maker
		</td>
        <td width="800" bgcolor="white" height="25">		
            &nbsp;<input type="text" name="ID_notemaker" value="<%=n_name%>" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>

    <tr>
<input type="hidden" name="seq" value="<%=j_seq%>">
        <td width="180" bgcolor="#E8E8E8">&nbsp; musicID</td>
        <td width="800" bgcolor="white">&nbsp;<input type="text" name="musicID" value="<%=j_musicID%>" size="50"  style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"></td>
    </tr>
    <tr>
        <td width="180" bgcolor="#E8E8E8">&nbsp;* Music Title</td>
        <td width="800" bgcolor="white">&nbsp;<input type="text" name="subject" value="<%=subject%>" size="50"  style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"></td>
    </tr>
    <tr>
        <td width="180" bgcolor="#E8E8E8">&nbsp;* Show Status</td>
        <td width="800" bgcolor="white">
			&nbsp;<select name="List_Value" size="1" class=text3>
            <option <%if ListFlag = 0 then%>selected<%end if%> value="0">X Hide in List</option>
            <option <%if ListFlag = 1 then%>selected<%end if%> value="1">O Show in List</option>
            <option <%if ListFlag = 2 then%>selected<%end if%> value="2">&nbsp;&nbsp;&nbsp;New in List</option>                                                              
            </select>
        </td>
    </tr>
    <tr>
        <td width="180" valign="middle" rowspan="3" bgcolor="#E8E8E8">&nbsp;* Meta Information</td>
        <td width="800" bgcolor="white">&nbsp;BPM : <input type="text" name="BPM" value="<%=BPM%>" size="10"  style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
        </td>
    </tr>
    <tr>
        <td width="800" bgcolor="white">&nbsp;Song Length : <input type="text" name="min" value="<%=min%>" maxlength="2" size="2"  style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"> 
            min <input type="text" name="sec" value="<%=sec%>" maxlength="2" size="2"  style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"> sec
        </td>
    </tr>
    <tr>
        <td width="800" bgcolor="white">&nbsp;
            Note Count : Easy <input type="text" name="NEasy" value="<%=NEasy%>" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">&nbsp;Normal 
            <input type="text" name="NNormal" value="<%=NNormal%>" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
			&nbsp;Hard <input type="text" name="NHard" value="<%=NHard%>" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
        </td>
    </tr>
    <tr>
        <td width="180" bgcolor="#E8E8E8" height="25">&nbsp;&nbsp;* Difficulty</td>
        <td width="800" bgcolor="white" height="25">
            &nbsp;Easy <input type="text" name="MEasy" value="<%=MEasy%>" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"> 
            &nbsp;&nbsp;Normal <input type="text" name="MNormal" value="<%=MNormal%>" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"> 
            &nbsp;&nbsp;Hard <input type="text" name="MHard" value="<%=MHard%>"  maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>    
    <tr>
        <td width="180" bgcolor="#E8E8E8">&nbsp;&nbsp;&nbsp;Thumnail Image</td>
        <td width="800" bgcolor="white">
			&nbsp;Thumnail Image : /images/jambox/files/<input type="text" name="pic_1" value="<%=p_pic%>" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">          
		</td>
    </tr>    
    <tr>
        <td width="180" bgcolor="#E8E8E8" height="25">&nbsp;&nbsp;*&nbsp;Price</td>
        <td width="800" bgcolor="white" height="25">&nbsp;
		<input type="text" name="jelly" value="<%=jelly%>" style="font: 9pt ±¼¸²; border:1 solid black;">&nbsp;Cash
		</td>
    </tr>

    <tr>
        <td width="180" bgcolor="#E8E8E8" height="25">&nbsp;&nbsp;* Gem Price</td>
        <td width="800" bgcolor="white" height="25">&nbsp;
		<input type="text" name="gem" value="<%=gem%>" style="font: 9pt ±¼¸²; border:1 solid black;">&nbsp;Gem
		</td>
    </tr>
   <tr>
        <td width="180" bgcolor="#E8E8E8" height="25">&nbsp;&nbsp;* Sale Type</td>
        <td width="800" bgcolor="white" height="25">
			<input type="radio" name="MoneyType" value="P" <%if MoneyType = "P" Then%>checked<%end if%>>Charged 
			<input type="radio" name="MoneyType" value="F" <%if MoneyType = "F" Then%>checked<%end if%>>Free
			<input type="radio" name="MoneyType" value="W" <%if MoneyType = "W" Then%>checked<%end if%>>Can only be bought in the web
			<input type="radio" name="MoneyType" value="T" <%if MoneyType = "T" Then%>checked<%end if%>>Can only be bought in a set
			<input type="radio" name="MoneyType" value="X" <%if MoneyType = "X" Then%>checked<%end if%>>Sales temporary suspended
			<input type="radio" name="MoneyType" value="Z" <%if MoneyType = "Z" Then%>checked<%end if%>>Sales stopped
			
		</td>
    </tr>
</table>

<table border="0" width="100%">
    <tr>
        <td height="5" align="center" bgcolor="white"></td>
    </tr>
</table>

<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
        <td width="100%" align="center" bgcolor="white">
			<input type="button" OnClick = "goAuto()" value="Edit"  style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"><!-- &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Ãë¼Ò"> -->
        </td>
</form>
    </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>

</html>