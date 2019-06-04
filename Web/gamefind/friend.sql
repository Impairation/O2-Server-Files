CREATE TABLE [dbo].[T_o2jam_friend] (
	[USER_INDEX_ID] [int] NOT NULL ,
	[FRIEND_INDEX_ID] [int] NOT NULL 
) ON [PRIMARY]
GO

 CREATE  INDEX [IX_T_o2jam_friend_user_index_id] ON [dbo].[T_o2jam_friend]([USER_INDEX_ID]) ON [PRIMARY]
GO

 CREATE  UNIQUE  INDEX [PK_T_o2jam_friend] ON [dbo].[T_o2jam_friend]([USER_INDEX_ID], [FRIEND_INDEX_ID]) ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




/*=========================== P_o2jam_friend_delete ====================================*/
/*
	에러 번호 : 0 (이상 없음)
		 -1(등록되지 않은 아이디)
		 -2(등록되지 않은 친구 아이디)
*/
/*=========================== P_o2jam_friend_insert ====================================*/
CREATE PROCEDURE [dbo].[P_o2jam_friend_delete]
@UserID varchar(20)				--자신의 아이디
,@FriendID varchar(20)				--친구의 아이디
AS
	DECLARE 	@ErrNo		int		--에러 번호

	DECLARE 	@UserIndexID	int		--자신의 인덱스를 저장하는 변수
	DECLARE	@FriendIndexID	int		--친구의 인덱스를 저장하는 변수

	
	SELECT @Errno 		= 0			--에러 번호를 '0'으로 초기화


	SELECT @UserIndexID   = user_index_id FROM T_o2jam_charinfo WHERE user_id = @UserID
	--자신의 userindexid를 변수에 저장

	SELECT @FriendIndexID = user_index_id FROM T_o2jam_charinfo WHERE user_id = @FriendID 
	--친구의 userindexid를 변수에 저장	

	IF (@UserIndexID IS NULL)	--등록되지 않은 유저의 경우
	BEGIN
		SELECT @Errno = -1	
	END
	ELSE IF (@FriendIndexID IS NULL)--친구의 아이디가 존재하지 않을 경우
	BEGIN
		SELECT @Errno = -2
	END
	ELSE
	BEGIN
		DELETE T_o2jam_friend WHERE User_Index_ID = @UserIndexID AND Friend_Index_ID = @FriendIndexID
	END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/*=========================== P_o2jam_friend_insert ====================================*/
/*
	에러 번호 : 0 (이상 없음)
		 -1(등록되지 않은 아이디)
		 -2(등록되지 않은 친구 아이디)
		 -3(이미 중복된 친구가 있음)
		 -4(친구의 수가 한정된 수를 초과함)
*/
/*=========================== P_o2jam_friend_insert ====================================*/

CREATE PROCEDURE [dbo].[P_o2jam_friend_insert]
@UserID varchar(20)				--자신의 아이디
,@FriendID varchar(20)				--친구의 아이디
AS
	DECLARE 	@ErrNo		int		--에러 번호

	DECLARE 	@UserIndexID	int		--자신의 인덱스를 저장하는 변수
	DECLARE	@FriendIndexID	int		--친구의 인덱스를 저장하는 변수

	DECLARE	@FriendCount	int		--친구의 수

	
	SELECT @Errno 		= 0			--에러 번호를 '0'으로 초기화
	SELECT @FriendCount 	= 10			--친구의 수를 10 명으로 한정, 변경 가능

	SELECT @UserIndexID   = user_index_id FROM T_o2jam_charinfo WHERE user_id = @UserID
	--자신의 userindexid를 변수에 저장

	SELECT @FriendIndexID = user_index_id FROM T_o2jam_charinfo WHERE user_id = @FriendID 
	--친구의 userindexid를 변수에 저장	

	IF (@UserIndexID IS NULL)	--등록되지 않은 유저의 경우
	BEGIN
		SELECT @Errno = -1	
	END
	ELSE IF (@FriendIndexID IS NULL)--친구의 아이디가 존재하지 않을 경우
	BEGIN
		SELECT @Errno = -2
	END
	ELSE IF ((SELECT User_Index_ID FROM T_o2jam_friend WHERE User_Index_id = @UserIndexID AND Friend_Index_ID = @FriendIndexID) != NULL)
	BEGIN
		SELECT @Errno = -3	-- 이미 중복된 친구가 있을 경우
	END
	ELSE IF ((SELECT COUNT(User_Index_ID) FROM T_o2jam_friend WHERE User_Index_ID = @UserIndexID) > @FriendCount)
	BEGIN
		SELECT @Errno = -4	-- 친구의 수가 한정된 수를 초과한 경우
	END
	ELSE
	BEGIN	-- 일반적인 경우 친구를 추가함
		INSERT INTO T_o2jam_friend VALUES (@UserIndexID,@FriendIndexID)
	END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS OFF 
GO

/*=========================== P_o2jam_friend_select ====================================*/
CREATE PROCEDURE [dbo].[P_o2jam_friend_select]
@UserID varchar(20)				--자신의 아이디
AS
	DECLARE	@Errno		int		--에러 번호

	DECLARE 	@UserIndexID	int		--자신의 인덱스를 저장하는 변수


	SELECT @Errno 		= 0			--에러 번호를 '0'으로 초기화


	SELECT @UserIndexID   = user_index_id FROM T_o2jam_charinfo WHERE user_id = @UserID
	--자신의 userindexid를 변수에 저장


	IF (@UserIndexID IS NULL)	--등록되지 않은 유저의 경우
	BEGIN
		SELECT @Errno = -1
		SELECT @Errno,@Errno
	END
	ELSE
	BEGIN
		SELECT 	O.User_ID
				,CASE 		L.User_ID
					WHEN	NULL	THEN	-1			--로그인 하지 않았을 경우 - 1을 리턴 하며
					ELSE 0						--로그인 한 경우 0을 리턴한다.
				END AS TF
		FROM T_o2jam_login L 
			RIGHT OUTER JOIN 
			(SELECT C.User_ID FROM T_o2jam_charinfo C,T_o2jam_friend F  WHERE C.User_Index_ID = F.Friend_Index_ID AND F.User_Index_ID = @UserIndexID) O 
		ON L.User_ID = O.User_ID
	END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

