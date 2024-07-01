CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0010 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0010
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
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0010
    WHERE   BLD_MNG_NO = v_Bld_Mng_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0010Count;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.BLD_MNG_NO,                /*�ǹ�������ȣ(PK)    */
            A.AREA_NUM,                  /*������ȣ            */
            A.DO_NM,                     /*�õ�                */
            A.DO_NM_E,                   /*�õ�����            */
            A.CT_NM,                     /*�ñ���              */
            A.CT_NM_E,                   /*�ñ�������          */
            A.EM_NM,                     /*����                */
            A.EM_NM_E,                   /*���鿵��            */
            A.RD_CD,                     /*���θ��ڵ�          */
            A.RD_NM,                     /*���θ�              */
            A.RD_NM_E,                   /*���θ���          */
            A.UNDR_GRND,                 /*���Ͽ���(0:����,1:��*/
            A.BLD_MB,                    /*�ǹ���ȣ����        */
            A.BLD_SB,                    /*�ǹ���ȣ�ι�        */
            A.MD_NM,                     /*�ٷ����ó��        */
            A.BLD_NM1,                   /*�ñ�����ǹ���      */
            A.B_DNG_CD,                  /*�������ڵ�          */
            A.B_DNG_NM,                  /*��������            */
            A.B_RI_NM,                   /*����                */
            A.H_DNG_NM,                  /*��������            */
            A.S_CD,                      /*�꿩��(0:����,1:��) */
            A.LOT_MB,                    /*��������            */
            A.DNG_SEQ,                   /*���鵿�Ϸù�ȣ      */
            A.LOT_SB,                    /*�����ι�            */
            A.ZIP_NUM,                   /*�����ȣ            */
            A.SEQ,                       /*�����ȣ�Ϸù�ȣ    */
            A.SIDO_CD,                   /*��,�� �ڵ�          */
            A.SIGUN_CD,                  /*��,��,�� �ڵ�       */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0010 A
    WHERE   A.BLD_MNG_NO = DECODE(v_Bld_Mng_No , NULL, A.BLD_MNG_NO  , v_Bld_Mng_No)
    AND     A.AREA_NUM   = DECODE(v_Area_Num   , NULL, A.AREA_NUM    , v_Area_Num)
    AND     A.DO_NM      = DECODE(v_Do_Nm      , NULL, A.DO_NM       , v_Do_Nm)
    AND     A.DO_NM_E    = DECODE(v_Do_Nm_E    , NULL, A.DO_NM_E     , v_Do_Nm_E)
    AND     A.CT_NM      = DECODE(v_Ct_Nm      , NULL, A.CT_NM       , v_Ct_Nm)
    AND     A.CT_NM_E    = DECODE(v_Ct_Nm_E    , NULL, A.CT_NM_E     , v_Ct_Nm_E)
    AND     A.EM_NM      = DECODE(v_Em_Nm      , NULL, A.EM_NM       , v_Em_Nm)
    AND     A.EM_NM_E    = DECODE(v_Em_Nm_E    , NULL, A.EM_NM_E     , v_Em_Nm_E)
    AND     A.RD_CD      = DECODE(v_Rd_Cd      , NULL, A.RD_CD       , v_Rd_Cd)
    AND     A.RD_NM      = DECODE(v_Rd_Nm      , NULL, A.RD_NM       , v_Rd_Nm)
    AND     A.RD_NM_E    = DECODE(v_Rd_Nm_E    , NULL, A.RD_NM_E     , v_Rd_Nm_E)
    AND     A.UNDR_GRND  = DECODE(v_Undr_Grnd  , NULL, A.UNDR_GRND   , v_Undr_Grnd)
    AND     A.BLD_MB     = DECODE(v_Bld_Mb     , NULL, A.BLD_MB      , v_Bld_Mb)
    AND     A.BLD_SB     = DECODE(v_Bld_Sb     , NULL, A.BLD_SB      , v_Bld_Sb)
    AND     A.MD_NM      = DECODE(v_Md_Nm      , NULL, A.MD_NM       , v_Md_Nm)
    AND     A.BLD_NM1    = DECODE(v_Bld_Nm1    , NULL, A.BLD_NM1     , v_Bld_Nm1)
    AND     A.B_DNG_CD   = DECODE(v_B_Dng_Cd   , NULL, A.B_DNG_CD    , v_B_Dng_Cd)
    AND     A.B_DNG_NM   = DECODE(v_B_Dng_Nm   , NULL, A.B_DNG_NM    , v_B_Dng_Nm)
    AND     A.B_RI_NM    = DECODE(v_B_Ri_Nm    , NULL, A.B_RI_NM     , v_B_Ri_Nm)
    AND     A.H_DNG_NM   = DECODE(v_H_Dng_Nm   , NULL, A.H_DNG_NM    , v_H_Dng_Nm)
    AND     A.S_CD       = DECODE(v_S_Cd       , NULL, A.S_CD        , v_S_Cd)
    AND     A.LOT_MB     = DECODE(v_Lot_Mb     , NULL, A.LOT_MB      , v_Lot_Mb)
    AND     A.DNG_SEQ    = DECODE(v_Dng_Seq    , NULL, A.DNG_SEQ     , v_Dng_Seq)
    AND     A.LOT_SB     = DECODE(v_Lot_Sb     , NULL, A.LOT_SB      , v_Lot_Sb)
    AND     A.ZIP_NUM    = DECODE(v_Zip_Num    , NULL, A.ZIP_NUM     , v_Zip_Num)
    AND     A.SEQ        = DECODE(v_Seq        , NULL, A.SEQ         , v_Seq)
    AND     A.SIDO_CD    = DECODE(v_Sido_Cd    , NULL, A.SIDO_CD     , v_Sido_Cd)
    AND     A.SIGUN_CD   = DECODE(v_Sigun_Cd   , NULL, A.SIGUN_CD    , v_Sigun_Cd)
    AND     A.USE_YN     = DECODE(v_Use_Yn     , NULL, A.USE_YN      , v_Use_Yn)
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID      , v_Reg_Id);

  END p_sRtsd0010;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0010 (
            BLD_MNG_NO,
            AREA_NUM,
            DO_NM,
            DO_NM_E,
            CT_NM,
            CT_NM_E,
            EM_NM,
            EM_NM_E,
            RD_CD,
            RD_NM,
            RD_NM_E,
            UNDR_GRND,
            BLD_MB,
            BLD_SB,
            MD_NM,
            BLD_NM1,
            B_DNG_CD,
            B_DNG_NM,
            B_RI_NM,
            H_DNG_NM,
            S_CD,
            LOT_MB,
            DNG_SEQ,
            LOT_SB,
            ZIP_NUM,
            SEQ,
            SIDO_CD,
            SIGUN_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Bld_Mng_No,
            v_Area_Num,
            v_Do_Nm,
            v_Do_Nm_E,
            v_Ct_Nm,
            v_Ct_Nm_E,
            v_Em_Nm,
            v_Em_Nm_E,
            v_Rd_Cd,
            v_Rd_Nm,
            v_Rd_Nm_E,
            v_Undr_Grnd,
            v_Bld_Mb,
            v_Bld_Sb,
            v_Md_Nm,
            v_Bld_Nm1,
            v_B_Dng_Cd,
            v_B_Dng_Nm,
            v_B_Ri_Nm,
            v_H_Dng_Nm,
            v_S_Cd,
            v_Lot_Mb,
            v_Dng_Seq,
            v_Lot_Sb,
            v_Zip_Num,
            v_Seq,
            v_Sido_Cd,
            v_Sigun_Cd,
            v_Use_Yn,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0010;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0010
    SET    AREA_NUM   = v_Area_Num,
           DO_NM      = v_Do_Nm,
           DO_NM_E    = v_Do_Nm_E,
           CT_NM      = v_Ct_Nm,
           CT_NM_E    = v_Ct_Nm_E,
           EM_NM      = v_Em_Nm,
           EM_NM_E    = v_Em_Nm_E,
           RD_CD      = v_Rd_Cd,
           RD_NM      = v_Rd_Nm,
           RD_NM_E    = v_Rd_Nm_E,
           UNDR_GRND  = v_Undr_Grnd,
           BLD_MB     = v_Bld_Mb,
           BLD_SB     = v_Bld_Sb,
           MD_NM      = v_Md_Nm,
           BLD_NM1    = v_Bld_Nm1,
           B_DNG_CD   = v_B_Dng_Cd,
           B_DNG_NM   = v_B_Dng_Nm,
           B_RI_NM    = v_B_Ri_Nm,
           H_DNG_NM   = v_H_Dng_Nm,
           S_CD       = v_S_Cd,
           LOT_MB     = v_Lot_Mb,
           DNG_SEQ    = v_Dng_Seq,
           LOT_SB     = v_Lot_Sb,
           ZIP_NUM    = v_Zip_Num,
           SEQ        = v_Seq,
           SIDO_CD    = v_Sido_Cd,
           SIGUN_CD   = v_Sigun_Cd,
           USE_YN     = v_Use_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  BLD_MNG_NO = v_Bld_Mng_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0010;

  /*****************************************************************************
  -- �����ȣ ������ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0010 (
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*�ǹ�������ȣ(PK)      */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0010
    SET    USE_YN     = 'N',
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  BLD_MNG_NO = v_Bld_Mng_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0010;

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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:�ǹ�������ȣ,��뿩��,  ����� ID
    IF TRIM(v_Bld_Mng_No) IS NULL THEN
        v_Return_Message := '�ǹ�������ȣ('||v_Bld_Mng_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL) OR (v_Use_Yn IN ('Y','N')) THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0010Count(v_Bld_Mng_No) THEN

        IF 0 != f_InsertRtsd0010(v_Bld_Mng_No , v_Area_Num , v_Do_Nm , v_Do_Nm_E ,
                                 v_Ct_Nm , v_Ct_Nm_E , v_Em_Nm , v_Em_Nm_E ,
                                 v_Rd_Cd , v_Rd_Nm , v_Rd_Nm_E , v_Undr_Grnd ,
                                 v_Bld_Mb , v_Bld_Sb , v_Md_Nm , v_Bld_Nm1 ,
                                 v_B_Dng_Cd , v_B_Dng_Nm , v_B_Ri_Nm , v_H_Dng_Nm ,
                                 v_S_Cd , v_Lot_Mb , v_Dng_Seq , v_Lot_Sb ,
                                 v_Zip_Num , v_Seq , v_Sido_Cd , v_Sigun_Cd ,
                                 v_Use_Yn , v_Reg_Id , v_ErrorText) THEN
            v_Return_Message := '�����ȣ ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn IN ('I', 'U') THEN
        
            IF 0 != f_UpdateRtsd0010(v_Bld_Mng_No , v_Area_Num , v_Do_Nm , v_Do_Nm_E ,
                                     v_Ct_Nm , v_Ct_Nm_E , v_Em_Nm , v_Em_Nm_E ,
                                     v_Rd_Cd , v_Rd_Nm , v_Rd_Nm_E , v_Undr_Grnd ,
                                     v_Bld_Mb , v_Bld_Sb , v_Md_Nm , v_Bld_Nm1 ,
                                     v_B_Dng_Cd , v_B_Dng_Nm , v_B_Ri_Nm , v_H_Dng_Nm ,
                                     v_S_Cd , v_Lot_Mb , v_Dng_Seq , v_Lot_Sb ,
                                     v_Zip_Num , v_Seq , v_Sido_Cd , v_Sigun_Cd ,
                                     v_Use_Yn , v_Reg_Id , v_ErrorText) THEN
                v_Return_Message := '�����ȣ ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0010(v_Bld_Mng_No , v_Reg_Id , v_ErrorText) THEN
                v_Return_Message := '�����ȣ ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0010.p_IUDRtsd0010(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0010.p_IUDRtsd0010(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0010;

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
    ) IS
  BEGIN

    p_sRtsd0010PopupPage(Ref_Cursor, v_Db_Cd, v_Do_Nm, v_Ct_Nm, v_Rd_Dng_Nm, v_Mb_Nm, 1, 100000);                   

  END p_sRtsd0010Popup;
    
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
     SELECT  A.ROW_NUM,
            A.EM_NM||A.B_DNG_NM||DECODE('D',v_Db_Cd, A.RD_NM, A.B_RI_NM) Rd_Dng_Nm,
            DECODE('D', v_Db_Cd, A.BLD_MB||'-'||A.BLD_SB, A.LOT_MB||'-'||A.LOT_SB) Mb_Nm,
            /*���θ� �ּ� */
            A.DO_NM||' '||A.CT_NM||DECODE(A.EM_NM,NULL,'',' '||A.EM_NM)||' '||A.RD_NM AS RN_ADDR1_D,
            TRIM(
                DECODE(A.BLD_SB, NULL,A.BLD_MB  || ' '
                                , 0,   A.BLD_MB  || ' '
                                ,      A.BLD_MB  || '-') ||
                        DECODE(A.BLD_SB, NULL,NULL,0,NULL,A.BLD_SB  || ' ')   ||
                        DECODE(A.BLD_NM1,NULL,NULL,'('||A.BLD_NM1||')')
            ) AS RN_ADDR2_D,
            /*������ �ּ� START */
            A.DO_NM||' '||A.CT_NM||DECODE(A.EM_NM,NULL,'',' '||A.EM_NM)||' '||DECODE(A.B_RI_NM, NULL, A.B_DNG_NM, A.B_RI_NM) AS RN_ADDR1_B,
                TRIM(
                    DECODE(A.LOT_SB, NULL,A.LOT_MB  || ' '
                                  , 0,   A.LOT_MB  || ' '
                                    ,      A.LOT_MB  || '-') ||
                   DECODE(A.LOT_SB, NULL,NULL,0,NULL,A.LOT_SB  || ' ')   ||
                   DECODE(A.BLD_NM1,NULL,NULL,'('||A.BLD_NM1||')')
                   ) AS RN_ADDR2_B,
            A.BLD_MNG_NO,   /*�ǹ�������ȣ(PK)       */
            A.AREA_NUM,     /*������ȣ               */
            A.DO_NM,        /*�õ�                   */
            A.DO_NM_E,      /*�õ�����               */
            A.CT_NM,        /*�ñ���                 */
            A.CT_NM_E,      /*�ñ�������             */
            A.EM_NM,        /*����                   */
            A.EM_NM_E,      /*���鿵��               */
            A.RD_CD,        /*���θ��ڵ�             */
            A.RD_NM,        /*���θ�                 */
            A.RD_NM_E,      /*���θ���             */
            A.UNDR_GRND,    /*���Ͽ���(0:����,1:����)*/
            A.BLD_MB,       /*�ǹ���ȣ����           */
            A.BLD_SB,       /*�ǹ���ȣ�ι�           */
            A.MD_NM,        /*�ٷ����ó��           */
            A.BLD_NM1,      /*�ñ�����ǹ���         */
            A.B_DNG_CD,     /*�������ڵ�             */
            A.B_DNG_NM,     /*��������               */
            A.B_RI_NM,      /*����                   */
            A.H_DNG_NM,     /*��������               */
            A.S_CD,         /*�꿩��(0:����,1:��)    */
            A.LOT_MB,       /*��������               */
            A.DNG_SEQ,      /*���鵿�Ϸù�ȣ         */
            A.LOT_SB,       /*�����ι�               */
            A.ZIP_NUM,      /*�����ȣ               */
            A.SEQ,          /*�����ȣ�Ϸù�ȣ       */
            A.SIDO_CD,      /*��,�� �ڵ�             */
            A.SIGUN_CD,     /*��,��,�� �ڵ�          */
            A.TOTAL_CNT     /*��ü �Ǽ�              */
    FROM    (    
            SELECT  A.*,
                    ROW_NUMBER() OVER(ORDER BY DECODE(v_Db_Cd, 'D', TO_NUMBER(BLD_MB), TO_NUMBER(LOT_MB)), DECODE(v_Db_Cd,'D', TO_NUMBER(BLD_SB), TO_NUMBER(LOT_SB))) ROW_NUM,
                    COUNT(BLD_MNG_NO) OVER() TOTAL_CNT                    
            FROM    (
                    -- ���θ� �ּ�
                    SELECT  *
                    FROM    RTSD0010 A
                    WHERE   v_Db_Cd = 'D'
                    AND     A.DO_NM  = v_Do_Nm /*�õ�    */
                    AND     A.CT_NM  LIKE v_Ct_Nm||'%' /*�ñ���  */
                    AND     (A.RD_NM LIKE v_Rd_Dng_Nm||'%' OR A.EM_NM LIKE v_Rd_Dng_Nm||'%' OR A.B_DNG_NM LIKE v_Rd_Dng_Nm||'%' OR A.BLD_NM1 LIKE '%'||v_Rd_Dng_Nm||'%'
                    OR REGEXP_REPLACE(A.H_DNG_NM,'��[1-9]��', SUBSTR(A.H_DNG_NM,-2))  LIKE v_Rd_Dng_Nm||'%'  /*������ ��ȸ�����ϵ��� ���� 21060112 �ѽ��� */
                    OR REGEXP_REPLACE(A.B_DNG_NM,'[1-9]��', SUBSTR(A.B_DNG_NM,-1))  LIKE v_Rd_Dng_Nm||'%'  
                    OR A.B_DNG_NM LIKE  REGEXP_REPLACE(v_Rd_Dng_Nm,'[1-9]','')||'%'    
                    OR A.H_DNG_NM LIKE v_Rd_Dng_Nm||'%' 
                    OR ( A.BLD_NM1 LIKE NVL(SUBSTR(v_Rd_Dng_Nm,INSTR(v_Rd_Dng_Nm,'��',1)+1),v_Rd_Dng_Nm)||'%'  AND A.H_DNG_NM LIKE NVL(SUBSTR(v_Rd_Dng_Nm, 0, INSTR(v_Rd_Dng_Nm,' ',1)-1),v_Rd_Dng_Nm)||'%')
                    OR ( A.BLD_NM1 LIKE NVL(SUBSTR(v_Rd_Dng_Nm,INSTR(v_Rd_Dng_Nm,' ',1)+1),v_Rd_Dng_Nm)||'%' AND A.H_DNG_NM LIKE NVL(SUBSTR(v_Rd_Dng_Nm, 0, INSTR(v_Rd_Dng_Nm,' ',1)-1),v_Rd_Dng_Nm)||'%')
                    )
                    AND     A.BLD_MB||'-'||A.BLD_SB LIKE REPLACE( v_Mb_Nm, ' ', '' )||'%'
                    UNION   ALL
                    -- ���� �ּ�
                    SELECT  *
                    FROM    RTSD0010 A
                    WHERE   v_Db_Cd = 'B'
                    AND     A.DO_NM  = v_Do_Nm /*�õ�    */
                    AND     A.CT_NM  LIKE v_Ct_Nm||'%' /*�ñ���  */
                    AND     (A.B_RI_NM  LIKE v_Rd_Dng_Nm||'%' OR A.EM_NM LIKE v_Rd_Dng_Nm||'%' OR A.B_DNG_NM LIKE v_Rd_Dng_Nm||'%' OR A.BLD_NM1 LIKE '%'||v_Rd_Dng_Nm||'%'
                    OR REGEXP_REPLACE(A.H_DNG_NM,'��[1-9]��', SUBSTR(A.H_DNG_NM,-2))  LIKE v_Rd_Dng_Nm||'%'   /*������ ��ȸ�����ϵ��� ���� 21060112 �ѽ��� */ 
                    OR REGEXP_REPLACE(A.B_DNG_NM,'[1-9]��', SUBSTR(A.B_DNG_NM,-1))  LIKE v_Rd_Dng_Nm||'%'  
                    OR A.B_DNG_NM LIKE  REGEXP_REPLACE(v_Rd_Dng_Nm,'[1-9]','')||'%'
                    OR A.H_DNG_NM LIKE v_Rd_Dng_Nm||'%' 
                    OR ( A.BLD_NM1 LIKE NVL(SUBSTR(v_Rd_Dng_Nm,INSTR(v_Rd_Dng_Nm,'��',1)+1),v_Rd_Dng_Nm)||'%'  AND A.H_DNG_NM LIKE NVL(SUBSTR(v_Rd_Dng_Nm, 0, INSTR(v_Rd_Dng_Nm,' ',1)-1),v_Rd_Dng_Nm)||'%')
                    OR ( A.BLD_NM1 LIKE NVL(SUBSTR(v_Rd_Dng_Nm,INSTR(v_Rd_Dng_Nm,' ',1)+1),v_Rd_Dng_Nm)||'%' AND A.H_DNG_NM LIKE NVL(SUBSTR(v_Rd_Dng_Nm, 0, INSTR(v_Rd_Dng_Nm,' ',1)-1),v_Rd_Dng_Nm)||'%')
                    )
                    AND     A.LOT_MB||'-'||A.LOT_SB LIKE REPLACE( v_Mb_Nm, ' ', '' )||'%'
                    ) A
            ) A 
    WHERE   ROW_NUM BETWEEN (((v_Page_No - 1) * v_Get_Cnt)+1)  AND (v_Page_No * v_Get_Cnt)      
    ORDER BY ROW_NUM;
    


  END p_sRtsd0010PopupPage;

  /*****************************************************************************
  -- �����ȣ �õ� ��ȸ
  *****************************************************************************/
  PROCEDURE f_sRtsd0010DoCombo(
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS
  BEGIN
  
      OPEN Ref_Cursor FOR
      SELECT  CD,
              CD_NM
      FROM    RTVIEW01;
      
  END f_sRtsd0010DoCombo;

  /*****************************************************************************
  -- �����ȣ ���� ��ȸ
  *****************************************************************************/
  PROCEDURE f_sRtsd0010CtCombo(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE     /*�õ�                        */
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR        
    SELECT  A.CT_NM AS CD,
            A.CT_NM AS CD_NM
    FROM    RTSD0010 A
    WHERE   DO_NM = v_Do_Nm
    GROUP   BY A.CT_NM
    ORDER   BY CD_NM ASC;

--    
  END f_sRtsd0010CtCombo;
  
  /*****************************************************************************
  -- ������ Ű����Ÿ  ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0010carmaster(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,    /*�õ�                        */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,    /*�ñ���                      */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,    /*����                        */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE     /*���θ�                      */
    ) IS
  
  BEGIN
      
    OPEN Ref_Cursor FOR
    SELECT  A.DO_NM,
            A.CT_NM,
            A.EM_NM,
            A.RD_NM,
            COUNT(A.DO_NM) AS CNT,
            MAX(B.CARMASTER_NM) AS CARMASTER_NM
    FROM    RTSD0010 A,
            RTCS0002 B
    WHERE   A.DO_NM LIKE v_Do_Nm || '%'
    AND     NVL(TRIM(A.CT_NM),' ') LIKE  DECODE(v_Ct_Nm,'',NVL(TRIM(A.CT_NM),' '),v_Ct_Nm) || '%'
    AND     NVL(TRIM(A.EM_NM),' ') LIKE  DECODE(v_Em_Nm,'',NVL(TRIM(A.EM_NM),' '),v_Em_Nm) || '%'
    AND     NVL(TRIM(A.RD_NM),' ') LIKE  DECODE(v_Rd_Nm,'',NVL(TRIM(A.RD_NM),' '),v_Rd_Nm) || '%'
    AND     A.CARMASTER_NU = B.CARMASTER_NU(+)
    GROUP   BY A.DO_NM, A.CT_NM, A.EM_NM, A.RD_NM
    ORDER   BY A.DO_NM, A.CT_NM, A.EM_NM, A.RD_NM;
                     
  END p_sRtsd0010carmaster;
  
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
    ) IS
  
  e_Error EXCEPTION;
  
  BEGIN  
        
    UPDATE RTSD0010
    SET    CARMASTER_NU    = v_Carmaster_nu,
           CHG_ID          = v_Reg_Id,
           CHG_DT          = SYSDATE
    WHERE  DO_NM           = v_Do_Nm
    AND    NVL(CT_NM,' ')  = DECODE(v_Ct_Nm,'',NVL(CT_NM,' '),v_Ct_Nm)
    AND    NVL(EM_NM,' ')  = DECODE(v_Em_Nm,'',NVL(EM_NM,' '),v_Em_Nm)
    AND    NVL(RD_NM,' ')  = DECODE(v_Rd_Nm,'',NVL(RD_NM,' '),v_Rd_Nm);
                     
    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
  
  EXCEPTION
    WHEN e_Error THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0010.p_UpdateRtsd0010CarMaster(1)', v_ErrorText, v_Return_Message);
  
    WHEN OTHERS THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200);
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0010.p_UpdateRtsd0010CarMaster(2)', v_ErrorText, v_Return_Message);
    
  END p_UpdateRtsd0010CarMaster;
     
END Pkg_Rtsd0010;
/
