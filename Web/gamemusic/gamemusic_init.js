		// 미구입곡 설정		
		function fnSetNotBuy()
		{
			var idxStart = 0;
			var i, j;
			
			for(i = 0; i < arrM2.length; i++)
			{
				for(j = idxStart; j < arrM.length; j++)
				{					
					if(arrM2[i] == arrM[j][0])
					{						
						arrM[j][15] = "n";
						idxStart = j + 1;
					}
				}
			}
		}
		
		fnSetNotBuy();
		
		arrKindSort = ["Artist", "Genre", "Subject", "Easy", "Point", "Price", "Date"];
			
		var intPageSize = 5;
		var intBlockSize = 1;
		var intTotalRows = arrM.length;	
		var intMaxRows = intTotalRows;	
		var intTotalPages = Math.floor((intTotalRows - 1) / intPageSize) + 1;
		var intNowPage = 1;
		
		var intStartRow;
		var sortKind = "";
		var sortTypeNow;
		var intLastRow;
		var chkBuy;		
		var arrStartRowNotBuy = new Array();
		arrStartRowNotBuy[0] = 0;
		
		var objImage = new Image();
		objImage.src = "/images/gamemusic/gamemusic_bg02.gif";