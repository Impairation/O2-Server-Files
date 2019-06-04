			//document.domain = "o2jam.com";

			function returnEventFalse() 
			{
				event.returnValue = false;
			}

			function returnEventTrue() 
			{
				event.returnValue = true;
			}

			var HostName = location.host;
            
			switch(HostName)
			{
				case "o2jam.mgame.com" :
					document.oncontextmenu	= returnEventFalse;
					document.ondragstart	= returnEventTrue;
					document.onselectstart	= returnEventTrue;

					break;

				case "o2jamp.mgame.com" :
					document.oncontextmenu	= returnEventTrue;
					document.ondragstart	= returnEventTrue;
					document.onselectstart	= returnEventTrue;

					break;
								
				default :

					document.oncontextmenu	= returnEventTrue;
					document.ondragstart	= returnEventTrue;
					document.onselectstart	= returnEventTrue;

					break;
			}
		if (window.Event) 
  document.captureEvents(Event.MOUSEUP); 
 
function nocontextmenu() 
{
 event.cancelBubble = true
 event.returnValue = false;
 
 return false;
}
 
function norightclick(e) 
{
 if (window.Event) 
 {
  if (e.which == 2 || e.which == 3)
   return false;
 }
 else
  if (event.button == 2 || event.button == 3)
  {
   event.cancelBubble = true
   event.returnValue = false;
   return false;
  }
 
}
 
document.oncontextmenu = nocontextmenu;  // for IE5+
document.onmousedown = norightclick;  // for all others
