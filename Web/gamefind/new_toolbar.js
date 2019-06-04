function namosw_init_slide_layers()
{
  var layer;
  var i;
  var args = namosw_init_slide_layers.arguments;

  for (i = 0; i < args.length; i += 2) {
      if (args[i] == '')
        continue;
      if (navigator.appName == 'Netscape') {
	layer = document.layers[args[i]];
        if (args[i+1] == 1)
          layer.left = -layer.clip.width  + 5;
        else if (args[i+1] == 2)
          layer.top  = -layer.clip.height + 5;
	layer._sl_dir    = (layer.top < 0) ? 'v' : ((layer.left < 0) ? 'h' : '');
        if (layer._sl_dir == '') return;
	layer._sl_maxpos = 0
	layer._sl_minpos = (layer.top < 0) ? layer.top : layer.left;
        if (layer.document.namoswmenucontainer)
          layer = layer.document.namoswmenucontainer;
	if (layer.captureEvents)
	  layer.captureEvents(Event.MOUSEOVER|Event.MOUSEOUT);
      } else {
	layer = document.all[args[i]];
        if (args[i+1] == 1)
          layer.style.pixelLeft = -layer.style.pixelWidth  + 5;
        else if (args[i+1] == 2)
          layer.style.pixelTop  = -layer.style.pixelHeight + 5;
	layer._sl_dir    = (layer.style.pixelTop < 0) ? 'v' : ((layer.style.pixelLeft < 0) ? 'h' : '');
        if (layer._sl_dir == '') return;
	layer._sl_maxpos = 0;
	layer._sl_minpos = (layer.style.pixelTop < 0) ? layer.style.pixelTop : layer.style.pixelLeft;
      }
      layer.onmouseover  = namosw_sl_mouseover;
      layer.onmouseout   = namosw_sl_mouseout;
  }
}

function namosw_sl_mouseover() 
{
  var layer = this;
  var name  = (navigator.appName == 'Netscape') ? layer.name : layer.id;
  if (name == 'namoswmenucontainer') {
    if (navigator.appName == 'Netscape') {		// redundant check
      layer = layer.parentLayer;
      name  = layer.name;
    }
  }
  if (layer._down_interval)
    clearInterval(layer._down_interval)
  layer._up_interval = setInterval("namosw_sl_mouseover2('" + name + "')", 50)
}

function namosw_sl_mouseout() 
{
  var layer = this;
  var name  = (navigator.appName == 'Netscape') ? layer.name : layer.id;
  if (name == 'namoswmenucontainer') {
    if (navigator.appName == 'Netscape') {		// redundant check
      layer = layer.parentLayer;
      name  = layer.name;
    }
  }
  if (layer._up_interval)
    clearInterval(layer._up_interval)
  layer._down_interval = setInterval("namosw_sl_mouseout2('" + name + "')", 50)
}

function namosw_sl_mouseover2(name) 
{
  var layer;
  if (navigator.appName == 'Netscape') {
    layer = document.layers[name];
    if (layer._sl_dir == 'h' && layer.left < layer._sl_maxpos)
      layer.left += 5;
    else if (layer._sl_dir == 'v' && layer.top < layer._sl_maxpos)
      layer.top += 5;
    else if (layer._up_interval)
      clearInterval(layer._up_interval);
  } else {
    layer = document.all[name];
    if (layer._sl_dir == 'h' && layer.style.pixelLeft < layer._sl_maxpos)
      layer.style.pixelLeft += 5
    else if (layer._sl_dir == 'v' && layer.style.pixelTop < layer._sl_maxpos)
      layer.style.pixelTop += 5;
    else if (layer._up_interval)
      clearInterval(layer._up_interval);
  }
}

function namosw_sl_mouseout2(name) 
{
  var layer;
  if (navigator.appName == 'Netscape') {
    layer = document.layers[name];
    if (layer._sl_dir == 'h' && layer._sl_minpos < layer.left)
      layer.left -= 5;
    else if (layer._sl_dir == 'v' && layer._sl_minpos < layer.top)
      layer.top  -= 5;  
    else if (layer._down_interval)
      clearInterval(layer._down_interval);
  } else { 
    layer = document.all[name];
    if (layer._sl_dir == 'h' && layer._sl_minpos < layer.style.pixelLeft)
      layer.style.pixelLeft -= 5;
    else if (layer._sl_dir == 'v' && layer._sl_minpos < layer.style.pixelTop)
      layer.style.pixelTop -= 5;
    else if (layer._down_interval)
      clearInterval(layer._down_interval);
  }
}

function Show_Context_ForList(lname, flag, hTargetID, strUserID, hTargetNickName, strUserNickName)
{
  var layer = (navigator.appName == 'Netscape') ? document.layers[lname] : document.all[lname];
  
  if (lname == '')
    return false;
    
  if( Set_Selected_UserID( hTargetID, strUserID ) && Set_Selected_UserID( hTargetNickName, strUserNickName ) )
  {
	  if( event.button != 2 )
	  	return false;
	  	
 	  var WindowHeight;
  	  var WindowWidth;

  	  var LayerHeight;
  	  var LayerWidth;
  	  
  	  var MouseXPos;
  	  var MouseYPos;
  	  
	  var LocationX = 0;
	  var LocationY = 0;

	  WindowHeight = parent.document.all[self.name].offsetHeight;
	  WindowWidth = parent.document.all[self.name].offsetWidth;
	  
	  LayerHeight = parseInt(layer.style.height);
	  LayerWidth = parseInt(layer.style.width);
	  
	  MouseXPos =  parseInt(event.clientX);
	  MouseYPos =  parseInt(event.clientY);
	  
	 if( (WindowWidth - MouseXPos) < LayerWidth ) {
  	  	 LocationX = MouseXPos - LayerWidth;
		 if( LocationX < 0 )
		 	LocationX = MouseXPos - ( MouseXPos / 2);

	 } else {
		LocationX = MouseXPos;
	 }
	 
	 if( (WindowHeight - MouseYPos) < LayerHeight ) {
  	  	 LocationY = MouseYPos - LayerHeight;
	 } else {
		LocationY = MouseYPos;
	 }
 
	  layer.style.left = LocationX;
                  layer.style.top = LocationY;
                  
	  if (navigator.appName == 'Netscape')
	    layer.visibility = (flag == 0) ? 'show' : 'hide';
	  else
	    layer.style.visibility = (flag == 0) ? 'visible' : 'hidden';
  }

  return false;
}

function Show_Context_ForLayer(lname, flag)
{
  var layer = (navigator.appName == 'Netscape') ? document.layers[lname] : document.all[lname];
  
  if (lname == '')
    return false;
    
  if (navigator.appName == 'Netscape')
    layer.visibility = (flag == 0) ? 'show' : 'hide';
  else
    layer.style.visibility = (flag == 0) ? 'visible' : 'hidden';
  
  return false;
}

function Send_Message( hMyID, hTargetID, hTargetNickName )
{
  var strUserID = Get_Selected_UserID( hMyID );
  var strTargetID = Get_Selected_UserID( hTargetID );
  var strTargetNickName = Get_Selected_UserID( hTargetNickName );
  
  if( strUserID == '' )
  	return false;
  	
  if( strTargetID == '' )
  	return false;

  if( strTargetNickName == '' )
  	return false;
  	
  parent.location.href = "gamefind_sendmess.asp?MyID=" + strUserID + "&TargetID=" + strTargetID + "&TargetNickName=" + escape(strTargetNickName);
}

function Add_Friend( hMyID, hTargetID, hTargetNickName )
{
  var strUserID = Get_Selected_UserID( hMyID );
  var strTargetID = Get_Selected_UserID( hTargetID );
  var strTargetNickName = Get_Selected_UserID( hTargetNickName );
  
  if( strUserID == '' )
  	return false;
  	
  if( strTargetID == '' )
  	return false;

  if( strTargetNickName == '' )
  	return false;
  	
  parent.location.href = "gamefind_addfriend.asp?MyID=" + strUserID + "&TargetID=" + strTargetID + "&TargetNickName=" + strTargetNickName;
}

function Del_Friend( hMyID, hTargetID, hTargetNickName )
{
  var strUserID = Get_Selected_UserID( hMyID );
  var strTargetID = Get_Selected_UserID( hTargetID );
  var strTargetNickName = Get_Selected_UserID( hTargetNickName );
  
  if( strUserID == '' )
  	return false;
  	
  if( strTargetID == '' )
  	return false;
  	
  if( strTargetNickName == '' )
  	return false;
  	
  parent.location.href = "gamefind_delete_friend.asp?MyID=" + strUserID + "&TargetID=" + strTargetID + "&TargetNickName=" + strTargetNickName;
}

function Get_Selected_UserID( hName )
{
  var hiddenInput = document.all[hName];
  var strUserID = '';
  
  if( hiddenInput == '' )
  	return strUserID;
  
  strUserID = hiddenInput.value;
  
  return strUserID;
}

function Set_Selected_UserID( hName, strUserID )
{
  var hiddenInput = document.all[hName];
  
  if( hiddenInput == '' )
  	return false;
  
  hiddenInput.value = strUserID;
  
  return true;
}

function mouseOnTR(obj, bool){
  if (bool)
  {
	obj.style.cursor = 'hand';
	obj.style.backgroundColor = '#e6e6fa';
  }
  else
  {
	obj.style.cursor = 'default';
	obj.style.backgroundColor = '';
  }
}

function mouseOnListTR(obj, bool){
  if (bool)
  {
	obj.style.cursor = 'hand';
	obj.style.backgroundColor = '#1B4495';
  }
  else
  {
	obj.style.cursor = 'default';
	obj.style.backgroundColor = '';
  }
}

/*function mouseOnListTR(obj, bool, strWidthObj){
	var TempHtmlA, TempHtmlB;
	var TempHtmlC, TempHtmlD;
	var oTempCell;

  	oTempCell = document.all[strWidthObj];
  	
  if (bool)
  {
  	if( obj )
	{
		obj.style.cursor = 'hand';
		obj.style.backgroundColor = '#1B4495';
		
		if( LvCellID1 )
		{
			LvCellID1.style.backgroundColor = '#1B4495';
		}
	}
  }
  else
  {
	obj.style.cursor = 'default';
	obj.style.backgroundColor = '';
	
	if( LvCellID1 )
	{
		LvCellID1.style.backgroundColor = '';
	}
  }
}

*/