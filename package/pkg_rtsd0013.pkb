CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0013 AS 
/*******************************************************************************
   NAME      Pkg_Rtsd0013
   PURPOSE   계약별 프리미엄서비스 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
   1.1        2018-02-26  wjim             [20180212_01] 선택형 프리미엄 서비스 도입
   1.2        2018-03-01  wjim             [20180301_01] 온라인 주문 서비스정보 본수 생성기준 변경
   1.3        2020-01-16  kstka            [2020-00014827_01] 서비스내역 노출기준 변경
*******************************************************************************/

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0013Count(
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,           /*계약번호            */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,            /*프리미엄서비스      */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,          /*상세서비스          */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE            /*타이어본수          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0013
    WHERE   ORD_NO   = v_Ord_No
    AND     PS_CD    = v_Ps_Cd
    AND     PRS_DCD  = v_Prs_Dcd
    AND     CNT_CD   = v_Cnt_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0013Count;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0013 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE          /*타이어본수            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                                                       /*계약번호            */
            A.PS_CD,                                                        /*프리미엄서비스      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S043', A.PS_CD) AS PS_NM,     /*프리미엄서비스      */
            A.PRS_DCD,                                                      /*상세서비스          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', A.PRS_DCD) AS PRS_NM,  /*상세서비스          */
            A.CNT_CD,                                                       /*타이어본수          */
            A.SERV_CNT0,                                                    /*서비스횟수(최초)    */
            CASE
              WHEN A.PRS_DCD = 'B00001' THEN NVL(A.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(A.ORD_NO)
              WHEN A.PRS_DCD = 'B00007' THEN NVL(A.SERV_CNTR,0) - Pkg_Rtcs0010.f_sRtcs0010DlvrCnt(A.ORD_NO)
             -- WHEN A.PRS_DCD = 'B00004' THEN NVL(A.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(A.ORD_NO)    --3/16 박정석 대리 요청 에러수정을 위해 막음 (김한나 변경)
              ELSE A.SERV_CNTR          
            END AS SERV_CNTR,                   /*서비스횟수(잔여)    */
            A.SERV_AMT,                                                     /*추가렌탈료          */
            A.REG_ID,                                                       /*등록자 ID           */
            A.REG_DT,                                                       /*등록일              */
            A.CHG_ID,                                                       /*변경자 ID           */
            A.CHG_DT                                                        /*변경일              */
    FROM    RTSD0013 A
    WHERE   (v_Ord_No  IS NULL OR A.ORD_NO  = v_Ord_No)
    AND     (v_Ps_Cd   IS NULL OR A.PS_CD   = v_Ps_Cd)
    AND     (v_Prs_Dcd IS NULL OR A.PRS_DCD = v_Prs_Dcd)
    AND     (v_Cnt_Cd  IS NULL OR A.CNT_CD  = v_Cnt_Cd)
    ORDER BY PS_CD, PRS_DCD;

  END p_sRtsd0013;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0013 (
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt0      IN RTSD0013.SERV_CNT0%TYPE,      /*서비스횟수(최초)      */
    v_Serv_Cntr      IN RTSD0013.SERV_CNTR%TYPE,      /*서비스횟수(잔여)      */
    v_Serv_Amt       IN RTSD0013.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0013 (
            ORD_NO,
            PS_CD,
            PRS_DCD,
            CNT_CD,
            SERV_CNT0,
            SERV_CNTR,
            SERV_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Ps_Cd,
            v_Prs_Dcd,
            v_Cnt_Cd,
            v_Serv_Cnt0,
            v_Serv_Cnt0,/*INSERT : 서비스횟수(잔여)는 서비스횟수(최초)로 저장한다.*/
            v_Serv_Amt,
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

  END f_InsertRtsd0013;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0013 (
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0013
    WHERE  ORD_NO = v_Ord_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.f_DeleteRtsd0013(1)', '주문번호', v_Ord_No);

    RETURN SQLCODE;
  END f_DeleteRtsd0013;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0013 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt0      IN RTSD0013.SERV_CNT0%TYPE,      /*서비스횟수(최초)      */
    v_Serv_Cntr      IN RTSD0013.SERV_CNTR%TYPE,      /*서비스횟수(잔여)      */
    v_Serv_Amt       IN RTSD0013.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계약번호, 프리미엄서비스,상세서비스, 타이어본수, 사용여부, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ps_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S043', v_Ps_Cd)) THEN
        v_Return_Message := '프리미엄서비스('||v_Ps_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Prs_Dcd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S044', v_Prs_Dcd)) THEN
        v_Return_Message := '상세서비스('||v_Prs_Dcd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (0 != f_sRtsd0013ChkServAmt(v_Ord_No)) THEN
        v_Return_Message := '프리미엄 서비스 가격 불일치로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF v_Serv_Cntr > 0 THEN 
        
            IF 0 != f_InsertRtsd0013(v_Ord_No, v_Ps_Cd, v_Prs_Dcd, v_Cnt_Cd,
                                     v_Serv_Cnt0, v_Serv_Cntr, v_Serv_Amt, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '계약별 프리미엄서비스 등록 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                RAISE e_Error;

            END IF;
            
        END IF;
        
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_IUDRtsd0013(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_IUDRtsd0013(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0013;


  /*****************************************************************************
  -- 계약별 프리미엄서비스 - 계약번호 기준 프리미엄서비스 잔여횟수 획득 - 엔진오일 접수에서 배송 반영
  *****************************************************************************/
  FUNCTION f_sRtsd0013ServCntr(
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,           /*계약번호            */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE           /*상세서비스          */
    ) RETURN NUMBER IS
    v_Serv_Cntr RTSD0013.SERV_CNTR%TYPE DEFAULT 0;      /*서비스횟수(잔여)    */
  BEGIN
    
    SELECT  CASE
              WHEN PRS_DCD = 'B00001' THEN NVL(SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(ORD_NO)
              WHEN PRS_DCD = 'B00004' THEN NVL(SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(ORD_NO)
              WHEN PRS_DCD = 'B00007' THEN NVL(SERV_CNT0,0) - Pkg_Rtcs0010.f_sRtcs0010ComplCnt(ORD_NO)
              ELSE NVL(SERV_CNTR,0)
            END AS SERV_CNTR                    /*서비스횟수(잔여)    */
    INTO    v_Serv_Cntr
    FROM    RTSD0013
    WHERE   ORD_NO   = v_Ord_No
    AND     PRS_DCD  = v_Prs_Dcd
    AND     ROWNUM <= 1;

    RETURN v_Serv_Cntr;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0013ServCntr;
  
  /*****************************************************************************
  -- 계약별 프리미엄서비스 - 계약번호 기준 프리미엄서비스 잔여횟수 획득 - 엔진오일 실 처리 건수 
  *****************************************************************************/
  FUNCTION f_sRtsd0013ServCntr2(
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,           /*계약번호            */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE           /*상세서비스          */
    ) RETURN NUMBER IS
    v_Serv_Cntr RTSD0013.SERV_CNTR%TYPE DEFAULT 0;      /*서비스횟수(잔여)    */
  BEGIN
    
    SELECT  CASE
              WHEN PRS_DCD = 'B00001' THEN NVL(SERV_CNTR,0)
              WHEN PRS_DCD = 'B00004' THEN NVL(SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(ORD_NO)
              ELSE NVL(SERV_CNTR,0)
            END AS SERV_CNTR                    /*서비스횟수(잔여)    */
    INTO    v_Serv_Cntr
    FROM    RTSD0013
    WHERE   ORD_NO   = v_Ord_No
    AND     PRS_DCD  = v_Prs_Dcd
    AND     ROWNUM <= 1;

    RETURN v_Serv_Cntr;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0013ServCntr2;


  /*****************************************************************************
  -- 계약별 프리미엄서비스 Update - 전자서명  서비스 확인서 서명완료 등록시 서비스잔여횟수 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0013ServCntr (
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    IF (v_Prs_Dcd <> 'B00007') THEN --걱정제로 서비스가 아닌경우
        UPDATE RTSD0013
        SET    SERV_CNTR = DECODE(SERV_CNTR,0,0,SERV_CNTR - 1),
               CHG_ID    = v_Reg_Id,
               CHG_DT    = SYSDATE
        WHERE  ORD_NO    = v_Ord_No
        AND    PRS_DCD   = v_Prs_Dcd;
    ELSE --걱정제로 서비스 인 경우
    
        UPDATE RTSD0013
        SET    SERV_CNTR = DECODE(SERV_CNTR,0,0,SERV_CNTR - Pkg_Rtcs0010.f_sRtcs0010DlvrCnt(v_Ord_No)),
               CHG_ID    = v_Reg_Id,
               CHG_DT    = SYSDATE
        WHERE  ORD_NO    = v_Ord_No
        AND    PRS_DCD   = v_Prs_Dcd;
    END IF;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0013ServCntr;


  /*****************************************************************************
  -- 계약별 프리미엄서비스 저장 - 온라인
  *****************************************************************************/
  PROCEDURE p_Online_InsertRtsd0013 (
    v_Ord_No            IN RTSD0014.ORD_NO%TYPE,            /*주문번호        */
    v_ApplyDate         IN RTSD0011.STR_DAY%TYPE,           /*적용일자        */
    v_Period_Cd         IN RTSD0012.PERIOD_CD%TYPE,         /*기간            */
    v_Cnt_Cd            IN RTSD0012.CNT_CD%TYPE,            /*타이어갯수      */
    v_Season            IN RTSD0011.SEASON_CD%TYPE,         /*계절용          */
    v_Reg_Id            IN RTSD0013.REG_ID%TYPE,            /*등록자 ID       */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.F_SRTSD0104COUNT(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_ApplyDate) IS NULL THEN
        v_Return_Message := '적용일자('||v_ApplyDate||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '계약기간('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    INSERT  INTO RTSD0013 (
            ORD_NO,
            PS_CD,
            PRS_DCD,
            CNT_CD,
            SERV_CNT0,
            SERV_CNTR,
            SERV_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  v_Ord_No,      /*주문번호       */
            A.PS_CD,       /*프리미엄서비스 */
            B.PRS_DCD,     /*상세서비스     */
            B.CNT_CD,      /*타이어본수     */
            B.SERV_CNT,    /*서비스횟수     */
            B.SERV_CNT,    /*서비스횟수     */
            B.SERV_AMT,    /*추가렌탈료     */
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTSD0011 A,
            RTSD0012 B
    WHERE   v_ApplyDate BETWEEN A.STR_DAY AND A.END_DAY
    AND     B.PERIOD_CD = v_Period_Cd
    AND     B.CNT_CD    = v_Cnt_Cd
    AND     A.SEASON_CD = v_Season
    AND     A.PS_CD     = B.PS_CD
    AND     A.USE_YN    = 'Y'
    AND     B.USE_YN    = 'Y';

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
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_Online_InsertRtsd0013(1)', v_ErrorText, v_Return_Message);

  WHEN OTHERS THEN
    ROLLBACK;
    v_Success_code := -1;
    v_Return_Message := v_Return_Message;
    v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_Online_InsertRtsd0013(2)', v_ErrorText, v_Return_Message);

  END p_Online_InsertRtsd0013;
  
  /*****************************************************************************
  -- 계약별 선택형 프리미엄서비스 저장 - 온라인
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-26  wjim             [20180212_01] 신규 개발 
   1.2        2018-03-01  wjim             [20180301_01] 온라인 주문 서비스정보 본수 생성기준 변경
                                           - 변경전 : 기준정보 기준 (ZZ 발생 가능)
                                           - 변경후 : 계약상의 본수
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0013Online (
      v_Ord_No          IN RTSD0014.ORD_NO%TYPE          /*주문번호        */
    , v_Ps_Cd           IN RTSD0012.PS_CD%TYPE           /*서비스코드      */
    , v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE       /*기간            */
    , v_Cnt_Cd          IN RTSD0012.CNT_CD%TYPE          /*타이어갯수      */
    , v_Reg_Id          IN RTSD0013.REG_ID%TYPE          /*등록자 ID       */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.F_SRTSD0104COUNT(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Ps_Cd) IS NULL) OR (0 = Pkg_Rtsd0011.f_sRtsd0011Count(v_Ps_Cd, 1)) THEN
        v_Return_Message := '서비스코드('||v_Ps_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '계약기간('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    INSERT  INTO RTSD0013 (
            ORD_NO
         ,  PS_CD
         ,  PRS_DCD
         ,  CNT_CD
         ,  SERV_CNT0
         ,  SERV_CNTR
         ,  SERV_AMT
         ,  REG_ID
         ,  REG_DT
         ,  CHG_ID
         ,  CHG_DT
    )
    SELECT  v_Ord_No
         ,  A2.PS_CD
         ,  A2.PRS_DCD
--         ,  A2.CNT_CD --[20180301_01] 이전
         ,  v_Cnt_Cd    --[20180301_01]
         ,  A2.SERV_CNT
         ,  A2.SERV_CNT
         ,  A2.SERV_AMT
         ,  v_Reg_Id
         ,  SYSDATE
         ,  v_Reg_Id
         ,  SYSDATE
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
     WHERE  A2.NUM_PERIOD   = 1
       AND  A2.NUM_CNT      = 1
     ORDER  BY A2.PRS_DCD;

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
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_InsertRtsd0013Online(1)', v_ErrorText, v_Return_Message);

  WHEN OTHERS THEN
    ROLLBACK;
    v_Success_code := -1;
    v_Return_Message := v_Return_Message;
    v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_InsertRtsd0013Online(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0013Online;

  /*****************************************************************************
  -- 계약별 선택형 프리미엄서비스 저장 - 온라인
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-12-04  sePark      
   1.3        2020-01-16  kstka            [2020-00014827_01] 서비스내역 노출기준 변경     
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0013OnlineNew (
      v_Ord_No          IN RTSD0014.ORD_NO%TYPE          /*주문번호        */
    , v_Ps_Cd           IN RTSD0012.PS_CD%TYPE           /*서비스코드      */
    , v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE       /*기간            */
    , v_Cnt_Cd          IN RTSD0012.CNT_CD%TYPE          /*타이어갯수      */
    , v_Prs_Dcd         IN RTSD0013.PRS_DCD%TYPE         /*상세서비스         2018.12.04추가   */
    , v_Serv_Cnt0       IN RTSD0013.SERV_CNT0%TYPE       /*서비스횟수(최초)   2018.12.04추가   */
    , v_Serv_Amt        IN RTSD0013.SERV_AMT%TYPE        /*서비스금액         2018.12.04추가   */
    , v_Reg_Id          IN RTSD0013.REG_ID%TYPE          /*등록자 ID       */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.F_SRTSD0104COUNT(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Ps_Cd) IS NULL) OR (0 = Pkg_Rtsd0011.f_sRtsd0011Count(v_Ps_Cd, 1)) THEN
        v_Return_Message := '서비스코드('||v_Ps_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '계약기간('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    INSERT  INTO RTSD0013 (
            ORD_NO,
            PS_CD,
            PRS_DCD,
            CNT_CD,
            SERV_CNT0,
            SERV_CNTR,
            SERV_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Ps_Cd,
            v_Prs_Dcd,
            v_Cnt_Cd,
            v_Serv_Cnt0,
            v_Serv_Cnt0,/*INSERT : 서비스횟수(잔여)는 서비스횟수(최초)로 저장한다.*/
            v_Serv_Amt,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );

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
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_InsertRtsd0013Online(1)', v_ErrorText, v_Return_Message);

  WHEN OTHERS THEN
    ROLLBACK;
    v_Success_code := -1;
    v_Return_Message := v_Return_Message;
    v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_InsertRtsd0013Online(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0013OnlineNew;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 계약번호별 보관회수 및 보관타이어 개수(계약및사용)
  *****************************************************************************/
  PROCEDURE p_Rtsd0013ServCntNTireCnt (
    v_Ord_No          IN RTSD0013.ORD_NO%TYPE,            /*주문번호          */
    v_Serv_Cnt0       OUT RTSD0013.SERV_CNT0%TYPE,        /*보관회수(전체)    */
    v_Cnt_Cd          OUT RTSD0108.CNT_CD%TYPE,           /*계약타이어 개수   */
    v_Cont_Tire_Cnt   OUT NUMBER,                         /*계약타이어 총개수 */
    v_Use_Cnt0        OUT NUMBER,                         /*보관회수(사용)    */
    v_Use_Tire_Cnt    OUT NUMBER,                         /*보관타이어 총개수 */
    v_Reg_Id          IN RTSD0013.REG_ID%TYPE,            /*등록자 ID         */
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    
  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.F_SRTSD0104COUNT(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 계약 보관회수
    SELECT  NVL( SUM(SERV_CNT0), 0)
    INTO    v_Serv_Cnt0
    FROM    RTSD0013
    WHERE   ORD_NO  = v_Ord_No
    AND     PRS_DCD = 'B00004';
    
    -- 계약  타이어개수
    v_Cnt_Cd := Pkg_Rtsd0104.f_sRtsd0104Cnt_Cd(v_Ord_No);
    
    -- 보관가능 타이어 개수
    v_Cont_Tire_Cnt := v_Serv_Cnt0 * TO_NUMBER( NVL(v_Cnt_Cd, 0));
    
    -- 실제 보관회수 
    v_Use_Cnt0 := Pkg_Rtcs0203.f_sRtcs0203ServCnt(v_Ord_No);
    
    -- 실제 보관했던 타이어개수
    v_Use_Tire_Cnt := Pkg_Rtcs0203.f_sRtcs0203ServTireCnt(v_Ord_No);


    v_Success_code := 0;
    v_Return_Message := '정상적으로 조회 되었습니다';
    v_ErrorText := '';
    --COMMIT;

  EXCEPTION
  WHEN e_Error THEN
    ROLLBACK;
    v_Success_code := -1;
    v_Return_Message := v_Return_Message;
    v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_Rtsd0013ServCntNTireCnt(1)', v_ErrorText, v_Return_Message);

  WHEN OTHERS THEN
    ROLLBACK;
    v_Success_code := -1;
    v_Return_Message := v_Return_Message;
    v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_Rtsd0013ServCntNTireCnt(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0013ServCntNTireCnt;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 - 계약번호 기준 프리미엄서비스 최초횟수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0013ServCnt0(
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,           /*계약번호            */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE           /*상세서비스          */
    ) RETURN NUMBER IS
    v_Serv_Cnt0 RTSD0013.SERV_CNT0%TYPE DEFAULT 0;      /*서비스횟수(최초)    */
  BEGIN

    SELECT  NVL(SERV_CNT0,0)
    INTO    v_Serv_Cnt0
    FROM    RTSD0013
    WHERE   ORD_NO   = v_Ord_No
    AND     PRS_DCD  = v_Prs_Dcd
    AND     ROWNUM <= 1;

    RETURN v_Serv_Cnt0;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0013ServCnt0;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Select (온라인몰)
  *****************************************************************************/
  PROCEDURE p_sRtsd0013Online (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE          /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', A.PRS_DCD) AS PRS_NM,  /*상세서비스          */
            A.SERV_CNT0,                                                    /*서비스횟수(최초)    */
            CASE
              WHEN A.PRS_DCD = 'B00001' THEN NVL(A.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(A.ORD_NO)
              WHEN A.PRS_DCD = 'B00004' THEN NVL(A.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(A.ORD_NO)
              ELSE A.SERV_CNTR
            END AS SERV_CNTR                    /*서비스횟수(잔여)    */
    FROM    RTSD0013 A
    WHERE   (v_Ord_No  IS NULL OR A.ORD_NO  = v_Ord_No)
    ORDER BY PRS_DCD;

  END p_sRtsd0013Online;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 Select List (온라인몰)
  *****************************************************************************/
  PROCEDURE p_sRtsd0013OnlineList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*SAFEKEY               */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE         /*사업자번호            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    WITH RTTMORDER1
    AS      (
            SELECT  Y.ORD_NO 
            FROM    RTSD0100 X, 
                    RTSD0108 Y
            WHERE   X.CUST_NO = Y.CUST_NO
            AND     NVL(X.SAFEKEY, X.O_SAFEKEY) = v_Safekey
            AND     X.USE_YN  = 'Y'
            AND     X.CUST_TP = '01'
            ),
    RTTMORDER2 
    AS      (
            SELECT  Y.ORD_NO 
            FROM    RTSD0100 X, 
                    RTSD0108 Y
            WHERE   X.CUST_NO = Y.CUST_NO
            AND     X.BUSL_NO = REPLACE(v_Busl_No, '-', '')
            AND     X.USE_YN  = 'Y'
            AND     X.CUST_TP = '02'
            ),
    RTTMORDER3 
    AS      (
            SELECT  Y.ORD_NO 
            FROM    RTSD0100 X, 
                    RTSD0104 Y
            WHERE   X.CUST_NO = Y.CUST_NO
            AND     NVL(X.SAFEKEY, X.O_SAFEKEY) = v_Safekey
            AND     X.USE_YN  = 'Y'
            AND     X.CUST_TP = '01'
            AND     Y.ORD_NO  LIKE 'O%'
            AND     Pkg_Rtsd0108.f_sRtsd0108Count(Y.ORD_NO) = 0
            --AND     Y.STAT_CD != '04'
            ),
    RTTMORDER4
    AS      (
            SELECT  Y.ORD_NO 
            FROM    RTSD0100 X, 
                    RTSD0104 Y
            WHERE   X.CUST_NO = Y.CUST_NO
            AND     X.BUSL_NO = REPLACE(v_Busl_No, '-', '')
            AND     X.USE_YN  = 'Y'
            AND     X.CUST_TP = '02'
            AND     Y.ORD_NO  LIKE 'O%'
            AND     Pkg_Rtsd0108.f_sRtsd0108Count(Y.ORD_NO) = 0
            --AND     Y.STAT_CD != '04'
            )
/****** 장착완료 ****************************************************************************************/
/*  장착완료 - 개인 */
    SELECT  C.ORD_NO,                                                      /*계약번호            */
            C.PRS_DCD,                                                     /*상세서비스 코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', C.PRS_DCD) PRS_NM,    /*상세서비스          */
            C.SERV_CNT0,                                                   /*서비스횟수(최초)    */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN NVL(C.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00004' THEN NVL(C.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(C.ORD_NO)
              ELSE C.SERV_CNTR          
            END AS SERV_CNTR,   /*서비스횟수(잔여)    */
            DECODE(C.PROC_DAY,'','',
                   SUBSTR(C.PROC_DAY,1,4)||'-'||SUBSTR(C.PROC_DAY,5,2)||'-'||
                   SUBSTR(C.PROC_DAY,7,2))                    PROC_DAY,    /*서비스일자          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C.PROC_IN_CD)      PROC_IN_NM   /*처리자              */
    FROM    (    
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    D.PROC_DAY, D.PROC_IN_CD       
            FROM    (
                    SELECT  MAX_SERV_SEQ, ORD_NO, PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT, REG_ID, REG_DT, CHG_ID, CHG_DT, 
                            DECODE(SERV_SEQ,0,NULL,SERV_SEQ) AS SERV_SEQ, SEQ, SERVICE_CD
                    FROM    (                
                            SELECT  MAX(NVL(D.SERV_SEQ,0)) OVER(PARTITION BY D.ORD_NO, D.SERVICE_CD) MAX_SERV_SEQ,
                                    C.*, 
                                    NVL(D.SERV_SEQ,0) SERV_SEQ, D.SEQ, D.SERVICE_CD
                            FROM    RTSD0013 C,
                                    RTCS0008 D
                            WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER1)
                            AND     C.PRS_DCD != 'B00004'
                            AND     C.ORD_NO   = D.ORD_NO(+)
                            AND     C.PRS_DCD  = D.SERVICE_CD(+)   
                            ) 
                    WHERE   SERV_SEQ = MAX_SERV_SEQ
                    ) C, 
                    RTCS0007 D
            WHERE   C.ORD_NO       = D.ORD_NO(+)
            AND     C.MAX_SERV_SEQ = D.SERV_SEQ(+)  
            UNION   ALL
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    C.PROC_DAY, C.PROC_IN_CD 
            FROM    (
                    SELECT  MAX(NVL(D.STRG_SEQ,0)) OVER(PARTITION BY D.ORD_NO) MAX_STRG_SEQ,
                            C.*, 
                            NVL(D.STRG_SEQ,0) STRG_SEQ, 
                            D.AGENCY_CD AS PROC_IN_CD, 
                            D.STRG_DAY AS PROC_DAY
                    FROM    RTSD0013 C,
                            RTCS0203 D
                    WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER1)
                    AND     C.PRS_DCD  = 'B00004'
                    AND     C.ORD_NO   = D.ORD_NO(+)
                    AND     D.STRG_YN(+)  = 'Y' 
                    ) C
            WHERE   STRG_SEQ = MAX_STRG_SEQ
            ) C
    UNION ALL       
/*  장착완료 - 사업자 */
    SELECT  C.ORD_NO,                                                      /*계약번호            */
            C.PRS_DCD,                                                     /*상세서비스 코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', C.PRS_DCD) PRS_NM,    /*상세서비스          */
            C.SERV_CNT0,                                                   /*서비스횟수(최초)    */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN NVL(C.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00004' THEN NVL(C.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(C.ORD_NO)
              ELSE C.SERV_CNTR          
            END AS SERV_CNTR,   /*서비스횟수(잔여)    */
            DECODE(C.PROC_DAY,'','',
                   SUBSTR(C.PROC_DAY,1,4)||'-'||SUBSTR(C.PROC_DAY,5,2)||'-'||
                   SUBSTR(C.PROC_DAY,7,2))                    PROC_DAY,    /*서비스일자          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C.PROC_IN_CD)      PROC_IN_NM   /*처리자              */
    FROM    (    
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    D.PROC_DAY, D.PROC_IN_CD       
            FROM    (
                    SELECT  MAX_SERV_SEQ, ORD_NO, PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT, REG_ID, REG_DT, CHG_ID, CHG_DT, 
                            DECODE(SERV_SEQ,0,NULL,SERV_SEQ) AS SERV_SEQ, SEQ, SERVICE_CD
                    FROM    (                
                            SELECT  MAX(NVL(D.SERV_SEQ,0)) OVER(PARTITION BY D.ORD_NO, D.SERVICE_CD) MAX_SERV_SEQ,
                                    C.*, 
                                    NVL(D.SERV_SEQ,0) SERV_SEQ, D.SEQ, D.SERVICE_CD
                            FROM    RTSD0013 C,
                                    RTCS0008 D
                            WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER2)
                            AND     C.PRS_DCD != 'B00004'
                            AND     C.ORD_NO   = D.ORD_NO(+)
                            AND     C.PRS_DCD  = D.SERVICE_CD(+)   
                            ) 
                    WHERE   SERV_SEQ = MAX_SERV_SEQ
                    ) C, 
                    RTCS0007 D
            WHERE   C.ORD_NO       = D.ORD_NO(+)
            AND     C.MAX_SERV_SEQ = D.SERV_SEQ(+)  
            UNION   ALL
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    C.PROC_DAY, C.PROC_IN_CD 
            FROM    (
                    SELECT  MAX(NVL(D.STRG_SEQ,0)) OVER(PARTITION BY D.ORD_NO) MAX_STRG_SEQ,
                            C.*, 
                            NVL(D.STRG_SEQ,0) STRG_SEQ, 
                            D.AGENCY_CD AS PROC_IN_CD, 
                            D.STRG_DAY AS PROC_DAY
                    FROM    RTSD0013 C,
                            RTCS0203 D
                    WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER2)
                    AND     C.PRS_DCD  = 'B00004'
                    AND     C.ORD_NO   = D.ORD_NO(+)
                    AND     D.STRG_YN(+)  = 'Y' 
                    ) C
            WHERE   STRG_SEQ = MAX_STRG_SEQ
            ) C
    UNION ALL
/***** 장착안됨(온라인) *********************************************************************************/
/*  장착안된 건(온라인) - 개인 */
    SELECT  C.ORD_NO,                                                      /*계약번호            */
            C.PRS_DCD,                                                     /*상세서비스 코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', C.PRS_DCD) PRS_NM,    /*상세서비스          */
            C.SERV_CNT0,                                                   /*서비스횟수(최초)    */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN NVL(C.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00004' THEN NVL(C.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(C.ORD_NO)
              ELSE C.SERV_CNTR          
            END AS SERV_CNTR,   /*서비스횟수(잔여)    */
            DECODE(C.PROC_DAY,'','',
                   SUBSTR(C.PROC_DAY,1,4)||'-'||SUBSTR(C.PROC_DAY,5,2)||'-'||
                   SUBSTR(C.PROC_DAY,7,2))                    PROC_DAY,    /*서비스일자          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C.PROC_IN_CD)      PROC_IN_NM   /*처리자              */
    FROM    (    
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    D.PROC_DAY, D.PROC_IN_CD       
            FROM    (
                    SELECT  MAX_SERV_SEQ, ORD_NO, PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT, REG_ID, REG_DT, CHG_ID, CHG_DT, 
                            DECODE(SERV_SEQ,0,NULL,SERV_SEQ) AS SERV_SEQ, SEQ, SERVICE_CD
                    FROM    (                
                            SELECT  MAX(NVL(D.SERV_SEQ,0)) OVER(PARTITION BY D.ORD_NO, D.SERVICE_CD) MAX_SERV_SEQ,
                                    C.*, 
                                    NVL(D.SERV_SEQ,0) SERV_SEQ, D.SEQ, D.SERVICE_CD
                            FROM    RTSD0013 C,
                                    RTCS0008 D
                            WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER3)
                            AND     C.PRS_DCD != 'B00004'
                            AND     C.ORD_NO   = D.ORD_NO(+)
                            AND     C.PRS_DCD  = D.SERVICE_CD(+)   
                            ) 
                    WHERE   SERV_SEQ = MAX_SERV_SEQ
                    ) C, 
                    RTCS0007 D
            WHERE   C.ORD_NO       = D.ORD_NO(+)
            AND     C.MAX_SERV_SEQ = D.SERV_SEQ(+)  
            UNION   ALL
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    C.PROC_DAY, C.PROC_IN_CD 
            FROM    (
                    SELECT  MAX(NVL(D.STRG_SEQ,0)) OVER(PARTITION BY D.ORD_NO) MAX_STRG_SEQ,
                            C.*, 
                            NVL(D.STRG_SEQ,0) STRG_SEQ, 
                            D.AGENCY_CD AS PROC_IN_CD, 
                            D.STRG_DAY AS PROC_DAY
                    FROM    RTSD0013 C,
                            RTCS0203 D
                    WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER3)
                    AND     C.PRS_DCD  = 'B00004'
                    AND     C.ORD_NO   = D.ORD_NO(+)
                    AND     D.STRG_YN(+)  = 'Y' 
                    ) C
            WHERE   STRG_SEQ = MAX_STRG_SEQ
            ) C
    UNION ALL
/*  장착완료 - 사업자 */
    SELECT  C.ORD_NO,                                                      /*계약번호            */
            C.PRS_DCD,                                                     /*상세서비스 코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', C.PRS_DCD) PRS_NM,    /*상세서비스          */
            C.SERV_CNT0,                                                   /*서비스횟수(최초)    */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN NVL(C.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00004' THEN NVL(C.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(C.ORD_NO)
              ELSE C.SERV_CNTR          
            END AS SERV_CNTR,   /*서비스횟수(잔여)    */
            DECODE(C.PROC_DAY,'','',
                   SUBSTR(C.PROC_DAY,1,4)||'-'||SUBSTR(C.PROC_DAY,5,2)||'-'||
                   SUBSTR(C.PROC_DAY,7,2))                    PROC_DAY,    /*서비스일자          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C.PROC_IN_CD)      PROC_IN_NM   /*처리자              */
    FROM    (    
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    D.PROC_DAY, D.PROC_IN_CD       
            FROM    (
                    SELECT  MAX_SERV_SEQ, ORD_NO, PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT, REG_ID, REG_DT, CHG_ID, CHG_DT, 
                            DECODE(SERV_SEQ,0,NULL,SERV_SEQ) AS SERV_SEQ, SEQ, SERVICE_CD
                    FROM    (                
                            SELECT  MAX(NVL(D.SERV_SEQ,0)) OVER(PARTITION BY D.ORD_NO, D.SERVICE_CD) MAX_SERV_SEQ,
                                    C.*, 
                                    NVL(D.SERV_SEQ,0) SERV_SEQ, D.SEQ, D.SERVICE_CD
                            FROM    RTSD0013 C,
                                    RTCS0008 D
                            WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER4)
                            AND     C.PRS_DCD != 'B00004'
                            AND     C.ORD_NO   = D.ORD_NO(+)
                            AND     C.PRS_DCD  = D.SERVICE_CD(+)   
                            ) 
                    WHERE   SERV_SEQ = MAX_SERV_SEQ
                    ) C, 
                    RTCS0007 D
            WHERE   C.ORD_NO       = D.ORD_NO(+)
            AND     C.MAX_SERV_SEQ = D.SERV_SEQ(+)  
            UNION   ALL
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    C.PROC_DAY, C.PROC_IN_CD 
            FROM    (
                    SELECT  MAX(NVL(D.STRG_SEQ,0)) OVER(PARTITION BY D.ORD_NO) MAX_STRG_SEQ,
                            C.*, 
                            NVL(D.STRG_SEQ,0) STRG_SEQ, 
                            D.AGENCY_CD AS PROC_IN_CD, 
                            D.STRG_DAY AS PROC_DAY
                    FROM    RTSD0013 C,
                            RTCS0203 D
                    WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER4)
                    AND     C.PRS_DCD  = 'B00004'
                    AND     C.ORD_NO   = D.ORD_NO(+)
                    AND     D.STRG_YN(+)  = 'Y' 
                    ) C
            WHERE   STRG_SEQ = MAX_STRG_SEQ
            ) C

    ORDER BY 1, 2;

  END p_sRtsd0013OnlineList;

  
  /*****************************************************************************
  -- 계약별 프리미엄서비스 Select List (온라인몰, O2O연계)
  *****************************************************************************/
  PROCEDURE p_sRtsd0013OnlineListNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*SAFEKEY               */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE         /*사업자번호            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    WITH RTTMORDER1
    AS      (
            SELECT  Y.ORD_NO 
            FROM    RTSD0100 X, 
                    RTSD0108 Y
            WHERE   X.CUST_NO = Y.CUST_NO
            AND     NVL(X.SAFEKEY, X.O_SAFEKEY) = v_Safekey
            AND     X.USE_YN  = 'Y'
            AND     X.CUST_TP = '01'
            ),
    RTTMORDER2 
    AS      (
            SELECT  Y.ORD_NO 
            FROM    RTSD0100 X, 
                    RTSD0108 Y
            WHERE   X.CUST_NO = Y.CUST_NO
            AND     X.BUSL_NO = REPLACE(v_Busl_No, '-', '')
            AND     X.USE_YN  = 'Y'
            AND     X.CUST_TP = '02'
            ),
    RTTMORDER3 
    AS      (
            SELECT  Y.ORD_NO 
            FROM    RTSD0100 X, 
                    RTSD0104 Y
            WHERE   X.CUST_NO = Y.CUST_NO
            AND     NVL(X.SAFEKEY, X.O_SAFEKEY) = v_Safekey
            AND     X.USE_YN  = 'Y'
            AND     X.CUST_TP = '01'
            AND     Y.ORD_NO  LIKE 'O%'
            AND     Pkg_Rtsd0108.f_sRtsd0108Count(Y.ORD_NO) = 0
            --AND     Y.STAT_CD != '04'
            ),
    RTTMORDER4
    AS      (
            SELECT  Y.ORD_NO 
            FROM    RTSD0100 X, 
                    RTSD0104 Y
            WHERE   X.CUST_NO = Y.CUST_NO
            AND     X.BUSL_NO = REPLACE(v_Busl_No, '-', '')
            AND     X.USE_YN  = 'Y'
            AND     X.CUST_TP = '02'
            AND     Y.ORD_NO  LIKE 'O%'
            AND     Pkg_Rtsd0108.f_sRtsd0108Count(Y.ORD_NO) = 0
            --AND     Y.STAT_CD != '04'
            )
/****** 장착완료 ****************************************************************************************/
/*  장착완료 - 개인 */
    SELECT  C.ORD_NO,                                                      /*계약번호            */
            C.PRS_DCD,                                                     /*상세서비스 코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', C.PRS_DCD) PRS_NM,    /*상세서비스          */
            C.SERV_CNT0,                                                   /*서비스횟수(최초)    */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN NVL(C.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00004' THEN NVL(C.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(C.ORD_NO)
              ELSE C.SERV_CNTR          
            END AS SERV_CNTR,   /*서비스횟수(잔여)    */
            DECODE(C.PROC_DAY,'','',
                   SUBSTR(C.PROC_DAY,1,4)||'-'||SUBSTR(C.PROC_DAY,5,2)||'-'||
                   SUBSTR(C.PROC_DAY,7,2))                    PROC_DAY,    /*서비스일자          */
            C.PROC_IN_CD,
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C.PROC_IN_CD)      PROC_IN_NM,   /*처리자              */
            CASE
              WHEN C.PRS_DCD = 'B00000' THEN Pkg_Rtcm0051.f_sRtcm0051CodeName('S032', STAT_CD)
              WHEN C.PRS_DCD = 'B00001' THEN Pkg_Rtcs0009.f_sRtcs0009DlvrStat(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00007' THEN Pkg_Rtcs0010.f_sRtcs0010DlvrStat(C.ORD_NO)
              ELSE 
                    CASE WHEN NVL(C.SERV_CNT0,0) = NVL(C.SERV_CNTR,0) THEN '' ELSE '처리완료' END
            END DLVR_STAT_NM
    FROM    (    
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    D.PROC_DAY, D.PROC_IN_CD, '' STAT_CD       
            FROM    (
                    SELECT  MAX_SERV_SEQ, ORD_NO, PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT, REG_ID, REG_DT, CHG_ID, CHG_DT, 
                            DECODE(SERV_SEQ,0,NULL,SERV_SEQ) AS SERV_SEQ, SEQ, SERVICE_CD
                    FROM    (                
                            SELECT  D.SERV_SEQ MAX_SERV_SEQ,
                                    C.*, 
                                    NVL(D.SERV_SEQ,0) SERV_SEQ, D.SEQ, D.SERVICE_CD
                            FROM    RTSD0013 C,
                                    RTCS0008 D
                            WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER1)
                            AND     C.PRS_DCD != 'B00004'
                            AND     C.ORD_NO   = D.ORD_NO(+)
                            AND     C.PRS_DCD  = D.SERVICE_CD(+)   
                            ) 
                    ) C, 
                    RTCS0007 D
            WHERE   C.ORD_NO       = D.ORD_NO(+)
            AND     C.MAX_SERV_SEQ = D.SERV_SEQ(+)  
            UNION   ALL
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    C.PROC_DAY, C.PROC_IN_CD, '' STAT_CD 
            FROM    (
                    SELECT  MAX(NVL(D.STRG_SEQ,0)) OVER(PARTITION BY D.ORD_NO) MAX_STRG_SEQ,
                            C.*, 
                            NVL(D.STRG_SEQ,0) STRG_SEQ, 
                            D.AGENCY_CD AS PROC_IN_CD, 
                            D.STRG_DAY AS PROC_DAY
                    FROM    RTSD0013 C,
                            RTCS0203 D
                    WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER1)
                    AND     C.PRS_DCD  = 'B00004'
                    AND     C.ORD_NO   = D.ORD_NO(+)
                    AND     D.STRG_YN(+)  = 'Y' 
                    ) C
            WHERE   STRG_SEQ = MAX_STRG_SEQ
            UNION   ALL
            SELECT C.ORD_NO, 'B00000' PRS_DCD, TO_NUMBER(C.CNT_CD) SERV_CNT0, 0 SERV_CNTR,
                   C.PROC_DAY, C.AGENCY_CD PROC_IN_CD, C.STAT_CD
            FROM RTSD0108 C
            WHERE C.ORD_NO IN (SELECT ORD_NO FROM RTTMORDER1)
            ) C
    UNION ALL       
/*  장착완료 - 사업자 */
    SELECT  C.ORD_NO,                                                      /*계약번호            */
            C.PRS_DCD,                                                     /*상세서비스 코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', C.PRS_DCD) PRS_NM,    /*상세서비스          */
            C.SERV_CNT0,                                                   /*서비스횟수(최초)    */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN NVL(C.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00004' THEN NVL(C.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(C.ORD_NO)
              ELSE C.SERV_CNTR          
            END AS SERV_CNTR,   /*서비스횟수(잔여)    */
            DECODE(C.PROC_DAY,'','',
                   SUBSTR(C.PROC_DAY,1,4)||'-'||SUBSTR(C.PROC_DAY,5,2)||'-'||
                   SUBSTR(C.PROC_DAY,7,2))                    PROC_DAY,    /*서비스일자          */
            C.PROC_IN_CD,
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C.PROC_IN_CD)      PROC_IN_NM,   /*처리자              */
            CASE
              WHEN C.PRS_DCD = 'B00000' THEN Pkg_Rtcm0051.f_sRtcm0051CodeName('S032', STAT_CD)
              WHEN C.PRS_DCD = 'B00001' THEN Pkg_Rtcs0009.f_sRtcs0009DlvrStat(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00007' THEN Pkg_Rtcs0010.f_sRtcs0010DlvrStat(C.ORD_NO)
              ELSE 
                    CASE WHEN NVL(C.SERV_CNT0,0) = NVL(C.SERV_CNTR,0) THEN '' ELSE '처리완료' END  
            END DLVR_STAT_NM
    FROM    (    
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    D.PROC_DAY, D.PROC_IN_CD, '' STAT_CD       
            FROM    (
                    SELECT  MAX_SERV_SEQ, ORD_NO, PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT, REG_ID, REG_DT, CHG_ID, CHG_DT, 
                            DECODE(SERV_SEQ,0,NULL,SERV_SEQ) AS SERV_SEQ, SEQ, SERVICE_CD
                    FROM    (                
                            SELECT  D.SERV_SEQ MAX_SERV_SEQ,
                                    C.*, 
                                    NVL(D.SERV_SEQ,0) SERV_SEQ, D.SEQ, D.SERVICE_CD
                            FROM    RTSD0013 C,
                                    RTCS0008 D
                            WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER2)
                            AND     C.PRS_DCD != 'B00004'
                            AND     C.ORD_NO   = D.ORD_NO(+)
                            AND     C.PRS_DCD  = D.SERVICE_CD(+)   
                            ) 
                    ) C, 
                    RTCS0007 D
            WHERE   C.ORD_NO       = D.ORD_NO(+)
            AND     C.MAX_SERV_SEQ = D.SERV_SEQ(+)  
            UNION   ALL
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    C.PROC_DAY, C.PROC_IN_CD, '' STAT_CD 
            FROM    (
                    SELECT  MAX(NVL(D.STRG_SEQ,0)) OVER(PARTITION BY D.ORD_NO) MAX_STRG_SEQ,
                            C.*, 
                            NVL(D.STRG_SEQ,0) STRG_SEQ, 
                            D.AGENCY_CD AS PROC_IN_CD, 
                            D.STRG_DAY AS PROC_DAY
                    FROM    RTSD0013 C,
                            RTCS0203 D
                    WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER2)
                    AND     C.PRS_DCD  = 'B00004'
                    AND     C.ORD_NO   = D.ORD_NO(+)
                    AND     D.STRG_YN(+)  = 'Y' 
                    ) C
            WHERE   STRG_SEQ = MAX_STRG_SEQ
            UNION   ALL
            SELECT C.ORD_NO, 'B00000' PRS_DCD, TO_NUMBER(C.CNT_CD) SERV_CNT0, 0 SERV_CNTR,
                   C.PROC_DAY, C.AGENCY_CD PROC_IN_CD, C.STAT_CD 
            FROM RTSD0108 C
            WHERE C.ORD_NO IN (SELECT ORD_NO FROM RTTMORDER2)
            ) C
    UNION ALL
/***** 장착안됨(온라인) *********************************************************************************/
/*  장착안된 건(온라인) - 개인 */
    SELECT  C.ORD_NO,                                                      /*계약번호            */
            C.PRS_DCD,                                                     /*상세서비스 코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', C.PRS_DCD) PRS_NM,    /*상세서비스          */
            C.SERV_CNT0,                                                   /*서비스횟수(최초)    */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN NVL(C.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00004' THEN NVL(C.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(C.ORD_NO)
              ELSE C.SERV_CNTR          
            END AS SERV_CNTR,   /*서비스횟수(잔여)    */
            DECODE(C.PROC_DAY,'','',
                   SUBSTR(C.PROC_DAY,1,4)||'-'||SUBSTR(C.PROC_DAY,5,2)||'-'||
                   SUBSTR(C.PROC_DAY,7,2))                    PROC_DAY,    /*서비스일자          */
            C.PROC_IN_CD,
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C.PROC_IN_CD)      PROC_IN_NM,   /*처리자              */
            CASE
              WHEN C.PRS_DCD = 'B00000' THEN Pkg_Rtcm0051.f_sRtcm0051CodeName('S032', STAT_CD)
              WHEN C.PRS_DCD = 'B00001' THEN Pkg_Rtcs0009.f_sRtcs0009DlvrStat(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00007' THEN Pkg_Rtcs0010.f_sRtcs0010DlvrStat(C.ORD_NO)
              ELSE 
                    CASE WHEN NVL(C.SERV_CNT0,0) = NVL(C.SERV_CNTR,0) THEN '' ELSE '처리완료' END        
            END DLVR_STAT_NM
    FROM    (    
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    D.PROC_DAY, D.PROC_IN_CD, '' STAT_CD       
            FROM    (
                    SELECT  MAX_SERV_SEQ, ORD_NO, PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT, REG_ID, REG_DT, CHG_ID, CHG_DT, 
                            DECODE(SERV_SEQ,0,NULL,SERV_SEQ) AS SERV_SEQ, SEQ, SERVICE_CD
                    FROM    (                
                            SELECT  D.SERV_SEQ MAX_SERV_SEQ,
                                    C.*, 
                                    NVL(D.SERV_SEQ,0) SERV_SEQ, D.SEQ, D.SERVICE_CD
                            FROM    RTSD0013 C,
                                    RTCS0008 D
                            WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER3)
                            AND     C.PRS_DCD != 'B00004'
                            AND     C.ORD_NO   = D.ORD_NO(+)
                            AND     C.PRS_DCD  = D.SERVICE_CD(+)   
                            ) 
                    ) C, 
                    RTCS0007 D
            WHERE   C.ORD_NO       = D.ORD_NO(+)
            AND     C.MAX_SERV_SEQ = D.SERV_SEQ(+)  
            UNION   ALL
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    C.PROC_DAY, C.PROC_IN_CD, '' STAT_CD 
            FROM    (
                    SELECT  MAX(NVL(D.STRG_SEQ,0)) OVER(PARTITION BY D.ORD_NO) MAX_STRG_SEQ,
                            C.*, 
                            NVL(D.STRG_SEQ,0) STRG_SEQ, 
                            D.AGENCY_CD AS PROC_IN_CD, 
                            D.STRG_DAY AS PROC_DAY
                    FROM    RTSD0013 C,
                            RTCS0203 D
                    WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER3)
                    AND     C.PRS_DCD  = 'B00004'
                    AND     C.ORD_NO   = D.ORD_NO(+)
                    AND     D.STRG_YN(+)  = 'Y' 
                    ) C
            WHERE   STRG_SEQ = MAX_STRG_SEQ
            UNION   ALL
            SELECT C.ORD_NO, 'B00000' PRS_DCD, TO_NUMBER(C.CNT_CD) SERV_CNT0, 0 SERV_CNTR,
                   C.PROC_DAY, C.AGENCY_CD PROC_IN_CD, C.STAT_CD 
            FROM RTSD0104 C
            WHERE C.ORD_NO IN (SELECT ORD_NO FROM RTTMORDER3)
            ) C
    UNION ALL
/*  장착완료 - 사업자 */
    SELECT  C.ORD_NO,                                                      /*계약번호            */
            C.PRS_DCD,                                                     /*상세서비스 코드     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', C.PRS_DCD) PRS_NM,    /*상세서비스          */
            C.SERV_CNT0,                                                   /*서비스횟수(최초)    */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN NVL(C.SERV_CNTR,0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00004' THEN NVL(C.SERV_CNT0,0) - Pkg_Rtcs0203.f_sRtcs0203ServCnt(C.ORD_NO)
              ELSE C.SERV_CNTR          
            END AS SERV_CNTR,   /*서비스횟수(잔여)    */
            DECODE(C.PROC_DAY,'','',
                   SUBSTR(C.PROC_DAY,1,4)||'-'||SUBSTR(C.PROC_DAY,5,2)||'-'||
                   SUBSTR(C.PROC_DAY,7,2))                    PROC_DAY,    /*서비스일자          */
            C.PROC_IN_CD,
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C.PROC_IN_CD)      PROC_IN_NM,   /*처리자              */
            CASE
              WHEN C.PRS_DCD = 'B00001' THEN Pkg_Rtcs0009.f_sRtcs0009DlvrStat(C.ORD_NO)
              WHEN C.PRS_DCD = 'B00007' THEN Pkg_Rtcs0010.f_sRtcs0010DlvrStat(C.ORD_NO)
              ELSE 
                    CASE WHEN NVL(C.SERV_CNT0,0) = NVL(C.SERV_CNTR,0) THEN '' ELSE '처리완료' END
            END DLVR_STAT_NM
    FROM    (    
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    D.PROC_DAY, D.PROC_IN_CD, '' STAT_CD       
            FROM    (
                    SELECT  MAX_SERV_SEQ, ORD_NO, PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT, REG_ID, REG_DT, CHG_ID, CHG_DT, 
                            DECODE(SERV_SEQ,0,NULL,SERV_SEQ) AS SERV_SEQ, SEQ, SERVICE_CD
                    FROM    (                
                            SELECT  D.SERV_SEQ MAX_SERV_SEQ,
                                    C.*, 
                                    NVL(D.SERV_SEQ,0) SERV_SEQ, D.SEQ, D.SERVICE_CD
                            FROM    RTSD0013 C,
                                    RTCS0008 D
                            WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER4)
                            AND     C.PRS_DCD != 'B00004'
                            AND     C.ORD_NO   = D.ORD_NO(+)
                            AND     C.PRS_DCD  = D.SERVICE_CD(+)   
                            ) 
                    ) C, 
                    RTCS0007 D
            WHERE   C.ORD_NO       = D.ORD_NO(+)
            AND     C.MAX_SERV_SEQ = D.SERV_SEQ(+)  
            UNION   ALL
            SELECT  C.ORD_NO, C.PRS_DCD, C.SERV_CNT0, C.SERV_CNTR, 
                    C.PROC_DAY, C.PROC_IN_CD, '' STAT_CD 
            FROM    (
                    SELECT  MAX(NVL(D.STRG_SEQ,0)) OVER(PARTITION BY D.ORD_NO) MAX_STRG_SEQ,
                            C.*, 
                            NVL(D.STRG_SEQ,0) STRG_SEQ, 
                            D.AGENCY_CD AS PROC_IN_CD, 
                            D.STRG_DAY AS PROC_DAY
                    FROM    RTSD0013 C,
                            RTCS0203 D
                    WHERE   C.ORD_NO  IN (SELECT ORD_NO FROM RTTMORDER4)
                    AND     C.PRS_DCD  = 'B00004'
                    AND     C.ORD_NO   = D.ORD_NO(+)
                    AND     D.STRG_YN(+)  = 'Y' 
                    ) C
            WHERE   STRG_SEQ = MAX_STRG_SEQ
            UNION   ALL
            SELECT C.ORD_NO, 'B00000' PRS_DCD, TO_NUMBER(C.CNT_CD) SERV_CNT0, 0 SERV_CNTR,
                   C.PROC_DAY, C.AGENCY_CD PROC_IN_CD, C.STAT_CD 
            FROM RTSD0104 C
            WHERE C.ORD_NO IN (SELECT ORD_NO FROM RTTMORDER4)
            ) C
    ORDER BY 1, 2;

  END p_sRtsd0013OnlineListNew;

  /*****************************************************************************
  -- 계약별 프리미엄서비스 관리(IUD) 일시불
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0013Direct (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt0      IN RTSD0013.SERV_CNT0%TYPE,      /*서비스횟수(최초)      */
    v_Serv_Cntr      IN RTSD0013.SERV_CNTR%TYPE,      /*서비스횟수(잔여)      */
    v_Serv_Amt       IN RTSD0013.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계약번호, 프리미엄서비스,상세서비스, 타이어본수, 사용여부, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;



    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0013(v_Ord_No, v_Ps_Cd, v_Prs_Dcd, v_Cnt_Cd,
                                 v_Serv_Cnt0, v_Serv_Cntr, v_Serv_Amt, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := '계약별 프리미엄서비스 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_IUDRtsd0013Direct(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_IUDRtsd0013Direct(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0013Direct;


  /*****************************************************************************
  -- 계약별 프리미엄서비스 관리(IUD) 멤버십
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0013Member (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Ps_Cd          IN RTSD0013.PS_CD%TYPE,          /*프리미엄서비스        */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Cnt_Cd         IN RTSD0013.CNT_CD%TYPE,         /*타이어본수            */
    v_Serv_Cnt0      IN RTSD0013.SERV_CNT0%TYPE,      /*서비스횟수(최초)      */
    v_Serv_Cntr      IN RTSD0013.SERV_CNTR%TYPE,      /*서비스횟수(잔여)      */
    v_Serv_Amt       IN RTSD0013.SERV_AMT%TYPE,       /*추가렌탈료            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계약번호, 프리미엄서비스,상세서비스, 타이어본수, 사용여부, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;



    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0013(v_Ord_No, v_Ps_Cd, v_Prs_Dcd, v_Cnt_Cd,
                                 v_Serv_Cnt0, v_Serv_Cntr, v_Serv_Amt, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := '계약별 프리미엄서비스 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_IUDRtsd0013Direct(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_IUDRtsd0013Direct(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0013Member;
  

  /*****************************************************************************
  --프리미엄서비스 저장 - 온라인
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0013OrdSale (
      v_Ord_No          IN RTSD0014.ORD_NO%TYPE          /*주문번호        */
    , v_Sale_cd         IN RTSD0020.SALE_CD%TYPE         /*판매상품코드    */
    , v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE       /*기간            */
    , v_Cnt_Cd          IN RTSD0012.CNT_CD%TYPE          /*타이어갯수      */
    , v_Reg_Id          IN RTSD0013.REG_ID%TYPE          /*등록자 ID       */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.F_SRTSD0104COUNT(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '계약기간('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (0 != f_sRtsd0013ChkServAmt(v_Ord_No)) THEN
        v_Return_Message := '프리미엄 서비스 가격 불일치로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    

    INSERT  INTO RTSD0013 (
            ORD_NO,
            PS_CD,
            PRS_DCD,
            CNT_CD,
            SERV_CNT0,
            SERV_CNTR,
            SERV_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
      SELECT 
         v_Ord_No,                                                                       /* 주문번호 */
         '999999',
         AA.PRS_DCD,                                                                     /* 프리미엄 서비스 코드 */
         BB.CNT_CD,                                                                      /* 본수 */
         BB.SERV_CNT,                                                                    /* 프리미엄 서비스별 제공 횟수 */
         BB.SERV_CNT,                                                                    /* 프리미엄 서비스별 제공 횟수 */
         DECODE(BB.SERV_CNT, 1,  AA.SERV_AMT_1,
                                 2,  AA.SERV_AMT_2,
                                 3,  AA.SERV_AMT_3,
                                 4,  AA.SERV_AMT_4,
                                 5,  AA.SERV_AMT_5,
                                 6,  AA.SERV_AMT_6,
                                 7,  AA.SERV_AMT_7,
                                 8,  AA.SERV_AMT_8,
                                 9,  AA.SERV_AMT_9,
                                 10, AA.SERV_AMT_10,
                                 12, AA.SERV_AMT_12,
                                 18, AA.SERV_AMT_18,
                                 24, AA.SERV_AMT_24) AS LAST_SERV_AMT, /* 프리미엄 서비스별 최종 금액 */
         v_Reg_Id,
         SYSDATE,
         v_Reg_Id,
         SYSDATE
      FROM 
          (SELECT A.SALE_CD, 
                  A.PRS_DCD, 
                  A.SERV_INF_YN,
                  B.SERV_INF_AMT AS SERV_INF_AMT,
                  B.SERV_AMT_1,
                  B.SERV_AMT_2,
                  B.SERV_AMT_3,
                  B.SERV_AMT_4,
                  B.SERV_AMT_5,
                  B.SERV_AMT_6,
                  B.SERV_AMT_7,
                  B.SERV_AMT_8,
                  B.SERV_AMT_9,
                  B.SERV_AMT_10,
                  B.SERV_AMT_12,
                  B.SERV_AMT_18,
                  B.SERV_AMT_24                         
             FROM RTSD0028 A, 
                  (
                      SELECT
                          T.PRS_DCD 
                          ,T.PERIOD_CD
                          ,T.SEQ    --[20191001_01] SEQ컬럼 추가
                          ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                          ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                          ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                          ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                          ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                          ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                          ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                          ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                          ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                          ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                          ,MAX(DECODE(T.SERV_CNT, 12, T.SERV_AMT)) AS SERV_AMT_12
                          ,MAX(DECODE(T.SERV_CNT, 18, T.SERV_AMT)) AS SERV_AMT_18
                          ,MAX(DECODE(T.SERV_CNT, 24, T.SERV_AMT)) AS SERV_AMT_24
                          ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                      FROM RTSD0043 T
                      WHERE 1=1
                      AND T.PERIOD_CD = DECODE(v_Period_Cd, NULL, T.PERIOD_CD, v_Period_Cd)
                      GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼 추가
                  ) B
                  
            WHERE A.PRS_DCD = B.PRS_DCD
            AND A.SEQ = B.SEQ) AA,  --[20191001_01] SEQ컬럼 추가   
          (SELECT PS_CD,
                  PRS_DCD,
                  PERIOD_CD,         
                  CNT_CD,
                  MAX(SERV_CNT) SERV_CNT
             FROM RTSD0012
            WHERE SERV_CNT != 0 
              AND USE_YN = 'Y' 
            GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
      WHERE AA.PRS_DCD           = BB.PRS_DCD
       AND AA.SALE_CD           = v_Sale_cd          /* 판매상품코드    */
       AND AA.SALE_CD           = BB.PS_CD
       AND BB.PERIOD_CD         = v_Period_Cd        /* 납부기간        */
       AND TO_NUMBER(BB.CNT_CD) = v_Cnt_Cd;           /* 타이어본수      */      

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
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_InsertRtsd0013OrdSale(1)', v_ErrorText, v_Return_Message);

  WHEN OTHERS THEN
    ROLLBACK;
    v_Success_code := -1;
    v_Return_Message := v_Return_Message;
    v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0013.p_InsertRtsd0013OrdSale(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0013OrdSale;
  

  /*****************************************************************************
  -- 프리미엄 서비스 금액 비교 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0013ChkServAmt(
    v_Ord_No          IN RTSD0014.ORD_NO%TYPE          /*주문번호        */
  ) RETURN NUMBER IS
    
    v_Chk_Yn   NUMBER;
  BEGIN

        --[20191001_01] 서비스 수수료 상품별 분리작업
        SELECT 
          CASE WHEN SS.SERV_AMT != SS.CHK_SERV_AMT THEN 1
          ELSE 0
          END AS CHK_SERV_AMT
          INTO v_Chk_Yn
        FROM (
            SELECT
              CASE WHEN SUM(S.GROUP_SALE_1) = 0 THEN NVL(SUM(S.SERV_AMT),0) - NVL(SUM(S.CHNL_SALE_1),0)
              ELSE NVL(SUM(S.SERV_AMT),0) - NVL(SUM(S.GROUP_SALE_1),0)
              END AS SERV_AMT,
              CASE WHEN SUM(S.GROUP_SALE_1) = 0 THEN NVL(SUM(S.CHK_SERV_AMT),0) - NVL(SUM(S.CHNL_SALE_1),0)
              ELSE NVL(SUM(S.CHK_SERV_AMT),0) - NVL(SUM(S.GROUP_SALE_1),0)
              END AS CHK_SERV_AMT
            FROM (
                SELECT 
                  G.SERV_AMT,
                  G.CHK_SERV_AMT,
                  NVL((SELECT CASE WHEN A.PRDT_GRP_DTL = '03' THEN
                               CASE WHEN A.DC_RATE = 0 THEN 0
                               ELSE TRUNC(G.CHK_SERV_AMT * A.DC_RATE/100 )
                               END
                          END
                   FROM RTSD0020 A WHERE A.SALE_CD = (SELECT AA.SALE_CD FROM RTSD0104 AA WHERE AA.ORD_NO = G.ORD_NO)),0) AS GROUP_SALE_1,
                  NVL((SELECT CASE WHEN A.PRDT_GRP_DTL IS NULL OR A.PRDT_GRP_DTL != '03' THEN
                               CASE WHEN A.DC_RATE = 0 THEN 0
                               ELSE TRUNC(G.CHK_SERV_AMT * A.DC_RATE/100 )
                               END
                          END
                   FROM RTSD0020 A WHERE A.SALE_CD = (SELECT AA.SALE_CD FROM RTSD0104 AA WHERE AA.ORD_NO = G.ORD_NO)),0) AS CHNL_SALE_1
                FROM (
                    SELECT 
                       T.ORD_NO,
                       T.SERV_CNT0,
                       T.SERV_AMT,
                       T.PRS_DCD,
                       CASE WHEN T.SERV_CNT0 = '999' THEN (SELECT A.SERV_INF_AMT   
                                                           FROM RTSD0043 A, RTSD0028 B, RTSD0104 C 
                                                           WHERE A.PRS_DCD = T.PRS_DCD
                                                           AND A.SEQ = B.SEQ
                                                           AND B.SALE_CD = B.SALE_CD
                                                           AND C.ORD_NO = T.ORD_NO
                                                           AND A.PERIOD_CD = C.PERIOD_CD
                                                           AND ROWNUM = 1)
                       ELSE  (SELECT A.SERV_AMT  
                              FROM RTSD0043 A, RTSD0028 B, RTSD0104 C 
                              WHERE A.PRS_DCD = T.PRS_DCD
                              AND A.SEQ = B.SEQ
                              AND B.SALE_CD = B.SALE_CD
                              AND C.ORD_NO = T.ORD_NO
                              AND A.PERIOD_CD = C.PERIOD_CD
                              AND A.SERV_CNT = T.SERV_CNT0) 
                       END AS CHK_SERV_AMT
                    FROM RTSD0013 T
                    WHERE ORD_NO = v_Ord_No
                ) G         
            ) S
        ) SS;            
        
    RETURN v_Chk_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0013ChkServAmt;
  
  /*****************************************************************************
  -- 계약별 프리미엄서비스 Update - 서비스 횟수 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0013ServCnt0 (
    v_Ord_No         IN RTSD0013.ORD_NO%TYPE,         /*계약번호              */
    v_Prs_Dcd        IN RTSD0013.PRS_DCD%TYPE,        /*상세서비스            */
    v_Reg_Id         IN RTSD0013.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

        UPDATE RTSD0013
        SET    SERV_CNT0 = DECODE(SERV_CNT0,0,0,SERV_CNT0 + 1),
                SERV_CNTR = SERV_CNTR + 1,
                CHG_ID    = v_Reg_Id,
                CHG_DT    = SYSDATE
        WHERE  ORD_NO    = v_Ord_No
        AND    PRS_DCD   = v_Prs_Dcd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0013ServCnt0;  
  
END Pkg_Rtsd0013;
/