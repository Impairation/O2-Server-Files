<%
	'''*****************************************
	'''* ���ϸ� : dbConn.asp  
	'''* �ۼ��� : ����ȣ 
	'''* ������¥ : 2002-07-16
	'''* �� �� : DB ���ὺƮ���� Connection ��ü ����
	'''*****************************************
	
	''' DataBase ������ OLEDB �� �̿��� ���Ṯ�ڿ��� ���� �����մϴ� *	
	''' global.asa �� ���Ͽ��� �����ϵ��� �Ʒ�ó�� Application �������� ���� ���ڿ��� �����ɴϴ�.
	
	Dim objConn
		
	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Open Application("Connection_ConnectionString")
	
	''' ȸ������ ���̺� MemberInfo �� ���� DB ������ ���յǾ� �����Ƿ�.. ���ο� ���� ��ü�� �����ؾ� �մϴ�.		
	''' global.asa �� ���Ͽ��� �����ϵ��� �Ʒ�ó�� Application �������� ���� ���ڿ��� �����ɴϴ�.

	Dim objConnMember
		
	Set objConnMember = Server.CreateObject("ADODB.Connection")
	objConnMember.Open Application("m_Connection_ConnectionString")
	
%>