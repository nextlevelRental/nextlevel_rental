CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0217 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0217
   PURPOSE   Paysign발송이력 Main

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-04-17  kstka            1. Created this package body.
*******************************************************************************/   

  /*****************************************************************************
  -- Paysign발송이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0217 (
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*주문번호              */
    v_Send_Day       IN RTSD0217.SEND_DAY%TYPE,      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0217 (
            ORD_NO,
            SEND_DAY,
            SEND_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Send_Day,
            v_Send_Yn,
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

  END f_InsertRtsd0217;

  /*****************************************************************************
  -- Paysign발송이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0217 (
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*주문번호              */      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0217 SET
           SEND_YN = v_Send_Yn,
           CHG_ID = v_Reg_Id,
           CHG_DT = SYSDATE
    WHERE ORD_NO = v_Ord_No;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0217;
  
  /*****************************************************************************
  -- Paysign발송이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0217 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0217.ORD_NO%TYPE,        /*주문번호              */
    v_Send_Day       IN RTSD0217.SEND_DAY%TYPE,      
    v_Send_Yn        IN RTSD0217.SEND_YN%TYPE,
    v_Reg_Id         IN RTSD0217.REG_ID%TYPE,        /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
  BEGIN

    IF v_Comm_Dvsn = 'I' THEN
        
        IF f_sRtsd0217Count(v_Ord_No) = 0 THEN        
            IF 0 != f_InsertRtsd0217(v_Ord_No, v_Send_Day, v_Send_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'Paysign발송 이력 Main 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;        
        END IF;        
    
    ELSE 
    
        IF 0 != f_UpdateRtsd0217(v_Ord_No, v_Send_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'Paysign발송 이력 Main 업데이트 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0217.p_IUDRtsd0217(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0217.p_IUDRtsd0217(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0217;
  
  /*****************************************************************************
  -- Paysign발송이력 - 저장여부확인
  *****************************************************************************/
  FUNCTION f_sRtsd0217Count(
    v_Ord_No         IN RTSD0216.ORD_NO%TYPE           /*주문번호            */
    ) RETURN NUMBER IS
  
    v_Count NUMBER;
  BEGIN
   
    SELECT COUNT(*) 
    INTO v_Count
    FROM RTSD0217
    WHERE ORD_NO = v_Ord_No;
    
    RETURN v_Count;

  END f_sRtsd0217Count;
  
END Pkg_Rtsd0217;