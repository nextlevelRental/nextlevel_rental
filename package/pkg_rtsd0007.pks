CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0007 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0007
   PURPOSE   �븮�� ���� ����

   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------
   1.0      2015-06-29  jemcarry    1. Created this package body.
   1.1      2016-04-21  �̿���      ä�� ��/�ߺз� �׸� �߰�    
   1.2      2016-09-05  wjim        �¶������� ���ɿ��� �׸� �߰�
   1.2.1    2016-11-28  wjim        [20161125_01] �ݼ��Ϳ� �븮����ȸ ��� �߰�
   1.4      2017-12-26  wjim        [20171226_01] ��� �߰�
   1.4      2017-12-26  wjim        [20171226_01] ��� �߰�
   1.5      2018-03-12  wjim        [20180312_01] Ż����, ����θ�Ʈ, �뷱�� �߰�
   1.8      2019-07-31  wjim        [20190731_01] ���ݹ�ȯ���� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �븮�� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0007Count(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE         /*�븮���ڵ�          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �븮�� ���� Select
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.5      2018-03-12  wjim        [20180312_01] Ż����, ����θ�Ʈ, �뷱�� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtsd0007 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*�븮����              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*��Ż�븮�� ����       */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Lm_Yn          IN RTSD0007.LM_YN%TYPE,          /*������ ���ɿ���       */
    v_Fm_Yn          IN RTSD0007.FM_YN %TYPE,         /*1������ ���ɿ���      */
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*�¶������� ���ɿ���   */
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*Ż���� �ڵ�           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*����θ�Ʈ �ڵ�       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE      /*�뷱�� �ڵ�           */ --[20180312_01]
  );
    
  /*****************************************************************************
  -- �븮�� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0007AgencyCode (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,     /*�븮����              */
    v_LOGIN_ID       IN VARCHAR2,                    /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                     /* �α��� ����� �׷� */
    );

  /*****************************************************************************
  -- �븮�� ���� Insert
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.4      2017-12-26  wjim        [20171226_01] ��� �߰�
   1.5      2018-03-12  wjim        [20180312_01] Ż����, ����θ�Ʈ, �뷱�� �߰�
   1.8      2019-07-31  wjim        [20190731_01] ���ݹ�ȯ���� �߰�
  *****************************************************************************/
  FUNCTION f_InsertRtsd0007 (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*�븮����              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTSD0007.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*���ּ�              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*�����Ϸù�ȣ          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX��ȣ               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*����ڹ�ȣ            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*��ǥ��                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*����                  */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*��Ż�븮�� ����       */
    v_Str_Day        IN RTSD0007.STR_DAY%TYPE,        /*��Ż�븮�� ������     */
    v_End_Day        IN RTSD0007.END_DAY%TYPE,        /*��Ż�븮�� ������     */
    v_Pos_X          IN RTSD0007.POS_X%TYPE,          /*X��ǥ                 */
    v_Pos_Y          IN RTSD0007.POS_Y%TYPE,          /*Y��ǥ                 */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*��������              */
    v_Lm_Yn          IN RTSD0007.LM_YN %TYPE,         /*������ ���ɿ���       */
    v_Fm_Yn          IN RTSD0007.FM_YN %TYPE,         /*1������ ���ɿ���      */
    v_Cw_Yn          IN RTSD0007.CW_YN %TYPE,         /*���� ���ɿ���         */
    v_Ch_Yn          IN RTSD0007.CH_YN %TYPE,         /*��õ������ ����       */
    v_Olimit_Cnt     IN RTSD0007.OLIMIT_CNT%TYPE,     /*�븮�� �� �ֹ����ѰǼ�*/
    v_Lifnr          IN RTSD0007.LIFNR%TYPE,          /*�����ڵ�              */
    v_Tax_Rqcd       IN RTSD0007.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0007.CHAN_LCLS_CD%TYPE,   /*ä�� ��з�           */
    v_chan_Mcls_Cd   IN RTSD0007.CHAN_MCLS_CD%TYPE,   /*ä�� �ߺз�           */     
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*�¶������� ���ɿ���   */
    v_Memo           IN RTSD0007.MEMO%TYPE,           /*���                  */ --[20171226_01]
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*Ż���� �ڵ�           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*����θ�Ʈ �ڵ�       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,     /*�뷱�� �ڵ�           */ --[20180312_01]
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,   /*��Ż���� �ڵ�         */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,  /*��Ż���� �ڵ�         */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,        /*���� �ڵ�             */
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*���ݹ�ȯ����        */ --[20190731_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �븮�� ���� Update
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.4      2017-12-26  wjim        [20171226_01] ��� �߰�
   1.5      2018-03-12  wjim        [20180312_01] Ż����, ����θ�Ʈ, �뷱�� �߰�
   1.8      2019-07-31  wjim        [20190731_01] ���ݹ�ȯ���� �߰�
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0007 (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*�븮����              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTSD0007.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*���ּ�              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*�����Ϸù�ȣ          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX��ȣ               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*����ڹ�ȣ            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*��ǥ��                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*����                  */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*��Ż�븮�� ����       */
    v_Str_Day        IN RTSD0007.STR_DAY%TYPE,        /*��Ż�븮�� ������     */
    v_End_Day        IN RTSD0007.END_DAY%TYPE,        /*��Ż�븮�� ������     */
    v_Pos_X          IN RTSD0007.POS_X%TYPE,          /*X��ǥ                 */
    v_Pos_Y          IN RTSD0007.POS_Y%TYPE,          /*Y��ǥ                 */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*��������              */
    v_Lm_Yn          IN RTSD0007.LM_YN %TYPE,         /*������ ���ɿ���       */
    v_Fm_Yn          IN RTSD0007.FM_YN %TYPE,         /*1������ ���ɿ���      */
    v_Cw_Yn          IN RTSD0007.CW_YN %TYPE,         /*���� ���ɿ���         */
    v_Ch_Yn          IN RTSD0007.CH_YN %TYPE,         /*��õ������ ����       */
    v_Olimit_Cnt     IN RTSD0007.OLIMIT_CNT%TYPE,     /*�븮�� �� �ֹ����ѰǼ�*/
    v_Lifnr          IN RTSD0007.LIFNR%TYPE,          /*�����ڵ�              */
    v_Tax_Rqcd       IN RTSD0007.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0007.CHAN_LCLS_CD%TYPE,   /*ä�� ��з�           */
    v_chan_Mcls_Cd   IN RTSD0007.CHAN_MCLS_CD%TYPE,   /*ä�� �ߺз�           */    
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*�¶������� ���ɿ���   */
    v_Memo           IN RTSD0007.MEMO%TYPE,           /*���                  */ --[20171226_01]
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*Ż���� �ڵ�           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*����θ�Ʈ �ڵ�       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,     /*�뷱�� �ڵ�           */ --[20180312_01]
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,   /*��Ż���� �ڵ�         */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,  /*��Ż���� �ڵ�         */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,        /*���� �ڵ�             */
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*���ݹ�ȯ����        */ --[20190731_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �븮�� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0007 (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �븮�� ���� ����(IUD)
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.4      2017-12-26  wjim        [20171226_01] ��� �߰�
   1.5      2018-03-12  wjim        [20180312_01] Ż����, ����θ�Ʈ, �뷱�� �߰�
   1.8      2019-07-31  wjim        [20190731_01] ���ݹ�ȯ���� �߰�
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0007 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*�븮����              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTSD0007.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*���ּ�              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*�����Ϸù�ȣ          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX��ȣ               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*����ڹ�ȣ            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*��ǥ��                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*����                  */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*��Ż�븮�� ����       */
    v_Str_Day        IN RTSD0007.STR_DAY%TYPE,        /*��Ż�븮�� ������     */
    v_End_Day        IN RTSD0007.END_DAY%TYPE,        /*��Ż�븮�� ������     */
    v_Pos_X          IN RTSD0007.POS_X%TYPE,          /*X��ǥ                 */
    v_Pos_Y          IN RTSD0007.POS_Y%TYPE,          /*Y��ǥ                 */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*��������              */
    v_Lm_Yn          IN RTSD0007.LM_YN %TYPE,         /*������ ���ɿ���       */
    v_Fm_Yn          IN RTSD0007.FM_YN %TYPE,         /*1������ ���ɿ���      */
    v_Cw_Yn          IN RTSD0007.CW_YN %TYPE,         /*���� ���ɿ���         */
    v_Ch_Yn          IN RTSD0007.CH_YN %TYPE,         /*��õ������ ����       */
    v_Olimit_Cnt     IN RTSD0007.OLIMIT_CNT%TYPE,     /*�븮�� �� �ֹ����ѰǼ�*/
    v_Lifnr          IN RTSD0007.LIFNR%TYPE,          /*�����ڵ�              */
    v_Tax_Rqcd       IN RTSD0007.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0007.CHAN_LCLS_CD%TYPE,   /*ä�� ��з�           */
    v_chan_Mcls_Cd   IN RTSD0007.CHAN_MCLS_CD%TYPE,   /*ä�� �ߺз�           */     
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*�¶������� ���ɿ���   */
    v_Memo           IN RTSD0007.MEMO%TYPE,           /*���                  */ --[20171226_01]
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*Ż���� �ڵ�           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*����θ�Ʈ �ڵ�       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,     /*�뷱�� �ڵ�           */ --[20180312_01]
    v_Rental_Group   IN RTSD0007.RENTAL_GROUP%TYPE,   /*��Ż���� �ڵ�         */
    v_Rental_Office  IN RTSD0007.RENTAL_OFFICE%TYPE,  /*��Ż���� �ڵ�         */
    v_Prpl_Yn        IN RTSD0007.PRPL_YN%TYPE,        /*���� �ڵ�             */
    v_Apfd_End_Yn    IN RTSD0007.APFD_END_YN%TYPE,    /*���ݹ�ȯ����        */ --[20190731_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- �븮�� ���� ��ȸ - �븮���ڵ�� �븮���� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0007AgencyNm(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE         /*�븮���ڵ�          */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- �븮�� ���� Select - �븮�� ���� ��ȸ �˾�
  
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------   
   1.5      2018-03-12  wjim        [20180312_01] Ż����, ����θ�Ʈ, �뷱�� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtsd0007Popup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*�븮����              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Rental_Yn      IN RTSD0007.RENTAL_YN%TYPE,      /*��Ż�븮�� ����       */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Lm_Yn          IN RTSD0007.LM_YN%TYPE,          /*������ ���ɿ���       */
    v_Fm_Yn          IN RTSD0007.FM_YN%TYPE,          /*1������ ���ɿ���      */
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /*�¶������� ���ɿ���   */
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*Ż���� �ڵ�           */ --[20180312_01]
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*����θ�Ʈ �ڵ�       */ --[20180312_01]
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE,      /*�뷱�� �ڵ�           */ --[20180312_01]
    v_RENTAL_GROUP   IN VARCHAR2,                       /*��Ż����*/
    v_RENTAL_OFFICE  IN VARCHAR2,                       /*��Ż����*/
    v_LOGIN_ID       IN VARCHAR2,                      /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                       /* �α��� ����� �׷� */
    );

/*****************************************************************************
  -- �븮�� ���� Update - EAI Interface �븮�� ���� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0007Interface (
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*�븮����              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Pos_Cd         IN RTSD0007.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTSD0007.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTSD0007.STREET%TYPE,         /*���ּ�              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Ser_No         IN RTSD0007.SER_NO%TYPE,         /*�����Ϸù�ȣ          */
    v_Tel_No         IN RTSD0007.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Mob_No         IN RTSD0007.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Fax_No         IN RTSD0007.FAX_NO%TYPE,         /*FAX��ȣ               */
    v_Tax_No         IN RTSD0007.TAX_NO%TYPE,         /*����ڹ�ȣ            */
    v_Rep_Nm         IN RTSD0007.REP_NM%TYPE,         /*��ǥ��                */
    v_Busi_Type      IN RTSD0007.BUSI_TYPE%TYPE,      /*����                  */
    v_Busi_Cond      IN RTSD0007.BUSI_COND%TYPE,      /*����                  */
    v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE,     /*��������              */
    v_Use_Yn         IN RTSD0007.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0007.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �븮�� �� �ֹ����ѰǼ� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0007SetOlimitCntCount(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE       /*���� �븮��           */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �븮�� �������� üũ
  *****************************************************************************/
  FUNCTION f_sRtsd0007GetSeasonGbn(
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE       /*���� �븮��           */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- �Ǹ�������VIEW List   
  *****************************************************************************/
  PROCEDURE p_sRtview02List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0007.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*�븮����              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*ä�α���              */
    v_Lifnr          IN RTSD0007.LIFNR%TYPE,          /*�����ڵ�              */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    );
    
  /*****************************************************************************
  -- �ݼ��Ϳ� �븮�� ���� Select
   REVISIONS
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------
   1.2.1    2016-11-28  wjim        [20161125_01] �ݼ��Ϳ� �븮����ȸ ��� �߰�   
   1.5      2018-03-12  wjim        [20180312_01] Ż����, ����θ�Ʈ, �뷱�� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtsd0007Call (
      Ref_Cursor       IN OUT SYS_REFCURSOR    
    , v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE        /*��,�� �ڵ�           */
    , v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE       /*��,��,�� �ڵ�        */
    , v_Chan_Mcls_Cd   IN RTSD0007.CHAN_MCLS_CD%TYPE   /*ä�� �ߺз�          */
    , v_Ch_Yn          IN RTSD0007.CH_YN %TYPE         /*��õ������ ����      */
    , v_Lm_Yn          IN RTSD0007.LM_YN%TYPE          /*������ ���ɿ���      */
    , v_Season_Gbn     IN RTSD0007.SEASON_GBN%TYPE     /*��������             */
    , v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE     /*Ż���� �ڵ�          */ --[20180312_01]
    , v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE       /*����θ�Ʈ �ڵ�      */ --[20180312_01]
    , v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE     /*�뷱�� �ڵ�          */ --[20180312_01]    
    );    

  /*****************************************************************************
  -- �ֹ�, ��ü�ֹ�, �Ͻú� -  �븮�� ���� ��ȸ �˾�
  *****************************************************************************/
  PROCEDURE p_sRtsd0007OrdPopup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Nm      IN RTSD0007.AGENCY_NM%TYPE,      /*�븮����              */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Sido_Cd        IN RTSD0007.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0007.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Lm_Yn          IN RTSD0007.LM_YN%TYPE,          /*������ ���ɿ���       */
    v_Fm_Yn          IN RTSD0007.FM_YN%TYPE,          /*1������ ���ɿ���      */
    v_Op_Yn          IN RTSD0007.OP_YN%TYPE,          /* �¶������� ���ɿ���  */
    v_Desorpt_Cd     IN RTSD0007.DESORPT_CD%TYPE,     /*Ż���� �ڵ�           */ 
    v_Align_Cd       IN RTSD0007.ALIGN_CD%TYPE,       /*����θ�Ʈ �ڵ�       */ 
    v_Balance_Cd     IN RTSD0007.BALANCE_CD%TYPE      /*�뷱�� �ڵ�           */ 
    ) ;
            
END Pkg_Rtsd0007;
/
