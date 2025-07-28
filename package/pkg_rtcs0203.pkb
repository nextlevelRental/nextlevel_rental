CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0203 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0203
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
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0203
    WHERE   ORD_NO         = v_Ord_No
    AND     STRG_SEQ       = v_Strg_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0203Count;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.STRG_SEQ,                  /*보관순번            */
            A.CUST_NO,                   /*고객코드            */
            A.SRRG_DAY,                  /*등록일자            */
            A.STRG_YN,                   /*보관여부            */
            A.STRG_STAT,                 /*보관상태            */
            A.SRSV_YN,                   /*보관서비스적용여부  */
            A.AGENCY_CD,                 /*대리점코드          */
            A.WAREH_CD,                  /*창고코드            */
            A.STRG_DAY,                  /*보관일자            */
            A.STRG_DT,                   /*보관일시            */
            A.STRG_MTHD,                 /*보관증 수령방법     */
            A.STRG_FILE_PATH,            /*보관증 PATH         */
            A.STRG_FILE_NAME,            /*보관증 FILE 명      */
            A.STRG_USER_ID,              /*보관처리 사용자 ID  */
            A.DLVR_DAY,                  /*출고일자            */
            A.DLVR_DT,                   /*출고일시            */
            A.DLVR_FILE_PATH,            /*출고증 PATH         */
            A.DLVR_FILE_NAME,            /*출고증 FILE 명      */
            A.DLVR_USER_ID,              /*출고처리사용자ID    */
            A.MF_CD,                     /*타이어제조사        */
            A.PATTERN_CD,                /*패턴                */
            A.SELECTION_WIDTH,           /*폭                  */
            A.ASPECT_RATIO,              /*시리즈              */
            A.WHEEL_INCHES,              /*인치                */
            A.PLY_RATING,                /*강도                */
            A.TIRE_CNT,                  /*수량                */
            A.MF_CD_F,                   /*타이어제조사(앞)    */
            A.PATTERN_CD_F,              /*패턴(앞)            */
            A.SELECTION_WIDTH_F,         /*폭(앞)              */
            A.ASPECT_RATIO_F,            /*시리즈(앞)          */
            A.WHEEL_INCHES_F,            /*인치(앞)            */
            A.PLY_RATING_F,              /*강도(앞)            */
            A.TIRE_CNT_F,                /*수량(앞)            */
            A.MF_CD_R,                   /*타이어제조사(뒤)    */
            A.PATTERN_CD_R,              /*패턴(뒤)            */
            A.SELECTION_WIDTH_R,         /*폭(뒤)              */
            A.ASPECT_RATIO_R,            /*시리즈(뒤)          */
            A.WHEEL_INCHES_R,            /*인치(뒤)            */
            A.PLY_RATING_R,              /*강도(뒤)            */
            A.TIRE_CNT_R,                /*수량(뒤)            */
            A.TOT_TIRE_CNT,              /*보관타이어갯수      */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0203 A
    WHERE   A.ORD_NO           = DECODE(v_Ord_No         , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.STRG_SEQ         = DECODE(v_Strg_Seq       , NULL, A.STRG_SEQ        , v_Strg_Seq)
    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.SRRG_DAY         = DECODE(v_Srrg_Day       , NULL, A.SRRG_DAY        , v_Srrg_Day)
    AND     A.STRG_YN          = DECODE(v_Strg_Yn        , NULL, A.STRG_YN         , v_Strg_Yn)
    AND     A.STRG_STAT        = DECODE(v_Strg_Stat      , NULL, A.STRG_STAT       , v_Strg_Stat)
    AND     A.SRSV_YN          = DECODE(v_Srsv_Yn        , NULL, A.SRSV_YN         , v_Srsv_Yn)
    AND     A.AGENCY_CD        = DECODE(v_Agency_Cd      , NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.WAREH_CD         = DECODE(v_Wareh_Cd       , NULL, A.WAREH_CD        , v_Wareh_Cd)
    AND     A.STRG_DAY         = DECODE(v_Strg_Day       , NULL, A.STRG_DAY        , v_Strg_Day)
    AND     A.STRG_DT          = DECODE(v_Strg_Dt        , NULL, A.STRG_DT         , v_Strg_Dt)
    AND     A.STRG_MTHD        = DECODE(v_Strg_Mthd      , NULL, A.STRG_MTHD       , v_Strg_Mthd)
    AND     A.STRG_FILE_PATH   = DECODE(v_Strg_File_Path , NULL, A.STRG_FILE_PATH  , v_Strg_File_Path)
    AND     A.STRG_FILE_NAME   = DECODE(v_Strg_File_Name , NULL, A.STRG_FILE_NAME  , v_Strg_File_Name)
    AND     A.STRG_USER_ID     = DECODE(v_Strg_User_Id   , NULL, A.STRG_USER_ID    , v_Strg_User_Id)
    AND     A.DLVR_DAY         = DECODE(v_Dlvr_Day       , NULL, A.DLVR_DAY        , v_Dlvr_Day)
    AND     A.DLVR_DT          = DECODE(v_Dlvr_Dt        , NULL, A.DLVR_DT         , v_Dlvr_Dt)
    AND     A.DLVR_FILE_PATH   = DECODE(v_Dlvr_File_Path , NULL, A.DLVR_FILE_PATH  , v_Dlvr_File_Path)
    AND     A.DLVR_FILE_NAME   = DECODE(v_Dlvr_File_Name , NULL, A.DLVR_FILE_NAME  , v_Dlvr_File_Name)
    AND     A.DLVR_USER_ID     = DECODE(v_Dlvr_User_Id   , NULL, A.DLVR_USER_ID    , v_Dlvr_User_Id)
    AND     A.MF_CD            = DECODE(v_Mf_Cd          , NULL, A.MF_CD           , v_Mf_Cd)
    AND     A.PATTERN_CD       = DECODE(v_Pattern_Cd     , NULL, A.PATTERN_CD      , v_Pattern_Cd)
    AND     A.SELECTION_WIDTH  = DECODE(v_Selection_Width, NULL, A.SELECTION_WIDTH , v_Selection_Width)
    AND     A.ASPECT_RATIO     = DECODE(v_Aspect_Ratio   , NULL, A.ASPECT_RATIO    , v_Aspect_Ratio)
    AND     A.WHEEL_INCHES     = DECODE(v_Wheel_Inches   , NULL, A.WHEEL_INCHES    , v_Wheel_Inches)
    AND     A.PLY_RATING       = DECODE(v_Ply_Rating     , NULL, A.PLY_RATING      , v_Ply_Rating)
    AND     A.TIRE_CNT         = DECODE(v_Tire_Cnt       , NULL, A.TIRE_CNT        , v_Tire_Cnt)
    AND     A.MF_CD_F          = DECODE(v_Mf_Cd_F        , NULL, A.MF_CD_F         , v_Mf_Cd_F)
    AND     A.PATTERN_CD_F     = DECODE(v_Pattern_Cd_F   , NULL, A.PATTERN_CD_F    , v_Pattern_Cd_F)
    AND     A.SELECTION_WIDTH_F = DECODE(v_Selection_Width_F, NULL, A.SELECTION_WIDTH_F, v_Selection_Width_F)
    AND     A.ASPECT_RATIO_F   = DECODE(v_Aspect_Ratio_F , NULL, A.ASPECT_RATIO_F  , v_Aspect_Ratio_F)
    AND     A.WHEEL_INCHES_F   = DECODE(v_Wheel_Inches_F , NULL, A.WHEEL_INCHES_F  , v_Wheel_Inches_F)
    AND     A.PLY_RATING_F     = DECODE(v_Ply_Rating_F   , NULL, A.PLY_RATING_F    , v_Ply_Rating_F)
    AND     A.TIRE_CNT_F       = DECODE(v_Tire_Cnt_F     , NULL, A.TIRE_CNT_F      , v_Tire_Cnt_F)
    AND     A.MF_CD_R          = DECODE(v_Mf_Cd_R        , NULL, A.MF_CD_R         , v_Mf_Cd_R)
    AND     A.PATTERN_CD_R     = DECODE(v_Pattern_Cd_R   , NULL, A.PATTERN_CD_R    , v_Pattern_Cd_R)
    AND     A.SELECTION_WIDTH_R = DECODE(v_Selection_Width_R, NULL, A.SELECTION_WIDTH_R, v_Selection_Width_R)
    AND     A.ASPECT_RATIO_R   = DECODE(v_Aspect_Ratio_R , NULL, A.ASPECT_RATIO_R  , v_Aspect_Ratio_R)
    AND     A.WHEEL_INCHES_R   = DECODE(v_Wheel_Inches_R , NULL, A.WHEEL_INCHES_R  , v_Wheel_Inches_R)
    AND     A.PLY_RATING_R     = DECODE(v_Ply_Rating_R   , NULL, A.PLY_RATING_R    , v_Ply_Rating_R)
    AND     A.TIRE_CNT_R       = DECODE(v_Tire_Cnt_R     , NULL, A.TIRE_CNT_R      , v_Tire_Cnt_R)
    AND     A.TOT_TIRE_CNT     = DECODE(v_Tot_Tire_Cnt   , NULL, A.TOT_TIRE_CNT    , v_Tot_Tire_Cnt)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0203;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0203 (
            ORD_NO,
            STRG_SEQ,
            CUST_NO,
            SRRG_DAY,
            STRG_YN,
            STRG_STAT,
            SRSV_YN,
            AGENCY_CD,
            WAREH_CD,
            STRG_DAY,
            STRG_DT,
            STRG_MTHD,
            STRG_FILE_PATH,
            STRG_FILE_NAME,
            STRG_USER_ID,
            DLVR_DAY,
            DLVR_DT,
            DLVR_FILE_PATH,
            DLVR_FILE_NAME,
            DLVR_USER_ID,
            MF_CD,
            PATTERN_CD,
            SELECTION_WIDTH,
            ASPECT_RATIO,
            WHEEL_INCHES,
            PLY_RATING,
            TIRE_CNT,
            MF_CD_F,
            PATTERN_CD_F,
            SELECTION_WIDTH_F,
            ASPECT_RATIO_F,
            WHEEL_INCHES_F,
            PLY_RATING_F,
            TIRE_CNT_F,
            MF_CD_R,
            PATTERN_CD_R,
            SELECTION_WIDTH_R,
            ASPECT_RATIO_R,
            WHEEL_INCHES_R,
            PLY_RATING_R,
            TIRE_CNT_R,
            TOT_TIRE_CNT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Strg_Seq,
            v_Cust_No,
            v_Srrg_Day,
            v_Strg_Yn,
            v_Strg_Stat,
            v_Srsv_Yn,
            v_Agency_Cd,
            v_Wareh_Cd,
            v_Strg_Day,
            v_Strg_Dt,
            v_Strg_Mthd,
            v_Strg_File_Path,
            v_Strg_File_Name,
            v_Strg_User_Id,
            v_Dlvr_Day,
            v_Dlvr_Dt,
            v_Dlvr_File_Path,
            v_Dlvr_File_Name,
            v_Dlvr_User_Id,
            v_Mf_Cd,
            v_Pattern_Cd,
            v_Selection_Width,
            v_Aspect_Ratio,
            v_Wheel_Inches,
            v_Ply_Rating,
            v_Tire_Cnt,
            v_Mf_Cd_F,
            v_Pattern_Cd_F,
            v_Selection_Width_F,
            v_Aspect_Ratio_F,
            v_Wheel_Inches_F,
            v_Ply_Rating_F,
            v_Tire_Cnt_F,
            v_Mf_Cd_R,
            v_Pattern_Cd_R,
            v_Selection_Width_R,
            v_Aspect_Ratio_R,
            v_Wheel_Inches_R,
            v_Ply_Rating_R,
            v_Tire_Cnt_R,
            v_Tot_Tire_Cnt,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0203;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0203
    SET    CUST_NO          = v_Cust_No,
           SRRG_DAY         = v_Srrg_Day,
           STRG_YN          = v_Strg_Yn,
           STRG_STAT        = v_Strg_Stat,
           SRSV_YN          = v_Srsv_Yn,
           AGENCY_CD        = v_Agency_Cd,
           WAREH_CD         = v_Wareh_Cd,
           STRG_DAY         = v_Strg_Day,
           STRG_DT          = v_Strg_Dt,
           STRG_MTHD        = v_Strg_Mthd,
           STRG_FILE_PATH   = v_Strg_File_Path,
           STRG_FILE_NAME   = v_Strg_File_Name,
           STRG_USER_ID     = v_Strg_User_Id,
           DLVR_DAY         = v_Dlvr_Day,
           DLVR_DT          = v_Dlvr_Dt,
           DLVR_FILE_PATH   = v_Dlvr_File_Path,
           DLVR_FILE_NAME   = v_Dlvr_File_Name,
           DLVR_USER_ID     = v_Dlvr_User_Id,
           MF_CD            = v_Mf_Cd,
           PATTERN_CD       = v_Pattern_Cd,
           SELECTION_WIDTH  = v_Selection_Width,
           ASPECT_RATIO     = v_Aspect_Ratio,
           WHEEL_INCHES     = v_Wheel_Inches,
           PLY_RATING       = v_Ply_Rating,
           TIRE_CNT         = v_Tire_Cnt,
           MF_CD_F          = v_Mf_Cd_F,
           PATTERN_CD_F     = v_Pattern_Cd_F,
           SELECTION_WIDTH_F = v_Selection_Width_F,
           ASPECT_RATIO_F   = v_Aspect_Ratio_F,
           WHEEL_INCHES_F   = v_Wheel_Inches_F,
           PLY_RATING_F     = v_Ply_Rating_F,
           TIRE_CNT_F       = v_Tire_Cnt_F,
           MF_CD_R          = v_Mf_Cd_R,
           PATTERN_CD_R     = v_Pattern_Cd_R,
           SELECTION_WIDTH_R = v_Selection_Width_R,
           ASPECT_RATIO_R   = v_Aspect_Ratio_R,
           WHEEL_INCHES_R   = v_Wheel_Inches_R,
           PLY_RATING_R     = v_Ply_Rating_R,
           TIRE_CNT_R       = v_Tire_Cnt_R,
           TOT_TIRE_CNT     = v_Tot_Tire_Cnt,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  ORD_NO           = v_Ord_No
    AND    STRG_SEQ         = v_Strg_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0203;

  /*****************************************************************************
  -- [CS] 타이어 보관 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0203 (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTCS0203
    WHERE  ORD_NO           = v_Ord_No
    AND    STRG_SEQ         = v_Strg_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.f_DeleteRtcs0203(2)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.f_DeleteRtcs0203(2)', '보관순번', v_Strg_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.f_DeleteRtcs0203(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0203;

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
    ) IS

    e_Error EXCEPTION;
    v_Strg_Seq1      RTCS0203.STRG_SEQ%TYPE;        /*보관순번              */
    v_Stat_Cd        RTSD0104.STAT_CD%TYPE;         /*계약상태              */

  BEGIN

    -- 필수값: 계약번호, 보관순번, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL)  THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'U'
    AND (TRIM(v_Strg_Seq) IS NULL)  THEN
        v_Return_Message := '보관순번('||v_Strg_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        IF (TRIM(v_Cust_No) IS NULL)  THEN
            v_Return_Message := '고객코드('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Srrg_Day) IS NULL)  THEN
            v_Return_Message := '등록일자('||v_Srrg_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Strg_Yn) IS NULL)  THEN
            v_Return_Message := '보관여부('||v_Strg_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Strg_Stat) IS NULL)  THEN
            v_Return_Message := '보관상태('||v_Strg_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Srsv_Yn) IS NULL)  THEN
            v_Return_Message := '보관서비스적용여부('||v_Srsv_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Agency_Cd) IS NULL)  THEN
            v_Return_Message := '대리점코드('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Wareh_Cd) IS NULL)  THEN
            v_Return_Message := '창고코드('||v_Wareh_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;


        IF v_Comm_Dvsn = 'I' THEN

            /* 계약상태 체크 */
            v_Stat_Cd := Pkg_Rtsd0104.f_sRtsd0104StatCd(v_Ord_No);
            IF v_Stat_Cd = '03' OR
               v_Stat_Cd = '04' THEN

                v_Strg_Seq1 := f_sRtcs0203ServCurrYn(v_Ord_No, NULL) + 1;
                IF 0 != f_InsertRtcs0203( v_Ord_No, v_Strg_Seq1,
                                          v_Cust_No,    v_Srrg_Day, v_Strg_Yn,  v_Strg_Stat,
                                          v_Srsv_Yn,    v_Agency_Cd,    v_Wareh_Cd, v_Strg_Day,
                                          v_Strg_Dt,    v_Strg_Mthd,    v_Strg_File_Path,   v_Strg_File_Name,
                                          v_Strg_User_Id,   v_Dlvr_Day, v_Dlvr_Dt,  v_Dlvr_File_Path,
                                          v_Dlvr_File_Name, v_Dlvr_User_Id, v_Mf_Cd,    v_Pattern_Cd,
                                          v_Selection_Width,    v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating,
                                          v_Tire_Cnt,   v_Mf_Cd_F,  v_Pattern_Cd_F, v_Selection_Width_F,
                                          v_Aspect_Ratio_F, v_Wheel_Inches_F,   v_Ply_Rating_F, v_Tire_Cnt_F,
                                          v_Mf_Cd_R,    v_Pattern_Cd_R, v_Selection_Width_R,    v_Aspect_Ratio_R,
                                          v_Wheel_Inches_R, v_Ply_Rating_R, v_Tire_Cnt_R,   v_Tot_Tire_Cnt,
                                          v_Reg_Id, v_ErrorText
                                        ) THEN
                    v_Return_Message := '[CS] 타이어 보관 관리 등록 실패!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
            ELSE
                v_Errortext := '[CS] 타이어 보관 서비스를 이용할 수 없는 계약상태 입니다.';
                RAISE e_Error;
            END IF;

        ELSE

            IF 0 != f_UpdateRtcs0203( v_Ord_No, v_Strg_Seq,
                                      v_Cust_No,    v_Srrg_Day, v_Strg_Yn,  v_Strg_Stat,
                                      v_Srsv_Yn,    v_Agency_Cd,    v_Wareh_Cd, v_Strg_Day,
                                      v_Strg_Dt,    v_Strg_Mthd,    v_Strg_File_Path,   v_Strg_File_Name,
                                      v_Strg_User_Id,   v_Dlvr_Day, v_Dlvr_Dt,  v_Dlvr_File_Path,
                                      v_Dlvr_File_Name, v_Dlvr_User_Id, v_Mf_Cd,    v_Pattern_Cd,
                                      v_Selection_Width,    v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating,
                                      v_Tire_Cnt,   v_Mf_Cd_F,  v_Pattern_Cd_F, v_Selection_Width_F,
                                      v_Aspect_Ratio_F, v_Wheel_Inches_F,   v_Ply_Rating_F, v_Tire_Cnt_F,
                                      v_Mf_Cd_R,    v_Pattern_Cd_R, v_Selection_Width_R,    v_Aspect_Ratio_R,
                                      v_Wheel_Inches_R, v_Ply_Rating_R, v_Tire_Cnt_R,   v_Tot_Tire_Cnt,
                                      v_Reg_Id, v_ErrorText
                                    ) THEN
                v_Return_Message := '[CS] 타이어 보관 관리 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtcs0203( v_Ord_No, v_Strg_Seq, v_Reg_Id, v_ErrorText ) THEN
            v_Return_Message := '[CS] 타이어 보관 관리 삭제 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_IUDRtcs0203(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_IUDRtcs0203(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0203;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.*,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT
            A.ORD_NO,                                                   /* 계약번호        */
            A.STRG_SEQ,                                                 /* 보관순번        */
            A.CUST_NO,                                                  /* 고객코드        */
            C.CUST_NM,                                                  /* 고객명          */
            C.TEL_NO                                    CUST_TEL_NO,    /* 고객자택번호    */
            C.MOB_NO                                    CUST_MOB_NO,    /* 고객핸드폰번호  */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S001', B.MAKER_CD) ||' '||
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S002', B.MODEL_CD) ||' '||
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S003', B.CONTENTS_CD) ||' '||
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S004', B.FR_CD) CAR_KIND, /* 차종            */
            B.CAR_NO,                                                   /* 차량번호        */
            A.SRRG_DAY,                                                 /* 등록일자        */
            A.STRG_YN,                                                  /* 보관여부        */
            A.STRG_STAT,                                                /* 보관상태        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C014', A.STRG_STAT)  STRG_STAT_NM,    /* 보관상태명      */
            A.SRSV_YN,                                                  /* 보관서비스적용여부        */
            A.AGENCY_CD,                                                /* 대리점코드        */
            D.AGENCY_NM,                                                /* 대리점명        */
            D.MOB_NO                                 AGENCY_MOB_NO,     /* 대리점 휴대폰번호 */
            A.WAREH_CD,                                                 /* 창고코드        */
            E.WAREH_NM,                                                 /* 창고명          */
            E.ADDR1|| ' ' || E.ADDR2                          ADDR,     /* 창고주소        */
            A.STRG_DAY,                                                 /* 보관일자        */
            A.STRG_DT,                                                  /* 보관일시        */
            A.STRG_MTHD,                                                /* 보관증 수령방법 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C015', A.STRG_MTHD)   STRG_MTHD_NM,   /* 보관증 수령방법명        */
            A.STRG_FILE_PATH,                                           /* 보관증 PATH     */
            A.STRG_FILE_NAME,                                           /* 보관증 FILE 명  */
            A.STRG_USER_ID,                                             /* 보관처리 사용자 ID */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.STRG_USER_ID )      STRG_USER_NM,     /* 보관처리 사용자명        */
            A.DLVR_DAY,                                                 /* 출고일자        */
            A.DLVR_DT,                                                  /* 출고일시        */
            A.DLVR_FILE_PATH,                                           /* 출고증 PATH     */
            A.DLVR_FILE_NAME,                                           /* 출고증 FILE 명  */
            A.DLVR_USER_ID,                                             /* 출고처리사용자ID        */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.DLVR_USER_ID )      DLVR_USER_NM,     /* 출고처리사용자명        */
            A.MF_CD,                                                    /* 타이어제조사    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C009', A.MF_CD)   MF_NM,  /* 타이어제조사명  */
            A.PATTERN_CD,                                               /* 패턴            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C010', A.SELECTION_WIDTH)   SELECTION_WIDTH,  /* 폭            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C011', A.ASPECT_RATIO)   ASPECT_RATIO,        /* 시리즈        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C012', A.WHEEL_INCHES)   WHEEL_INCHES,        /* 인치          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C013', A.PLY_RATING)   PLY_RATING,            /* 강도          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C016', A.TIRE_CNT)   TIRE_CNT,                /* 수량          */
            A.MF_CD_F,                                                  /* 타이어제조사(앞)        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C009', A.MF_CD_F)   MF_NM_F,            /* 타이어제조사명(앞)        */
            A.PATTERN_CD_F,                                             /* 패턴(앞)        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C010', A.SELECTION_WIDTH_F)   SELECTION_WIDTH_F, /* 폭(앞)           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C011', A.ASPECT_RATIO_F)   ASPECT_RATIO_F,       /* 시리즈(앞)       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C012', A.WHEEL_INCHES_F)   WHEEL_INCHES_F,       /* 인치(앞)         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C013', A.PLY_RATING_F)   PLY_RATING_F,           /* 강도(앞)         */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C017', A.TIRE_CNT_F)   TIRE_CNT_F,               /* 수량(앞)         */
            A.MF_CD_R,                                                  /* 타이어제조사(뒤)        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C009', A.MF_CD_R)   MF_NM_R,            /* 타이어제조사명(뒤)        */
            A.PATTERN_CD_R,                                             /* 패턴(뒤)        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C010', A.SELECTION_WIDTH_R)   SELECTION_WIDTH_R,  /* 폭(뒤)          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C011', A.ASPECT_RATIO_R)   ASPECT_RATIO_R,        /* 시리즈(뒤)      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C012', A.WHEEL_INCHES_R)   WHEEL_INCHES_R,        /* 인치(뒤)        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C013', A.PLY_RATING_R)   PLY_RATING_R,            /* 강도(뒤)        */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C017', A.TIRE_CNT_R)   TIRE_CNT_R,            /* 수량(뒤)        */
            A.TOT_TIRE_CNT,                                             /* 보관타이어갯수  */
            A.REG_ID,                                                   /* 등록자 ID       */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.REG_ID )      REG_NM,     /* 등록자명        */
            A.REG_DT,                                                   /* 등록일          */
            A.CHG_ID,                                                   /* 변경자 ID       */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.CHG_ID )      CHG_NM,     /* 변경자명        */
            A.CHG_DT                                                    /* 변경일          */
    FROM    RTCS0203 A,  RTSD0104 B, RTSD0100 C, RTSD0007 D, RTCS0200 E
    WHERE   A.ORD_NO    = B.ORD_NO
    AND     A.AGENCY_CD = D.AGENCY_CD
    AND     B.CUST_NO   = C.CUST_NO
    AND     A.WAREH_CD  = E.WAREH_CD
    AND     A.ORD_NO    = DECODE(v_Ord_No   , NULL, A.ORD_NO          , v_Ord_No)
    AND     A.CUST_NO   = DECODE(v_Cust_No  , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.AGENCY_CD = DECODE(v_Agency_Cd, NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.WAREH_CD  = DECODE(v_Wareh_Cd , NULL, A.WAREH_CD        , v_Wareh_Cd)
    AND     A.STRG_STAT = DECODE(v_Strg_Stat, NULL, A.STRG_STAT       , v_Strg_Stat)
    AND     A.STRG_MTHD = DECODE(v_Strg_Mthd, NULL, A.STRG_MTHD       , v_Strg_Mthd)
    AND     NVL(A.STRG_DAY, '00010101')
                        BETWEEN DECODE(v_Strg_Day_Fr, NULL, '00010101', v_Strg_Day_Fr)
                            AND DECODE(v_Strg_Day_To, NULL, '99991231', v_Strg_Day_To)
    AND     NVL(A.DLVR_DAY, '00010101')
                        BETWEEN DECODE(v_Dlvr_Day_Fr, NULL, '00010101', v_Dlvr_Day_Fr)
                            AND DECODE(v_Dlvr_Day_To, NULL, '99991231', v_Dlvr_Day_To)
    AND     B.CAR_NO    = DECODE(v_Car_No   , NULL, B.CAR_NO          , v_Car_No)
         ) A
           LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
    
    ;

  END p_sRtcs0203KeepHistory;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 계약번호의 타이어 보관회수 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER IS

    v_ServCnt   NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(*)
    INTO    v_ServCnt
    FROM    RTCS0203
    WHERE   ORD_NO  = v_Ord_No
    AND     SRSV_YN = 'Y';

    RETURN v_ServCnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0203ServCnt;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 계약번호의 타이어 보관개수 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServTireCnt(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER IS

    v_ServTireCnt   NUMBER DEFAULT 0;

  BEGIN

    SELECT  NVL( SUM(TOT_TIRE_CNT), 0)
    INTO    v_ServTireCnt
    FROM    RTCS0203
    WHERE   ORD_NO  = v_Ord_No
    AND     SRSV_YN = 'Y';

    RETURN v_ServTireCnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0203ServTireCnt;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 계약번호가 현재보관 진행중인지 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCurrYn(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,           /*주문번호            */
    v_Strg_Stat      IN RTCS0203.STRG_STAT%TYPE         /*보관상태            */
    ) RETURN NUMBER IS

    v_Cnt   NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(*)
    INTO    v_Cnt
    FROM    RTCS0203 A
    WHERE   A.ORD_NO    = v_Ord_No
    AND     A.STRG_STAT = DECODE(v_Strg_Stat, NULL, A.STRG_STAT, v_Strg_Stat);

    RETURN v_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0203ServCurrYn;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 차량번호가 현재보관 진행중인지 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203ServCurrCar(
    v_Car_No         IN RTSD0104.CAR_NO%TYPE            /*차량번호            */
    ) RETURN NUMBER IS

    v_Cnt   NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(*)
    INTO    v_Cnt
    FROM    RTSD0104 A, RTCS0203 B
    WHERE   A.CAR_NO    = v_Car_No
    AND     A.ORD_NO    = B.ORD_NO
    AND     A.STAT_CD  <> '06'
    AND     B.STRG_STAT = 'S';

    RETURN v_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0203ServCurrCar;

  /*****************************************************************************
  -- 윈터 타이어 보관 처리 - 해당 계약번호의 현재보관 상태 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0203StrgStat(
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,           /*주문번호            */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE          /*보관순번            */
    ) RETURN VARCHAR IS

    v_Strg_Stat     RTCS0203.STRG_STAT%TYPE DEFAULT NULL;

  BEGIN

    SELECT  STRG_STAT
    INTO    v_Strg_Stat
    FROM    RTCS0203
    WHERE   ORD_NO   = v_Ord_No
    AND     STRG_SEQ = v_Strg_Seq;

    RETURN v_Strg_Stat;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0203StrgStat;

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
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCS0203
    SET    STRG_STAT        = v_Strg_Stat,
           SRSV_YN          = v_Srsv_Yn,
           DLVR_DAY         = v_Dlvr_Day,
           DLVR_DT          = v_Dlvr_Dt,
           DLVR_FILE_PATH   = v_Dlvr_File_Path,
           DLVR_FILE_NAME   = v_Dlvr_File_Name,
           DLVR_USER_ID     = v_Reg_Id,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  ORD_NO           = v_Ord_No
    AND    STRG_SEQ         = v_Strg_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0203WinterOut;

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
    ) IS

    v_Curr_Cnt  NUMBER;
    e_Error     EXCEPTION;

    v_Os_Day        RTSD0108.OS_DAY%TYPE;           /*종료일자          */
    v_Serv_Cnt0     RTSD0013.SERV_CNT0%TYPE;        /*보관회수(전체)    */
    v_Cnt_Cd        RTSD0108.CNT_CD%TYPE;           /*계약타이어 개수   */
    v_Cnt           NUMBER;                         /*계약타이어 총개수 */
    v_Cont_Tire_Cnt NUMBER;                         /*계약타이어 총개수 */
    v_Use_Cnt0      NUMBER;                         /*보관회수(사용)    */
    v_Use_Tire_Cnt  NUMBER;                         /*보관타이어 총개수 */
    v_Strg_Seq      RTCS0203.STRG_SEQ%TYPE;         /* 보관순번         */
    v_Car_No        RTSD0104.CAR_NO%TYPE;           /*차량번호          */
    v_Strg_User_Id  RTCS0203.STRG_USER_ID%TYPE;

    v_Appr_Amt      RTRE0100.APPR_AMT%TYPE;         /*연체금액          */

  BEGIN

    -- 필수값: 계약번호, 고객코드, 보관여부, 보관상태, 보관서비스적용여부,
    -- 대리점코드, 창고코드, 보관일자, 보관증수령방법, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL)  THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL)  THEN
        v_Return_Message := '고객코드('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Strg_Stat) IS NULL)  THEN
        v_Return_Message := '보관상태('||v_Strg_Stat||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Srsv_Yn) IS NULL)  THEN
        v_Return_Message := '보관서비스적용여부('||v_Srsv_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Agency_Cd) IS NULL)  THEN
        v_Return_Message := '대리점코드('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (v_Strg_Yn = 'Y') AND (TRIM(v_Wareh_Cd) IS NULL)  THEN
        v_Return_Message := '창고코드('||v_Wareh_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Strg_Day) IS NULL)  THEN
        v_Return_Message := '보관일자('||v_Strg_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Strg_Stat) = 'Y' ) AND (TRIM(v_Strg_Mthd) IS NULL)  THEN
        v_Return_Message := '보관증수령방법('||v_Strg_Mthd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL)  THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 연체금액 체크
    v_Appr_Amt := Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(v_Cust_No, NULL, NULL);
    IF v_Appr_Amt > 0 THEN
        v_Return_Message := '연체금액('||TO_CHAR(NVL(v_Appr_Amt,0))||')이 존재하므로 처리가 불가합니다.!';
        RAISE e_Error;
    END IF;
    
    -- 타이어정보 check
    IF v_Strg_Yn = 'Y' THEN
        IF (TRIM(v_Mf_Cd) IS NOT NULL)  THEN
            IF (TRIM(v_Mf_Cd_F) IS NOT NULL)
            OR (TRIM(v_Mf_Cd_R) IS NOT NULL) THEN
                v_Return_Message := '타이어제조사('||v_Mf_Cd||') : 타이어 정보가 양쪽에 들어오면 안됩니다.!';
                RAISE e_Error;
            END IF;
            v_Curr_Cnt := TO_NUMBER(NVL(v_Tire_Cnt,0));
        ELSE
            IF (TRIM(v_Mf_Cd_F) IS NULL)
            AND (TRIM(v_Mf_Cd_R) IS NULL) THEN
                v_Return_Message := '타이어제조사('||v_Mf_Cd||') : 타이어 정보가 양쪽에 모두 없으면 안됩니다.!';
                RAISE e_Error;
            ELSIF TO_NUMBER(NVL(v_Tire_Cnt_F,0)) > 2
               OR TO_NUMBER(NVL(v_Tire_Cnt_R,0)) > 2 THEN
                v_Return_Message := '앞,뒤 타이어 갯수는 각 2개보다 크면 안됩니다.!';
                RAISE e_Error;
            END IF;
            v_Curr_Cnt := TO_NUMBER(NVL(v_Tire_Cnt_F,0)) + TO_NUMBER(NVL(v_Tire_Cnt_R,0));
        END IF;

        IF v_Curr_Cnt = 0 THEN
            v_Return_Message := '보관여부('||v_Strg_Yn||') : Y 인데 보관개수가 0이면 안됩니다.!';
            RAISE e_Error;
        ELSIF v_Curr_Cnt > 4 THEN
            v_Return_Message := '보관개수가 4보다 크면 안됩니다.!';
            RAISE e_Error;
        END IF;
    ELSE
        IF (TRIM(v_Mf_Cd) IS NOT NULL)
        OR (TRIM(v_Mf_Cd_F) IS NOT NULL)
        OR (TRIM(v_Mf_Cd_R) IS NOT NULL) THEN
            v_Return_Message := '보관여부('||v_Strg_Yn||') : Y 가 아니면 타이어 정보가 들어오면 안됩니다.!';
            RAISE e_Error;
        END IF;
        v_Curr_Cnt := 0;
    END IF;

    -- 타이어제조사 선택된 상태에서는 나머지 값 모두 필수 입력체크
    IF (TRIM(v_Mf_Cd) IS NOT NULL) THEN

        IF (TRIM(v_Pattern_Cd) IS NULL) THEN
            v_Return_Message := '패턴 : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Selection_Width) IS NULL) THEN
            v_Return_Message := '폭 : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Aspect_Ratio) IS NULL) THEN
            v_Return_Message := '시리즈 : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Wheel_Inches) IS NULL) THEN
            v_Return_Message := '인치 : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ply_Rating) IS NULL) THEN
            v_Return_Message := '강도 : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Tire_Cnt) IS NULL) THEN
            v_Return_Message := '수량 : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;


    -- 타이어제조사(앞) 선택된 상태에서는 나머지 값 모두 필수 입력체크
    IF (TRIM(v_Mf_Cd_F) IS NOT NULL) THEN

        IF (TRIM(v_Pattern_Cd_F) IS NULL) THEN
            v_Return_Message := '패턴(앞) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Selection_Width_F) IS NULL) THEN
            v_Return_Message := '폭(앞) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Aspect_Ratio_F) IS NULL) THEN
            v_Return_Message := '시리즈(앞) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Wheel_Inches_F) IS NULL) THEN
            v_Return_Message := '인치(앞) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ply_Rating_F) IS NULL) THEN
            v_Return_Message := '강도(앞) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Tire_Cnt_F) IS NULL) THEN
            v_Return_Message := '수량(앞) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    -- 타이어제조사(뒤) 선택된 상태에서는 나머지 값 모두 필수 입력체크
    IF (TRIM(v_Mf_Cd_R) IS NOT NULL) THEN

        IF (TRIM(v_Pattern_Cd_R) IS NULL) THEN
            v_Return_Message := '패턴(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Selection_Width_R) IS NULL) THEN
            v_Return_Message := '폭(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Aspect_Ratio_R) IS NULL) THEN
            v_Return_Message := '시리즈(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Wheel_Inches_R) IS NULL) THEN
            v_Return_Message := '인치(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ply_Rating_R) IS NULL) THEN
            v_Return_Message := '강도(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Tire_Cnt_R) IS NULL) THEN
            v_Return_Message := '수량(뒤) : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    -- 사용자의 그룹이 영업관리팀이 아닌 경우 보관증 PATH, 보관증 FILE명은 필수 입력사항임
    IF '01' != Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id) THEN
        IF (TRIM(v_Strg_File_Path) IS NULL)
        OR (TRIM(v_Strg_File_Name) IS NULL) THEN
            v_Return_Message := '보관증 FILE명('||v_Strg_File_Name||') : 영업관리팀이 아닌 경우 보관증은 필수입니다.!';
            RAISE e_Error;
        END IF;
    END IF;

    -- 보관일자 check(보관일자는 계약의 종료일자 이내)
    v_Os_Day := Pkg_Rtsd0108.f_sRtsd0108Os_Day(v_Ord_No);
    IF v_Strg_Day > v_Os_Day THEN
        v_Return_Message := '보관일자('||v_Strg_Day||') : 는 계약의 종료일자까지만 가능합니다!';
        RAISE e_Error;
    END IF;

    -- 창고코드 내역 check
    IF (v_Strg_Yn = 'Y') AND (0 = Pkg_Rtcs0202.f_sRtcs0202Use_Yn (v_Agency_Cd, NULL, v_Wareh_Cd, 'Y')) THEN
        v_Return_Message := '창고코드('||v_Wareh_Cd||') : 보관처리 불가 - 창고내역 오류입니다!';
        RAISE e_Error;
    END IF;

    -- 보관 내역 체크하여 보관 가능한 횟수와 타이어 수를 비교한다.
    Pkg_Rtsd0013.p_Rtsd0013ServCntNTireCnt(v_Ord_No, v_Serv_Cnt0, v_Cnt_Cd, v_Cont_Tire_Cnt,
                                           v_Use_Cnt0, v_Use_Tire_Cnt,
                                           v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    -- 보관 대상 여부 체크
    IF v_Serv_Cnt0 = 0 THEN
        v_Return_Message := '보관가능한 계약이 아닙니다. 서비스 내역을 확인하시기 바랍니다!';
        RAISE e_Error;
    END IF;

    -- 보관회수 비교
    IF v_Serv_Cnt0 < (v_Use_Cnt0 + 1) THEN
        v_Return_Message := '보관가능회수가 초과하여 처리할 수 없습니다! (제공횟수:'||TO_CHAR(v_Serv_cnt0)||'/보관횟수: '||TO_CHAR(v_Use_Cnt0)||')';
        RAISE e_Error;
    END IF;

    -- 보관타이어개수 비교
    IF v_Cont_Tire_Cnt < v_Use_Tire_Cnt + v_Curr_Cnt THEN
        v_Return_Message := '보관가능 타이어 개수가 초과하여 처리할 수 없습니다! ('||TO_CHAR(v_Cont_Tire_Cnt - v_Use_Tire_Cnt)||'개 가능)';
        RAISE e_Error;
    END IF;

    -- 현재 보관중인 건이 있는지 check(계약번호 기준)
    IF 0 != f_sRtcs0203ServCurrYn(v_Ord_No, 'S') THEN
        v_Return_Message := '계약번호('||v_Ord_No||') 기존에 보관중인 건이 존재하여 처리할 수 없습니다!';
        RAISE e_Error;
    END IF;

--    -- 현재 보관중인 건이 있는지 check(차량번호 기준)
--    v_Car_No := Pkg_Rtsd0104.f_sRtsd0104CarNo(v_Ord_No);
--
--    IF 0 != f_sRtcs0203ServCurrCar(v_Car_No) THEN
--        v_Return_Message := '차량번호('||v_Car_No||') 기존에 보관중인 건이 존재하여 처리할 수 없습니다!';
--        RAISE e_Error;
--    END IF;


    -- 저장 처리
    v_Strg_Seq := f_sRtcs0203ServCurrYn(v_Ord_No, NULL) + 1;
    IF 0 != f_InsertRtcs0203 (
--                v_Ord_No, v_Strg_Seq, v_Cust_No, v_Srrg_Day, v_Strg_Yn,
--                v_Strg_Stat, v_Srsv_Yn, v_Agency_Cd, v_Wareh_Cd, v_Strg_Day,
--                v_Strg_Dt, v_Strg_Mthd, v_Strg_File_Path, v_Strg_File_Name, v_Strg_User_Id,
--                v_Dlvr_Day, v_Dlvr_Dt, v_Dlvr_File_Path, v_Dlvr_File_Name, v_Dlvr_User_Id,
--                v_Mf_Cd, v_Pattern_Cd, v_Selection_Width, v_Aspect_Ratio, v_Wheel_Inches,
--                v_Ply_Rating, v_Tire_Cnt,
--                v_Mf_Cd_F, v_Pattern_Cd_F, v_Selection_Width_F, v_Aspect_Ratio_F,
--                v_Wheel_Inches_F, v_Ply_Rating_F, v_Tire_Cnt_F,
--                v_Mf_Cd_R, v_Pattern_Cd_R, v_Selection_Width_R, v_Aspect_Ratio_R,
--                v_Wheel_Inches_R, v_Ply_Rating_R, v_Tire_Cnt_R, v_Tot_Tire_Cnt,
--                v_Reg_Id, v_ErrorText

                v_Ord_No, v_Strg_Seq, v_Cust_No, TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Strg_Yn,
                v_Strg_Stat, v_Srsv_Yn, v_Agency_Cd, v_Wareh_Cd, v_Strg_Day,
                SYSDATE, v_Strg_Mthd, v_Strg_File_Path, v_Strg_File_Name, v_Reg_Id,
                NULL, NULL, NULL, NULL, NULL,
                v_Mf_Cd, v_Pattern_Cd, v_Selection_Width, v_Aspect_Ratio, v_Wheel_Inches,
                v_Ply_Rating, v_Tire_Cnt,
                v_Mf_Cd_F, v_Pattern_Cd_F, v_Selection_Width_F, v_Aspect_Ratio_F,
                v_Wheel_Inches_F, v_Ply_Rating_F, v_Tire_Cnt_F,
                v_Mf_Cd_R, v_Pattern_Cd_R, v_Selection_Width_R, v_Aspect_Ratio_R,
                v_Wheel_Inches_R, v_Ply_Rating_R, v_Tire_Cnt_R, v_Curr_Cnt,
                v_Reg_Id, v_ErrorText ) THEN
        v_Return_Message := '타이어 보관 등록 실패!!!'||'-'||v_Errortext;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리 되었습니다';
    v_ErrorText := '';



    EXCEPTION
      WHEN e_Error THEN
       v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_Rtcs0203WinterIn(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_Rtcs0203WinterIn(2)', v_ErrorText, v_Return_Message);

  END p_Rtcs0203WinterIn;

  /*****************************************************************************
  -- 윈터 타이어 출고 처리
  *****************************************************************************/
  PROCEDURE p_Rtcs0203WinterOut (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Srsv_Yn        IN RTCS0203.SRSV_YN%TYPE,        /*보관서비스적용여부    */
    v_Dlvr_Day       IN RTCS0203.DLVR_DAY%TYPE,       /*출고일자              */
    v_Dlvr_File_Path IN RTCS0203.DLVR_FILE_PATH%TYPE, /*출고증 PATH           */
    v_Dlvr_File_Name IN RTCS0203.DLVR_FILE_NAME%TYPE, /*출고증 FILE 명        */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Curr_Cnt  NUMBER;
    e_Error     EXCEPTION;

    v_Cust_No       RTCS0203.CUST_NO%TYPE;            /*고객코드             */
    v_Appr_Amt      RTRE0100.APPR_AMT%TYPE;           /*연체금액             */

  BEGIN

    -- 필수값: 계약번호, 보관순번, 보관서비스적용여부, 출고일자, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL)  THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Strg_Seq) IS NULL)  THEN
        v_Return_Message := '보관순번('||v_Strg_Seq||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Srsv_Yn) IS NULL)  THEN
        v_Return_Message := '보관서비스적용여부('||v_Srsv_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Dlvr_Day) IS NULL)  THEN
        v_Return_Message := '출고일자('||v_Dlvr_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL)  THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
   
    BEGIN
    
        SELECT  CUST_NO
        INTO    v_Cust_No
        FROM    RTCS0203
        WHERE   ORD_NO   = v_Ord_No
        AND     STRG_SEQ = v_Strg_Seq;

    EXCEPTION        
      WHEN OTHERS THEN
        v_Return_Message := '해당 계약번호에 고객정보 획득실패!.시스템관리자 문의요망.! - '||SUBSTR(SQLERRM, 1, 200);
        RAISE e_Error;
    END;    
    
    -- 연체금액 체크
    v_Appr_Amt := Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(v_Cust_No, NULL, NULL);
    IF v_Appr_Amt > 0 THEN
        v_Return_Message := '연체금액('||TO_CHAR(NVL(v_Appr_Amt,0))||')이 존재하므로 처리가 불가합니다.!';
        RAISE e_Error;
    END IF;
    

--    -- 사용자의 그룹이 영업관리팀이 아닌 경우 출고증 PATH, 보관증 FILE명은 필수 입력사항임
--    IF '01' != Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id) THEN
--        IF (TRIM(v_Dlvr_File_Path) IS NULL)
--        OR (TRIM(v_Dlvr_File_Name) IS NULL) THEN
--            v_Return_Message := '보관증 FILE명('||v_Dlvr_File_Name||') : 영업관리팀이 아닌 경우 출고증은 필수입니다.!';
--            RAISE e_Error;
--        END IF;
--    END IF;

    -- 보관상태 check
    IF 'S' <> f_sRtcs0203StrgStat(v_Ord_No, v_Strg_Seq) THEN
        v_Return_Message := '보관중인 대상이 존재하지 않아서 처리할 수가 없습니다!';
        RAISE e_Error;
    END IF;


    -- 저장 처리
--    IF 0 != f_UpdateRtcs0203WinterOut (v_Ord_No, v_Strg_Seq, v_Strg_Stat, v_Srsv_Yn,
--                                       v_Dlvr_Day, v_Dlvr_Dt, v_Dlvr_File_Path, v_Dlvr_File_Name, v_Dlvr_User_Id,
    IF 0 != f_UpdateRtcs0203WinterOut (v_Ord_No, v_Strg_Seq, 'D', v_Srsv_Yn,
                                       v_Dlvr_Day, SYSDATE, v_Dlvr_File_Path, v_Dlvr_File_Name, v_Reg_Id,
                                       v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '타이어 출고 등록 실패!!!'||'-'||v_Errortext;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리 되었습니다';
    v_ErrorText := '';



    EXCEPTION
      WHEN e_Error THEN
       v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_Rtcs0203WinterOut(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_Rtcs0203WinterOut(2)', v_ErrorText, v_Return_Message);

  END p_Rtcs0203WinterOut;

  /*****************************************************************************
  -- 대리점 - 창고 내역 조회(보관증, 출고증 조회)
  *****************************************************************************/
  PROCEDURE p_sRtcs0203FilePathName (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Strg_Seq       IN RTCS0203.STRG_SEQ%TYPE,       /*보관순번              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                                      /* 계약번호        */
            A.CUST_NO,                                     /* 고객코드        */
            A.STRG_FILE_PATH,                              /* 보관증 PATH     */
            A.STRG_FILE_NAME,                              /* 보관증 FILE 명  */
            A.DLVR_FILE_PATH,                              /* 출고증 PATH     */
            A.DLVR_FILE_NAME                               /* 출고증 FILE 명  */
    FROM    RTCS0203 A
    WHERE   ORD_NO   = v_Ord_No
    AND     STRG_SEQ = v_Strg_Seq;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_sRtcs0203FilePathName(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_sRtcs0203FilePathName(2)', v_ErrorText, v_Return_Message);

  END p_sRtcs0203FilePathName;


  /*****************************************************************************
  -- 윈터 타이어 출고 처리(교체서비스)
  *****************************************************************************/
  PROCEDURE p_Rtcs0203WinterOutChange (
    v_Ord_No         IN RTCS0203.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTCS0203.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtcs0203 IS
    SELECT  STRG_SEQ, AGENCY_CD
    FROM    RTCS0203
    WHERE   ORD_NO = v_Ord_No
    AND     STRG_STAT = 'S';

    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
    e_Error     EXCEPTION;

  BEGIN

    FOR CUR IN Cur_Rtcs0203 LOOP
        EXIT WHEN Cur_Rtcs0203%NOTFOUND;
        v_exist := TRUE;

        IF (CUR.AGENCY_CD <> v_Reg_Id) THEN
            v_Return_Message := '타이어 보관을 의뢰한 렌탈전문점에서만 교체가능합니다.';
            RAISE e_Error;
        END IF;

        Pkg_Rtcs0203.p_Rtcs0203WinterOut(v_Ord_No, CUR.STRG_SEQ, 'Y',
                                         TO_CHAR(SYSDATE,'YYYYMMDD'),NULL,NULL,v_Reg_Id,
                                         v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '윈터 타이어 출고(RTCS0203) 처리 시 에러!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtcs0203%ISOPEN THEN
        CLOSE Cur_Rtcs0203;
    END IF;

    IF v_exist = FALSE THEN
        v_Return_Message := '정상적으로 처리 되었습니다.(출고처리 안함)';
    ELSE
        v_Return_Message := '정상적으로 처리 되었습니다.';
    END IF;

    v_Success_code := 0;
    v_ErrorText := '';
    --COMMIT;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_Rtcs0203WinterOutChange(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0203.p_Rtcs0203WinterOutChange(2)', v_ErrorText, v_Return_Message);

  END p_Rtcs0203WinterOutChange;

END Pkg_Rtcs0203;