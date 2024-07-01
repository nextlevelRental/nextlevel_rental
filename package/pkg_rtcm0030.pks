CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0030 AS
/*******************************************************************************
   NAME:       Pkg_Rtcm0030
   PURPOSE:    공지사항

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jungsoo         1. Created this package spec.
*******************************************************************************/

  /*****************************************************************************
  -- 공지사항 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0030Count(
    v_Ntc_Seq    IN     RTCM0030.NTC_SEQ%TYPE        /* 공지사항 순번         */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 공지사항 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0030 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Title          IN RTCM0030.TITLE%TYPE,          /*제목                  */
    v_Reg_Fdt        IN VARCHAR,                      /*등록일FROM            */
    v_Reg_Tdt        IN VARCHAR,                      /*등록일TO              */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE         /*작성자                */
    );

  /*****************************************************************************
  -- 공지사항 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0030(
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*공지구분(안내/설명...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*제목                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*공지내용              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*공지게시 시작일       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*공지게시 종료일       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*조회건수              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 공지사항 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0030(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*공지순번              */
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*공지구분(안내/설명...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*제목                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*공지내용              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*공지게시 시작일       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*공지게시 종료일       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*조회건수              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2   
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 공지사항 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0030(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*공지순번              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 공지사항 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0030(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*공지순번              */
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*공지구분(안내/설명...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*제목                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*공지내용              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*공지게시 시작일       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*공지게시 종료일       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*조회건수              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*등록자 ID             */    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

  /*****************************************************************************
  -- 공지사항 Update - 공지사항 조회건수 업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0030ReadCnt(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*공지순번              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
    
END Pkg_Rtcm0030;
/
