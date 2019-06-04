 <br> <table width="100%" border="0" cellspacing="3" cellpadding="0">
                                <tr class="txtGray">
                                <td>
                                <%
                                strNotContentarr = split(strNotContent, "|||||division|||||")
                                %>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr class="txtGray"> 
										<td valign=middle><%=strNotContentarr(0)%></td>
										<td width=10></td>
										<td align="left" width=172 height=194 align=center valign=top>
											<table width="100%" border="0" cellspacing="0" cellpadding="0" background="http://o2file.mgame.com/O2JamFile/Avatar/commu_avatar_back.gif" width=172 height=194 align=center valign=middle>
												<tr><td><p><img src="http://o2file.mgame.com/O2JamFile/Avatar/avatar_admin.gif"></p></td></tr>
											</table>
										</td>
									</tr>
								</table>
								</td>
								</tr>
								<% If Ubound(strNotContentarr) > 0 Then %>
                                <tr class="txtGray"> 
                                  <td align="left" valign="top"><%=strNotContentarr(1)%></td>
                                </tr>
                                <% End If %>
                              </table>
                              <br> </td>