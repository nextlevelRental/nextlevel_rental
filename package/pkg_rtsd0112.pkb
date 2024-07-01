CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0112 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0112
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
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0112
    WHERE   ORD_NO = v_Ord_No
    AND     SEQ    = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0112Count;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SEQ,                       /*순번                */
            A.JOB_DAY,                   /*결합 지정_해제일    */
            A.GRP_YN,                    /*고객결합여부        */
            A.GRP_NO,                    /*고객결합번호        */
            A.RENT_AMT,                  /*렌탈료(조견표)      */
            A.C_DCAMT,                   /*캠페인할인금액      */
            A.G_DCRATE,                  /*결합할인율          */
            A.G_DCAMT,                   /*결합할인액          */
            A.L_DCRATE,                  /*제한할인율          */
            A.L_DCAMT,                   /*제한할인액          */
            A.F_DCAMT,                   /*최종할인액          */
            A.MON_AMT,                   /*월렌탈료            */
            A.GRP_YN2,                   /*이후_고객결합여부   */
            A.GRP_NO2,                   /*고객결합번호        */
            A.RENT_AMT2,                 /*렌탈료(조견표)      */
            A.C_DCAMT2,                  /*캠페인할인액        */
            A.G_DCRATE2,                 /*결합할인율          */
            A.G_DCAMT2,                  /*결합할인액          */
            A.L_DCRATE2,                 /*제한할인율          */
            A.L_DCAMT2,                  /*제한할인액          */
            A.F_DCAMT2,                  /*최종할인액          */
            A.MON_AMT2,                  /*월렌탈료            */
            A.SALE_NAMT,                 /*월렌탈료_원금       */
            A.SALE_VAMT,                 /*월렌탈료_부가세     */
            A.RECP_NU,                   /*청구순번            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0112 A
    WHERE   A.ORD_NO    = DECODE(v_Ord_No    , NULL, A.ORD_NO    , v_Ord_No)
    AND     A.SEQ       = DECODE(v_Seq       , NULL, A.SEQ       , v_Seq)
    AND     A.JOB_DAY   = DECODE(v_Job_Day   , NULL, A.JOB_DAY   , v_Job_Day)
    AND     A.GRP_YN    = DECODE(v_Grp_Yn    , NULL, A.GRP_YN    , v_Grp_Yn)
    AND     A.GRP_NO    = DECODE(v_Grp_No    , NULL, A.GRP_NO    , v_Grp_No)
    AND     A.RENT_AMT  = DECODE(v_Rent_Amt  , NULL, A.RENT_AMT  , v_Rent_Amt)
    AND     A.C_DCAMT   = DECODE(v_C_Dcamt   , NULL, A.C_DCAMT   , v_C_Dcamt)
    AND     A.G_DCRATE  = DECODE(v_G_Dcrate  , NULL, A.G_DCRATE  , v_G_Dcrate)
    AND     A.G_DCAMT   = DECODE(v_G_Dcamt   , NULL, A.G_DCAMT   , v_G_Dcamt)
    AND     A.L_DCRATE  = DECODE(v_L_Dcrate  , NULL, A.L_DCRATE  , v_L_Dcrate)
    AND     A.L_DCAMT   = DECODE(v_L_Dcamt   , NULL, A.L_DCAMT   , v_L_Dcamt)
    AND     A.F_DCAMT   = DECODE(v_F_Dcamt   , NULL, A.F_DCAMT   , v_F_Dcamt)
    AND     A.MON_AMT   = DECODE(v_Mon_Amt   , NULL, A.MON_AMT   , v_Mon_Amt)
    AND     A.GRP_YN2   = DECODE(v_Grp_Yn2   , NULL, A.GRP_YN2   , v_Grp_Yn2)
    AND     A.GRP_NO2   = DECODE(v_Grp_No2   , NULL, A.GRP_NO2   , v_Grp_No2)
    AND     A.RENT_AMT2 = DECODE(v_Rent_Amt2 , NULL, A.RENT_AMT2 , v_Rent_Amt2)
    AND     A.C_DCAMT2  = DECODE(v_C_Dcamt2  , NULL, A.C_DCAMT2  , v_C_Dcamt2)
    AND     A.G_DCRATE2 = DECODE(v_G_Dcrate2 , NULL, A.G_DCRATE2 , v_G_Dcrate2)
    AND     A.G_DCAMT2  = DECODE(v_G_Dcamt2  , NULL, A.G_DCAMT2  , v_G_Dcamt2)
    AND     A.L_DCRATE2 = DECODE(v_L_Dcrate2 , NULL, A.L_DCRATE2 , v_L_Dcrate2)
    AND     A.L_DCAMT2  = DECODE(v_L_Dcamt2  , NULL, A.L_DCAMT2  , v_L_Dcamt2)
    AND     A.F_DCAMT2  = DECODE(v_F_Dcamt2  , NULL, A.F_DCAMT2  , v_F_Dcamt2)
    AND     A.MON_AMT2  = DECODE(v_Mon_Amt2  , NULL, A.MON_AMT2  , v_Mon_Amt2)
    AND     A.SALE_NAMT = DECODE(v_Sale_Namt , NULL, A.SALE_NAMT , v_Sale_Namt)
    AND     A.SALE_VAMT = DECODE(v_Sale_Vamt , NULL, A.SALE_VAMT , v_Sale_Vamt)
    AND     A.RECP_NU   = DECODE(v_Recp_Nu   , NULL, A.RECP_NU   , v_Recp_Nu)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtsd0112;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0112 (
            ORD_NO,
            SEQ,
            JOB_DAY,
            GRP_YN,
            GRP_NO,
            RENT_AMT,
            C_DCAMT,
            G_DCRATE,
            G_DCAMT,
            L_DCRATE,
            L_DCAMT,
            F_DCAMT,
            MON_AMT,
            GRP_YN2,
            GRP_NO2,
            RENT_AMT2,
            C_DCAMT2,
            G_DCRATE2,
            G_DCAMT2,
            L_DCRATE2,
            L_DCAMT2,
            F_DCAMT2,
            MON_AMT2,
            SALE_NAMT,
            SALE_VAMT,
            RECP_NU,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Seq,
            v_Job_Day,
            v_Grp_Yn,
            v_Grp_No,
            v_Rent_Amt,
            v_C_Dcamt,
            v_G_Dcrate,
            v_G_Dcamt,
            v_L_Dcrate,
            v_L_Dcamt,
            v_F_Dcamt,
            v_Mon_Amt,
            v_Grp_Yn2,
            v_Grp_No2,
            v_Rent_Amt2,
            v_C_Dcamt2,
            v_G_Dcrate2,
            v_G_Dcamt2,
            v_L_Dcrate2,
            v_L_Dcamt2,
            v_F_Dcamt2,
            v_Mon_Amt2,
            v_Sale_Namt,
            v_Sale_Vamt,
            v_Recp_Nu,
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

  END f_InsertRtsd0112;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0112
    SET    JOB_DAY   = v_Job_Day,
           GRP_YN    = v_Grp_Yn,
           GRP_NO    = v_Grp_No,
           RENT_AMT  = v_Rent_Amt,
           C_DCAMT   = v_C_Dcamt,
           G_DCRATE  = v_G_Dcrate,
           G_DCAMT   = v_G_Dcamt,
           L_DCRATE  = v_L_Dcrate,
           L_DCAMT   = v_L_Dcamt,
           F_DCAMT   = v_F_Dcamt,
           MON_AMT   = v_Mon_Amt,
           GRP_YN2   = v_Grp_Yn2,
           GRP_NO2   = v_Grp_No2,
           RENT_AMT2 = v_Rent_Amt2,
           C_DCAMT2  = v_C_Dcamt2,
           G_DCRATE2 = v_G_Dcrate2,
           G_DCAMT2  = v_G_Dcamt2,
           L_DCRATE2 = v_L_Dcrate2,
           L_DCAMT2  = v_L_Dcamt2,
           F_DCAMT2  = v_F_Dcamt2,
           MON_AMT2  = v_Mon_Amt2,
           SALE_NAMT = v_Sale_Namt,
           SALE_VAMT = v_Sale_Vamt,
           RECP_NU   = v_Recp_Nu,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  ORD_NO    = v_Ord_No
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0112;

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0112 (
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0112.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0112.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0112
    WHERE  ORD_NO = v_Ord_No
    AND    SEQ    = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0112.p_IUDRtsd0112(1)', '계약번호', v_Ord_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0112.p_IUDRtsd0112(1)', '순번', v_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0112.p_IUDRtsd0112(1)', '등록자 ID', v_Reg_Id);
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0112;

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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_sRtsd0112Count(v_Ord_No, v_Seq) THEN
            v_Return_Message := '해당 데이터('||v_Ord_No||'-'||v_Seq||')는 이미 등록된 데이터이므로 신규등록 처리 불가!';
            RAISE e_Error;
        END IF;
        
        v_Seq := f_sRtsd0112Seq(v_Ord_No);
        
        IF 0 != f_InsertRtsd0112(v_Ord_No, v_Seq, v_Job_Day, v_Grp_Yn, 
                                 v_Grp_No, v_Rent_Amt, v_C_Dcamt, v_G_Dcrate, 
                                 v_G_Dcamt, v_L_Dcrate, v_L_Dcamt, v_F_Dcamt, 
                                 v_Mon_Amt, v_Grp_Yn2, v_Grp_No2, v_Rent_Amt2, 
                                 v_C_Dcamt2, v_G_Dcrate2, v_G_Dcamt2, v_L_Dcrate2, 
                                 v_L_Dcamt2, v_F_Dcamt2, v_Mon_Amt2, v_Sale_Namt, 
                                 v_Sale_Vamt, v_Recp_Nu, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '장착 후 고객결합 금액이력 관리 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0112Count(v_Ord_No, v_Seq) THEN
            v_Return_Message := '해당 데이터('||v_Ord_No||'-'||v_Seq||')는 미등록된 데이터이므로 수정/삭제 처리 불가!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0112(v_Ord_No, v_Seq, v_Job_Day, v_Grp_Yn, 
                                     v_Grp_No, v_Rent_Amt, v_C_Dcamt, v_G_Dcrate, 
                                     v_G_Dcamt, v_L_Dcrate, v_L_Dcamt, v_F_Dcamt, 
                                     v_Mon_Amt, v_Grp_Yn2, v_Grp_No2, v_Rent_Amt2, 
                                     v_C_Dcamt2, v_G_Dcrate2, v_G_Dcamt2, v_L_Dcrate2, 
                                     v_L_Dcamt2, v_F_Dcamt2, v_Mon_Amt2, v_Sale_Namt, 
                                     v_Sale_Vamt, v_Recp_Nu, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '장착 후 고객결합 금액이력 관리 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0112(v_Ord_No, v_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '장착 후 고객결합 금액이력 관리 삭제 실패!!!'||'-'||v_ErrorText;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0112.p_IUDRtsd0112(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0112.p_IUDRtsd0112(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0112;

  /*****************************************************************************
  -- 장착 후 고객결합 금액이력 - 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0112Seq(
    v_Ord_No         IN RTSD0112.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_Seq RTSD0112.SEQ%TYPE DEFAULT NULL;               /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTSD0112
                 WHERE   ORD_NO = v_Ord_No)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0112Seq;
  
END Pkg_Rtsd0112;
/