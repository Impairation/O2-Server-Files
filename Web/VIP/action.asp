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
Cost=1000'���ⶨ�幺����Ʒ������
dim UserindexID
dim Gem,MCASH
'�����������ݵĺϷ���
username=HTMLEncode(Trim(Request("userid")))
errorchar=array(" ","��","	","#","`","|","%","&","","!","@","$","^","*","(",")","_","-","+","=","\","{","}","[","]",":",";","'",".","<",">","?","/")
for i=0 to ubound(errorchar)
if instr(username,errorchar(i))>0 then 
	Response.Write "<script>alert('����������ݺ��зǷ��ַ�!.');history.back();</script>"
	Response.end
end if
next



'�������ݿ�
Set Conn = Server.CreateObject ("ADODB.Connection")
Conn.Open (Application("Connection_ConnectionString"))

Set Conn1 = Server.CreateObject ("ADODB.Connection")
Conn1.Open (Application("c_Connection_ConnectionString"))
'����ύ����
USERID 	= Request.Form("userid")
pwd 	= Request.Form("USERPWD")
code 	= Request.Form("code")
'�����Ͻ��й���
if userid ="" or pwd="" then
	Response.Write "<script>alert('�û���Ϣ����.');history.back();</script>"
	Response.end
End If
'���û��˺Ž��м��
strSQL = "SELECT USERID,id FROM MEMBER WHERE USERID='" & USERID & "' AND PASSWD='" & PWD & "'"
Set objDBrs = Conn1.Execute(strSQL)

If objDBrs.BOF or objDBrs.EOF Then 
	Response.Write "<script>alert('�û��ʺ��������.');history.back();</script>"
	Response.end
else
	userindexid=objDBrs("id")
END IF
objDBrs.Close
Set objDBrs = Nothing
'��ѯ�û�����Ƿ����������ps�Լ������۰ɣ��ƿ����غ�СȨ�����Ǹ��Һ����˰����������Ҫ����������ǰ��ȫ�����ù�����Ʒ��˵��ҳ���ø��ˣ��Ҷ����ˡ�
strSQL = "SELECT GEM,MCASH FROM T_O2JAM_CHARCASH WHERE USER_INDEX_ID=" & USERINDEXID
Set objDBrs = Conn1.Execute(strSQL)

If objDBrs.BOF or objDBrs.EOF Then 
	Response.Write "<script>alert('����ѯ���󣡣���.');history.back();</script>"
	Response.end
else
	Gem=objDBrs("gem")
	MCASH=objdbrs("MCASH")
END IF
objDBrs.Close
Set objDBrs = Nothing
if Mcash<Cost then
	Response.Write "<script>alert('��С��ûǮҲ������TMD�Ͻ����ҹ�����������.');history.back();</script>"
	Response.end
else
'��ʼ����
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
	Response.Write "<script>alert('�������ʧ��!.');history.back();</script>"
	Response.end
	
else
	Response.Write "<script>alert('����ɹ�.��ʣ�����ʱ��Ϊ" & Result & "���£�ץ��ʱ�����ð�');history.back();</script>"
	Response.end
end if
%>
