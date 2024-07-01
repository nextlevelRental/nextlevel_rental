CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTVW0033 AS
/*******************************************************************************
   NAME:     PKG_RTVW0033
   PURPOSE:  �Ҽ��Ǹ���

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-13  Sean             1. Created this package body.
*******************************************************************************/
  /*****************************************************************************
  -- ��Ż����/���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtvw0033 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_RENTAL_GROUP   IN RTVIEW33.RENTAL_GROUP%TYPE,        /* ��Ż ���� */
    v_RENTAL_OFFICE  IN RTVIEW33.RENTAL_OFFICE%TYPE,       /* ��Ż ���� */
    v_CHN_CD         IN CHAR                               /* ����: 1: �븮��, 2: �Ǹ���, 3:�ε�� */
    ) IS
  BEGIN
    IF v_CHN_CD = '1' THEN  -- �븮��
      IF (TRIM(v_RENTAL_OFFICE) IS NULL) THEN
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* �Ǹ����ڵ� 		    */    
             , V.AGENCY_NM	        /* �Ǹ�����   		    */    
             , V.SALES_GROUP	      /* �����ڵ�   		    */    
             , V.SALES_OFFICE	      /* �����ڵ�   		    */    
             , V.TEL_NO		          /* ��ȭ��ȣ   		    */
             , V.CHAN_CD		        /* ü�α���: S030	    */    
             , V.LIFNR		          /* �����ڵ�   		    */    
             , V.TAX_RQCD	          /* ���ݰ�꼭 ������*/  	
             , V.RENTAL_YN	        /* ��Ż�븮�� ���� 	  */
             , V.CHAN_LCLS_CD       /* ä�� ��з�: S090 */
             , V.CHAN_MCLS_CD       /* ä�� �ߺз�: S091 */
             , V.RENTAL_GROUP	      /* ��Ż���� 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* ��Ż���� 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* ����: �븮��(1), �Ǹ���(2), �ε��(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* �Ҽ��Ǹ��� View */
             , RTSD0052 G   /* ��Ż���� */  
             , RTSD0053 A   /* ��Ż���� */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)        
           AND V.CHAN_CD IN ('01', '05') /* �븮��, Ÿ�̾��ũ */
          ORDER BY V.AGENCY_CD
         ;
      ELSE       
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* �Ǹ����ڵ� 		    */    
             , V.AGENCY_NM	        /* �Ǹ�����   		    */    
             , V.SALES_GROUP	      /* �����ڵ�   		    */    
             , V.SALES_OFFICE	      /* �����ڵ�   		    */    
             , V.TEL_NO		          /* ��ȭ��ȣ   		    */
             , V.CHAN_CD		        /* ü�α���: S030	    */    
             , V.LIFNR		          /* �����ڵ�   		    */    
             , V.TAX_RQCD	          /* ���ݰ�꼭 ������*/  	
             , V.RENTAL_YN	        /* ��Ż�븮�� ���� 	  */
             , V.CHAN_LCLS_CD       /* ä�� ��з�: S090 */
             , V.CHAN_MCLS_CD       /* ä�� �ߺз�: S091 */
             , V.RENTAL_GROUP	      /* ��Ż���� 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* ��Ż���� 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* ����: �븮��(1), �Ǹ���(2), �ε��(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* �Ҽ��Ǹ��� View */
             , RTSD0052 G   /* ��Ż���� */  
             , RTSD0053 A   /* ��Ż���� */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)
           AND V.CHAN_CD IN ('01', '05') /* �븮��, Ÿ�̾��ũ */
           AND V.RENTAL_GROUP = v_RENTAL_GROUP                
           AND V.RENTAL_OFFICE = v_RENTAL_OFFICE                
          ORDER BY V.AGENCY_CD
         ;       
      END IF;
    ELSIF v_CHN_CD = '3' THEN  -- �ε��    
      IF (TRIM(v_RENTAL_OFFICE) IS NULL) THEN
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* �Ǹ����ڵ� 		    */    
             , V.AGENCY_NM	        /* �Ǹ�����   		    */    
             , V.SALES_GROUP	      /* �����ڵ�   		    */    
             , V.SALES_OFFICE	      /* �����ڵ�   		    */    
             , V.TEL_NO		          /* ��ȭ��ȣ   		    */
             , V.CHAN_CD		        /* ü�α���: S030	    */    
             , V.LIFNR		          /* �����ڵ�   		    */    
             , V.TAX_RQCD	          /* ���ݰ�꼭 ������*/  	
             , V.RENTAL_YN	        /* ��Ż�븮�� ���� 	  */
             , V.CHAN_LCLS_CD       /* ä�� ��з�: S090 */
             , V.CHAN_MCLS_CD       /* ä�� �ߺз�: S091 */
             , V.RENTAL_GROUP	      /* ��Ż���� 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* ��Ż���� 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* ����: �븮��(1), �Ǹ���(2), �ε��(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* �Ҽ��Ǹ��� View */
             , RTSD0052 G   /* ��Ż���� */  
             , RTSD0053 A   /* ��Ż���� */
             , RTCS0002 B   /* �ε�� ī����Ÿ ������ */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)        
           AND V.CHAN_LCLS_CD = '03' 
           AND V.AGENCY_CD = B.ORD_AGENT
          ORDER BY V.AGENCY_CD
         ;
      ELSE       
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* �Ǹ����ڵ� 		    */    
             , V.AGENCY_NM	        /* �Ǹ�����   		    */    
             , V.SALES_GROUP	      /* �����ڵ�   		    */    
             , V.SALES_OFFICE	      /* �����ڵ�   		    */    
             , V.TEL_NO		          /* ��ȭ��ȣ   		    */
             , V.CHAN_CD		        /* ü�α���: S030	    */    
             , V.LIFNR		          /* �����ڵ�   		    */    
             , V.TAX_RQCD	          /* ���ݰ�꼭 ������*/  	
             , V.RENTAL_YN	        /* ��Ż�븮�� ���� 	  */
             , V.CHAN_LCLS_CD       /* ä�� ��з�: S090 */
             , V.CHAN_MCLS_CD       /* ä�� �ߺз�: S091 */
             , V.RENTAL_GROUP	      /* ��Ż���� 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* ��Ż���� 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* ����: �븮��(1), �Ǹ���(2), �ε��(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* �Ҽ��Ǹ��� View */
             , RTSD0052 G   /* ��Ż���� */  
             , RTSD0053 A   /* ��Ż���� */
             , RTCS0002 B   /* �ε�� ī����Ÿ ������ */             
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)
           AND V.CHAN_LCLS_CD = '03' 
           AND V.AGENCY_CD = B.ORD_AGENT
           AND V.RENTAL_GROUP = v_RENTAL_GROUP                
           AND V.RENTAL_OFFICE = v_RENTAL_OFFICE                
          ORDER BY V.AGENCY_CD
         ;        
      END IF;      
    ELSIF v_CHN_CD = '2' THEN  -- �Ǹ���
      IF (TRIM(v_RENTAL_OFFICE) IS NULL) THEN
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* �Ǹ����ڵ� 		    */    
             , V.AGENCY_NM	        /* �Ǹ�����   		    */    
             , V.SALES_GROUP	      /* �����ڵ�   		    */    
             , V.SALES_OFFICE	      /* �����ڵ�   		    */    
             , V.TEL_NO		          /* ��ȭ��ȣ   		    */
             , V.CHAN_CD		        /* ü�α���: S030	    */    
             , V.LIFNR		          /* �����ڵ�   		    */    
             , V.TAX_RQCD	          /* ���ݰ�꼭 ������*/  	
             , V.RENTAL_YN	        /* ��Ż�븮�� ���� 	  */
             , V.CHAN_LCLS_CD       /* ä�� ��з�: S090 */
             , V.CHAN_MCLS_CD       /* ä�� �ߺз�: S091 */
             , V.RENTAL_GROUP	      /* ��Ż���� 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* ��Ż���� 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* ����: �븮��(1), �Ǹ���(2), �ε��(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* �Ҽ��Ǹ��� View */
             , RTSD0052 G   /* ��Ż���� */  
             , RTSD0053 A   /* ��Ż���� */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)        
           AND V.CHAN_LCLS_CD = '03' 
           AND NOT EXISTS
                   (SELECT 'O'
                      FROM RTCS0002 B /* �ε�� ī����Ÿ ������ */
                     WHERE B.ORD_AGENT = V.AGENCY_CD)
          ORDER BY V.AGENCY_CD
         ;
      ELSE       
        OPEN Ref_Cursor FOR  
        SELECT 0 AS CHK
             , V.AGENCY_CD	        /* �Ǹ����ڵ� 		    */    
             , V.AGENCY_NM	        /* �Ǹ�����   		    */    
             , V.SALES_GROUP	      /* �����ڵ�   		    */    
             , V.SALES_OFFICE	      /* �����ڵ�   		    */    
             , V.TEL_NO		          /* ��ȭ��ȣ   		    */
             , V.CHAN_CD		        /* ü�α���: S030	    */    
             , V.LIFNR		          /* �����ڵ�   		    */    
             , V.TAX_RQCD	          /* ���ݰ�꼭 ������*/  	
             , V.RENTAL_YN	        /* ��Ż�븮�� ���� 	  */
             , V.CHAN_LCLS_CD       /* ä�� ��з�: S090 */
             , V.CHAN_MCLS_CD       /* ä�� �ߺз�: S091 */
             , V.RENTAL_GROUP	      /* ��Ż���� 		      */
             , G.RENTAL_GROUP_NM
             , V.RENTAL_OFFICE	    /* ��Ż���� 		      */
             , A.RENTAL_OFFICE_NM
             , v_CHN_CD AS CHN_CL   /* ����: �븮��(1), �Ǹ���(2), �ε��(3) */
             , '' AS RENTAL_GROUP_NEW
             , '' AS RENTAL_GROUP_NM_NEW
             , '' AS RENTAL_OFFICE_NEW
             , '' AS RENTAL_OFFICE_NM_NEW
          FROM RTVIEW33 V   /* �Ҽ��Ǹ��� View */
             , RTSD0052 G   /* ��Ż���� */  
             , RTSD0053 A   /* ��Ż���� */
         WHERE 1=1
           AND V.RENTAL_GROUP = G.RENTAL_GROUP(+)
           AND V.RENTAL_OFFICE = A.RENTAL_OFFICE(+)
           AND V.CHAN_LCLS_CD = '03' 
           AND NOT EXISTS
                   (SELECT 'O'
                      FROM RTCS0002 B /* �ε�� ī����Ÿ ������ */
                     WHERE B.ORD_AGENT = V.AGENCY_CD)
           AND V.RENTAL_GROUP = v_RENTAL_GROUP                
           AND V.RENTAL_OFFICE = v_RENTAL_OFFICE                
          ORDER BY V.AGENCY_CD
         ;        
      END IF;      
    END IF;      
  END p_sRtvw0033;
  
  /*****************************************************************************
  -- ��Ż����/���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtvw0033 (
    v_Comm_Dvsn      IN CHAR,                           /* ó������(I,U,D)     */
    v_CHN_CL         IN CHAR,                           /* �����ڵ�            */
    v_AGENCY_CD      IN RTVIEW33.AGENCY_CD%TYPE,        /* �븮���ڵ�          */
    v_RENTAL_GROUP_NEW IN RTVIEW33.RENTAL_GROUP%TYPE,   /* ��Ż����            */
    v_RENTAL_OFFICE_NEW IN RTVIEW33.RENTAL_OFFICE%TYPE, /* ��Ż����            */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,           /* ����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    e_Error EXCEPTION;    
  BEGIN 
 
    IF v_CHN_CL = '1' THEN -- �븮�� 
      IF 0 != f_UpdateRTSD0007(v_AGENCY_CD, v_RENTAL_GROUP_NEW, v_RENTAL_OFFICE_NEW, 
                               v_Reg_Id, v_ErrorText) THEN
          v_Return_Message := '��Ż����/����(�븮��) ���� ����!!!'||'-'||v_ErrorText;
          v_ErrorText := v_ErrorText;
          RAISE e_Error;
      END IF;
    ELSIF v_CHN_CL = '2' THEN -- �Ǹ���
      IF 0 != f_UpdateRTSD0113(v_AGENCY_CD, v_RENTAL_GROUP_NEW, v_RENTAL_OFFICE_NEW, 
                               v_Reg_Id, v_ErrorText) THEN
          v_Return_Message := '��Ż����/����(�Ǹ���) ���� ����!!!'||'-'||v_ErrorText;
          v_ErrorText := v_ErrorText;
          RAISE e_Error;
      END IF;      
    ELSIF v_CHN_CL = '3' THEN -- �ε��
      IF 0 != f_UpdateRTCS0002(v_AGENCY_CD, v_RENTAL_GROUP_NEW, v_RENTAL_OFFICE_NEW, 
                               v_Reg_Id, v_ErrorText) THEN
          v_Return_Message := '��Ż����/����(�ε��) ���� ����!!!'||'-'||v_ErrorText;
          v_ErrorText := v_ErrorText;
          RAISE e_Error;
      END IF;    
    ELSE
        v_Return_Message := '�����ڵ�(1,2,3)�� ����!!!['||v_CHN_CL||']';
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

        Pkg_Utility.p_ErrorFileWrite('PKG_RTVW0033.p_IUDRtvw0033(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTVW0033.p_IUDRtvw0033(2)', v_ErrorText, v_Return_Message);
  END p_IUDRtvw0033;  
  
  /*****************************************************************************
  -- ��Ż����/����(�븮��) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0007 ( 
    v_AGENCY_CD         IN RTSD0007.AGENCY_CD%TYPE,     /* �븮���ڵ�          */
    v_RENTAL_GROUP_NEW  IN RTSD0007.RENTAL_GROUP%TYPE,  /* ��Ż����            */
    v_RENTAL_OFFICE_NEW IN RTSD0007.RENTAL_OFFICE%TYPE, /* ��Ż����            */
    v_Reg_Id            IN RTSD0007.REG_ID%TYPE,        /* ����� ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0007
       SET RENTAL_GROUP  = v_RENTAL_GROUP_NEW,
           RENTAL_OFFICE = v_RENTAL_OFFICE_NEW,
           CHG_ID		     = v_Reg_Id,
           CHG_DT		     = SYSDATE
     WHERE AGENCY_CD     = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTSD0007;    

  /*****************************************************************************
  -- ��Ż����/����(�Ǹ���) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0113 ( 
    v_AGENCY_CD         IN RTSD0113.ORD_AGENT%TYPE,     /* �Ǹ��ι�ȣ          */
    v_RENTAL_GROUP_NEW  IN RTSD0113.RENTAL_GROUP%TYPE,  /* ��Ż����            */
    v_RENTAL_OFFICE_NEW IN RTSD0113.RENTAL_OFFICE%TYPE, /* ��Ż����            */
    v_Reg_Id            IN RTSD0113.REG_ID%TYPE,        /* ����� ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0113
       SET RENTAL_GROUP  = v_RENTAL_GROUP_NEW,
           RENTAL_OFFICE = v_RENTAL_OFFICE_NEW,
           CHG_ID		     = v_Reg_Id,
           CHG_DT		     = SYSDATE
     WHERE ORD_AGENT     = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTSD0113;
  
  /*****************************************************************************
  -- ��Ż����/����(�ε��) Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCS0002 ( 
    v_AGENCY_CD         IN RTCS0002.ORD_AGENT%TYPE,     /* �븮���ڵ�          */
    v_RENTAL_GROUP_NEW  IN RTCS0002.RENTAL_GROUP%TYPE,  /* ��Ż����            */
    v_RENTAL_OFFICE_NEW IN RTCS0002.RENTAL_OFFICE%TYPE, /* ��Ż����            */
    v_Reg_Id            IN RTCS0002.REG_ID%TYPE,        /* ����� ID           */
    v_ErrorText        OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTCS0002
       SET RENTAL_GROUP  = v_RENTAL_GROUP_NEW,
           RENTAL_OFFICE = v_RENTAL_OFFICE_NEW,
           CHG_ID		     = v_Reg_Id,
           CHG_DT		     = SYSDATE
     WHERE ORD_AGENT     = v_AGENCY_CD
    ;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
  END f_UpdateRTCS0002;  
END PKG_RTVW0033;
/
