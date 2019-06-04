			reNumeric = new RegExp("[0-9]", "g");
			reAlphaNumeric = new RegExp("[A-Za-z0-9]", "g");			
			reSpecialCharacter = new RegExp("`|~|!|@|#|%|&|(|)_|-|=|,|.|<|>|/|;|:|{|}", "g"); 	
			reSpace = new RegExp(" ", "g");
			reSingleQMark = new RegExp("'", "g");
			reHyphen = new RegExp("-|_", "g");			
	
			// 작은 따옴표가 있는지 체크하는 함수 
			function CheckSingleQuotationMark(objInput)
			{
				strInput = objInput.value;
				intLength = strInput.length;
				
				for(i = 0; i < intLength; i ++)
				{										
					if(strInput.substr(i, 1).match(reSingleQMark))
					{
						return false;
					}						
				}
			}						
			
			// 입력된 내용이 숫자인지 체크 하는 함수
			function CheckNumeric(objInput, chkSpace)
			{				
				strInput = objInput.value;
				intLength = strInput.length;
				
				if(chkSpace == "PermitSpace")
				{				
					for(i = 0; i < intLength; i ++)
					{				
						if(!(strInput.substr(i, 1).match(reNumeric)) && !(strInput.substr(i, 1).match(reSpace)))
						{
							return false;
						}						
					}
				}
				else
				{
					for(i = 0; i < intLength; i ++)
					{
						if(!(strInput.substr(i, 1).match(reNumeric)))
						{
							return false;
						}						
					}
				}		
			}
	
			// 입력된 내용이 영문과 숫자인지 체크 하는 함수
			function CheckAlphaNumeric(objInput, chkSpace)
			{
				strInput = objInput.value;
				intLength = strInput.length;
				
				if(chkSpace == "PermitSpace")
				{
					for(i = 0; i < intLength; i ++)
					{
						
						if(!(strInput.substr(i, 1).match(reAlphaNumeric)) && !(strInput.substr(i, 1).match(reSpace)))
						{
							return false;
						}
					}
							
				}		
				else
				{
					for(i = 0; i < intLength; i ++)
					{						
						if(!(strInput.substr(i, 1).match(reAlphaNumeric)))
						{
							return false;
						}					
					}
				}
			}
			
			// 입력된 내용이 영문과 숫자인지 체크 하는 함수 -- 아이디에는 "-", "_" 두가지가 허용되기 때문에 따로 만듭니다.
			function CheckAlphaNumeric_ID(objInput)
			{
				strInput = objInput.value;
				intLength = strInput.length;
				
				for(i = 0; i < intLength; i ++)
				{				
					if(!(strInput.substr(i, 1).match(reAlphaNumeric)) && !(strInput.substr(i, 1).match(reHyphen)))
					{
						return false;
					}
				}				
			}
	
			// 입력된 내용이 한글인지 체크 하는 함수
			function CheckHangul(objInput, chkSpace)
			{
				strInput = objInput.value;
				intLength = strInput.length;
				
				if(chkSpace == "PermitSpace")
				{				
					for(i = 0; i < intLength; i ++)
					{
						strEscape = escape(strInput.substr(i, 1));
						strEscape = strEscape.substr(2, 4);
												
						if((strEscape < "AC00" || strEscape > "D7A3") && !(strInput.substr(i, 1).match(reSpace)))
						{
							return false;
						}
							
					}
				}
				else
				{
					for(i = 0; i < intLength; i ++)
					{
						strEscape = escape(strInput.substr(i, 1));
						strEscape = strEscape.substr(2, 4);										
							
						if(strEscape < "AC00" || strEscape > "D7A3")
						{
							return false;
						}											
					}
				}
			}
	
			// 입력된 내용이 한글, 영문, 숫자인지 체크 하는 함수
			function CheckHangulAlphaNumeric(objInput, chkSpace)
			{
				strInput = objInput.value;
				intLength = strInput.length;
				
				if(chkSpace == "PermitSpace")
				{
					for(i = 0; i < intLength; i ++)
					{
						strEscape = escape(strInput.substr(i, 1));					
						
						if(strEscape.length <= 3)
						{
							if(!(strInput.substr(i, 1).match(reAlphaNumeric)) && !(strInput.substr(i, 1).match(reSpace)))
							{
								return false;
							}
						}
						else
						{
							strEscape = strEscape.substr(2, 4);
							if(strEscape < "AC00" || strEscape > "D7AF" && !(strInput.substr(i, 1).match(reAlphaNumeric)) && !(strInput.substr(i, 1).match(reSpace)))
							{
								return false;
							}					
						}
					}
				}
				else
				{
					for(i = 0; i < intLength; i ++)
					{
						strEscape = escape(strInput.substr(i, 1));
						
						if(strEscape.length <= 3)
						{
							if(!(strInput.substr(i, 1).match(reAlphaNumeric)))
							{
								return false;
							}
						}
						else
						{
							strEscape = strEscape.substr(2, 4);
							if(strEscape < "AC00" || strEscape > "D7AF" && !(strInput.substr(i, 1).match(reAlphaNumeric)))
							{
								return false;
							}					
						}						
					}
				}
			}
	
			// 입력된 내용이 영문, 숫자, 특수문자인지 체크 하는 함수
			function CheckAlphaNumericSpecialCharacter(objInput, chkSpace)
			{
				strInput = objInput.value;
				intLength = strInput.length;
				
				if(chkSpace == "PermitSpace")
				{				
					for(i = 0; i < intLength; i ++)
					{					
						if(!(strInput.substr(i, 1).match(reAlphaNumeric)) && !(strInput.substr(i, 1).match(reSpecialCharacter)) && !(strInput.substr(i, 1).match(reSpace)))
						{
							return false;
						}
					}					
				}
				else
				{
					for(i = 0; i < intLength; i ++)
					{					
						if(!(strInput.substr(i, 1).match(reAlphaNumeric)) && !(strInput.substr(i, 1).match(reSpecialCharacter)))
						{
							return false;
						}					
					}
				}
			}				
			
	
			function fnTrim(strTemp)
			{
				var i
				
				for(i=strTemp.length - 1; i>=0; i--)
				{
					if (strTemp.charAt(i) != " ")
					{
						break;
					}
					else if(i == strTemp.length)
					{
						return ""
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
			  return(i==collection.length)
			}
			
			/* ======================================================== */
			/* 이메일 주소 체크 시작 ===================================== */
			/* ======================================================== */
			
			function CheckEmail(objInput)
			{
				strEmail = objInput.value;
				
			    /** 금지사항
			     - @가 2개이상
			     - .이 붙어서 나오는 경우
			     -  @.나  .@이 존재하는 경우
			     - 맨처음이.인 경우 **/
			     
			    var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; 
			    
			    /** 필수사항
			     - @이전에 하나이상의 문자가 있어야 함
			     - @가 하나있어야 함
			     - 도메인명에 .이 하나 이상 있어야 함
			     - 도메인명의 마지막 문자는 영문자 2~3개이어야 함 **/
			     
			    var regMust = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3})$/;
				    
			    if ( !regDoNot.test(strEmail) && regMust.test(strEmail) )
			    {
			        return true;
			    }
			    else
			    {
			        return false;
			     }
			}
			
			function CheckEmailByValue(strEmail)
			{
			    /** 금지사항
			     - @가 2개이상
			     - .이 붙어서 나오는 경우
			     -  @.나  .@이 존재하는 경우
			     - 맨처음이.인 경우 **/
			     
			    var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; 
			    
			    /** 필수사항
			     - @이전에 하나이상의 문자가 있어야 함
			     - @가 하나있어야 함
			     - 도메인명에 .이 하나 이상 있어야 함
			     - 도메인명의 마지막 문자는 영문자 2~3개이어야 함 **/
			     
			    var regMust = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3})$/;
				    
			    if ( !regDoNot.test(strEmail) && regMust.test(strEmail) )
			    {
			        return true;
			    }
			    else
			    {
			        return false;
			     }
			}
			/* ======================================================== */
			/* 이메일 주소 체크 종료 ===================================== */
			/* ======================================================== */
			
			/* ======================================================== */
			/* 주민 등록 번호 체크 함수들 시작 ============================  */
			/* ======================================================== */
			
			// 주민등록번호 체크 메인 함수..
			function CheckJuminNumber(objInput1,objInput2)    
			{
				// CheckSum 체크
				if (checksumJuminNumber(objInput1,objInput2) == false)
					return false;

				strReg1 = objInput1.value;
				strReg2 = objInput2.value;

				sGender = strReg2.substring(0,1);
				sYear = strReg1.substring(0,2);

				// 뒷자리 첫번째 숫자는 4보다 클 수 없다.
				if (sGender > 4) {
					return false;
				}
				
				// 2000년도 이전은 남자는 1, 여자는 2
				// 2000년도 이후는 남자는 3, 여자는 4
				if (sYear != '00') {
					if ((sGender != '1') && (sGender != '2')) {					
						return false;
					}
				} else {
					if ((sGender != '3') && (sGender != '4')) {
						return false;
					}
				}
					
				// 생성기로 만든게 아닌가 생년월일 체크
				if (ValidJuminNumber(objInput1) == false)
					return false; 
			}

			//-------------------------------------------------------
			// 주민번호 앞자리 check check.
			//-------------------------------------------------------
			function ValidJuminNumber(objInput1)    
			{
				strReg1 = objInput1.value;

				// YYMMDD가 맞는지 확인한다.
				a = new String(strReg1);

				if(a == '') return false;
				if(a.length != 6 ) return false;

				intYear = parseInt(a.substring(0,2) , 10);
				intMonth = parseInt(a.substring(2,4) , 10);
				intDay = parseInt(a.substring(4,6) , 10);
				
				if(intMonth < 0 || intMonth > 12){ 
					return false;
				}
					
				switch(intMonth){
					case 2 :
						if(intDay < 0 || intDay > 29){
							return false;
							breake;
						}
					case 4 :
						if(intDay < 0 || intDay > 30){
							return false;
							breake;
						}
					case 6 :
						if(intDay < 0 || intDay > 30){
							return false;
							breake;
						}
					case 9 :
						if(intDay < 0 || intDay > 30){
							return false;
							breake;
						}
					case 11 :
						if(intDay < 0 || intDay > 30){
							return false;
							breake;
						}
					default :
						if(intDay < 0 || intDay > 31){
							return false;
							breake;
						}
				}
				
				return true;
			}

			//-------------------------------------------------------
			// 주민번호 checksum check.
			//-------------------------------------------------------
			function checksumJuminNumber(objInput1,objInput2)    
			{
				//숫자로만구성되어 있는지 Test할 정규표현.
				var regExpr = /^[0-9]+$/;

				var str1 = objInput1.value;
				var str2 = objInput2.value;
				var li_lastid,li_mod,li_minus,li_last;
				var value0,value1,value2,value3,value4,value5,value6;
				var value7,value8,value9,value10,value11,value12;
				
				if (regExpr.test(str1) &&  regExpr.test(str2)) {
					li_lastid    = parseFloat(str2.substring(6,7));
					value0  = parseFloat(str1.substring(0,1))  * 2;
					value1  = parseFloat(str1.substring(1,2))  * 3;
					value2  = parseFloat(str1.substring(2,3))  * 4;
					value3  = parseFloat(str1.substring(3,4))  * 5;
					value4  = parseFloat(str1.substring(4,5))  * 6;
					value5  = parseFloat(str1.substring(5,6))  * 7;
					value6  = parseFloat(str2.substring(0,1))  * 8;
					value7  = parseFloat(str2.substring(1,2))  * 9;
					value8  = parseFloat(str2.substring(2,3))  * 2;
					value9  = parseFloat(str2.substring(3,4))  * 3;
					value10 = parseFloat(str2.substring(4,5))  * 4;
					value11 = parseFloat(str2.substring(5,6))  * 5;
					value12 = 0;
					
					value12 = value0+value1+value2+value3+value4+value5+value6+value7+value8+value9+value10+value11+value12 ;
					
					li_mod = value12 %11;
					li_minus = 11 - li_mod;
					li_last = li_minus % 10;
					if (li_last != li_lastid){
						return false;
					} else
						return true;
				} else
				return false;
			}


			// 주민등록 번호 앞자리 입력후 뒷자리로 포커스 이동하는 함수
			function JuminNumberNextFocus(objInput1, objInput2)
			{
				strInput = objInput1.value;
				strInput = fnTrim(strInput);
				intLength = strInput.length;

				if(intLength >= 6)
				{
					objInput2.focus();
				}
				else
				{
					objInput1.focus();
				}
			}
			
			/* ======================================================== */
			/* 주민 등록 번호 체크 함수들 종료 ============================  */
			/* ======================================================== */