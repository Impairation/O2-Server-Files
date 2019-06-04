<%
	If Request("memberID") <> "" Then
		Response.Cookies("O2Jam")("memberID") 	=  Request("memberID")
	End If

	User_NickName	= Request.Form("User_NickName")
	User_NickName	= Replace(User_NickName,"'","ⅴ")

	pagesize	= 10
	GotoPage	= Request.QueryString("GotoPage")

	If GotoPage = "" or IsNull(GotoPage) Then
 		GotoPage = 1
	End If
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>排名</title>
<link href="http://o2jam.9you.com/script/style.css" rel="stylesheet" type="text/css">

<script language="javascript" src="/Lib/common2.js"></script>
<script language="JavaScript">

	function goAuto() {
	var vSearchStr=document.form1.User_NickName.value ;
	var objInput = document.form1.User_NickName;
		if(	vSearchStr=='' ||
			vSearchStr==document.form1.User_NickName.defaultValue ||
			vSearchStr.indexOf(' ')!=-1 ||
			vSearchStr=='about' ||
			vSearchStr=='1' ||
			vSearchStr=='after' ||
			vSearchStr=='2' ||
			vSearchStr=='all' ||
			vSearchStr=='also' ||
			vSearchStr=='3' ||
			vSearchStr=='an' ||
			vSearchStr=='4' ||
			vSearchStr=='and' ||
			vSearchStr=='5' ||
			vSearchStr=='another' ||
			vSearchStr=='6' ||
			vSearchStr=='any' ||
			vSearchStr=='7' ||
			vSearchStr=='are' ||
			vSearchStr=='8' ||
			vSearchStr=='as' ||
			vSearchStr=='9' ||
			vSearchStr=='at' ||
			vSearchStr=='0' ||
			vSearchStr=='be' ||
			vSearchStr=='$' ||
			vSearchStr=='because' ||
			vSearchStr=='been' ||
			vSearchStr=='before' ||
			vSearchStr=='being' ||
			vSearchStr=='between' ||
			vSearchStr=='both' ||
			vSearchStr=='but' ||
			vSearchStr=='by'||
			vSearchStr=='came' ||
			vSearchStr=='can' ||
			vSearchStr=='come' ||
			vSearchStr=='could' ||
			vSearchStr=='did' ||
			vSearchStr=='do' ||
			vSearchStr=='each' ||
			vSearchStr=='for' ||
			vSearchStr=='from' ||
			vSearchStr=='get' ||
			vSearchStr=='got' ||
			vSearchStr=='has' ||
			vSearchStr=='had' ||
			vSearchStr=='he' ||
			vSearchStr=='have' ||
			vSearchStr=='her' ||
			vSearchStr=='here' ||
			vSearchStr=='him' ||
			vSearchStr=='himself' ||
			vSearchStr=='his' ||
			vSearchStr=='how' ||
			vSearchStr=='if' ||
			vSearchStr=='in' ||
			vSearchStr=='into' ||
			vSearchStr=='is' ||
			vSearchStr=='it' ||
			vSearchStr=='like' ||
			vSearchStr=='make' ||
			vSearchStr=='many' ||
			vSearchStr=='me' ||
			vSearchStr=='might' ||
			vSearchStr=='more' ||
			vSearchStr=='most' ||
			vSearchStr=='much' ||
			vSearchStr=='must' ||
			vSearchStr=='my' ||
			vSearchStr=='never' ||
			vSearchStr=='now' ||
			vSearchStr=='of' ||
			vSearchStr=='on' ||
			vSearchStr=='only' ||
			vSearchStr=='or' ||
			vSearchStr=='other' ||
			vSearchStr=='our' ||
			vSearchStr=='out' ||
			vSearchStr=='over' ||
			vSearchStr=='said' ||
			vSearchStr=='same' ||
			vSearchStr=='see' ||
			vSearchStr=='should' ||
			vSearchStr=='since' ||
			vSearchStr=='some' ||
			vSearchStr=='still' ||
			vSearchStr=='such' ||
			vSearchStr=='take' ||
			vSearchStr=='than' ||
			vSearchStr=='that' ||
			vSearchStr=='the' ||
			vSearchStr=='their' ||
			vSearchStr=='them' ||
			vSearchStr=='then' ||
			vSearchStr=='there' ||
			vSearchStr=='these' ||
			vSearchStr=='they' ||
			vSearchStr=='this' ||
			vSearchStr=='those' ||
			vSearchStr=='through' ||
			vSearchStr=='to' ||
			vSearchStr=='too' ||
			vSearchStr=='under' ||
			vSearchStr=='up' ||
			vSearchStr=='very' ||
			vSearchStr=='was' ||
			vSearchStr=='way' ||
			vSearchStr=='we' ||
			vSearchStr=='well' ||
			vSearchStr=='were' ||
			vSearchStr=='what' ||
			vSearchStr=='where' ||
			vSearchStr=='which' ||
			vSearchStr=='while' ||
			vSearchStr=='who' ||
			vSearchStr=='with' ||
			vSearchStr=='would' ||
			vSearchStr=='you' ||
			vSearchStr=='your' ||
			vSearchStr=='a' ||
			vSearchStr=='b' || 
			vSearchStr=='c' || 
			vSearchStr=='d' || 
			vSearchStr=='e' || 
			vSearchStr=='f' || 
			vSearchStr=='g' || 
			vSearchStr=='h' || 
			vSearchStr=='i' || 
			vSearchStr=='j' || 
			vSearchStr=='k' || 
			vSearchStr=='l' || 
			vSearchStr=='m' || 
			vSearchStr=='n' || 
			vSearchStr=='o' || 
			vSearchStr=='p' || 
			vSearchStr=='q' || 
			vSearchStr=='r' || 
			vSearchStr=='s' || 
			vSearchStr=='t' || 
			vSearchStr=='u' || 
			vSearchStr=='v' || 
			vSearchStr=='w' || 
			vSearchStr=='x' || 
			vSearchStr=='y' || 
			vSearchStr=='z'			
			) 
		{
			alert('您输入的词无法搜索，请输入其他词.');
			objInput.focus();
		}
		else if (fnTrim(objInput.value).length < 2)
		{
		
			alert ("请输入2字以上搜索词");
			objInput.value = "";
			objInput.focus();
			return (false);
		}
		else
		{
			document.form1.action="paimin100_result.asp";
			document.form1.submit();
		}
	}

</script>
</head>

<body>
<table width="420"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
	<tr align="center" bgcolor="#EEEEEE">
		<td height="30" colspan="5">当前100名</td>
	</tr>
	<tr align="center" bgcolor="#EEEEEE">
		<td width="20%" height="20">排行</td>
		<td width="20%" height="20">姓名</td>
		<td width="20%" height="20">等级</td>
		<td width="20%" height="20">经验</td>
		<td width="20%" height="20">浮动</td>
	</tr>
	
	
<%
Set Conn = Server.CreateObject ("ADODB.Connection")
Conn.Open (Application("Connection_ConnectionString"))

strSQL 	= "Select count(seq) FROM TB_Ranking WHERE ValidFlag = '1'"
Set objDBrs	= Conn.Execute(strSQL)

totalRecord = objDBrs(0)
pagecount = Clng(totalRecord / pagesize)

namuzi = (objDBrs(0) mod pagesize)/pagesize

If namuzi > 0 And namuzi < 0.5 Then
	pagecount = pagecount + 1        
End If

objDBrs.Close
Set objDBrs = Nothing

strSQL = "PROC_RANKING_LIST_UP" 
Set objDBrs	= Conn.Execute(strSQL)

If Not(objDBrs.BOF or objDBrs.EOF) then

	objDBrs.Move pagesize * (GotoPage-1)  

	ib=1
	i = 1
	If Gotopage = 1 Then
		i = totalrecord
	Else
		i = totalrecord - (pagesize * (Gotopage - 1) )
	End If

	Do until objDBrs.EOF or i = totalrecord - (pagesize * Gotopage)	
		
		'Ranking					= objDBrs("Ranking")
		Ranking				= ib + pagesize * (Gotopage-1)
		User_Index_ID		= objDBrs("User_Index_ID")
		User_ID					= objDBrs("User_ID")
		User_NickName		= objDBrs("User_NickName")
		Sex						= objDBrs("Sex")
		Level						= objDBrs("Level")
		Battle						= objDBrs("Battle")
		Win						= objDBrs("Win")
		Draw						= objDBrs("Draw")
		Lose						= objDBrs("Lose")
		Experience			= objDBrs("Experience")
		ChangeType			= objDBrs("ChangeType")
		ChangeRanking		= objDBrs("ChangeRanking")
%>
	<tr bgcolor="#EEEEEE">
		<td height="20" align="center"><%=Ranking%></td>
		<td align="center" class="title_14"><%=User_NickName%></td>
		<td align="center" class="title_14">Lv.<%=Level%></td>
		<td align="center"><%=Experience%></td>
		<td align="center"><%=ChangeRanking%></td>
	</tr>
	
<% 
		objDBrs.Movenext
		i = i - 1
		ib = ib +1
	Loop
End If

objDBrs.Close
Set objDBrs = Nothing

Conn.Close
Set Conn = Nothing
%>
	<tr bgcolor="#EEEEEE">
		<td height="20" colspan="5" align="center">
		<% blockPage=Int((GotoPage-1)/10)*10+1 
		
			'response.write "<b>" & GotoPage & "-" & blockPage & "</b>" 
		%>
			
		<% if (GotoPage > 1) and (GotoPage < 11) then %>
			<a href="paimin100.asp?GotoPage=<%=GotoPage-1%>"><span class=''> [前一页] </span></a>
		<% else %>
			<span class=''> [前一页] </span>
		<% end if %>
			
		<%	
			i=1
			Do Until i > 10 or blockPage > pagecount
				If blockPage=int(GotoPage) Then
					%><strong><span class="">[<%=blockPage%>]</span></strong><%
				Else
					%><a href="paimin100.asp?GotoPage=<%=blockPage%>"><span class=''> [<%=blockPage%>] </span></a><%
				End If
				blockPage=blockPage+1
				i = i + 1
			Loop
		%>
		<% if (GotoPage > 0) and (GotoPage < 10) then %>
			<a href="paimin100.asp?GotoPage=<%=GotoPage+1%>"><span class=''> [后一页] </span></a>
		<% else %>
			<span class=''> [后一页] </span>
		<% end if %>

		</td>
	</tr>
	<tr bgcolor="#EEEEEE">
	<form Method="POST" action='javascript:goAuto()' name="form1">
	<td height="24" colspan="5" align="center">搜索您的排名：
		<input name="User_NickName" type="text" value="请输入姓名" size="10"> <input type="submit" name="Submit" value="搜索" >
	</td>
	</form>
	</tr>
</table>
</body>
</html>