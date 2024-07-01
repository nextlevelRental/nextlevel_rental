CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0050 AS
/*******************************************************************************
   NAME:     PKG_RTSD0050
   PURPOSE:  ��Ż������

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-05  Sean             1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- ��Ż������ ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0050 (
    Ref_Cursor            IN OUT SYS_REFCURSOR,
    v_RTMASTER_NM         IN RTSD0050.RTMASTER_NM%TYPE        /* ��Ż ������ �� */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT RTMASTER_NU	/* ��Ż ������ ��� */
        , RTMASTER_NM	  /* ��Ż ������ ��   */
        , MOB_NO		    /* �ڵ�����ȣ       */
        , TEL_NO		    /* ��ȭ��ȣ         */
        , USE_YN		    /* ��Ż�����Ϳ���   */
        , REG_ID		    /* ����� ID        */
        , REG_DT		    /* �����           */
        , CHG_ID		    /* ������ ID        */
        , CHG_DT		    /* ������           */
      FROM RTSD0050     /* ��Ż������ */
     WHERE 1=1
       AND RTMASTER_NM LIKE TRIM(v_RTMASTER_NM) || '%'
;
  END p_sRtsd0050;

  /*****************************************************************************
  -- ��Ż������ �������� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0050MgmtArea (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RTMASTER_NU    IN RTSD0050.RTMASTER_NU%TYPE        /* ��Ż ������ ��� */
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR  
  SELECT MM.RTMASTER_NU     /* ��Ż ������ ��� */
       , MM.RENTAL_GROUP    /* ��Ż���� */
       , G.RENTAL_GROUP_NM
       , MM.RENTAL_OFFICE   /* ��Ż���� */
       , A.RENTAL_OFFICE_NM
       , MM.STR_DAY         /* �������� */
       , MM.END_DAY         /* �������� */
       , MM.REG_ID		      /* ����� ID */
       , MM.REG_DT		      /* �����    */
       , MM.CHG_ID		      /* ������ ID */
       , MM.CHG_DT		      /* ������    */     
    FROM RTSD0050 M       /* ��Ż������ */
       , RTSD0051 MM      /* ��Ż ������ �������� */
       , RTSD0052 G       /* ��Ż���� */
       , RTSD0053 A       /* ��Ż���� */
   WHERE 1=1
     AND G.RENTAL_GROUP = A.RENTAL_GROUP   
     AND M.RTMASTER_NU = MM.RTMASTER_NU(+)
     AND MM.RENTAL_GROUP = G.RENTAL_GROUP(+)
     AND MM.RENTAL_OFFICE = A.RENTAL_OFFICE(+)
     AND M.RTMASTER_NU = v_RTMASTER_NU
     AND MM.STR_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
     AND ( 
           CASE 
                WHEN MM.END_DAY IS NULL THEN TO_CHAR(SYSDATE+1, 'YYYYMMDD')
                ELSE MM.END_DAY
           END
         ) > TO_CHAR(SYSDATE, 'YYYYMMDD')
   ORDER BY MM.RTMASTER_NU, MM.RENTAL_GROUP, MM.RENTAL_OFFICE         
;
  END p_sRtsd0050MgmtArea;    

  /*****************************************************************************
  -- �Ҽ��Ǹ��� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0050SalesAgent (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTSD0052.RENTAL_GROUP%TYPE,      /* ��Ż���� */
    v_RTMASTER_NU    IN RTSD0050.RTMASTER_NU%TYPE        /* ��Ż ������ ��� */    
    ) IS
  BEGIN
    OPEN Ref_Cursor FOR      
    SELECT V.AGENCY_CD	        /* �Ǹ����ڵ� 		    */    
         , V.AGENCY_NM	        /* �Ǹ�����   		    */    
         , V.SALES_GROUP	      /* �����ڵ�   		    */    
         , V.SALES_OFFICE	      /* �����ڵ�   		    */    
         , V.TEL_NO		          /* ��ȭ��ȣ   		    */    
         , V.CHAN_CD		        /* ü�α���   		    */    
         , V.LIFNR		          /* �����ڵ�   		    */    
         , V.TAX_RQCD	          /* ���ݰ�꼭 ������*/  	
         , V.RENTAL_YN	        /* ��Ż�븮�� ���� 	  */
         , V.CHAN_LCLS_CD       /* ä�� ��з�       */
         , V.CHAN_MCLS_CD       /* ä�� �ߺз�       */         
         , V.RENTAL_GROUP	      /* ��Ż���� 		      */
         , G.RENTAL_GROUP_NM
         , V.RENTAL_OFFICE	    /* ��Ż���� 		      */
         , A.RENTAL_OFFICE_NM
      FROM RTVIEW33 V   /* �Ҽ��Ǹ��� View */
         , RTSD0052 G   /* ��Ż���� */  
         , RTSD0053 A   /* ��Ż���� */  
     WHERE 1=1
       AND V.RENTAL_GROUP = G.RENTAL_GROUP
       AND V.RENTAL_OFFICE = A.RENTAL_OFFICE
       AND V.RENTAL_GROUP = v_RENTAL_GROUP
      AND V.RENTAL_OFFICE in (  
          SELECT IMM.RENTAL_OFFICE  /* ��Ż���� */
            FROM RTSD0050 IM     /* ��Ż������ */
               , RTSD0051 IMM    /* ��Ż ������ �������� */
               , RTSD0053 IA     /* ��Ż���� */
           WHERE 1=1
             AND IM.RTMASTER_NU = IMM.RTMASTER_NU
             AND IMM.RENTAL_OFFICE = IA.RENTAL_OFFICE
             AND IM.RTMASTER_NU = v_RTMASTER_NU
             AND IMM.STR_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
             AND IMM.END_DAY > TO_CHAR(SYSDATE, 'YYYYMMDD')  
      )    
;
  END p_sRtsd0050SalesAgent;

   /*****************************************************************************
  -- ��Ż������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0050 (
    v_Comm_Dvsn       IN CHAR,                         /* ó������(I,U,D) */
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,	
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE,		  
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS  

    e_Error EXCEPTION;
    
  BEGIN
 
    IF v_Comm_Dvsn = 'I' THEN
      IF 0 <> f_sRTSD0050Count(v_RTMASTER_NU) THEN
          v_Return_Message := '�ߺ����� : �̹� �����ϴ� ���('||v_RTMASTER_NU||')�Դϴ�!';
          RAISE e_Error;
      END IF;
      
      IF 0 != f_InsertRTSD0050(v_RTMASTER_NU, v_RTMASTER_NM, v_MOB_NO, v_TEL_NO,
                               v_USE_YN, v_REG_ID, v_ErrorText) THEN
            v_Return_Message := '��Ż������ ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
      END IF;        
    ELSIF v_Comm_Dvsn = 'U' THEN
      IF (TRIM(v_RTMASTER_NU) IS NULL) THEN
          v_Return_Message := '��Ż������ ���('||v_RTMASTER_NU||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
          RAISE e_Error;
      END IF;
    
      IF 0 = f_sRTSD0050Count(v_RTMASTER_NU) THEN
          v_Return_Message := '���('||v_RTMASTER_NU||')�� �ش��ϴ� ��Ż������ ������ �����ϴ�.!';
          RAISE e_Error;
      END IF;    
    
      IF 0 != f_UpdateRTSD0050(v_RTMASTER_NU, v_RTMASTER_NM, v_MOB_NO, v_TEL_NO,
                               v_USE_YN, v_REG_ID, v_ErrorText) THEN
          v_Return_Message := '��Ż������ ���� ����!!!'||'-'||v_ErrorText;
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
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0050.p_IUDRTSD0050(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0050.p_IUDRTSD0050(2)', v_ErrorText, v_Return_Message);
  END p_IUDRtsd0050;  

  /*****************************************************************************
  -- ��Ż������ Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0050 (
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,	
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE,
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    INSERT  INTO RTSD0050 (
            RTMASTER_NU
          , RTMASTER_NM
          , MOB_NO		 
          , TEL_NO		 
          , USE_YN		 
          , REG_ID		 
          , REG_DT		 
          , CHG_ID		 
          , CHG_DT	   
            )
    VALUES  (
            v_RTMASTER_NU,
            v_RTMASTER_NM,
            v_MOB_NO,
            v_TEL_NO,
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
  END f_InsertRTSD0050;    

  /*****************************************************************************
  -- ��Ż������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0050 ( 
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE,
    v_RTMASTER_NM     IN RTSD0050.RTMASTER_NM%TYPE,
    v_MOB_NO          IN RTSD0050.MOB_NO%TYPE,
    v_TEL_NO          IN RTSD0050.TEL_NO%TYPE,
    v_USE_YN          IN RTSD0050.USE_YN%TYPE,
    v_REG_ID    		  IN RTSD0050.REG_ID%TYPE, 
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0050
       SET RTMASTER_NM = v_RTMASTER_NM,
           MOB_NO      = v_MOB_NO,
           TEL_NO      = v_TEL_NO,
           USE_YN			 = v_USE_YN,
           CHG_ID		   = v_REG_ID,
           CHG_DT		   = SYSDATE
     WHERE RTMASTER_NU = v_RTMASTER_NU
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTSD0050; 

  /*****************************************************************************
  -- ��Ż������ - ��Ż ������ ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0050NuSeq RETURN VARCHAR2 IS
    v_NuSeq   RTSD0050.RTMASTER_NU%TYPE default 0; /* ��Ż ������ ��� */
  BEGIN
    SELECT  SEQ_RTSD0050RTMASTER_NU_SEQ.NEXTVAL NU_SEQ
      INTO  v_NuSeq
      FROM  DUAL;

    RETURN v_NuSeq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
  END f_sRtsd0050NuSeq;
  
  /*****************************************************************************
  -- ��Ż������ Count
  *****************************************************************************/
  FUNCTION f_sRTSD0050Count ( 
    v_RTMASTER_NU	    IN RTSD0050.RTMASTER_NU%TYPE
    ) RETURN NUMBER IS
    v_curr_cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cnt
    FROM    RTSD0050
    WHERE   RTMASTER_NU = v_RTMASTER_NU
    ;

    RETURN v_curr_cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;
  END f_sRTSD0050Count;  
END PKG_RTSD0050;
/
