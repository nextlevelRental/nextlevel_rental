CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0013 AS
/*******************************************************************************
    NAME        Pkg_Rtcs0013
    PURPOSE     �湮���� �ź�öȸ ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-26  wjim            [20170726_01] �ű԰���
*******************************************************************************/

  /*****************************************************************************
  -- �湮���� �ź�öȸ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRTCS0013 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTCS0013.ORD_NO%TYPE           /* ����ȣ         */
  );
  
  /*****************************************************************************
  -- �湮���� �źε��
  *****************************************************************************/
  PROCEDURE p_SaveRtcs0013Deny (
      v_Ord_No          IN RTCS0013.ORD_NO%TYPE            /* ����ȣ        */
    , v_Equ_No          IN RTCS0013.EQU_NO%TYPE            /* �����ȣ        */
    , v_Deny_Std_Ym     IN RTCS0013.DENY_STD_YM%TYPE       /* �źα��س��    */       
    , v_Deny_Desc       IN RTCS0013.DENY_DESC%TYPE         /* �źγ���        */
    , v_Reg_Id          IN RTCS0013.REG_ID%TYPE            /* �����ID        */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- �湮���� öȸ���
  *****************************************************************************/
  PROCEDURE p_SaveRtcs0013Withdraw (
      v_Ord_No          IN RTCS0013.ORD_NO%TYPE            /* ����ȣ        */
    , v_Equ_No          IN RTCS0013.EQU_NO%TYPE            /* �����ȣ        */
    , v_Deny_Seq        IN RTCS0013.DENY_SEQ%TYPE          /* �źμ���        */
    , v_Wthdrw_Std_Ym   IN RTCS0013.WTHDRW_STD_YM%TYPE     /* öȸ���س��    */       
    , v_Wthdrw_Desc     IN RTCS0013.WTHDRW_DESC%TYPE       /* öȸ����        */
    , v_Reg_Id          IN RTCS0013.REG_ID%TYPE            /* �����ID        */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END Pkg_Rtcs0013;
/
