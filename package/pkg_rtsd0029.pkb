CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0029 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0029
   PURPOSE:  등록비관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-23  sePark             1. Created this package body.
*******************************************************************************/
 
  /*****************************************************************************
  -- 등록비관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0029 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0029.SALE_CD%TYPE           /* 판매코드         */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.SALE_CD,                          /* 판매코드   */
            A.CNT_CD,                           /* 타이어본수 */
            NVL(A.AMT,0) AS AMT,                /* 금액       */
            A.REG_DT,                           /* 등록일     */
            A.REG_ID,                           /* 등록자 ID  */
            A.CHG_ID,                           /* 변경자 ID  */
            A.CHG_DT                            /* 변경일     */
    FROM    RTSD0029    A
    WHERE   A.SALE_CD   = DECODE(v_Sale_Cd, NULL, A.SALE_CD, v_Sale_Cd)
    ORDER BY A.SALE_CD, A.CNT_CD;
    
  END p_sRtsd0029;


  /*****************************************************************************
  -등록비관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* 판매코드         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN
    
    INSERT  INTO RTSD0029 (
            SALE_CD,
            CNT_CD,
            AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Sale_Cd,
            v_Cnt_Cd,
            v_Amt,
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

  END f_InsertRtsd0029;


  /*****************************************************************************
  -등록비관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* 판매코드         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN
    
    UPDATE RTSD0029
    SET    AMT          = v_Amt,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  SALE_CD      = v_Sale_Cd
    AND    CNT_CD       = v_Cnt_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0029;


  /*****************************************************************************
  -등록비관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0029 (
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* 판매코드         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0029
    WHERE  SALE_CD      = v_Sale_Cd
    AND    CNT_CD       = v_Cnt_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0029;

  /*****************************************************************************
  -등록비관리 DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0030DbCopy (
    v_Cnt_Cd            IN RTSD0030.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0030.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0030.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0030 (
            RTSD0030_SEQ,
            CNT_CD,
            AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            'SP'||LPAD(SEQ_RTSD0030RTSD0030_SEQ.NEXTVAL, 7, 0),
            v_Cnt_Cd,
            v_Amt,
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

  END f_InsertRtsd0030DbCopy;


  /*****************************************************************************
  --등록비관리 (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0029 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)  */
    v_Sale_Cd           IN RTSD0029.SALE_CD%TYPE,           /* 판매코드         */
    v_Cnt_Cd            IN RTSD0029.CNT_CD%TYPE,            /* 타이어본수       */
    v_Amt               IN RTSD0029.AMT%TYPE,               /* 금액             */
    v_Reg_Id            IN RTSD0029.REG_ID%TYPE,            /* 등록자 ID        */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ) IS

  e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0029(v_Sale_Cd, v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록비관리 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
       
        IF 0 != f_InsertRtsd0030DbCopy(v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록비관리 Db Copy 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
        
    ELSIF v_Comm_Dvsn = 'U' THEN
        
        IF 0 != f_UpdateRtsd0029(v_Sale_Cd, v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록비관리 수정 실패!!!'||'-'||v_ErrorText;    
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF 0 != f_InsertRtsd0030DbCopy(v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록비관리 Db Copy 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    

    ELSIF v_Comm_Dvsn = 'D' THEN
        
        IF 0 != f_DeleteRtsd0029(v_Sale_Cd, v_Cnt_Cd, v_Amt, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '등록비관리 삭제 실패!!!'||'-'||v_ErrorText;    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0029.p_IUDRtsd0029(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0029.p_IUDRtsd0029(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0029; 
  

  /*****************************************************************************
  -- 주문등록 판매코드에 따른 등록비 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0029RegAmtInfo (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0029.SALE_CD%TYPE           /* 판매코드         */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  NVL(A.AMT,0) AS CD,                       /* 금액       */
            NVL(A.AMT,0) AS CD_NM                     /* 금액       */
    FROM    RTSD0029    A
    WHERE   A.SALE_CD   = DECODE(v_Sale_Cd, NULL, A.SALE_CD, v_Sale_Cd)
    ORDER BY A.SALE_CD, A.CNT_CD;
    
  END p_sRtsd0029RegAmtInfo;
  

END Pkg_Rtsd0029;
/
