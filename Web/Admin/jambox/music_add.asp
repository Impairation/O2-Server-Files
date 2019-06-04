<%@ LANGUAGE="VBSCRIPT" %>
<%
Response.Buffer = true
Response.Expires=0
%>

<html>

<head>
<title>Jambox Management System(Music Add)</title>
<style>
<!--
td           { font-size: 9pt; font-family: ±¼¸²; line-height: 10pt }

a:link       { color: black; text-decoration: none }
a:visited    { color: black; text-decoration: none }
a:active     { color: black; text-decoration: none }
A:hover {
  text-decoration: underline; none
}
 .text3 {  height: 50px; width: 150px}

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

 //-->
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

<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body>


<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
        <td height="30" bgcolor="#E8E8E8" align="center"><a href="JamBoxList.asp"><b>[Go to List]</b></a></td>
    </tr>
</table>

<table border="0" width="100%">
    <tr>
        <td height="5" bgcolor="white" align="center"></td>
    </tr>
</table>

<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
        <td height="25" bgcolor="white" align="center">Jambox Management System(Music Add)</td>
    </tr>
</table>

<table border="0" width="100%">
    <tr>
        <td height="5" bgcolor="white" align="center"></td>
    </tr>
</table>

<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
<form name = "form" method = "post" action = "music_add_ok.asp">
		<td width="180" bgcolor="#E8E8E8">&nbsp;*&nbsp;Genre</td>
        <td width="800" bgcolor="white">
			&nbsp;<input type="text" name="MusicList" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>
    <tr>
		<td width="180" bgcolor="#E8E8E8">&nbsp;* Classfy&nbsp;</td>
        <td width="800" bgcolor="white">
			&nbsp;<input type="text" name="MusicKind" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>
    <tr>
		<td width="180" bgcolor="#E8E8E8" height="25">&nbsp;* Producer</td>
        <td width="800" bgcolor="white">
			&nbsp;<input type="text" name="ID_produce" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">			
		</td>
    </tr>
    <tr>
		<td width="180" bgcolor="#E8E8E8" height="25">
			&nbsp;* Composer
		</td>
        <td width="800" bgcolor="white" height="25">
			&nbsp;<input type="text" name="ID_composer" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">						
		</td>
    </tr>
    <tr>
		<td width="180" bgcolor="#E8E8E8" height="25">
			&nbsp;* Note Maker
		</td>
        <td width="800" bgcolor="white" height="25">
        &nbsp;<input type="text" name="ID_notemaker" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">								
		</td>
    </tr>

    <tr>
		<td width="180" bgcolor="#E8E8E8">&nbsp; musicID</td>
        <td width="800" bgcolor="white">
			&nbsp;<input type="text" name="musicID" size="15" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>

    <tr>
		<td width="180" bgcolor="#E8E8E8">&nbsp;* Music Title</td>
        <td width="800" bgcolor="white">
			&nbsp;<input type="text" name="subject" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>

    <tr>
        <td width="180" bgcolor="#E8E8E8" height="25">&nbsp;* Show Status</td>
        <td width="800" bgcolor="white" height="25">
			&nbsp;<select name="List_Value" size="1" class=text3>
            <option value="0">X Hide in List</option>
            <option value="1">O Show in List</option>                               
            <option value="2">&nbsp;&nbsp;&nbsp;New in List</option>
            </select>
        </td>
    </tr>
    <tr>
        <td width="180" bgcolor="#E8E8E8" valign="middle" rowspan="3">&nbsp;* Meta Information</td>
        <td width="800" bgcolor="white" height="25">&nbsp;BPM : <input type="text" name="BPM" size="10" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
        </td>
    </tr>
    <tr>
        <td width="800" bgcolor="white" height="25">&nbsp;Song Length : <input type="text" name="min" maxlength="2" size="2" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"> 
            min <input type="text" name="sec" maxlength="2" size="2" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"> sec
        </td>
    </tr>
    <tr>
        <td width="800" bgcolor="white" height="25">
            &nbsp;Note Count : Easy <input type="text" name="NEasy" value="-" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">&nbsp;Normal 
            <input type="text" value="-" name="NNormal" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
			&nbsp;Hard&nbsp;<input type="text" value="-" name="NHard" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
        </td>
    </tr>
    <tr>
        <td width="180" bgcolor="#E8E8E8" height="25">&nbsp;&nbsp;* Difficulty</td>
        <td width="800" bgcolor="white" height="25">
            &nbsp;Easy <input type="text" name="MEasy" value="0" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"> 
            &nbsp;&nbsp;Normal <input type="text" value="0" name="MNormal" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'"> 
            &nbsp;&nbsp;Hard <input type="text" value="0" name="MHard" maxlength="5" size="5" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">
		</td>
    </tr>    
    <tr>
        <td width="180" bgcolor="#E8E8E8">&nbsp;&nbsp;&nbsp;Thumnail Image</td>
        <td width="800" bgcolor="white">
			&nbsp;Thumnail Image : /images/jambox/files/<input type="text" name="pic_1" size="50" style="font: 9pt ±¼¸²; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#E3ECEC'" onMouseOut = "this.style.backgroundColor = '#ffffff'">          
		</td>
    </tr>
    <tr>
        <td width="180" bgcolor="#E8E8E8" height="25">&nbsp;&nbsp;*&nbsp;Price</td>
        <td width="800" bgcolor="white" height="25">&nbsp;
		<input type="text" name="jelly" style="font: 9pt ±¼¸²; border:1 solid black;">&nbsp;Cash
		</td>
    </tr>

    <tr>
        <td width="180" bgcolor="#E8E8E8" height="25">&nbsp;&nbsp;* Jam Price</td>
        <td width="800" bgcolor="white" height="25">&nbsp;
		<input type="text" name="gem" style="font: 9pt ±¼¸²; border:1 solid black;">&nbsp;Gem
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
        <td height="5" bgcolor="white" align="center"></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" bgcolor="black" width="100%">
    <tr>
        <td width="100%" align="center" bgcolor="white">
			<input type="button" OnClick = "goAuto()" value="Music Add" style="font: 9pt ±¼¸²; border:1 solid black;"><!-- &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Ãë¼Ò" style="font: 9pt ±¼¸²; border:1 solid black;"> -->
        </td>
</form>
    </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>

</html>
