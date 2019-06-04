<%
function HTMLEncode(fString)
fString=replace(fString,";","&#59;")
fString=replace(fString,"<","&lt;")
fString=replace(fString,">","&gt;")
fString=replace(fString,"\","&#92;")
fString=replace(fString,"--","&#45;&#45;")
fString=replace(fString,"'","&#39;")
fString=replace(fString,CHR(34),"&quot;")
fString=replace(fString,vbCrlf,"<br>")
HTMLEncode=fString
end function

dim userid,pwd,code
dim username
dim Cost
dim lastmcash
Cost=1000'在这定义购买物品所需金额
dim UserindexID
dim Gem,MCASH
'检验输入数据的合法性
username=HTMLEncode(Trim(Request("userid")))
errorchar=array(" ","　","	","#","`","|","%","&","","!","@","$","^","*","(",")","_","-","+","=","\","{","}","[","]",":",";","'",".","<",">","?","/")
for i=0 to ubound(errorchar)
if instr(username,errorchar(i))>0 then 
	Response.Write "<script>alert('您输入的数据含有非法字符!.');history.back();</script>"
	Response.end
end if
next



'连接数据库
Set Conn = Server.CreateObject ("ADODB.Connection")
Conn.Open (Application("Connection_ConnectionString"))

Set Conn1 = Server.CreateObject ("ADODB.Connection")
Conn1.Open (Application("c_Connection_ConnectionString"))
'获得提交资料
USERID 	= Request.Form("userid")
pwd 	= Request.Form("USERPWD")
code 	= Request.Form("code")
'对资料进行过滤
if userid ="" or pwd="" then
	Response.Write "<script>alert('用户信息出错.');history.back();</script>"
	Response.end
End If
'对用户账号进行检查
strSQL = "SELECT USERID,id FROM MEMBER WHERE USERID='" & USERID & "' AND PASSWD='" & PWD & "'"
Set objDBrs = Conn1.Execute(strSQL)

If objDBrs.BOF or objDBrs.EOF Then 
	Response.Write "<script>alert('用户帐号密码错误！.');history.back();</script>"
	Response.end
else
	userindexid=objDBrs("id")
END IF
objDBrs.Close
Set objDBrs = Nothing
'查询用户余额是否符合条件，ps自己定个价吧，瞧克利特和小权，你们给我害苦了阿，不仅这个要做，就连以前的全部永久购买物品的说有页都得改了，我都哭了。
strSQL = "SELECT GEM,MCASH FROM T_O2JAM_CHARCASH WHERE USER_INDEX_ID=" & USERINDEXID
Set objDBrs = Conn1.Execute(strSQL)

If objDBrs.BOF or objDBrs.EOF Then 
	Response.Write "<script>alert('金额查询错误！！！.');history.back();</script>"
	Response.end
else
	Gem=objDBrs("gem")
	MCASH=objdbrs("MCASH")
END IF
objDBrs.Close
Set objDBrs = Nothing
if Mcash<Cost then
	Response.Write "<script>alert('你小子没钱也赶来，TMD赶紧给我滚！！！！！.');history.back();</script>"
	Response.end
else
'开始交易
lastcash=Mcash-Cost
Set objCmd = Server.CreateObject("ADODB.Command")
					
With objCmd
	.ActiveConnection = Conn1
	.CommandText = "VIP_UPDATE_VOKE"
	.CommandType = adCmdStoredProc     
	
	.Parameters.Append .CreateParameter("@icash", adInteger, adParamInput,, lastcash)
	.Parameters.Append .CreateParameter("@iVip", adInteger, adParamInput,1,1)
	.Parameters.Append .CreateParameter("@userid", adVarChar, adParamInput, 5000, userid)
	.Parameters.Append .CreateParameter("result", adInteger, adParamReturnValue, 150, 4)
	.Execute
	RESULT = .Parameters("result")
End with
Set objCmd = Nothing
end if

if result=0 then
	Response.Write "<script>alert('购买包月失败!.');history.back();</script>"
	Response.end
	
else
	Response.Write "<script>alert('购买成功.您剩余包月时间为" & Result & "个月！抓紧时间利用吧');history.back();</script>"
	Response.end
end if
%>
