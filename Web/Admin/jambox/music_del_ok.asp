<%@ LANGUAGE="VBSCRIPT" %>
<%
Response.Buffer = true
Response.Expires=0
%>
<!-- #include virtual="/include/Fso.inc"-->	
<%
Set Conn = Server.CreateObject ("ADODB.Connection")
Conn.Open (Application("Connection_ConnectionString"))

If Request("seq") = "" Then
	%>
	<script language = "javascript">
		document.location.href = "JamBoxList.asp"
	</script>		
	<%
Else
	seq = Request("seq")

	strSQL = "Select p_pic From TB_JAMBOX Where j_seq = " & seq			
	Set objDBrs = Conn.Execute(strSQL)
			
	If objDBrs.Eof Then
		%>
		<script language = "javascript">
			document.location.href = "JamBoxList.asp"
		</script>		
		<%
	Else

							
		strSQL = "Delete From TB_JAMBOX Where j_seq = " & seq 
		Conn.Execute strSQL
													
		dir = Server.MapPath("/jambox/files")
							
		'photo = ckRS(0)
		photo = dir & "\" & photo

		If fs.FileExists(photo) Then
			fs.DeleteFile(photo)
		End If

		%>
		<script language="javascript">
			alert("해당 음악을 삭제 했습니다.");
			document.location.href = "JamBoxList.asp"
		</script>		
		<%
	End If
End If

Conn.Close
Set Conn = Nothing
%>
<script language = "javascript">
	function goMain()
	{
		document.location.href = "JamBoxList.asp"
	}
</script>