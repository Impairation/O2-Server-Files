<%@ Language=VBScript %>

<% 
	'''===========================================================================
	'''===== 内靛 郴俊辑 荤侩登绰 memberNick 绰 葱匙烙老 荐档 乐绊
	'''===== 酒捞叼老 荐档 乐嚼聪促.
	'''===========================================================================
	Response.Buffer = True
	Response.Expires = 0
	
	if request("memberNick") <> "" then
		memberNick 	= Trim(request("memberNick"))
		gameid 		= Trim(request("gameid"))
	end if	
	
	Dim chkIDNick, strCheck, strBgClass
	chkIDNick = Trim(Request.QueryString ("chkIDNick"))	
	If Len(chkIDNick) <= 0 Then
		chkIDNick = Trim(Request.Form ("chkIDNick"))
	End If
	
	If chkIDNick = "id" Then
		strCheck = "帐号"
		strBgClass = "bg04"
	Else
		strCheck = "昵称"
		strBgClass = "bg01"
	End If

	Set Conn1 = Server.CreateObject ("ADODB.Connection")
	Conn1.Open (Application("c_Connection_ConnectionString"))

	If chkIDNick = "id" Then
		SQL 	= "P_o2jam_UserID_check '"&memberNick&"'"
	Else
		SQL 	= "P_o2jam_NickName_check '"&memberNick&"'"
	End If
	
	Set RS = Conn1.Execute(SQL)

	if RS.BOF or RS.EOF then 
%>
<html>
<head>
<title>::赠品::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body{
scrollbar-face-color: #C0DCF6; scrollbar-shadow-color: #5DA5E8; 
scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#C0DCF6; 
scrollbar-darkshadow-color:#1D76C9; scrollbar-track-color: #4FA5EB; 
scrollbar-arrow-color:#114677;} 
--> 
</style>
<link href="payment.css" rel="stylesheet" type="text/css">
		<script language = javascript>
<!-- 


function ding()
{
	//葱匙烙
	objInput = form.memberNick;
	if (fnTrim(objInput.value) == "")
	{
		alert("先键入发送者 <%=strCheck%>");
		objInput.value = "";
		objInput.focus();
		
		return;
	}

	else if(CheckSingleQuotationMark(objInput) == false)	
	{
		alert("不能输入引号标记.");
		objInput.value = "";
		objInput.focus();
		
		return;
	}

	document.form.submit();
}

// 累篮 蝶咳钎啊 乐绰瘤 眉农窍绰 窃荐 
reSingleQMark = new RegExp("'", "g");
function CheckSingleQuotationMark(objInput)
{
	strInput = objInput.value;
	intLength = strInput.length;
				
	for(i = 0; i < intLength; i ++)
	{										
		if(strInput.substr(i, 1).match(reSingleQMark))
		{
			return false;
		}						
	}
}

// 巩磊 菊第 傍归 肋扼郴绰 窃荐
function fnTrim(strTemp)
{
	var i;
				
	for(i=strTemp.length - 1; i>=0; i--)
	{
		if (strTemp.charAt(i) != " ")
		{
			break;
		}
		else if(i == strTemp.length)
		{
			return "";
		}
	}
				
	strTemp = strTemp.substr(0, i+1);
				
	for(i=0;i<strTemp.length;i++)
	{
		if (strTemp.charAt(i) != " ")
			break;
	}
									
	strTemp = strTemp.substr(i, strTemp.length - i);				
				
	return strTemp;
}

 //-->
		</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" bgcolor="#67BAF0" topmargin="0" leftmargin="0">
<table width="710" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="20">&nbsp;</td>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" background="/images/payment/payment_mess_error_bg02.gif">
        <tr> 
          <td height="290" align="center" background="/images/payment/payment_mess_error_bg02.gif" class="<%=strBgClass%>"><table width="70%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="100">&nbsp;</td>
              </tr>
              <tr> 
                <td align="left" valign="top"><strong><%=memberNick %></strong>　此ID不存在，请核对后重新再试。
			<br><br>
			<form name=form method=post action="memberNick_Chk.asp">
			<input type=hidden name=gameid value="<%=gameid%>">
			<input type="hidden" name="chkNick" value="<%=chkNick%>">
			<input type="hidden" name="chkIDNick" value="<%=chkIDNick%>">  			
			<input type=text name=memberNick size=20 class="input02">&nbsp;&nbsp;<input type=button value="请再键入" onclick="ding()" style="cursor:hand;font: 9pt ; background-color:#E6F1FD; border:1 solid black;" onMouseOver = "this.style.backgroundColor = '#B7D2EF'" onMouseOut = "this.style.backgroundColor = '#E6F1FD'">
			</form>               
                </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><img src="/images/payment/payment_mess_error_bg03.gif" width="626" height="16"></td>
        </tr>
      </table>
    <td width="10">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<% else 
		Dim strIDNick
		
		USER_ID 	= RS("USER_ID")
		memberNick 	= RS("USER_NICKNAME")
		
		If chkIDNick = "nick" Then
			strIDNick = memberNick
		Else
			strIDNick = USER_ID
		End If
%>
<html>
<head>
<title>::赠品::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body{
scrollbar-face-color: #C0DCF6; scrollbar-shadow-color: #5DA5E8; 
scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#C0DCF6; 
scrollbar-darkshadow-color:#1D76C9; scrollbar-track-color: #4FA5EB; 
scrollbar-arrow-color:#114677;} 
--> 
</style>
<link href="payment.css" rel="stylesheet" type="text/css">
		<script language = javascript>
			function cls()
			{
				document.location.href = "gift_step_01.asp?memberNick=<%=strIDNick%>&amp;gameid=<%=gameid%>&chkNick=y&chkIDNick=<%=chkIDNick%>";
			}
		</script>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false" bgcolor="#67BAF0" topmargin="0" leftmargin="0">
<table width="710" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="20">&nbsp;</td>
    <td align="center"><table border="0" cellpadding="0" cellspacing="0" background="/images/payment/payment_mess_error_bg02.gif">
        <tr> 
          <td height="290" align="center" background="/images/payment/payment_mess_error_bg02.gif" class="<%=strBgClass%>"><table width="70%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="100">&nbsp;</td>
              </tr>
              <tr> 
                <td align="left" valign="top"><p> <span class="txtDarkblue">可以发送赠品给该帐号<strong><%=memberNick %>/(ID : <%=USER_ID%>)</strong>
                  
                </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><img src="/images/payment/payment_mess_error_bg03.gif" width="626" height="16"></td>
        </tr>
      </table>
      <br>
      <img src="/images/payment/payment_but_ok_off.gif" onclick="cls()" width="80" height="35" border="0" style="cursor:hand" onMouseOver="this.src='/images/payment/payment_but_ok_on.gif'" onMouseOut="this.src='/images/payment/payment_but_ok_off.gif'">
    <td width="10">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<%
	END IF
	RS.Close
	Set RS = Nothing
	
Conn1.Close
Set Conn1 = Nothing
%>

