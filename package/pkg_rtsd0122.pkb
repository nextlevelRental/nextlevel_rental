CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0122 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0122
    PURPOSE     가계약 상담정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2016-07-28  wjim            1. Created this package body.
    1.1     2016-09-20  wjim            재컨택일자,시간 추가
    1.2     2019-07-30  kstka           [20190730_1] 재렌탈가계약상담 테이블 재생성으로 인한
                                        컨택횟수, 재컨택일자, 재컨택시간 추가
*******************************************************************************/

  /*****************************************************************************
  -- 가계약 상담정보 Select
  *****************************************************************************/
  PROCEDURE p_sRTSD0122 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호            */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.PROVSN_NO            /* 가계약번호 */
         ,  A1.CALL_SEQ             /* 상담순번   */
         ,  A1.CALL_DAY             /* 상담일자   */
         ,  A1.CALL_TM              /* 상담시간   */
         ,  A1.CALL_DTL             /* 상담내용   */
         ,  A1.REG_ID               /* 등록자ID   */
         ,  to_char(A1.REG_DT,'YYYYMMDDHH24MISS') REG_DT    /* 등록일     */
         ,  A1.CHG_ID               /* 변경자ID   */
         ,  A1.CHG_DT               /* 변경일     */
         ,  A1.RECALL_DAY           /* 재컨택일자 */
         ,  A1.RECALL_TM            /* 재컨택시간 */
      FROM  RTSD0122 A1    
     WHERE  A1.PROVSN_NO = DECODE(v_Provsn_No, NULL, A1.PROVSN_NO, v_Provsn_No)
     ORDER BY A1.CALL_SEQ DESC
    ;

  END p_sRTSD0122;
  
  /*****************************************************************************
  -- 가계약 상담정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0122 (
      v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호 */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* 상담일자   */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* 상담시간   */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* 상담내용   */ 
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* 등록자ID   */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* 재컨택일자 */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* 재컨택시간 */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    INSERT  INTO RTSD0122 (
          PROVSN_NO
        , CALL_SEQ
        , CALL_DAY
        , CALL_TM
        , CALL_DTL
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
        , RECALL_DAY
        , RECALL_TM
    ) VALUES (
          v_Provsn_No
        , (
            SELECT  NVL2(MAX(CALL_SEQ), TO_NUMBER(MAX(CALL_SEQ))+1, 1) 
              FROM  RTSD0122
             WHERE  PROVSN_NO = v_Provsn_No         
          )
        , v_Call_Day
        , v_Call_Tm
        , v_Call_Dtl
        , v_Reg_Id
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
        , v_Recall_Day
        , v_Recall_Tm
    );

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRTSD0122;
  
  /*****************************************************************************
  -- 가계약 상담정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0122 (
      v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호 */      
    , v_Call_Seq        IN RTSD0122.CALL_SEQ%TYPE   /* 상담순번   */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* 상담일자   */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* 상담시간   */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* 상담내용   */ 
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* 등록자ID   */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* 재컨택일자 */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* 재컨택시간 */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTSD0122
       SET  CALL_DAY   = v_Call_Day
         ,  CALL_TM    = v_Call_Tm
         ,  CALL_DTL   = v_Call_Dtl
         ,  CHG_ID     = v_Reg_Id
         ,  CHG_DT     = SYSDATE
         ,  RECALL_DAY = v_Recall_Day
         ,  RECALL_TM  = v_Recall_Tm
     WHERE  PROVSN_NO  = v_Provsn_No
       AND  CALL_SEQ   = v_Call_Seq;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTSD0122;
  
  /*****************************************************************************
  -- 가계약 상담정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0122 (
      v_Comm_Dvsn       IN CHAR                     /* 처리구분(I,U,D) */
    , v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호      */
    , v_Call_Seq        IN RTSD0122.CALL_SEQ%TYPE   /* 상담순번        */
    , v_Call_Day        IN RTSD0122.CALL_DAY%TYPE   /* 상담일자        */
    , v_Call_Tm         IN RTSD0122.CALL_TM%TYPE    /* 상담시간        */
    , v_Call_Dtl        IN RTSD0122.CALL_DTL%TYPE   /* 상담내용        */   
    , v_Reg_Id          IN RTSD0122.REG_ID%TYPE     /* 등록자ID        */
    , v_Recall_Day      IN RTSD0122.RECALL_DAY%TYPE /* 재컨택일자      */
    , v_Recall_Tm       IN RTSD0122.RECALL_TM%TYPE  /* 재컨택시간      */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값 확인
    IF TRIM(v_Provsn_No) IS NULL THEN
        v_Return_Message := '가계약번호('||v_Provsn_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '등록자ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRTSD0122 (
              v_Provsn_No
            , v_Call_Day
            , v_Call_Tm
            , v_Call_Dtl 
            , v_Reg_Id
            , v_Recall_Day
            , v_Recall_Tm
            , v_ErrorText
        ) THEN
            v_Return_Message := '가계약상담정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        --[20190730_1]
        IF SUBSTR(v_Provsn_No, 0, 1) = 'R' THEN
            UPDATE RTSD0123 SET CALL_SEQ = (
                SELECT  NVL(MAX(CALL_SEQ), TO_NUMBER(MAX(CALL_SEQ))+1) 
                  FROM  RTSD0122
                 WHERE  PROVSN_NO = v_Provsn_No         
              )
              , RECALL_DAY = NVL(TRIM(v_Recall_Day), '00000000')
              , RECALL_TM = NVL(TRIM(v_Recall_Tm), '0000')
              , CHG_ID = v_Reg_Id
              , CHG_DT = SYSDATE
            WHERE PROVSN_NO = v_Provsn_No;
        END IF;
        
    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRTSD0122 (
              v_Provsn_No      
            , v_Call_Seq
            , v_Call_Day
            , v_Call_Tm
            , v_Call_Dtl 
            , v_Reg_Id
            , v_Recall_Day
            , v_Recall_Tm
            , v_ErrorText
        ) THEN
            v_Return_Message := '가계약상담정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        --[20190730_1]
        IF SUBSTR(v_Provsn_No, 0, 1) = 'R' THEN
            UPDATE RTSD0123 SET 
                RECALL_DAY = NVL(TRIM(v_Recall_Day), '00000000')
              , RECALL_TM = NVL(TRIM(v_Recall_Tm), '0000')
              , CHG_ID = v_Reg_Id
              , CHG_DT = SYSDATE
            WHERE PROVSN_NO = v_Provsn_No;
        END IF;
        
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;
     

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0122.p_IUDRtsd0122(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0122.p_IUDRtsd0122(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0122;


  /*****************************************************************************
  -- 재렌탈계약상담  Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0121Rental (
    v_Provsn_No       IN RTSD0122.PROVSN_NO%TYPE  /* 가계약번호      */
    ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0122
    WHERE  PROVSN_NO = v_Provsn_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.f_DeleteRtsd0121New(1)', '가계약번호', v_Provsn_No);

    RETURN SQLCODE;
  END f_DeleteRtsd0121Rental;
  
        
END Pkg_Rtsd0122;