var oTHead;
var oIndexHead;
var IterationIndex;
var IterationCount;

var TotalUserCount;

var NowPage;
var MaxPage;
var PageSize;
var StartIndex;
var EndIndex;
var strMyID;

function ErrorRedirect( ErrNo )
{
   	parent.location = "gamefind_error.asp?MyID=" + MyID.value + "&EN=" + ErrNo;
}

function LoadUserList()
{
   	var oCell;
    try 
    {
    	IterationIndex = 0;
    	IterationCount = 0;
	TotalUserCount = parent.parent.CTuser_count;
	MakePageProperty();
   	
	var strTempMyID = fnTrim(MyID.value);
	strMyID = strTempMyID.toUpperCase()
	
   	
	oCell = parent.TotalUser;
	oCell.innerHTML = TotalUserCount + "&nbsp;츰&nbsp;&nbsp;&nbsp;&nbsp;";
	
    	oTHead = oUserListTable.createTHead();
    	oIndexHead = oUserListIndex.createTHead();
    	
    	MakeListIndex();
	NewtimedIterations();
     }
    catch(e)
    {
    	ErrorRedirect(5);
    }
}

function MakePageProperty()
{
   	NowPage = 1;
   	PageSize = 13;
   	MaxPage = 1;
   	StartIndex = 0;
   	EndIndex = 0;

   	NowPage = parseInt(NowPageNo.value);
   	
   	if( NowPage < 1 )
   		NowPage = 1;
   		
   	EndIndex = PageSize * NowPage;
   	
   	if( EndIndex > TotalUserCount )
   	{
   		EndIndex = TotalUserCount;
	   	StartIndex = EndIndex - TotalUserCount % PageSize;
   	} else {
   		StartIndex = EndIndex - PageSize;
   	}
   	
   	MaxPage = parseInt(TotalUserCount / PageSize);
   	
   	if( (TotalUserCount % PageSize) > 0 )
   		MaxPage++;
   		
   	IterationIndex = StartIndex;
}

function GetUserInfo( nType, nIndex )
{
	var strReturn;
	if( nIndex > -1 && nIndex < TotalUserCount ) {
		switch( nType ) {
			case 0:		// user id
				strReturn = parent.parent.CTuser_id[ nIndex ];
				break;
			case 1:		// nickname
				strReturn = parent.parent.CTuser_nickname[ nIndex ];
				break;
			case 2:		// level
				strReturn = parent.parent.CTuser_level[ nIndex ];
				break;
		}
	} 
	
	return strReturn;
}

function NewtimedIterations()   
{   
    var nTotalCount;
    
    var IsConnect = true;	
    
    var oRow, oCell;

    var strInnerHTML;
    var strTxtCss = "txtwhite";
    var bIsFriend = false;
    var strTempUserID;
	
    try 
    {
	 if( IterationIndex < EndIndex )
	 { 
		 var strUserID = fnTrim(GetUserInfo(0, IterationIndex));
    		 var strUserNickName = fnTrim(GetUserInfo(1, IterationIndex));
    		 var strUserLevel = parseInt(GetUserInfo(2, IterationIndex));
    		 
    		if( strUserID == '' || strUserNickName == '') {
		    	IterationIndex = EndIndex;
		}
		else {
			 strTempUserID = strUserID.toUpperCase();
/*	서로 IFrame이라서 친구 리스트가 완료 되었는지 확인할 수 없다.
			 bIsFriend = CheckIsFriend( strUserID );
			 if( bIsFriend )
			 {
			 	strTxtCss =  "txtfriend";
			 }
*/			 
//			 var strLvCellID = "LvCellID" + IterationIndex; 
//			 var strNickCellID = "NickCellID" + IterationIndex;
			 
			 oRow = oTHead.insertRow();
			 oRow.height = "17pt";
		
			 oCell = oRow.insertCell() ;
//			 oCell.id = strLvCellID;
			 oCell.style.width = "10%" ;
			 oCell.style.textAlign = "right";
			 oCell.background="/images/gameboard/dot_bg.gif";
//			 oCell.innerHTML = "<P class='" + strTxtCss + "' onmouseover=\"mouseOnListTR(this, true,'" + strNickCellID + "');\" onmouseout=\"mouseOnListTR(this, false,'" + strNickCellID + "');\">" + strUserLevel + "</p>";
			 oCell.innerHTML = "<P class='" + strTxtCss + "'>" + strUserLevel + "</P>";
	
			 oCell = oRow.insertCell() ;
			 oCell.style.width = "2%" ;
			 oCell.background="/images/gameboard/dot_bg.gif";
	
			 oCell = oRow.insertCell() ;
//			 oCell.id = strNickCellID;
			 oCell.style.width = "88%" ;
			 oCell.background="/images/gameboard/dot_bg.gif";
			 
//			 strInnerHTML =  "<P class='" + strTxtCss + "' onmouseover=\"mouseOnListTR(this, true,'" + strLvCellID + "');\" onmouseout=\"mouseOnListTR(this, false,'" + strLvCellID + "');\"";
			 strInnerHTML =  "<P class='" + strTxtCss + "' onmouseover=\"mouseOnListTR(this, true);\" onmouseout=\"mouseOnListTR(this, false);\"";
			 
			 if( strTempUserID == strMyID )
				 strInnerHTML =  strInnerHTML + ">";
			 else
				 strInnerHTML =  strInnerHTML + " ondblclick=\"SetDirectWhisper('SelectedUserID', '" + strUserID + "', 'SelectedUserNickName', '" + ReplaceInValidString(strUserNickName) + "');\" onmousedown=\"return Show_Context_ForList('NFCTX', 0, 'SelectedUserID', '" + strUserID + "', 'SelectedUserNickName', '" + ReplaceInValidString(strUserNickName) + "');\">";
				 
			 oCell.innerHTML = strInnerHTML + "&nbsp;&nbsp;" + ReplaceInTagString(strUserNickName) + "</p>";
		
//			 oRow = oTHead.insertRow();
			
/*			 oCell = oRow.insertCell() ;
			 oCell.colSpan = "3";
			 oCell.style.width = "1" ;
			 oCell.innerHTML = "<img src='/images/main/blank.gif' width='1' height='1'>";
*/			
		 
			 var j=0;      
			 while (j<=100)
			 	j++;  

			 IterationCount++;
			 IterationIndex++;

			 setTimeout("NewtimedIterations();", 1);
		}
	}
		
    }
    catch(e)
    {
    	IterationIndex = EndIndex;
  	ErrorRedirect(5);
    }
}

function ReplaceInValidString( strSource )
{
	var strTempSource;
	var strTempString;
	
	strTempSource = strSource;
	
	strTempString = strTempSource.replace( /%/g, "%25");
	strTempString = strTempString.replace( /#/g, "%23");
	strTempString = strTempString.replace( /</g, "%3C");
	strTempString = strTempString.replace( />/g, "%3E");
	strTempString = strTempString.replace( /&/g, "%26");

	return strTempString;
}

function ReplaceInTagString( strSource )
{
	var strTempSource;
	var strTempString;
	
	strTempSource = strSource;
	
	strTempString = strTempSource.replace( /</g, "&lt;");
	strTempString = strTempString.replace( />/g, "&gt;");

	return strTempString;
}

function CheckIsFriend( strUserID )
{
	var bFriend = false;
	var nIndex;
	var strFriendID;
	var TempUserID;
	var TempFriendID;
	
	var TotalFriendCount;
	
	TempUserID = fnTrim(strUserID.toUpperCase());
	TotalFriendCount = parent.parent.FDuser_count;
	
    	for( nIndex = 0; nIndex < TotalFriendCount ; nIndex++) {
		strFriendID = parent.parent.FDuser_id[ nIndex ];
		
		TempFriendID = fnTrim(strFriendID.toUpperCase());

		if( TempUserID == TempFriendID ) {
			bFriend = true;
			break;
		}
	} 
    
	return bFriend;
}

function MakeListIndex()
{
   	var oRow, oCell;

    	var strDefaultHTML;
    	var strInnerHTML;	
    	
	var strNumber;
	var strTotalString;
	var nIndex;
	
	var PrePage, NextPage;
	
	PrePage = NowPage - 1;
	NextPage = NowPage + 1;
	
	if( NowPage > 1 )
		strTotalString = "<P class='txtwhite'><a OnClick='ChangePage(" + PrePage + ");' style='cursor:hand'><font size='2' color='#3975D6'>&lt;&lt;</font></a>";
	else
		strTotalString = "<P class='txtwhite'><font size='2'  color='#3975D6'>&lt;&lt;</font>";

	
	for( nIndex = 1; nIndex <= MaxPage; nIndex++ ) {
		if( nIndex == NowPage )
			strTotalString = strTotalString + "&nbsp;<b><font color='#66CCFF'>" + nIndex + "</font></b>";
		else
			strTotalString = strTotalString + "&nbsp;<a OnClick='ChangePage(" + nIndex + ");' style='cursor:hand'><font color='#CCCCCC'>" + nIndex + "</font></a>";
	}
	
	if( NowPage < MaxPage )
		strTotalString = strTotalString + "&nbsp;<a OnClick='ChangePage(" + NextPage + ");' style='cursor:hand'><font size='2'  color='#3975D6'>&gt;&gt;</font></a></P>";
	else
		strTotalString = strTotalString + "&nbsp;<font size='2'  color='#3975D6'>&gt;&gt;</font></P>";
	
	oRow = oIndexHead.insertRow();
	oRow.style.height="10";
	oCell = oRow.insertCell() ;
	oCell.style.textAlign = "center";
			 
	oCell.innerHTML = strTotalString;
}
function ChangePage( nNewPage )
{
	NowPageNo.value = nNewPage;
	
	while( oUserListTable.rows.length != 0 ) 
	{
		oUserListTable.deleteRow(0) ;
	}
	
	while( oUserListIndex.rows.length != 0 ) 
	{
		oUserListIndex.deleteRow(0) ;
	}
	
	LoadUserList();
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
    	ErrorRedirect(8);
    }
}

function SetDirectWhisper( hTargetID, strUserID, hTargetNickName, strUserNickName )
{
  if( Set_Selected_UserID2( hTargetID, strUserID ) && Set_Selected_UserID2( hTargetNickName, strUserNickName ) )
  {
  	SetWhisper();
  }	
}

function Set_Selected_UserID2( hName, strUserID )
{
  var hiddenInput = document.all[hName];
  
  if( hiddenInput == '' )
  	return false;
  
  hiddenInput.value = strUserID;
  
  return true;
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