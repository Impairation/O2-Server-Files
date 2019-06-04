<HTML><HEAD><TITLE>欢迎来到音乐社区</TITLE>
<META content=http://schemas.microsoft.com/intellisense/ie5 
name=vs_targetSchema>
<SCRIPT language=javascript src="js/disableRightClick.js"></SCRIPT>

<SCRIPT language=javascript src="js/common2.js"></SCRIPT>

<SCRIPT language=javascript>
			function fnSendSubmit(form)
			{
				objInput = form.cupwd;
				if(fnTrim(objInput.value) == "")
				{
					alert("请输入密码");

					return false;
				}
				else
				{
					form.submit();

					return true;
				}
			}
		</SCRIPT>

<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2900.2180" name=GENERATOR></HEAD>
<BODY bgColor=#5be5fc leftMargin=0 topMargin=0>
<TABLE cellSpacing=0 cellPadding=0 width=736 border=0>
  <TBODY>
  <TR>
    <TD><IMG height=46 src="image/pic_01.gif" width=736></TD></TR>
  <TR>
    <TD><IMG height=53 src="image/pic_02.gif" width=736></TD></TR>
  <TR>
    <TD><IMG height=50 src="image/pic_03.gif" width=736></TD></TR>
  <TR>
    <TD><IMG height=51 src="image/pic_04.gif" width=736></TD></TR>
  <TR>
    <TD><IMG height=57 src="image/pic_05.gif" 
width=736></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=736 border=0>
  <FORM name=frmPwd onsubmit="return fnSendSubmit(this)" action=entranceP.asp 
  method=post><INPUT name=cuid>
  <TBODY>
  <TR>
    <TD width=373><IMG height=62 src="image/pic_06.gif" width=373></TD>
    <TD align=middle width=184 background=image/pic_09.gif><INPUT 
      style="BORDER-RIGHT: #6666ff 1px solid; BORDER-TOP: #6666ff 1px solid; BORDER-LEFT: #6666ff 1px solid; BORDER-BOTTOM: #6666ff 1px solid; heitht: 18px" 
      type=password name=cupwd></TD>
    <TD width=64><INPUT onclick=fnSendSubmit(frmPwd) type=image 
      src="image/pic_08.gif" name=imageField></TD>
    <TD><IMG height=62 src="image/pic_09.gif" 
  width=115></TD></TR></FORM></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=736 border=0>
  <TBODY>
  <TR>
    <TD><IMG height=67 src="image/pic_10.gif" width=736></TD></TR>
  <TR>
    <TD><IMG height=43 src="image/pic_11.gif" width=736></TD></TR>
  <TR>
    <TD><IMG height=38 src="image/pic_12.gif" 
width=736></TD></TR></TBODY></TABLE></BODY></HTML>
