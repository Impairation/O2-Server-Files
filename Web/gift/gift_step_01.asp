<%
	Dim chkNick, chkIDNick, strReferer, strIDNick
	
	gameid 			= Request.QueryString("gameid")
	memberNick		= Request.QueryString("memberNick")
	
	chkNick			= Trim(Request.QueryString ("chkNick"))
	chkIDNick		= Trim(Request.QueryString ("chkIDNick"))
	
	'= ���̵� �˻����� �г��� �˻����� ������ ������ ���̵� �˻����� �����մϴ�.
	If Len(chkIDNick) <= 0 Then
		chkIDNick = "id"
	End If
	
%>
<html>
<head>	
	<meta http-equiv=Cache-Control content=No-Cache>
	<meta http-equiv=Pragma content=No-Cache>
<title>::�����ϱ�::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language = "javascript">
<!-- 
	
	
function sendForm(){

	objInput = frmJoin.chkIDNick ;
	
	if(objInput[0].checked)
	{
		strCheck = "�ʺ�";
	}
	else
	{
		strCheck = "�ǳ�";
	}

	//�г���
	objInput = frmJoin.memberNick;
	if (fnTrim(objInput.value) == "")
	{
		alert("���Ƚ����û�" + strCheck+"����֤" );
		objInput.value = "";
		objInput.focus();
		
		return false;
	}

	else if(CheckSingleQuotationMark(objInput) == false)	
	{
		alert("�����������ű��.");
		objInput.value = "";
		objInput.focus();
		
		return false;
	}
	
	// ���̵� �г��� �˻� ����
	objInput = frmJoin.chkNick;
	if(objInput.value != "y")
	{
		alert("" + strCheck + "����");	
		
		return false;	
	}

	//�޸�
	objInput = frmJoin.memo;
	if (fnTrim(objInput.value) == "")
	{
		alert ("��������!");
		objInput.value = "";
		objInput.focus();
		
		return false;	
		
	}

	var jinyu = new Array(582);
	jinyu[0] = "��Ϸ����Ա";
	jinyu[1] = "��Ϸ������";
	jinyu[2] = "�ͷ�";
	jinyu[3] = "�ͷ���Ա";
	jinyu[4] = "��Ϸָ��Ա";
	jinyu[5] = "�ٷ�����Ա";
	jinyu[6] = "�ٷ�������";
	jinyu[7] = "����ָ��Ա";
	jinyu[8] = "���ָ���Ա";
	jinyu[9] = "��Ϸ��";
	jinyu[10] = "��Ϸ�ලԱ";
	jinyu[11] = "��Ϸ�ͽ�Ա";
	jinyu[12] = "������";
	jinyu[13] = "����";
	jinyu[14] = "9you";
	jinyu[15] = "����";
	jinyu[16] = "O2jam";
	jinyu[17] = "������";
	jinyu[18] = "sex";
	jinyu[19] = "shit";
	jinyu[20] = "fuck";
	jinyu[21] = "admin";
	jinyu[22] = "bitch";
	jinyu[23] = "gamemaster";
	jinyu[24] = "����";
	jinyu[25] = "�����";
	jinyu[26] = "������";
	jinyu[27] = "�������";
	jinyu[28] = "������";
	jinyu[29] = "��������";
	jinyu[30] = "������������";
	jinyu[31] = "�ǣ��ͣţͣ��ӣԣţ�";
	jinyu[32] = "gm";
	jinyu[33] = "�ǣ�";
	jinyu[34] = "��";
	jinyu[35] = "��";
	jinyu[36] = "��";
	jinyu[37] = "��";
	jinyu[38] = "��";
	jinyu[39] = "��";
	jinyu[40] = "��";
	jinyu[41] = "��";
	jinyu[42] = "��";
	jinyu[43] = "��";
	jinyu[44] = "��";
	jinyu[45] = "��";
	jinyu[46] = "��";
	jinyu[47] = "��";
	jinyu[48] = "��";
	jinyu[49] = "��";
	jinyu[50] = "��";
	jinyu[51] = "��";
	jinyu[52] = "��";
	jinyu[53] = "��";
	jinyu[54] = "��";
	jinyu[55] = "��";
	jinyu[56] = "��";
	jinyu[57] = "��";
	jinyu[58] = "��";
	jinyu[59] = "��";
	jinyu[60] = "��";
	jinyu[61] = "��";
	jinyu[62] = "��";
	jinyu[63] = "��";
	jinyu[64] = "��";
	jinyu[65] = "��";
	jinyu[66] = "��";
	jinyu[67] = "��";
	jinyu[68] = "��";
	jinyu[69] = "��";
	jinyu[70] = "��";
	jinyu[71] = "��";
	jinyu[72] = "��";
	jinyu[73] = "��";
	jinyu[74] = "��";
	jinyu[75] = "��";
	jinyu[76] = "��";
	jinyu[77] = "��";
	jinyu[78] = "��";
	jinyu[79] = "��";
	jinyu[80] = "��";
	jinyu[81] = "��";
	jinyu[82] = "��";
	jinyu[83] = "��";
	jinyu[84] = "��";
	jinyu[85] = "��";
	jinyu[86] = "��";
	jinyu[87] = "��";
	jinyu[88] = "��";
	jinyu[89] = "��";
	jinyu[90] = "��";
	jinyu[91] = "��";
	jinyu[92] = "��";
	jinyu[93] = "��";
	jinyu[94] = "��";
	jinyu[95] = "��";
	jinyu[96] = "��";
	jinyu[97] = "��";
	jinyu[98] = "��";
	jinyu[99] = "��";
	jinyu[100] = "��";
	jinyu[101] = "��";
	jinyu[102] = "��";
	jinyu[103] = "��";
	jinyu[104] = "��";
	jinyu[105] = "��";
	jinyu[106] = "��";
	jinyu[107] = "��";
	jinyu[108] = "��";
	jinyu[109] = "��";
	jinyu[110] = "��";
	jinyu[111] = "��";
	jinyu[112] = "��";
	jinyu[113] = "��";
	jinyu[114] = "��";
	jinyu[115] = "��";
	jinyu[116] = "��";
	jinyu[117] = "��";
	jinyu[118] = "��";
	jinyu[119] = "��";
	jinyu[120] = "��";
	jinyu[121] = "��";
	jinyu[122] = "��";
	jinyu[123] = "��";
	jinyu[124] = "��";
	jinyu[125] = "��";
	jinyu[126] = "��";
	jinyu[127] = "��";
	jinyu[128] = "��";
	jinyu[129] = "��";
	jinyu[130] = "��";
	jinyu[131] = "��";
	jinyu[132] = "��";
	jinyu[133] = "��";
	jinyu[134] = "��";
	jinyu[135] = "��";
	jinyu[136] = "��";
	jinyu[137] = "��";
	jinyu[138] = "��";
	jinyu[139] = "��";
	jinyu[140] = "��";
	jinyu[141] = "��";
	jinyu[142] = "��";
	jinyu[143] = "��";
	jinyu[144] = "��";
	jinyu[145] = "��";
	jinyu[146] = "��";
	jinyu[147] = "��";
	jinyu[148] = "��";
	jinyu[149] = "��";
	jinyu[150] = "��";
	jinyu[151] = "��";
	jinyu[152] = "��";
	jinyu[153] = "��";
	jinyu[154] = "��";
	jinyu[155] = "��";
	jinyu[156] = "��";
	jinyu[157] = "��";
	jinyu[158] = "��";
	jinyu[159] = "��";
	jinyu[160] = "��";
	jinyu[161] = "��";
	jinyu[162] = "��";
	jinyu[163] = "��";
	jinyu[164] = "��";
	jinyu[165] = "��";
	jinyu[166] = "��";
	jinyu[167] = "��";
	jinyu[168] = "��";
	jinyu[169] = "��";
	jinyu[170] = "��";
	jinyu[171] = "��";
	jinyu[172] = "��";
	jinyu[173] = "��";
	jinyu[174] = "��";
	jinyu[175] = "��";
	jinyu[176] = "��";
	jinyu[177] = "��";
	jinyu[178] = "��";
	jinyu[179] = "��";
	jinyu[180] = "��";
	jinyu[181] = "��";
	jinyu[182] = "��";
	jinyu[183] = "��";
	jinyu[184] = "��";
	jinyu[185] = "��";
	jinyu[186] = "��";
	jinyu[187] = "��";
	jinyu[188] = "��";
	jinyu[189] = "��";
	jinyu[190] = "��";
	jinyu[191] = "��";
	jinyu[192] = "��";
	jinyu[193] = "��";
	jinyu[194] = "��";
	jinyu[195] = "��";
	jinyu[196] = "��";
	jinyu[197] = " ";
	jinyu[198] = "����";
	jinyu[199] = "����";
	jinyu[200] = "��*��";
	jinyu[201] = "��**��";
	jinyu[202] = "��$��";
	jinyu[203] = "��$$��";
	jinyu[204] = "��^��";
	jinyu[205] = "��^^��";
	jinyu[206] = "��@��";
	jinyu[207] = "��@@��";
	jinyu[208] = "��~��";
	jinyu[209] = "��~~��";
	jinyu[210] = "��݆";
	jinyu[211] = "���";
	jinyu[212] = "�ֹ�";
	jinyu[213] = "݆��";
	jinyu[214] = "������";
	jinyu[215] = "���a�h";
	jinyu[216] = "����";
	jinyu[217] = "�����h";
	jinyu[218] = "̨��";
	jinyu[219] = "�_��";
	jinyu[220] = "���";
	jinyu[221] = "���";
	jinyu[222] = "���A���";
	jinyu[223] = "�л����";
	jinyu[224] = "ë��";
	jinyu[225] = "ë�ɖ|";
	jinyu[226] = "��Сƽ";
	jinyu[227] = "��Сƽ";
	jinyu[228] = "������";
	jinyu[229] = "������";
	jinyu[230] = "������";
	jinyu[231] = "�����";
	jinyu[232] = "�ƾ�";
	jinyu[233] = "����";
	jinyu[234] = "�޸�";
	jinyu[235] = "�¼ұ�";
	jinyu[236] = "�޼һ�";
	jinyu[237] = "����";
	jinyu[238] = "�����";
	jinyu[239] = "������";
	jinyu[240] = "���ֹ�";
	jinyu[241] = "���־";
	jinyu[242] = "�ܶ���";
	jinyu[243] = "���˼";
	jinyu[244] = "����˹";
	jinyu[245] = "����";
	jinyu[246] = "������";
	jinyu[247] = "��ҫ��";
	jinyu[248] = "������";
	jinyu[249] = "������";
	jinyu[250] = "�����";
	jinyu[251] = "���";
	jinyu[252] = "����Ȫ";
	jinyu[253] = "���׹�";
	jinyu[254] = "������";
	jinyu[255] = "���";
	jinyu[256] = "����ɽ";
	jinyu[257] = "������";
	jinyu[258] = "�ŵ½�";
	jinyu[259] = "������";
	jinyu[260] = "������";
	jinyu[261] = "������";
	jinyu[262] = "�ع�ǿ";
	jinyu[263] = "������";
	jinyu[264] = "�ܸմ�";
	jinyu[265] = "������";
	jinyu[266] = "����";
	jinyu[267] = "���F��";
	jinyu[268] = "����";
	jinyu[269] = "ξ����";
	jinyu[270] = "����ķ";
	jinyu[271] = "����";
	jinyu[272] = "���ִ�";
	jinyu[273] = "̨�����";
	jinyu[274] = "�ֲ�����";
	jinyu[275] = "������";
	jinyu[276] = "���ط���";
	jinyu[277] = "̨����ͳ";
	jinyu[278] = "�½�����";
	jinyu[279] = "����̨��";
	jinyu[280] = "̨���";
	jinyu[281] = "��ˮ��";
	jinyu[282] = "������";
	jinyu[283] = "����ͳ";
	jinyu[284] = "û����Ȩ";
	jinyu[285] = "��������";
	jinyu[286] = "�ʾ�";
	jinyu[287] = "�췴";
	jinyu[288] = "����";
	jinyu[289] = "��";
	jinyu[290] = "�Ʒ�";
	jinyu[291] = "����";
	jinyu[292] = "ѹ��";
	jinyu[293] = "ɫ��";
	jinyu[294] = "��ɫ";
	jinyu[295] = "���";
	jinyu[296] = "����";
	jinyu[297] = "����";
	jinyu[298] = "��ը";
	jinyu[299] = "����";
	jinyu[300] = "����";
	jinyu[301] = "ʾ��";
	jinyu[302] = "�Է�";
	jinyu[303] = "��̨";
	jinyu[304] = "��̨";
	jinyu[305] = "����";
	jinyu[306] = "��ѹ";
	jinyu[307] = "�Ⱥ�";
	jinyu[308] = "����";
	jinyu[309] = "��ͻ";
	jinyu[310] = "ѹ��";
	jinyu[311] = "�����";
	jinyu[312] = "��ǻ�";
	jinyu[313] = "������";
	jinyu[314] = "һ��һ��";
	jinyu[315] = "½��";
	jinyu[316] = "������ϯ";
	jinyu[317] = "����";
	jinyu[318] = "���ξ�";
	jinyu[319] = "��ί";
	jinyu[320] = "����";
	jinyu[321] = "�й�";
	jinyu[322] = "����";
	jinyu[323] = "�ɴ�";
	jinyu[324] = "�ձ��۹�";
	jinyu[325] = "����";
	jinyu[326] = "����Ȧ";
	jinyu[327] = "���";
	jinyu[328] = "����";
	jinyu[329] = "16��";
	jinyu[330] = "ʮ����";
	jinyu[331] = "�찲��";
	jinyu[332] = "���Ϻ�";
	jinyu[333] = "�쵼";
	jinyu[334] = "����";
	jinyu[335] = "ͳ��";
	jinyu[336] = "����";
	jinyu[337] = "˽��";
	jinyu[338] = "˽*��";
	jinyu[339] = "˽**��";
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
	jinyu[351] = "����";
	jinyu[352] = "�ǹ�";
	jinyu[353] = "�׳�";
	jinyu[354] = "�װV";
	jinyu[355] = "����";
	jinyu[356] = "��Ƥ";
	jinyu[357] = "����";
	jinyu[358] = "��";
	jinyu[359] = "��";
	jinyu[360] = "����";
	jinyu[361] = "���";
	jinyu[362] = "�������";
	jinyu[363] = "��";
	jinyu[364] = "��78";
	jinyu[365] = "�ٱ�";
	jinyu[366] = "�ٻ���";
	jinyu[367] = "�ي�";
	jinyu[368] = "�ي���";
	jinyu[369] = "�ي���";
	jinyu[370] = "�ي�ȫ��";
	jinyu[371] = "�ي�����";
	jinyu[372] = "����";
	jinyu[373] = "��������";
	jinyu[374] = "������ĸ";
	jinyu[375] = "������";
	jinyu[376] = "��������";
	jinyu[377] = "������";
	jinyu[378] = "����ȫ��";
	jinyu[379] = "��������";
	jinyu[380] = "������";
	jinyu[381] = "������";
	jinyu[382] = "�H";
	jinyu[383] = "����";
	jinyu[384] = "������";
	jinyu[385] = "��ʺ";
	jinyu[386] = "����";
	jinyu[387] = "����";
	jinyu[388] = "����";
	jinyu[389] = "��";
	jinyu[390] = "����";
	jinyu[391] = "�ŵ�";
	jinyu[392] = "����";
	jinyu[393] = "��x��";
	jinyu[394] = "�ɻ���";
	jinyu[395] = "�Ɋ���ĸ";
	jinyu[396] = "�Ɋ���";
	jinyu[397] = "�Ɋ���";
	jinyu[398] = "�Ɋ���";
	jinyu[399] = "����";
	jinyu[400] = "������ĸ";
	jinyu[401] = "������";
	jinyu[402] = "������";
	jinyu[403] = "������";
	jinyu[404] = "������";
	jinyu[405] = "���߰�";
	jinyu[406] = "����CS";
	jinyu[407] = "����GM";
	jinyu[408] = "�����ͷ�";
	jinyu[409] = "������";
	jinyu[410] = "��";
	jinyu[411] = "������";
	jinyu[412] = "������";
	jinyu[413] = "��������";
	jinyu[414] = "��������";
	jinyu[415] = "��ƨ";
	jinyu[416] = "����";
	jinyu[417] = "���յ�";
	jinyu[418] = "�����";
	jinyu[419] = "��ͷ";
	jinyu[420] = "��";
	jinyu[421] = "����";
	jinyu[422] = "����";
	jinyu[423] = "����";
	jinyu[424] = "��������";
	jinyu[425] = "��8";
	jinyu[426] = "����";
	jinyu[427] = "����";
	jinyu[428] = "����";
	jinyu[429] = "����";
	jinyu[430] = "����";
	jinyu[431] = "����";
	jinyu[432] = "����";
	jinyu[433] = "�u��";
	jinyu[434] = "����";
	jinyu[435] = "����";
	jinyu[436] = "����";
	jinyu[437] = "����";
	jinyu[438] = "��";
	jinyu[439] = "��Ů";
	jinyu[440] = "��Ժ";
	jinyu[441] = "��";
	jinyu[442] = "����";
	jinyu[443] = "��";
	jinyu[444] = "��B";
	jinyu[445] = "����";
	jinyu[446] = "����";
	jinyu[447] = "�v";
	jinyu[448] = "����";
	jinyu[449] = "���";
	jinyu[450] = "�д�";
	jinyu[451] = "�����";
	jinyu[452] = "�����";
	jinyu[453] = "�����̵�";
	jinyu[454] = "����";
	jinyu[455] = "��";
	jinyu[456] = "����";
	jinyu[457] = "����";
	jinyu[458] = "����";
	jinyu[459] = "��ĸ";
	jinyu[460] = "����";
	jinyu[461] = "�ڿ�";
	jinyu[462] = "��8";
	jinyu[463] = "����";
	jinyu[464] = "����";
	jinyu[465] = "����";
	jinyu[466] = "�ñ�";
	jinyu[467] = "�û�";
	jinyu[468] = "��";
	jinyu[469] = "�˽�";
	jinyu[470] = "�϶�";
	jinyu[471] = "��ĸ";
	jinyu[472] = "��ζ";
	jinyu[473] = "�ּ�";
	jinyu[474] = "��B";
	jinyu[475] = "���";
	jinyu[476] = "���";
	jinyu[477] = "���";
	jinyu[478] = "���B";
	jinyu[479] = "���B";
	jinyu[480] = "�����";
	jinyu[481] = "��";
	jinyu[482] = "��B";
	jinyu[483] = "����";
	jinyu[484] = "����";
	jinyu[485] = "����";
	jinyu[486] = "����";
	jinyu[487] = "�������";
	jinyu[488] = "����ĸ��";
	jinyu[489] = "�����";
	jinyu[490] = "�����";
	jinyu[491] = "�����";
	jinyu[492] = "�������";
	jinyu[493] = "����";
	jinyu[494] = "�����";
	jinyu[495] = "�����";
	jinyu[496] = "����";
	jinyu[497] = "���￨��";
	jinyu[498] = "������";
	jinyu[499] = "��ȫ��";
	jinyu[500] = "���Ǽ�";
	jinyu[501] = "����Ѽ";
	jinyu[502] = "�������";
	jinyu[503] = "�������";
	jinyu[504] = "�������";
	jinyu[505] = "ƨ��";
	jinyu[506] = "ƨ��";
	jinyu[507] = "�ο�";
	jinyu[508] = "�ͷ";
	jinyu[509] = "��";
	jinyu[510] = "�ͽ�";
	jinyu[511] = "ǿ��";
	jinyu[512] = "ǿ����";
	jinyu[513] = "����";
	jinyu[514] = "������";
	jinyu[515] = "������";
	jinyu[516] = "�鷿";
	jinyu[517] = "��ͷ";
	jinyu[518] = "����";
	jinyu[519] = "�����";
	jinyu[520] = "���㹫";
	jinyu[521] = "������ĸ";
	jinyu[522] = "������ʦ";
	jinyu[523] = "����ĸ";
	jinyu[524] = "������";
	jinyu[525] = "������ĸ";
	jinyu[526] = "������ĸ";
	jinyu[527] = "����Ƭ";
	jinyu[528] = "ɧ";
	jinyu[529] = "ɧ��";
	jinyu[530] = "ɧ��";
	jinyu[531] = "ɵB";
	jinyu[532] = "ɵ��";
	jinyu[533] = "ɵ��";
	jinyu[534] = "�侫";
	jinyu[535] = "����";
	jinyu[536] = "ʻ���";
	jinyu[537] = "ʻ�㹫";
	jinyu[538] = "ʻ����ĸ";
	jinyu[539] = "ʻ����ʦ";
	jinyu[540] = "ʻ��ĸ";
	jinyu[541] = "ʻ����";
	jinyu[542] = "����";
	jinyu[543] = "��������˵�";
	jinyu[544] = "�����";
	jinyu[545] = "�����";
	jinyu[546] = "������";
	jinyu[547] = "�����̵�";
	jinyu[548] = "�������";
	jinyu[549] = "����";
	jinyu[550] = "���";
	jinyu[551] = "����";
	jinyu[552] = "���˵�";
	jinyu[553] = "�Ҳ�";
	jinyu[554] = "�Ҽ�";
	jinyu[555] = "�ҿ�";
	jinyu[556] = "����";
	jinyu[557] = "�¼�";
	jinyu[558] = "������";
	jinyu[559] = "��";
	jinyu[560] = "�԰�";
	jinyu[561] = "�Խ�";
	jinyu[562] = "������";
	jinyu[563] = "����";
	jinyu[564] = "��ή";
	jinyu[565] = "Ұ��";
	jinyu[566] = "����";
	jinyu[567] = "����";
	jinyu[568] = "����";
	jinyu[569] = "����";
	jinyu[570] = "��ë";
	jinyu[571] = "��";
	jinyu[572] = "����";
	jinyu[573] = "����";
	jinyu[574] = "����";
	jinyu[575] = "��ˮ";
	jinyu[576] = "����";
	jinyu[577] = "�¾�";
	jinyu[578] = "����";
	jinyu[579] = "�м�";
	jinyu[580] = "����";
	jinyu[581] = "����";


	var i = 0;
	var b = 0;
	var form_value = objInput.value;
	while (i<jinyu.length){
		if(form_value.indexOf(jinyu[i])!=-1){
			//b=1;
			//break;
			alert("����������н�ֹʹ�õ�����:\'"+ jinyu[i] +"\'�����޸ģ�");
			return false;
		}
	i=i+1;
	}
	//if (b==1){
	//	alert("����������н�ֹʹ�õ����ԣ����޸ģ�");
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
		strCheck = "�ʺ�";
	}
	else
	{
		strCheck = "�ǳ�";
	}
	
	//�г���
	objInput = frmJoin.memberNick;
	if (fnTrim(objInput.value) == "")
	{
		alert("�ȼ��뷢����  " + strCheck + "");
		objInput.value = "";
		objInput.focus();
		
		return;
	}

	else if(CheckSingleQuotationMark(objInput) == false)	
	{
		alert("�����������ű��.");
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

// ���� ����ǥ�� �ִ��� üũ�ϴ� �Լ� 
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
                      <td class="txtDarkblue"> * ��������ߵ��ʺ�(�ǳ�), 
                        <br> ��ȷ���������Ժ���Ʒ����"����"��
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
										<input type="radio" name="chkIDNick" value="id"<%If chkIDNick = "id" Then%>checked<%End If%> onClick="changeIDNick('id')">�ʺ�
										<input type="radio" name="chkIDNick" value="nick" <%If chkIDNick = "nick" Then%>checked<%End If%> onClick="changeIDNick('nick')">�ǳ�
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
                                  <td height="95"><span style="margin-left:25px;color:#FFFFFF;font-weight:bolder;font-size:9pt">�������ʺ�֮����ܷ�����Ʒ.</td>
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
