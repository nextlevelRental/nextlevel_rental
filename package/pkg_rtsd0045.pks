CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0045 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0045
   PURPOSE:   �Ǹ�ä�ε��

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-11-20   sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- �Ǹ�ä�ε�� [�߰�] Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0045 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0045.SALE_CD%TYPE     /* �ǸŻ�ǰ�ڵ�            */
  );

  /*****************************************************************************
  -- ���������� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0045select (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0045.SALE_CD%TYPE     /* �ǸŻ�ǰ�ڵ�            */
  );

  /*****************************************************************************
  -- ���������� ������ �ڵ常 ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0045selectAdd (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0045.SALE_CD%TYPE,     /* �ǸŻ�ǰ�ڵ�            */
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE      /* �θ��ڵ�              */
  );
        
  /*****************************************************************************
  -- �Ǹ�ä�ε�� [�߰�] �̺�Ʈ(2-3����)
  *****************************************************************************/
  PROCEDURE p_sRtsd0045_detail (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE      /* �θ��ڵ�              */
  ); 
  
  /*****************************************************************************
  -- ä�α��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0045 (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D)       */
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* �Ǹ��ڵ�              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE,        /* ä�α���(��з�)       */
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE,      /* �θ��ڵ�              */
    v_ORG_CD         IN RTSD0045.ORG_CD%TYPE,         /* �Ǹ����ڵ�            */    
    v_ORG_NM         IN RTSD0045.ORG_NM%TYPE,         /* �Ǹ��θ�              */
    v_Reg_Id         IN RTSD0045.REG_ID%TYPE,         /* ����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- �Ǹ��ڵ� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0045Count(
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* �Ǹ��ڵ�              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE         /* ä�α���(��з�)       */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0045 (
    v_SALE_CD         IN RTSD0045.SALE_CD%TYPE        /* �Ǹ��ڵ�              */
    ) RETURN NUMBER;    

  /*****************************************************************************
  -- Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0045 (
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* �Ǹ��ڵ�              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE,        /* ä�α���(��з�)       */
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE,      /* �θ��ڵ�              */
    v_ORG_CD         IN RTSD0045.ORG_CD%TYPE,         /* �Ǹ����ڵ�            */        
    v_ORG_NM         IN RTSD0045.ORG_NM%TYPE,         /* �Ǹ��θ�              */ 
    v_Reg_Id         IN RTSD0045.REG_ID%TYPE,         /* ����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0045filter (
    Ref_Cursor      IN OUT SYS_REFCURSOR,    
    v_Org_Nm        IN     RTSD0045.ORG_NM%TYPE     /* �Ǹ��θ�                */
  );  
  
  /*****************************************************************************
  -- ��ǰ�Ǹű��� �� ���ä�� ���
  *****************************************************************************/
  PROCEDURE p_userChanCdList(
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_SALE_CD       IN RTSD0045.SALE_CD%TYPE          /* �Ǹ��ڵ�             */
   );
  
END Pkg_Rtsd0045;
/
