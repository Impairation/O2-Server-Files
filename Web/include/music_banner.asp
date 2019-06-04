<%			
''' 아래쪽 배너 이미지를 랜덤하게 보여주기 위해 숫자를 랜덤하게 뽑아냅니다.
''' 랜덤하게 보여줄 이미지의 갯수는 rndCount
				
rndCount = 4
				
Randomize
				
rndNum = Int((rndCount * Rnd) + 1)
				
'rndNum = 2 ''' 배너 이미지 고정.....
				
Select Case rndNum
%>

<%Case 1%>
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub01_01.swf">
        <param name="quality" value="high">
        <embed src="/images/banner/sub01_01.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object> 
    </td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub01_02.swf">
        <param name="quality" value="high">
        <embed src="/images/banner/sub01_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub01_03.swf">
        <param name="quality" value="high">
        <embed src="/images/banner/sub01_03.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub01_04.swf">
        <param name="quality" value="high">
        <embed src="/images/banner/sub01_04.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
  </tr>
</table>
<%Case 2%>
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub01_01.swf">
        <param name="quality" value="high">
        <embed src="/images/banner/sub01_01.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object> 
    </td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub01_05.swf">
        <param name="quality" value="high">
        <embed src="/images/banner/sub01_05.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub01_06.swf">
        <param name="quality" value="high">
        <embed src="/images/banner/sub01_06.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub01_04.swf">
        <param name="quality" value="high">
        <embed src="/images/banner/sub01_04.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
  </tr>
</table>
<%Case 3%>
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/040528/jambox/sub03_01.swf">
        <param name="quality" value="high">
        <embed src="../images/banner/040528/jambox/sub03_01.swff" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object> 
    </td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/040528/jambox/sub03_02.swf">
        <param name="quality" value="high">
        <embed src="../images/banner/040528/jambox/sub03_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/040528/jambox/sub03_03.swf">
        <param name="quality" value="high">
        <embed src="../images/banner/040528/jambox/sub03_03.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/040528/jambox/sub03_04.swf">
        <param name="quality" value="high">
        <embed src="../images/banner/040528/jambox/sub03_04.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
  </tr>
</table>
<%Case 4%>
<table width="100%" border="0" cellspacing="0" cellpadding="1">
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/040528/jambox/sub03_05.swf">
        <param name="quality" value="high">
        <embed src="../images/banner/040528/jambox/sub03_01.swff" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object> 
    </td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/040528/jambox/sub03_02.swf">
        <param name="quality" value="high">
        <embed src="../images/banner/040528/jambox/sub03_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/040528/jambox/sub03_03.swf">
        <param name="quality" value="high">
        <embed src="../images/banner/040528/jambox/sub03_03.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/040528/jambox/sub03_04.swf">
        <param name="quality" value="high">
        <embed src="../images/banner/040528/jambox/sub03_04.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93"></embed></object></td>
  </tr>
</table>
<%End Select%>
