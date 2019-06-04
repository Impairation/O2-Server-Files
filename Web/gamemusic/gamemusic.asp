<%@ LANGUAGE="VBSCRIPT" %>

<%
	Response.Expires = 0 
	Response.Expiresabsolute = Now() - 3 
	Response.AddHeader "pragma","no-cache" 
	Response.AddHeader "cache-control","private" 
	Response.CacheControl = "no-cache" 
%>

<%
	Response.Buffer = true
%>

<html>
	<head>
		<title>Untitled Document</title>
			<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
			<link href="gamemusic.css" rel="stylesheet" type="text/css">
			
			<script language="javascript" id="EventBridge">
			</script>
			
			<script language="javascript">
				var arrM2 = new Array(<%=Request.Form("mids")%>);
				//var arrM2 = new Array('240', '239', '238', '237', '236', '235', '234', '233', '232', '231', '222', '220', '180');
				
				function fnBuyMusic(mid)
				{
					document.all["mid"].value = mid;
					document.all["EventBridge"].click();			
				}
			</script>
			
			<script language="javascript">
				function fnOverOutDown(objImg, chk)
				{					
					var tmpName = objImg.name.split("_")[3].toLowerCase();
					var tmpName2 = sortTypeNow.toLowerCase();
					
					if(tmpName == tmpName2)
					{					
						objImg.src = "/images/gamemusic/" + objImg.name + "_cl.gif";
					}
					else
					{
						objImg.src = "/images/gamemusic/" + objImg.name + "_" + chk + ".gif";
					}
				}
				
			</script>
			
			<script language="javascript" src="gamemusic_info.js"></script>
			<script language="javascript" src="gamemusic_init.js"></script>
			<script language="javascript" src="gamemusic_list.js"></script>
			
					
	</head>

	<body background="/images/gamemusic/gamemusic_bg.gif" leftmargin="0" topmargin="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<!-- 抛捞喉狼 矫累 -->
		<table width="381" height="541" border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td valign="top">
			<!-- 抛捞喉狼 矫累 -->
				<table width="381" border="0" cellspacing="0" cellpadding="0">
					<tr>
					<td><img src="/images/gamemusic/gamemusic_top.gif" width="381" height="46"></td>
					</tr>
				</table>
			<!-- 抛捞喉狼 场 -->
			
			<!-- 抛捞喉狼 矫累 -->
				<table width="381" border="0" cellspacing="0" cellpadding="0">
					<tr>
					<td><img src="/images/gamemusic/gamemusic_table_t.gif" width="381" height="12"></td>
					</tr>
					<tr>
					<td>
					<!-- 抛捞喉狼 矫累 -->
						<table width="381" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="14"><img src="/images/gamemusic/gamemusic_table_t01_l.gif" width="14" height="29"></td>
								<td bgcolor="#10002D">
								<!-- 抛捞喉狼 矫累 -->
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="37"><img src="/images/gamemusic/gamemusic_sort_01.gif" width="37" height="29"></td>
										<td width="54"><img src="/images/gamemusic/gamemusic_but_sort_artist_off.gif" width="54" height="29" onClick="fnCreateTable('Artist')" style="cursor:hand" name="gamemusic_but_sort_artist" onMouseOver="fnOverOutDown(this, 'on')" onMouseOut="fnOverOutDown(this, 'off')" onMouseDown="fnOverOutDown(this, 'cl')"></td>
										<td width="45"><img src="/images/gamemusic/gamemusic_but_sort_genre_off.gif" width="45" height="29" onClick="fnCreateTable('Genre')" style="cursor:hand" name="gamemusic_but_sort_genre" onMouseOver="fnOverOutDown(this, 'on')" onMouseOut="fnOverOutDown(this, 'off')" onMouseDown="fnOverOutDown(this, 'cl')"></td>
										<td width="45"><img src="/images/gamemusic/gamemusic_but_sort_subject_off.gif" width="45" height="29" onClick="fnCreateTable('Subject')" style="cursor:hand" name="gamemusic_but_sort_subject" onMouseOver="fnOverOutDown(this, 'on')" onMouseOut="fnOverOutDown(this, 'off')" onMouseDown="fnOverOutDown(this, 'cl')"></td>
										<td width="45"><img src="/images/gamemusic/gamemusic_but_sort_easy_off.gif" width="45" height="29" onClick="fnCreateTable('Easy')" style="cursor:hand" name="gamemusic_but_sort_easy" onMouseOver="fnOverOutDown(this, 'on')" onMouseOut="fnOverOutDown(this, 'off')" onMouseDown="fnOverOutDown(this, 'cl')"></td>
										<td width="45"><img src="/images/gamemusic/gamemusic_but_sort_point_off.gif" width="45" height="29" onClick="fnCreateTable('Point')" style="cursor:hand" name="gamemusic_but_sort_point" onMouseOver="fnOverOutDown(this, 'on')" onMouseOut="fnOverOutDown(this, 'off')" onMouseDown="fnOverOutDown(this, 'cl')"></td>
										<td width="38"><img src="/images/gamemusic/gamemusic_but_sort_price_off.gif" width="38" height="29" onClick="fnCreateTable('Price')" style="cursor:hand" name="gamemusic_but_sort_price" onMouseOver="fnOverOutDown(this, 'on')" onMouseOut="fnOverOutDown(this, 'off')" onMouseDown="fnOverOutDown(this, 'cl')"></td>
										<td width="44"><img src="/images/gamemusic/gamemusic_but_sort_date_off.gif" width="44" height="29" onClick="fnCreateTable('Date')" style="cursor:hand" name="gamemusic_but_sort_date" onMouseOver="fnOverOutDown(this, 'on')" onMouseOut="fnOverOutDown(this, 'off')" onMouseDown="fnOverOutDown(this, 'cl')"></td>
									</tr>
								</table>
								<!-- 抛捞喉狼 场 -->
								</td>
								<td width="14"><img src="/images/gamemusic/gamemusic_table_t01_r.gif" width="14" height="29"></td>
							</tr>
						</table>
					<!-- 抛捞喉狼 场 -->
					</td>
					</tr>
					<tr>
					<td align="center" background="/images/gamemusic/gamemusic_table_m.gif" bgcolor="#10417B">					
						<table id="tableMusicList0">
						</table>		
						<table id="tableMusicList1">
						</table>
						<table id="tableMusicList2">
						</table>
						<table id="tableMusicList3">
						</table>
						<table id="tableMusicList4">
						</table>		
					</td>
					</tr>
					<tr>
					<td height="34" align="center" background="/images/gamemusic/gamemusic_table_b.gif">
					<!-- 抛捞喉狼 矫累 -->
						<table width="350" border="0" cellspacing="0" cellpadding="0">
							<tr>
							<td width="70" class="musicWhiteTitle"><div id="cntTotalMusic"></div></td>
							<td>
							<!-- 抛捞喉狼 矫累 -->
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
									<td width="12"><img src="/images/gamemusic/gamemusic_table01_bg01.gif" width="12" height="25"></td>
									<td background="/images/gamemusic/gamemusic_table01_bg02.gif">
									<!-- 抛捞喉狼 矫累 -->
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
											<td width="48" align="left"><img src="/images/gamemusic/gamemusic_but_num_left_off.gif" width="47" height="22" border="0" onClick="fnMovePrev()" style="cursor:hand" onMouseOver="this.src='/images/gamemusic/gamemusic_but_num_left_on.gif'" onMouseOut="this.src='/images/gamemusic/gamemusic_but_num_left_off.gif'"></td>
											<td align="center"><img src="/images/gamemusic/gamemusic_num_0.gif" height="17" border="0" name="numNowPage_1"></td>
											<td align="center"><img src="/images/gamemusic/gamemusic_num_0.gif" height="17" border="0" name="numNowPage_0"></td>
											<td align="center"><img src="/images/gamemusic/gamemusic_num_gab.gif" width="12" height="20"></td>
											<td align="center"><img src="/images/gamemusic/gamemusic_num_0.gif" height="17" border="0" name="numTotalPage_1"></td>
											<td align="center"><img src="/images/gamemusic/gamemusic_num_0.gif" height="17" border="0" name="numTotalPage_0"></td>												
											<td width="48" align="right"><img src="/images/gamemusic/gamemusic_but_num_right_off.gif" width="47" height="22" border="0" onClick="fnMoveNext()" style="cursor:hand" onMouseOver="this.src='/images/gamemusic/gamemusic_but_num_right_on.gif'" onMouseOut="this.src='/images/gamemusic/gamemusic_but_num_right_off.gif'"></td>
											</tr>
										</table>										
									<!-- 抛捞喉狼 场 -->
									</td>
									<td width="12"><img src="/images/gamemusic/gamemusic_table01_bg03.gif" width="12" height="25"></td>
									</tr>
								</table>
							<!-- 抛捞喉狼 场 -->
							</td>
							<td width="90" align="right"><img src="/images/gamemusic/gamemusic_but_notbuy_off.gif" width="82" height="24" border="0" onClick="fnListBuy('n')" style="cursor:hand;display:block" id="btnNotBuy" onMouseOver="this.src='/images/gamemusic/gamemusic_but_notbuy_on.gif'" onMouseOut="this.src='/images/gamemusic/gamemusic_but_notbuy_off.gif'"><img src="/images/gamemusic/gamemusic_but_seeall_off.gif" width="82" height="24" border="0" onClick="fnListBuy('y')" style="cursor:hand;display:none" id="btnSeeAll" onMouseOver="this.src='/images/gamemusic/gamemusic_but_seeall_on.gif'" onMouseOut="this.src='/images/gamemusic/gamemusic_but_seeall_off.gif'"></td>
							</tr>
						</table>
					<!-- 抛捞喉狼 场 -->
					</td>
					</tr>
				</table>
			<!-- 抛捞喉狼 场 -->
			</td>
			</tr>
		</table>
		<!-- 抛捞喉狼 场 -->
		<input type="hidden" id="mid" value="">
		<% Response.Flush %>
		
		<script language="javascript">
			
			sortKind = "ASC";
			fnListBuy('n')
		</script>
	</body>
</html>
