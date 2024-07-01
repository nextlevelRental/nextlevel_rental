CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0011 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0011
   PURPOSE   �����̾����� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
   1.1        2018-02-19  wjim             [20180212_01] ������ �����̾� ���� ���� 
*******************************************************************************/

  /*****************************************************************************
  -- �����̾����� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0011Count(
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,            /*�����̾�����      */
    v_Seq            IN RTSD0011.SEQ%TYPE               /*����                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����̾����� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*��������              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �����̾����� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*��������              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����̾����� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*��������              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����̾����� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����̾����� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0011 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*��������              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �����̾������˾�
  *****************************************************************************/
  PROCEDURE p_sRtsd0011_preminumPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_applyDate          IN RTSD0011.STR_DAY%TYPE,              /*��������          */
      v_cnt                IN RTSD0012.CNT_CD%TYPE,              /*Ÿ�̾��         */
      v_season            IN RTSD0011.SEASON_CD%TYPE,            /*������           */
      v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE          /*�Ⱓ�ڵ�        */
  );
  
  /*****************************************************************************
  -- ������ �����̾� ���� �˾� ��ȸ
  -- 1) ���ڱ��� 
      - ALL(��ü), TODAY(����), IN(��������)
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-19  wjim             [20180212_01] �ű� ���� 
  *****************************************************************************/
  PROCEDURE p_sRtsd0011_masterChoicePopup (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_dayTp           IN VARCHAR2                     /*���ڱ���            */
    , v_applyDate       IN RTSD0011.STR_DAY%TYPE        /*��������            */
    , v_ordId           IN RTSD0011.ORD_ID%TYPE         /*�ֹ�����(S029)      */
    , v_chanCd          IN RTSD0011.CHAN_CD%TYPE        /*ä�α���(S030)      */
    , v_Season_Cd       IN RTSD0011.SEASON_CD%TYPE      /*��������(S014)      */
  );

END Pkg_Rtsd0011;
/
