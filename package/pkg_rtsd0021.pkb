CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0021 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0021
   PURPOSE:  판매제품정보  
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-22  sePark         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 판매주제품(타이어) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0021 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0021.SALE_CD%TYPE,         /* 판매코드  */
    v_Gds_Gb        IN     RTSD0021.GDS_GB%TYPE           /* 제품구분  */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.SALE_CD,     /* 판매코드                 */
            A.SALE_GDS_CD, /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드  */
            A.GDS_GB,      /* 제품구분                 */
            A.GDS_GRP,     /* 제품군                   */
            A.REG_DT,      /* 등록일                   */
            A.REG_ID,      /* 등록자 ID                */
            A.CHG_ID,      /* 변경자 ID                */
            A.CHG_DT       /* 변경일                   */
    FROM    RTSD0021    A
    WHERE   A.SALE_CD = DECODE(v_Sale_Cd, NULL, A.SALE_CD, v_Sale_Cd)
    AND     A.GDS_GB  = DECODE(v_Gds_Gb, NULL, A.GDS_GB, v_Gds_Gb)
    ORDER BY A.SALE_GDS_CD;
  END p_sRtsd0021;

  /*****************************************************************************
  -- 판매부가제품(결합상품) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0021SaleProd (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0021.SALE_CD%TYPE,         /* 판매코드  */
    v_Gds_Gb        IN     RTSD0021.GDS_GB%TYPE           /* 제품구분  */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT
     T.SALE_CD,                                     /* 판매코드      */   
     T1.ADD_GDS_CD,                                 /* 부가제품코드  */
     T1.ADD_GDS_NM,                                 /* 부가제품명    */
     NVL(T1.AMT,0) AS AMT,                          /* 금액          */
     T1.MAKER_NM,                                   /* 제조사        */
     T1.GDS_GB,                                     /* 제품구분      */
     T1.GDS_DESC,                                   /* 제품설명      */
     T1.GDS_DESC_DT,                                /* 제품상세설명  */
     T1.REG_ID,                                     /* 등록자 ID     */
     T1.REG_DT,                                     /* 등록일        */
     T1.CHG_ID,                                     /* 변경자 ID     */
     T1.CHG_DT,                                     /* 변경일        */
     T1.GDS_GRP,                                    /* 제품군        */
     T1.USE_YN,                                     /* 사용여부      */
     NVL(T1.DC_AMT,0) AS DC_AMT,                    /* 할인금액      */
     NVL(T1.AMT, 0) - NVL(T1.DC_AMT, 0) AS ACT_AMT, /* 실판매금액    */
     T1.DC_YN                                       /* 할부여부     */
    FROM RTSD0021 T, RTSD0023 T1
    WHERE T.SALE_GDS_CD = T1.ADD_GDS_CD
    AND   T.SALE_CD = DECODE(v_Sale_Cd, NULL, T.SALE_CD, v_Sale_Cd)
    AND   T.GDS_GB  = DECODE(v_Gds_Gb, NULL, T.GDS_GB, v_Gds_Gb)
    ORDER BY T.SALE_GDS_CD;
  END p_sRtsd0021SaleProd;

  /*****************************************************************************
  -판매제품정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* 제품군 */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    
    INSERT  INTO RTSD0021 (
            SALE_CD,
            SALE_GDS_CD,
            GDS_GB,
            GDS_GRP,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Sale_Cd,
            v_Sale_Gds_Cd,
            v_Gds_Gb,
            v_Gds_Grp,
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

  END f_InsertRtsd0021;

  /*****************************************************************************
  -판매제품정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* 제품군 */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    
    UPDATE RTSD0021
    SET    GDS_GRP      = v_Gds_Grp,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  SALE_CD      = v_Sale_Cd
    AND    SALE_GDS_CD  = v_Sale_Gds_Cd
    AND    GDS_GB       = v_Gds_Gb;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0021;


  /*****************************************************************************
  -판매제품정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0021 (
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* 제품군 */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0021
    WHERE  SALE_CD      = v_Sale_Cd
    AND    SALE_GDS_CD  = v_Sale_Gds_Cd
    AND    GDS_GB       = v_Gds_Gb;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0021;


  /*****************************************************************************
  --판매제품정보 (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0021 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)*/
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Gds_Grp           IN RTSD0021.GDS_GRP%TYPE,           /* 제품군 */
    v_Reg_Id            IN RTSD0021.REG_ID%TYPE,            /* 등록자 ID      */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ) IS

  e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0021(v_Sale_Cd, v_Sale_Gds_Cd, v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '판매제품정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
       
        
    ELSIF v_Comm_Dvsn = 'U' THEN
        
        IF 0 != f_UpdateRtsd0021(v_Sale_Cd, v_Sale_Gds_Cd, v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '판매제품정보 수정 실패!!!'||'-'||v_ErrorText;    
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSIF v_Comm_Dvsn = 'D' THEN
        
        IF 0 != f_DeleteRtsd0021(v_Sale_Cd, v_Sale_Gds_Cd, v_Gds_Gb, v_Gds_Grp, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '판매제품정보 삭제 실패!!!'||'-'||v_ErrorText;    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0021.p_IUDRtsd0021(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0021.p_IUDRtsd0021(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0021; 

  /*****************************************************************************
  -- 판매제품정보 제품구분에 따른 삭제
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0021DeleteGdsGb(
    v_Sale_Cd           IN RTSD0021.SALE_CD%TYPE,           /* 판매코드       */
    v_Sale_Gds_Cd       IN RTSD0021.SALE_GDS_CD%TYPE,       /* 타이어일 경우 패턴코드, 서비스일 경우 서비스, 부가제품일 경우 부가제품코드       */
    v_Gds_Gb            IN RTSD0021.GDS_GB%TYPE,            /* 제품구분       */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS
  
    e_Error EXCEPTION;
    
  BEGIN
        
    DELETE FROM RTSD0021
    WHERE  SALE_CD      = v_Sale_Cd
    AND    GDS_GB       = v_Gds_Gb;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0021.p_UpdateRtsd0021DeleteGdsGb(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0021.p_UpdateRtsd0021DeleteGdsGb(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtsd0021DeleteGdsGb;
  
END Pkg_Rtsd0021;