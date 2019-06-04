var IterationCount;
var TotalFriendsCnt;

function ErrorRedirect( ErrNo )
{
   	location = "gamefind_error.asp?MyID=" + MyID.value + "&EN=" + ErrNo;
}

function MakeFriendList()
{
	try
	{
		TotalFriendsCnt = parseInt(FRTotalCount.value);
		parent.FDuser_count = TotalFriendsCnt;

	  	IterationCount = 0;

		timedIterations();
	}
	catch(e)
	{
		ErrorRedirect( 10 );		
	}
}

function timedIterations()   
{   
    var strFDUserID_ID;
    var strFDNickName_ID;
    var strFDLevel_ID;
    var strFDLogin_ID;
    var strFDMainCH;
    var strFDSubCH;
    
    var oHidden;
    
    var bValid = false;
    
    try 
    {
	 if( IterationCount < TotalFriendsCnt )
	 { 
		strFDUserID_ID = "FRuserID" + IterationCount;
		strFDNickName_ID = "FRuserNickName" + IterationCount;
		strFDLevel_ID = "FRuserLevel" + IterationCount;
		strFDLogin_ID = "FRuserIsLogIn" + IterationCount;
		strFDMainCH = "FRuserMCH" + IterationCount;
		strFDSubCH = "FRuserSCH" + IterationCount;
	
	 	oHidden = document.all[strFDUserID_ID];
		
		if( oHidden ) 
		{
			parent.FDuser_id[IterationCount] = oHidden.value;

		 	oHidden = document.all[strFDNickName_ID];

			if( oHidden )
			{
				parent.FDuser_nickname[IterationCount] = oHidden.value;
	 	
			 	oHidden = document.all[strFDLevel_ID];
		
				if( oHidden )
				{
					parent.FDuser_level[IterationCount] = oHidden.value;
					
					oHidden = document.all[strFDLogin_ID];
					
					if( oHidden )
					{
						parent.FDuser_IsLogIn[IterationCount] = oHidden.value;

						oHidden = document.all[strFDMainCH];
						
						if( oHidden )
						{
							parent.FDuser_MCH[IterationCount] = oHidden.value;
							
							oHidden = document.all[strFDSubCH];
							
							if( oHidden )
							{
								parent.FDuser_SCH[IterationCount] = oHidden.value;
								bValid = true;
							}														
						}
					}
				 }
			}
		}

		if( bValid ) 
		{
			 var j=0;      
			 while (j<=100)
			 	j++;  
			 IterationCount++;

			 setTimeout("timedIterations();", 1);
		}
		else 
		{
		    	IterationCount = TotalFriendsCnt;
			ErrorRedirect( 10 );		
		 }
	}	
    }
    catch(e)
    {
    	IterationCount = TotalFriendsCnt;
	ErrorRedirect( 10 );		
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
