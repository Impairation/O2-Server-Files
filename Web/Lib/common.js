			reNumeric = new RegExp("[0-9]", "g");
			reAlphaNumeric = new RegExp("[A-Za-z0-9]", "g");			
			reSpecialCharacter = new RegExp("`|~|!|@|#|%|&|(|)_|-|=|,|.|<|>|/|;|:|{|}", "g"); 	
			reSpace = new RegExp(" ", "g");
			reSingleQMark = new RegExp("'", "g");
			reHyphen = new RegExp("-|_", "g");			
	
			// ���� ����ǥ�� �ִ��� üũ�ϴ� �Լ� 
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
			
			// �Էµ� ������ �������� üũ �ϴ� �Լ�
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
	
			// �Էµ� ������ ������ �������� üũ �ϴ� �Լ�
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
			
			// �Էµ� ������ ������ �������� üũ �ϴ� �Լ� -- ���̵𿡴� "-", "_" �ΰ����� ���Ǳ� ������ ���� ����ϴ�.
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
	
			// �Էµ� ������ �ѱ����� üũ �ϴ� �Լ�
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
	
			// �Էµ� ������ �ѱ�, ����, �������� üũ �ϴ� �Լ�
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
	
			// �Էµ� ������ ����, ����, Ư���������� üũ �ϴ� �Լ�
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
			
			// ���� ��ư üũ �Լ�
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
			/* �̸��� �ּ� üũ ���� ===================================== */
			/* ======================================================== */
			
			function CheckEmail(objInput)
			{
				strEmail = objInput.value;
				
			    /** ��������
			     - @�� 2���̻�
			     - .�� �پ ������ ���
			     -  @.��  .@�� �����ϴ� ���
			     - ��ó����.�� ��� **/
			     
			    var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; 
			    
			    /** �ʼ�����
			     - @������ �ϳ��̻��� ���ڰ� �־�� ��
			     - @�� �ϳ��־�� ��
			     - �����θ� .�� �ϳ� �̻� �־�� ��
			     - �����θ��� ������ ���ڴ� ������ 2~3���̾�� �� **/
			     
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
			    /** ��������
			     - @�� 2���̻�
			     - .�� �پ ������ ���
			     -  @.��  .@�� �����ϴ� ���
			     - ��ó����.�� ��� **/
			     
			    var regDoNot = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/; 
			    
			    /** �ʼ�����
			     - @������ �ϳ��̻��� ���ڰ� �־�� ��
			     - @�� �ϳ��־�� ��
			     - �����θ� .�� �ϳ� �̻� �־�� ��
			     - �����θ��� ������ ���ڴ� ������ 2~3���̾�� �� **/
			     
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
			/* �̸��� �ּ� üũ ���� ===================================== */
			/* ======================================================== */
			
			/* ======================================================== */
			/* �ֹ� ��� ��ȣ üũ �Լ��� ���� ============================  */
			/* ======================================================== */
			
			// �ֹε�Ϲ�ȣ üũ ���� �Լ�..
			function CheckJuminNumber(objInput1,objInput2)    
			{
				// CheckSum üũ
				if (checksumJuminNumber(objInput1,objInput2) == false)
					return false;

				strReg1 = objInput1.value;
				strReg2 = objInput2.value;

				sGender = strReg2.substring(0,1);
				sYear = strReg1.substring(0,2);

				// ���ڸ� ù��° ���ڴ� 4���� Ŭ �� ����.
				if (sGender > 4) {
					return false;
				}
				
				// 2000�⵵ ������ ���ڴ� 1, ���ڴ� 2
				// 2000�⵵ ���Ĵ� ���ڴ� 3, ���ڴ� 4
				if (sYear != '00') {
					if ((sGender != '1') && (sGender != '2')) {					
						return false;
					}
				} else {
					if ((sGender != '3') && (sGender != '4')) {
						return false;
					}
				}
					
				// ������� ����� �ƴѰ� ������� üũ
				if (ValidJuminNumber(objInput1) == false)
					return false; 
			}

			//-------------------------------------------------------
			// �ֹι�ȣ ���ڸ� check check.
			//-------------------------------------------------------
			function ValidJuminNumber(objInput1)    
			{
				strReg1 = objInput1.value;

				// YYMMDD�� �´��� Ȯ���Ѵ�.
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
			// �ֹι�ȣ checksum check.
			//-------------------------------------------------------
			function checksumJuminNumber(objInput1,objInput2)    
			{
				//���ڷθ������Ǿ� �ִ��� Test�� ����ǥ��.
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


			// �ֹε�� ��ȣ ���ڸ� �Է��� ���ڸ��� ��Ŀ�� �̵��ϴ� �Լ�
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
			/* �ֹ� ��� ��ȣ üũ �Լ��� ���� ============================  */
			/* ======================================================== */