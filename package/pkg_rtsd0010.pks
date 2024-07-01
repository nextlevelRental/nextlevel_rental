CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0010 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0010
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
    ) RETURN NUMBER;

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 우편번호 마스터 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0010 (
    v_Bld_Mng_No     IN RTSD0010.BLD_MNG_NO%TYPE,     /*건물관리번호(PK)      */
    v_Reg_Id         IN RTSD0010.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

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
    );

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
    );
 
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
    );
    
  /*****************************************************************************
  -- 우편번호 시도 조회
  *****************************************************************************/
  PROCEDURE f_sRtsd0010DoCombo (
    Ref_Cursor       IN OUT SYS_REFCURSOR
    );

  /*****************************************************************************
  -- 우편번호 구군 조회
  *****************************************************************************/
  PROCEDURE f_sRtsd0010CtCombo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_do_nm			 IN RTSD0010.DO_NM%TYPE
    );
  
  /*****************************************************************************
  -- 지역별 키마스타  조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0010carmaster(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Do_Nm          IN RTSD0010.DO_NM%TYPE,    /*시도                        */
    v_Ct_Nm          IN RTSD0010.CT_NM%TYPE,    /*시군구                      */
    v_Em_Nm          IN RTSD0010.EM_NM%TYPE,    /*읍면                        */
    v_Rd_Nm          IN RTSD0010.RD_NM%TYPE     /*도로명                      */
    );
    
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
    );
    
END Pkg_Rtsd0010;
/
