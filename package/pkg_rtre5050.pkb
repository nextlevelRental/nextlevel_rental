CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5050 AS
/*******************************************************************************
   NAME      Pkg_Rtre5050
   PURPOSE   장착수수료 기초 집계 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-22  이영근           채널 대/중분류 수수료 집계 처리
   1.2        2017-05-29  wjim             [20170529_04] 지급금액 기준 변경
   1.3        2017-10-26  wjim             [20171026_02] 장착수수료 집계기준 변경
                                           - 당월 중도완납/해약 계약도 집계대상에 포함
   1.4        2017-11-03  wjim             [20171103_01] 0원 장착수수료 이연대상 제외
   1.5        2025-06-19  10244015         [20250620_01] 프리미엄퍼플점 추가 장착수수료 부여                                           
*******************************************************************************/

  /*****************************************************************************
  -- 장착수수료 기초 집계 Count
  *****************************************************************************/
  FUNCTION f_sRtre5050Count(
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,          /*마감년월            */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5050
    WHERE   SLCM_YM        = v_Slcm_Ym
    AND     ORD_NO         = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5050Count;

  /*****************************************************************************
  -- 장착수수료 기초 집계 Select
  *****************************************************************************/
  PROCEDURE p_sRtre5050 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5050.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5050.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5050.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5050.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5050.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Procc_Amt      IN RTRE5050.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Ppob_Yn        IN RTRE5050.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5050.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SLCM_YM,                   /*마감년월            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.AGENCY_CD,                 /*렌탈전문점          */
            A.CHAN_CD,                   /*채널구분            */
            A.COMM_TP,                   /*수수료항목          */
            A.MAT_CD,                    /*상품코드            */
            A.CNT_CD,                    /*타이어본수          */
            A.PROCC_AMT,                 /*장착수수료          */
            A.PPOB_YN,                   /*이연대상            */
            A.PROC_DAY,                  /*장착일자            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE5050 A
    WHERE   A.SLCM_YM          = DECODE(v_Slcm_Ym        , NULL, A.SLCM_YM         , v_Slcm_Ym)
    AND     A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.AGENCY_CD        = DECODE(v_Agency_Cd      , NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.CHAN_CD          = DECODE(v_Chan_Cd        , NULL, A.CHAN_CD         , v_Chan_Cd)
    AND     A.COMM_TP          = DECODE(v_Comm_Tp        , NULL, A.COMM_TP         , v_Comm_Tp)
    AND     A.MAT_CD           = DECODE(v_Mat_Cd         , NULL, A.MAT_CD          , v_Mat_Cd)
    AND     A.CNT_CD           = DECODE(v_Cnt_Cd         , NULL, A.CNT_CD          , v_Cnt_Cd)
    AND     A.PROCC_AMT        = DECODE(v_Procc_Amt      , NULL, A.PROCC_AMT       , v_Procc_Amt)
    AND     A.PPOB_YN          = DECODE(v_Ppob_Yn        , NULL, A.PPOB_YN         , v_Ppob_Yn)
    AND     A.PROC_DAY         = DECODE(v_Proc_Day       , NULL, A.PROC_DAY        , v_Proc_Day)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre5050;

  /*****************************************************************************
  -- 장착수수료 기초 집계 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5050 (
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5050.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5050.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5050.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5050.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5050.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Procc_Amt      IN RTRE5050.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Ppob_Yn        IN RTRE5050.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5050.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5050 (
            SLCM_YM,
            ORD_NO,
            CUST_NO,
            AGENCY_CD,
            CHAN_CD,
            COMM_TP,
            MAT_CD,
            CNT_CD,
            PROCC_AMT,
            PPOB_YN,
            PROC_DAY,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Slcm_Ym,
            v_Ord_No,
            v_Cust_No,
            v_Agency_Cd,
            v_Chan_Cd,
            v_Comm_Tp,
            v_Mat_Cd,
            v_Cnt_Cd,
            v_Procc_Amt,
            v_Ppob_Yn,
            v_Proc_Day,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre5050;

  /*****************************************************************************
  -- 장착수수료 기초 집계 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5050 (
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5050.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5050.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5050.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5050.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5050.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Procc_Amt      IN RTRE5050.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Ppob_Yn        IN RTRE5050.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5050.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5050
    SET    CUST_NO          = v_Cust_No,
           AGENCY_CD        = v_Agency_Cd,
           CHAN_CD          = v_Chan_Cd,
           COMM_TP          = v_Comm_Tp,
           MAT_CD           = v_Mat_Cd,
           CNT_CD           = v_Cnt_Cd,
           PROCC_AMT        = v_Procc_Amt,
           PPOB_YN          = v_Ppob_Yn,
           PROC_DAY         = v_Proc_Day,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE 
    WHERE  SLCM_YM          = v_Slcm_Ym
    AND    ORD_NO           = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5050;

  /*****************************************************************************
  -- 장착수수료 기초 집계 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5050 (
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTRE5050
    WHERE  SLCM_YM          = v_Slcm_Ym
    AND    ORD_NO           = v_Ord_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '마감년월', v_Slcm_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5050;

  /*****************************************************************************
  -- 장착수수료 기초 집계 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5050 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Slcm_Ym        IN RTRE5050.SLCM_YM%TYPE,        /*마감년월              */
    v_Ord_No         IN RTRE5050.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE5050.CUST_NO%TYPE,        /*고객번호              */
    v_Agency_Cd      IN RTRE5050.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Chan_Cd        IN RTRE5050.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5050.COMM_TP%TYPE,        /*수수료항목            */
    v_Mat_Cd         IN RTRE5050.MAT_CD%TYPE,         /*상품코드              */
    v_Cnt_Cd         IN RTRE5050.CNT_CD%TYPE,         /*타이어본수            */
    v_Procc_Amt      IN RTRE5050.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Ppob_Yn        IN RTRE5050.PPOB_YN%TYPE,        /*이연대상              */
    v_Proc_Day       IN RTRE5050.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 마감년월, 계약번호, 등록자 ID
    IF (TRIM(v_Slcm_Ym) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Slcm_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_No) IS NULL) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        IF (TRIM(v_Cust_No) IS NULL) THEN
            v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Agency_Cd) IS NULL) THEN
            v_Return_Message := '렌탈전문점('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Chan_Cd) IS NULL) THEN
            v_Return_Message := '채널구분('||v_Chan_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Comm_Tp) IS NULL) THEN
            v_Return_Message := '수수료항목('||v_Comm_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Mat_Cd) IS NULL) THEN
            v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Cnt_Cd) IS NULL) THEN
            v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Procc_Amt) IS NULL) THEN
            v_Return_Message := '장착수수료('||v_Procc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ppob_Yn) IS NULL) THEN
            v_Return_Message := '이연대상('||v_Ppob_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Proc_Day) IS NULL) THEN
            v_Return_Message := '장착일자('||v_Proc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        IF v_Comm_Dvsn = 'I' THEN
            IF 0 != f_InsertRtre5050( v_Slcm_Ym,   v_Ord_No,    v_Cust_No, v_Agency_Cd,
                                      v_Chan_Cd,   v_Comm_Tp,   v_Mat_Cd,  v_Cnt_Cd,
                                      v_Procc_Amt, v_Ppob_Yn,   v_Proc_Day,
                                      v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '장착수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_UpdateRtre5050( v_Slcm_Ym,   v_Ord_No,    v_Cust_No, v_Agency_Cd,
                                      v_Chan_Cd,   v_Comm_Tp,   v_Mat_Cd,  v_Cnt_Cd,
                                      v_Procc_Amt, v_Ppob_Yn,   v_Proc_Day,
                                      v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '장착수수료 기초 집계 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtre5050( v_Slcm_Ym,  v_Ord_No, 
                                  v_Reg_Id, v_ErrorText
                                 ) THEN
            v_Return_Message := '장착수수료 기초 집계 삭제 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;



    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5050.p_IUDRtre5050(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5050.p_IUDRtre5050(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5050;


  /*****************************************************************************
  -- 장착수수료 기초 집계 처리
    
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2016-04-22  이영근           채널 대/중분류 수수료 집계 처리
   1.2        2017-05-29  wjim             [20170529_04] 지급금액 기준 변경
                                           - 계약일 기준(기존) > 장착일 기준(변경) 
   1.3        2017-10-26  wjim             [20171026_02] 당월 중도완납/해약 계약도 집계대상에 포함
   1.4        2017-11-03  wjim             [20171103_01] 0원 장착수수료 이연대상 제외
                                           - 레귤러체인의 경우 실제 장착수수료는 지급하지 않으나 이력관리를 위해 장착수수료를 0원으로 발생
                                           - 수수료가 0원이 경우 이후 이연처리에서 오류발생하므로 이연대상에서 제외
   1.5        2025-06-19  10244015         [20250620_01] 프리미엄퍼플점 추가 장착수수료 부여                                         
  *****************************************************************************/
  PROCEDURE p_CreateRtre5050InstallComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5050.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtsd0108 IS
    SELECT  A.ORD_NO,                                   /*계약번호            */
            A.CUST_NO,                                  /*고객번호            */ 
            A.AGENCY_CD,                                /*판매원번호          */
            A.CHAN_CD,                                  /*채널구분            */ 
            'B1' COMM_TP,                               /*수수료항목          */
            B.MAT_CD,                                   /*상품코드            */ 
            A.CNT_CD,                                   /*타이어본수          */ 
            A.PROC_DAY,                                 /*장착일자            */
            A.MFP_YN,                                   /*종료여부            */ 
            A.END_TP,                                   /*중도해지            */  
            A.CANC_DAY,                                 /*해지일자            */ 
            A.ORD_DAY,                                  /*접수일자            */
            C.CHAN_LCLS_CD,
            C.CHAN_MCLS_CD,
            CASE WHEN C.PREM_PRPL_YN = 'Y' THEN TO_NUMBER((SELECT DECODE(MAX(G.CD_DESC), NULL, '0', MAX(G.CD_DESC))		--[20250620_01] 프리미엄퍼플점 추가 장착수수료 부여
														     FROM RTCM0051 G
														    WHERE G.CD_GRP_CD = 'R084'
													          AND E.TOT_EVAL_POINT >= G.CD)) * TO_NUMBER( A.CNT_CD )
										   ELSE 0 END AS ADD_PRCM_AMT		
    FROM    RTSD0108 A, RTCS0001 B, RTSD0007 C,
    		(SELECT AGENCY_CD
			  	  , ROUND(AVG(TOT_EVAL_POINT),1) AS TOT_EVAL_POINT
   			   FROM RTCS0130										--[20250620_01]프리미엄퍼플점을 위한 만족도조사 평점
  			  WHERE 1=1
				AND DP_YN = 'Y'
    			AND TO_CHAR(SUBT_DAY,'YYYYMM') BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-3),'YYYYMM') AND TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM')
  			  GROUP BY AGENCY_CD) E
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
    AND     A.ORD_NO       = B.ORD_NO
    AND     A.AGENCY_CD    = C.AGENCY_CD
    AND     A.CHAN_CD NOT IN ( '01', '05' ) /* 장착수수료는 '방판' 제외 */
    AND     NVL(A.INST_CD, '1000') NOT IN ('1010') --20200331 kstka 방문장착, Pickup And Delivery는 별도 수수료 산정으로 제외
    AND 	A.AGENCY_CD    = E.AGENCY_CD(+);
    
    
    CURSOR  Cur_Rtsd0108_01 IS
    SELECT  A.ORD_NO,                                   /*계약번호            */
            A.CUST_NO,                                  /*고객번호            */ 
            A.AGENCY_CD,                                /*판매원번호          */
            A.CHAN_CD,                                  /*채널구분            */ 
            'B2' COMM_TP,                               /*수수료항목          */
            B.MAT_CD,                                   /*상품코드            */ 
            A.CNT_CD,                                   /*타이어본수          */ 
            A.PROC_DAY,                                 /*장착일자            */
            A.MFP_YN,                                   /*종료여부            */ 
            A.END_TP,                                   /*중도해지            */  
            A.CANC_DAY,                                 /*해지일자            */ 
            A.ORD_DAY,                                  /*접수일자            */
            C.CHAN_LCLS_CD,
            C.CHAN_MCLS_CD,
            D.WHEEL_INCHES
    FROM    RTSD0108 A, RTCS0001 B, RTSD0007 C, RTSD0005 D
    WHERE   A.PROC_DAY BETWEEN v_Period||'01'
                           AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
    AND     A.ORD_NO       = B.ORD_NO
    AND     A.AGENCY_CD    = C.AGENCY_CD
    AND     A.CHAN_CD NOT IN ( '01', '05' ) /* 장착수수료는 '방판' 제외 */
    AND     B.MAT_CD = D.MAT_CD
    AND    NVL(A.INST_CD, '1000') IN ('1010');
    
    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;
    v_Prcm_Amt      RTRE5020.PRCM_AMT%TYPE;
    v_Procc_Amt1    RTRE5050.PROCC_AMT%TYPE;
    v_Ppob_Yn       RTRE5050.PPOB_YN%TYPE DEFAULT 'Y';      --이연여부 [20171103_01]
    
  BEGIN


    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) OR (0 <> ISDATE(v_Period)) OR (6 <> LENGTH(TRIM(v_Period))) THEN
        v_Return_Message := '마감월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 이미처리되었는지 확인
    v_curr_cunt := 0;
    BEGIN
    
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5070
        WHERE   SLCM_YM = v_Period
        AND     ROWNUM =  1;
        
        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;
    
    IF v_curr_cunt > 0 THEN
        v_Return_Message := '마감월('||v_Period||') : 이미 처리되어 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    -- 기존자료가 있으면
    BEGIN
    
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5050
        WHERE   SLCM_YM = v_Period
        AND     ROWNUM =  1;
        
        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;
    
    -- 기존자료 삭제
    IF  v_curr_cunt > 0 THEN
    
        BEGIN
            
            DELETE
            FROM    RTRE5050
            WHERE   SLCM_YM = v_Period;
                
            EXCEPTION
            WHEN OTHERS THEN
                v_curr_cunt := 0;
        END;
    END IF;
    

    
    -- 장착수수료 기초 집계 생성
    v_curr_cunt := 0;
    FOR CUR_0108 IN Cur_Rtsd0108 LOOP    
        EXIT WHEN Cur_Rtsd0108%NOTFOUND;


        -- 제외 대상
        -- - [20171026_02]에 의해 주석처리
--        IF  CUR_0108.MFP_YN = 'Y' AND 
--            CUR_0108.END_TP = 'C' AND 
--            SUBSTR(CUR_0108.CANC_DAY,1,6) = v_Period THEN
--            
--            -- 제외함
--            v_curr_cunt := v_curr_cunt;
--        ELSE
    
            BEGIN
            
                SELECT  PRCM_AMT
                INTO    v_Prcm_Amt
                FROM    RTRE5020
                WHERE   MAT_CD    = CUR_0108.MAT_CD
                AND     STR_DAY  <= CUR_0108.PROC_DAY --[20170529_04] ORD_DAY > PROC_DAY
                AND     END_DAY  >= CUR_0108.PROC_DAY --[20170529_04] ORD_DAY > PROC_DAY
                AND     CHAN_LCLS_CD = CUR_0108.CHAN_LCLS_CD
                AND     CHAN_MCLS_CD = CUR_0108.CHAN_MCLS_CD
                AND     USE_YN    = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
--                    v_Return_Message := '장착수수료 조견표(주문번호-'||CUR_0108.ORD_NO||',주문일자-'||CUR_0108.ORD_DAY||',채널구분-'||CUR_0108.CHAN_CD||',상품코드-'||CUR_0108.MAT_CD||',대분류-'||CUR_0108.CHAN_LCLS_CD||',중분류-'||CUR_0108.CHAN_MCLS_CD||') : 자료가 존재하지 않습니다!';
                    v_Return_Message := '장착수수료 조견표(주문번호-'||CUR_0108.ORD_NO||',장착일자-'||CUR_0108.PROC_DAY||',채널구분-'||CUR_0108.CHAN_CD||',상품코드-'||CUR_0108.MAT_CD||',대분류-'||CUR_0108.CHAN_LCLS_CD||',중분류-'||CUR_0108.CHAN_MCLS_CD||') : 자료가 존재하지 않습니다!'; ----[20170529_04] ORD_DAY > PROC_DAY
                    RAISE e_Error;
            END;

            v_curr_cunt  := v_curr_cunt + 1;
            v_Procc_Amt1 := (CUR_0108.CNT_CD * v_Prcm_Amt) + CUR_0108.ADD_PRCM_AMT;		--[20250620_01] 프리미엄퍼플점 추가 장착수수료 부여
            
            -- 수수료가 0원인 경우 이연대상에서 제외 [20171103_01]
            IF v_Procc_Amt1 = 0 THEN
                v_Ppob_Yn := 'N';
            ELSE
                v_Ppob_Yn := 'Y';
            END IF;
            
--            IF 0 != f_InsertRtre5050( v_Slcm_Ym,   v_Ord_No,    v_Cust_No, v_Agency_Cd,
--                                      v_Chan_Cd,   v_Comm_Tp,   v_Mat_Cd,  v_Cnt_Cd,
--                                      v_Procc_Amt, v_Ppob_Yn,   v_Proc_Day,
            IF 0 != f_InsertRtre5050( v_Period,         CUR_0108.ORD_NO,   CUR_0108.CUST_NO, CUR_0108.AGENCY_CD,
                                      CUR_0108.CHAN_CD, CUR_0108.COMM_TP,  CUR_0108.MAT_CD,  CUR_0108.CNT_CD,
                                      v_Procc_Amt1,     v_Ppob_Yn,         CUR_0108.PROC_DAY,
                                      v_Reg_Id,         v_ErrorText
                                     ) THEN
                v_Return_Message := '장착수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
--        END IF;         
            
    END LOOP;    
    
    IF Cur_Rtsd0108%ISOPEN THEN
        CLOSE Cur_Rtsd0108;
    END IF;    

    
    --[20200508_01] 방문장착 수수료
    v_curr_cunt := 0;
    FOR Cur_0108_01 IN Cur_Rtsd0108_01 LOOP
        EXIT WHEN Cur_Rtsd0108_01%NOTFOUND;
        
        BEGIN
            
                SELECT  PRCM_AMT
                INTO    v_Prcm_Amt
                FROM    RTRE5130
                WHERE   WHEEL_INCHES    = CUR_0108_01.WHEEL_INCHES
                AND     STR_DAY  <= CUR_0108_01.PROC_DAY 
                AND     END_DAY  >= CUR_0108_01.PROC_DAY 
                AND     USE_YN    = 'Y';

                EXCEPTION
                WHEN OTHERS THEN
                    v_Return_Message := '방문장착수수료 조견표(주문번호-'||CUR_0108_01.ORD_NO||',장착일자-'||CUR_0108_01.PROC_DAY||',채널구분-'||CUR_0108_01.CHAN_CD||',인치-'||CUR_0108_01.WHEEL_INCHES||') : 자료가 존재하지 않습니다!';
                    RAISE e_Error;
            END;

            v_curr_cunt  := v_curr_cunt + 1;
            v_Procc_Amt1 := CUR_0108_01.CNT_CD * v_Prcm_Amt;
            
            -- 수수료가 0원인 경우 이연대상에서 제외 [20171103_01]
            IF v_Procc_Amt1 = 0 THEN
                v_Ppob_Yn := 'N';
            ELSE
                v_Ppob_Yn := 'Y';
            END IF;
            
            
            IF 0 != f_InsertRtre5050( v_Period,         CUR_0108_01.ORD_NO,   CUR_0108_01.CUST_NO, CUR_0108_01.AGENCY_CD,
                                      CUR_0108_01.CHAN_CD, CUR_0108_01.COMM_TP,  CUR_0108_01.MAT_CD,  CUR_0108_01.CNT_CD,
                                      v_Procc_Amt1,     v_Ppob_Yn,         CUR_0108_01.PROC_DAY,
                                      v_Reg_Id,         v_ErrorText
                                     ) THEN
                v_Return_Message := '방문장착수수료 기초 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
    END LOOP;
    
    IF Cur_Rtsd0108_01%ISOPEN THEN
        CLOSE Cur_Rtsd0108_01;
    END IF; 
    
    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
        END IF;    

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5050.p_CreateRtre5050InstallComm(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
        END IF;    

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5050.p_CreateRtre5050InstallComm(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5050InstallComm;
  

END Pkg_Rtre5050;