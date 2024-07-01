CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0009 AS 
/*******************************************************************************
   NAME:      Pkg_Rtcs0009
   PURPOSE   �������� ��۽�û ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-10  jemcarry         1. Created this package body.
   1.7        2019-12-03  wjim             [2019-00359563] O2O ���� �׸� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �������� ��۽�û ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0009Count(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,         /*��۽�û����        */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE          /*����                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ��۽�û ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0009 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dlvr_DayF      IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����FROM      */
    v_Dlvr_DayT      IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����TO        */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*����                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,          /*����ȣ              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*���ڵ�              */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*����                  */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*����                  */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,     /*���� �븮��           */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                     /* �α��� ����� �׷� */
    );

  /*****************************************************************************
  -- �������� ��۽�û ���� Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.7        2019-12-03  wjim             [2019-00359563] O2O ���� �׸� �߰�
  *****************************************************************************/
  FUNCTION f_InsertRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*����                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*���ڵ�              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*���� ����           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*����                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*����                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*����                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*��ⷮ                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*��۱���              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*�븮��                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*������                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*�ּ�1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*�ּ�2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*����ó                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*��ۿ�û����          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*��ü��������          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*�ٿ�ó���Ͻ�          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*���������Ͻ�          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*��۾�ü              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*�����ȣ              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,        /*�����ȣ              */    
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*����� ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*��������ð�          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery �����ȣ     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery �ּ�1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery �ּ�2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*������ȣ              */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ��۽�û ���� Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.7        2019-12-03  wjim             [2019-00359563] O2O ���� �׸� �߰�
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*����                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*���ڵ�              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*���� ����           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*����                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*����                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*����                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*��ⷮ                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*��۱���              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*�븮��                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*������                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*�ּ�1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*�ּ�2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*����ó                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*��ۿ�û����          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*��ü��������          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*�ٿ�ó���Ͻ�          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*���������Ͻ�          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*��۾�ü              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*�����ȣ              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,        /*�����ȣ              */       
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*����� ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*��������ð�          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery �����ȣ     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery �ּ�1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery �ּ�2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*������ȣ              */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ��۽�û ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0009 (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*����                  */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ��۽�û ���� ����(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.7        2019-12-03  wjim             [2019-00359563] O2O ���� �׸� �߰�
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0009 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����          */
    v_Dlvr_Seq       IN OUT RTCS0009.DLVR_SEQ%TYPE,   /*����                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*���ڵ�              */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*���� ����           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*����                  */
    v_Fuel_Cd        IN RTCS0009.FUEL_CD%TYPE,        /*����                  */
    v_Yrml_Cd        IN RTCS0009.YRML_CD%TYPE,        /*����                  */
    v_Dsplmt_Cd      IN RTCS0009.DSPLMT_CD%TYPE,      /*��ⷮ                */
    v_Dlv_Gb         IN RTCS0009.DLV_GB%TYPE,         /*��۱���              */
    v_Agency_Cd      IN RTCS0009.AGENCY_CD%TYPE,      /*�븮��                */
    v_Consignee      IN RTCS0009.CONSIGNEE%TYPE,      /*������                */
    v_Pos_Cd         IN RTCS0009.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0009.ADDR1%TYPE,          /*�ּ�1                 */
    v_Addr2          IN RTCS0009.ADDR2%TYPE,          /*�ּ�2                 */
    v_Dlv_Tel        IN RTCS0009.DLV_TEL%TYPE,        /*����ó                */
    v_Dlv_Desc       IN RTCS0009.DLV_DESC%TYPE,       /*��ۿ�û����          */
    v_Servrq_Day     IN RTCS0009.SERVRQ_DAY%TYPE,     /*��ü��������          */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*�ٿ�ó���Ͻ�          */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*���������Ͻ�          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*��۾�ü              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*�����ȣ              */
    v_Car_Id         IN RTCS0009.CAR_ID%TYPE,         /*�����ȣ              */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*����� ID             */
    v_Inst_Tm        IN RTCS0009.INST_TM%TYPE,        /*��������ð�          */ --[2019-00359563]
    v_Inst2_Poscd    IN RTCS0009.INST2_POSCD%TYPE,    /*Delivery �����ȣ     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTCS0009.INST2_ADDR1%TYPE,    /*Delivery �ּ�1        */ --[2019-00359563]
    v_Inst2_Addr2    IN RTCS0009.INST2_ADDR2%TYPE,    /*Delivery �ּ�2        */ --[2019-00359563]
    v_Car_No         IN RTCS0009.CAR_NO%TYPE,         /*������ȣ              */ --[2019-00359563]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� ��۽�û ���� - ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0009FieldValue(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*����                  */
    v_Field_Nm       IN VARCHAR                       /*�ʵ��                */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- �������� ��۽�û ���� - ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrSeq(
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE          /*��۽�û����        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ��۽�û ���� - ��ü��û����
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrYn(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- �������� ��۽�û ���� - ��ü��û�Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrCnt(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �������� ��۽�û ���� - ��ۻ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0009DlvrStat(
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- �������� ��۽�û ���� - �������ϱ�ü ��û��� - ��ȸ���ǿ� �´� ��������� ��ȸ�Ѵ�.
  *****************************************************************************/
  PROCEDURE p_sRtcs0009SelectOrderList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0100.CUST_NO%TYPE,        /*���ڵ�              */
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_Nm        IN RTSD0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*������ȣ              */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE          /*�޴�����ȣ            */
    );

  /*****************************************************************************
  -- �������� ��۽�û ���� Update - �������ϱ�ü ��û������ȸ - ��ȸ�� ��û������ ���Ͽ� ���� �ٿ�ε�� ���� ������Ʈ ó�� �Ѵ�.
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009DownDay (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*����                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*���ڵ�              */
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,       /*�ٿ�ó���Ͻ�          */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� ��۽�û ���� Update - ��۽�û, ���� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0009ServSeqDlvStat (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����          */
    v_Dlvr_Seq       IN RTCS0009.DLVR_SEQ%TYPE,       /*����                  */
    v_Serv_Seq       IN RTCS0009.SERV_SEQ%TYPE,       /*���� ����           */
    v_Dlv_Stat       IN RTCS0009.DLV_STAT%TYPE,       /*����                  */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �������� ��۽�û ���� - �������� ��ü ��û ���� ��������������Ʈ
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009TrspDoc (
    v_Dlvr_Day       IN RTCS0009.DLVR_DAY%TYPE,       /*��۽�û����          */
    v_Dlvr_Seq       IN OUT RTCS0009.DLVR_SEQ%TYPE,   /*����                  */
    v_Ord_No         IN RTCS0009.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTCS0009.CUST_NO%TYPE,        /*���ڵ�              */
    v_Dlvs_Day       IN RTCS0009.DLVS_DAY%TYPE,       /*���������Ͻ�          */
    v_Dlv_Ent        IN RTCS0009.DLV_ENT%TYPE,        /*��۾�ü              */
    v_Trsp_Doc       IN RTCS0009.TRSP_DOC%TYPE,       /*�����ȣ              */
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� ��۽�û ���� Update - �������ϱ�ü ��û������ȸ - ��ȸ�� ��û������ ���Ͽ� ���� �ٿ�ε�� ���� ������Ʈ ó�� �Ѵ�.
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0009DownDayAll (
    v_Reg_Id         IN RTCS0009.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� ��۽�û ���� Select - ��� ���� ���, �ٿ�ε� �����ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0009DownList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Down_Day       IN RTCS0009.DOWN_DAY%TYPE,        /*��۽�û����FROM      */
    v_LOGIN_ID       IN VARCHAR2,                    /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP     IN VARCHAR2                     /* �α��� ����� �׷� */
    );

END Pkg_Rtcs0009;
/
