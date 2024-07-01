CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0012 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0012
   PURPOSE   프리미엄서비스 관리(세부서비스) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
   1.1        2018-02-19  wjim             [20180212_01] 선택형 프리미엄 서비스 도입
*******************************************************************************/

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Count
  *****************************************************************************/
  FUNCTION f_sRtsd0012Count(
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,            /*프리미엄서비스      */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,          /*상세서비스          */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE            /*타이어본수          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0012
    WHERE   PS_CD   = v_Ps_Cd
    AND     PRS_DCD = v_Prs_Dcd
    AND     PERIOD_CD = v_Period_Cd
    AND     CNT_CD  = v_Cnt_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0012Count;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0012 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PS_CD,                     /*프리미엄서비스      */
            A.PRS_DCD,                   /*상세서비스          */
            A.PERIOD_CD,                 /*기간코드            */
            A.CNT_CD,                    /*타이어본수          */
            A.SERV_CNT,                  /*서비스횟수          */
            A.SERV_AMT,                  /*추가렌탈료          */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0012 A
    WHERE   A.PS_CD    = DECODE(v_Ps_Cd    , NULL, A.PS_CD    , v_Ps_Cd)
    AND     A.PRS_DCD  = DECODE(v_Prs_Dcd  , NULL, A.PRS_DCD  , v_Prs_Dcd)
    AND     A.PERIOD_CD  = DECODE(v_Period_Cd  , NULL, A.PERIOD_CD  , v_Period_Cd)
    AND     A.CNT_CD   = DECODE(v_Cnt_Cd   , NULL, A.CNT_CD   , v_Cnt_Cd)
    AND     A.SERV_CNT = DECODE(v_Serv_Cnt , NULL, A.SERV_CNT , v_Serv_Cnt)
    AND     A.SERV_AMT = DECODE(v_Serv_Amt , NULL, A.SERV_AMT , v_Serv_Amt)
    AND     A.USE_YN   = DECODE(v_Use_Yn   , NULL, A.USE_YN   , v_Use_Yn)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtsd0012;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0012 (
            PS_CD,
            PRS_DCD,
            PERIOD_CD,
            CNT_CD,
            SERV_CNT,
            SERV_AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ps_Cd,
            v_Prs_Dcd,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Serv_Cnt,
            v_Serv_Amt,
            v_Use_Yn,
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

  END f_InsertRtsd0012;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0012
    SET    SERV_CNT = v_Serv_Cnt,
           SERV_AMT = v_Serv_Amt,
           USE_YN   = v_Use_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  PS_CD    = v_Ps_Cd
    AND    PRS_DCD  = v_Prs_Dcd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD   = v_Cnt_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0012;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0012
    SET    USE_YN  = 'N',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  PS_CD   = v_Ps_Cd
    AND    PRS_DCD = v_Prs_Dcd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD  = v_Cnt_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0012;

  /*****************************************************************************
  -- 프리미엄서비스 관리(세부서비스) 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0012 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*상세서비스            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*서비스횟수            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:프리미엄서비스,상세서비스, 기간코드, 타이어본수, 사용여부, 등록자 ID    
    IF (TRIM(v_Ps_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S043', v_Ps_Cd)) THEN
        v_Return_Message := '프리미엄서비스('||v_Ps_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Prs_Dcd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S044', v_Prs_Dcd)) THEN
        v_Return_Message := '상세서비스('||v_Prs_Dcd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Use_Yn) IS NULL) OR (TRIM(v_Use_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;      
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0012Count(v_Ps_Cd, v_Prs_Dcd, v_Period_Cd, v_Cnt_Cd) THEN

        IF 0 != f_InsertRtsd0012(v_Ps_Cd, v_Prs_Dcd, v_Period_Cd, v_Cnt_Cd, v_Serv_Cnt, 
                                 v_Serv_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '프리미엄서비스 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0012(v_Ps_Cd, v_Prs_Dcd, v_Period_Cd, v_Cnt_Cd, v_Serv_Cnt, 
                                     v_Serv_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '프리미엄서비스 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0012(v_Ps_Cd, v_Prs_Dcd, v_Period_Cd, v_Cnt_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '프리미엄서비스 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0012.p_IUDRtsd0012(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0012.p_IUDRtsd0012(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0012;
  
  /*****************************************************************************
  -- 특정 프리미엄 서비스용 상세 서비스 조회
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-21  wjim             [20180212_01] 신규 개발 
  *****************************************************************************/
  PROCEDURE p_sRtsd0012_ByPrmSvc (
      Ref_Cursor     IN OUT SYS_REFCURSOR
    , v_Ps_Cd        IN RTSD0012.PS_CD%TYPE           /*서비스코드            */
    , v_Period_Cd    IN RTSD0012.PERIOD_CD%TYPE       /*기간코드(S021)        */
    , v_Cnt_Cd       IN RTSD0012.CNT_CD%TYPE          /*본수(S022)            */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A2.PS_CD
         ,  A2.PRS_DCD
         ,  B2.CD_NM     AS PRS_NM
         ,  A2.PERIOD_CD
         ,  A2.CNT_CD
         ,  A2.SERV_CNT
         ,  A2.SERV_AMT
         ,  A2.USE_YN
         ,  A2.REG_ID
         ,  A2.REG_DT
         ,  A2.CHG_ID
         ,  A2.CHG_DT
         ,  A2.MEMO
      FROM  (
                SELECT  A1.*
                     ,  ROW_NUMBER() OVER (PARTITION BY A1.PS_CD, A1.PRS_DCD ORDER BY A1.PERIOD_CD) AS NUM_PERIOD
                     ,  ROW_NUMBER() OVER (PARTITION BY A1.PS_CD, A1.PRS_DCD ORDER BY A1.CNT_CD)    AS NUM_CNT
                  FROM  RTSD0012 A1
                 WHERE  A1.PS_CD     = v_Ps_Cd
                   AND  A1.PERIOD_CD IN (v_Period_Cd, 'ZZ')
                   AND  A1.CNT_CD    IN (v_Cnt_Cd, 'ZZ')
                   AND  A1.USE_YN    = 'Y'
            ) A2
         ,  RTCM0051 B2
     WHERE  A2.NUM_PERIOD   = 1
       AND  A2.NUM_CNT      = 1
       AND  A2.PRS_DCD      = B2.CD(+)
       AND  B2.CD_GRP_CD(+) = 'S044'
     ORDER  BY A2.PRS_DCD;

  END p_sRtsd0012_ByPrmSvc;
  
  /*****************************************************************************
  -- 서비스등록팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0012_srvcPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR    
    SELECT A.PRS_DCD,
           A.PRS_NM
      FROM (SELECT PRS_DCD,
	               Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', PRS_DCD) AS PRS_NM
	          FROM RTSD0012
	         WHERE 1=1
               --AND PERIOD_CD != 'ZZ'
	           AND SERV_CNT != 0
               AND USE_YN = 'Y'
          GROUP BY PRS_DCD
          ORDER BY PRS_DCD ASC
    ) A;

  END p_sRtsd0012_srvcPopup;  

END Pkg_Rtsd0012;
/
