CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0024 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0024
   PURPOSE:    프로그램-권한그룹 연동 헤더

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0024Count(
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0024 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Read_Auth_Yn   IN RTCM0024.READ_AUTH_YN%TYPE,   /*읽기원한여부          */
    v_Save_Auth_Yn   IN RTCM0024.SAVE_AUTH_YN%TYPE,   /*저장권한여부          */
    v_Del_Auth_Yn    IN RTCM0024.DEL_AUTH_YN%TYPE,    /*삭제권한여부          */
    v_Prnt_Auth_Yn   IN RTCM0024.PRNT_AUTH_YN%TYPE,   /*인쇄권한여부          */
    v_Expt_Auth_Yn   IN RTCM0024.EXPT_AUTH_YN%TYPE,   /*엑셀저장권한여부      */
    v_Chg_Auth_Yn    IN RTCM0024.CHG_AUTH_YN%TYPE     /*조직수정권한여부      */
    );

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0024(
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Read_Auth_Yn   IN RTCM0024.READ_AUTH_YN%TYPE,   /*읽기원한여부          */
    v_Save_Auth_Yn   IN RTCM0024.SAVE_AUTH_YN%TYPE,   /*저장권한여부          */
    v_Del_Auth_Yn    IN RTCM0024.DEL_AUTH_YN%TYPE,    /*삭제권한여부          */
    v_Prnt_Auth_Yn   IN RTCM0024.PRNT_AUTH_YN%TYPE,   /*인쇄권한여부          */
    v_Expt_Auth_Yn   IN RTCM0024.EXPT_AUTH_YN%TYPE,   /*엑셀저장권한여부      */
    v_Chg_Auth_Yn    IN RTCM0024.CHG_AUTH_YN%TYPE,    /*조직수정권한여부      */
    v_Etc1_Auth_Yn   IN RTCM0024.ETC1_AUTH_YN%TYPE,   /*기타 권한1            */
    v_Etc2_Auth_Yn   IN RTCM0024.ETC2_AUTH_YN%TYPE,   /*기타 권한2            */
    v_Etc3_Auth_Yn   IN RTCM0024.ETC3_AUTH_YN%TYPE,   /*기타 권한3            */
    v_Reg_Id         IN RTCM0024.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0024(
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Read_Auth_Yn   IN RTCM0024.READ_AUTH_YN%TYPE,   /*읽기원한여부          */
    v_Save_Auth_Yn   IN RTCM0024.SAVE_AUTH_YN%TYPE,   /*저장권한여부          */
    v_Del_Auth_Yn    IN RTCM0024.DEL_AUTH_YN%TYPE,    /*삭제권한여부          */
    v_Prnt_Auth_Yn   IN RTCM0024.PRNT_AUTH_YN%TYPE,   /*인쇄권한여부          */
    v_Expt_Auth_Yn   IN RTCM0024.EXPT_AUTH_YN%TYPE,   /*엑셀저장권한여부      */
    v_Chg_Auth_Yn    IN RTCM0024.CHG_AUTH_YN%TYPE,    /*조직수정권한여부      */
    v_Etc1_Auth_Yn   IN RTCM0024.ETC1_AUTH_YN%TYPE,   /*기타 권한1            */
    v_Etc2_Auth_Yn   IN RTCM0024.ETC2_AUTH_YN%TYPE,   /*기타 권한2            */
    v_Etc3_Auth_Yn   IN RTCM0024.ETC3_AUTH_YN%TYPE,   /*기타 권한3            */
    v_Reg_Id         IN RTCM0024.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0024(
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Reg_Id         IN RTCM0024.REG_ID%TYPE,         /*등록자 ID             */ 
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 프로그램-권한그룹 연동 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0024(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Read_Auth_Yn   IN RTCM0024.READ_AUTH_YN%TYPE,   /*읽기원한여부          */
    v_Save_Auth_Yn   IN RTCM0024.SAVE_AUTH_YN%TYPE,   /*저장권한여부          */
    v_Del_Auth_Yn    IN RTCM0024.DEL_AUTH_YN%TYPE,    /*삭제권한여부          */
    v_Prnt_Auth_Yn   IN RTCM0024.PRNT_AUTH_YN%TYPE,   /*인쇄권한여부          */
    v_Expt_Auth_Yn   IN RTCM0024.EXPT_AUTH_YN%TYPE,   /*엑셀저장권한여부      */
    v_Chg_Auth_Yn    IN RTCM0024.CHG_AUTH_YN%TYPE,    /*조직수정권한여부      */
    v_Etc1_Auth_Yn   IN RTCM0024.ETC1_AUTH_YN%TYPE,   /*기타 권한1            */
    v_Etc2_Auth_Yn   IN RTCM0024.ETC2_AUTH_YN%TYPE,   /*기타 권한2            */
    v_Etc3_Auth_Yn   IN RTCM0024.ETC3_AUTH_YN%TYPE,   /*기타 권한3            */
    v_Reg_Id         IN RTCM0024.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );


  /*****************************************************************************
  -- 메뉴 Master -  특정 사용자의  메뉴- 프로그램 - 사용권한  트리 구성
  *****************************************************************************/
  PROCEDURE p_sRtcm0024UserProgramAuth (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_User_Id        IN RTCM0001.USER_ID%TYPE           /*사용자 아이디       */    
    );


  /*****************************************************************************
  --  프로그램-권한그룹 연동 관리 - 특정권한그룹에 속한 프로그램 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0024AuthGroupProgram (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    );
    
  /*****************************************************************************
  --  프로그램-권한그룹 연동 관리 - 특정권한그룹에 속하지 않은 프로그램 리스트
  *****************************************************************************/
  PROCEDURE p_sRtcm0024AuthGroupProgramNot (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0024.AUTH_GRP_CD%TYPE,    /*권한그룹코드          */
    v_Prgm_Cd        IN RTCM0024.PRGM_CD%TYPE,        /*프로그램코드          */
    v_Prgm_Nm        IN RTCM0011.PRGM_NM%TYPE         /*프로그램명            */
    );    
END Pkg_Rtcm0024;