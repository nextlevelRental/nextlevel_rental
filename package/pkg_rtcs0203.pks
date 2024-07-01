CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0203 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0203
   PURPOSE   [CS] Ÿ�̾� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-29  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] Ÿ�̾� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0203Count(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,           /*����ȣ            */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE          /*��������            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] Ÿ�̾� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0203 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*��������              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*���ڵ�              */
    v_Srrg_Day       IN RTCS0203.SRRG_DAY%TYPE,       /*�������              */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*��������              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*��������              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*�����������뿩��    */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*��������              */
    v_Strg_Dt        IN RTCS0203.STRG_DT%TYPE,        /*�����Ͻ�              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*������ ���ɹ��       */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*������ PATH           */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*������ FILE ��        */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*����ó�� ����� ID    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*�������              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*����Ͻ�              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*����� PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*����� FILE ��        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*���ó�������ID      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*Ÿ�̾�������          */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*����                  */
    v_Selection_Width IN RTCS0203.SELECTION_WIDTH%TYPE, /*��                  */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*�ø���                */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*����                  */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*����                  */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*Ÿ�̾�������(��)      */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*����(��)              */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,  /*��(��)         */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*�ø���(��)            */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*��ġ(��)              */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*����(��)              */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*����(��)              */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*Ÿ�̾�������(��)      */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*����(��)              */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,  /*��(��)         */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*�ø���(��)            */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*��ġ(��)              */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*����(��)              */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*����(��)              */
    v_Tot_Tire_Cnt   IN RTCS0203.TOT_TIRE_CNT%TYPE,   /*����Ÿ�̾��        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- [CS] Ÿ�̾� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0203 (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*��������              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*���ڵ�              */
    v_Srrg_Day       IN RTCS0203.SRRG_DAY%TYPE,       /*�������              */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*��������              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*��������              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*�����������뿩��    */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*��������              */
    v_Strg_Dt        IN RTCS0203.STRG_DT%TYPE,        /*�����Ͻ�              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*������ ���ɹ��       */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*������ PATH           */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*������ FILE ��        */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*����ó�� ����� ID    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*�������              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*����Ͻ�              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*����� PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*����� FILE ��        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*���ó�������ID      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*Ÿ�̾�������          */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*����                  */
    v_Selection_Width IN RTCS0203.SELECTION_WIDTH%TYPE, /*��                  */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*�ø���                */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*����                  */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*����                  */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*Ÿ�̾�������(��)      */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*����(��)              */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,  /*��(��)         */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*�ø���(��)            */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*��ġ(��)              */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*����(��)              */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*����(��)              */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*Ÿ�̾�������(��)      */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*����(��)              */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,  /*��(��)         */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*�ø���(��)            */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*��ġ(��)              */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*����(��)              */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*����(��)              */
    v_Tot_Tire_Cnt   IN RTCS0203.TOT_TIRE_CNT%TYPE,   /*����Ÿ�̾��        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] Ÿ�̾� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0203 (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*��������              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*���ڵ�              */
    v_Srrg_Day       IN RTCS0203.SRRG_DAY%TYPE,       /*�������              */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*��������              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*��������              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*�����������뿩��    */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*��������              */
    v_Strg_Dt        IN RTCS0203.STRG_DT%TYPE,        /*�����Ͻ�              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*������ ���ɹ��       */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*������ PATH           */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*������ FILE ��        */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*����ó�� ����� ID    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*�������              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*����Ͻ�              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*����� PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*����� FILE ��        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*���ó�������ID      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*Ÿ�̾�������          */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*����                  */
    v_Selection_Width IN RTCS0203.SELECTION_WIDTH%TYPE, /*��                  */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*�ø���                */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*����                  */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*����                  */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*Ÿ�̾�������(��)      */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*����(��)              */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,  /*��(��)         */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*�ø���(��)            */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*��ġ(��)              */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*����(��)              */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*����(��)              */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*Ÿ�̾�������(��)      */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*����(��)              */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,  /*��(��)         */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*�ø���(��)            */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*��ġ(��)              */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*����(��)              */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*����(��)              */
    v_Tot_Tire_Cnt   IN RTCS0203.TOT_TIRE_CNT%TYPE,   /*����Ÿ�̾��        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] Ÿ�̾� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0203 (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*��������              */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] Ÿ�̾� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0203 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*��������              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*���ڵ�              */
    v_Srrg_Day       IN RTCS0203.SRRG_DAY%TYPE,       /*�������              */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*��������              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*��������              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*�����������뿩��    */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*��������              */
    v_Strg_Dt        IN RTCS0203.STRG_DT%TYPE,        /*�����Ͻ�              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*������ ���ɹ��       */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*������ PATH           */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*������ FILE ��        */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*����ó�� ����� ID    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*�������              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*����Ͻ�              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*����� PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*����� FILE ��        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*���ó�������ID      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*Ÿ�̾�������          */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*����                  */
    v_Selection_Width IN RTCS0203.SELECTION_WIDTH%TYPE, /*��                  */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*�ø���                */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*����                  */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*����                  */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*Ÿ�̾�������(��)      */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*����(��)              */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,  /*��(��)         */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*�ø���(��)            */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*��ġ(��)              */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*����(��)              */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*����(��)              */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*Ÿ�̾�������(��)      */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*����(��)              */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,  /*��(��)         */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*�ø���(��)            */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*��ġ(��)              */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*����(��)              */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*����(��)              */
    v_Tot_Tire_Cnt   IN RTCS0203.TOT_TIRE_CNT%TYPE,   /*����Ÿ�̾��        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [CS] Ÿ�̾� �������� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0203KeepHistory (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*���ڵ�              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*������ȣ              */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*��������              */
    v_Strg_Day_Fr    IN RTCS0203.STRG_DAY%TYPE,       /*��������              */
    v_Strg_Day_To    IN RTCS0203.STRG_DAY%TYPE,       /*��������              */
    v_Dlvr_Day_Fr    IN RTCS0203.DLVR_DAY%TYPE,       /*�������              */
    v_Dlvr_Day_To    IN RTCS0203.DLVR_DAY%TYPE,       /*�������              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*������ ���ɹ��       */
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    );

  /*****************************************************************************
  -- ���� Ÿ�̾� ���� ó�� - �ش� ����ȣ�� Ÿ�̾� ����ȸ�� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE            /*�ֹ���ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� Ÿ�̾� ���� ó�� - �ش� ����ȣ�� Ÿ�̾� �������� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServTireCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE            /*�ֹ���ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� Ÿ�̾� ���� ó�� - �ش� ����ȣ�� ���纸�� ���������� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCurrYn(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,           /*�ֹ���ȣ            */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE         /*��������            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� Ÿ�̾� ���� ó�� - �ش� ������ȣ�� ���纸�� ���������� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCurrCar(
    v_Car_No         IN RTSD0104.CAR_NO%TYPE            /*������ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� Ÿ�̾� ���� ó�� - �ش� ����ȣ�� ���纸�� ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0203StrgStat(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,           /*�ֹ���ȣ            */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE          /*��������              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- ���� Ÿ�̾� ��� ó�� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0203WinterOut (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*��������              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*��������              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*�����������뿩��    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*�������              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*����Ͻ�              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*����� PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*����� FILE ��        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*���ó�������ID      */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� Ÿ�̾� ���� ó��
  *****************************************************************************/
  PROCEDURE p_Rtcs0203WinterIn (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ            */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*���ڵ�            */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*��������            */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*��������            */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*�����������뿩��  */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*�븮���ڵ�          */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*â���ڵ�            */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*��������            */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*������ ���ɹ��     */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*������ PATH         */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*������ FILE ��      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*Ÿ�̾�������        */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*����                */
    v_Selection_Width   IN RTCS0203.SELECTION_WIDTH%TYPE,      /*��         */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*�ø���              */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*��ġ                */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*����                */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*����                */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*Ÿ�̾�������(��)    */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*����(��)            */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,      /*��(��)   */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*�ø���(��)          */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*��ġ(��)            */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*����(��)            */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*����(��)            */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*Ÿ�̾�������(��)    */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*����(��)            */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,      /*��(��)   */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*�ø���(��)          */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*��ġ(��)            */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*����(��)            */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*����(��)            */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� Ÿ�̾� ��� ó��
  *****************************************************************************/
  PROCEDURE p_Rtcs0203WinterOut (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ            */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*��������              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*�����������뿩��  */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*�������              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*����� PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*����� FILE ��        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �������� ������ ����� FILE_PATH, FILE_NAME ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0203FilePathName (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*��������              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� Ÿ�̾� ��� ó��(��ü����)
  *****************************************************************************/
  PROCEDURE p_Rtcs0203WinterOutChange (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*����ȣ              */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
        
        
END Pkg_Rtcs0203;
/
