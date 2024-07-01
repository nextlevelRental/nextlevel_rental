CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0216 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0229
   PURPOSE   Paysign발송이력

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-03-29  kstka            1. Created this package body.
*******************************************************************************/   

  /*****************************************************************************
  -- Paysign발송이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0216 (
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE,        /*주문번호              */
    v_Seq            IN RTSD0216.SEQ%TYPE,           /*순번                 */
    v_Work_Gb        IN RTSD0216.WORK_GB%TYPE,       /*작업구분              */
    v_Params         IN RTSD0216.PARAMS%TYPE,        /*파라미터정보           */
    v_Result         IN RTSD0216.RESULT%TYPE,        /*결과                 */
    v_Reg_Id         IN RTSD0216.REG_ID%TYPE,        /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0216 (
            ORD_NO,
            SEQ,
            WORK_GB,
            PARAMS,
            RESULT,
            REG_ID,
            REG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Seq,
            v_Work_Gb,
            v_Params,
            v_Result,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0216;

  /*****************************************************************************
  -- Paysign발송이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0216 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE,        /*주문번호              */
    v_Work_Gb        IN RTSD0216.WORK_GB%TYPE,       /*작업구분              */
    v_Params         IN RTSD0216.PARAMS%TYPE,        /*파라미터정보           */
    v_Result         IN RTSD0216.RESULT%TYPE,        /*결과                 */
    v_Reg_Id         IN RTSD0216.REG_ID%TYPE,        /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Seq RTSD0216.SEQ%TYPE;
    v_Wrk VARCHAR2(2);
    
    e_Error EXCEPTION;
  BEGIN

    IF v_Comm_Dvsn = 'I' THEN
        
        v_Seq := f_sRtsd0216Seq(v_Ord_No);
        
        IF 0 != f_InsertRtsd0216(v_Ord_No, v_Seq, v_Work_Gb, v_Params, v_Result, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'Paysign발송 이력 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        -- Main이력생성
        IF v_Work_Gb IN ('01', '03') THEN
        
            IF v_Work_Gb IN ('01') THEN
                v_Wrk := 'I';
            ELSIF v_Work_Gb IN ('03') THEN
                v_Wrk := 'U';
            END IF;
            
            Pkg_Rtsd0217.p_IUDRtsd0217(v_Wrk, v_Ord_No, TO_CHAR(SYSDATE, 'YYYYMMDD'), 'N', v_Reg_Id, v_Success_code, v_Return_Message, v_ErrorText);
            IF v_Success_code > 0 THEN
                v_Return_Message := 'Paysign발송 Main이력 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF; 
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0216.p_IUDRtsd0216(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0216.p_IUDRtsd0216(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0216;

  /*****************************************************************************
  -- Paysign이력 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0216Seq(
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER IS
    v_Seq   RTSD0216.SEQ%TYPE DEFAULT NULL;             /*생성순번            */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ) 
                 FROM    RTSD0216
                 WHERE   ORD_NO = v_Ord_No)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0216Seq;
  
END Pkg_Rtsd0216;
/
