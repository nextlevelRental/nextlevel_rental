CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm9003 AS 
/******************************************************************************* 
   NAME      Pkg_Rtcm9003 
   PURPOSE   �ŷ��׽�Ʈ 
 
   REVISIONS 
   Ver        Date        Author           Description 
   ---------  ----------  ---------------  ------------------------------------- 
   1.0        2018-09-12  Sean         1. Created this package body. 
*******************************************************************************/ 
 
  /***************************************************************************** 
  -- ��������(�亯��ȣ) Count 
  *****************************************************************************/ 
  FUNCTION f_sRtcm9003Count( 
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,        /*�亯��ȣ            */ 
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE        /*�亯����            */ 
    ) RETURN NUMBER; 
 
 
  /***************************************************************************** 
  -- ��������(�亯��ȣ) Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtcm9003 ( 
    Ref_Cursor       IN OUT SYS_REFCURSOR, 
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */ 
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */ 
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*��뿩��              */ 
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*�亯����              */ 
    v_Score          IN RTCS0113.SCORE%TYPE,          /*����                  */ 
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE          /*����� ID             */ 
    );  
 
  /***************************************************************************** 
  -- ��������(�亯��ȣ) Insert 
  *****************************************************************************/ 
  FUNCTION f_InsertRtcm9003 ( 
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */ 
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */ 
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*��뿩��              */ 
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*�亯����              */ 
    v_Score          IN RTCS0113.SCORE%TYPE,          /*����                  */ 
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER; 
 
  /***************************************************************************** 
  -- ��������(�亯��ȣ) Update 
  *****************************************************************************/ 
  FUNCTION f_UpdateRtcm9003 ( 
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */ 
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */ 
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*��뿩��              */ 
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*�亯����              */ 
    v_Score          IN RTCS0113.SCORE%TYPE,          /*����                  */ 
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER; 
 
  /***************************************************************************** 
  -- ��������(�亯��ȣ) Delete 
  *****************************************************************************/ 
  FUNCTION f_DeleteRtcm9003 ( 
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */ 
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */ 
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText      OUT VARCHAR2 
    ) RETURN NUMBER; 
 
 
  /***************************************************************************** 
  -- ��������(�亯��ȣ) ����(IUD) 
  *****************************************************************************/ 
  PROCEDURE p_IUDRtcm9003 ( 
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */ 
    v_Answer_No      IN RTCS0113.ANSWER_NO%TYPE,      /*�亯��ȣ              */ 
    v_Answer_Seq     IN RTCS0113.ANSWER_SEQ%TYPE,     /*�亯����              */ 
    v_Use_Yn         IN RTCS0113.USE_YN%TYPE,         /*��뿩��              */ 
    v_Answer         IN RTCS0113.ANSWER%TYPE,         /*�亯����              */ 
    v_Score          IN RTCS0113.SCORE%TYPE,          /*����                  */ 
    v_Reg_Id         IN RTCS0113.REG_ID%TYPE,         /*����� ID             */ 
    v_Success_Code   OUT NUMBER, 
    v_Return_Message OUT VARCHAR2, 
    v_ErrorText      OUT VARCHAR2 
    ); 
 
  /***************************************************************************** 
  -- �򰡹ݿ�������ȸ 
  *****************************************************************************/ 
  FUNCTION f_sRtcm9003_JS( 
    v_Answer_No        IN RTCS0113.ANSWER_NO%TYPE,      /*������ȣ            */ 
    v_Answer_Seq       IN RTCS0113.ANSWER_SEQ%TYPE      /*������ȣ            */ 
    ) RETURN NUMBER; 
 
END Pkg_Rtcm9003;
/
