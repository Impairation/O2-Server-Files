			reCharNickNameDeny = new RegExp("'|\"|&|#|%|<|>|\\\\", "g");
			
			// �г��� �Է����� ���ڿ� üũ
			function CheckCharNickNameDeny(objInput)
			{
				strInput = objInput.value;
				intLength = strInput.length;
				
				for(i = 0; i < intLength; i ++)
				{										
//					if(strInput.substr(i, 1).match(reCharNickNameDeny))
					if(strInput.match(reCharNickNameDeny))
					{
						return false;
					}						
				}
			}	
			
			// ���� �յ� ���� �߶󳻴� �Լ�
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
			
			// �ѿ��� �Լ�
			function fnRollOver(imgName, imgSrc)
			{								
				document.all[imgName].src = imgSrc;				
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
			  
			  if(i == collection.length)
			  {
				return false;
			  }
			  else
			  {
				return true;
			  }
			}
			
			// üũ�ڽ� üũ �Լ�
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
					
			
			// �Էµ� ���� ���ڼ� üũ�Ͽ� ������ ũ�� �̻��̸� �� ��ġ ��ȯ
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

			// �Էµ� ���� ���ڼ� üũ
			function CheckCharCount2(objInput)
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