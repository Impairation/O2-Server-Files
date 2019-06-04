<% Option Explicit %>

	<Script Language="JavaScript">
		function subCheckForm() {
		
			objInput = frmSelectItem.gameID;
			if(objInput.value.split(" ").join("").length <= 0)
			{
				alert("Input gameID for settle");
				objInput.value = "";
				objInput.focus();

				return false;
			}
					
			frmSelectItem.method = "POST";

			if (	frmSelectItem.buyMethod.value == 1) {frmSelectItem.action = "/payment/payment_input.asp";}
			else {frmSelectItem.action = "/gift/gift_input.asp";}

			frmSelectItem.submit();
		}

		function fnResetForm(form)
		{
			form.reset();
		}
	</script>
	<table width=100% cellspacing=0 cellpadding=2 border=0>
		<tr height=25 bgcolor=448FC3>
			<td align=center><font color=FFFFFF><b>Input Avatar item Or Music Or Set Item ID to purchase</b></td>
		</tr>
		<form name="frmSelectItem" onSubmit="return subCheckForm();">		
		
		<tr bgcolor=448FC3>
			<td>
				<b>Purchase method</b>
				<select name="buyMethod">
					<option value=1>Buy</option>
					<option value=2>Gift</option>
				</select>
			</td>
		</tr>
		<tr bgcolor=448FC3>
			<td>
				<b>Input gameID for test settle : <input type=text name="gameID" size="20" maxlength="20"></b>
			</td>
		</tr>
		<tr bgcolor=448FC3>
			<td><hr></td>
		</tr>
		<tr bgcolor=448FC3>
			<td>
				<b>Input Avatar Item ID</b>
			</td>
		</tr>
		<tr bgcolor=448FC3>
			<td>
				<table width="80%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>Avatar Item ID 1&nbsp;&nbsp;<input type=text name="aid1" size="5" maxlength="5"></td>
						<td>Avatar Item ID 2&nbsp;&nbsp;<input type=text name="aid2" size="5" maxlength="5"></td>
						<td>Avatar Item ID 3&nbsp;&nbsp;<input type=text name="aid3" size="5" maxlength="5"></td>
						<td>Avatar Item ID 4&nbsp;&nbsp;<input type=text name="aid4" size="5" maxlength="5"></td>
						<td>Avatar Item ID 5&nbsp;&nbsp;<input type=text name="aid5" size="5" maxlength="5"></td>
					</tr>
					<tr>
						<td>Avatar Item ID 6&nbsp;&nbsp;<input type=text name="aid6" size="5" maxlength="5"></td>
						<td>Avatar Item ID 7&nbsp;&nbsp;<input type=text name="aid7" size="5" maxlength="5"></td>
						<td>Avatar Item ID 8&nbsp;&nbsp;<input type=text name="aid8" size="5" maxlength="5"></td>
						<td>Avatar Item ID 9&nbsp;&nbsp;<input type=text name="aid9" size="5" maxlength="5"></td>
						<td>Avatar Item ID 10&nbsp;&nbsp;<input type=text name="aid10" size="5" maxlength="5"></td>
					</tr>
				</table>
			</td>
		</tr>	
		<tr bgcolor=448FC3>
			<td><hr></td>
		</tr>
		<tr bgcolor=448FC3>
			<td>
				<b>Input Music ID</b>
			</td>
		</tr>
		<tr bgcolor=448FC3>
			<td>
				<table width="80%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>Music ID 1&nbsp;&nbsp;<input type=text name="sid1" size="5" maxlength="5"></td>
						<td>Music ID 2&nbsp;&nbsp;<input type=text name="sid2" size="5" maxlength="5"></td>
						<td>Music ID 3&nbsp;&nbsp;<input type=text name="sid3" size="5" maxlength="5"></td>
						<td>Music ID 4&nbsp;&nbsp;<input type=text name="sid4" size="5" maxlength="5"></td>
						<td>Music ID 5&nbsp;&nbsp;<input type=text name="sid5" size="5" maxlength="5"></td>
					</tr>
					<tr>
						<td>Music ID 6&nbsp;&nbsp;<input type=text name="sid6" size="5" maxlength="5"></td>
						<td>Music ID 7&nbsp;&nbsp;<input type=text name="sid7" size="5" maxlength="5"></td>
						<td>Music ID 8&nbsp;&nbsp;<input type=text name="sid8" size="5" maxlength="5"></td>
						<td>Music ID 9&nbsp;&nbsp;<input type=text name="sid9" size="5" maxlength="5"></td>
						<td>Music ID 10&nbsp;&nbsp;<input type=text name="sid10" size="5" maxlength="5"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr bgcolor=448FC3>
			<td><hr></td>
		</tr>
		<tr bgcolor=448FC3>
			<td>
				<b>Input Set Item ID</b>
			</td>
		</tr>
		<tr bgcolor=448FC3>
			<td>
				<table width="50%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>Set Item ID 1&nbsp;&nbsp;<input type=text name="tid1" size="5" maxlength="5"></td>
						<td>Set Item ID 2&nbsp;&nbsp;<input type=text name="tid2" size="5" maxlength="5"></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>					
				</table>
			</td>
		</tr>
		<tr bgcolor=448FC3>
			<td><hr></td>
		</tr>
		<tr bgcolor=448FC3>
			<td>
				<input type=button value="Purchase!!" onClick="subCheckForm();">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type=button value="Reset" onClick="fnResetForm(frmSelectItem);">
			</td>
		</tr>
		</form>
	</table>
</body>
</html>