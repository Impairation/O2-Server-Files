<!-- <div id="progressbar" style="position:absolute;margin-top:20%;display:none;margin-left: 40%"> -->
<div id="progressbar" style="position:absolute;margin-top:0%;display:none;margin-left: 0%">
<!-- <table width="240" height="50" cellpadding="0" cellspacing="1" bgcolor="#a9a9a9"> -->
<table width="727" height="401" cellpadding="0" cellspacing="1" bgcolor="#67BAF0">
	<tr>
		<td>
		<!-- <table width="100%" height="100%" bgcolor="#e6e6fa" cellpadding="4"> -->
			<table width="100%" height="100%" bgcolor="#67BAF0" cellpadding="4">
				<tr>
					<td align="center" valign="middle"><img src="loading.gif"><br>
						<span id="msg" style="font-size:10pt;">���Ե�..</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
<script>
hidden_progressbar();// ���¹ٸ� �����.

function hidden_progressbar() {
// ���¹ٰ� ��Ÿ���� �ʴ��� ���� ���� ó���ϵ��� ����ó���� ���ش�.
try {
progressbar.style.display = "none";
} catch(e) {}
}
function show_progressbar() {
progressbar.style.top = document.body.scrollTop// ���� ��ũ�ѹٰ� ������ ��� ������ �Ÿ��� ���¹��� Top��ġ�� ���Ѵ�.
progressbar.style.display = ""; // ���¹ٸ� ��Ÿ����.
setTimeout(change_msg, 3000); // 3���� ���¹��� ������ ��������ش�.
}
function change_msg() {
try {
msg.innerHTML = "<font color=red>���ڽ�����...</font>";// ������ ���¹��� ����
} catch(e) {}
}
</script>
