<%			
''' 아래쪽 배너 이미지를 랜덤하게 보여주기 위해 숫자를 랜덤하게 뽑아냅니다.
''' 랜덤하게 보여줄 이미지의 갯수는 rndCount
				
rndCount = 4
				
Randomize
				
rndNum = Int((rndCount * Rnd) + 1)
				
'rndNum = 4 ''' 배너 이미지 고정.....
				
Select Case rndNum
%>

<%Case 1%>
<table width="98%" border="0" cellspacing="0" cellpadding="2">
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_01.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_01.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object> 
    </td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/sub_15_02.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_03.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_03.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/sub_14_01.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_14_01.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
  </tr>
</table>
<%Case 2%>
<table width="98%" border="0" cellspacing="0" cellpadding="2">
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_03.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_03.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object> 
    </td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_02.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/sub_15_01.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_01.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/sub_14_02.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_14_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
  </tr>
</table>
<%Case 3%>
<table width="98%" border="0" cellspacing="0" cellpadding="2">
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_02.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object> 
    </td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_01.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent">  
        <embed src="/images/banner/sub_15_01.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_03.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_03.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/sub_14_02.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_14_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
  </tr>
</table>
<%Case 4%>
<table width="98%" border="0" cellspacing="0" cellpadding="2">
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_01.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_01.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object> 
    </td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_03.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_03.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="/images/banner/sub_15_02.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_15_02.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="138" height="93">
        <param name="movie" value="../images/banner/sub_14_01.swf">
        <param name="quality" value="high">
		<param name=wmode value="transparent"> 
        <embed src="/images/banner/sub_14_01.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="138" height="93" wmode="transparent"></embed></object></td>
  </tr>
</table>
<%End Select%>
