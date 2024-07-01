CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0111 AS
/*******************************************************************************
    NAME        Pkg_Rtcm0111
    PURPOSE     렌탈마스터 정보
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
*******************************************************************************/
     
  /*****************************************************************************
  -- 렌탈마스터 정보 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0111 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Rnt_Mst_Id      IN RTCM0111.RNT_MST_ID%TYPE,
    v_Rnt_Mst_Nm      IN RTCM0111.RNT_MST_NM%TYPE,
    v_Use_Yn          IN RTCM0111.USE_YN%TYPE
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT A.RNT_MST_ID             /* 렌탈마스터 ID  */
         , A.RNT_MST_NM             /* 렌탈마스터 이름*/
         , A.MOB_NO                 /* 휴대폰번호  */
         , A.EMAIL_ADDR             /* EMAIL */
         , A.USE_YN                 /* 사용여부   */
         , A.PI_DSTRY_YN
         , A.PI_DSTRY_ID
         , A.PI_DSTRY_DT
         , A.REG_ID
      FROM RTCM0111 A         
     WHERE 1=1
       AND (v_Rnt_Mst_Id IS NULL OR A.RNT_MST_ID = v_Rnt_Mst_Id)
       AND (v_Rnt_Mst_Nm IS NULL OR A.RNT_MST_NM LIKE '%' || DECODE(v_Rnt_Mst_Nm, NULL, '%', v_Rnt_Mst_Nm) || '%')
       AND (v_Use_Yn IS NULL OR A.USE_YN = v_Use_Yn)
     ;
       
  END p_sRtcm0111;
      
  /*****************************************************************************
  -- 렌탈마스터정보입력(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0111 (
      v_Comm_Dvsn                    IN CHAR                                        /*처리구분(I,U,D)      */
    , v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*렌탈마스터 이름             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*렌탈마스터 휴대폰번호          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*렌탈마스터 EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*사용여부          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*개인정보파기여부          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*개인정보파기자ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*개인정보파기일자          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS 
  e_Error EXCEPTION;
  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtcm0111(
              v_Rnt_Mst_Id
            , v_Rnt_Mst_Nm  
            , v_Mob_No
            , v_Email_Addr
            , v_Use_Yn
            , v_Pi_Dstry_Yn
            , v_Pi_Dstry_Id
            , v_Pi_Dstry_Dt
            , v_Reg_Id         
            , v_ErrorText
        ) THEN
            v_Return_Message := '렌탈 마스터 정보 등록 실패!!!'||'-'||v_ErrorText || '[' || v_Rnt_Mst_Id || '::' || v_Rnt_Mst_Nm || '::' || v_Mob_No || '::' || v_Email_Addr || '::' || v_Use_Yn || ']';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn IN ('U') THEN
            
        IF 0 != f_UpdateRtcm0111(
              v_Rnt_Mst_Id
            , v_Rnt_Mst_Nm  
            , v_Mob_No
            , v_Email_Addr
            , v_Use_Yn
            , v_Pi_Dstry_Yn
            , v_Pi_Dstry_Id
            , v_Pi_Dstry_Dt
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '렌탈 마스터 정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);

  END p_IUDRtcm0111;
   
  /*****************************************************************************
  -- 렌탈마스터정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtcm0111 (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*렌탈마스터 이름             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*렌탈마스터 휴대폰번호          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*렌탈마스터 EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*사용여부          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*개인정보파기여부          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*개인정보파기자ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*개인정보파기일자          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTCM0111 (
          RNT_MST_ID
        , RNT_MST_NM
        , MOB_NO
        , EMAIL_ADDR
        , USE_YN
        , PI_DSTRY_YN
        , PI_DSTRY_ID
        , PI_DSTRY_DT
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    ) VALUES (
          v_Rnt_Mst_Id
        , v_Rnt_Mst_Nm 
        , v_Mob_No   
        , v_Email_Addr
        , v_Use_Yn
        , v_Pi_Dstry_Yn
        , v_Pi_Dstry_Id
        , v_Pi_Dstry_Dt
        , v_Reg_Id            
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0111;
  
  /*****************************************************************************
  -- 렌탈마스터 정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0111 (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Rnt_Mst_Nm                   IN RTCM0111.RNT_MST_NM%TYPE                    /*렌탈마스터 이름             */
    , v_Mob_No                       IN RTCM0111.MOB_NO%TYPE                        /*렌탈마스터 휴대폰번호          */
    , v_Email_Addr                   IN RTCM0111.EMAIL_ADDR%TYPE                    /*렌탈마스터 EMAIL          */
    , v_Use_Yn                       IN RTCM0111.USE_YN%TYPE                        /*사용여부          */
    , v_Pi_Dstry_Yn                  IN RTCM0111.PI_DSTRY_YN%TYPE                   /*개인정보파기여부          */
    , v_Pi_Dstry_Id                  IN RTCM0111.PI_DSTRY_ID%TYPE                   /*개인정보파기자ID          */
    , v_Pi_Dstry_Dt                  IN RTCM0111.PI_DSTRY_DT%TYPE                   /*개인정보파기일자          */
    , v_Reg_Id                       IN RTCM0111.REG_ID%TYPE                        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS 
  BEGIN

    UPDATE RTCM0111
       SET RNT_MST_NM                  = v_Rnt_Mst_Nm
         , MOB_NO                      = v_Mob_No
         , EMAIL_ADDR                  = v_Email_Addr
         , USE_YN                      = v_Use_Yn
         , PI_DSTRY_YN                 = v_Pi_Dstry_Yn
         , PI_DSTRY_ID                 = v_Pi_Dstry_Id
         , PI_DSTRY_DT                 = v_Pi_Dstry_Dt
         , CHG_ID                      = v_Reg_Id
         , CHG_DT                      = SYSDATE  
    WHERE  1=1
      AND  RNT_MST_ID  = v_Rnt_Mst_Id
      ;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0111;
  
  /*****************************************************************************
  -- 렌탈마스터 휴대폰 번호
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_GetRMMobNo (
      v_Rnt_Mst_Id                   IN RTCM0111.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
  ) RETURN VARCHAR IS 
  
  v_Mob_No RTCM0111.MOB_NO%TYPE;
  BEGIN

    SELECT MOB_NO
    INTO v_Mob_No
    FROM RTCM0111
    WHERE  1=1
      AND  RNT_MST_ID  = v_Rnt_Mst_Id
      ;

    RETURN v_Mob_No;

  END f_GetRMMobNo;
  
END Pkg_Rtcm0111;
/