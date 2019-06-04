<%
	'''*****************************************
	'''* 파일명 : dbConn.asp  
	'''* 작성자 : 서태호 
	'''* 수정날짜 : 2002-07-16
	'''* 내 용 : DB 연결스트링과 Connection 객체 생성
	'''*****************************************
	
	''' DataBase 연결을 OLEDB 를 이용한 연결문자열을 만들어서 연결합니다 *	
	''' global.asa 한 파일에서 관리하도록 아래처럼 Application 변수에서 연결 문자열을 가져옵니다.
	
	Dim objConn
		
	Set objConn = Server.CreateObject("ADODB.Connection")
	objConn.Open Application("Connection_ConnectionString")
	
	''' 회원정보 테이블 MemberInfo 는 게임 DB 서버에 통합되어 있으므로.. 새로운 연결 객체를 생성해야 합니다.		
	''' global.asa 한 파일에서 관리하도록 아래처럼 Application 변수에서 연결 문자열을 가져옵니다.

	Dim objConnMember
		
	Set objConnMember = Server.CreateObject("ADODB.Connection")
	objConnMember.Open Application("m_Connection_ConnectionString")
	
%>