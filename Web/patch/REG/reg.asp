<!--#include file="dbconn.asp"--><%'��������objConn%>
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
errorchar=array(" ","��","	","#","`","|","%","&","","!","@","$","^","*","(",")","_","-","+","=","\","{","}","[","]",":",";","'",".","<",">","?","/","GM")
for i=0 to ubound(errorchar)
if instr(username,errorchar(i))>0 then 
	Response.Write "<script>alert('����������ݺ��зǷ��ַ�!.');history.back();</script>"
	Response.end
end if
next

if f6<>f5 then
	Response.Write "<script>alert('������������벻һ�£����������룡.');history.back();</script>"
	Response.end
end if
function runok()%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>ע��ҳ - ѩҹ����</title>
</head>

<body>

<form method="POST" action="reg.asp">
	<input type="hidden" name="id9you" size="20" value="-1"> 
	<table border="0" width="100%" id="table1" height="100%" bgcolor="#12377F">
		<tr>
			<td colspan="2" height="31">
			<p align="center"><b><font size="4" face="����" color="#FFFFFF">�û�ע��ɹ�</font></b></td>
		</tr>
		<tr>
			<td width="10%" align="right"><font color="#FFFFFF">
			<img border="0" src="Images/man.gif" width="93" height="110"></font></td>
			<td width="89%">
			<p align="center"><font color="#FFFFFF">�û��ʺţ�<%=f2%><br>
			�û����룺<%=f5%></font><p align="center"><font color="#FFFFFF">�����μ��������ݣ�</font></td>
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
<title>ע��ҳ - ѩҹ����</title>
</head>

<body>

<form method="POST" action="reg.asp">
	<input type="hidden" name="id9you" size="20" value="-1"> 
	<table border="0" width="100%" id="table1" height="100%" bgcolor="#12377F">
		<tr>
			<td colspan="2" height="31">
			<p align="center"><b><font size="4" face="����" color="#FFFFFF">�û�ע��ʧ�ܣ�</font></b></td>
		</tr>
		<tr>
			<td width="10%" align="right"><font color="#FFFFFF">
			<img border="0" src="Images/man.gif" width="93" height="110"></font></td>
			<td width="89%">
			<p align="center"><font color="#FFFFFF">ʧ��ԭ�򣺸��û��Ѵ���</font></td>
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
<title>ע��ҳ - ѩҹ����</title>
</head>

<body>

<form method="POST" action="reg.asp">
	<input type="hidden" name="id9you" size="20" value="-1"> 
	<table border="0" width="100%" id="table1" height="100%" bgcolor="#12377F">
		<tr>
			<td colspan="2" height="31">
			<p align="center"><b><font size="4" face="����" color="#FFFFFF">�û�ע��ʧ�ܣ�</font></b></td>
		</tr>
		<tr>
			<td width="10%" align="right"><font color="#FFFFFF">
			<img border="0" src="Images/man.gif" width="93" height="110"></font></td>
			<td width="89%">
			<p align="center"><font color="#FFFFFF">ʧ��ԭ������������ݲ���ȷ��</font></td>
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
		'��������
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