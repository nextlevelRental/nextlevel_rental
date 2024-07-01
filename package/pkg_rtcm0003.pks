CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0003
AS
   /******************************************************************************
      NAME:       Rtcm0003
      PURPOSE:    ��й�ȣ�����̷�

      REVISIONS:
      Ver        Date        Author           Description
      ---------  ----------  ---------------  ------------------------------------
      1.0        2015-06-17  jimcarry         1. Created this package body.
   ******************************************************************************/


  /*****************************************************************************
  -- ��й�ȣ�����̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0003 (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_User_Id   IN     RTCM0003.USER_ID%TYPE        /*����� ���̵�           */
    );

  /*****************************************************************************
  -- ��й�ȣ�����̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0003(
    v_User_Id        IN  RTCM0003.USER_ID%TYPE,        /*����� ���̵�        */
    v_Password       IN  RTCM0003.PASSWORD%TYPE,       /*��й�ȣ             */
    v_Reason         IN  RTCM0003.REASON%TYPE,         /*�������             */
    v_Chg_Id         IN  RTCM0003.CHG_ID%TYPE,         /*������ ID            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

END Pkg_Rtcm0003;
/
