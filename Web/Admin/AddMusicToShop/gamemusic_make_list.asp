

<html>
	<head><title>��ӭ�����̵깤��1.00 by ѩҹ����</title>
	<head><title>Create music Info of MusicShop</title>
		<script language="javascript">
			function fnCreateList1()
			{
				document.all["ifMusicList"].src = "about:blank";
				document.all["ifMusicList"].src = "/admin/AddMusicToShop/gamemusic_make_listA.asp";
			}
		</script>
				<script language="javascript">
			function fnCreateList2()
			{
				document.all["ifMusicList"].src = "about:blank";
				document.all["ifMusicList"].src = "/admin/AddMusicToShop/gamemusic_make_listB.asp";
			}
		</script>
	</head>
	
	<body>

		<div align="center">
		<table width="300" height="50" border="0" cellpadding="0" cellspacing="0">
			<tr><td align="center"><input type="button" value="��һ������������ӵ��б�" onClick="fnCreateList1()"><input type="button" value="�ڶ�������ӵ��̵�" onClick="fnCreateList2()"></td>
			</tr>
		</table>
		<br>
		<iframe name="ifMusicList" width="100%" height="85%"></iframe>
		</div>
	</body>
</html>