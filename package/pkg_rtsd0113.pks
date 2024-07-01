CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0113 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0113
   PURPOSE   �Ǹ������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
   1.1        2016-04-21  �̿���           ä�� ��/�ߺз� �׸� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �Ǹ������� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0113Count(
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE         /*�Ǹ��ι�ȣ          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹ������� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE       /*����ó                */
    );

  /*****************************************************************************
  -- �Ǹ������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*����ó                */    
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*ä�α���              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*�����ڵ�              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*�������              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*����                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹ������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*����ó                */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*ä�α���              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*�����ڵ�              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*�������              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*����                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */          
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹ������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �Ǹ������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0113 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*����ó                */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*ä�α���              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*�����ڵ�              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*�������              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*����                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */          
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �Ǹ������� Select - �Ǹ��� ���� ��ȸ �˾�
  *****************************************************************************/
  PROCEDURE p_sRtsd0113Popup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ����ڵ�            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE         /*ä������              */
    );

  /*****************************************************************************
  -- �Ǹ������� Select - ���ѱ׷캰 ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0113UserGrp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE        /*���ѱ׷�              */
    );

  /*****************************************************************************
  -- �Ǹ������� Select - �Ǹ��� ���
  *****************************************************************************/
  PROCEDURE p_sRtsd0113List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /* �Ǹ��ι�ȣ            */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /* ��뿩��              */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    );

  /*****************************************************************************
  -- �Ǹ������� -  �Ǹ��ι�ȣ ���� �ʵ����� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0113FieldValue(
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,        /*�Ǹ��ι�ȣ          */
    v_Field_Nm       IN VARCHAR,                        /*�ʵ��              */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE            /*��뿩��            */    
    ) RETURN VARCHAR2;
        
END Pkg_Rtsd0113;
/
