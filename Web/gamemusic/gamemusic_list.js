		
		function fnPaging()
		{
			document.images["numNowPage_1"].src = "/images/gamemusic/gamemusic_num_" + parseInt(intNowPage / 10) + ".gif";
			document.images["numNowPage_0"].src = "/images/gamemusic/gamemusic_num_" + parseInt(intNowPage % 10) + ".gif";
		
		}
		
		function fnSetTotalCount()
		{
			// ��ü ��� ����
			cntTotalMusic.innerHTML = "[" + intTotalRows + " �׸�]";			
						
			// ��ü �������� �̹��� ����
			document.images["numTotalPage_1"].src = "/images/gamemusic/gamemusic_num_" + parseInt(intTotalPages / 10) + ".gif";
			document.images["numTotalPage_0"].src = "/images/gamemusic/gamemusic_num_" + parseInt(intTotalPages % 10) + ".gif";				
		}
		
		function fnMoveNext()
		{
			if(intNowPage < intTotalPages)
			{
				intNowPage ++;
				
				fnPaging();
				fnCreateTable(sortTypeNow, "y");				
			}
		}
		
		function fnMovePrev()
		{
			if(intNowPage > 1)
			{
				intNowPage --;
				
				fnPaging();
				fnCreateTable(sortTypeNow, "y");
			}
		}
		
		function fnSelectedSort(strSort)
		{
			strSort = strSort.toLowerCase();
			var strKindSort;
			var chk;
						
			for(i = 0; i < arrKindSort.length; i++)
			{
				strKindSort = arrKindSort[i].toLowerCase();
				
				if(strSort == strKindSort)
				{
					chk = "cl";
				}
				else
				{
					chk = "off";
				}				
				
				document.images["gamemusic_but_sort_" + strKindSort + ""].src = "/images/gamemusic/gamemusic_but_sort_" + strKindSort + "_" + chk + ".gif";
			}
		}
		
		function fnInitTable()
		{				
			for(i = 0; i < intPageSize; i++)
			{				
				oTable = eval("document.all['tableMusicList" + i + "'];");
												
				while( oTable.rows.length != 0 ) 
				{
					oTable.deleteRow(0) ;
				}
			}			
		}
		
		function fnResetStartRow()
		{			
			arrStartRowNotBuy = [0];
		}		
		
		function fnListBuy(chk)
		{
			if(chk == "n")
			{
				document.images["btnNotBuy"].style.display = "none";
				document.images["btnSeeAll"].style.display = "block";
			}
			else
			{
				chk = "y";
				document.images["btnSeeAll"].style.display = "none";
				document.images["btnNotBuy"].style.display = "block";				
			}
			
			// ��ü ������ �������� ����
			if(chk == "n")
			{
				intTotalRows = arrM2.length;
				if(intTotalRows == 0)
				{
					intTotalPages = 0;
				}
				else
				{
					intTotalPages = Math.floor((intTotalRows - 1) / intPageSize) + 1;
				}
				
				fnPaging();								
			}
			else
			{
				intTotalRows = arrM.length;		
				intTotalPages = Math.floor((intTotalRows - 1) / intPageSize) + 1;
			}
			
			fnSetTotalCount();
			chkBuy = chk;		
			sortKind = "ASC";				
			fnCreateTable("Date");
		}
		
		function fnCreateTable(sortType, paging)
		{
			// ���̺� �ʱ�ȭ		
			fnInitTable();
			
			var strSortArray;
			
			// ������ ���� ����� �ƴϰų�, ���Ĺ���� �������� ������ ��¥���� �����մϴ�.
			var re = /Artist|Genre|Subject|Easy|Point|Price|Date/g;			
			
			if(!sortType.match(re))
			{
				sortType = "Date";
			}
			
			sortTypeNow = sortType;
			
			// ������ �̵��� ���� ���ļ����� �ٲ� �ʿ䰡 �����Ƿ� ����մϴ�.
			if(paging == "y")
			{
				strSortArray = "arrSort" + sortType + ";"
			}
			else
			{
				fnResetStartRow();
				
				// ������ �̵��� �ƴ� ��� ���� �������� 1 �������� �ʱ�ȭ
				if(intTotalPages == 0)
				{
					intNowPage = 0;
				}
				else
				{
					intNowPage = 1;
				}
				fnPaging();
				fnSelectedSort(sortType);
				
				// ���ļ���, �� �������� �������� �����ϴ� ���Դϴ�.
				// ��¥�� �α⵵�� ���������� �⺻�̸�, �������� ���������� �⺻�Դϴ�.				
				if(sortType == "Date" || sortType == "Point")
				{
					if(sortKind == "DESC")
					{
						sortKind = "ASC";
						strSortArray = "arrSort" + sortType + ".reverse();"
					}
					else
					{
						sortKind = "DESC";
						strSortArray = "arrSort" + sortType + ";"
					}
				}
				else
				{
					if(sortKind == "ASC")
					{
						sortKind = "DESC";
						strSortArray = "arrSort" + sortType + ".reverse();"
					}
					else
					{
						sortKind = "ASC";
						strSortArray = "arrSort" + sortType + ";"
					}
				}
			}
			
			arrSortType = eval(strSortArray);
			
			
			var nowRow;
			var cnt = 0;
			var k;
			var nowRow;
			var cntLimit;
			var intLoopCount;
						
			if(chkBuy == "n")
			{
				intLoopCount = arrM.length;
				intStartRow = arrStartRowNotBuy[intNowPage - 1];			
			}
			else
			{
				intLoopCount = intPageSize;
				intStartRow = (intNowPage - 1) * intPageSize;			
			}
			
			// ������ ������ ����Ʈ ���� ����
			if(intNowPage == intTotalPages)
			{
				cntLimit = ((intTotalRows - 1) % intPageSize + 1);
			}
			else
			{
				cntLimit = intPageSize;
			}
			
			// ����Ʈ �����ֱ� ����
			for(i = 0; i < intLoopCount; i++)
			{				
				nowRow = intStartRow + i;
				
				if(cnt >= cntLimit || intTotalRows <= 0 || (chkBuy == "y" && nowRow >= intTotalRows) || (chkBuy == "n" && nowRow >= intMaxRows))
				{				
					break;
				}				
				else if(chkBuy == "n" && arrM[arrSortType[nowRow]][15] == "y")
				{									
					continue;				
				}
				else
				{					
					if(chkBuy == "n")
					{
						k = cnt;
					}
					else
					{
						k = i;
					}
					
					cnt++;
																
					// �⺻���̺� ����						
					oTable = eval("document.all['tableMusicList" + k + "'];");
				
					oTable.width = "353";
					oTable.height = "84";			
					oTable.border = "0";
					oTable.cellSpacing = "0";
					oTable.cellPadding = "0";
					oTable.background = objImage.src;
					
			
					oTHead =  oTable.createTHead();
					
						// ���̹��� 
						oRow = oTHead.insertRow();			
		
							oCell = oRow.insertCell() ;											
							oCell.style.width = "84" ;
							oCell.style.height = "84" ;
							oCell.style.textAlign = "center";
							oCell.style.verticalAlign = "middle";
														
							strInnerHTML = "<img src='/images/jambox/files/"  + arrM[arrSortType[nowRow]][12] + "' width='80' height='80'>";									
							oCell.innerHTML = strInnerHTML;
							
							oCell = oRow.insertCell() ;	
							oCell.style.width = "270" ;		
							oCell.style.textAlign = "center";
											
							strTableID = "tableCellPadding" + k + "";
							strInnerHTML = "<table id='" + strTableID + "'></table>";
							oCell.innerHTML = strInnerHTML;
				
								var oTable2 = eval("document.all['" + strTableID + "'];");
				
								oTable2.width = "260";
								oTable2.border = "0";
								oTable2.cellSpacing = "0";
								oTable2.cellPadding = "0";
				
								var oTHead2 =  oTable2.createTHead();
												
									// ������
									oRow = oTHead2.insertRow();			
		
										oCell = oRow.insertCell() ;
										oCell.colSpan = 4;
										oCell.style.height = "14";
										oCell.style.verticalAlign = "bottom";					
										oCell.className = "musicWhiteTitle";
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='3' height='3' align='absbottom'>&nbsp;" + arrM[arrSortType[nowRow]][1] + "";
										oCell.innerHTML = strInnerHTML;
									
									// ���� �߰�	
									oRow = oTHead2.insertRow();
								
									oCell = oRow.insertCell() ;
									oCell.colSpan = 4;									
										
									strInnerHTML = "<img src='/images/main/blank.gif' width='1' height='2'>";
									oCell.innerHTML = strInnerHTML;	
					
									// �۰��ڿ� ��Ʈ������
									oRow = oTHead2.insertRow();					
					
										// �۰���			
										oCell = oRow.insertCell() ;
										oCell.style.width = "35";
										oCell.style.height = "14";		
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='45' height='13'>";
										oCell.innerHTML = strInnerHTML;		
					
										oCell = oRow.insertCell() ;
										oCell.style.width = "80";	
										oCell.style.verticalAlign = "bottom";					
										oCell.className = "musicWhite";		
													
										strInnerHTML = arrM[arrSortType[nowRow]][2];
										oCell.innerHTML = strInnerHTML;	
					
										// ��Ʈ������			
										oCell = oRow.insertCell() ;
										oCell.style.width = "60";
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='52' height='13'>";
										oCell.innerHTML = strInnerHTML;
													
										oCell = oRow.insertCell() ;		
										oCell.style.verticalAlign = "bottom";				
										oCell.className = "musicWhite";		
													
										strInnerHTML = arrM[arrSortType[nowRow]][3];
										oCell.innerHTML = strInnerHTML;
									
									// ���� �߰�	
									oRow = oTHead2.insertRow();
								
									oCell = oRow.insertCell() ;
									oCell.colSpan = 4;									
										
									strInnerHTML = "<img src='/images/main/blank.gif' width='1' height='2'>";
									oCell.innerHTML = strInnerHTML;	
					
									// �帣�� ���ֽð�
									oRow = oTHead2.insertRow();					
										
										// �帣	
										oCell = oRow.insertCell() ;
										oCell.style.width = "35";
										oCell.style.height = "14";
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='45' height='13'>";
										oCell.innerHTML = strInnerHTML;
													
										oCell = oRow.insertCell() ;
										oCell.style.width = "80";		
										oCell.style.verticalAlign = "bottom";				
										oCell.className = "musicWhite";		
													
										strInnerHTML = arrM[arrSortType[nowRow]][4];
										oCell.innerHTML = strInnerHTML;	
										
										// ���ֽð�
										oCell = oRow.insertCell() ;
										oCell.style.width = "60";
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='52' height='13'>";
										oCell.innerHTML = strInnerHTML;
													
										oCell = oRow.insertCell() ;		
										oCell.style.verticalAlign = "bottom";				
										oCell.className = "musicWhite";		
													
										strInnerHTML = arrM[arrSortType[nowRow]][5];
										oCell.innerHTML = strInnerHTML;
										
									// ���� �߰�	
									oRow = oTHead2.insertRow();
								
									oCell = oRow.insertCell() ;
									oCell.colSpan = 4;									
										
									strInnerHTML = "<img src='/images/main/blank.gif' width='1' height='2'>";
									oCell.innerHTML = strInnerHTML;	
										
									// ���̵��� �Ǹż���
									oRow = oTHead2.insertRow();					
										
										// ���̵�
										oCell = oRow.insertCell() ;
										oCell.style.width = "35";
										oCell.style.height = "14";						
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='45' height='13'>";
										oCell.innerHTML = strInnerHTML;						
										
										oCell = oRow.insertCell() ;
										oCell.style.width = "80";		
										oCell.style.verticalAlign = "bottom";				
										oCell.className = "musicWhite";		
													
										strInnerHTML = "&nbsp;<span style='color:#66CC33;font-weight:bolder'>" + arrM[arrSortType[nowRow]][6] + "</span>";
										strInnerHTML = strInnerHTML + "&nbsp;/&nbsp;" + "<span style='color:#FFCC00;font-weight:bolder'>" + arrM[arrSortType[nowRow]][7] + "</span>";
										strInnerHTML = strInnerHTML + "&nbsp;/&nbsp;" + "<span style='color:#FF3300;font-weight:bolder'>" + arrM[arrSortType[nowRow]][8] + "</span>";
										oCell.innerHTML = strInnerHTML;	
										
										// �Ǹż���
										oCell = oRow.insertCell() ;
										oCell.style.width = "60";
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='52' height='13'>";
										oCell.innerHTML = strInnerHTML;
												
										oCell = oRow.insertCell() ;		
										oCell.style.verticalAlign = "bottom";				
										oCell.className = "musicWhite";		
												
										if(parseInt(arrM[arrSortType[nowRow]][14]) > 0)							
										{
											switch(arrM[arrSortType[nowRow]][14])
											{
												case "1" :
													strInnerHTML = arrM[arrSortType[nowRow]][14] +"st";
													break;
												case "2" :
													strInnerHTML = arrM[arrSortType[nowRow]][14] +"nd";
													break;
												case "3" :
													strInnerHTML = arrM[arrSortType[nowRow]][14] +"rd";
													break;
												default :
													strInnerHTML = arrM[arrSortType[nowRow]][14] +"th";
											}
										}
										else
										{
											//strInnerHTML = "Not Ranked";
											strInnerHTML = "&nbsp;";
										}							
										oCell.innerHTML = strInnerHTML;
									
									// ���� �߰�	
									oRow = oTHead2.insertRow();
								
									oCell = oRow.insertCell() ;
									oCell.colSpan = 4;									
										
									strInnerHTML = "<img src='/images/main/blank.gif' width='1' height='2'>";
									oCell.innerHTML = strInnerHTML;	
														
									// ���ݰ� �� ��� ��ư
									oRow = oTHead2.insertRow();
										
										// ����								
										oCell = oRow.insertCell() ;
										oCell.style.width = "35";
										oCell.style.height = "14";										
												
										strInnerHTML = "<img src='/images/main/blank.gif' width='27' height='13'>";
										oCell.innerHTML = strInnerHTML;
												
										oCell = oRow.insertCell() ;
										oCell.style.width = "85";
										oCell.style.verticalAlign = "bottom";						
										oCell.className = "musicWhite";		
											
										if(parseInt(arrM[arrSortType[nowRow]][9]) > 0)
										{
											strInnerHTML = arrM[arrSortType[nowRow]][9] + " ��";
										}
										else
										{
											strInnerHTML = arrM[arrSortType[nowRow]][10] + " ��";
										}							
										oCell.innerHTML = strInnerHTML;	
										
										// �� ��� ��ư	
										oCell = oRow.insertCell() ;	
					
										oCell.colSpan = 2;					
										oCell.style.textAlign = "right";
										oCell.className = "musicWhite";	
										
										switch(arrM[arrSortType[nowRow]][16])
										{
											case "X" :
												strInnerHTML = "<img src='/images/gamemusic/gamemusic_ico_buy_holding.gif' width='87' height='18' border='0'>";
												break;
											case "Z" :
												strInnerHTML = "<img src='/images/gamemusic/gamemusic_ico_buy_expire.gif' width='67' height='18' border='0'>";
												break;
											case "W" :
												strInnerHTML = "<img src='/images/gamemusic/gamemusic_ico_buy_web.gif' width='115' height='18' border='0'>";
												break;
											case "T" :
												strInnerHTML = "<img src='/images/gamemusic/gamemusic_ico_buy_set.gif' width='115' height='18' border='0'>";
												break;
											default :
												strInnerHTML = "<img src='/images/gamemusic/gamemusic_but_buy_music_off.gif' width='55' height='18' border='0' onClick=\"fnBuyMusic('" + arrM[arrSortType[nowRow]][0] + "')\" onMouseOver=\"this.src='/images/gamemusic/gamemusic_but_buy_music_on.gif'\" onMouseOut=\"this.src='/images/gamemusic/gamemusic_but_buy_music_off.gif'\" style='cursor:hand'>";
												//strInnerHTML = "<img src='/images/gamemusic/gamemusic_but_buy_music_off.gif' width='55' height='18' border='0'>";
										}										
										oCell.innerHTML = strInnerHTML;				
				}						
			}
			
			// �̱��԰�� ���� ������ �����ٶ� ������ ��ġ
			if(intNowPage >= arrStartRowNotBuy.length)
			{
				arrStartRowNotBuy[arrStartRowNotBuy.length] = nowRow;
			}
			
			for(i = cnt; i < intPageSize; i++)
			{
				// �⺻���̺� ����						
				oTable = eval("document.all['tableMusicList" + i + "'];");
				
				oTable.width = "353";
				oTable.height = "84";			
				oTable.border = "0";
				oTable.cellSpacing = "0";
				oTable.cellPadding = "0";
				oTable.background = "/images/gamemusic/gamemusic_table_bg01.gif";
			
				oTHead =  oTable.createTHead();
			
				oRow = oTHead.insertRow();			
		
				oCell = oRow.insertCell() ;
				oCell.style.width = "84" ;
				oCell.style.height = "84" ;
				oCell.style.textAlign = "center";
				oCell.style.verticalAlign = "middle";
				
				strInnerHTML = "&nbsp;";													
				oCell.innerHTML = strInnerHTML;
			
				oCell = oRow.insertCell() ;			
				oCell.style.textAlign = "center";
				
				// �������� ǥ���ϱ��� cellpadding �� �ֱ����� �ӽ� ���̺� ����
				strTableID = "tableCellPadding" + i + "";
				strInnerHTML = "<table id='" + strTableID + "'></table>";
				oCell.innerHTML = strInnerHTML;
				
					var oTable2 = eval("document.all['" + strTableID + "'];");
				
					oTable2.width = "260";
					oTable2.border = "0";
					oTable2.cellSpacing = "0";
					oTable2.cellPadding = "1";
				
					var oTHead2 =  oTable2.createTHead();
				
					oRow = oTHead2.insertRow();			
		
					oCell = oRow.insertCell() ;						
			}		
		}