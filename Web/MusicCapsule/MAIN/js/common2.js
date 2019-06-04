			reCharNickNameDeny = new RegExp("'|\"|&|#|%|<|>", "g");
			
			// 닉네임 입력제한 문자열 체크
			function CheckCharNickNameDeny(objInput)
			{
				strInput = objInput.value;
				intLength = strInput.length;
				
				for(i = 0; i < intLength; i ++)
				{										
					if(strInput.substr(i, 1).match(reCharNickNameDeny))
					{
						return false;
					}						
				}
			}	
			
			// 문자 앞뒤 공백 잘라내는 함수
			function fnTrim(strTemp)
			{
				var i;
				
				for(i=strTemp.length - 1; i>=0; i--)
				{
					if (strTemp.charAt(i) != " ")
					{
						break;
					}
					else if(i == strTemp.length)
					{
						return "";
					}
				}
				
				strTemp = strTemp.substr(0, i+1);
				
				for(i=0;i<strTemp.length;i++)
				{
					if (strTemp.charAt(i) != " ")
						break;
				}
									
				strTemp = strTemp.substr(i, strTemp.length - i);				
				
				return strTemp;
			}
			
			// 롤오버 함수
			function fnRollOver(imgName, imgSrc)
			{								
				document.all[imgName].src = imgSrc;				
			}
			
			// 라디오 버튼 체크 함수
			function checkRadioBtn(radioName) 
			{
			  var collection;
					 
			  collection = document.all[radioName];

			  for (i=0;i<collection.length;i++) 
			  {
			    if (collection[i].checked)
					break;
			  }
			  
			  if(i == collection.length)
			  {
				return false;
			  }
			  else
			  {
				return true;
			  }
			}
			
			// 체크박스 체크 함수
			function checkCheckBox(checkBoxName) 
			{
			  var collection;
					 
			  collection = document.all[checkBoxName];

			  for (i=0;i<collection.length;i++) 
			  {
			    if (collection[i].checked)
					break;
			  }
			  
			  if(i == collection.length)
			  {
				return false;
			  }
			  else
			  {
				return true;
			  }
			}
			
			
			// 입력된 내용 글자수 체크
			function CheckCharCount(objInput)
			{
				strInput = objInput.value;
				intLength = strInput.length;
										
				CharCount = 0;
													
				for(i = 0; i < intLength; i ++)
				{
					strEscape = escape(strInput.substr(i, 1));
					strEscape = strEscape.substr(2, 4);										
													
					if(strEscape.length > 3)
					{
						CharCount += 2;
					}							
					else
					{
						CharCount += 1;
					}				
				}				
										
				return CharCount;
			}
			
			// 입력된 내용 글자수 체크하여 지정된 크기 이상이면 그 위치 반환
			function CheckCharCount(objInput, limitCount)
			{
				strInput = objInput.value;
				intLength = strInput.length;
										
				CharCount = 0;
													
				for(i = 0; i < intLength; i ++)
				{
					strEscape = escape(strInput.substr(i, 1));
					strEscape = strEscape.substr(2, 4);										
													
					if(strEscape.length > 3)
					{
						CharCount += 2;
					}							
					else
					{
						CharCount += 1;
					}	
					
					if(CharCount > limitCount)
					{
						break;
					}		
				}				
										
				return i;
			}

