CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RENTAL_TEST AS
/*******************************************************************************
   NAME      PKG_RTCM0110
   PURPOSE   ��Ż���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-31  Sean         1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- ��Ż������ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRentalMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM IN RTCM0051.CD_NM%TYPE 
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT A.CD_GRP_CD   /* �׷��ڵ�  */
         , A.CD          /* �ڵ�*/
         , A.CD_NM       /* �ڵ��  */
         , A.ORDER_PT    /* ���� */
         , A.USE_YN      /* ��뿩��   */
      FROM RTCM0051 A         
     WHERE 1=1
       AND A.CD_GRP_CD = 'S301'
       AND (A.CD LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
            A.CD_NM LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%')
     ORDER BY A.CD
       ;
  END p_sRentalMst;

  /*****************************************************************************
  -- ��Ż������ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRentalDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD              IN RTCM0051.CD%TYPE, 
    v_CD_NM           IN RTCM0051.CD_NM%TYPE 
    ) IS
        
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT A.CD_GRP_CD   /* �׷��ڵ�  */
          ,A.CD          /* �ڵ�*/
          ,A.CD_NM       /* �ڵ��  */
          ,A.ORDER_PT    /* ���� */
          ,A.USE_YN      /* ��뿩��   */
          ,A.RFR_1       /* ����׷��ڵ� */
          ,A.RFR_2       /* �����ڵ� */
          ,NVL(B.CHK,0) AS CHK  /*����üũ*/
          ,(SELECT COUNT(*)  FROM RTCM0110 WHERE RNT_OFC = A.RFR_2 AND RNT_PNT = A.CD) AS DATA_YN /*��Ż�����Ͱ���üũ*/
     FROM RTCM0051 A
          ,(
            SELECT  CD_GRP_CD   /* �׷��ڵ�  */
                   ,CD          /* �ڵ�*/
                   ,1 AS CHK    /*����üũ*/
              FROM RTCM0051            
             WHERE CD_GRP_CD = 'S302'
               AND RFR_1     = 'S301'
               AND RFR_2     = v_CD
           ) B
    WHERE A.CD_GRP_CD = 'S302'
      AND A.CD_GRP_CD = B.CD_GRP_CD(+)
      AND A.CD        = B.CD(+)
      AND (A.CD LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
           A.CD_NM LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%')
    ORDER BY A.CD
       ;
  END p_sRentalDtl;


   /*****************************************************************************
  -- ��Ż���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalMst (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
    v_CNT  NUMBER;
    
    
  BEGIN
  
    IF v_Comm_Dvsn = 'I' THEN    
    
        IF (TRIM(v_CD) IS NULL) THEN
            v_Return_Message := '��Ż�����ڵ�('||v_CD||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
      
        IF (TRIM(v_CD_NM) IS NULL) THEN
            v_Return_Message := '��Ż�����('||v_CD_NM||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        BEGIN
            SELECT COUNT(*) CNT
              INTO v_CNT
              FROM RTCM0051
             WHERE CD_GRP_CD = 'S301'
               AND CD        = v_CD;
               
        EXCEPTION WHEN NO_DATA_FOUND THEN
            v_CNT := 0;
        
        END;
        
        IF v_CNT > 0 THEN
            v_Return_Message := '�̹� ��ϵ� ��Ż�����ڵ��Դϴ�.';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
      IF 0 != f_InsertRentalMst(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                               v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '��Ż���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;        
    ELSIF v_Comm_Dvsn = 'U' THEN
        IF 0 != f_UpdateRentalMst(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                                 v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '��Ż���� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSIF v_Comm_Dvsn = 'D' THEN   
            
        --���� ���� ��ư ��� ����
    
        BEGIN
            SELECT COUNT(*) CNT
              INTO v_CNT
              FROM RTCM0051
             WHERE CD_GRP_CD = 'S302'
               AND RFR_2     = v_CD;
               
        EXCEPTION WHEN NO_DATA_FOUND THEN
            v_CNT := 0;
        
        END;
        
        IF v_CNT > 0 THEN
            v_Return_Message := '����� ��Ż���� ���� �� �����Ͻʽÿ�.';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
     
        IF 0 != f_DeleteRentalMst(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                                 v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '��Ż���� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ����Ǿ����ϴ�';
    v_ErrorText := '';
    

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalMst(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalMst(2)', v_ErrorText, v_Return_Message);
  END p_IUDRentalMst;     


  /*****************************************************************************
  -- ��Ż���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalMst (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN 
    INSERT  INTO RTCM0051 (
            CD_GRP_CD,        
            CD, 
            CD_NM, 
            ORDER_PT,
            USE_YN,                
            REG_ID,                
            REG_DT,                
            CHG_ID,                
            CHG_DT    
            )
    VALUES  (
            'S301',      
            v_CD,    
            v_CD_NM,    
            v_ORDER_PT,
            v_USE_YN,
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRentalMst;    


  /*****************************************************************************
  -- ��Ż���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRentalMst ( 
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2 
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCM0051
       SET CD_NM  = v_CD_NM,
           USE_YN = v_USE_YN,
           CHG_ID = v_REG_ID,
           CHG_DT = SYSDATE
     WHERE CD_GRP_CD = 'S301'
       AND CD        = v_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalMst; 


  /*****************************************************************************
  -- ��Ż���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRentalMst ( 
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,    
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2 
    ) RETURN NUMBER IS
  BEGIN
    DELETE
      FROM RTCM0051
     WHERE CD_GRP_CD = 'S301'
       AND CD        = v_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_DeleteRentalMst; 





   /*****************************************************************************
  -- ��Ż���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalDtl (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,   
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,  
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
    v_CNT  NUMBER;
    
  BEGIN
  
    IF v_Comm_Dvsn = 'I' THEN    
    
        IF (TRIM(v_CD) IS NULL) THEN
            v_Return_Message := '��Ż�����ڵ�('||v_CD||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
      
        IF (TRIM(v_CD_NM) IS NULL) THEN
            v_Return_Message := '��Ż������('||v_CD_NM||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        BEGIN
            SELECT COUNT(*) CNT
              INTO v_CNT
              FROM RTCM0051
             WHERE CD_GRP_CD = 'S302'
               AND CD        = v_CD;
               
        EXCEPTION WHEN NO_DATA_FOUND THEN
            v_CNT := 0;
        
        END;
        
        IF v_CNT > 0 THEN
            v_Return_Message := '�̹� ��ϵ� ��Ż�����ڵ��Դϴ�.';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
      IF 0 != f_InsertRentalDtl(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                               v_USE_YN, v_RFR_1, v_RFR_2, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '��Ż���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;        
    ELSIF v_Comm_Dvsn = 'U' THEN
        IF 0 != f_UpdateRentalDtl(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                               v_USE_YN, v_RFR_1, v_RFR_2, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '��Ż���� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSIF v_Comm_Dvsn = 'D' THEN    
    
        --������ ��Ż������ ��뿩�� üũ ���� �߰� �� �����ؾߵ�.. ���� ������ư  ������.
    
        IF 0 != f_DeleteRentalDtl(v_CD_GRP_CD, v_CD, v_CD_NM, v_ORDER_PT, 
                               v_USE_YN, v_RFR_1, v_RFR_2, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '��Ż���� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ����Ǿ����ϴ�';
    v_ErrorText := '';
    

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalDtl(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalDtl(2)', v_ErrorText, v_Return_Message);
  END p_IUDRentalDtl;     


  /*****************************************************************************
  -- ��Ż���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRentalDtl (
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE,  
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,   
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN 
    INSERT  INTO RTCM0051 (
            CD_GRP_CD,        
            CD, 
            CD_NM, 
            ORDER_PT,
            USE_YN,     
            RFR_1,   
            RFR_2,              
            REG_ID,                
            REG_DT,                
            CHG_ID,                
            CHG_DT    
            )
    VALUES  (
            'S302',      
            v_CD,    
            v_CD_NM,    
            v_ORDER_PT,
            v_USE_YN,  
            v_RFR_1,   
            v_RFR_2,   
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRentalDtl;    


  /*****************************************************************************
  -- ��Ż���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRentalDtl ( 
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE, 
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,     
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCM0051
       SET CD_NM  = v_CD_NM,
           USE_YN = v_USE_YN,
           RFR_2  = v_RFR_2,
           CHG_ID = v_REG_ID,
           CHG_DT = SYSDATE
     WHERE CD_GRP_CD = 'S302'
       AND CD        = v_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalDtl; 


  /*****************************************************************************
  -- ��Ż���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRentalDtl ( 
    v_CD_GRP_CD      IN RTCM0051.CD_GRP_CD%TYPE,          
    v_CD             IN RTCM0051.CD%TYPE,               
    v_CD_NM          IN RTCM0051.CD_NM%TYPE,          
    v_ORDER_PT       IN RTCM0051.ORDER_PT%TYPE,        
    v_USE_YN         IN RTCM0051.USE_YN%TYPE, 
    v_RFR_1          IN RTCM0051.RFR_1%TYPE,   
    v_RFR_2          IN RTCM0051.RFR_2%TYPE,     
    v_REG_ID         IN RTCM0051.REG_ID%TYPE,
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
  BEGIN
    DELETE
      FROM RTCM0051
     WHERE CD_GRP_CD = 'S302'
       AND CD        = v_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_DeleteRentalDtl; 

  
  /*****************************************************************************
  -- ��Ż����/������ȸ MASTER Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustMst (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_CD_NM IN RTCM0051.CD_NM%TYPE 
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.RFR_2 AS GRP_CD
           ,(SELECT CD_NM FROM RTCM0051 WHERE CD_GRP_CD = 'S301' AND CD = A.RFR_2) AS GRP_NM  
           ,A.CD
           ,A.CD_NM
      FROM RTCM0051 A    
     WHERE 1=1
       AND A.CD_GRP_CD = 'S302'
       AND A.RFR_2 IS NOT NULL
       AND (A.CD LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%' OR
            A.CD_NM LIKE '%' || DECODE(v_CD_NM, NULL, '%', v_CD_NM) || '%')
    ORDER BY A.RFR_2, A.CD
       ;
  END p_sRentalCustMst;
  
  

  /*****************************************************************************
  -- ��Ż����/������ȸ DETAIL Select
  *****************************************************************************/
  PROCEDURE p_sRentalCustDtl (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_GRP_CD          IN RTSD0007.RENTAL_GROUP%TYPE, /*�����ڵ� */
    v_CD              IN RTSD0007.RENTAL_OFFICE%TYPE, /*�����ڵ� */
    v_AGENCY_GBN      IN VARCHAR2, /* �Ǹ��ڱ��� */
    v_AGENCY_NM       IN RTSD0007.AGENCY_NM%TYPE /* �Ǹ��ڸ� */
    ) IS
        
  BEGIN
    IF v_AGENCY_GBN = '1' THEN
        OPEN Ref_Cursor FOR    
        
            SELECT A.AGENCY_CD            /* �Ǹ����ڵ�  */
                  ,A.AGENCY_NM            /* �Ǹ��θ�*/
                  ,NVL(B.CHK,0) AS CHK    /*����üũ*/
                  ,B.RENTAL_GROUP
                  ,B.RENTAL_OFFICE
             FROM RTSD0007 A
                  ,(
                    SELECT  RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTSD0007            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
              AND A.RENTAL_OFFICE = B.RENTAL_OFFICE(+)
              AND A.USE_YN = 'Y'
              AND (A.AGENCY_CD LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%' OR
                   A.AGENCY_NM LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%')
            ORDER BY A.AGENCY_CD ;
            
    ELSIF v_AGENCY_GBN = '2' THEN
        OPEN Ref_Cursor FOR    
        
            SELECT A.ORD_AGENT AGENCY_CD            /* �Ǹ����ڵ�  */
                  ,A.ORG_AGNM AGENCY_NM            /* �Ǹ��θ�*/
                  ,NVL(B.CHK,0) AS CHK    /*����üũ*/
                  ,B.RENTAL_GROUP
                  ,B.RENTAL_OFFICE
             FROM RTSD0113 A
                  ,(
                    SELECT  RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTSD0113            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
              AND A.RENTAL_OFFICE = B.RENTAL_OFFICE(+)
              AND A.USE_YN = 'Y'
              AND (A.ORD_AGENT LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%' OR
                   A.ORG_AGNM LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%')
            ORDER BY A.ORD_AGENT ;        
    
    ELSE
        OPEN Ref_Cursor FOR
    
            SELECT A.CARMASTER_NU AGENCY_CD            /* �Ǹ����ڵ�  */
                  ,A.CARMASTER_NM AGENCY_NM            /* �Ǹ��θ�*/
                  ,NVL(B.CHK,0) AS CHK    /*����üũ*/
                  ,B. RENTAL_GROUP
                  ,B. RENTAL_OFFICE
             FROM RTCS0002 A
                  ,(
                    SELECT  RENTAL_GROUP   
                           ,RENTAL_OFFICE         
                           ,1 AS CHK    
                      FROM RTCS0002            
                     WHERE 1 = 1
                       AND RENTAL_GROUP  = v_GRP_CD
                       AND RENTAL_OFFICE = v_CD
                   ) B
            WHERE A.RENTAL_GROUP  = B.RENTAL_GROUP(+)
              AND A.RENTAL_OFFICE = B.RENTAL_OFFICE(+)
              AND A.USE_YN = 'Y'
              AND (A.CARMASTER_NU LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%' OR
                   A.CARMASTER_NM LIKE '%' || DECODE(v_AGENCY_NM, NULL, '%', v_AGENCY_NM) || '%')
            ORDER BY A.AGENCY_CD ;
    
    END IF ;
            
  END p_sRentalCustDtl;


   /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRentalCust (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
    v_AGENCY_GBN     IN VARCHAR2, /* �Ǹ��ڱ��� */
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,           
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
    v_CNT  NUMBER;
    
  BEGIN
  
    IF v_Comm_Dvsn = 'U' THEN    
        IF v_AGENCY_GBN = '1' THEN
            IF 0 != f_UpdateRentalCust1(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_AGENCY_CD, v_REG_ID, v_ErrorText) THEN
                v_Return_Message := '��Ż����/�Ǹ��ڿ��� RTSD0007 ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        ELSIF v_AGENCY_GBN = '2' THEN
            IF 0 != f_UpdateRentalCust2(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_AGENCY_CD, v_REG_ID, v_ErrorText) THEN
                v_Return_Message := '��Ż����/�Ǹ��ڿ��� RTSD0113 ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_UpdateRentalCust3(v_RENTAL_GROUP, v_RENTAL_OFFICE, v_AGENCY_CD, v_REG_ID, v_ErrorText) THEN
                v_Return_Message := '��Ż����/�Ǹ��ڿ��� RTCS0002 ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        
        END IF;
            
    ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ����Ǿ����ϴ�';
    v_ErrorText := '';
    

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalCust(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTCM0110.p_IUDRentalCust(2)', v_ErrorText, v_Return_Message);
  END p_IUDRentalCust;     


  /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ��� RTSD0007 update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust1 ( 
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    
  BEGIN
    UPDATE RTSD0007
       SET RENTAL_GROUP  = v_RENTAL_GROUP,
           RENTAL_OFFICE = v_RENTAL_OFFICE,
           CHG_ID        = v_REG_ID,
           CHG_DT        = SYSDATE
     WHERE AGENCY_CD = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalCust1; 

  /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ��� RTSD0113 update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust2 ( 
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    
  BEGIN
    UPDATE RTSD0113
       SET RENTAL_GROUP  = v_RENTAL_GROUP,
           RENTAL_OFFICE = v_RENTAL_OFFICE,
           CHG_ID        = v_REG_ID,
           CHG_DT        = SYSDATE
     WHERE ORD_AGENT = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalCust2; 

  /*****************************************************************************
  -- ��Ż����/�Ǹ��ڿ��� RTCS0002 update
  *****************************************************************************/
  FUNCTION f_UpdateRentalCust3 ( 
    v_RENTAL_GROUP   IN RTSD0007.RENTAL_GROUP%TYPE,
    v_RENTAL_OFFICE  IN RTSD0007.RENTAL_OFFICE%TYPE,
    v_AGENCY_CD      IN RTSD0007.AGENCY_CD%TYPE,
    v_REG_ID         IN RTSD0007.REG_ID%TYPE,   
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER IS
    
  BEGIN
    UPDATE RTCS0002
       SET RENTAL_GROUP  = v_RENTAL_GROUP,
           RENTAL_OFFICE = v_RENTAL_OFFICE,
           CHG_ID        = v_REG_ID,
           CHG_DT        = SYSDATE
     WHERE CARMASTER_NU = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRentalCust3; 


  
END PKG_RENTAL_TEST;
/
