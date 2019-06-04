<% Option Explicit %>
<%
	Dim strUserID
	Dim strTargetID
	Dim strTargetNickName
	Dim strLinkString
	
	strUserID = Trim(Request.QueryString("MyID"))
	strTargetID = Trim(Request.QueryString("TargetID"))
	strTargetNickName = Trim(Request.QueryString("TargetNickName"))

	Response.Redirect("gamefind_sendmess2.asp?MyID=" & strUserID & "&TargetID=" & strTargetID & "&TargetNickName=" & strTargetNickName & "")
	Response.End
%>