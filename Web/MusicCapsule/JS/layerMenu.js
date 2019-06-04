
var PATH_ERROR_PAGE;
var PATH_GATE_PAGE;
var PATH_MAIN_PAGE;
var PATH_MAIN_IFRAME_PAGE;
var PATH_NOTE_PREV_PAGE;
var PATH_NOTE_WRITE_PAGE;
var PATH_FRIEND_REQUEST_PREV_PAGE;
var PATH_FRIEND_REQUEST_WRITE_PAGE;

var strLocationHost;
var strLocationPathName;
var strLocationSearch;
var strLocationURL;

var strFrameName1;

var strDivMenuLayerName;
var cid, mcid, tid, tnick, openTarget;
var strLayerMenuOverColor;
var strLayerMenuOutColor;

PATH_ERROR_PAGE = "/MusicCapsule/error/error_message_gate.asp";
PATH_GATE_PAGE = "/MusicCapsule/main/musicCapsule_gate.asp";
PATH_MAIN_PAGE = "/MusicCapsule/main/musicCapsule_main.asp";
PATH_MAIN_IFRAME_PAGE = "/MusicCapsule/main/musicCapsule_main_iframe.asp";
PATH_NOTE_PREV_PAGE = "/MusicCapsule/note/musicCapsule_writeMemo_Capsule_Prev.asp";
PATH_NOTE_WRITE_PAGE = "/MusicCapsule/note/musicCapsule_writeMemo_OtherCapsule.asp";
PATH_FRIEND_REQUEST_PREV_PAGE = "/MusicCapsule/friends/musicCapsule_friends_request_Prev.asp";
PATH_FRIEND_REQUEST_WRITE_PAGE = "/MusicCapsule/friends/musicCapsule_friends_request.asp";

strLocationHost = location.host;
strLocationPathName = location.pathname;
strLocationSearch = location.search;

strLocationURL = "http://" + strLocationHost + strLocationPathName + strLocationSearch;


strFrameName1 = "ifMainContent";

strDivMenuLayerName = "divMenuLayer";
strLayerMenuOverColor = "#15BFFA";
strLayerMenuOutColor = "#FFFFFF";


// ≈¨∏Ø ¿Ã∫•∆Æ∏¶ ∏µŒ ¿Ã∞˜ø°º≠ √≥∏Æ«œµµ∑œ º≥¡§
document.onclick = objOnClick;

function objOnClick()
{
	strEventSrc = event.srcElement;
	strEventSrc = strEventSrc.toString();
	
	strEventSrc = strEventSrc.indexOf("fnClickLayerMenu");	
	
	if(strEventSrc > 0)
	{
		fnViewLayerMenu();
	}
	else
	{
		var objDiv;
		objDiv = document.all[strDivMenuLayerName];
		
		fnHideDiv(objDiv);
	}
}

// ¿Ø¿˙∞° ≈¨∏Ø«ﬂ¿ª∂ß Ω««‡µ«¥¬ «‘ºˆ...
function fnClickLayerMenu(t_cid, t_mcid, t_tid, chkTarget)
{
	cid = t_cid;
	mcid = t_mcid;
	tid = t_tid;	
	openTarget = chkTarget;	
}

// ∑π¿ÃæÓ ∏ﬁ¥∫ ∫∏ø©¡÷±‚
function fnViewLayerMenu()
{
	var objBody;
	var objLayerMenu;
	var posX, posY;
	var strEventSrc;
	

	objBody = window.document.body;
	
	objLayerMenu = document.all[strDivMenuLayerName];
	
	posX = event.clientX + objBody.scrollLeft;
	posY = event.clientY + objBody.scrollTop;
	
	objLayerMenu.style.pixelTop = posY;
	objLayerMenu.style.pixelLeft = posX;
	
	objLayerMenu.style.display = "block";
}

// ∑π¿ÃæÓ ∏ﬁ¥∫ ∞®√ﬂ±‚
function fnHideDiv(obj)
{
	obj.style.display = "none";
}

// ∏∂øÏΩ∫ ø¿πˆΩ√ø° Ω««‡.. «ˆ¿Á¥¬ πË∞Êªˆ∏∏ πŸ≤ﬁ
function fnLayerMenuOver(obj)
{
	obj.style.background = strLayerMenuOverColor;
}

// ∏∂øÏΩ∫ æ∆øÙΩ√ø° Ω««‡.. «ˆ¿Á¥¬ πË∞Êªˆ∏∏ πŸ≤ﬁ
function fnLayerMenuOut(obj)
{
	obj.style.background = strLayerMenuOutColor;
}


// ∏ﬁ¥∫ º±≈√«ﬂ¿ª∂ß Ω««‡µ«¥¬ ∞˜
function fnGoLayerMenu(chkMenu)
{
	switch(chkMenu)
	{
		case "Capsule1" :
			fnGoCapsule(tid);
			break;
		case "Friend1" :
			if(tid == mcid)
			{
				alert("≤ªƒ‹∏¯◊‘º∫∫√”——˚«Î");
			}
			else
			{
				fnFriendRequestLayerMenu(cid, tid, openTarget)			
			}
			break;
		case "Friend2" :
			break;
		case "Note1" :
			if(tid == mcid)
			{
				alert("≤ªƒ‹∏¯◊‘º∫∑¢ÀÕ÷ΩÃı");
			}
			else
			{
				fnSendNoteLayerMenu(cid, tid, openTarget);
			}
			break;
	}
}

// ƒ∏Ω∂∑Œ ¿Ãµø
function fnGoCapsule(idx)
{
	if(idx.length > 0)
	{
		
		if(parseInt(idx) > 0)
		{
			top.location.href = PATH_GATE_PAGE + "?cid=" + idx + "";
			
		}
		else
		{
			alert("ƒ„À˘—°‘Òµƒª·‘±ªπ√ª”–ø™…Ë“Ù¿÷…Á«¯");
		}
	}
}

// ƒ£±∏ø‰√ª«œ±‚
function fnFriendRequestLayerMenu(idx, tidx, chkTarget)
{
	strLocationURL = encodeURIComponent(strLocationURL);
	
	switch(chkTarget)
	{
		case "s" :
			location.href = PATH_FRIEND_REQUEST_PREV_PAGE + "?cid=" + idx + "&tid=" + tidx + "&returl=" + strLocationURL + "";
			break;
		case "p" :
			//parent.location.href = PATH_FRIEND_REQUEST_PREV_PAGE + "?cid=" + idx + "&tid=" + tidx + "&returl=" + strLocationURL + "";
			break;
		case "f1" :
			var strFrameURL1;
			var chkStr;
			
			eval("strFrameURL1 = " + strFrameName1 + ".location.href;");
			
			var chkStr = strFrameURL1.toUpperCase( ).indexOf(PATH_FRIEND_REQUEST_WRITE_PAGE.toUpperCase( ));
			if(chkStr > 0)
			{
				strFrameURL1 = PATH_MAIN_IFRAME_PAGE + "?cid=" + idx + "";
			}					
			strFrameURL1 = encodeURIComponent(strFrameURL1);
			
			document.all[strFrameName1].src = PATH_FRIEND_REQUEST_PREV_PAGE + "?cid=" + idx + "&tid=" + tidx + "&returl=" + strFrameURL1 + "";
			break;		
	}
}

// ¬ ¡ˆ ∫∏≥ª±‚
function fnSendNoteLayerMenu(idx, tidx, chkTarget)
{	
	strLocationURL = encodeURIComponent(strLocationURL);
	
	switch(chkTarget)
	{
		case "s" :
			location.href = PATH_NOTE_PREV_PAGE + "?cid=" + idx + "&tid=" + tidx + "&returl=" + strLocationURL + "";
			break;
		case "p" :
			//parent.location.href = PATH_NOTE_PREV_PAGE + "?cid=" + idx + "&tid=" + tidx + "&returl=" + strLocationURL + "";
			break;
		case "f1" :
			var strFrameURL1;
			var chkStr;
			
			eval("strFrameURL1 = " + strFrameName1 + ".location.href;");
			
			var chkStr = strFrameURL1.toUpperCase( ).indexOf(PATH_NOTE_WRITE_PAGE.toUpperCase( ));
			if(chkStr > 0)
			{
				strFrameURL1 = PATH_MAIN_IFRAME_PAGE + "?cid=" + idx + "";
			}					
			strFrameURL1 = encodeURIComponent(strFrameURL1);
			
			document.all[strFrameName1].src = PATH_NOTE_PREV_PAGE + "?cid=" + idx + "&tid=" + tidx + "&returl=" + strFrameURL1 + "";
			break;		
	}
}


// ∑π¿ÃæÓ ∏ﬁ¥∫ HTML 
document.write("	<div id=\"divMenuLayer\" style=\"position:absolute;display:none;top:0;left:0\">");
document.write("		<table width=\"90\" border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"#000000\" ID=\"Table1\">");
document.write("			<tr>");
document.write("			<td>");
document.write("				<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"2\" bgcolor=\"#FFFFFF\" ID=\"Table2\">");
document.write("					<tr>");
document.write("					<td>");
document.write("						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\" ID=\"Table3\">");
document.write("							<tr>");
document.write("							<td valign=\"bottom\" onmouseover=\"fnLayerMenuOver(this)\" onmouseout=\"fnLayerMenuOut(this)\" onclick=\"fnGoLayerMenu('Capsule1')\" style=\"cursor:hand\">“Ù¿÷…Á«¯</td>");
document.write("							</tr>");
document.write("						</table>");					
document.write("						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" ID=\"Table6\">");
document.write("							<tr>");
document.write("							<td background=\"/images/MusicCapsule/mymusic/mymusic_dotline2.gif\"><img src=\"/images/MusicCapsule/mymusic/mymusic_dotline2.gif\" width=\"12\" height=\"5\"></td>");
document.write("							</tr>");
document.write("						</table>");
document.write("						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\" ID=\"Table7\">");
document.write("							<tr>");
document.write("							<td valign=\"bottom\" onmouseover=\"fnLayerMenuOver(this)\" onmouseout=\"fnLayerMenuOut(this)\" onclick=\"fnGoLayerMenu('Note1')\" style=\"cursor:hand\">∑¢ÀÕ÷ΩÃı</td>");
document.write("							</tr>");
document.write("						</table>");
document.write("						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" ID=\"Table4\">");
document.write("							<tr>");
document.write("							<td background=\"/images/MusicCapsule/mymusic/mymusic_dotline2.gif\"><img src=\"/images/MusicCapsule/mymusic/mymusic_dotline2.gif\" width=\"12\" height=\"5\"></td>");
document.write("							</tr>");
document.write("						</table>");
document.write("						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"1\" ID=\"Table3\">");
document.write("							<tr>");
document.write("							<td valign=\"bottom\" onmouseover=\"fnLayerMenuOver(this)\" onmouseout=\"fnLayerMenuOut(this)\" onclick=\"fnGoLayerMenu('Friend1')\" style=\"cursor:hand\">∫√”——˚«Î</td>");
document.write("							</tr>");
document.write("						</table>");	
document.write("					</table>");
document.write("				</td>");
document.write("				</tr>");
document.write("			</table>");
document.write("	</div>");