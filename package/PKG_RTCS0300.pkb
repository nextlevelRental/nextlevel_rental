CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0300 AS 
/*******************************************************************************
   NAME      Pkg_Rtcs0300
   PURPOSE   ���� ������ ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-07-18  kstka           Created. [20230718_01]   
*******************************************************************************/
  
  /*****************************************************************************
  -- ���� ������ ���� ��ȸ
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0300 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Call_Id        IN RTCS0300.CALL_ID%TYPE,          /*���� ID                        */
    v_Provsn_Tp      IN RTCS0300.PROVSN_TP%TYPE,        /*�Ҽӱ׷� P:�����, H:Ȩ����, R:�緻Ż*/
    v_Holi_Yn        IN RTCS0300.HOLI_YN%TYPE,          /*�޹�����                        */
    v_Use_Yn         IN RTCS0300.USE_YN%TYPE            /*��뿩��                        */
    ) IS

  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  0 AS CHK
          , CALL_ID
          , CALL_NM
          , PROVSN_TP
          , HOLI_YN
          , USE_YN
          , REG_ID
          , REG_DT
          , CHG_ID
          , CHG_DT
    FROM    RTCS0300
    WHERE   1=1
    AND     CALL_ID     = DECODE(v_Call_Id, NULL, CALL_ID, v_Call_Id)
    AND     PROVSN_TP   = DECODE(v_Provsn_Tp, NULL, PROVSN_TP, v_Provsn_Tp)
    ;

  END p_sRtcs0300;  
  
  /*****************************************************************************
  -- ���� ��� ���� Ȯ��
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                             
  *****************************************************************************/
  FUNCTION f_sRtcs0300Count (
    v_Call_Id        IN RTCS0300.CALL_ID%TYPE           /*���� ID                        */
    ) RETURN NUMBER IS

    v_Cnt NUMBER;
  BEGIN
    
    SELECT  COUNT(*)
    INTO    v_Cnt
    FROM    RTCS0300
    WHERE   1=1
    AND     CALL_ID     = DECODE(v_Call_Id, NULL, CALL_ID, v_Call_Id)
    ;

    RETURN v_Cnt;
    
  END f_sRtcs0300Count;
  
  /*****************************************************************************
  -- ���� ������ ���� INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                          
  *****************************************************************************/
  FUNCTION f_InsertRtcs0300 (
    v_Call_Id         IN RTCS0300.CALL_ID%TYPE,        /*���� ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*�����          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*����׷�        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*�޹�����          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*��뿩��          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*�����            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0300 (
            CALL_ID,
            CALL_NM,
            PROVSN_TP,
            HOLI_YN,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Call_Id,
            v_Call_Nm,
            v_Provsn_Tp,
            v_Holi_Yn,
            'Y',
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

  END f_InsertRtcs0300;

  /*****************************************************************************
  -- ���� ������ ���� UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                  
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0300 (
     v_Call_Id         IN RTCS0300.CALL_ID%TYPE,        /*���� ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*�����          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*����׷�        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*�޹�����          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*��뿩��          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*�����            */
    v_ErrorText       OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0300
    SET    CALL_NM          = v_Call_Nm,
           PROVSN_TP        = v_Provsn_Tp,
           HOLI_YN          = v_Holi_Yn,
           USE_YN           = v_Use_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  CALL_ID          = v_Call_Id
    ;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0300;
  
  /*****************************************************************************
  -- ���� ������ ���� (IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2023-07-18  kstka           Created. [20230718_01]                                                                                         
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0300 (
    v_Comm_Dvsn       IN CHAR,                         /*1 ó������(I,U,D)       */
    v_Call_Id         IN RTCS0300.CALL_ID%TYPE,       /*���� ID         */
    v_Call_Nm         IN RTCS0300.CALL_NM%TYPE,        /*�����          */
    v_Provsn_Tp       IN RTCS0300.PROVSN_TP%TYPE,      /*����׷�        */
    v_Holi_Yn         IN RTCS0300.HOLI_YN%TYPE,        /*�޹�����          */
    v_Use_Yn          IN RTCS0300.USE_YN%TYPE,         /*��뿩��          */
    v_Reg_Id          IN RTCS0300.REG_ID%TYPE,         /*�����            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error         EXCEPTION;

  BEGIN  

    IF v_Comm_Dvsn = 'I' THEN
    
        IF f_sRtcs0300Count(v_Call_Id) = 0 THEN
        
            IF 0 != f_InsertRtcs0300(v_Call_Id, v_Call_Nm ,v_Provsn_Tp, v_Holi_Yn , v_Use_Yn,
                                     v_Reg_Id,v_ErrorText) THEN
                v_Return_Message := '���� ������ ���� ��� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;      
        END IF;
    ELSIF v_Comm_Dvsn IN ('U') THEN
        

        IF 0 != f_UpdateRtcs0300(v_Call_Id, v_Call_Nm ,v_Provsn_Tp, v_Holi_Yn , v_Use_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���� ������ ���� ���� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;     

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

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);

    END p_IUDRtcs0300;
    
END Pkg_Rtcs0300;
/