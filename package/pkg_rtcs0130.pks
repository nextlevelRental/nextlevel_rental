CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0130 AS
-- Package header

	/*****************************************************************************
	-- 카카오만족도조사 리스트
	*****************************************************************************/
	PROCEDURE p_sRtcs0130 (
		Ref_Cursor       IN OUT SYS_REFCURSOR,
		v_Ord_No         IN RTCS0130.ORD_NO%TYPE,				 /*계약번호*/
		v_Subt_Day_F	 IN RTCS0130.SUBT_DAY%TYPE,				 /*제출일 F*/
		v_Subt_Day_T	 IN RTCS0130.SUBT_DAY%TYPE,				 /*제출일T*/
		v_Agency_Cd		 IN RTCS0130.AGENCY_CD%TYPE,			 /*대리점코드*/
		v_Dp_Yn			 IN RTCS0130.DP_YN%TYPE			  		 /*전시여부*/
	);
   
	/*****************************************************************************
	-- 카카오만족도조사 업데이트
	*****************************************************************************/
	PROCEDURE p_IUDRtcs0130 (
		v_Comm_Dvsn      IN CHAR,                         		 /*처리구분(I,U,D)*/
		v_Stfy_Srvy_Seq  IN RTCS0130.STFY_SRVY_SEQ%TYPE,         /*만족도조사순번*/
		--v_Stfy_Opinon	 IN RTCS0130.STFY_OPINON%TYPE,		 	 /*만족도의견*/
		v_Dp_Yn			 IN RTCS0130.DP_YN%TYPE,				 /*전시여부*/
		v_Success_Code   OUT NUMBER,
		v_Return_Message OUT VARCHAR2,
		v_ErrorText      OUT VARCHAR2
	);

	/*****************************************************************************
	-- 대리점별 만족도 조회
	*****************************************************************************/
	PROCEDURE p_sRtcs0130AgencyList (
		Ref_Cursor       	IN OUT SYS_REFCURSOR,
		v_Subt_Day_F	 	IN RTCS0130.SUBT_DAY%TYPE,			/*제출일F*/
		v_Subt_Day_T	 	IN RTCS0130.SUBT_DAY%TYPE,			/*제출일T*/
		v_Rental_Group	 	IN VARCHAR2,				 		/*렌탈지사*/
		v_Rental_Office	 	IN VARCHAR2,				 		/*렌탈지점*/
		v_Agency_Cd		 	IN RTCS0130.AGENCY_CD%TYPE,			/*대리점코드*/
		v_Rental_Yn	 		IN VARCHAR2,				 		/*렌탈가능 여부*/
		v_Op_Yn	 			IN VARCHAR2,				 		/*온라인장착 가능 여부*/
		v_Prem_Prpl_Yn	 	IN VARCHAR2,				 		/*프리미엄 퍼플점 여부*/
		v_Prpl_Yn	 		IN VARCHAR2				 			/*퍼플점 여부*/
	);

END Pkg_Rtcs0130;