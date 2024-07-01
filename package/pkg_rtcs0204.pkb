CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0204 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0204
   PURPOSE   [CS] ���ͱ�ü�ۼ��̷�

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2017-12-08  K.S.T.           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] ���ͱ�üȮ�μ� �ۼ��̷�
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0204 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTCS0204.ORD_NO%TYPE,         /*����ȣ              */
    v_Input_Dt       IN RTCS0204.INPUT_DT%TYPE,       /*��üȮ�μ��ۼ�����    */
    v_Prs_Dcd        IN RTCS0204.PRS_DCD%TYPE,        /*�����ڵ�            */
    v_Write_Yn       IN RTCS0204.WRITE_YN%TYPE,       /*�ۼ�����              */
    v_Reg_Id         IN RTCS0204.REG_ID%TYPE,         /*����� ID             */
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
            v_Return_Message := '���ڵ�('||v_Cust_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ord_No) IS NULL)  THEN
            v_Return_Message := '�ֹ���ȣ('||v_Ord_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

--        IF (TRIM(v_Input_Dt) IS NULL)  THEN
--            v_Return_Message := '����Ȯ�μ��ۼ�����('||v_Input_Dt||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
--            RAISE e_Error;
--        END IF;

        IF (TRIM(v_Agency_Cd) IS NULL)  THEN
            v_Return_Message := '�븮���ڵ�('||v_Agency_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
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
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF; 
  
  
    v_Success_code := 0;
    v_Return_Message := '���������� ó���Ǿ����ϴ�';
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
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0204.p_IUDRtcs0204(2)', v_ErrorText, v_Return_Message);   
             
    END P_IUDRtcs0204;
           
   /*****************************************************************************
  -- ���ͱ�ü Ȯ�μ� �ۼ�����
  *****************************************************************************/
  FUNCTION f_sRtcs0204ServCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE           /*�ֹ���ȣ            */
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
  -- [CS] ���ͱ�üȮ�μ� �ۼ�����
  *****************************************************************************/
  FUNCTION f_sRtcs0204ServYn(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE           /*����ȣ            */
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
/
