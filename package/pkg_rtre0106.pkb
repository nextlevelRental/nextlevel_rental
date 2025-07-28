CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0106 AS
/*******************************************************************************
   NAME      Pkg_Rtre0105
   PURPOSE   당월연체대상 SMS발송처리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-06-16  kstka         1. Created this package body.
*******************************************************************************

  /*****************************************************************************
  -- SMS발송대상 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0106 (
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  *
      FROM  RTRE0106
     WHERE  1=1
     ORDER  BY ROW_NUM
    ; 

  END p_sRtre0106;

  /*****************************************************************************
  -- SMS발송대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0106 (
    v_Send_Cnt      IN NUMBER,
    v_Send_Term    IN NUMBER,
    v_Send_Start     IN NUMBER,
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
    v_Send_Start_Time NUMBER;
  BEGIN

     
    --[20200706_01] kstka 발송시작시간과 현재시간차이를 계산
    SELECT 
    TRUNC((TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD') || TO_CHAR(v_Send_Start, '0000'), 'YYYYMMDDHH24MI') - SYSDATE) * 24 * 60)
    INTO v_Send_Start_Time 
    FROM DUAL;
    
    INSERT  INTO RTRE0106 
    SELECT  ROWNUM      AS ROW_NUM
             ,  FLOOR(ROWNUM / v_Send_Cnt) + 1 AS GRP_NUM --* 몇 건씩(500건) 끊어 발송할 것인가?
             ,  SYSDATE + (v_Send_Term * (FLOOR(ROWNUM / v_Send_Cnt)) / (24 * 60)) + (v_Send_Start_Time / (24 * 60)) AS SEND_DT --* 몇 건씩(500건), 몇 분(30분) 단위로, 몇 분(20분) 뒤부터 발송할 것인가?
             ,  DELY_DAY
             ,  CUST_NO
             ,  CUST_NM
             ,  MOB_NO
             ,  ORD_NO
             ,  APPR_AMT_11
             ,  APPR_AMT_01
             ,  PAY_MTHD
             ,  PAY_DD
             ,  REQ_DAY
             ,  REQ_AMT
             ,  RECP_AMT
             ,  RCER_CD
             ,  RCER_NM
             ,  SMS_MSG
          FROM  RTRE0105
         WHERE  1=1
        ; 
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0106;

  /*****************************************************************************
  -- SMS발송대상  Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0106(
    v_ErrorText      OUT VARCHAR2
  )  RETURN NUMBER IS
  BEGIN

    DELETE RTRE0106;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0106;
  
  /*****************************************************************************
  -- SMS발송대상 집계
  *****************************************************************************/
  PROCEDURE p_ProcessRtre0106 (
    v_Send_Cnt          IN NUMBER,
    v_Send_Term        IN NUMBER,
    v_Send_Start         IN NUMBER,
    v_Success_code    OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    
        IF 0 <> f_DeleteRtre0106(v_ErrorText) THEN
            v_ErrorText := 'Rtre0106 테이블 삭제 오류';
            RAISE e_Error;
        END IF;
    
        IF 0 <> f_InsertRtre0106(V_SEND_CNT, V_SEND_TERM, V_SEND_START, V_ERRORTEXT) THEN
            v_ErrorText := 'Rtre0106 데이터 생성 오류';
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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        
  END p_ProcessRtre0106;
  
  /*****************************************************************************
  -- SMS발송처리
  *****************************************************************************/
  PROCEDURE p_SendSmsRtre0106 (
    v_Reg_Id              IN VARCHAR2,
    v_Success_code    OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    
        FOR cur_01 IN (
        SELECT  *
          FROM  RTRE0106 A1
         WHERE  1=1
        ) LOOP
            
            v_Success_Code   := 0;
            v_Return_Message := '';
            v_ErrorText      := '';
        
            IF cur_01.MOB_NO IS NOT NULL THEN
            
                NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'R'                                   /*예약 전송여부    */
                    , TO_CHAR(cur_01.SEND_DT,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                    , cur_01.MOB_NO                            /*받는 전화번호    */
                    , '18550100'                            /*보내는 전화번호  */
                    , cur_01.SMS_MSG                             /*메시지내용       */
                    , 'S034'                                /*사용자지정 필드1 */
                    , cur_01.ORD_NO                            /*사용자지정 필드2 */
                    , '2'
                    , ''
                    , 'kstka'                              /*등록자 ID        */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
                
                IF v_Success_Code < 0 THEN
                    v_Return_Message := v_Return_Message;
                    RAISE e_Error;
                END IF;
            END IF;
        END LOOP; 
        
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
--          Pkg_Utility.p_ErrorFileWrite ('Pkg_Rtre0106.p_IUDRtre0106(1)',
--                                       v_ErrorText,
--                                       v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
--        Pkg_Utility.p_ErrorFileWrite ('Pkg_Rtre0106.p_IUDRtre0106(2)',
--                                       v_ErrorText,
--                                       v_Return_Message);

  END p_SendSmsRtre0106;
  
END Pkg_Rtre0106;