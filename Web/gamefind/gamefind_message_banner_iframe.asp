<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<TITLE></TITLE>
</HEAD>
<BODY topmargin=0 leftmargin=0 OnContextMenu="return false;" OnSelectStart="return false;">
<DIV id=divMenu1 style="display: none; "><img src="/images/banner/adv_2005_01.gif" width="156" height="102"><br>	
</DIV>
<DIV id=divMenu2 style="display: none; "><img src="/images/banner/adv_2005_02.gif" width="156" height="102"><br>
</DIV>
<DIV id=divMenu3 style="display: none; "><img src="/images/banner/adv_2005_03.gif" width="156" height="102"><br>
</DIV>
<DIV id=divMenu4 style="display: none; "><img src="/images/banner/adv_2005_04.gif" width="156" height="102"><br>
</DIV>
<DIV id=divMenu5 style="display: none; "><img src="/images/banner/adv_2005_05.gif" width="156" height="102"><br>	
</DIV>
<DIV id=divMenu6 style="display: none; "><img src="/images/banner/adv_2005_06.gif" width="156" height="102"><br>
</DIV>
<DIV id=divMenu7 style="display: none; "><img src="/images/banner/adv_2005_07.gif" width="156" height="102"><br>
</DIV>

			
					
<script language="javascript">
	
	var n, k, i;
	var arrViewTime;	
	var intArrayLength;
	
	n = Math.floor(Math.random()*100000)%10;
	
	//arrViewTime = new Array(10, 5, 5)
	arrViewTime = new Array(3, 3, 3, 3, 3, 3, 3)
	
	intArrayLength = arrViewTime.length
	
	k = n % intArrayLength + 1;	
		
	function fnRotate()
	{			
		var intViewTime;
		var strDisplay;
		
		for(i = 1; i <= intArrayLength; i++)
		{
			if(i == k)
			{
				strDisplay = "block";
			}
			else
			{
				strDisplay = "none";				
			}
			
			document.all["divMenu" + i + ""].style.display = strDisplay;			
		}		
		
		// ������ ��ʸ� �����Ű�� �ð� ����
		// ���� �迭���� ������ �����ͼ� �и�������� ��ȯ
		intViewTime = arrViewTime[k - 1] * 1000;
				
		k = k + 1;
		if(k > intArrayLength)
		{
			k = 1;
		}
		
		// ������ �ð���ŭ ��ʸ� �����ְ� �Լ� �ڽ��� ���ȣ���Ͽ� ���� ��ʸ� �����ִ� ���
		setTimeout("fnRotate()",  intViewTime);
	}
	
	fnRotate();
</script>
</BODY>
</HTML>
