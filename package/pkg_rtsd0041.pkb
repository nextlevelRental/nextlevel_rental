CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0041 AS
/*******************************************************************************
   NAME:      PKG_RTSD0041
   PURPOSE    계약별 부가서비스 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-06  pc2288         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계약별 부가서비스 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0041 (
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0041
    WHERE  ORD_NO = v_Ord_No;

    Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0041.f_DeleteRtsd0041', '주문번호', v_Ord_No);

    RETURN SQLCODE;
  END f_DeleteRtsd0041;

  /*****************************************************************************
  -- 계약별 부가서비스 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0041 (
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0041.SEQ%TYPE,			  /*순번				  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*부가제품코드          */
    v_Amt			 IN RTSD0041.AMT%TYPE,            /*금액	              */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*할인금액              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*최종금액              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*제품군                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*할부여부              */
	v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*월렌탈료              */
	v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0041 (
            ORD_NO,
            SEQ,
            ADD_GDS_CD,
            AMT,
            DC_AMT,
            L_AMT,
			GDS_GRP,
            DC_YN,
			MON_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Seq,
            v_Add_Gds_Cd,
            v_Amt,
            v_DC_Amt,
            v_L_Amt,
            v_Gds_Grp,
			v_Dc_Yn,
			v_Mon_Amt,
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

  END f_InsertRtsd0041;

  /*****************************************************************************
  -- 계약별 부가서비스 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0041 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0041.SEQ%TYPE,			  /*순번				  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*부가제품코드          */
    v_Amt			 IN RTSD0041.AMT%TYPE,            /*금액	              */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*할인금액              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*최종금액              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*제품군                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*할부여부              */
	v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*월렌탈료              */
	v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계약번호, 프리미엄서비스,상세서비스, 타이어본수, 사용여부, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0041(v_Ord_No, v_Seq, v_Add_Gds_Cd, v_Amt, v_DC_Amt, 
		                         v_L_Amt, v_Gds_Grp, v_Dc_Yn, v_Mon_Amt, v_Reg_Id, 
								 v_ErrorText) THEN
            v_Return_Message := '계약별 부가서비스 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            v_Success_code := 0;
        ELSIF v_Comm_Dvsn = 'D' THEN
            v_Success_code := 0;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_RTSD0041.p_IUDRtsd0041(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_RTSD0041.p_IUDRtsd0041(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0041;


  /*****************************************************************************
  -- 계약별 부가서비스 관리(IUD) 일시불
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0041Direct (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0041.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0041.SEQ%TYPE,              /*순번                  */
    v_Add_Gds_Cd     IN RTSD0041.ADD_GDS_CD%TYPE,     /*부가제품코드          */
    v_Amt             IN RTSD0041.AMT%TYPE,            /*금액                  */
    v_DC_Amt         IN RTSD0041.DC_AMT%TYPE,         /*할인금액              */
    v_L_Amt          IN RTSD0041.L_AMT%TYPE,          /*최종금액              */
    v_Gds_Grp        IN RTSD0041.GDS_GRP%TYPE,        /*제품군                */
    v_Dc_Yn          IN RTSD0041.DC_YN%TYPE,          /*할부여부              */
    v_Mon_Amt        IN RTSD0041.MON_AMT%TYPE,        /*월렌탈료              */
    v_Reg_Id         IN RTSD0041.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계약번호, 프리미엄서비스,상세서비스, 타이어본수, 사용여부, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtsd0041(v_Ord_No, v_Seq, v_Add_Gds_Cd, v_Amt, v_DC_Amt, 
                                 v_L_Amt, v_Gds_Grp, v_Dc_Yn, v_Mon_Amt, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '계약별 부가서비스 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            v_Success_code := 0;
        ELSIF v_Comm_Dvsn = 'D' THEN
            v_Success_code := 0;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTSD0041.p_IUDRtsd0041Direct(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTSD0041.p_IUDRtsd0041Direct(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0041Direct;




END PKG_RTSD0041;