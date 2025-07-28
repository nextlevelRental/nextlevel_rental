CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTRE0150 AS
/*******************************************************************************
    NAME        PKG_RTRE0150
    PURPOSE     충당금 지급내역

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-11-17  wjim            [20171117_02] 신규 생성
*******************************************************************************/
  /*****************************************************************************
  -- 충당금 지급내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0150 (
      Ref_Cursor        IN OUT SYS_REFCURSOR    
    , v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*등록년월               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*등록순번               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*대리점코드             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*지급일자               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*지급금액               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*지급사유               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*사용여부               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*등록자ID               */
    , v_LOGIN_ID        IN VARCHAR2                  /* 로그인ID: 관련항목 범위 지정 */
    , v_LOGIN_GRP       IN VARCHAR2                  /* 로그인 사용자 그룹 */
  );
  
  /*****************************************************************************
  -- 충당금 지급내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0150 (    
      v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*등록년월               */  
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*대리점코드             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*지급일자               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*지급금액               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*지급사유               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*사용여부               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*등록자ID               */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 충당금 지급내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0150 (
      v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*등록년월               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*등록순번               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*대리점코드             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*지급일자               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*지급금액               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*지급사유               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*사용여부               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*등록자ID               */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 충당금 지급내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0150 (
      v_Comm_Dvsn       IN CHAR                      /* 처리구분(I,U,D)       */
    , v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*등록년월               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*등록순번               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*대리점코드             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*지급일자               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*지급금액               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*지급사유               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*사용여부               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*등록자ID               */     
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
        
END PKG_RTRE0150;