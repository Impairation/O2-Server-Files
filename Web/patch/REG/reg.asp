<!--#include file="dbconn.asp"--><%'对象名：objConn%>
<%
dim f1,f2,f3,f4,f5,f6,f7
dim sql
dim right_if

function insertdb()
	sql = "insert into member (userid,usernick,sex,passwd,id9you) values('" & f2 &"','"& f3 &"',"& f4 &",'"& f5 &"','"& f7 & "')"
	objConn.Execute sql ,right_if
end function


'f1 = trim(request("id"))

f2 = trim(request.form("userid"))
f2 = replace(f2,"'","''")
'f2 = replace(f2,"""","""""")

f3 = trim(request.form("usernick"))
f3 = replace(f3,"'","''")
'f3 = replace(f3,"""","""""")

f4 = trim(request.form("sex"))
f4 = replace(f4,"'","''")
'f4 = replace(f4,"""","""""")

f5 = trim(request.form("passwd1"))
f5 = replace(f5,"'","''")
'f5 = replace(f5,"""","""""")

f6 = trim(request.form("passwd2"))
f6 = replace(f6,"'","''")

f7 = trim(request.form("id9you"))
f7 = replace(f7,"'","''")
'f7 = replace(f7,"""","""""")
CHK=HTMLEncode(Trim(Request("userid")))
errorchar=array(" ","　","	","#","`","|","%","&","","!","@","$","^","*","(",")","_","-","+","=","\","{","}","[","]",":",";","'",".","<",">","?","/","GM")
for i=0 to ubound(errorchar)
if instr(username,errorchar(i))>0 then 
	Response.Write "<script>alert('您输入的数据含有非法字符!.');history.back();</script>"
	Response.end
end if
next

if f6<>f5 then
	Response.Write "<script>alert('两次输入的密码不一致！请重新输入！.');history.back();</script>"
	Response.end
end if
function runok()%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册页 - 雪夜无声</title>
</head>

<body>

<form method="POST" action="reg.asp">
	<input type="hidden" name="id9you" size="20" value="-1"> 
	<table border="0" width="100%" id="table1" height="100%" bgcolor="#12377F">
		<tr>
			<td colspan="2" height="31">
			<p align="center"><b><font size="4" face="黑体" color="#FFFFFF">用户注册成功</font></b></td>
		</tr>
		<tr>
			<td width="10%" align="right"><font color="#FFFFFF">
			<img border="0" src="Images/man.gif" width="93" height="110"></font></td>
			<td width="89%">
			<p align="center"><font color="#FFFFFF">用户帐号：<%=f2%><br>
			用户密码：<%=f5%></font><p align="center"><font color="#FFFFFF">请您牢记以上数据！</font></td>
		</tr>
		</table>
</form>

</body>

</html>	<%
end function

function runerror1()
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册页 - 雪夜无声</title>
</head>

<body>

<form method="POST" action="reg.asp">
	<input type="hidden" name="id9you" size="20" value="-1"> 
	<table border="0" width="100%" id="table1" height="100%" bgcolor="#12377F">
		<tr>
			<td colspan="2" height="31">
			<p align="center"><b><font size="4" face="黑体" color="#FFFFFF">用户注册失败！</font></b></td>
		</tr>
		<tr>
			<td width="10%" align="right"><font color="#FFFFFF">
			<img border="0" src="Images/man.gif" width="93" height="110"></font></td>
			<td width="89%">
			<p align="center"><font color="#FFFFFF">失败原因：该用户已存在</font></td>
		</tr>
		</table>
</form>

</body>

</html>	<%
end function

function runerror2()
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>注册页 - 雪夜无声</title>
</head>

<body>

<form method="POST" action="reg.asp">
	<input type="hidden" name="id9you" size="20" value="-1"> 
	<table border="0" width="100%" id="table1" height="100%" bgcolor="#12377F">
		<tr>
			<td colspan="2" height="31">
			<p align="center"><b><font size="4" face="黑体" color="#FFFFFF">用户注册失败！</font></b></td>
		</tr>
		<tr>
			<td width="10%" align="right"><font color="#FFFFFF">
			<img border="0" src="Images/man.gif" width="93" height="110"></font></td>
			<td width="89%">
			<p align="center"><font color="#FFFFFF">失败原因：您输入的数据不正确！</font></td>
		</tr>
		</table>
</form>

</body>

</html>	<%
end function



function chechword()
	if (IsNull(f2) or IsNull(f3) or IsNull(f4) or IsNull(f5) or IsNull(f7) or f2="" or f3="" or f4="" or f5="" or f7="") then
		chechword = false
	else
		chechword=true
	end if
end function

if (chechword()=false) then
	runerror2()
else
	conncreat()
	rs_sql = "select * from member where userid='"& f2 &"'"  
	set rs = objConn.execute(rs_sql)

	if (rs.eof or rs.bof) then
		'插入数据
		insertdb()
		
		if right_if=1 then 
			runok()
		else
			response.write "insert error"
		end if
	else
		runerror1()
	end if

	rs.close
	set rs = nothing
	connclose()
end if

response.end
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
%>