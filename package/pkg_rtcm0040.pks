CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcm0040 AS
/******************************************************************************
   NAME:       Pkg_Rtcm0040
   PURPOSE:    �̹��� ���� ���

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
******************************************************************************/

  /*****************************************************************************
  -- �̹��� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0040Count(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE        /*���ε����Ϲ�ȣ        */
    ) RETURN NUMBER;
 
  /*****************************************************************************
  -- �̹��� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0040 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Reg_Fdt        IN VARCHAR,                      /*���ε�����FROM        */
    v_Reg_Tdt        IN VARCHAR,                      /*���ε�����TO          */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*���� ���ϸ�         */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE        /*���ε� ���α׷�       */
    );

  /*****************************************************************************
  -- �̹��� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*���ε����Ϲ�ȣ        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*���ε����ϱ׷��ȣ    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*���� ���ϸ�         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*������ ���ϸ�         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*���ϻ�����            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*���ε� ���α׷�       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �̹��� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*���ε����Ϲ�ȣ        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*���ε����ϱ׷��ȣ    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*���� ���ϸ�         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*������ ���ϸ�         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*���ϻ�����            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*���ε� ���α׷�       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �̹��� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*���ε����Ϲ�ȣ        */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �̹��� ���� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0040(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*���ε����Ϲ�ȣ        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*���ε����ϱ׷��ȣ    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*���� ���ϸ�         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*������ ���ϸ�         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*���ϻ�����            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*���ε� ���α׷�       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    );

        
  /*****************************************************************************
  -- �̹��� ���� Count - ���ε����Ϲ�ȣ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcm0040Seq RETURN NUMBER;
  
  /*****************************************************************************
  -- �̹��� ���� Count - ���ε����ϱ׷��ȣ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcm0040GrpSeq RETURN NUMBER;
  
  PROCEDURE p_sRtcm0040FileGrpList (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_File_Grp_Seq        IN RTCM0040.FILE_GRP_SEQ%TYPE         /*���ε�����FROM        */
    );
    
  PROCEDURE p_sRtcm0040FileOne (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_File_Seq        IN RTCM0040.FILE_SEQ%TYPE         /*���ε�����FROM        */
  );
  
END Pkg_Rtcm0040;
/
