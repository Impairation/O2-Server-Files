<%
	'''*****************************************
	'''* 파일명 : dbConnString.asp  
	'''* 작성자 : 서태호 
	'''* 수정날짜 : 2004-07-14
	'''* 내 용 : DB 연결스트링 생성
	'''*****************************************
	
	''' DataBase 연결을 OLEDB 를 이용한 연결문자열을 만들어서 연결합니다 *	
	''' global.asa 한 파일에서 관리하도록 아래처럼 Application 변수에서 연결 문자열을 가져옵니다.
	
	'''= 웹 디비(O2Jam) - 게시판등 일반
	Dim ConnOLEDB_Web
	ConnOLEDB_Web = Application("Connection_ConnectionString")
	
	'''= 웹 디비(O2LOGON) - 회원정보등
	Dim ConnOLEDB_WebMember
	ConnOLEDB_WebMember = Application("m_Connection_ConnectionString")
	
	'''= 게임 디비
	Dim ConnOLEDB_Game
	ConnOLEDB_Game = Application("c_Connection_ConnectionString")
%>