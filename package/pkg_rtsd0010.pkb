CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0010 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0010
   PURPOSE   우편번호 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-07  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 우편번호 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0010Count(
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE        /*건물관리번호(PK)    */
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
  -- 우편번호 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0010 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*건물관리번호(PK)      */
    v_Area_Num       IN RTSD0010.AREA_NUM%TYPE,       /*구역번호              */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,          /*시도                  */
    v_Do_Nm_E        IN RTSD0010.DO_NM_E%TYPE,        /*시도영문              */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,          /*시군구                */
    v_Ct_Nm_E        IN RTSD0010.CT_NM_E%TYPE,        /*시군구영문            */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,          /*읍면                  */
    v_Em_Nm_E        IN RTSD0010.EM_NM_E%TYPE,        /*읍면영문              */
    v_Rd_Cd          IN RTSD0010.RD_CD%TYPE,          /*도로명코드            */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE,          /*도로명                */
    v_Rd_Nm_E        IN RTSD0010.RD_NM_E%TYPE,        /*도로명영문            */
    v_Undr_Grnd      IN RTSD0010.UNDR_GRND%TYPE,      /*지하여부(0:지상,1:지하*/
    v_Bld_Mb         IN RTSD0010.BLD_MB%TYPE,         /*건물번호본번          */
    v_Bld_Sb         IN RTSD0010.BLD_SB%TYPE,         /*건물번호부번          */
    v_Md_Nm          IN RTSD0010.MD_NM%TYPE,          /*다량배달처명          */
    v_Bld_Nm1        IN RTSD0010.BLD_NM1%TYPE,        /*시국구용건물명        */
    v_B_Dng_Cd       IN RTSD0010.B_DNG_CD%TYPE,       /*법정동코드            */
    v_B_Dng_Nm       IN RTSD0010.B_DNG_NM%TYPE,       /*법정동명              */
    v_B_Ri_Nm        IN RTSD0010.B_RI_NM%TYPE,        /*리명                  */
    v_H_Dng_Nm       IN RTSD0010.H_DNG_NM%TYPE,       /*행정동명              */
    v_S_Cd           IN RTSD0010.S_CD%TYPE,           /*산여부(0:토지,1:산)   */
    v_Lot_Mb         IN RTSD0010.LOT_MB%TYPE,         /*지번본번              */
    v_Dng_Seq        IN RTSD0010.DNG_SEQ%TYPE,        /*읍면동일련번호        */
    v_Lot_Sb         IN RTSD0010.LOT_SB%TYPE,         /*지번부번              */
    v_Zip_Num        IN RTSD0010.ZIP_NUM%TYPE,        /*우편번호              */
    v_Seq            IN RTSD0010.SEQ%TYPE,            /*우편번호일련번호      */
    v_Sido_Cd        IN RTSD0010.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0010.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.BLD_MNG_NO,                /*건물관리번호(PK)    */
            A.AREA_NUM,                  /*구역번호            */
            A.DO_NM,                     /*시도                */
            A.DO_NM_E,                   /*시도영문            */
            A.CT_NM,                     /*시군구              */
            A.CT_NM_E,                   /*시군구영문          */
            A.EM_NM,                     /*읍면                */
            A.EM_NM_E,                   /*읍면영문            */
            A.RD_CD,                     /*도로명코드          */
            A.RD_NM,                     /*도로명              */
            A.RD_NM_E,                   /*도로명영문          */
            A.UNDR_GRND,                 /*지하여부(0:지상,1:지*/
            A.BLD_MB,                    /*건물번호본번        */
            A.BLD_SB,                    /*건물번호부번        */
            A.MD_NM,                     /*다량배달처명        */
            A.BLD_NM1,                   /*시국구용건물명      */
            A.B_DNG_CD,                  /*법정동코드          */
            A.B_DNG_NM,                  /*법정동명            */
            A.B_RI_NM,                   /*리명                */
            A.H_DNG_NM,                  /*행정동명            */
            A.S_CD,                      /*산여부(0:토지,1:산) */
            A.LOT_MB,                    /*지번본번            */
            A.DNG_SEQ,                   /*읍면동일련번호      */
            A.LOT_SB,                    /*지번부번            */
            A.ZIP_NUM,                   /*우편번호            */
            A.SEQ,                       /*우편번호일련번호    */
            A.SIDO_CD,                   /*시,도 코드          */
            A.SIGUN_CD,                  /*시,군,구 코드       */
            A.USE_YN,                    /*사용여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
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
  -- 우편번호 마스터 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0010 (
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*건물관리번호(PK)      */
    v_Area_Num       IN RTSD0010.AREA_NUM%TYPE,       /*구역번호              */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,          /*시도                  */
    v_Do_Nm_E        IN RTSD0010.DO_NM_E%TYPE,        /*시도영문              */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,          /*시군구                */
    v_Ct_Nm_E        IN RTSD0010.CT_NM_E%TYPE,        /*시군구영문            */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,          /*읍면                  */
    v_Em_Nm_E        IN RTSD0010.EM_NM_E%TYPE,        /*읍면영문              */
    v_Rd_Cd          IN RTSD0010.RD_CD%TYPE,          /*도로명코드            */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE,          /*도로명                */
    v_Rd_Nm_E        IN RTSD0010.RD_NM_E%TYPE,        /*도로명영문            */
    v_Undr_Grnd      IN RTSD0010.UNDR_GRND%TYPE,      /*지하여부(0:지상,1:지하*/
    v_Bld_Mb         IN RTSD0010.BLD_MB%TYPE,         /*건물번호본번          */
    v_Bld_Sb         IN RTSD0010.BLD_SB%TYPE,         /*건물번호부번          */
    v_Md_Nm          IN RTSD0010.MD_NM%TYPE,          /*다량배달처명          */
    v_Bld_Nm1        IN RTSD0010.BLD_NM1%TYPE,        /*시국구용건물명        */
    v_B_Dng_Cd       IN RTSD0010.B_DNG_CD%TYPE,       /*법정동코드            */
    v_B_Dng_Nm       IN RTSD0010.B_DNG_NM%TYPE,       /*법정동명              */
    v_B_Ri_Nm        IN RTSD0010.B_RI_NM%TYPE,        /*리명                  */
    v_H_Dng_Nm       IN RTSD0010.H_DNG_NM%TYPE,       /*행정동명              */
    v_S_Cd           IN RTSD0010.S_CD%TYPE,           /*산여부(0:토지,1:산)   */
    v_Lot_Mb         IN RTSD0010.LOT_MB%TYPE,         /*지번본번              */
    v_Dng_Seq        IN RTSD0010.DNG_SEQ%TYPE,        /*읍면동일련번호        */
    v_Lot_Sb         IN RTSD0010.LOT_SB%TYPE,         /*지번부번              */
    v_Zip_Num        IN RTSD0010.ZIP_NUM%TYPE,        /*우편번호              */
    v_Seq            IN RTSD0010.SEQ%TYPE,            /*우편번호일련번호      */
    v_Sido_Cd        IN RTSD0010.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0010.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*등록자 ID             */
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
  -- 우편번호 마스터 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0010 (
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*건물관리번호(PK)      */
    v_Area_Num       IN RTSD0010.AREA_NUM%TYPE,       /*구역번호              */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,          /*시도                  */
    v_Do_Nm_E        IN RTSD0010.DO_NM_E%TYPE,        /*시도영문              */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,          /*시군구                */
    v_Ct_Nm_E        IN RTSD0010.CT_NM_E%TYPE,        /*시군구영문            */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,          /*읍면                  */
    v_Em_Nm_E        IN RTSD0010.EM_NM_E%TYPE,        /*읍면영문              */
    v_Rd_Cd          IN RTSD0010.RD_CD%TYPE,          /*도로명코드            */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE,          /*도로명                */
    v_Rd_Nm_E        IN RTSD0010.RD_NM_E%TYPE,        /*도로명영문            */
    v_Undr_Grnd      IN RTSD0010.UNDR_GRND%TYPE,      /*지하여부(0:지상,1:지하*/
    v_Bld_Mb         IN RTSD0010.BLD_MB%TYPE,         /*건물번호본번          */
    v_Bld_Sb         IN RTSD0010.BLD_SB%TYPE,         /*건물번호부번          */
    v_Md_Nm          IN RTSD0010.MD_NM%TYPE,          /*다량배달처명          */
    v_Bld_Nm1        IN RTSD0010.BLD_NM1%TYPE,        /*시국구용건물명        */
    v_B_Dng_Cd       IN RTSD0010.B_DNG_CD%TYPE,       /*법정동코드            */
    v_B_Dng_Nm       IN RTSD0010.B_DNG_NM%TYPE,       /*법정동명              */
    v_B_Ri_Nm        IN RTSD0010.B_RI_NM%TYPE,        /*리명                  */
    v_H_Dng_Nm       IN RTSD0010.H_DNG_NM%TYPE,       /*행정동명              */
    v_S_Cd           IN RTSD0010.S_CD%TYPE,           /*산여부(0:토지,1:산)   */
    v_Lot_Mb         IN RTSD0010.LOT_MB%TYPE,         /*지번본번              */
    v_Dng_Seq        IN RTSD0010.DNG_SEQ%TYPE,        /*읍면동일련번호        */
    v_Lot_Sb         IN RTSD0010.LOT_SB%TYPE,         /*지번부번              */
    v_Zip_Num        IN RTSD0010.ZIP_NUM%TYPE,        /*우편번호              */
    v_Seq            IN RTSD0010.SEQ%TYPE,            /*우편번호일련번호      */
    v_Sido_Cd        IN RTSD0010.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0010.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*등록자 ID             */
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
  -- 우편번호 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0010 (
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*건물관리번호(PK)      */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*등록자 ID             */
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
  -- 우편번호 마스터 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0010 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*건물관리번호(PK)      */
    v_Area_Num       IN RTSD0010.AREA_NUM%TYPE,       /*구역번호              */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,          /*시도                  */
    v_Do_Nm_E        IN RTSD0010.DO_NM_E%TYPE,        /*시도영문              */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,          /*시군구                */
    v_Ct_Nm_E        IN RTSD0010.CT_NM_E%TYPE,        /*시군구영문            */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,          /*읍면                  */
    v_Em_Nm_E        IN RTSD0010.EM_NM_E%TYPE,        /*읍면영문              */
    v_Rd_Cd          IN RTSD0010.RD_CD%TYPE,          /*도로명코드            */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE,          /*도로명                */
    v_Rd_Nm_E        IN RTSD0010.RD_NM_E%TYPE,        /*도로명영문            */
    v_Undr_Grnd      IN RTSD0010.UNDR_GRND%TYPE,      /*지하여부(0:지상,1:지하*/
    v_Bld_Mb         IN RTSD0010.BLD_MB%TYPE,         /*건물번호본번          */
    v_Bld_Sb         IN RTSD0010.BLD_SB%TYPE,         /*건물번호부번          */
    v_Md_Nm          IN RTSD0010.MD_NM%TYPE,          /*다량배달처명          */
    v_Bld_Nm1        IN RTSD0010.BLD_NM1%TYPE,        /*시국구용건물명        */
    v_B_Dng_Cd       IN RTSD0010.B_DNG_CD%TYPE,       /*법정동코드            */
    v_B_Dng_Nm       IN RTSD0010.B_DNG_NM%TYPE,       /*법정동명              */
    v_B_Ri_Nm        IN RTSD0010.B_RI_NM%TYPE,        /*리명                  */
    v_H_Dng_Nm       IN RTSD0010.H_DNG_NM%TYPE,       /*행정동명              */
    v_S_Cd           IN RTSD0010.S_CD%TYPE,           /*산여부(0:토지,1:산)   */
    v_Lot_Mb         IN RTSD0010.LOT_MB%TYPE,         /*지번본번              */
    v_Dng_Seq        IN RTSD0010.DNG_SEQ%TYPE,        /*읍면동일련번호        */
    v_Lot_Sb         IN RTSD0010.LOT_SB%TYPE,         /*지번부번              */
    v_Zip_Num        IN RTSD0010.ZIP_NUM%TYPE,        /*우편번호              */
    v_Seq            IN RTSD0010.SEQ%TYPE,            /*우편번호일련번호      */
    v_Sido_Cd        IN RTSD0010.SIDO_CD%TYPE,        /*시,도 코드            */
    v_Sigun_Cd       IN RTSD0010.SIGUN_CD%TYPE,       /*시,군,구 코드         */
    v_Use_Yn         IN RTSD0010.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:건물관리번호,사용여부,  등록자 ID
    IF TRIM(v_Bld_Mng_No) IS NULL THEN
        v_Return_Message := '건물관리번호('||v_Bld_Mng_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL) OR (v_Use_Yn IN ('Y','N')) THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
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
            v_Return_Message := '우편번호 등록 실패!!!'||'-'||v_ErrorText;
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
                v_Return_Message := '우편번호 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0010(v_Bld_Mng_No , v_Reg_Id , v_ErrorText) THEN
                v_Return_Message := '우편번호 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
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
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0010.p_IUDRtsd0010(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0010;

  /*****************************************************************************
  -- 우편번호 마스터 - 우편번호 조회 POPUP
  *****************************************************************************/
  PROCEDURE p_sRtsd0010Popup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Db_Cd          IN RTSD0010.USE_YN%TYPE,   /*유형(D:도로명,B:지번)       */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,    /*시도                        */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,    /*시군구                      */
    v_Rd_Dng_Nm      IN VARCHAR,                /*읍면/동/도로명_리명         */
    v_Mb_Nm          IN VARCHAR                 /*건물본번.부번/지번본번.부번 */
    ) IS
  BEGIN

    p_sRtsd0010PopupPage(Ref_Cursor, v_Db_Cd, v_Do_Nm, v_Ct_Nm, v_Rd_Dng_Nm, v_Mb_Nm, 1, 100000);                   

  END p_sRtsd0010Popup;
    
  /*****************************************************************************
  -- 우편번호 마스터 - 우편번호 조회 POPUP
  *****************************************************************************/
  PROCEDURE p_sRtsd0010PopupPage (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Db_Cd          IN RTSD0010.USE_YN%TYPE,   /*유형(D:도로명,B:지번)       */
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,    /*시도                        */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,    /*시군구                      */
    v_Rd_Dng_Nm      IN VARCHAR,                /*읍면/동/도로명_리명         */
    v_Mb_Nm          IN VARCHAR,                /*건물본번.부번/지번본번.부번 */
    v_Page_No        IN NUMBER,                 /*페이지                      */
    v_Get_Cnt        IN NUMBER                  /*획득건수                    */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
     SELECT  A.ROW_NUM,
            A.EM_NM||A.B_DNG_NM||DECODE('D',v_Db_Cd, A.RD_NM, A.B_RI_NM) Rd_Dng_Nm,
            DECODE('D', v_Db_Cd, A.BLD_MB||'-'||A.BLD_SB, A.LOT_MB||'-'||A.LOT_SB) Mb_Nm,
            /*도로명 주소 */
            A.DO_NM||' '||A.CT_NM||DECODE(A.EM_NM,NULL,'',' '||A.EM_NM)||' '||A.RD_NM AS RN_ADDR1_D,
            TRIM(
                DECODE(A.BLD_SB, NULL,A.BLD_MB  || ' '
                                , 0,   A.BLD_MB  || ' '
                                ,      A.BLD_MB  || '-') ||
                        DECODE(A.BLD_SB, NULL,NULL,0,NULL,A.BLD_SB  || ' ')   ||
                        DECODE(A.BLD_NM1,NULL,NULL,'('||A.BLD_NM1||')')
            ) AS RN_ADDR2_D,
            /*법정동 주소 START */
            A.DO_NM||' '||A.CT_NM||DECODE(A.EM_NM,NULL,'',' '||A.EM_NM)||' '||DECODE(A.B_RI_NM, NULL, A.B_DNG_NM, A.B_RI_NM) AS RN_ADDR1_B,
                TRIM(
                    DECODE(A.LOT_SB, NULL,A.LOT_MB  || ' '
                                  , 0,   A.LOT_MB  || ' '
                                    ,      A.LOT_MB  || '-') ||
                   DECODE(A.LOT_SB, NULL,NULL,0,NULL,A.LOT_SB  || ' ')   ||
                   DECODE(A.BLD_NM1,NULL,NULL,'('||A.BLD_NM1||')')
                   ) AS RN_ADDR2_B,
            A.BLD_MNG_NO,   /*건물관리번호(PK)       */
            A.AREA_NUM,     /*구역번호               */
            A.DO_NM,        /*시도                   */
            A.DO_NM_E,      /*시도영문               */
            A.CT_NM,        /*시군구                 */
            A.CT_NM_E,      /*시군구영문             */
            A.EM_NM,        /*읍면                   */
            A.EM_NM_E,      /*읍면영문               */
            A.RD_CD,        /*도로명코드             */
            A.RD_NM,        /*도로명                 */
            A.RD_NM_E,      /*도로명영문             */
            A.UNDR_GRND,    /*지하여부(0:지상,1:지하)*/
            A.BLD_MB,       /*건물번호본번           */
            A.BLD_SB,       /*건물번호부번           */
            A.MD_NM,        /*다량배달처명           */
            A.BLD_NM1,      /*시국구용건물명         */
            A.B_DNG_CD,     /*법정동코드             */
            A.B_DNG_NM,     /*법정동명               */
            A.B_RI_NM,      /*리명                   */
            A.H_DNG_NM,     /*행정동명               */
            A.S_CD,         /*산여부(0:토지,1:산)    */
            A.LOT_MB,       /*지번본번               */
            A.DNG_SEQ,      /*읍면동일련번호         */
            A.LOT_SB,       /*지번부번               */
            A.ZIP_NUM,      /*우편번호               */
            A.SEQ,          /*우편번호일련번호       */
            A.SIDO_CD,      /*시,도 코드             */
            A.SIGUN_CD,     /*시,군,구 코드          */
            A.TOTAL_CNT     /*전체 건수              */
    FROM    (    
            SELECT  A.*,
                    ROW_NUMBER() OVER(ORDER BY DECODE(v_Db_Cd, 'D', TO_NUMBER(BLD_MB), TO_NUMBER(LOT_MB)), DECODE(v_Db_Cd,'D', TO_NUMBER(BLD_SB), TO_NUMBER(LOT_SB))) ROW_NUM,
                    COUNT(BLD_MNG_NO) OVER() TOTAL_CNT                    
            FROM    (
                    -- 도로명 주소
                    SELECT  *
                    FROM    RTSD0010 A
                    WHERE   v_Db_Cd = 'D'
                    AND     A.DO_NM  = v_Do_Nm /*시도    */
                    AND     A.CT_NM  LIKE v_Ct_Nm||'%' /*시군구  */
                    AND     (A.RD_NM LIKE v_Rd_Dng_Nm||'%' OR A.EM_NM LIKE v_Rd_Dng_Nm||'%' OR A.B_DNG_NM LIKE v_Rd_Dng_Nm||'%' OR A.BLD_NM1 LIKE '%'||v_Rd_Dng_Nm||'%'
                    OR REGEXP_REPLACE(A.H_DNG_NM,'제[1-9]동', SUBSTR(A.H_DNG_NM,-2))  LIKE v_Rd_Dng_Nm||'%'  /*행정동 조회가능하도록 수정 21060112 한승훈 */
                    OR REGEXP_REPLACE(A.B_DNG_NM,'[1-9]동', SUBSTR(A.B_DNG_NM,-1))  LIKE v_Rd_Dng_Nm||'%'  
                    OR A.B_DNG_NM LIKE  REGEXP_REPLACE(v_Rd_Dng_Nm,'[1-9]','')||'%'    
                    OR A.H_DNG_NM LIKE v_Rd_Dng_Nm||'%' 
                    OR ( A.BLD_NM1 LIKE NVL(SUBSTR(v_Rd_Dng_Nm,INSTR(v_Rd_Dng_Nm,'동',1)+1),v_Rd_Dng_Nm)||'%'  AND A.H_DNG_NM LIKE NVL(SUBSTR(v_Rd_Dng_Nm, 0, INSTR(v_Rd_Dng_Nm,' ',1)-1),v_Rd_Dng_Nm)||'%')
                    OR ( A.BLD_NM1 LIKE NVL(SUBSTR(v_Rd_Dng_Nm,INSTR(v_Rd_Dng_Nm,' ',1)+1),v_Rd_Dng_Nm)||'%' AND A.H_DNG_NM LIKE NVL(SUBSTR(v_Rd_Dng_Nm, 0, INSTR(v_Rd_Dng_Nm,' ',1)-1),v_Rd_Dng_Nm)||'%')
                    )
                    AND     A.BLD_MB||'-'||A.BLD_SB LIKE REPLACE( v_Mb_Nm, ' ', '' )||'%'
                    UNION   ALL
                    -- 지번 주소
                    SELECT  *
                    FROM    RTSD0010 A
                    WHERE   v_Db_Cd = 'B'
                    AND     A.DO_NM  = v_Do_Nm /*시도    */
                    AND     A.CT_NM  LIKE v_Ct_Nm||'%' /*시군구  */
                    AND     (A.B_RI_NM  LIKE v_Rd_Dng_Nm||'%' OR A.EM_NM LIKE v_Rd_Dng_Nm||'%' OR A.B_DNG_NM LIKE v_Rd_Dng_Nm||'%' OR A.BLD_NM1 LIKE '%'||v_Rd_Dng_Nm||'%'
                    OR REGEXP_REPLACE(A.H_DNG_NM,'제[1-9]동', SUBSTR(A.H_DNG_NM,-2))  LIKE v_Rd_Dng_Nm||'%'   /*행정동 조회가능하도록 수정 21060112 한승훈 */ 
                    OR REGEXP_REPLACE(A.B_DNG_NM,'[1-9]동', SUBSTR(A.B_DNG_NM,-1))  LIKE v_Rd_Dng_Nm||'%'  
                    OR A.B_DNG_NM LIKE  REGEXP_REPLACE(v_Rd_Dng_Nm,'[1-9]','')||'%'
                    OR A.H_DNG_NM LIKE v_Rd_Dng_Nm||'%' 
                    OR ( A.BLD_NM1 LIKE NVL(SUBSTR(v_Rd_Dng_Nm,INSTR(v_Rd_Dng_Nm,'동',1)+1),v_Rd_Dng_Nm)||'%'  AND A.H_DNG_NM LIKE NVL(SUBSTR(v_Rd_Dng_Nm, 0, INSTR(v_Rd_Dng_Nm,' ',1)-1),v_Rd_Dng_Nm)||'%')
                    OR ( A.BLD_NM1 LIKE NVL(SUBSTR(v_Rd_Dng_Nm,INSTR(v_Rd_Dng_Nm,' ',1)+1),v_Rd_Dng_Nm)||'%' AND A.H_DNG_NM LIKE NVL(SUBSTR(v_Rd_Dng_Nm, 0, INSTR(v_Rd_Dng_Nm,' ',1)-1),v_Rd_Dng_Nm)||'%')
                    )
                    AND     A.LOT_MB||'-'||A.LOT_SB LIKE REPLACE( v_Mb_Nm, ' ', '' )||'%'
                    ) A
            ) A 
    WHERE   ROW_NUM BETWEEN (((v_Page_No - 1) * v_Get_Cnt)+1)  AND (v_Page_No * v_Get_Cnt)      
    ORDER BY ROW_NUM;
    


  END p_sRtsd0010PopupPage;

  /*****************************************************************************
  -- 우편번호 시도 조회
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
  -- 우편번호 구군 조회
  *****************************************************************************/
  PROCEDURE f_sRtsd0010CtCombo(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE     /*시도                        */
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
  -- 지역별 키마스타  조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0010carmaster(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,    /*시도                        */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,    /*시군구                      */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,    /*읍면                        */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE     /*도로명                      */
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
  -- 카마스터코드값  일괄저장하기.
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0010CarMaster(
    v_Do_Nm        IN RTSD0010.DO_NM%TYPE,       /*시도                       */
    v_Ct_Nm        IN RTSD0010.CT_NM%TYPE,       /*시군구                     */   
    v_Em_Nm        IN RTSD0010.EM_NM%TYPE,       /*읍면                       */
    v_Rd_Nm        IN RTSD0010.RD_NM%TYPE,       /*도로명                     */
    v_Carmaster_nu IN RTSD0010.CARMASTER_NU%TYPE,/*카마스터 코드              */ 
    v_Reg_Id       IN RTSD0010.REG_ID%TYPE,      /*등록자 ID                  */
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
    v_Return_Message := '정상적으로 등록되었습니다';
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
