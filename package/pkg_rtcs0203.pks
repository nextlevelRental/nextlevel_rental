CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0203 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0203
   PURPOSE   [CS] 타이어 보관 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-29  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] 타이어 보관 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0203Count(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,           /*계약번호            */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE          /*보관순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 타이어 보관 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0203 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*고객코드              */
    v_Srrg_Day       IN RTCS0203.SRRG_DAY%TYPE,       /*등록일자              */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*보관여부              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*보관상태              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*보관서비스적용여부    */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*창고코드              */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*보관일자              */
    v_Strg_Dt        IN RTCS0203.STRG_DT%TYPE,        /*보관일시              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*보관증 수령방법       */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*보관증 PATH           */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*보관증 FILE 명        */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*보관처리 사용자 ID    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*출고일시              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*출고증 PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*출고증 FILE 명        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*출고처리사용자ID      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*타이어제조사          */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*패턴                  */
    v_Selection_Width IN RTCS0203.SELECTION_WIDTH%TYPE, /*폭                  */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*시리즈                */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*강도                  */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*수량                  */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*타이어제조사(앞)      */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*패턴(앞)              */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,  /*폭(앞)         */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*시리즈(앞)            */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*인치(앞)              */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*강도(앞)              */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*수량(앞)              */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*타이어제조사(뒤)      */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*패턴(뒤)              */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,  /*폭(뒤)         */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*시리즈(뒤)            */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*인치(뒤)              */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*강도(뒤)              */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*수량(뒤)              */
    v_Tot_Tire_Cnt   IN RTCS0203.TOT_TIRE_CNT%TYPE,   /*보관타이어갯수        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- [CS] 타이어 보관 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0203 (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*고객코드              */
    v_Srrg_Day       IN RTCS0203.SRRG_DAY%TYPE,       /*등록일자              */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*보관여부              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*보관상태              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*보관서비스적용여부    */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*창고코드              */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*보관일자              */
    v_Strg_Dt        IN RTCS0203.STRG_DT%TYPE,        /*보관일시              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*보관증 수령방법       */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*보관증 PATH           */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*보관증 FILE 명        */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*보관처리 사용자 ID    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*출고일시              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*출고증 PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*출고증 FILE 명        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*출고처리사용자ID      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*타이어제조사          */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*패턴                  */
    v_Selection_Width IN RTCS0203.SELECTION_WIDTH%TYPE, /*폭                  */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*시리즈                */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*강도                  */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*수량                  */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*타이어제조사(앞)      */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*패턴(앞)              */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,  /*폭(앞)         */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*시리즈(앞)            */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*인치(앞)              */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*강도(앞)              */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*수량(앞)              */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*타이어제조사(뒤)      */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*패턴(뒤)              */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,  /*폭(뒤)         */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*시리즈(뒤)            */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*인치(뒤)              */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*강도(뒤)              */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*수량(뒤)              */
    v_Tot_Tire_Cnt   IN RTCS0203.TOT_TIRE_CNT%TYPE,   /*보관타이어갯수        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 타이어 보관 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0203 (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*고객코드              */
    v_Srrg_Day       IN RTCS0203.SRRG_DAY%TYPE,       /*등록일자              */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*보관여부              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*보관상태              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*보관서비스적용여부    */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*창고코드              */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*보관일자              */
    v_Strg_Dt        IN RTCS0203.STRG_DT%TYPE,        /*보관일시              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*보관증 수령방법       */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*보관증 PATH           */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*보관증 FILE 명        */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*보관처리 사용자 ID    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*출고일시              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*출고증 PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*출고증 FILE 명        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*출고처리사용자ID      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*타이어제조사          */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*패턴                  */
    v_Selection_Width IN RTCS0203.SELECTION_WIDTH%TYPE, /*폭                  */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*시리즈                */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*강도                  */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*수량                  */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*타이어제조사(앞)      */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*패턴(앞)              */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,  /*폭(앞)         */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*시리즈(앞)            */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*인치(앞)              */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*강도(앞)              */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*수량(앞)              */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*타이어제조사(뒤)      */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*패턴(뒤)              */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,  /*폭(뒤)         */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*시리즈(뒤)            */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*인치(뒤)              */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*강도(뒤)              */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*수량(뒤)              */
    v_Tot_Tire_Cnt   IN RTCS0203.TOT_TIRE_CNT%TYPE,   /*보관타이어갯수        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 타이어 보관 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0203 (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- [CS] 타이어 보관 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0203 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*고객코드              */
    v_Srrg_Day       IN RTCS0203.SRRG_DAY%TYPE,       /*등록일자              */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*보관여부              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*보관상태              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*보관서비스적용여부    */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*창고코드              */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*보관일자              */
    v_Strg_Dt        IN RTCS0203.STRG_DT%TYPE,        /*보관일시              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*보관증 수령방법       */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*보관증 PATH           */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*보관증 FILE 명        */
    v_Strg_User_Id   IN RTCS0203.STRG_USER_ID%TYPE,   /*보관처리 사용자 ID    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*출고일시              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*출고증 PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*출고증 FILE 명        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*출고처리사용자ID      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*타이어제조사          */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*패턴                  */
    v_Selection_Width IN RTCS0203.SELECTION_WIDTH%TYPE, /*폭                  */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*시리즈                */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*인치                  */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*강도                  */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*수량                  */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*타이어제조사(앞)      */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*패턴(앞)              */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,  /*폭(앞)         */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*시리즈(앞)            */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*인치(앞)              */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*강도(앞)              */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*수량(앞)              */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*타이어제조사(뒤)      */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*패턴(뒤)              */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,  /*폭(뒤)         */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*시리즈(뒤)            */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*인치(뒤)              */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*강도(뒤)              */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*수량(뒤)              */
    v_Tot_Tire_Cnt   IN RTCS0203.TOT_TIRE_CNT%TYPE,   /*보관타이어갯수        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- [CS] 타이어 보관내역 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0203KeepHistory (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*고객코드              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*창고코드              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*보관상태              */
    v_Strg_Day_Fr    IN RTCS0203.STRG_DAY%TYPE,       /*보관일자              */
    v_Strg_Day_To    IN RTCS0203.STRG_DAY%TYPE,       /*보관일자              */
    v_Dlvr_Day_Fr    IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_Day_To    IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*보관증 수령방법       */
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 계약번호의 타이어 보관회수 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 계약번호의 타이어 보관개수 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServTireCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 계약번호가 현재보관 진행중인지 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCurrYn(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,           /*주문번호            */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE         /*보관상태            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 차량번호가 현재보관 진행중인지 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCurrCar(
    v_Car_No         IN RTSD0104.CAR_NO%TYPE            /*차량번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 계약번호의 현재보관 상태 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203StrgStat(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,           /*주문번호            */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE          /*보관순번              */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 윈터 타이어 출고 처리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0203WinterOut (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*보관상태              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*보관서비스적용여부    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_Dt        IN RTCS0203.DLVR_DT%TYPE,        /*출고일시              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*출고증 PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*출고증 FILE 명        */
    v_Dlvr_User_Id   IN RTCS0203.DLVR_USER_ID%TYPE,   /*출고처리사용자ID      */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리
  *****************************************************************************/
  PROCEDURE p_Rtcs0203WinterIn (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호            */
    v_Cust_No        IN RTCS0203.CUST_NO%TYPE,        /*고객코드            */
    v_Strg_Yn        IN RTCS0203.STRG_YN%TYPE,        /*보관여부            */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE,      /*보관상태            */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*보관서비스적용여부  */
    v_Agency_Cd      IN RTCS0203.AGENCY_CD%TYPE,      /*대리점코드          */
    v_Wareh_Cd       IN RTCS0203.WAREH_CD%TYPE,       /*창고코드            */
    v_Strg_Day       IN RTCS0203.STRG_DAY%TYPE,       /*보관일자            */
    v_Strg_Mthd      IN RTCS0203.STRG_MTHD%TYPE,      /*보관증 수령방법     */
    v_Strg_File_Path IN RTCS0203.STRG_FILE_PATH%TYPE, /*보관증 PATH         */
    v_Strg_File_Name IN RTCS0203.STRG_FILE_NAME%TYPE, /*보관증 FILE 명      */
    v_Mf_Cd          IN RTCS0203.MF_CD%TYPE,          /*타이어제조사        */
    v_Pattern_Cd     IN RTCS0203.PATTERN_CD%TYPE,     /*패턴                */
    v_Selection_Width   IN RTCS0203.SELECTION_WIDTH%TYPE,      /*폭         */
    v_Aspect_Ratio   IN RTCS0203.ASPECT_RATIO%TYPE,   /*시리즈              */
    v_Wheel_Inches   IN RTCS0203.WHEEL_INCHES%TYPE,   /*인치                */
    v_Ply_Rating     IN RTCS0203.PLY_RATING%TYPE,     /*강도                */
    v_Tire_Cnt       IN RTCS0203.TIRE_CNT%TYPE,       /*수량                */
    v_Mf_Cd_F        IN RTCS0203.MF_CD_F%TYPE,        /*타이어제조사(앞)    */
    v_Pattern_Cd_F   IN RTCS0203.PATTERN_CD_F%TYPE,   /*패턴(앞)            */
    v_Selection_Width_F IN RTCS0203.SELECTION_WIDTH_F%TYPE,      /*폭(앞)   */
    v_Aspect_Ratio_F IN RTCS0203.ASPECT_RATIO_F%TYPE, /*시리즈(앞)          */
    v_Wheel_Inches_F IN RTCS0203.WHEEL_INCHES_F%TYPE, /*인치(앞)            */
    v_Ply_Rating_F   IN RTCS0203.PLY_RATING_F%TYPE,   /*강도(앞)            */
    v_Tire_Cnt_F     IN RTCS0203.TIRE_CNT_F%TYPE,     /*수량(앞)            */
    v_Mf_Cd_R        IN RTCS0203.MF_CD_R%TYPE,        /*타이어제조사(뒤)    */
    v_Pattern_Cd_R   IN RTCS0203.PATTERN_CD_R%TYPE,   /*패턴(뒤)            */
    v_Selection_Width_R IN RTCS0203.SELECTION_WIDTH_R%TYPE,      /*폭(뒤)   */
    v_Aspect_Ratio_R IN RTCS0203.ASPECT_RATIO_R%TYPE, /*시리즈(뒤)          */
    v_Wheel_Inches_R IN RTCS0203.WHEEL_INCHES_R%TYPE, /*인치(뒤)            */
    v_Ply_Rating_R   IN RTCS0203.PLY_RATING_R%TYPE,   /*강도(뒤)            */
    v_Tire_Cnt_R     IN RTCS0203.TIRE_CNT_R%TYPE,     /*수량(뒤)            */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 윈터 타이어 출고 처리
  *****************************************************************************/
  PROCEDURE p_Rtcs0203WinterOut (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호            */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*보관서비스적용여부  */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*출고증 PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*출고증 FILE 명        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 보관내역 보관증 출고증 FILE_PATH, FILE_NAME 조회
  *****************************************************************************/
  PROCEDURE p_sRtcs0203FilePathName (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 윈터 타이어 출고 처리(교체서비스)
  *****************************************************************************/
  PROCEDURE p_Rtcs0203WinterOutChange (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
        
        
END Pkg_Rtcs0203;