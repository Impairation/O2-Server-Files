<% If Len(Request.Cookies("O2Jam")("memberID")) <= 0 Then %>
	<table width="733" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#F8F8F8"> 
			<td><img src="../images/main/all_bg00.gif" width="34" height="21"></td>
			<td align="right">
				<table width="60" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td><a href="/member/member_login.asp"><img src="../images/main/all_but_login.gif" border="0"></a></td>
						<td><a href="/member/member_join.asp"><img src="../images/main/all_but_join.gif" border="0"></a></td>
						<td><img src="../images/main/all_but_myjam.gif" border="0"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<% Else %>
	<table width="733" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#F8F8F8"> 
			<td><img src="../images/main/all_bg00.gif" width="34" height="21"></td>
			<td align="right">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="bottom"><span class="txtBlue01">æ»≥Á«œººø‰.<strong>&nbsp;<%=Request.Cookies("O2Jam")("memberName")%>&nbsp;</strong>¥‘ 
						</span><span class="txtGray"></span>&nbsp;</td>
						<td><a href="/member/logout.asp"><img src="../images/main/all_but_logout.gif" border="0"></a></td>
						<td><a href="/member/member_join_form.asp?mode=modify"><img src="../images/main/all_but_modify.gif" border="0"></a></td>
						<td><img src="../images/main/all_but_myjam.gif" border="0"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<%End IF%>