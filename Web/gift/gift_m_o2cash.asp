<%
	strSQL = "P_o2jam_buy_gift_item_n_Music_cash " & int(FromWhoIndexID) & ", " & int(Gem) & ", " & int(intMoney) & ", " & int(O2Cash) & ", " & int(MusicCash) & ", " & int(ItemCash)
	
	Conn1.Execute(strSQL)
%>