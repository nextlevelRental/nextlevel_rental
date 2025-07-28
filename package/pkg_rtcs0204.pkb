CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0204 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0204
   PURPOSE   [CS] 윈터교체작성이력

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-12-08  K.S.T.           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] 윈터교체확인서 작성이력
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0204 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0204.ORD_NO%TYPE,         /*계약번호              */
    v_Input_Dt       IN RTCS0204.INPUT_DT%TYPE,       /*교체확인서작성일자    */
    v_Prs_Dcd        IN RTCS0204.PRS_DCD%TYPE,        /*서비스코드            */
    v_Write_Yn       IN RTCS0204.WRITE_YN%TYPE,       /*작성여부              */
    v_Reg_Id         IN RTCS0204.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Cust_No VARCHAR2(20);
    v_Agency_Cd VARCHAR2(10);
    
    e_Error EXCEPTION;

    v_Seq NUMBER;
    
    BEGIN
  
    SELECT CUST_NO, AGENCY_CD INTO v_Cust_No, v_Agency_Cd FROM RTSD0108 WHERE ORD_NO = v_Ord_No;
    
    IF v_Comm_Dvsn IN ('I','U') THEN

        IF (TRIM(v_Cust_No) IS NULL)  THEN
            v_Return_Message := '고객코드('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ord_No) IS NULL)  THEN
            v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

--        IF (TRIM(v_Input_Dt) IS NULL)  THEN
--            v_Return_Message := '서비스확인서작성일자('||v_Input_Dt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
--            RAISE e_Error;
--        END IF;

        IF (TRIM(v_Agency_Cd) IS NULL)  THEN
            v_Return_Message := '대리점코드('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'I' THEN

            v_Seq := f_sRtcs0204ServCnt(v_Ord_No);           
       
            
            INSERT INTO RTCS0204 (CUST_NO, ORD_NO, SEQ, INPUT_DT, PRS_DCD, AGENCY_CD, WRITE_YN, REG_ID, REG_DT, CHG_ID, CHG_DT)
            VALUES (v_Cust_No, v_Ord_No, v_Seq + 1, TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Prs_Dcd, v_Agency_Cd, v_Write_Yn, v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE);

        ELSE

            UPDATE RTCS0204 SET WRITE_YN = v_Write_Yn, CHG_ID = v_Reg_Id, CHG_DT = SYSDATE 
            WHERE ORD_NO = v_Ord_No;

        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        DELETE FROM RTCS0204 WHERE ORD_NO = v_Ord_No;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF; 
  
  
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0204.p_IUDRtcs0204(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0204.p_IUDRtcs0204(2)', v_ErrorText, v_Return_Message);   
             
    END P_IUDRtcs0204;
           
   /*****************************************************************************
  -- 윈터교체 확인서 작성순서
  *****************************************************************************/
  FUNCTION f_sRtcs0204ServCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE           /*주문번호            */
  ) RETURN NUMBER IS

    v_Cnt   NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(*)
    INTO    v_Cnt
    FROM    RTCS0204 A
    WHERE   A.ORD_NO    = v_Ord_No;

    RETURN v_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0204ServCnt;
  
  /*****************************************************************************
  -- [CS] 윈터교체확인서 작성여부
  *****************************************************************************/
  FUNCTION f_sRtcs0204ServYn(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE           /*계약번호            */
  ) RETURN VARCHAR2 IS
    v_write_yn   VARCHAR2(1);
  BEGIN

    SELECT WRITE_YN 
    INTO    v_write_yn 
    FROM (
        SELECT  
            WRITE_YN
            , ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY SEQ DESC) NUM        
        FROM    RTCS0204
        WHERE   ORD_NO    = v_Ord_No
        )
    WHERE NUM = 1;

    RETURN v_write_yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0204ServYn;
  
END Pkg_Rtcs0204;