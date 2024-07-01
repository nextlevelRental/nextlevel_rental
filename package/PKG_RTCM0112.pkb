CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0112 AS
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
  PROCEDURE p_sRtcm0112 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Rnt_Mst_Id      IN RTCM0112.RNT_MST_ID%TYPE
    ) IS
  BEGIN
  
    OPEN Ref_Cursor FOR
--    SELECT  NVL2(A.RNT_MST_ID, '1', '0') CHK
--         , A.RNT_MST_ID               /* 렌탈마스터 ID   */            
--         , B.AGENCY_CD                /* 대리점코드   */
--         , B.AGENCY_NM                /* 대리점명 */
--         , B.USE_YN                   /* 대리점 사용여부*/
--      FROM RTCM0112 A
--          ,RTSD0007 B         
--     WHERE 1=1
--        AND A.AGENCY_CD(+) = B.AGENCY_CD
--        AND A.RNT_MST_ID(+) = v_Rnt_Mst_Id 
--        AND ((A.RNT_MST_ID IS NULL AND  B.USE_YN = 'Y') OR (A.RNT_MST_ID IS NOT NULL))   
 
     SELECT NVL2(B.RNT_MST_ID, '1', '0') AS CHK
          , A.AGENCY_CD
          , A.AGENCY_NM
          , B.RNT_MST_ID
        FROM (
             SELECT * 
                FROM RTSD0007
                WHERE 1=1
                 AND (RENTAL_GROUP, RENTAL_OFFICE) 
                     IN (SELECT RNT_OFC
                              , RNT_PNT 
                            FROM RTCM0110 
                            WHERE RNT_MST_ID = v_Rnt_Mst_Id)
        ) A, RTCM0112 B
        WHERE 1=1
        AND A.AGENCY_CD = B.AGENCY_CD(+)
        AND B.RNT_MST_ID(+) = v_Rnt_Mst_Id
        ORDER BY A.AGENCY_CD
     ;
       
  END p_sRtcm0112;
      
  /*****************************************************************************
  -- 렌탈마스터정보입력(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0112 (
      v_Comm_Dvsn                    IN CHAR                                        /*처리구분(I,U,D)      */
    , v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*대리점코드             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*등록자 ID             */
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

        IF 0 != f_InsertRtcm0112(
              v_Rnt_Mst_Id
            , v_Agency_Cd  
            , v_Reg_Id         
            , v_ErrorText
        ) THEN
            v_Return_Message := '렌탈 마스터 정보 등록 실패!!!'||'-'||v_ErrorText || '[' || v_Rnt_Mst_Id || '::' || v_Agency_Cd || ']';
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn IN ('U') THEN
            
        IF 0 != f_UpdateRtcm0112(
              v_Rnt_Mst_Id
            , v_Agency_Cd  
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '렌탈 마스터 정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
    ELSIF v_Comm_Dvsn IN ('D') THEN
        
        IF 0 != f_DeleteRtcm0112(
              v_Rnt_Mst_Id
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

  END p_IUDRtcm0112;
   
  /*****************************************************************************
  -- 렌탈마스터정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtcm0112 (
      v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*대리점 코드             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTCM0112 (
          RNT_MST_ID
        , AGENCY_CD
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    ) VALUES (
          v_Rnt_Mst_Id
        , v_Agency_Cd 
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

  END f_InsertRtcm0112;
  
  /*****************************************************************************
  -- 렌탈마스터 정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-10-05  kstka            [20221005_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0112 (
      v_Rnt_Mst_Id                   IN RTCM0112.RNT_MST_ID%TYPE                    /*렌탈마스터 사번           */
    , v_Agency_Cd                    IN RTCM0112.AGENCY_CD%TYPE                     /*대리점코드             */
    , v_Reg_Id                       IN RTCM0112.REG_ID%TYPE                        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS 
  BEGIN

    UPDATE RTCM0112
       SET AGENCY_CD                   = v_Agency_Cd
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

  END f_UpdateRtcm0112;
  
  /*****************************************************************************
  -- 렌탈마스터 정보 관리(DELETE)
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0112 (
    v_Rnt_Mst_Id     IN RTCM0112.RNT_MST_ID%TYPE,
    v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
        
        e_Error EXCEPTION;
        
        v_CNT  NUMBER;
    BEGIN
        BEGIN
              
            DELETE
              FROM RTCM0112
             WHERE RNT_MST_ID = v_Rnt_Mst_Id;

        EXCEPTION
          WHEN OTHERS THEN
            RAISE e_Error;
        END;
        
        RETURN SQLCODE;
        

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
    END f_DeleteRtcm0112;
    
END Pkg_Rtcm0112;
/