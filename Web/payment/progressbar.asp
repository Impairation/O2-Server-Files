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
						<span id="msg" style="font-size:10pt;">ÇëÉÔµÈ..</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
<script>
hidden_progressbar();// »óÅÂ¹Ù¸¦ ¼û±ä´Ù.

function hidden_progressbar() {
// »óÅÂ¹Ù°¡ ³ªÅ¸³ªÁö ¾Ê´õ¶óµµ ¿¡·¯ ¾øÀÌ Ã³¸®ÇÏµµ·Ï ¿¹¿ÜÃ³¸®¸¦ ÇØÁØ´Ù.
try {
progressbar.style.display = "none";
} catch(e) {}
}
function show_progressbar() {
progressbar.style.top = document.body.scrollTop// ¼öÁ÷ ½ºÅ©·Ñ¹Ù°¡ Á¸ÀçÇÒ °æ¿ì ¿òÁ÷ÀÎ °Å¸®¸¦ »óÅÂ¹ÙÀÇ TopÀ§Ä¡¿¡ ´õÇÑ´Ù.
progressbar.style.display = ""; // »óÅÂ¹Ù¸¦ ³ªÅ¸³½´Ù.
setTimeout(change_msg, 3000); // 3ÃÊÈÄ »óÅÂ¹ÙÀÇ ¹®±¸¸¦ º¯°æ½ÃÄÑÁØ´Ù.
}
function change_msg() {
try {
msg.innerHTML = "<font color=red>ÕıÔÚ½áËãÖĞ...</font>";// º¯°æÇÒ »óÅÂ¹ÙÀÇ ¹®±¸
} catch(e) {}
}
</script>
