var oTHead;
var IterationCount;

var TotalUserCount;

function ReloadUserList()
{
	while( oUserListTable.rows.length != 0 ) 
	{
		oUserListTable.deleteRow(0) ;
	}
	
	LoadUserList();
}

function LoadUserList()
{
   	var oCell;
   	
    try 
    {
	TotalUserCount = parent.parent.CTuser_count;
   	IterationCount = 0;

	oCell = parent.TotalUser;
	oCell.innerHTML = TotalUserCount + " 名";
	
    	oTHead = oUserListTable.createTHead();
    	
	timedIterations();
     }
    catch(e)
    {
    	alert("显示当前用户清单时出错");
    }
}

function GetUserInfo( nType, nIndex )
{
	var strReturn;
    try 
    {
	if( nIndex > -1 && nIndex < TotalUserCount ) {
		switch( nType ) {
			case 0:		// user id
				strReturn = parent.parent.CTuser_id[ nIndex ];
				break;
			case 1:		// nickname
				strReturn = parent.parent.CTuser_nickname[ nIndex ];
				break;
			case 2:		// level
				strReturn = "Lv" + parent.parent.CTuser_level[ nIndex ];
				break;
		}
	} 
    }
    catch(e)
    {
    	strReturn = '';
    }
	
	return strReturn;
}

function timedIterations()   
{   
    var nTotalCount;
    
    var IsConnect = true;	
    
    var oRow, oCell;

    var strDefaultHTML;
    var strInnerHTML;
	
    try 
    {
    	strDefaultHTML = "<P class='txtwhite' onmouseover='mouseOnTR(this, true);' onmouseout='mouseOnTR(this, false);'"
	 if( IterationCount < TotalUserCount )
	 { 
		 var strUserID = GetUserInfo(0, IterationCount);
    		 var strUserNickName = GetUserInfo(1, IterationCount);
    		 var strUserLevel = GetUserInfo(2, IterationCount);
    
    		if( strUserID == '' || strUserNickName == '' || strUserLevel == '' ) {
		    	IterationCount = TotalUserCount;
		  	alert("显示当前用户清单时出错");
		}
		else {
			 oRow = oTHead.insertRow();
		
			 oCell = oRow.insertCell() ;
			 
			 oCell.style.width = "10%" ;
			 oCell.innerHTML = "<P class='txtwhite'>" + strUserLevel + "</p>";
	
			 oCell = oRow.insertCell() ;
			 oCell.style.width = "90%" ;
			 strInnerHTML =  " onmousedown=\"return Show_Context_ForList('NFCTX', 0, 'SelectedUserID', '" + strUserID + "', 'SelectedUserNickName', '" + strUserNickName + "');\">";
			 oCell.innerHTML = strDefaultHTML + strInnerHTML + strUserNickName + "</p>";
		
			 var j=0;      
			 while (j<=100)
			 	j++;  
			 setTimeout("timedIterations();", 1);
			 
			 IterationCount++;
		}
	}
		
    }
    catch(e)
    {
    	IterationCount = TotalUserCount;
  	alert("显示当前用户清单时出错");
    }
}

function SetWhisper()
{
    try 
    {
	parent.parent.SelectedUserID.value =SelectedUserID.value;
	parent.parent.SelectedUserNickName.value = SelectedUserNickName.value;
	parent.parent.EventBridge.click();
    }
    catch(e)
    {
    	alert("当前页出错,你不能发送悄悄话");
    }
}
