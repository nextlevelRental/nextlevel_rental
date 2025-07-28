CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0051 AS
/*******************************************************************************
   NAME:     PKG_RTSD0051
   Title:    렌탈 마스터 관리지역

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-09  Sean             1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- 렌탈 마스터 관리지역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0051 (
    v_Comm_Dvsn      IN CHAR,                           /* 처리구분(I,U,D)     */
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* 렌탈지역            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* 등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    e_Error EXCEPTION;    
  BEGIN 
    IF v_Comm_Dvsn = 'I' THEN
      IF 0 = f_sRTSD0051Count(v_rtmasterNu, v_rentalGroup, v_rentalOffice) THEN
        IF 0 != f_InsertRTSD0051(v_rtmasterNu, v_rentalGroup, v_rentalOffice, 
                                 v_Reg_Id, v_ErrorText) THEN
              v_Return_Message := '렌탈마스터 관리지역 등록 실패!!!'||'-'||v_ErrorText;
              v_ErrorText := v_ErrorText;
              RAISE e_Error;
        END IF;
      ELSE
        IF 0 != f_UpdateRTSD0051(v_rtmasterNu, v_rentalGroup, v_rentalOffice, 
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '렌탈마스터 관리지역 재등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
      END IF;       

    ELSIF v_Comm_Dvsn = 'D' THEN
      IF (TRIM(v_rtmasterNu) IS NULL) THEN
          v_Return_Message := '렌탈마스터 관리지역 사번('||v_rtmasterNu||') : 필수 입력값 누락으로 처리가 불가 합니다!';
          RAISE e_Error;
      END IF;
    
      IF 0 != f_DeleteRTSD0051(v_rtmasterNu, v_rentalGroup, v_rentalOffice, 
                               v_Reg_Id, v_ErrorText) THEN
          v_Return_Message := '렌탈마스터 관리지역 삭제 실패!!!'||'-'||v_ErrorText;
          v_ErrorText := v_ErrorText;
          RAISE e_Error;
      END IF;
    /* ELSIF v_Comm_Dvsn = 'U' THEN */ 
      
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0051.p_IUDRTSD0051(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0051.p_IUDRTSD0051(2)', v_ErrorText, v_Return_Message);
  END p_IUDRtsd0051;

  /*****************************************************************************
  -- 렌탈 마스터 관리지역 Count
  *****************************************************************************/
  FUNCTION f_sRTSD0051Count(
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE     /* 렌탈지역            */    
    ) RETURN NUMBER IS
    v_curr_cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT COUNT(*)
      INTO v_curr_cnt
      FROM RTSD0051
     WHERE RTMASTER_NU   = v_rtmasterNu
       AND RENTAL_GROUP  = v_rentalGroup
       AND RENTAL_OFFICE = v_rentalOffice;

    RETURN v_curr_cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTSD0051Count;

  /*****************************************************************************
  -- 렌탈마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0051 (
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* 렌탈지역            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* 등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN
    INSERT  INTO RTSD0051 (
            RTMASTER_NU
          , RENTAL_GROUP
          , RENTAL_OFFICE		 
          , STR_DAY		 
          , REG_ID		 
          , REG_DT		 
          , CHG_ID		 
          , CHG_DT	   
            )
    VALUES  (
            v_rtmasterNu,
            v_rentalGroup,
            v_rentalOffice,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
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
  END f_InsertRTSD0051;    

  /*****************************************************************************
  -- 렌탈 마스터 관리지역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0051 ( 
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* 렌탈지역            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* 등록자 ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0051
       SET STR_DAY       = TO_CHAR(SYSDATE, 'YYYYMMDD'),
           END_DAY       = '',
           CHG_ID		     = v_Reg_Id,
           CHG_DT		     = SYSDATE
     WHERE RTMASTER_NU   = v_rtmasterNu
       AND RENTAL_GROUP  = v_rentalGroup
       AND RENTAL_OFFICE = v_rentalOffice
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTSD0051; 


  /*****************************************************************************
  -- 렌탈마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRTSD0051 ( 
    v_rtmasterNu     IN RTSD0051.RTMASTER_NU%TYPE,      /* 렌탈 마스터 사번     */
    v_rentalGroup    IN RTSD0051.RENTAL_GROUP%TYPE,     /* 렌탈지사            */
    v_rentalOffice   IN RTSD0051.RENTAL_OFFICE%TYPE,    /* 렌탈지역            */
    v_Reg_Id         IN RTSD0051.REG_ID%TYPE,           /* 등록자 ID           */
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0051
       SET END_DAY       = TO_CHAR(SYSDATE, 'YYYYMMDD'),
           CHG_ID		     = v_Reg_Id,
           CHG_DT		     = SYSDATE
     WHERE RTMASTER_NU   = v_rtmasterNu
       AND RENTAL_GROUP  = v_rentalGroup
       AND RENTAL_OFFICE = v_rentalOffice
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_DeleteRTSD0051; 
 

END PKG_RTSD0051;