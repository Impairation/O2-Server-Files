<%
	'''*****************************************
	'''* ���ϸ� : dbConnString.asp  
	'''* �ۼ��� : ����ȣ 
	'''* ������¥ : 2004-07-14
	'''* �� �� : DB ���ὺƮ�� ����
	'''*****************************************
	
	''' DataBase ������ OLEDB �� �̿��� ���Ṯ�ڿ��� ���� �����մϴ� *	
	''' global.asa �� ���Ͽ��� �����ϵ��� �Ʒ�ó�� Application �������� ���� ���ڿ��� �����ɴϴ�.
	
	'''= �� ���(O2Jam) - �Խ��ǵ� �Ϲ�
	Dim ConnOLEDB_Web
	ConnOLEDB_Web = Application("Connection_ConnectionString")
	
	'''= �� ���(O2LOGON) - ȸ��������
	Dim ConnOLEDB_WebMember
	ConnOLEDB_WebMember = Application("m_Connection_ConnectionString")
	
	'''= ���� ���
	Dim ConnOLEDB_Game
	ConnOLEDB_Game = Application("c_Connection_ConnectionString")
%>