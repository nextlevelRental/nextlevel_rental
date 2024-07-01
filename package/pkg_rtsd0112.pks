CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0112 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0112
   PURPOSE   ���� �� ������ �ݾ��̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� �� ������ �ݾ��̷� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0112Count(
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,           /*����ȣ            */
    v_Seq            IN RTSD0112.SEQ%TYPE               /*����                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� ������ �ݾ��̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*����                  */
    v_Job_Day        IN RTSD0112.JOB_DAY%TYPE,        /*���� ����_������      */
    v_Grp_Yn         IN RTSD0112.GRP_YN%TYPE,         /*�����տ���          */
    v_Grp_No         IN RTSD0112.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Rent_Amt       IN RTSD0112.RENT_AMT%TYPE,       /*��Ż��(����ǥ)        */
    v_C_Dcamt        IN RTSD0112.C_DCAMT%TYPE,        /*ķ�������αݾ�        */
    v_G_Dcrate       IN RTSD0112.G_DCRATE%TYPE,       /*����������            */
    v_G_Dcamt        IN RTSD0112.G_DCAMT%TYPE,        /*�������ξ�            */
    v_L_Dcrate       IN RTSD0112.L_DCRATE%TYPE,       /*����������            */
    v_L_Dcamt        IN RTSD0112.L_DCAMT%TYPE,        /*�������ξ�            */
    v_F_Dcamt        IN RTSD0112.F_DCAMT%TYPE,        /*�������ξ�            */
    v_Mon_Amt        IN RTSD0112.MON_AMT%TYPE,        /*����Ż��              */
    v_Grp_Yn2        IN RTSD0112.GRP_YN2%TYPE,        /*����_�����տ���     */
    v_Grp_No2        IN RTSD0112.GRP_NO2%TYPE,        /*�����չ�ȣ          */
    v_Rent_Amt2      IN RTSD0112.RENT_AMT2%TYPE,      /*��Ż��(����ǥ)        */
    v_C_Dcamt2       IN RTSD0112.C_DCAMT2%TYPE,       /*ķ�������ξ�          */
    v_G_Dcrate2      IN RTSD0112.G_DCRATE2%TYPE,      /*����������            */
    v_G_Dcamt2       IN RTSD0112.G_DCAMT2%TYPE,       /*�������ξ�            */
    v_L_Dcrate2      IN RTSD0112.L_DCRATE2%TYPE,      /*����������            */
    v_L_Dcamt2       IN RTSD0112.L_DCAMT2%TYPE,       /*�������ξ�            */
    v_F_Dcamt2       IN RTSD0112.F_DCAMT2%TYPE,       /*�������ξ�            */
    v_Mon_Amt2       IN RTSD0112.MON_AMT2%TYPE,       /*����Ż��              */
    v_Sale_Namt      IN RTSD0112.SALE_NAMT%TYPE,      /*����Ż��_����         */
    v_Sale_Vamt      IN RTSD0112.SALE_VAMT%TYPE,      /*����Ż��_�ΰ���       */
    v_Recp_Nu        IN RTSD0112.RECP_NU%TYPE,        /*û������              */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� �� ������ �ݾ��̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0112 (
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*����                  */
    v_Job_Day        IN RTSD0112.JOB_DAY%TYPE,        /*���� ����_������      */
    v_Grp_Yn         IN RTSD0112.GRP_YN%TYPE,         /*�����տ���          */
    v_Grp_No         IN RTSD0112.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Rent_Amt       IN RTSD0112.RENT_AMT%TYPE,       /*��Ż��(����ǥ)        */
    v_C_Dcamt        IN RTSD0112.C_DCAMT%TYPE,        /*ķ�������αݾ�        */
    v_G_Dcrate       IN RTSD0112.G_DCRATE%TYPE,       /*����������            */
    v_G_Dcamt        IN RTSD0112.G_DCAMT%TYPE,        /*�������ξ�            */
    v_L_Dcrate       IN RTSD0112.L_DCRATE%TYPE,       /*����������            */
    v_L_Dcamt        IN RTSD0112.L_DCAMT%TYPE,        /*�������ξ�            */
    v_F_Dcamt        IN RTSD0112.F_DCAMT%TYPE,        /*�������ξ�            */
    v_Mon_Amt        IN RTSD0112.MON_AMT%TYPE,        /*����Ż��              */
    v_Grp_Yn2        IN RTSD0112.GRP_YN2%TYPE,        /*����_�����տ���     */
    v_Grp_No2        IN RTSD0112.GRP_NO2%TYPE,        /*�����չ�ȣ          */
    v_Rent_Amt2      IN RTSD0112.RENT_AMT2%TYPE,      /*��Ż��(����ǥ)        */
    v_C_Dcamt2       IN RTSD0112.C_DCAMT2%TYPE,       /*ķ�������ξ�          */
    v_G_Dcrate2      IN RTSD0112.G_DCRATE2%TYPE,      /*����������            */
    v_G_Dcamt2       IN RTSD0112.G_DCAMT2%TYPE,       /*�������ξ�            */
    v_L_Dcrate2      IN RTSD0112.L_DCRATE2%TYPE,      /*����������            */
    v_L_Dcamt2       IN RTSD0112.L_DCAMT2%TYPE,       /*�������ξ�            */
    v_F_Dcamt2       IN RTSD0112.F_DCAMT2%TYPE,       /*�������ξ�            */
    v_Mon_Amt2       IN RTSD0112.MON_AMT2%TYPE,       /*����Ż��              */
    v_Sale_Namt      IN RTSD0112.SALE_NAMT%TYPE,      /*����Ż��_����         */
    v_Sale_Vamt      IN RTSD0112.SALE_VAMT%TYPE,      /*����Ż��_�ΰ���       */
    v_Recp_Nu        IN RTSD0112.RECP_NU%TYPE,        /*û������              */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� ������ �ݾ��̷� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0112 (
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*����                  */
    v_Job_Day        IN RTSD0112.JOB_DAY%TYPE,        /*���� ����_������      */
    v_Grp_Yn         IN RTSD0112.GRP_YN%TYPE,         /*�����տ���          */
    v_Grp_No         IN RTSD0112.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Rent_Amt       IN RTSD0112.RENT_AMT%TYPE,       /*��Ż��(����ǥ)        */
    v_C_Dcamt        IN RTSD0112.C_DCAMT%TYPE,        /*ķ�������αݾ�        */
    v_G_Dcrate       IN RTSD0112.G_DCRATE%TYPE,       /*����������            */
    v_G_Dcamt        IN RTSD0112.G_DCAMT%TYPE,        /*�������ξ�            */
    v_L_Dcrate       IN RTSD0112.L_DCRATE%TYPE,       /*����������            */
    v_L_Dcamt        IN RTSD0112.L_DCAMT%TYPE,        /*�������ξ�            */
    v_F_Dcamt        IN RTSD0112.F_DCAMT%TYPE,        /*�������ξ�            */
    v_Mon_Amt        IN RTSD0112.MON_AMT%TYPE,        /*����Ż��              */
    v_Grp_Yn2        IN RTSD0112.GRP_YN2%TYPE,        /*����_�����տ���     */
    v_Grp_No2        IN RTSD0112.GRP_NO2%TYPE,        /*�����չ�ȣ          */
    v_Rent_Amt2      IN RTSD0112.RENT_AMT2%TYPE,      /*��Ż��(����ǥ)        */
    v_C_Dcamt2       IN RTSD0112.C_DCAMT2%TYPE,       /*ķ�������ξ�          */
    v_G_Dcrate2      IN RTSD0112.G_DCRATE2%TYPE,      /*����������            */
    v_G_Dcamt2       IN RTSD0112.G_DCAMT2%TYPE,       /*�������ξ�            */
    v_L_Dcrate2      IN RTSD0112.L_DCRATE2%TYPE,      /*����������            */
    v_L_Dcamt2       IN RTSD0112.L_DCAMT2%TYPE,       /*�������ξ�            */
    v_F_Dcamt2       IN RTSD0112.F_DCAMT2%TYPE,       /*�������ξ�            */
    v_Mon_Amt2       IN RTSD0112.MON_AMT2%TYPE,       /*����Ż��              */
    v_Sale_Namt      IN RTSD0112.SALE_NAMT%TYPE,      /*����Ż��_����         */
    v_Sale_Vamt      IN RTSD0112.SALE_VAMT%TYPE,      /*����Ż��_�ΰ���       */
    v_Recp_Nu        IN RTSD0112.RECP_NU%TYPE,        /*û������              */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� ������ �ݾ��̷� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0112 (
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �� ������ �ݾ��̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0112 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*����ȣ              */
    v_Seq            IN OUT RTSD0112.SEQ%TYPE,        /*����                  */
    v_Job_Day        IN RTSD0112.JOB_DAY%TYPE,        /*���� ����_������      */
    v_Grp_Yn         IN RTSD0112.GRP_YN%TYPE,         /*�����տ���          */
    v_Grp_No         IN RTSD0112.GRP_NO%TYPE,         /*�����չ�ȣ          */
    v_Rent_Amt       IN RTSD0112.RENT_AMT%TYPE,       /*��Ż��(����ǥ)        */
    v_C_Dcamt        IN RTSD0112.C_DCAMT%TYPE,        /*ķ�������αݾ�        */
    v_G_Dcrate       IN RTSD0112.G_DCRATE%TYPE,       /*����������            */
    v_G_Dcamt        IN RTSD0112.G_DCAMT%TYPE,        /*�������ξ�            */
    v_L_Dcrate       IN RTSD0112.L_DCRATE%TYPE,       /*����������            */
    v_L_Dcamt        IN RTSD0112.L_DCAMT%TYPE,        /*�������ξ�            */
    v_F_Dcamt        IN RTSD0112.F_DCAMT%TYPE,        /*�������ξ�            */
    v_Mon_Amt        IN RTSD0112.MON_AMT%TYPE,        /*����Ż��              */
    v_Grp_Yn2        IN RTSD0112.GRP_YN2%TYPE,        /*����_�����տ���     */
    v_Grp_No2        IN RTSD0112.GRP_NO2%TYPE,        /*�����չ�ȣ          */
    v_Rent_Amt2      IN RTSD0112.RENT_AMT2%TYPE,      /*��Ż��(����ǥ)        */
    v_C_Dcamt2       IN RTSD0112.C_DCAMT2%TYPE,       /*ķ�������ξ�          */
    v_G_Dcrate2      IN RTSD0112.G_DCRATE2%TYPE,      /*����������            */
    v_G_Dcamt2       IN RTSD0112.G_DCAMT2%TYPE,       /*�������ξ�            */
    v_L_Dcrate2      IN RTSD0112.L_DCRATE2%TYPE,      /*����������            */
    v_L_Dcamt2       IN RTSD0112.L_DCAMT2%TYPE,       /*�������ξ�            */
    v_F_Dcamt2       IN RTSD0112.F_DCAMT2%TYPE,       /*�������ξ�            */
    v_Mon_Amt2       IN RTSD0112.MON_AMT2%TYPE,       /*����Ż��              */
    v_Sale_Namt      IN RTSD0112.SALE_NAMT%TYPE,      /*����Ż��_����         */
    v_Sale_Vamt      IN RTSD0112.SALE_VAMT%TYPE,      /*����Ż��_�ΰ���       */
    v_Recp_Nu        IN RTSD0112.RECP_NU%TYPE,        /*û������              */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� �� ������ �ݾ��̷� - ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0112Seq(
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE            /*����ȣ            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0112;
/
