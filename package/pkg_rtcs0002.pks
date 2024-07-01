CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0002 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0002
   PURPOSE   ī����Ÿ ������ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
   1.3        2017-06-22  wjim             [20170622_01] ������� �ε�� ��ȸ��� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- ī����Ÿ ������ Count
  *****************************************************************************/
  FUNCTION f_sRtcs0002Count(
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE      /*ī����Ÿ ���       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī����Ÿ ������ Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE    /*ī����Ÿ ���         */
    );

  /*****************************************************************************
  -- ī����Ÿ ������ Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  FUNCTION f_InsertRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*ī����Ÿ ���         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTCS0002.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*���ּ�              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*�Ի���                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*�����                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*�ٹ�����              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*��Ÿ1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*��Ÿ2                 */    
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*�����ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī����Ÿ ������ Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*ī����Ÿ ���         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTCS0002.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*���ּ�              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*�Ի���                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*�����                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*�ٹ�����              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*��Ÿ1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*��Ÿ2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*�����ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī����Ÿ ������ Delete
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*ī����Ÿ ���         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTCS0002.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*���ּ�              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*�Ի���                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*�����                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*�ٹ�����              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*��Ÿ1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*��Ÿ2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*�����ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ī����Ÿ ������ ����(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0002 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*ī����Ÿ ���         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTCS0002.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*���ּ�              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*�Ի���                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*�����                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*�ٹ�����              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*��Ÿ1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*��Ÿ2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*�����ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ī����Ÿ �˾�
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.4        2017-06-22  wjim             [20170622_02] '�ٹ�����' ��ȸ���� �߰�   
  *****************************************************************************/
  PROCEDURE p_sRtcs0002carmasterPopup(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE          /*�ٹ�����              */
  );
    
  /*****************************************************************************
  -- ������� �ε�� ���� ��ȸ
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-06-22  wjim             [20170622_01] ����߰�
  *****************************************************************************/
  PROCEDURE p_sRtcs0002carmasterNu (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE    /*�ε�� ���         */
  );    

  /*****************************************************************************
  -- AS������ ���ϱ�
  *****************************************************************************/
  PROCEDURE p_sRtcs0002getmaxnu(
    v_Carmaster_Nu   OUT  RTCS0002.CARMASTER_NU%TYPE  /*ī����Ÿ ���         */
    );
END Pkg_Rtcs0002;
/
