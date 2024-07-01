CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0010 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0010
   PURPOSE   �����ȣ ������ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-07  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ȣ ������ Count
  *****************************************************************************/
  FUNCTION f_sRtsd0010Count(
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE        /*�ǹ�������ȣ(PK)    */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ȣ ������ Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*�ǹ�������ȣ(PK)      */
    v_Area_Num       IN RTSD0010.AREA_NUM%TYPE,       /*������ȣ              */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,          /*�õ�                  */
    v_Do_Nm_E        IN RTSD0010.DO_NM_E%TYPE,        /*�õ�����              */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,          /*�ñ���                */
    v_Ct_Nm_E        IN RTSD0010.CT_NM_E%TYPE,        /*�ñ�������            */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,          /*����                  */
    v_Em_Nm_E        IN RTSD0010.EM_NM_E%TYPE,        /*���鿵��              */
    v_Rd_Cd          IN RTSD0010.RD_CD%TYPE,          /*���θ��ڵ�            */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE,          /*���θ�                */
    v_Rd_Nm_E        IN RTSD0010.RD_NM_E%TYPE,        /*���θ���            */
    v_Undr_Grnd      IN RTSD0010.UNDR_GRND%TYPE,      /*���Ͽ���(0:����,1:����*/
    v_Bld_Mb         IN RTSD0010.BLD_MB%TYPE,         /*�ǹ���ȣ����          */
    v_Bld_Sb         IN RTSD0010.BLD_SB%TYPE,         /*�ǹ���ȣ�ι�          */
    v_Md_Nm          IN RTSD0010.MD_NM%TYPE,          /*�ٷ����ó��          */
    v_Bld_Nm1        IN RTSD0010.BLD_NM1%TYPE,        /*�ñ�����ǹ���        */
    v_B_Dng_Cd       IN RTSD0010.B_DNG_CD%TYPE,       /*�������ڵ�            */
    v_B_Dng_Nm       IN RTSD0010.B_DNG_NM%TYPE,       /*��������              */
    v_B_Ri_Nm        IN RTSD0010.B_RI_NM%TYPE,        /*����                  */
    v_H_Dng_Nm       IN RTSD0010.H_DNG_NM%TYPE,       /*��������              */
    v_S_Cd           IN RTSD0010.S_CD%TYPE,           /*�꿩��(0:����,1:��)   */
    v_Lot_Mb         IN RTSD0010.LOT_MB%TYPE,         /*��������              */
    v_Dng_Seq        IN RTSD0010.DNG_SEQ%TYPE,        /*���鵿�Ϸù�ȣ        */
    v_Lot_Sb         IN RTSD0010.LOT_SB%TYPE,         /*�����ι�              */
    v_Zip_Num        IN RTSD0010.ZIP_NUM%TYPE,        /*�����ȣ              */
    v_Seq            IN RTSD0010.SEQ%TYPE,            /*�����ȣ�Ϸù�ȣ      */
    v_Sido_Cd        IN RTSD0010.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0010.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Use_Yn         IN RTSD0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- �����ȣ ������ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0010 (
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*�ǹ�������ȣ(PK)      */
    v_Area_Num       IN RTSD0010.AREA_NUM%TYPE,       /*������ȣ              */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,          /*�õ�                  */
    v_Do_Nm_E        IN RTSD0010.DO_NM_E%TYPE,        /*�õ�����              */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,          /*�ñ���                */
    v_Ct_Nm_E        IN RTSD0010.CT_NM_E%TYPE,        /*�ñ�������            */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,          /*����                  */
    v_Em_Nm_E        IN RTSD0010.EM_NM_E%TYPE,        /*���鿵��              */
    v_Rd_Cd          IN RTSD0010.RD_CD%TYPE,          /*���θ��ڵ�            */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE,          /*���θ�                */
    v_Rd_Nm_E        IN RTSD0010.RD_NM_E%TYPE,        /*���θ���            */
    v_Undr_Grnd      IN RTSD0010.UNDR_GRND%TYPE,      /*���Ͽ���(0:����,1:����*/
    v_Bld_Mb         IN RTSD0010.BLD_MB%TYPE,         /*�ǹ���ȣ����          */
    v_Bld_Sb         IN RTSD0010.BLD_SB%TYPE,         /*�ǹ���ȣ�ι�          */
    v_Md_Nm          IN RTSD0010.MD_NM%TYPE,          /*�ٷ����ó��          */
    v_Bld_Nm1        IN RTSD0010.BLD_NM1%TYPE,        /*�ñ�����ǹ���        */
    v_B_Dng_Cd       IN RTSD0010.B_DNG_CD%TYPE,       /*�������ڵ�            */
    v_B_Dng_Nm       IN RTSD0010.B_DNG_NM%TYPE,       /*��������              */
    v_B_Ri_Nm        IN RTSD0010.B_RI_NM%TYPE,        /*����                  */
    v_H_Dng_Nm       IN RTSD0010.H_DNG_NM%TYPE,       /*��������              */
    v_S_Cd           IN RTSD0010.S_CD%TYPE,           /*�꿩��(0:����,1:��)   */
    v_Lot_Mb         IN RTSD0010.LOT_MB%TYPE,         /*��������              */
    v_Dng_Seq        IN RTSD0010.DNG_SEQ%TYPE,        /*���鵿�Ϸù�ȣ        */
    v_Lot_Sb         IN RTSD0010.LOT_SB%TYPE,         /*�����ι�              */
    v_Zip_Num        IN RTSD0010.ZIP_NUM%TYPE,        /*�����ȣ              */
    v_Seq            IN RTSD0010.SEQ%TYPE,            /*�����ȣ�Ϸù�ȣ      */
    v_Sido_Cd        IN RTSD0010.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0010.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Use_Yn         IN RTSD0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ȣ ������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0010 (
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*�ǹ�������ȣ(PK)      */
    v_Area_Num       IN RTSD0010.AREA_NUM%TYPE,       /*������ȣ              */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,          /*�õ�                  */
    v_Do_Nm_E        IN RTSD0010.DO_NM_E%TYPE,        /*�õ�����              */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,          /*�ñ���                */
    v_Ct_Nm_E        IN RTSD0010.CT_NM_E%TYPE,        /*�ñ�������            */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,          /*����                  */
    v_Em_Nm_E        IN RTSD0010.EM_NM_E%TYPE,        /*���鿵��              */
    v_Rd_Cd          IN RTSD0010.RD_CD%TYPE,          /*���θ��ڵ�            */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE,          /*���θ�                */
    v_Rd_Nm_E        IN RTSD0010.RD_NM_E%TYPE,        /*���θ���            */
    v_Undr_Grnd      IN RTSD0010.UNDR_GRND%TYPE,      /*���Ͽ���(0:����,1:����*/
    v_Bld_Mb         IN RTSD0010.BLD_MB%TYPE,         /*�ǹ���ȣ����          */
    v_Bld_Sb         IN RTSD0010.BLD_SB%TYPE,         /*�ǹ���ȣ�ι�          */
    v_Md_Nm          IN RTSD0010.MD_NM%TYPE,          /*�ٷ����ó��          */
    v_Bld_Nm1        IN RTSD0010.BLD_NM1%TYPE,        /*�ñ�����ǹ���        */
    v_B_Dng_Cd       IN RTSD0010.B_DNG_CD%TYPE,       /*�������ڵ�            */
    v_B_Dng_Nm       IN RTSD0010.B_DNG_NM%TYPE,       /*��������              */
    v_B_Ri_Nm        IN RTSD0010.B_RI_NM%TYPE,        /*����                  */
    v_H_Dng_Nm       IN RTSD0010.H_DNG_NM%TYPE,       /*��������              */
    v_S_Cd           IN RTSD0010.S_CD%TYPE,           /*�꿩��(0:����,1:��)   */
    v_Lot_Mb         IN RTSD0010.LOT_MB%TYPE,         /*��������              */
    v_Dng_Seq        IN RTSD0010.DNG_SEQ%TYPE,        /*���鵿�Ϸù�ȣ        */
    v_Lot_Sb         IN RTSD0010.LOT_SB%TYPE,         /*�����ι�              */
    v_Zip_Num        IN RTSD0010.ZIP_NUM%TYPE,        /*�����ȣ              */
    v_Seq            IN RTSD0010.SEQ%TYPE,            /*�����ȣ�Ϸù�ȣ      */
    v_Sido_Cd        IN RTSD0010.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0010.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Use_Yn         IN RTSD0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ȣ ������ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0010 (
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*�ǹ�������ȣ(PK)      */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ȣ ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0010 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*�ǹ�������ȣ(PK)      */
    v_Area_Num       IN RTSD0010.AREA_NUM%TYPE,       /*������ȣ              */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,          /*�õ�                  */
    v_Do_Nm_E        IN RTSD0010.DO_NM_E%TYPE,        /*�õ�����              */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,          /*�ñ���                */
    v_Ct_Nm_E        IN RTSD0010.CT_NM_E%TYPE,        /*�ñ�������            */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,          /*����                  */
    v_Em_Nm_E        IN RTSD0010.EM_NM_E%TYPE,        /*���鿵��              */
    v_Rd_Cd          IN RTSD0010.RD_CD%TYPE,          /*���θ��ڵ�            */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE,          /*���θ�                */
    v_Rd_Nm_E        IN RTSD0010.RD_NM_E%TYPE,        /*���θ���            */
    v_Undr_Grnd      IN RTSD0010.UNDR_GRND%TYPE,      /*���Ͽ���(0:����,1:����*/
    v_Bld_Mb         IN RTSD0010.BLD_MB%TYPE,         /*�ǹ���ȣ����          */
    v_Bld_Sb         IN RTSD0010.BLD_SB%TYPE,         /*�ǹ���ȣ�ι�          */
    v_Md_Nm          IN RTSD0010.MD_NM%TYPE,          /*�ٷ����ó��          */
    v_Bld_Nm1        IN RTSD0010.BLD_NM1%TYPE,        /*�ñ�����ǹ���        */
    v_B_Dng_Cd       IN RTSD0010.B_DNG_CD%TYPE,       /*�������ڵ�            */
    v_B_Dng_Nm       IN RTSD0010.B_DNG_NM%TYPE,       /*��������              */
    v_B_Ri_Nm        IN RTSD0010.B_RI_NM%TYPE,        /*����                  */
    v_H_Dng_Nm       IN RTSD0010.H_DNG_NM%TYPE,       /*��������              */
    v_S_Cd           IN RTSD0010.S_CD%TYPE,           /*�꿩��(0:����,1:��)   */
    v_Lot_Mb         IN RTSD0010.LOT_MB%TYPE,         /*��������              */
    v_Dng_Seq        IN RTSD0010.DNG_SEQ%TYPE,        /*���鵿�Ϸù�ȣ        */
    v_Lot_Sb         IN RTSD0010.LOT_SB%TYPE,         /*�����ι�              */
    v_Zip_Num        IN RTSD0010.ZIP_NUM%TYPE,        /*�����ȣ              */
    v_Seq            IN RTSD0010.SEQ%TYPE,            /*�����ȣ�Ϸù�ȣ      */
    v_Sido_Cd        IN RTSD0010.SIDO_CD%TYPE,        /*��,�� �ڵ�            */
    v_Sigun_Cd       IN RTSD0010.SIGUN_CD%TYPE,       /*��,��,�� �ڵ�         */
    v_Use_Yn         IN RTSD0010.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �����ȣ ������ - �����ȣ ��ȸ POPUP
  *****************************************************************************/
  PROCEDURE p_sRtsd0010Popup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Db_Cd          IN RTSD0010.USE_YN%TYPE,   /*����(D:���θ�,B:����)       */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,    /*�õ�                        */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,    /*�ñ���                      */
    v_Rd_Dng_Nm      IN VARCHAR,                /*����/��/���θ�_����         */
    v_Mb_Nm          IN VARCHAR                 /*�ǹ�����.�ι�/��������.�ι� */
    );
 
  /*****************************************************************************
  -- �����ȣ ������ - �����ȣ ��ȸ POPUP
  *****************************************************************************/
  PROCEDURE p_sRtsd0010PopupPage (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Db_Cd          IN RTSD0010.USE_YN%TYPE,   /*����(D:���θ�,B:����)       */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,    /*�õ�                        */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,    /*�ñ���                      */
    v_Rd_Dng_Nm      IN VARCHAR,                /*����/��/���θ�_����         */
    v_Mb_Nm          IN VARCHAR,                /*�ǹ�����.�ι�/��������.�ι� */
    v_Page_No        IN NUMBER,                 /*������                      */
    v_Get_Cnt        IN NUMBER                  /*ȹ��Ǽ�                    */
    );
    
  /*****************************************************************************
  -- �����ȣ �õ� ��ȸ
  *****************************************************************************/
  PROCEDURE f_sRtsd0010DoCombo (
    Ref_Cursor       IN OUT SYS_REFCURSOR
    );

  /*****************************************************************************
  -- �����ȣ ���� ��ȸ
  *****************************************************************************/
  PROCEDURE f_sRtsd0010CtCombo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_do_nm			 IN RTSD0010.DO_NM%TYPE
    );
  
  /*****************************************************************************
  -- ������ Ű����Ÿ  ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0010carmaster(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,    /*�õ�                        */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,    /*�ñ���                      */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,    /*����                        */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE     /*���θ�                      */
    );
    
  /*****************************************************************************
  -- ī�������ڵ尪  �ϰ������ϱ�.
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0010CarMaster(
    v_Do_Nm        IN RTSD0010.DO_NM%TYPE,       /*�õ�                       */
    v_Ct_Nm        IN RTSD0010.CT_NM%TYPE,       /*�ñ���                     */   
    v_Em_Nm        IN RTSD0010.EM_NM%TYPE,       /*����                       */
    v_Rd_Nm        IN RTSD0010.RD_NM%TYPE,       /*���θ�                     */
    v_Carmaster_nu IN RTSD0010.CARMASTER_NU%TYPE,/*ī������ �ڵ�              */ 
    v_Reg_Id       IN RTSD0010.REG_ID%TYPE,      /*����� ID                  */
    v_Success_Code    OUT NUMBER,
    v_Return_Message  OUT VARCHAR2,
    v_ErrorText       OUT VARCHAR2      
    );
    
END Pkg_Rtsd0010;
/
