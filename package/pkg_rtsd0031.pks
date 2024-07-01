CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0031 AS
/*******************************************************************************
   NAME:      PKG_RTSD0031
   PURPOSE:   ��ü���� Spec

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-15  Sean             1. Created this package spec.
*******************************************************************************/
 
  /*****************************************************************************
  -- ��ü���� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031 (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_GRP_NO     RTSD0031.GRP_NO%TYPE,
    v_GRP_NM     RTSD0031.GRP_NM%TYPE
  );

  /*****************************************************************************
  -- ��ü���� Seqä��
  *****************************************************************************/
  FUNCTION f_sRTSD0031NextSeq(
    v_GRP_NO		     IN OUT RTSD0031.GRP_NO%TYPE
    ) RETURN VARCHAR2;
  
  /*****************************************************************************
  -- ��ü���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0031 (
    v_GRP_NO		     IN OUT RTSD0031.GRP_NO%TYPE,		  
    v_GRP_NM		     IN RTSD0031.GRP_NM%TYPE,		  
    v_GRP_ST		     IN RTSD0031.GRP_ST%TYPE,		  
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,	
    v_REST_CNT	     IN RTSD0031.REST_CNT%TYPE,	  
    v_GRP_TYPE	     IN RTSD0031.GRP_TYPE%TYPE,	  
    v_REG_ID		     IN RTSD0031.REG_ID%TYPE,		  
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,	
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE,  
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0031 ( 
    v_GRP_NO		     IN RTSD0031.GRP_NO%TYPE,		  
    v_GRP_NM		     IN RTSD0031.GRP_NM%TYPE,		  
    v_GRP_ST		     IN RTSD0031.GRP_ST%TYPE,		  
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,	
    v_REST_CNT	     IN RTSD0031.REST_CNT%TYPE,	  
    v_GRP_TYPE	     IN RTSD0031.GRP_TYPE%TYPE,	  
    v_REG_ID		     IN RTSD0031.REG_ID%TYPE,		  
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,	
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE,    
    v_ErrorText   OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0031 (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
    v_GRP_NO		     IN OUT RTSD0031.GRP_NO%TYPE,		  
    v_GRP_NM		     IN RTSD0031.GRP_NM%TYPE,		  
    v_GRP_ST		     IN RTSD0031.GRP_ST%TYPE,		  
    v_MIN_AGR_CNT    IN RTSD0031.MIN_AGR_CNT%TYPE,	
    v_REST_CNT	     IN RTSD0031.REST_CNT%TYPE,	  
    v_GRP_TYPE	     IN RTSD0031.GRP_TYPE%TYPE,	  
    v_REG_ID		     IN RTSD0031.REG_ID%TYPE,		  
    v_GRP_DC_RATE    IN RTSD0031.GRP_DC_RATE%TYPE,	
    v_GRP_DC_AMT     IN RTSD0031.GRP_DC_AMT%TYPE,
    v_SALE_CD        IN RTSD0031.SALE_CD%TYPE,    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );  
    
  /*****************************************************************************
  -- ��üã�� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031GrpAddSelect (
    Ref_Cursor IN OUT SYS_REFCURSOR, 
    v_GRP_NO   IN  RTSD0031.GRP_NO%TYPE,
    v_GRP_NM   IN  RTSD0031.GRP_NM%TYPE
  );  

  /*****************************************************************************
  -- ��ü(����)���� (Cancel)
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancel (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,     /* ��ü��ȣ */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* �ֹ���ȣ */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* ��ü���� */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* Ÿ�̾�� */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* ����� ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* ��ü���� �������� */
    v_chk            IN CHAR,                         /* üũ�ڽ� */
    v_restCnt        IN CHAR,                         /* �ܿ����(������) */
    v_pkgDcYn        IN CHAR,                         /* ��Ű���ߺ����ο��� */
    v_dc_Gb          IN CHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ); 

  /*****************************************************************************
  -- �ܿ����Ǽ�
  *****************************************************************************/
  FUNCTION f_sRtsd0031Cnt(
    v_Grp_No         IN RTSD0031.GRP_NO%TYPE            /* ��ü��ȣ            */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- �ּҾ������Ǽ�
  *****************************************************************************/
  FUNCTION f_sRtsd0031MinAgrCnt(
    v_Grp_No         IN RTSD0031.GRP_NO%TYPE            /* ��ü��ȣ            */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- Ÿ�̾��
  *****************************************************************************/
  FUNCTION f_sRtsd0104TireCnt(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /* �ֹ���ȣ            */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- �հ����Ż�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0104SumMonAmt(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /* �ֹ���ȣ            */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- �ܿ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0031RestCnt(
    v_Grp_No         IN RTSD0031.GRP_NO%TYPE,            /* ��ü��ȣ            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* �ֹ���ȣ            */
    v_Reg_Id         IN RTSD0031.REG_ID%TYPE,            /* ����� ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü���� Update(����)
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0031GrpSt(
    v_Grp_No         IN RTSD0031.GRP_NO%TYPE,            /* ��ü��ȣ            */
    v_Reg_Id         IN RTSD0031.REG_ID%TYPE,            /* ����� ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü���� ����(U)
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0031GrpSt(
    v_GRP_NO		     IN OUT RTSD0031.GRP_NO%TYPE,		  
    v_REG_ID		     IN RTSD0031.REG_ID%TYPE,		  
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );  

  /*****************************************************************************
  -- ����Ż��, ��ü��ȣ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104MonAmt(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* ��ü��ȣ            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* �ֹ���ȣ            */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* ����� ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- Package ����Ż��, ��ü��ȣ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104PkgMonAmt(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* ��ü��ȣ            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* �ֹ���ȣ            */
    v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,          /* �ܿ����            */
    v_grpSt          IN CHAR,                            /* ��ü���� ��������    */  
    v_pkgDcYn        IN CHAR,                            /* ��Ű���ߺ����ο���   */
    v_chk            IN CHAR,                            /* üũ�ڽ� */  
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* ����� ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- ����������, ��뿩�� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0040StdEndDay(
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE,            /* �ֹ���ȣ            */
    v_Reg_Id         IN RTSD0040.REG_ID%TYPE,            /* ����� ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- ��ü������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0032GrpCnclDt(
    v_Grp_No         IN RTSD0032.GRP_NO%TYPE,            /* ��ü��ȣ            */
    v_Ord_No         IN RTSD0032.ORD_NO%TYPE,            /* �ֹ���ȣ            */
    v_Reg_Id         IN RTSD0032.REG_ID%TYPE,            /* ����� ID           */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ��ü���� Seqä��
  *****************************************************************************/
  FUNCTION f_sRTSD0031NextSeq2(
    v_GRP_NO             IN OUT RTSD0031.GRP_NO%TYPE
    ) RETURN VARCHAR2;  

  /*****************************************************************************
  -- ��Ű�� ��ȸ Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0031Package (
    Ref_Cursor     IN OUT SYS_REFCURSOR, 
    v_GRP_NO     RTSD0031.GRP_NO%TYPE
  );

  /*****************************************************************************
  -- Package ����Ż��, ��ü��ȣ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104PkgMonAmt2(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,            /* ��ü��ȣ          */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /* �ֹ���ȣ          */
    v_REST_CNT       IN RTSD0031.REST_CNT%TYPE,          /* �ܿ����          */  
    v_grpSt          IN CHAR,                            /* ��ü���� �������� */
    v_pkgDcYn        IN CHAR,                            /* ��Ű���ߺ����ο���*/
    v_chk            IN CHAR,                            /* üũ�ڽ�          */    
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,            /* ����� ID         */  
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- ��Ű�� (����)���� (Cancel)
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancel2 (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,          /* ��ü��ȣ */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* �ֹ���ȣ */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* ��ü���� */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* Ÿ�̾�� */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* ����� ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* ��ü���� �������� */
    v_chk            IN CHAR,                         /* üũ�ڽ� */
    v_restCnt        IN CHAR,                         /* �ܿ����(������) */
    v_pkgDcYn        IN CHAR,                         /* ��Ű���ߺ����ο��� */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- ��ü(����)���� (Cancel) �ܿ���ົ�� ����
  *****************************************************************************/
  PROCEDURE p_sRTSD0031cancelGroup (
    v_Comm_Dvsn      IN CHAR,                         /* ó������(I,U,D) */
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,          /* ��ü��ȣ */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /* �ֹ���ȣ */
    v_GRP_TYPE       IN RTSD0031.GRP_TYPE%TYPE,       /* ��ü���� */
    v_CNT_CD         IN RTSD0104.CNT_CD%TYPE,         /* Ÿ�̾�� */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /* ����� ID */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE,
    v_grpSt          IN CHAR,                         /* ��ü���� �������� */
    v_chk            IN CHAR,                         /* üũ�ڽ� */
    v_restCnt        IN CHAR,                         /* �ܿ����(������) */
    v_pkgDcYn        IN CHAR,                         /* ��Ű���ߺ����ο��� */
    v_dc_Gb          IN CHAR,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
    
  /*****************************************************************************
  -- ��ü(����)���� �߰��� �ܿ���ົ�� �̻����� �� ���Խ�
  *****************************************************************************/
  PROCEDURE p_sRTSD0031AddGroup (
    v_Grp_No         IN OUT RTSD0031.GRP_NO%TYPE,                /* ��ü��ȣ  */    
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,                    /* ����� ID */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
    
END PKG_RTSD0031;
/
