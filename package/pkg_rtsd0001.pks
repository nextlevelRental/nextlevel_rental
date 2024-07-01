CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0001 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0001
   PURPOSE   차종 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 차종 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0001Count(
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,         /*차종                */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE       /*사양                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 차종 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*카메이커              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*카메이커              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 차종 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0001 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*카메이커              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 차종 마스터 Select - 카메이커로 모델명 조회(차종과 사양)- 상품 마스터 조회 팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelName(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE        /*카메이커              */
    );

  /*****************************************************************************
  -- 차종 마스터 Select - 차종 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*카메이커              */
	v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE         /*차종              	 */
    );

  /*****************************************************************************
  -- 차종 마스터 Select - 차종 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelByClassSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*카메이커              */
    v_Class_Cd       IN RTSD0004.CLASS_CD%TYPE         /*차량분류              */
  );
    
  /*****************************************************************************
  -- 차종 마스터 Select - 사양 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ContentsSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*카메이커              */
	v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE         /*차종              	 */
    );

  /*****************************************************************************
  -- 차종 마스터 Select - 차종정보관리  조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0001CarMasterSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*카메이커              */
	v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,        /*차종              	  */
	v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,        /*차종              	  */
	v_Use_Yn		 IN RTSD0002.USE_YN%TYPE          /*사용여부              */
    );

  /*****************************************************************************
  -- 차종 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0001UseYn (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*사양                  */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
END Pkg_Rtsd0001;
/
