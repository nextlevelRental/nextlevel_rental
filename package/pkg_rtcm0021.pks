CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0021 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0021
   PURPOSE:    ���ѱ׷� Master ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  KBJ             1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- ���ѱ׷� Master Count
  *****************************************************************************/
  FUNCTION f_sRtcm0021Count(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���ѱ׷� Master Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0021 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,      /*���ѱ׷��ڵ�        */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,      /*���ѱ׷��          */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE     /*���ѱ׷켳��        */    
    );

  /*****************************************************************************
  -- ���ѱ׷� Master Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*���ѱ׷��ڵ�      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*���ѱ׷��        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*���ѱ׷켳��      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*��뿩��          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*����� ID         */  
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���ѱ׷� Master Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*���ѱ׷��ڵ�      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*���ѱ׷��        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*���ѱ׷켳��      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*��뿩��          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*����� ID         */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ���ѱ׷� Master Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0021(
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*���ѱ׷��ڵ�      */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*����� ID         */   
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ���ѱ׷� Master ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0021(
    v_Comm_Dvsn      IN CHAR,                             /* ó������(I,U,D)  */
    v_Auth_Grp_Cd    IN RTCM0021.AUTH_GRP_CD%TYPE,        /*���ѱ׷��ڵ�      */
    v_Auth_Grp_Nm    IN RTCM0021.AUTH_GRP_NM%TYPE,        /*���ѱ׷��        */
    v_Auth_Grp_Desc  IN RTCM0021.AUTH_GRP_DESC%TYPE,      /*���ѱ׷켳��      */
    v_Use_Yn         IN RTCM0021.USE_YN%TYPE,             /*��뿩��          */
    v_Reg_Id         IN RTCM0021.REG_ID%TYPE,             /*����� ID         */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );
  
END Pkg_Rtcm0021;
/
