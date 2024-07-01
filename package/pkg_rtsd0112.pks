CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0112 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0112
   PURPOSE   장착 후 고객결합 금액이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0112Count(
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0112.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0112 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*순번                  */
    v_Job_Day        IN RTSD0112.JOB_DAY%TYPE,        /*결합 지정_해제일      */
    v_Grp_Yn         IN RTSD0112.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0112.GRP_NO%TYPE,         /*고객결합번호          */
    v_Rent_Amt       IN RTSD0112.RENT_AMT%TYPE,       /*렌탈료(조견표)        */
    v_C_Dcamt        IN RTSD0112.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_G_Dcrate       IN RTSD0112.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0112.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0112.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0112.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcamt        IN RTSD0112.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Amt        IN RTSD0112.MON_AMT%TYPE,        /*월렌탈료              */
    v_Grp_Yn2        IN RTSD0112.GRP_YN2%TYPE,        /*이후_고객결합여부     */
    v_Grp_No2        IN RTSD0112.GRP_NO2%TYPE,        /*고객결합번호          */
    v_Rent_Amt2      IN RTSD0112.RENT_AMT2%TYPE,      /*렌탈료(조견표)        */
    v_C_Dcamt2       IN RTSD0112.C_DCAMT2%TYPE,       /*캠페인할인액          */
    v_G_Dcrate2      IN RTSD0112.G_DCRATE2%TYPE,      /*결합할인율            */
    v_G_Dcamt2       IN RTSD0112.G_DCAMT2%TYPE,       /*결합할인액            */
    v_L_Dcrate2      IN RTSD0112.L_DCRATE2%TYPE,      /*제한할인율            */
    v_L_Dcamt2       IN RTSD0112.L_DCAMT2%TYPE,       /*제한할인액            */
    v_F_Dcamt2       IN RTSD0112.F_DCAMT2%TYPE,       /*최종할인액            */
    v_Mon_Amt2       IN RTSD0112.MON_AMT2%TYPE,       /*월렌탈료              */
    v_Sale_Namt      IN RTSD0112.SALE_NAMT%TYPE,      /*월렌탈료_원금         */
    v_Sale_Vamt      IN RTSD0112.SALE_VAMT%TYPE,      /*월렌탈료_부가세       */
    v_Recp_Nu        IN RTSD0112.RECP_NU%TYPE,        /*청구순번              */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0112 (
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*순번                  */
    v_Job_Day        IN RTSD0112.JOB_DAY%TYPE,        /*결합 지정_해제일      */
    v_Grp_Yn         IN RTSD0112.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0112.GRP_NO%TYPE,         /*고객결합번호          */
    v_Rent_Amt       IN RTSD0112.RENT_AMT%TYPE,       /*렌탈료(조견표)        */
    v_C_Dcamt        IN RTSD0112.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_G_Dcrate       IN RTSD0112.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0112.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0112.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0112.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcamt        IN RTSD0112.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Amt        IN RTSD0112.MON_AMT%TYPE,        /*월렌탈료              */
    v_Grp_Yn2        IN RTSD0112.GRP_YN2%TYPE,        /*이후_고객결합여부     */
    v_Grp_No2        IN RTSD0112.GRP_NO2%TYPE,        /*고객결합번호          */
    v_Rent_Amt2      IN RTSD0112.RENT_AMT2%TYPE,      /*렌탈료(조견표)        */
    v_C_Dcamt2       IN RTSD0112.C_DCAMT2%TYPE,       /*캠페인할인액          */
    v_G_Dcrate2      IN RTSD0112.G_DCRATE2%TYPE,      /*결합할인율            */
    v_G_Dcamt2       IN RTSD0112.G_DCAMT2%TYPE,       /*결합할인액            */
    v_L_Dcrate2      IN RTSD0112.L_DCRATE2%TYPE,      /*제한할인율            */
    v_L_Dcamt2       IN RTSD0112.L_DCAMT2%TYPE,       /*제한할인액            */
    v_F_Dcamt2       IN RTSD0112.F_DCAMT2%TYPE,       /*최종할인액            */
    v_Mon_Amt2       IN RTSD0112.MON_AMT2%TYPE,       /*월렌탈료              */
    v_Sale_Namt      IN RTSD0112.SALE_NAMT%TYPE,      /*월렌탈료_원금         */
    v_Sale_Vamt      IN RTSD0112.SALE_VAMT%TYPE,      /*월렌탈료_부가세       */
    v_Recp_Nu        IN RTSD0112.RECP_NU%TYPE,        /*청구순번              */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0112 (
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*순번                  */
    v_Job_Day        IN RTSD0112.JOB_DAY%TYPE,        /*결합 지정_해제일      */
    v_Grp_Yn         IN RTSD0112.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0112.GRP_NO%TYPE,         /*고객결합번호          */
    v_Rent_Amt       IN RTSD0112.RENT_AMT%TYPE,       /*렌탈료(조견표)        */
    v_C_Dcamt        IN RTSD0112.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_G_Dcrate       IN RTSD0112.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0112.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0112.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0112.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcamt        IN RTSD0112.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Amt        IN RTSD0112.MON_AMT%TYPE,        /*월렌탈료              */
    v_Grp_Yn2        IN RTSD0112.GRP_YN2%TYPE,        /*이후_고객결합여부     */
    v_Grp_No2        IN RTSD0112.GRP_NO2%TYPE,        /*고객결합번호          */
    v_Rent_Amt2      IN RTSD0112.RENT_AMT2%TYPE,      /*렌탈료(조견표)        */
    v_C_Dcamt2       IN RTSD0112.C_DCAMT2%TYPE,       /*캠페인할인액          */
    v_G_Dcrate2      IN RTSD0112.G_DCRATE2%TYPE,      /*결합할인율            */
    v_G_Dcamt2       IN RTSD0112.G_DCAMT2%TYPE,       /*결합할인액            */
    v_L_Dcrate2      IN RTSD0112.L_DCRATE2%TYPE,      /*제한할인율            */
    v_L_Dcamt2       IN RTSD0112.L_DCAMT2%TYPE,       /*제한할인액            */
    v_F_Dcamt2       IN RTSD0112.F_DCAMT2%TYPE,       /*최종할인액            */
    v_Mon_Amt2       IN RTSD0112.MON_AMT2%TYPE,       /*월렌탈료              */
    v_Sale_Namt      IN RTSD0112.SALE_NAMT%TYPE,      /*월렌탈료_원금         */
    v_Sale_Vamt      IN RTSD0112.SALE_VAMT%TYPE,      /*월렌탈료_부가세       */
    v_Recp_Nu        IN RTSD0112.RECP_NU%TYPE,        /*청구순번              */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0112 (
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0112 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN OUT RTSD0112.SEQ%TYPE,        /*순번                  */
    v_Job_Day        IN RTSD0112.JOB_DAY%TYPE,        /*결합 지정_해제일      */
    v_Grp_Yn         IN RTSD0112.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0112.GRP_NO%TYPE,         /*고객결합번호          */
    v_Rent_Amt       IN RTSD0112.RENT_AMT%TYPE,       /*렌탈료(조견표)        */
    v_C_Dcamt        IN RTSD0112.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_G_Dcrate       IN RTSD0112.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0112.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0112.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0112.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcamt        IN RTSD0112.F_DCAMT%TYPE,        /*최종할인액            */
    v_Mon_Amt        IN RTSD0112.MON_AMT%TYPE,        /*월렌탈료              */
    v_Grp_Yn2        IN RTSD0112.GRP_YN2%TYPE,        /*이후_고객결합여부     */
    v_Grp_No2        IN RTSD0112.GRP_NO2%TYPE,        /*고객결합번호          */
    v_Rent_Amt2      IN RTSD0112.RENT_AMT2%TYPE,      /*렌탈료(조견표)        */
    v_C_Dcamt2       IN RTSD0112.C_DCAMT2%TYPE,       /*캠페인할인액          */
    v_G_Dcrate2      IN RTSD0112.G_DCRATE2%TYPE,      /*결합할인율            */
    v_G_Dcamt2       IN RTSD0112.G_DCAMT2%TYPE,       /*결합할인액            */
    v_L_Dcrate2      IN RTSD0112.L_DCRATE2%TYPE,      /*제한할인율            */
    v_L_Dcamt2       IN RTSD0112.L_DCAMT2%TYPE,       /*제한할인액            */
    v_F_Dcamt2       IN RTSD0112.F_DCAMT2%TYPE,       /*최종할인액            */
    v_Mon_Amt2       IN RTSD0112.MON_AMT2%TYPE,       /*월렌탈료              */
    v_Sale_Namt      IN RTSD0112.SALE_NAMT%TYPE,      /*월렌탈료_원금         */
    v_Sale_Vamt      IN RTSD0112.SALE_VAMT%TYPE,      /*월렌탈료_부가세       */
    v_Recp_Nu        IN RTSD0112.RECP_NU%TYPE,        /*청구순번              */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0112Seq(
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;
    
END Pkg_Rtsd0112;
/
