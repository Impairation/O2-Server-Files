		
		function fnPaging()
		{
			document.images["numNowPage_1"].src = "/images/gamemusic/gamemusic_num_" + parseInt(intNowPage / 10) + ".gif";
			document.images["numNowPage_0"].src = "/images/gamemusic/gamemusic_num_" + parseInt(intNowPage % 10) + ".gif";
		
		}
		
		function fnSetTotalCount()
		{
			// 전체 곡수 설정
			cntTotalMusic.innerHTML = "[" + intTotalRows + " 看멱]";			
						
			// 전체 페이지수 이미지 설정
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
			
			// 전체 개수와 페이지수 설정
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
			// 테이블 초기화		
			fnInitTable();
			
			var strSortArray;
			
			// 지정된 정렬 방식이 아니거나, 정렬방식이 지정되지 않으면 날짜별로 정렬합니다.
			var re = /Artist|Genre|Subject|Easy|Point|Price|Date/g;			
			
			if(!sortType.match(re))
			{
				sortType = "Date";
			}
			
			sortTypeNow = sortType;
			
			// 페이지 이동의 경우는 정렬순서를 바꿀 필요가 없으므로 통과합니다.
			if(paging == "y")
			{
				strSortArray = "arrSort" + sortType + ";"
			}
			else
			{
				fnResetStartRow();
				
				// 페이지 이동이 아닌 경우 현재 페이지를 1 페이지로 초기화
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
				
				// 정렬순서, 즉 오름차순 내림차순 설정하는 곳입니다.
				// 날짜와 인기도는 내림차순이 기본이며, 나머지는 오름차순이 기본입니다.				
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
			
			// 실제로 보여줄 리스트 개수 설정
			if(intNowPage == intTotalPages)
			{
				cntLimit = ((intTotalRows - 1) % intPageSize + 1);
			}
			else
			{
				cntLimit = intPageSize;
			}
			
			// 리스트 보여주기 시작
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
																
					// 기본테이블 생성						
					oTable = eval("document.all['tableMusicList" + k + "'];");
				
					oTable.width = "353";
					oTable.height = "84";			
					oTable.border = "0";
					oTable.cellSpacing = "0";
					oTable.cellPadding = "0";
					oTable.background = objImage.src;
					
			
					oTHead =  oTable.createTHead();
					
						// 곡이미지 
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
												
									// 곡제목
									oRow = oTHead2.insertRow();			
		
										oCell = oRow.insertCell() ;
										oCell.colSpan = 4;
										oCell.style.height = "14";
										oCell.style.verticalAlign = "bottom";					
										oCell.className = "musicWhiteTitle";
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='3' height='3' align='absbottom'>&nbsp;" + arrM[arrSortType[nowRow]][1] + "";
										oCell.innerHTML = strInnerHTML;
									
									// 빈줄 추가	
									oRow = oTHead2.insertRow();
								
									oCell = oRow.insertCell() ;
									oCell.colSpan = 4;									
										
									strInnerHTML = "<img src='/images/main/blank.gif' width='1' height='2'>";
									oCell.innerHTML = strInnerHTML;	
					
									// 작곡자와 노트제작자
									oRow = oTHead2.insertRow();					
					
										// 작곡자			
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
					
										// 노트제작자			
										oCell = oRow.insertCell() ;
										oCell.style.width = "60";
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='52' height='13'>";
										oCell.innerHTML = strInnerHTML;
													
										oCell = oRow.insertCell() ;		
										oCell.style.verticalAlign = "bottom";				
										oCell.className = "musicWhite";		
													
										strInnerHTML = arrM[arrSortType[nowRow]][3];
										oCell.innerHTML = strInnerHTML;
									
									// 빈줄 추가	
									oRow = oTHead2.insertRow();
								
									oCell = oRow.insertCell() ;
									oCell.colSpan = 4;									
										
									strInnerHTML = "<img src='/images/main/blank.gif' width='1' height='2'>";
									oCell.innerHTML = strInnerHTML;	
					
									// 장르와 연주시간
									oRow = oTHead2.insertRow();					
										
										// 장르	
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
										
										// 연주시간
										oCell = oRow.insertCell() ;
										oCell.style.width = "60";
													
										strInnerHTML = "<img src='/images/main/blank.gif' width='52' height='13'>";
										oCell.innerHTML = strInnerHTML;
													
										oCell = oRow.insertCell() ;		
										oCell.style.verticalAlign = "bottom";				
										oCell.className = "musicWhite";		
													
										strInnerHTML = arrM[arrSortType[nowRow]][5];
										oCell.innerHTML = strInnerHTML;
										
									// 빈줄 추가	
									oRow = oTHead2.insertRow();
								
									oCell = oRow.insertCell() ;
									oCell.colSpan = 4;									
										
									strInnerHTML = "<img src='/images/main/blank.gif' width='1' height='2'>";
									oCell.innerHTML = strInnerHTML;	
										
									// 난이도와 판매순위
									oRow = oTHead2.insertRow();					
										
										// 난이도
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
										
										// 판매순위
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
									
									// 빈줄 추가	
									oRow = oTHead2.insertRow();
								
									oCell = oRow.insertCell() ;
									oCell.colSpan = 4;									
										
									strInnerHTML = "<img src='/images/main/blank.gif' width='1' height='2'>";
									oCell.innerHTML = strInnerHTML;	
														
									// 가격과 곡 담기 버튼
									oRow = oTHead2.insertRow();
										
										// 가격								
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
											strInnerHTML = arrM[arrSortType[nowRow]][9] + " Ｍ";
										}
										else
										{
											strInnerHTML = arrM[arrSortType[nowRow]][10] + " Ｇ";
										}							
										oCell.innerHTML = strInnerHTML;	
										
										// 곡 담기 버튼	
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
			
			// 미구입곡에서 다음 페이지 보여줄때 시작할 위치
			if(intNowPage >= arrStartRowNotBuy.length)
			{
				arrStartRowNotBuy[arrStartRowNotBuy.length] = nowRow;
			}
			
			for(i = cnt; i < intPageSize; i++)
			{
				// 기본테이블 생성						
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
				
				// 뮤직정보 표시하기전 cellpadding 을 주기위한 임시 테이블 생성
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