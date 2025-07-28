CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0430 AS
/*******************************************************************************
    NAME        Pkg_RTSD0430
    PURPOSE     주문취소등록내역
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-16  kstka            [20210916_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 주문취소사유등록내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-16  kstka            [20210916_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0430 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTSD0430.ORD_NO%TYPE                  /*주문번호             */
    , v_Cust_No         IN RTSD0100.CUST_NO%TYPE                 /*고객번호             */
    , v_Canc_Cd         IN RTSD0430.CANC_CD%TYPE                 /*취소사유             */
    , v_Canc_Day_F      IN RTSD0430.CANC_DAY%TYPE                /*취소일자             */
    , v_Canc_Day_T      IN RTSD0430.CANC_DAY%TYPE
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.ORD_NO
    ,  D.CUST_NO
    ,  D.CUST_NM
    ,  C.ORD_DAY
    ,  C.PROC_DAY
    ,  A.CANC_DAY
    ,  A.CANC_CD
    ,  B.CD_NM AS CANC_CD_NM
    ,  A.REG_ID
    ,  A.REG_DT
    FROM RTSD0430 A
    ,    RTCM0051 B
    ,    RTSD0104 C
    ,    RTSD0100 D
    WHERE 1=1
    AND A.ORD_NO = C.ORD_NO(+)
    AND C.CUST_NO = D.CUST_NO
    AND A.ORD_NO = DECODE(v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
    AND D.CUST_NO = DECODE(v_Cust_No, NULL, D.CUST_NO, v_Cust_No)
    AND (v_Canc_Day_F IS NULL OR A.CANC_DAY BETWEEN v_Canc_Day_F AND v_Canc_Day_T)
    AND A.CANC_CD = DECODE(v_Canc_Cd, NULL, A.CANC_CD, v_Canc_Cd)
    AND A.CANC_CD = B.CD(+)
    AND B.CD_GRP_CD(+) = 'S308'
    ORDER BY A.ORD_NO
    ;

  END p_sRTSD0430; 
  
  /*****************************************************************************
  -- 주문취소사유등록(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-16  kstka            [20210916_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0430 (
      v_Comm_Dvsn       IN CHAR                                 /*처리구분(I,U,D)      */
    , v_Ord_No          IN RTSD0430.ORD_NO%TYPE                 /*주문번호             */
    , v_Canc_Day        IN RTSD0430.CANC_DAY%TYPE               /*취소일자             */
    , v_Canc_Cd         IN RTSD0430.CANC_CD%TYPE                /*취소사유             */
    , v_Reg_Id          IN RTSD0430.REG_ID%TYPE                 /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS 
  e_Error EXCEPTION;
  
  v_Seq NUMBER;
  
  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
        
        IF 0 != f_InsertRTSD0430(
              v_Ord_No 
            , v_Canc_Day   
            , v_Canc_Cd 
            , v_Reg_Id         
            , v_ErrorText
        ) THEN
            v_Return_Message := '방문점검 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

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

  END p_IUDRTSD0430;
   
  /*****************************************************************************
  -- 주문취소사유등록 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-16  kstka            [20210916_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRTSD0430 (
      v_Ord_No          IN RTSD0430.ORD_NO%TYPE                 /*주문번호             */
    , v_Canc_Day        IN RTSD0430.CANC_DAY%TYPE               /*취소일자             */
    , v_Canc_Cd         IN RTSD0430.CANC_CD%TYPE                /*취소코드             */
    , v_Reg_Id          IN RTSD0430.REG_ID%TYPE                 /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTSD0430 (
          ORD_NO
        , CANC_DAY
        , CANC_CD
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    ) VALUES (
          v_Ord_No   
        , v_Canc_Day 
        , v_Canc_Cd  
        , v_Reg_Id            
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRTSD0430;
  
END Pkg_RTSD0430;