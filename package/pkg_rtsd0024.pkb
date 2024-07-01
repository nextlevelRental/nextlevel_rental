CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0024 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0024
   PURPOSE:   할인등록
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-12  sePark         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 할인등록 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0024 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Dc_Gb         IN     RTSD0024.DC_GB%TYPE         /* 할인구분코드            */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  CASE WHEN T.DC_GB IS NULL THEN T1.CD
            ELSE T.DC_GB
            END DC_GB,                                                      /* 할인구분코드  */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S207', T1.CD) DC_NM,          /* 할인구분명    */
            T.STD_STR_DAY,                                                  /* 할인시작일    */
            CASE WHEN T.DC_RATE IS NULL THEN ''
            ELSE RTRIM(TO_CHAR(T.DC_RATE,'FM9990D99'),'.')||'%' 
            END AS DC_RATE,      /* 할인율        */
            T.DC_AMT,                                                       /* 할인금액      */
            T.MLT_DC_YN,                                                    /* 중복할인여부  */
            T.DC_DTL_YN,                                                    /* 할인상세여부) */
            CASE WHEN T.DC_DTL_YN = 'Y' THEN 'Y'
            ELSE 'N'
            END AS DC_DTL_YN_CHK,                                           /* 할인상세여부(팝업창) */
            T.STD_END_DAY,                                                  /* 할인종료일    */
            T.REG_DT,                                                       /* 등록일        */
            T.REG_ID,                                                       /* 등록자 ID     */
            T.CHG_ID,                                                       /* 변경자 ID     */
            T.CHG_DT                                                        /* 변경일        */
    FROM RTSD0024 T, RTCM0051 T1
    WHERE T.DC_GB(+) = T1.CD
    AND T1.CD IN ('A','C','E')
    AND T1.CD_GRP_CD = 'S207'
    AND T1.CD = DECODE(v_Dc_Gb, NULL, T1.CD, v_Dc_Gb)
    ORDER BY T1.CD;
    
  END p_sRtsd0024;

  /*****************************************************************************
  -할인등록COUNT
  *****************************************************************************/
  FUNCTION f_CountRtsd0024 (
    v_Dc_Gb          IN RTSD0024.DC_GB%TYPE             /* 할인구분코드   */
    ) RETURN NUMBER IS
    v_Dc_Gb_cunt   NUMBER DEFAULT 0;
  BEGIN
    
    SELECT
        COUNT(*)
        INTO v_Dc_Gb_cunt
    FROM RTSD0024 T
    WHERE T.DC_GB = v_Dc_Gb;
    
    RETURN v_Dc_Gb_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_CountRtsd0024;


  /*****************************************************************************
  -할인등록 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0024 (
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* 할인금액       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* 중복할인여부   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* 할인상세여부   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0024 (
            DC_GB,
            STD_STR_DAY,
            DC_RATE,
            DC_AMT,
            MLT_DC_YN,
            STD_END_DAY,
            DC_DTL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Dc_Gb,
            v_Std_Str_Day,
            v_Dc_Rate,
            v_Dc_Amt,
            v_Mlt_Dc_Yn,
            v_Std_End_Day,
            DECODE(v_Dc_Dtl_Yn, NULL, 'N', v_Dc_Dtl_Yn) ,
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

  END f_InsertRtsd0024;

  /*****************************************************************************
  -할인등록 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0024 (
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* 할인금액       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* 중복할인여부   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* 할인상세여부   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  
    IF 0 = f_CountRtsd0024(v_Dc_Gb) THEN
        INSERT  INTO RTSD0024 (
                DC_GB,
                STD_STR_DAY,
                DC_RATE,
                DC_AMT,
                MLT_DC_YN,
                STD_END_DAY,
                DC_DTL_YN,
                REG_ID,
                REG_DT,
                CHG_ID,
                CHG_DT
                )
        VALUES  (
                v_Dc_Gb,
                v_Std_Str_Day,
                v_Dc_Rate,
                v_Dc_Amt,
                DECODE(v_Dc_Dtl_Yn, NULL, 'N', v_Dc_Dtl_Yn),
                v_Std_End_Day,
                v_Dc_Dtl_Yn,
                v_Reg_Id,
                SYSDATE,
                v_Reg_Id,
                SYSDATE
                );
    ELSE 
        UPDATE RTSD0024 
        SET    STD_STR_DAY  = v_Std_Str_Day,
               DC_RATE      = v_Dc_Rate,
               DC_AMT       = v_Dc_Amt,
               MLT_DC_YN    = v_Mlt_Dc_Yn,
               STD_END_DAY  = v_Std_End_Day,
               DC_DTL_YN    = DECODE(v_Dc_Dtl_Yn, NULL, 'N', v_Dc_Dtl_Yn),
               CHG_ID       = v_Reg_Id,
               CHG_DT       = SYSDATE
        WHERE  DC_GB        = v_Dc_Gb;
    END IF;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0024;


  /*****************************************************************************
  -할인등록DB Copy
  *****************************************************************************/
  FUNCTION f_InsertRtsd0026 (
    v_Dc_Gb             IN RTSD0026.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0026.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Rate           IN RTSD0026.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0026.DC_AMT%TYPE,            /* 할인금액       */
    v_Mlt_Dc_Yn         IN RTSD0026.MLT_DC_YN%TYPE,         /* 중복할인여부   */
    v_Std_End_Day       IN RTSD0026.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* 할인상세여부   */
    v_Reg_Id            IN RTSD0026.REG_ID%TYPE,            /* 등록자 ID      */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0026 (
            RTSD0026_SEQ,
            DC_GB,
            STD_STR_DAY,
            DC_RATE,
            DC_AMT,
            MLT_DC_YN,
            STD_END_DAY,
            DC_DTL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            'SM'||LPAD(SEQ_RTSD0026RTSD0026_SEQ.NEXTVAL, 7, 0),
            v_Dc_Gb,
            v_Std_Str_Day,
            v_Dc_Rate,
            v_Dc_Amt,
            v_Mlt_Dc_Yn,
            v_Std_End_Day,
            v_Dc_Dtl_Yn,
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

  END f_InsertRtsd0026;

  /*****************************************************************************
  --할인등록(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0024 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)*/
    v_Dc_Gb             IN RTSD0024.DC_GB%TYPE,             /* 할인구분코드   */
    v_Std_Str_Day       IN RTSD0024.STD_STR_DAY%TYPE,       /* 할인시작일     */
    v_Dc_Rate           IN RTSD0024.DC_RATE%TYPE,           /* 할인율         */
    v_Dc_Amt            IN RTSD0024.DC_AMT%TYPE,            /* 할인금액       */
    v_Mlt_Dc_Yn         IN RTSD0024.MLT_DC_YN%TYPE,         /* 중복할인여부   */
    v_Std_End_Day       IN RTSD0024.STD_END_DAY%TYPE,       /* 할인종료일     */
    v_Dc_Dtl_Yn         IN RTSD0024.DC_DTL_YN%TYPE,         /* 할인상세여부   */
    v_Reg_Id            IN RTSD0024.REG_ID%TYPE,            /* 등록자 ID      */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN
        IF 0 != f_InsertRtsd0024(v_Dc_Gb, v_Std_Str_Day, v_Dc_Rate, 
                                 v_Dc_Amt, v_Mlt_Dc_Yn, v_Std_End_Day,
                                 v_Dc_Dtl_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '할인등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF 0 != f_InsertRtsd0026(v_Dc_Gb, v_Std_Str_Day, v_Dc_Rate, 
                                 v_Dc_Amt, v_Mlt_Dc_Yn, v_Std_End_Day,
                                 v_Dc_Dtl_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '할인등록 DB Copy 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
        
    ELSIF v_Comm_Dvsn = 'U' THEN
        
        IF 0 != f_UpdateRtsd0024(v_Dc_Gb, v_Std_Str_Day, v_Dc_Rate, 
                                 v_Dc_Amt, v_Mlt_Dc_Yn, v_Std_End_Day,
                                 v_Dc_Dtl_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '할인수정 실패!!!'||'-'||v_ErrorText;    
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        IF 0 != f_InsertRtsd0026(v_Dc_Gb, v_Std_Str_Day, v_Dc_Rate, 
                                 v_Dc_Amt, v_Mlt_Dc_Yn, v_Std_End_Day,
                                 v_Dc_Dtl_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '할인등록 DB Copy 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0024.p_IUDRtsd0024(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0024.p_IUDRtsd0024(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0024; 
  
  /*****************************************************************************
  -- 재랜탈 등록비 할인율
  *****************************************************************************/
  FUNCTION f_regiAmtRt
    RETURN VARCHAR IS
    v_regiAmtRt  RTSD0024.DC_RATE%TYPE;          
  BEGIN

	SELECT NVL(DC_RATE, '0')
	  INTO v_regiAmtRt
	  FROM RTSD0024
	 WHERE DC_GB = 'E';

    RETURN v_regiAmtRt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_regiAmtRt; 

END Pkg_Rtsd0024;
/
