<%@ LANGUAGE="VBSCRIPT" %>

<%

Response.Buffer = true
Response.Expires=0
%>



<%

	ListSort = Request("ListSort")
'	Response.Write "ListSort : " & ListSort & "<br>"

	seq = Request("seq")
'	Response.Write "seq : " & seq & "<br>"

	ListSort1 = Request("ListSort1")
'	Response.Write "ListSort1 : " & ListSort1 & "<br>"

if seq <> "" and ListSort1 <> "" then
%>
<!-- #include virtual="/include/RSHead2.inc" -->
<%
	mSQL = "Update TB_JAMBOX Set j_ListFlag = " & ListSort1 & " Where j_seq = " &seq
	Conn.Execute(mSQL)
%>
<!-- #include virtual="/include/RSTail2.inc" -->
<%end if%>

<!-- ∆˚√≥∏Æ∏¶ ¿ß«— -->
<!-- #include virtual="/include/RSHead2.inc" -->
<%
		cSQL = "Select count(*) From TB_JAMBOX"
		Set FormResult=Conn.Execute(cSQL)
		FormRecord = FormResult(0)

'		Response.Write "FormRecord : " & FormRecord & "<br>"
%>
<!-- #include virtual="/include/RSTail2.inc" -->

<!-- End -->

<!-- #include virtual="/include/Adovbs.inc" -->
<%
'∆‰¿Ã¡ˆ ¡§¿«øÕ ∆‰¿Ã¡ˆ¿« ∞πºˆ∏¶ ∫∏ø©¡÷±‚ ¿ß«— ∑Á∆æ...
	
CurrentPage = 1
	
'«ÿ¥Á∆‰¿Ã¡ˆ∏¶ «•Ω√«œ±‚¿ß«— ∆‰¿Ã¡ˆ ∞™¿ª »Æ¿Œ«—¥Ÿ.
    		
	If Request.QueryString("GoTopage") <> "" then
    		
		CurrentPage = Request.QueryString("GoTopage")
    		
    	end if
	
	if PageCount <> "" then
		
		if Clng(PageCount) < Clng(PageCount) then
	
			CurrentPage = PageCount
			
		end if
	
	end if
%>

<html>

<head>
<title>JamBoxList</title>
<style>
<!--
td           { font-size: 9pt; font-family: ±º∏≤; line-height: 10pt }

a:link       { color: black; text-decoration: none }
a:visited    { color: black; text-decoration: none }
a:active     { color: black; text-decoration: none }
A:hover {
  text-decoration: underline; none
}
 .text1  { font-family:±º∏≤,arial;  font-size:9pt; color: black; }
 .text1  A { text-decoration: none; color: #390000}
 .text1  A:hover { text-decoration: none; color: #840230}

 .text2  { font-family:±º∏≤,arial;  font-size:9pt; color: #390000; }
 .text2  A { text-decoration: none; color: #390000}
 .text2  A:hover { text-decoration: none; color: #840230}

 .text3  { font-family:±º∏≤,arial;  font-size:9pt; color: #0242A2; }
 .text3  A { text-decoration: none; color: #0242A2}
 .text3  A:hover { text-decoration: none; color: #07C02A}

 .text4  { font-family:±º∏≤,arial;  font-size:9pt; color: #004E3A; }
 .text4  A { text-decoration: none; color: #004E3A}
 .text4  A:hover { text-decoration: none; color: #FFA301}

 -->
</style>
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">

<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%" height="25">
    <tr>
        <td height="25" align="center" bgcolor="#E8E8E8"><b>“Ù¿÷¡–±Ìπ‹¿ÌœµÕ≥[»´≤ø¡–±Ì] - ∫∫ªØ+–ﬁ∏ƒ£∫—©“πŒﬁ…˘</b></td>
    </tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td align="center" bgcolor="white" height="5"></td>
    </tr>
</table>

<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" height="25">
    <tr>
        <td width="100%" bgcolor="white" height="25">&nbsp;</td>
    </tr>
    <tr>
        <td width="100%" bgcolor="white">
            <table border="0" width="100%" height="25">
                <tr>
<form action="JamBoxList.asp" method="post" name="S_form">
                    <td width="50%" height="25" align="left"><a href="music_add.asp"><b>[ÃÌº”]</b></a></td>
                    <td width="50%" align="right" height="25">≈≈–Ú : 
					<select onChange="javascrpt:RankSort();" name="ListSort" size="1" class="text3">
		            <option value="d" <%if ListSort = "d" then%>selected<%end if%>>»’∆⁄</option>
		            <option value="s" <%if ListSort = "s" then%>selected<%end if%>>“Ù¿÷√˚≥∆</option>
		            <option value="m" <%if ListSort = "m" then%>selected<%end if%>>“Ù¿÷ID</option>
		            </select>
                    </td>
                </tr>
            </table>
</td>
    </tr>
    <tr>
        <td width="974" bgcolor="white" height="25">&nbsp;</td>
</form>
    </tr>
</table>

<!-- #include virtual="/include/RSHead1.inc" -->
<%
		if ListSort = "d" then

		SQL = "Select j_seq,j_musicID,j_subject,j_ListFlag,j_kind,j_min,j_sec,RegDate From TB_JAMBOX order by RegDate desc"
		cSQL = "Select count(*) From TB_JAMBOX"

		elseif ListSort = "s" then

		SQL = "Select j_seq,j_musicID,j_subject,j_ListFlag,j_kind,j_min,j_sec,RegDate From TB_JAMBOX order by j_subject asc"
		cSQL = "Select count(*) From TB_JAMBOX"

		elseif ListSort = "m" then

		SQL = "Select j_seq,j_musicID,j_subject,j_ListFlag,j_kind,j_min,j_sec,RegDate From TB_JAMBOX order by j_musicid desc"
		cSQL = "Select count(*) From TB_JAMBOX"

		else

		SQL = "Select j_seq,j_musicID,j_subject,j_ListFlag,j_kind,j_min,j_sec,RegDate From TB_JAMBOX order by RegDate desc"
		cSQL = "Select count(*) From TB_JAMBOX"
		
		end if
%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td align="center" bgcolor="white" height="5"></td>
    </tr>
</table>		
<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
        <td width="50%" align="center" bgcolor="#E8E8E8" height="25">“Ù¿÷√˚≥∆</td>
        <td width="30%" align="center" bgcolor="#E8E8E8" height="25">œ‘ æ◊¥Ã¨</td>
        <td width="20%" align="center" bgcolor="#E8E8E8" height="25">±‡º≠</td>
    </tr>
    <tr>
        <td colspan="3" align="center" bgcolor="white" height="5"></td>
    </tr>
<!-- #include virtual="/include/RSMiddle.inc" -->
	<%
		
	   '∑πƒ⁄µÂ∏¶ »≠∏ÈªÛø° ª—∑¡¡÷±‚ ¿ß«ÿ ¿–±‚
	
		if RS.BOF or RS.EOF then 
	%>
<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
        <td align="center" bgcolor="white">
«ÿ¥Á µ•¿Ã≈∏∞° æ¯Ω¿¥œ¥Ÿ.
        </td>
    </tr>
</table>

	<%
		else
	
	    RS.PageSize = 100
		RS.absolutepage = CurrentPage
		PageCount = RS.pagecount
	
		Set Result=Conn.Execute(cSQL)
		totalRecord = Result(0)
		Result.Close

if FormRecord = 1 Then
		i = 1
else		
		i = 0
end if

		Do until RS.EOF Or i > RS.PageSize 
			
			if Request.QueryString("GoTopage") = "" Or Request.QueryString("GoTopage") = "1" then
				no = i
			else
				no = (Request.QueryString("GoTopage")-1) * RS.PageSize + i
			end if
		
			seq		 	= RS(0)
			musicID		= RS(1)
			subject 	= RS(2)
			ListFlag 	= RS(3)
			j_Kind 		= RS(4)
			min	   		= RS(5)
			sec    		= RS(6)
			RegDate 	= RS(7)

		%>
    <tr>
        <td width="40%" bgcolor="white"><%if FormRecord = 1 Then%><%=no%><%else%><%=no+1%><%end if%>[<b><%=musicID%></b>] . <%=subject%></td>


<%if FormRecord = 1 Then%>
<form method="post" name="forms">
</form>
<%end if%>


<form method="post" name="forms" action="JamBoxList.asp">
        <td width="30%" align="center" bgcolor="white">
			<select name="ListSort1" onChange="javascrpt:ListView('<%=i%>');" size="1" class="text3">
            <option value="0" <%if ListFlag = 0 Then%>selected<%end if%>>X ‘⁄¡–±Ì÷–“˛≤ÿ</option>
            <option value="1" <%if ListFlag = 1 Then%>selected<%end if%>>O ‘⁄¡–±Ì÷–œ‘ æ</option>
            <option value="2" <%if ListFlag = 2 Then%>selected<%end if%>>&nbsp;&nbsp;&nbsp;œ‘ æŒ™◊Ó–¬</option>
            </select>
<input type="hidden" name="seq" value="<%=seq%>">
        </td>
</form>
        <td width="30%" align="center" bgcolor="white"><a href="music_modi.asp?seq=<%=seq%>">[±‡º≠]</a>
<a href = "javascript:delit('<%=seq%>');">[…æ≥˝]</a></td>
    </tr>
<%
	RS.Movenext
	i = i + 1
	Loop
%>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td align="center" bgcolor="white" height="5"></td>
    </tr>
</table>
<table border="0" cellpadding="1" cellspacing="1" bgcolor="black" width="100%">
    <tr>
        <td width="974" height="25" align="center" bgcolor="white">
            <%
	
	'∆‰¿Ã¡ˆ∑Œ ¡˜¡¢¿Ãµø¿ª ¿ß«— ∫Ì∑∞¿ª ∏∏µÁ¥Ÿ....
	mychoice = 10

	total_block = int(PageCount / mychoice)

	if total_block = (PageCount/ mychoice ) then
	
		total_block=total_block-1
	
	end if

	if request("block") <> "" then
	
		nowblock = request("block")
	else
	
		nowblock=0
	
	end if
%>
            <% if PageCount > 0 then %>
				<% if PageCount >= mychoice + 1 and Cint(nowblock) > 0 then%>[
					
					
					
					
					<% if Cint(nowblock) >0 then %>
						 <a href="JamBoxList.asp?GoTopage=<%=CurrentPage-mychoice%>&amp;block=<%=(nowblock-1)%>&amp;ListSort=<%=ListSort%>&amp;ListSort1=<%=ListSort1%>&amp;seq=<%=seq%>">
					<% end if%> ¿Ã¿¸<%=mychoice%>∞≥ 
				
					<% if Cint(nowblock) >0 then %>
						 </a>
					<%end if%>] 
				<% end if %>	
					
					
			
						<% ' ¿Ã ¿ßø°¥¬ ¿Ã¿¸ mychoice∞≥¿« √≥∏Æ¿Ã¥Ÿ... %> 

				<% if Cint(total_block) <> Cint(nowblock) then %>[ 

						<% ' ¿œπ›¿˚¿œ∂ß¿« ∆‰¿Ã¡ˆ∑Œ ¡¢±Ÿ¿Ã¥Ÿ... ≥ª∞° º±≈√«— ¥‹¿ß∑Œ...%>

					<% for Gopage = 1 to mychoice %> 
						<a href="JamBoxList.asp?block=<%=nowblock%>&amp;GoTopage=<%=(int(nowblock*mychoice) + Gopage)%>&amp;ListSort=<%=ListSort%>&amp;ListSort1=<%=ListSort1%>&amp;seq=<%=seq%>">
						<%=(int(nowblock*mychoice) + Gopage)%></a> 
					<% next  %>] 


				<% else %> 
					<% 'πˆ±◊ ºˆ¡§ º“Ω∫...≥— π´Ωƒ«œ¥Ÿ...
					if (PageCount mod mychoice) = 0 then 
						pager= mychoice
					else
						pager = PageCount mod mychoice
					end if
					%>

					<% '∏∂¡ˆ∏∑ mychoice∞≥ ∫Ì∑∞¿œ∂ß¥¬ ∆‰¿Ã¡ˆ¡¢±Ÿ ºˆ∞° ∞Ì¡§¿˚¿Ã¡ˆ æ ¿∏¥œ±Ó... ∏∂¡ˆ∏∑ ∫Ì∑∞¿« √≥∏Æ∞° « ø‰«œ¥Ÿ.%>[
					<% for Gopage = 1 to pager %>
						
						<a href="JamBoxList.asp?block=<%=nowblock%>&amp;GoTopage=<%=(int(nowblock*mychoice) + Gopage)%>&amp;ListSort=<%=ListSort%>&amp;ListSort1=<%=ListSort1%>&amp;seq=<%=seq%>">
						<%=(int(nowblock*mychoice) + Gopage)%></a> 
					<% next  %>] 
				<% end if %>
 
						<% ' ¿Ã æ∆∑°¥¬ ¿Ã»ƒ mychoice∞≥ √≥∏Æ¿Ã¥Ÿ..%> 
 
				<% if (Cint(total_block) > 0) and (Cint(nowblock) < Cint(total_block)) then %>[
					<a href="JamBoxList.asp?GoTopage=<%=CurrentPage + mychoice%>&amp;block=<%=(nowblock+1)%>&amp;ListSort=<%=ListSort%>&amp;ListSort1=<%=ListSort1%>&amp;seq=<%=seq%>">
					¥Ÿ¿Ω<%=mychoice%>∞≥</a>]
				<%end if%> 
		<% end if %> 
        </td>
    </tr>
</table>
<!-- #include virtual="/include/RSTail1.inc" -->
</body>

</html>

<script language="javascript">
<!--  
function RankSort()
{
	document.S_form.submit();
}

function ListView(seq)
{
	ans = confirm("Updating Show Status")
	if(ans == true){
	document.forms[seq].submit();
	}
}

function delit(seq)
{
	ans = confirm("If you select OK then will be deleted.\nReally delete ?")
	if(ans == true){
		document.location.href = "music_del_ok.asp?seq=" + seq
	}	
}	


//-->
</script>
