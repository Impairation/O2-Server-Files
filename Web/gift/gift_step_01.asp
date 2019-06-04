<%
	Dim chkNick, chkIDNick, strReferer, strIDNick
	
	gameid 			= Request.QueryString("gameid")
	memberNick		= Request.QueryString("memberNick")
	
	chkNick			= Trim(Request.QueryString ("chkNick"))
	chkIDNick		= Trim(Request.QueryString ("chkIDNick"))
	
	'= 酒捞叼 八祸牢瘤 葱匙烙 八祸牢瘤 沥焊啊 绝栏搁 酒捞叼 八祸栏肺 汲沥钦聪促.
	If Len(chkIDNick) <= 0 Then
		chkIDNick = "id"
	End If
	
%>
<html>
<head>	
	<meta http-equiv=Cache-Control content=No-Cache>
	<meta http-equiv=Pragma content=No-Cache>
<title>::急拱窍扁::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language = "javascript">
<!-- 
	
	
function sendForm(){

	objInput = frmJoin.chkIDNick ;
	
	if(objInput[0].checked)
	{
		strCheck = "帐号";
	}
	else
	{
		strCheck = "昵称";
	}

	//葱匙烙
	objInput = frmJoin.memberNick;
	if (fnTrim(objInput.value) == "")
	{
		alert("请先进行用户" + strCheck+"的验证" );
		objInput.value = "";
		objInput.focus();
		
		return false;
	}

	else if(CheckSingleQuotationMark(objInput) == false)	
	{
		alert("不能输入引号标记.");
		objInput.value = "";
		objInput.focus();
		
		return false;
	}
	
	// 酒捞叼 葱匙烙 八祸 咯何
	objInput = frmJoin.chkNick;
	if(objInput.value != "y")
	{
		alert("" + strCheck + "请检查");	
		
		return false;	
	}

	//皋葛
	objInput = frmJoin.memo;
	if (fnTrim(objInput.value) == "")
	{
		alert ("键入留言!");
		objInput.value = "";
		objInput.focus();
		
		return false;	
		
	}

	var jinyu = new Array(582);
	jinyu[0] = "游戏管理员";
	jinyu[1] = "游戏管理者";
	jinyu[2] = "客服";
	jinyu[3] = "客服人员";
	jinyu[4] = "游戏指导员";
	jinyu[5] = "官方工作员";
	jinyu[6] = "官方管理者";
	jinyu[7] = "新手指导员";
	jinyu[8] = "新手辅导员";
	jinyu[9] = "游戏向导";
	jinyu[10] = "游戏监督员";
	jinyu[11] = "游戏送奖员";
	jinyu[12] = "久游网";
	jinyu[13] = "久游";
	jinyu[14] = "9you";
	jinyu[15] = "润星";
	jinyu[16] = "O2jam";
	jinyu[17] = "劲乐团";
	jinyu[18] = "sex";
	jinyu[19] = "shit";
	jinyu[20] = "fuck";
	jinyu[21] = "admin";
	jinyu[22] = "bitch";
	jinyu[23] = "gamemaster";
	jinyu[24] = "ｓｅｘ";
	jinyu[25] = "ｓｈｉｔ";
	jinyu[26] = "ｆｕｃｋ";
	jinyu[27] = "ｂｉｔｃｈ";
	jinyu[28] = "ａｄｍｉｎ";
	jinyu[29] = "ｍａｓｔｅｒ";
	jinyu[30] = "ｇａｍｅｍａｓｔｅｒ";
	jinyu[31] = "ＧＡＭＥＭＡＳＴＥＲ";
	jinyu[32] = "gm";
	jinyu[33] = "Ｇｍ";
	jinyu[34] = "　";
	jinyu[35] = "　";
	jinyu[36] = "";
	jinyu[37] = "";
	jinyu[38] = "";
	jinyu[39] = "";
	jinyu[40] = "";
	jinyu[41] = "";
	jinyu[42] = "";
	jinyu[43] = "";
	jinyu[44] = "";
	jinyu[45] = "";
	jinyu[46] = "";
	jinyu[47] = "";
	jinyu[48] = "";
	jinyu[49] = "";
	jinyu[50] = "";
	jinyu[51] = "";
	jinyu[52] = "";
	jinyu[53] = "";
	jinyu[54] = "";
	jinyu[55] = "";
	jinyu[56] = "";
	jinyu[57] = "";
	jinyu[58] = "";
	jinyu[59] = "";
	jinyu[60] = "";
	jinyu[61] = "";
	jinyu[62] = "";
	jinyu[63] = "";
	jinyu[64] = "";
	jinyu[65] = "";
	jinyu[66] = "";
	jinyu[67] = "";
	jinyu[68] = "";
	jinyu[69] = "";
	jinyu[70] = "";
	jinyu[71] = "";
	jinyu[72] = "";
	jinyu[73] = "";
	jinyu[74] = "";
	jinyu[75] = "";
	jinyu[76] = "";
	jinyu[77] = "";
	jinyu[78] = "";
	jinyu[79] = "";
	jinyu[80] = "";
	jinyu[81] = "";
	jinyu[82] = "";
	jinyu[83] = "";
	jinyu[84] = "";
	jinyu[85] = "";
	jinyu[86] = "";
	jinyu[87] = "";
	jinyu[88] = "";
	jinyu[89] = "";
	jinyu[90] = "";
	jinyu[91] = "";
	jinyu[92] = "";
	jinyu[93] = "";
	jinyu[94] = "";
	jinyu[95] = "";
	jinyu[96] = "";
	jinyu[97] = "";
	jinyu[98] = "";
	jinyu[99] = "";
	jinyu[100] = "";
	jinyu[101] = "";
	jinyu[102] = "";
	jinyu[103] = "";
	jinyu[104] = "";
	jinyu[105] = "";
	jinyu[106] = "";
	jinyu[107] = "━";
	jinyu[108] = "│";
	jinyu[109] = "┃";
	jinyu[110] = "┄";
	jinyu[111] = "┅";
	jinyu[112] = "┆";
	jinyu[113] = "┇";
	jinyu[114] = "┈";
	jinyu[115] = "┉";
	jinyu[116] = "┊";
	jinyu[117] = "┋";
	jinyu[118] = "┌";
	jinyu[119] = "┍";
	jinyu[120] = "┎";
	jinyu[121] = "┏";
	jinyu[122] = "┐";
	jinyu[123] = "┑";
	jinyu[124] = "┒";
	jinyu[125] = "┓";
	jinyu[126] = "└";
	jinyu[127] = "┕";
	jinyu[128] = "┖";
	jinyu[129] = "┗";
	jinyu[130] = "┘";
	jinyu[131] = "┙";
	jinyu[132] = "┚";
	jinyu[133] = "┛";
	jinyu[134] = "├";
	jinyu[135] = "┝";
	jinyu[136] = "┞";
	jinyu[137] = "┟";
	jinyu[138] = "┠";
	jinyu[139] = "┡";
	jinyu[140] = "┢";
	jinyu[141] = "┣";
	jinyu[142] = "┤";
	jinyu[143] = "┥";
	jinyu[144] = "┦";
	jinyu[145] = "┧";
	jinyu[146] = "┨";
	jinyu[147] = "┩";
	jinyu[148] = "┪";
	jinyu[149] = "┫";
	jinyu[150] = "┬";
	jinyu[151] = "┭";
	jinyu[152] = "┮";
	jinyu[153] = "┯";
	jinyu[154] = "┰";
	jinyu[155] = "┱";
	jinyu[156] = "┲";
	jinyu[157] = "┳";
	jinyu[158] = "┴";
	jinyu[159] = "┵";
	jinyu[160] = "┶";
	jinyu[161] = "┷";
	jinyu[162] = "┸";
	jinyu[163] = "┹";
	jinyu[164] = "┺";
	jinyu[165] = "┻";
	jinyu[166] = "┼";
	jinyu[167] = "┽";
	jinyu[168] = "┾";
	jinyu[169] = "┿";
	jinyu[170] = "╀";
	jinyu[171] = "╁";
	jinyu[172] = "╂";
	jinyu[173] = "╃";
	jinyu[174] = "╄";
	jinyu[175] = "╅";
	jinyu[176] = "╆";
	jinyu[177] = "╇";
	jinyu[178] = "╈";
	jinyu[179] = "╉";
	jinyu[180] = "╊";
	jinyu[181] = "╋";
	jinyu[182] = "";
	jinyu[183] = "";
	jinyu[184] = "";
	jinyu[185] = "";
	jinyu[186] = "";
	jinyu[187] = "";
	jinyu[188] = "";
	jinyu[189] = "";
	jinyu[190] = "";
	jinyu[191] = "";
	jinyu[192] = "";
	jinyu[193] = "";
	jinyu[194] = "";
	jinyu[195] = "";
	jinyu[196] = "";
	jinyu[197] = " ";
	jinyu[198] = "六四";
	jinyu[199] = "法轮";
	jinyu[200] = "法*轮";
	jinyu[201] = "法**轮";
	jinyu[202] = "法$轮";
	jinyu[203] = "法$$轮";
	jinyu[204] = "法^轮";
	jinyu[205] = "法^^轮";
	jinyu[206] = "法@轮";
	jinyu[207] = "法@@轮";
	jinyu[208] = "法~轮";
	jinyu[209] = "法~~轮";
	jinyu[210] = "法輪";
	jinyu[211] = "李洪";
	jinyu[212] = "轮功";
	jinyu[213] = "輪功";
	jinyu[214] = "共产党";
	jinyu[215] = "共產黨";
	jinyu[216] = "国民党";
	jinyu[217] = "國民黨";
	jinyu[218] = "台独";
	jinyu[219] = "臺獨";
	jinyu[220] = "民國";
	jinyu[221] = "民国";
	jinyu[222] = "中華民國";
	jinyu[223] = "中华民国";
	jinyu[224] = "毛泽东";
	jinyu[225] = "毛澤東";
	jinyu[226] = "邓小平";
	jinyu[227] = "鄧小平";
	jinyu[228] = "江泽民";
	jinyu[229] = "江澤民";
	jinyu[230] = "胡锦涛";
	jinyu[231] = "吴官正";
	jinyu[232] = "黄菊";
	jinyu[233] = "吴仪";
	jinyu[234] = "罗干";
	jinyu[235] = "温家宝";
	jinyu[236] = "邹家华";
	jinyu[237] = "吴邦国";
	jinyu[238] = "李岚清";
	jinyu[239] = "真善忍";
	jinyu[240] = "法轮功";
	jinyu[241] = "李洪志";
	jinyu[242] = "周恩来";
	jinyu[243] = "马克思";
	jinyu[244] = "恩格斯";
	jinyu[245] = "列宁";
	jinyu[246] = "赵紫阳";
	jinyu[247] = "胡耀邦";
	jinyu[248] = "刘少奇";
	jinyu[249] = "贾庆林";
	jinyu[250] = "曾庆红";
	jinyu[251] = "李长春";
	jinyu[252] = "王乐泉";
	jinyu[253] = "王兆国";
	jinyu[254] = "回良玉";
	jinyu[255] = "刘淇";
	jinyu[256] = "刘云山";
	jinyu[257] = "张立昌";
	jinyu[258] = "张德江";
	jinyu[259] = "陈良宇";
	jinyu[260] = "周永康";
	jinyu[261] = "俞正声";
	jinyu[262] = "贺国强";
	jinyu[263] = "郭伯雄";
	jinyu[264] = "曹刚川";
	jinyu[265] = "曾培炎";
	jinyu[266] = "李鹏";
	jinyu[267] = "朱镕基";
	jinyu[268] = "李瑞环";
	jinyu[269] = "尉健行";
	jinyu[270] = "萨达姆";
	jinyu[271] = "拉登";
	jinyu[272] = "法轮大法";
	jinyu[273] = "台湾独立";
	jinyu[274] = "恐怖主义";
	jinyu[275] = "明慧网";
	jinyu[276] = "西藏分裂";
	jinyu[277] = "台湾总统";
	jinyu[278] = "新疆独立";
	jinyu[279] = "保卫台湾";
	jinyu[280] = "台湾国";
	jinyu[281] = "陈水扁";
	jinyu[282] = "吕秀莲";
	jinyu[283] = "陈总统";
	jinyu[284] = "没有人权";
	jinyu[285] = "政府无能";
	jinyu[286] = "皇军";
	jinyu[287] = "造反";
	jinyu[288] = "民运";
	jinyu[289] = "打倒";
	jinyu[290] = "推翻";
	jinyu[291] = "政变";
	jinyu[292] = "压迫";
	jinyu[293] = "色情";
	jinyu[294] = "情色";
	jinyu[295] = "嫖娼";
	jinyu[296] = "卖淫";
	jinyu[297] = "淫秽";
	jinyu[298] = "爆炸";
	jinyu[299] = "集会";
	jinyu[300] = "游行";
	jinyu[301] = "示威";
	jinyu[302] = "自焚";
	jinyu[303] = "垮台";
	jinyu[304] = "倒台";
	jinyu[305] = "分裂";
	jinyu[306] = "镇压";
	jinyu[307] = "迫害";
	jinyu[308] = "独立";
	jinyu[309] = "东突";
	jinyu[310] = "压制";
	jinyu[311] = "总书记";
	jinyu[312] = "李登辉";
	jinyu[313] = "两国论";
	jinyu[314] = "一边一国";
	jinyu[315] = "陆肆";
	jinyu[316] = "国家主席";
	jinyu[317] = "总理";
	jinyu[318] = "政治局";
	jinyu[319] = "常委";
	jinyu[320] = "共党";
	jinyu[321] = "中共";
	jinyu[322] = "共军";
	jinyu[323] = "纳粹";
	jinyu[324] = "日本帝国";
	jinyu[325] = "大东亚";
	jinyu[326] = "共荣圈";
	jinyu[327] = "赤匪";
	jinyu[328] = "共匪";
	jinyu[329] = "16大";
	jinyu[330] = "十六大";
	jinyu[331] = "天安门";
	jinyu[332] = "中南海";
	jinyu[333] = "领导";
	jinyu[334] = "独裁";
	jinyu[335] = "统治";
	jinyu[336] = "万岁";
	jinyu[337] = "私服";
	jinyu[338] = "私*服";
	jinyu[339] = "私**服";
	jinyu[340] = "Bastard";
	jinyu[341] = "bitch";
	jinyu[342] = "cao";
	jinyu[343] = "falundafa";
	jinyu[344] = "fuck you";
	jinyu[345] = "fuck";
	jinyu[346] = "J8";
	jinyu[347] = "nnd=";
	jinyu[348] = "snk.ni8.net";
	jinyu[349] = "TMD";
	jinyu[350] = "YOUXIKA";
	jinyu[351] = "爱滋";
	jinyu[352] = "扒光";
	jinyu[353] = "白痴";
	jinyu[354] = "白癡";
	jinyu[355] = "白烂";
	jinyu[356] = "包皮";
	jinyu[357] = "笨蛋";
	jinyu[358] = "屄";
	jinyu[359] = "逼";
	jinyu[360] = "逼样";
	jinyu[361] = "婊子";
	jinyu[362] = "婊子养的";
	jinyu[363] = "操";
	jinyu[364] = "操78";
	jinyu[365] = "操逼";
	jinyu[366] = "操机掰";
	jinyu[367] = "操妳";
	jinyu[368] = "操妳妈";
	jinyu[369] = "操妳娘";
	jinyu[370] = "操妳全家";
	jinyu[371] = "操妳祖宗";
	jinyu[372] = "操你";
	jinyu[373] = "操你老妈";
	jinyu[374] = "操你老母";
	jinyu[375] = "操你妈";
	jinyu[376] = "操你奶奶";
	jinyu[377] = "操你娘";
	jinyu[378] = "操你全家";
	jinyu[379] = "操你祖宗";
	jinyu[380] = "懆您妈";
	jinyu[381] = "懆您娘";
	jinyu[382] = "肏";
	jinyu[383] = "插你";
	jinyu[384] = "插死你";
	jinyu[385] = "吃屎";
	jinyu[386] = "吹箫";
	jinyu[387] = "打炮";
	jinyu[388] = "荡妇";
	jinyu[389] = "屌";
	jinyu[390] = "爹娘";
	jinyu[391] = "放荡";
	jinyu[392] = "肥西";
	jinyu[393] = "干x娘";
	jinyu[394] = "干机掰";
	jinyu[395] = "干妳老母";
	jinyu[396] = "干妳妈";
	jinyu[397] = "干妳马";
	jinyu[398] = "干妳娘";
	jinyu[399] = "干你";
	jinyu[400] = "干你老母";
	jinyu[401] = "干你良";
	jinyu[402] = "干你妈";
	jinyu[403] = "干你娘";
	jinyu[404] = "干您娘";
	jinyu[405] = "干七八";
	jinyu[406] = "干死CS";
	jinyu[407] = "干死GM";
	jinyu[408] = "干死客服";
	jinyu[409] = "干死你";
	jinyu[410] = "幹";
	jinyu[411] = "赣您娘";
	jinyu[412] = "灨你娘";
	jinyu[413] = "狗狼养的";
	jinyu[414] = "狗娘养的";
	jinyu[415] = "狗屁";
	jinyu[416] = "狗日";
	jinyu[417] = "狗日的";
	jinyu[418] = "龟儿子";
	jinyu[419] = "龟头";
	jinyu[420] = "鬼公";
	jinyu[421] = "花柳";
	jinyu[422] = "机八";
	jinyu[423] = "机巴";
	jinyu[424] = "机机歪歪";
	jinyu[425] = "鸡8";
	jinyu[426] = "鸡八";
	jinyu[427] = "鸡巴";
	jinyu[428] = "鸡叭";
	jinyu[429] = "鸡吧";
	jinyu[430] = "鸡芭";
	jinyu[431] = "鸡鸡";
	jinyu[432] = "鸡奸";
	jinyu[433] = "雞巴";
	jinyu[434] = "几八";
	jinyu[435] = "几巴";
	jinyu[436] = "几叭";
	jinyu[437] = "几芭";
	jinyu[438] = "妓";
	jinyu[439] = "妓女";
	jinyu[440] = "妓院";
	jinyu[441] = "奸";
	jinyu[442] = "奸你";
	jinyu[443] = "姦";
	jinyu[444] = "贱B";
	jinyu[445] = "贱货";
	jinyu[446] = "贱人";
	jinyu[447] = "賤";
	jinyu[448] = "交配";
	jinyu[449] = "姣西";
	jinyu[450] = "叫床";
	jinyu[451] = "她妈的";
	jinyu[452] = "她马的";
	jinyu[453] = "她奶奶的";
	jinyu[454] = "军妓";
	jinyu[455] = "靠";
	jinyu[456] = "靠爸";
	jinyu[457] = "靠北";
	jinyu[458] = "靠背";
	jinyu[459] = "靠母";
	jinyu[460] = "靠腰";
	jinyu[461] = "口肯";
	jinyu[462] = "懒8";
	jinyu[463] = "懒八";
	jinyu[464] = "懒叫";
	jinyu[465] = "懒教";
	jinyu[466] = "烂逼";
	jinyu[467] = "烂货";
	jinyu[468] = "爛";
	jinyu[469] = "浪叫";
	jinyu[470] = "老二";
	jinyu[471] = "老母";
	jinyu[472] = "老味";
	jinyu[473] = "轮奸";
	jinyu[474] = "妈B";
	jinyu[475] = "妈逼";
	jinyu[476] = "妈比";
	jinyu[477] = "妈的";
	jinyu[478] = "妈的B";
	jinyu[479] = "妈个B";
	jinyu[480] = "妈妈的";
	jinyu[481] = "媽";
	jinyu[482] = "卖B";
	jinyu[483] = "卖比";
	jinyu[484] = "卖淫";
	jinyu[485] = "明慧";
	jinyu[486] = "奶子";
	jinyu[487] = "妳她妈的";
	jinyu[488] = "妳老母的";
	jinyu[489] = "妳妈的";
	jinyu[490] = "妳马的";
	jinyu[491] = "妳娘的";
	jinyu[492] = "你她马的";
	jinyu[493] = "你妈";
	jinyu[494] = "你妈的";
	jinyu[495] = "你马的";
	jinyu[496] = "你娘";
	jinyu[497] = "你娘卡好";
	jinyu[498] = "你娘咧";
	jinyu[499] = "你全家";
	jinyu[500] = "你是鸡";
	jinyu[501] = "你是鸭";
	jinyu[502] = "你他马的";
	jinyu[503] = "你它妈的";
	jinyu[504] = "你它马的";
	jinyu[505] = "屁股";
	jinyu[506] = "屁眼";
	jinyu[507] = "嫖客";
	jinyu[508] = "姘头";
	jinyu[509] = "仆";
	jinyu[510] = "仆街";
	jinyu[511] = "强奸";
	jinyu[512] = "强奸你";
	jinyu[513] = "日你";
	jinyu[514] = "日你妈";
	jinyu[515] = "日他娘";
	jinyu[516] = "乳房";
	jinyu[517] = "乳头";
	jinyu[518] = "撒尿";
	jinyu[519] = "塞你爸";
	jinyu[520] = "塞你公";
	jinyu[521] = "塞你老母";
	jinyu[522] = "塞你老师";
	jinyu[523] = "塞你母";
	jinyu[524] = "塞你娘";
	jinyu[525] = "赛妳阿母";
	jinyu[526] = "赛你老母";
	jinyu[527] = "三级片";
	jinyu[528] = "骚";
	jinyu[529] = "骚逼";
	jinyu[530] = "骚货";
	jinyu[531] = "傻B";
	jinyu[532] = "傻逼";
	jinyu[533] = "傻比";
	jinyu[534] = "射精";
	jinyu[535] = "射你";
	jinyu[536] = "驶你爸";
	jinyu[537] = "驶你公";
	jinyu[538] = "驶你老母";
	jinyu[539] = "驶你老师";
	jinyu[540] = "驶你母";
	jinyu[541] = "驶你娘";
	jinyu[542] = "他妈";
	jinyu[543] = "他妈ㄉ王八蛋";
	jinyu[544] = "他妈的";
	jinyu[545] = "他马的";
	jinyu[546] = "他奶奶";
	jinyu[547] = "他奶奶的";
	jinyu[548] = "他奶娘的";
	jinyu[549] = "他娘";
	jinyu[550] = "外挂";
	jinyu[551] = "外阴";
	jinyu[552] = "王八蛋";
	jinyu[553] = "我操";
	jinyu[554] = "我奸";
	jinyu[555] = "我靠";
	jinyu[556] = "我日";
	jinyu[557] = "下贱";
	jinyu[558] = "下三烂";
	jinyu[559] = "性";
	jinyu[560] = "性爱";
	jinyu[561] = "性交";
	jinyu[562] = "性无能";
	jinyu[563] = "阳具";
	jinyu[564] = "阳萎";
	jinyu[565] = "野鸡";
	jinyu[566] = "阴部";
	jinyu[567] = "阴唇";
	jinyu[568] = "阴道";
	jinyu[569] = "阴茎";
	jinyu[570] = "阴毛";
	jinyu[571] = "淫";
	jinyu[572] = "淫荡";
	jinyu[573] = "淫妇";
	jinyu[574] = "淫秽";
	jinyu[575] = "淫水";
	jinyu[576] = "淫西";
	jinyu[577] = "月经";
	jinyu[578] = "杂种";
	jinyu[579] = "招妓";
	jinyu[580] = "祖宗";
	jinyu[581] = "做爱";


	var i = 0;
	var b = 0;
	var form_value = objInput.value;
	while (i<jinyu.length){
		if(form_value.indexOf(jinyu[i])!=-1){
			//b=1;
			//break;
			alert("你的留言中有禁止使用的语言:\'"+ jinyu[i] +"\'，请修改！");
			return false;
		}
	i=i+1;
	}
	//if (b==1){
	//	alert("你的留言中有禁止使用的语言，请修改！");
	//	return false;
	//}else{
	//	//alert("ok");
	//}





	//document.frmJoin.submit();
}

function checkNick(gameid)
{
	objInput = frmJoin.chkIDNick ;
	
	if(objInput[0].checked)
	{
		strCheck = "帐号";
	}
	else
	{
		strCheck = "昵称";
	}
	
	//葱匙烙
	objInput = frmJoin.memberNick;
	if (fnTrim(objInput.value) == "")
	{
		alert("先键入发送者  " + strCheck + "");
		objInput.value = "";
		objInput.focus();
		
		return;
	}

	else if(CheckSingleQuotationMark(objInput) == false)	
	{
		alert("不能输入引号标记.");
		objInput.value = "";
		objInput.focus();
		
		return;
	}
	
	
	if(frmJoin.chkIDNick[0].checked)
	{
		strCheck = "id";
	}
	else
	{
		strCheck = "nick";
	}
	
	document.location.href = "memberNick_Chk.asp?memberNick=" + objInput.value + "&gameid=" + gameid + "&chkIDNick=" + strCheck;
} 

function checkChange()
{
	frmJoin.chkNick.value = "n";
}

function changeIDNick(chk)
{
	if(chk == "nick")
	{
		document.images["st_payment_word"].src = "/images/payment/payment_word02.gif";
		document.images["btn_payment_check"].src = "/images/payment/payment_check_nick_off.gif";
	}
	else
	{
		document.images["st_payment_word"].src = "/images/payment/payment_word05.gif";
		document.images["btn_payment_check"].src = "/images/payment/payment_check_id_off.gif";
	}
	
	frmJoin.chkNick.value = "n";
}

function fnRollOver(chk)
{
	if(frmJoin.chkIDNick[0].checked)
	{
		document.images["btn_payment_check"].src = "/images/payment/payment_check_id_" + chk + ".gif";
	}
	else
	{
		document.images["btn_payment_check"].src = "/images/payment/payment_check_nick_" + chk + ".gif";
	}
}

/****************************************************/

// 累篮 蝶咳钎啊 乐绰瘤 眉农窍绰 窃荐 
reSingleQMark = new RegExp("'", "g");
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

// 巩磊 菊第 傍归 肋扼郴绰 窃荐
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
//-->
</script>
<style type="text/css">
<!--
body{
scrollbar-face-color: #C0DCF6; scrollbar-shadow-color: #5DA5E8; 
scrollbar-highlight-color: #ffffff; scrollbar-3dlight-color:#C0DCF6; 
scrollbar-darkshadow-color:#1D76C9; scrollbar-track-color: #4FA5EB; 
scrollbar-arrow-color:#114677;} 
--> 
</style>
<link href="payment.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#67BAF0" topmargin="0" leftmargin="0" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<table width="710" border="0" cellspacing="0" cellpadding="0"><form name = "frmJoin" method = "post" action = "gift_step_02.asp" onsubmit="return sendForm()">
  <tr> 
    <td width="20">&nbsp;</td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td> <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="40" valign="top"><img src="/images/payment/payment_title_gift01.gif" hspace="3" vspace="3"> 
                </td>
              </tr>
              <tr> 
                <td height="100%" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                    <tr> 
                      <td background="/images/payment/payment_bg01.gif"><img src="/images/main/blank.gif" width="1" height="2"></td>
                    </tr>
                    <tr> 
                      <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="6">
                    <tr> 
                      <td class="txtDarkblue"> * 请检查获赠者的帐号(昵称), 
                        <br> 正确的输入留言和赠品并按"发送"键
                       </td>
                    </tr>
                  </table>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="9" height="9"><img src="/images/payment/payment_table02_tl.gif" width="9" height="9"></td>
                      <td background="/images/payment/payment_table02_t.gif"><img src="/images/payment/payment_table02_t.gif" width="1" height="9"></td>
                      <td width="9" height="9"><img src="/images/payment/payment_table02_tr.gif" width="9" height="9"></td>
                    </tr>
                    <tr> 
                      <td background="/images/payment/payment_table02_l.gif"><img src="/images/payment/payment_table02_l.gif" width="9" height="1"></td>
                      <td align="center" bgcolor="#3476D0"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="right"><table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tr> 
                                  <td>
									<img src="/images/payment/<%If chkIDNick = "nick" Then%>payment_word02<%Else%>payment_word05<%End If%>.gif" name="st_payment_word" width="126" height="15">									
									</td>
                                </tr>
                              </table>
                              <table width="95%" border="0" cellspacing="0" cellpadding="3">
                                <tr> 
								<input type="hidden" name="gameid" value="<%=gameid%>"> 
								<input type="hidden" name="chkNick" value="<%=chkNick%>"> 
									<td class="txtYellowB">
										<input type="radio" name="chkIDNick" value="id"<%If chkIDNick = "id" Then%>checked<%End If%> onClick="changeIDNick('id')">帐号
										<input type="radio" name="chkIDNick" value="nick" <%If chkIDNick = "nick" Then%>checked<%End If%> onClick="changeIDNick('nick')">昵称
									</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="txtYellowB">			
										<input type="text" name="memberNick" value="<%=memberNick%>" size="23" class="input02" onChange="checkChange()">
									</td>
                                  <td  width="67%" class="txtYellowB"><img src="/images/payment/payment_check_<%=chkIDNick%>_off.gif" name="btn_payment_check" border="0" onclick="checkNick('<%=gameid%>')" style="cursor:hand" onMouseOver="fnRollOver('on')" onMouseOut="fnRollOver('off')"></td>
                                </tr>
                              </table>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                                </tr>
                                <tr> 
                                  <td background="/images/payment/payment_bg04.gif"><img src="/images/main/blank.gif" width="1" height="2"></td>
                                </tr>
                                <tr> 
                                  <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                                </tr>
                              </table>
                       <% If chkNick = "y" Then %>
                              <table width="100%" border="0" cellspacing="0" cellpadding="5">
                                <tr> 
                                  <td><img src="/images/payment/payment_word03.gif" width="87" height="15"></td>
                                </tr>
                              </table>
                              <table width="95%" border="0" cellspacing="0" cellpadding="3">
                                <tr> 
                                  <td height="80" valign="top"><input type="text" name="memo" maxlength="20" size="40" class="input02"></td>
                                </tr>
                              </table> 
                       <% Else %>
							  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="95"><span style="margin-left:25px;color:#FFFFFF;font-weight:bolder;font-size:9pt">必须检查帐号之后才能发送赠品.</td>
                                </tr>
                               </table>
                       <% End If %>
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                                </tr>
                                <tr> 
                                  <td background="/images/payment/payment_bg04.gif"><img src="/images/main/blank.gif" width="1" height="2"></td>
                                </tr>
                                <tr> 
                                  <td height="5"><img src="/images/main/blank.gif" width="1" height="1"></td>
                                </tr>
                              </table>
                              <table border="0" cellspacing="0" cellpadding="5">
                                <tr> 
                                  <td align="right" class="txtDarkblue" onfocus='this.blur()'><input type="image"  src="/images/payment/payment_but_send_off.gif" width="108" height="35" border="0" onMouseOver="this.src='/images/payment/payment_but_send_on.gif'" onMouseOut="this.src='/images/payment/payment_but_send_off.gif'"></td>
                                  <td width="120">&nbsp;</td>
                                </tr>
                              </table>
                              <br>
                            </td>
                            <td width="160" align="right" valign="bottom"><img src="/images/payment/payment_img01.gif" width="142" height="178"></td>
                          </tr>
                        </table></td>
                      <td background="/images/payment/payment_table02_r.gif"><img src="/images/payment/payment_table02_r.gif" width="9" height="1"></td>
                    </tr>
                    <tr> 
                      <td width="9" height="9"><img src="/images/payment/payment_table02_bl.gif" width="9" height="9"></td>
                      <td background="/images/payment/payment_table02_b.gif"><img src="/images/payment/payment_table02_b.gif" width="1" height="9"></td>
                      <td width="9" height="9"><img src="/images/payment/payment_table02_br.gif" width="9" height="9"></td>
                    </tr>
                  </table></td>

              </tr>
            </table>
          </td>
        </tr>
      </table>
      <td width="10">&nbsp;</td>
  </tr></form>
</table>
</body>
</html>
