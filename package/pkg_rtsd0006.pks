CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0006 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0006
   PURPOSE   �����ȣ ������ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ȣ ������ Count
  *****************************************************************************/
  FUNCTION f_sRtsd0006Count(
    v_Ser_No         IN RTSD0006.SER_NO%TYPE            /*�Ϸù�ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ȣ ������ Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0006 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*�Ϸù�ȣ              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*�����ȣ              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*�õ�                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*��,��                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*��                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*����                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �����ȣ ������ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*�Ϸù�ȣ              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*�����ȣ              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*�õ�                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*��,��                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*��                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*����                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ȣ ������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*�Ϸù�ȣ              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*�����ȣ              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*�õ�                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*��,��                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*��                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*����                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ȣ ������ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0006 (
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*�Ϸù�ȣ              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ȣ ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0006 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ser_No         IN RTSD0006.SER_NO%TYPE,         /*�Ϸù�ȣ              */
    v_Pos_Cd         IN RTSD0006.POS_CD%TYPE,         /*�����ȣ              */
    v_Addrr1         IN RTSD0006.ADDRR1%TYPE,         /*�õ�                  */
    v_Addrr2         IN RTSD0006.ADDRR2%TYPE,         /*��,��                 */
    v_Addrr3         IN RTSD0006.ADDRR3%TYPE,         /*��                    */
    v_Addrr4         IN RTSD0006.ADDRR4%TYPE,         /*����                  */
    v_Sido_Cd        IN RTSD0006.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0006.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Use_Yn         IN RTSD0006.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0006.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

END Pkg_Rtsd0006;
/
