CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0130 AS
-- Package body

   	/*****************************************************************************
	-- 카카오만족도조사 리스트
	REVISIONS
	Ver        Date        Author           Description
	---------  ----------  ---------------  -------------------------------------
	1.0        2024-12-26  백인천           	Created. [20241226_01]                             
	*****************************************************************************/
	PROCEDURE p_sRtcs0130 (
		Ref_Cursor       IN OUT SYS_REFCURSOR,
		v_Ord_No         IN RTCS0130.ORD_NO%TYPE,         /*계약번호*/
		v_Subt_Day_F	 IN RTCS0130.SUBT_DAY%TYPE,		  /*제출일F*/
		v_Subt_Day_T	 IN RTCS0130.SUBT_DAY%TYPE,		  /*제출일T*/
		v_Agency_Cd		 IN RTCS0130.AGENCY_CD%TYPE,	  /*대리점코드*/
		v_Dp_Yn			 IN RTCS0130.DP_YN%TYPE			  /*전시여부*/
	) IS
	
	BEGIN
	
		OPEN Ref_Cursor FOR
		SELECT A.*
		FROM (
		    	SELECT A.*,
				       B.USER_ID,
				       B.RENTAL_GROUP,
				       B.RENTAL_OFFICE,
				       Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM,		/*렌탈지사           */
				       Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM		/*렌탈지점           */
		    	FROM (
				      	SELECT	  STFY_SRVY_SEQ
								, SUBT_DAY
								, ORD_NO
								, AGENCY_CD
								, RCVR_CUST_NO
								, RCVR_NM
								, RCVR_MOB_NO
								, RCVR_BIRTH_DAY
								, SRVY_STS_CD
								, RQST_DAY
								, READ_DAY
								, PI_AG_YN
								, TOT_EVAL_POINT
								, STFY_POINT_CD1
								, STFY_POINT_CD2
								, STFY_POINT_CD3
								, STFY_OPINON
								, DP_YN
								, DP_PR_NO
								, MAT_CD
								, RCVR_SEQ
								, REG_ID
								, REG_DT
								, CHG_ID
								, CHG_DT
								, Pkg_Rtsd0007.f_sRtsd0007AgencyNm(AGENCY_CD) AS AGENCY_NM	/*대리점명*/
						FROM    RTCS0130
						WHERE   1 = 1
						AND     ORD_NO = DECODE(TRIM(v_Ord_No), NULL, ORD_NO, v_Ord_No)
						AND     (v_Subt_Day_F IS NULL OR TO_CHAR(SUBT_DAY,'YYYYMMDD') BETWEEN v_Subt_Day_F AND v_Subt_Day_T)
						AND     AGENCY_CD = DECODE(TRIM(v_Agency_Cd), NULL, AGENCY_CD, v_Agency_Cd)
						AND     DP_YN = DECODE(TRIM(v_Dp_Yn), NULL, DP_YN, v_Dp_Yn)
       			) A
		        LEFT OUTER JOIN (
					SELECT  ORD_AGENT USER_ID,
							RENTAL_GROUP,
							RENTAL_OFFICE
					FROM 	RTSD0113
					UNION
					SELECT	AGENCY_CD USER_ID,
							RENTAL_GROUP,
							RENTAL_OFFICE
					FROM	RTSD0007
					UNION
					SELECT	CARMASTER_NU USER_ID,
							RENTAL_GROUP,
							RENTAL_OFFICE
					FROM	RTCS0002
				) B
        		ON A.AGENCY_CD = B.USER_ID
		) A
		ORDER BY A.SUBT_DAY DESC;
		
	END p_sRtcs0130;


   	/*****************************************************************************
	-- 카카오만족도조사 수정
	REVISIONS
	Ver        Date        Author           Description
	---------  ----------  ---------------  -------------------------------------
	1.0        2024-12-26  백인천           	Created. [20241226_01]                             
	*****************************************************************************/
	PROCEDURE p_IUDRtcs0130 (
	    v_Comm_Dvsn      IN CHAR,                         		 /*처리구분(I,U,D)*/
		v_Stfy_Srvy_Seq  IN RTCS0130.STFY_SRVY_SEQ%TYPE,         /*만족도조사순번*/
		--v_Stfy_Opinon	 IN RTCS0130.STFY_OPINON%TYPE,		 	 /*만족도의견*/
		v_Dp_Yn			 IN RTCS0130.DP_YN%TYPE,				 /*전시여부*/
		v_Success_Code   OUT NUMBER,
		v_Return_Message OUT VARCHAR2,
		v_ErrorText      OUT VARCHAR2
	) IS
	
    e_Error         EXCEPTION;
	
	BEGIN
	
		UPDATE	RTCS0130
		--SET		STFY_OPINON = v_Stfy_Opinon
		SET		STFY_OPINON = STFY_OPINON
				, DP_YN 	= v_Dp_Yn
		WHERE	STFY_SRVY_SEQ = v_Stfy_Srvy_Seq;
		
	v_Success_code := 0;
	v_Return_Message := '정상적으로 처리되었습니다';
	v_ErrorText := '';

    EXCEPTION
	  WHEN e_Error THEN
		ROLLBACK;
		v_Success_code := -1;
		v_Return_Message := v_Return_Message;
		v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

	WHEN OTHERS THEN
		ROLLBACK;
		v_Success_code := -1;
		v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
		v_ErrorText := SUBSTR(SQLERRM, 1, 200);	
	
	END p_IUDRtcs0130;


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
	) IS
	
	BEGIN
	
		OPEN Ref_Cursor FOR
		SELECT 
			*
		FROM (
			SELECT 
				A.*
				, B.USER_ID
				, B.RENTAL_GROUP
				, B.RENTAL_OFFICE
				, Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM	/*렌탈지사*/
				, Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM	/*렌탈지점*/
				, C.TOT_CNT
				, C.TOT_EVAL_POINT
				, C.STFY_POINT_CD1_1
				, C.STFY_POINT_CD1_2
				, C.STFY_POINT_CD1_3
				, C.STFY_POINT_CD1_4
				, C.STFY_POINT_CD1_5
				, C.STFY_POINT_CD1
				, C.STFY_POINT_CD2_1
				, C.STFY_POINT_CD2_2
				, C.STFY_POINT_CD2_3
				, C.STFY_POINT_CD2_4
				, C.STFY_POINT_CD2_5
				, C.STFY_POINT_CD2
				, C.STFY_POINT_CD3_1
				, C.STFY_POINT_CD3_2
				, C.STFY_POINT_CD3_3
				, C.STFY_POINT_CD3_4
				, C.STFY_POINT_CD3_5
				, C.STFY_POINT_CD3
			FROM (
				SELECT
					A.AGENCY_CD		/*대리점코드*/
					, A.AGENCY_NM	/*대리점명*/
					, A.RENTAL_YN	/*렌탈가능 여부*/
					, NVL(A.OP_YN, 'N') AS OP_YN	/*온라인장착 여부*/
					, A.PREM_PRPL_YN	/*프리미엄 퍼플점 여부*/
					, A.PRPL_YN			/*퍼플점 여부*/
					, NVL(A.CH_YN,'N') AS CH_YN	/*추천 장착점 여부*/
				FROM RTSD0007 A
				WHERE 1=1
					AND (v_Agency_Cd IS NULL OR A.AGENCY_CD = v_Agency_Cd)
		    		AND A.RENTAL_YN = DECODE(v_Rental_Yn, NULL, A.RENTAL_YN, v_Rental_Yn)
		    		AND NVL(A.OP_YN, 'N') = DECODE(v_Op_Yn, NULL, NVL(A.OP_YN, 'N'), v_Op_Yn)
		    		AND A.PREM_PRPL_YN = DECODE(v_Prem_Prpl_Yn, NULL, A.PREM_PRPL_YN, v_Prem_Prpl_Yn)
		    		AND A.PRPL_YN = DECODE(v_Prpl_Yn, NULL, A.PRPL_YN, v_Prpl_Yn)
			) A
			LEFT OUTER JOIN (
				SELECT ORD_AGENT USER_ID,
					RENTAL_GROUP,
					RENTAL_OFFICE
				FROM RTSD0113
				UNION
				SELECT AGENCY_CD USER_ID,
					RENTAL_GROUP,
					RENTAL_OFFICE
				FROM RTSD0007
				UNION
				SELECT CARMASTER_NU USER_ID,
					RENTAL_GROUP,
					RENTAL_OFFICE
				FROM RTCS0002
			) B ON
				A.AGENCY_CD = B.USER_ID
			INNER JOIN (
				SELECT 
					AGENCY_CD
					, COUNT(1) AS TOT_CNT
					, ROUND(AVG(TOT_EVAL_POINT),1) AS TOT_EVAL_POINT
					, COUNT(CASE WHEN STFY_POINT_CD1 = '1' THEN 1 END) AS STFY_POINT_CD1_1
					, COUNT(CASE WHEN STFY_POINT_CD1 = '2' THEN 1 END) AS STFY_POINT_CD1_2
					, COUNT(CASE WHEN STFY_POINT_CD1 = '3' THEN 1 END) AS STFY_POINT_CD1_3
					, COUNT(CASE WHEN STFY_POINT_CD1 = '4' THEN 1 END) AS STFY_POINT_CD1_4
					, COUNT(CASE WHEN STFY_POINT_CD1 = '5' THEN 1 END) AS STFY_POINT_CD1_5
					, ROUND(AVG(STFY_POINT_CD1),1) AS STFY_POINT_CD1
					, COUNT(CASE WHEN STFY_POINT_CD2 = '1' THEN 1 END) AS STFY_POINT_CD2_1
					, COUNT(CASE WHEN STFY_POINT_CD2 = '2' THEN 1 END) AS STFY_POINT_CD2_2
					, COUNT(CASE WHEN STFY_POINT_CD2 = '3' THEN 1 END) AS STFY_POINT_CD2_3
					, COUNT(CASE WHEN STFY_POINT_CD2 = '4' THEN 1 END) AS STFY_POINT_CD2_4
					, COUNT(CASE WHEN STFY_POINT_CD2 = '5' THEN 1 END) AS STFY_POINT_CD2_5
					, ROUND(AVG(STFY_POINT_CD2),1) AS STFY_POINT_CD2
					, COUNT(CASE WHEN STFY_POINT_CD3 = '1' THEN 1 END) AS STFY_POINT_CD3_1
					, COUNT(CASE WHEN STFY_POINT_CD3 = '2' THEN 1 END) AS STFY_POINT_CD3_2
					, COUNT(CASE WHEN STFY_POINT_CD3 = '3' THEN 1 END) AS STFY_POINT_CD3_3
					, COUNT(CASE WHEN STFY_POINT_CD3 = '4' THEN 1 END) AS STFY_POINT_CD3_4
					, COUNT(CASE WHEN STFY_POINT_CD3 = '5' THEN 1 END) AS STFY_POINT_CD3_5
					, ROUND(AVG(STFY_POINT_CD3),1) AS STFY_POINT_CD3
				FROM RTCS0130
				WHERE 1=1
					AND DP_YN = 'Y'
					AND (v_Subt_Day_F IS NULL OR TO_CHAR(SUBT_DAY,'YYYYMMDD') BETWEEN v_Subt_Day_F AND v_Subt_Day_T)
				GROUP BY AGENCY_CD
			) C ON 
				A.AGENCY_CD = C.AGENCY_CD
		) A
		WHERE 1=1
			AND ((v_Rental_Group IS NULL) OR (v_Rental_Group IS NOT NULL AND A.RENTAL_GROUP = v_Rental_Group))
			AND ((v_Rental_Office IS NULL) OR (v_Rental_Office IS NOT NULL AND A.RENTAL_OFFICE = v_Rental_Office))
		ORDER BY A.AGENCY_CD
		;

	END p_sRtcs0130AgencyList;


END Pkg_Rtcs0130;