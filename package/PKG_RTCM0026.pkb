CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0026 AS
/*******************************************************************************
   NAME:       Rtcm0026
   PURPOSE:    ���ѱ׷�-����� �����̷� ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2021-10-18                   1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ѱ׷�-����� �����̷� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0026 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Auth_Grp_Cd    IN     RTCM0026.AUTH_GRP_CD%TYPE    /*���ѱ׷��ڵ�       */
    , v_User_Id        IN     RTCM0026.USER_ID%TYPE        /*����� ���̵�      */
  ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR 
    SELECT  A1.AUTH_GRP_CD  /* ���ѱ׷��ڵ�  */
         ,  B1.AUTH_GRP_NM  /* ���ѱ׷��    */
         ,  A1.USER_ID      /* ����� ���̵� */
         ,  C1.USER_NM      /* ����ڸ�      */
         ,  A1.USEQ         /* �̷¼���      */
         ,  A1.DEL_FG       /* ����ǥ��      */
         ,  A1.REG_ID       /* ����� ID     */
         ,  A1.REG_DT       /* �����        */
         ,  A1.CHG_ID       /* ������ ID     */
         ,  A1.CHG_DT       /* ������        */
      FROM  RTCM0026 A1  
         ,  RTCM0021 B1
         ,  RTCM0001 C1
     WHERE  A1.AUTH_GRP_CD = v_Auth_Grp_Cd
       AND  A1.USER_ID     = v_User_Id 
       AND  A1.AUTH_GRP_CD = B1.AUTH_GRP_CD(+)
       AND  A1.USER_ID     = C1.USER_ID(+) 
     ORDER  BY A1.USER_ID, A1.AUTH_GRP_CD, A1.USEQ  
    ;    
    
  END p_sRtcm0026;

  /*****************************************************************************
  -- ���ѱ׷�-����� �����̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0026(
      v_Auth_Grp_Cd    IN     RTCM0026.AUTH_GRP_CD%TYPE    /*���ѱ׷��ڵ�       */
    , v_User_Id        IN     RTCM0026.USER_ID%TYPE        /*����� ���̵�      */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
    
  BEGIN
  
    INSERT INTO RTCM0026 (
          AUTH_GRP_CD
        , USER_ID
        , USEQ
        , DEL_FG
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    )
    SELECT  A1.AUTH_GRP_CD
         ,  A1.USER_ID
         ,  NVL((SELECT MAX(Z.USEQ)+1 FROM RTCM0026 Z WHERE Z.AUTH_GRP_CD = A1.AUTH_GRP_CD AND Z.USER_ID = A1.USER_ID), 1)
         ,  A1.DEL_FG
         ,  A1.REG_ID
         ,  A1.REG_DT
         ,  A1.CHG_ID
         ,  A1.CHG_DT
      FROM  RTCM0023 A1  
     WHERE  A1.AUTH_GRP_CD = v_Auth_Grp_Cd
       AND  A1.USER_ID     = v_User_Id 
    ;             
                
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0026;



END Pkg_Rtcm0026;
/