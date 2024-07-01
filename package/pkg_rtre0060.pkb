CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0060 AS
/*******************************************************************************
   NAME      Pkg_Rtre0060
   PURPOSE   계좌신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계좌신청 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0060Count(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*계좌신청 발생구분   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,         /*계좌신청일          */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE          /*계좌신청순번        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day
    AND     ACRQ_SEQ = v_Acrq_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0060Count;

  /*****************************************************************************
  -- 계좌신청 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE        /*계좌신청일            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ACRQ_FG,                   /*계좌신청 발생구분   */
            A.ACRQ_DAY,                  /*계좌신청일          */
            A.ACRQ_SEQ,                  /*계좌신청순번        */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객코드            */
            A.BANK_CD,                   /*은행코드            */
            A.ACC_SEQ,                   /*계좌순번            */
            A.ACRQ_TP,                   /*계좌신청구분        */
            A.RPC_SEQ,                   /*결제변경요청순번    */
            A.ACRQ_ST,                   /*계좌신청 처리상태   */
            A.ACERCD,                    /*계좌신청 결과코드   */
            A.ACBRCD,                    /*계좌신청 점코드     */
            A.RQBRCD,                    /*취급 점코드         */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0060 A
    WHERE   A.ACRQ_FG  = DECODE(v_Acrq_Fg , NULL, A.ACRQ_FG , v_Acrq_Fg)
    AND     A.ACRQ_DAY = DECODE(v_Acrq_Day, NULL, A.ACRQ_DAY, v_Acrq_Day);

  END p_sRtre0060;

  /*****************************************************************************
  -- 계좌신청 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*은행코드              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*계좌개설 점코드       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*취급 점코드           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0060 (
            ACRQ_FG,
            ACRQ_DAY,
            ACRQ_SEQ,
            ORD_NO,
            CUST_NO,
            BANK_CD,
            ACC_SEQ,
            ACRQ_TP,
            RPC_SEQ,
            ACRQ_ST,
            ACERCD,
            ACBRCD,
            RQBRCD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Acrq_Fg,
            v_Acrq_Day,
            v_Acrq_Seq,
            v_Ord_No,
            v_Cust_No,
            v_Bank_Cd,
            v_Acc_Seq,
            v_Acrq_Tp,
            v_Rpc_Seq,
            v_Acrq_St,
            v_Acercd,
            v_Acbrcd,
            v_Rqbrcd,
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

  END f_InsertRtre0060;


  /*****************************************************************************
  -- 계좌신청 내역 Insert(ARS인증녹취포함)
  *****************************************************************************/
  FUNCTION f_InsertRtre0060RecData (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*은행코드              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*계좌개설 점코드       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*취급 점코드           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Txt_No         IN RTRE0060.TXT_NO%TYPE,         /*ARS인증 전문고유번호  */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0060 (
            ACRQ_FG,
            ACRQ_DAY,
            ACRQ_SEQ,
            ORD_NO,
            CUST_NO,
            BANK_CD,
            ACC_SEQ,
            ACRQ_TP,
            RPC_SEQ,
            ACRQ_ST,
            ACERCD,
            ACBRCD,
            RQBRCD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            TXT_NO
    ) VALUES (
            v_Acrq_Fg,
            v_Acrq_Day,
            v_Acrq_Seq,
            v_Ord_No,
            v_Cust_No,
            v_Bank_Cd,
            v_Acc_Seq,
            v_Acrq_Tp,
            v_Rpc_Seq,
            v_Acrq_St,
            v_Acercd,
            v_Acbrcd,
            v_Rqbrcd,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Txt_No
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0060RecData;
  
  /*****************************************************************************
  -- 계좌신청 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*은행코드              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*계좌개설 점코드       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*취급 점코드           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0060
    SET    ACRQ_FG  = v_Acrq_Fg,
           ACRQ_DAY = v_Acrq_Day,
           ACRQ_SEQ = v_Acrq_Seq,
           ORD_NO   = v_Ord_No,
           CUST_NO  = v_Cust_No,
           BANK_CD  = v_Bank_Cd,
           ACC_SEQ  = v_Acc_Seq,
           ACRQ_TP  = v_Acrq_Tp,
           RPC_SEQ  = v_Rpc_Seq,
           ACRQ_ST  = v_Acrq_St,
           ACERCD   = v_Acercd,
           ACBRCD   = V_Acbrcd,
           RQBRCD   = V_Rqbrcd,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ACRQ_FG  = v_Acrq_Fg
    AND    ACRQ_DAY = v_Acrq_Day
    AND    ACRQ_SEQ = v_Acrq_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060;

  /*****************************************************************************
  -- 계좌신청 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0060 (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day
    AND     ACRQ_SEQ = v_Acrq_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060(1)', 'v_Acrq_Fg', v_Acrq_Fg);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060(1)', 'v_Acrq_Day', v_Acrq_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060(1)', 'v_Acrq_Seq', v_Acrq_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060(1)', 'v_Reg_Id', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0060;


  /*****************************************************************************
  -- 계좌신청 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0060 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN OUT RTRE0060.ACRQ_SEQ%TYPE,   /*계좌신청순번          */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드              */
    v_Bank_Cd        IN RTRE0060.BANK_CD%TYPE,        /*은행코드              */
    v_Acc_Seq        IN RTRE0060.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분          */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Acbrcd         IN RTRE0060.ACBRCD%TYPE,         /*계좌개설 점코드       */
    v_Rqbrcd         IN RTRE0060.RQBRCD%TYPE,         /*취급 점코드           */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계좌신청 발생구분,계좌신청일,  계약번호,계좌순번,계좌신청구분,계좌신청 처리상태,계좌신청 결과코드, 등록자 ID
    IF TRIM(v_Acrq_Fg) IS NULL THEN
        v_Return_Message := '계좌신청 발생구분('||v_Acrq_Fg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Acrq_Day) IS NULL THEN
        v_Return_Message := '계좌신청일('||v_Acrq_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

--    IF TRIM(v_Cust_No) IS NULL THEN
--        v_Return_Message := '고객코드('||v_Cust_No||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;
--
--    IF TRIM(v_Acc_Seq) IS NULL THEN
--        v_Return_Message := '계좌순번('||v_Acc_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
--        RAISE e_Error;
--    END IF;

    IF TRIM(v_Bank_Cd) IS NULL THEN
        v_Return_Message := '은행코드('||v_Bank_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Acrq_Tp) IS NULL THEN
        v_Return_Message := '계좌신청구분('||v_Acrq_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Rpc_Seq) IS NULL THEN
        v_Return_Message := '결제변경요청순번('||v_Rpc_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Acrq_St) IS NULL THEN
        v_Return_Message := '계좌신청 처리상태('||v_Acrq_St||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Acercd) IS NULL THEN
        v_Return_Message := '계좌신청 결과코드('||v_Acercd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0060Count(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq) THEN
            v_Return_Message := '해당 계좌신청순번('||v_Acrq_Seq||')은 등록된 상태이므로 신규등록 처리 불가!!';
            RAISE e_Error;
        END IF;

        v_Acrq_Seq := f_sRtre0060AcrqSeq(v_Acrq_Fg, v_Acrq_Day);

        IF 0 != f_InsertRtre0060(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq, v_Ord_No,
                                 v_Cust_No, v_Bank_Cd, v_Acc_Seq, v_Acrq_Tp, v_Rpc_Seq,
                                 v_Acrq_St, v_Acercd, v_Acbrcd, v_Rqbrcd,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계좌신청 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;

    ELSE

        IF TRIM(v_Acrq_Seq) IS NULL THEN
            v_Return_Message := '계좌신청순번('||v_Acrq_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF 0 = f_sRtre0060Count(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq) THEN
            v_Return_Message := '해당 계좌신청순번('||v_Acrq_Seq||')은 미등록 상태이므로 처리(수정/삭제)불가!!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0060(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq, v_Ord_No,
                                     v_Cust_No, v_Bank_Cd, v_Acc_Seq, v_Acrq_Tp, v_Rpc_Seq,
                                     v_Acrq_St, v_Acercd, v_Acbrcd, v_Rqbrcd,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '계좌신청 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0060(v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '계좌신청 내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_IUDRtre0060(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_IUDRtre0060(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0060;

  /*****************************************************************************
  -- 계좌신청 내역 - 계좌신청순번췌번
  *****************************************************************************/
  FUNCTION f_sRtre0060AcrqSeq(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*계좌신청 발생구분   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE          /*계좌신청일          */
    ) RETURN NUMBER IS
    v_Acrq_Seq  RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL;    /*계좌신청순번        */
  BEGIN

    SELECT  NVL((SELECT  MAX(ACRQ_SEQ)
                 FROM    RTRE0060 B
                 WHERE   ACRQ_FG  = v_Acrq_Fg
                 AND     ACRQ_DAY = v_Acrq_Day)+ 1, 1)
    INTO    v_Acrq_Seq
    FROM    DUAL;

    RETURN v_Acrq_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0060AcrqSeq;



 /*****************************************************************************
  -- 수금관리 > CMS관리 > 계좌신청 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtreAccReq0060List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_From_Dt        IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일             */
    v_To_Dt          IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일             */
    v_Acrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*계좌신청구분           */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE,         /*계약번호               */
    v_Cust_No        IN RTRE0060.CUST_NO%TYPE,        /*고객코드               */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태      */
    v_Rpc_Uid        IN RTRE0050.RPC_UID%TYPE         /*결제변경요청자         */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,               /*계약번호          */
            A.CUST_NO,              /*고객코드          */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM, /*고객명  */
            B.CAR_NO,               /*차량번호          */
            C.RPC_DAY,              /*변경등록일        */
            D.BANK_CD,              /*은행코드          */
            D.ACCT_NO,              /*계좌번호          */
            D.CUST_NM  AS DEPOSITOR,/*예금주            */
            D.EBIR_DAY,             /*법정생년월일      */
            D.BUSL_NO,              /*사업자번호        */
            A.ACRQ_DAY,             /*신청일            */
            A.ACRQ_ST,              /*신청상태          */
            A.ACERCD,               /*오류내용(계좌신청결과코드)*/
            A.ACRQ_TP,              /*신청구분(계좌유형)*/
            C.AFPAY_DD AS PAY_DD,   /*결제일            */
            A.ACRQ_FG,              /*계좌신청발생구분  */
            C.RPC_UID               /*결제변경요청자    */
    FROM    RTRE0060 A,             /*계좌신청내역T     */
            RTSD0108 B,             /*장착정보T         */
            RTRE0050 C,             /*결제정보변경이력T */
            RTRE0010 D              /*고객계좌정보      */
    WHERE   A.ORD_NO   = B.ORD_NO
    AND     A.ACC_SEQ  = B.ACC_SEQ
    AND     A.ORD_NO   = C.ORD_NO
    AND     A.ACC_SEQ  = C.AFACC_SEQ
    AND     A.ACRQ_FG  = C.AFACRQ_FG
    AND     A.ACRQ_DAY = C.AFACRQ_DAY
    AND     A.ACRQ_SEQ = C.AFACRQ_SEQ
    AND     A.ACC_SEQ  = D.ACC_SEQ
    AND     A.ACRQ_DAY BETWEEN v_From_Dt AND v_To_Dt
    AND     (v_Acrq_Tp IS NULL OR A.ACRQ_TP =  v_Acrq_Tp)
    AND     A.ORD_NO   = DECODE(v_Ord_No  , NULL, A.ORD_NO,  v_Ord_No)
    AND     A.CUST_NO  = DECODE(v_Cust_No , NULL, A.CUST_NO, v_Cust_No)
    AND     (v_Acrq_St IS NULL OR A.ACRQ_ST =  v_Acrq_St)
    AND     NVL( C.RPC_UID, ' ')  = NVL( DECODE(v_Rpc_Uid , NULL, C.RPC_UID, v_Rpc_Uid), ' ')

    UNION ALL

    SELECT  A.ORD_NO,             /*계약번호          */
            A.CUST_NO,            /*고객코드          */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM, /*고객명  */
            B.CAR_NO,             /*차량번호          */
            C.RPC_DAY,            /*변경등록일        */
            D.BANK_CD,            /*은행코드          */
            D.ACCT_NO,            /*계좌번호          */
            D.CUST_NM  AS DEPOSITOR, /*예금주         */
            D.EBIR_DAY,           /*법정생년월일      */
            D.BUSL_NO,            /*사업자번호        */
            A.ACRQ_DAY,           /*신청일            */
            A.ACRQ_ST,            /*신청상태          */
            A.ACERCD,             /*오류내용(계좌신청결과코드)*/
            A.ACRQ_TP,            /*신청구분(계좌유형)*/
            C.BFPAY_DD  AS PAY_DD,/*결제일            */
            A.ACRQ_FG,            /*계좌신청발생구분  */
            C.RPC_UID             /*결제변경요청자    */
     FROM   RTRE0060 A,           /*계좌신청내역T    */
            RTSD0108 B,           /*장착정보T        */
            RTRE0050 C,           /*결제정보변경이력T*/
            RTRE0010 D            /*고객계좌정보     */
     WHERE  A.ORD_NO   = B.ORD_NO
     AND    A.ACC_SEQ  = B.ACC_SEQ
     AND    A.ORD_NO   = C.ORD_NO
     AND    A.ACC_SEQ  = C.BFACC_SEQ
     AND    A.ACRQ_FG  = C.BFACRQ_FG
     AND    A.ACRQ_DAY = C.BFACRQ_DAY
     AND    A.ACRQ_SEQ = C.BFACRQ_SEQ
     AND    A.ACC_SEQ  = D.ACC_SEQ
     AND    A.ACRQ_DAY BETWEEN v_From_Dt AND v_To_Dt
     AND    (v_Acrq_Tp IS NULL OR A.ACRQ_TP =  v_Acrq_Tp)
     AND    A.ORD_NO   = DECODE(v_Ord_No  , NULL, A.ORD_NO,  v_Ord_No)
     AND    A.CUST_NO  = DECODE(v_Cust_No , NULL, A.CUST_NO, v_Cust_No)
     AND    (v_Acrq_St IS NULL OR A.ACRQ_ST =  v_Acrq_St)
     AND    NVL( C.RPC_UID, ' ')  = NVL( DECODE(v_Rpc_Uid , NULL, C.RPC_UID, v_Rpc_Uid), ' ');

  END p_sRtreAccReq0060List;

 /*****************************************************************************
  -- 수금관리 > CMS관리 > 계좌신청처리 >  [STEP2] 계좌신청대상조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060AccReqTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*계좌신청일자          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    v_cnt1   NUMBER DEFAULT 0;
    v_cnt2   NUMBER DEFAULT 0;
    v_cnt3   NUMBER DEFAULT 0;
    v_Extrc_Yn VARCHAR(1);
    v_Confi_Yn VARCHAR(1);
    v_Fcret_Yn VARCHAR(1);
    v_Ftran_Yn VARCHAR(1);
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.ACRQ_DAY,                                                         /*계좌신청일*/
            A.ACRQ_TP,                                                         /*계좌신청구분*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R015', A.ACRQ_TP) AS ACRQ_TP_NM,/*계좌신청구분명*/
            A.BANK_CD,                                                         /*은행코드*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R001', A.BANK_CD) AS BANK_NM,   /*은행명*/
            A.CNT ROW_CNT                                                      /*건수*/
            FROM (SELECT C.ACRQ_DAY,
            C.ACRQ_TP,
            B.BANK_CD,
            COUNT (*) CNT
    FROM    RTRE0060 C,
            RTRE0010 B
    WHERE   C.ACRQ_FG  = 'A' -- 회사접수
    AND     C.ACRQ_DAY = v_Acrq_Day
    AND     B.ACC_SEQ  = C.ACC_SEQ
    GROUP   BY C.ACRQ_DAY, C.ACRQ_TP, B.BANK_CD) A;

    SELECT  COUNT (*)
    INTO    v_cnt1  -- 조회카운트1
    FROM    RTRE0060 C, RTRE0010 B
    WHERE   C.ACRQ_FG  = 'A' -- 회사접수
    AND     C.ACRQ_DAY = v_Acrq_Day
    AND     B.ACC_SEQ  = C.ACC_SEQ;

    SELECT  COUNT (ACRQ_DAY)
    INTO    v_cnt2  -- 조회카운트2
    FROM    RTRE0060
    WHERE   ACRQ_FG  = 'A' -- 회사접수
    AND     ACRQ_DAY = v_Acrq_Day;

     IF v_cnt1 <>  v_cnt2 THEN
        v_Success_code := -1;
        v_Return_Message := '대상건수에 문제가 있습니다. 시스템 담당자에게 확인하세요.';
     ELSIF v_cnt1 =  v_cnt2 THEN

        SELECT  COUNT (*)
        INTO    v_cnt3
        FROM    RTRE0099
        WHERE   FILE_TP  = 'EB13'
        AND     RQST_DAY = v_Acrq_Day
        AND     FILE_NM  = 'EB13' || SUBSTR (v_Acrq_Day, 5, 4)
        AND     DEL_YN   = 'N';

        IF v_cnt3 = 0 THEN
            v_Success_code := -1;
            v_Return_Message := '결제신청 대상없음(RTRE0099). 시스템 담당자에게 확인하세요.';
        ELSE

            SELECT  EXTRC_YN,
                    CONFI_YN,
                    FCRET_YN,
                    FTRAN_YN
            INTO    v_Extrc_Yn,
                    v_Confi_Yn,
                    v_Fcret_Yn,
                    v_Ftran_Yn
            FROM    RTRE0099
            WHERE   FILE_TP  = 'EB13'
            AND     RQST_DAY = v_Acrq_Day
            AND     FILE_NM  = 'EB13' || SUBSTR (v_Acrq_Day, 5, 4)
            AND     DEL_YN   = 'N';

            --EXTRC_YN(대상집계여부)/CONFI_YN(대상확인여부)/FCRET_YN(파일생성여부)/FTRAN_YN(파일전송여부)
            IF  v_Extrc_Yn  = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상집계가 완료 되지 않았습니다.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상집계 완료, 대상확인 하시기 바랍니다.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상확인 완료, 파일생성 하시기 바랍니다.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '파일생성 완료, 전송완료 하시기 바랍니다.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'Y' THEN
              v_Success_code := 0;
              v_Return_Message := '계좌신청 처리 완료 되었습니다.';
            ELSE
              v_Success_code := -1;
              v_Return_Message := '시스템 담당자에게 확인하세요.';
            END IF;
         END IF;
     END IF;

  END p_sRtre0060AccReqTargetList;

  /*****************************************************************************
  -- 수금관리 > CMS관리 > 계좌신청 결과 반영 조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0060AccResultList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,        /*계좌신청일자          */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,         /*작업구분(신청구분)     */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    v_cnt1      NUMBER DEFAULT 0;
    v_cnt2      NUMBER DEFAULT 0;
    v_cnt3      NUMBER DEFAULT 0;
    v_Extrc_Yn  VARCHAR(1);
    v_Confi_Yn  VARCHAR(1);
    v_Fcret_Yn  VARCHAR(1);
    v_Ftran_Yn  VARCHAR(1);
    v_Job_Gubun VARCHAR2(10);
  BEGIN
    --회사접수분
    IF v_Acrq_Fg = 'A' THEN
      v_Job_Gubun := 'EB14';
    END IF;
    --은행접수분
    IF v_Acrq_Fg = 'B' THEN
      v_Job_Gubun := 'EB11';
    END IF;

    OPEN Ref_Cursor FOR
    SELECT  A.ACRQ_DAY,                                                          /*계좌신청일*/
            A.ACRQ_TP,                                                           /*계좌신청구분*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R015', A.ACRQ_TP) AS ACRQ_TP_NM,  /*계좌신청구분명*/
            A.BANK_CD,                                                           /*은행코드*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R001', A.BANK_CD) AS BANK_NM,     /*은행명*/
            A.ACRQ_ST,                                                           /*신청결과*/
            PKG_RTCM0051.F_SRTCM0051CODENAME ('R009', A.ACRQ_ST) AS ACRQ_ST_NM,  /*신청결과명*/
            A.CNT ROW_CNT                                                        /*건수*/
    FROM    (
            SELECT  C.ACRQ_DAY, C.ACRQ_TP, B.BANK_CD,
                    C.ACRQ_ST, COUNT (*) AS CNT
            FROM    RTRE0060 C,
                    RTRE0010 B
            WHERE   'A'  = v_Acrq_Fg
            AND     C.ACRQ_FG  = v_Acrq_Fg
            AND     C.ACRQ_DAY = v_Acrq_Day
            AND     B.ACC_SEQ  = C.ACC_SEQ(+)
            GROUP   BY C.ACRQ_DAY, C.ACRQ_TP, B.BANK_CD, C.ACRQ_ST, C.ACRQ_ST
            UNION
            SELECT  C.ACRQ_DAY, C.ACRQ_TP, C.BANK_CD,
                    C.ACRQ_ST, COUNT (*) AS CNT
            FROM    RTRE0060 C
            WHERE   'B'  = v_Acrq_Fg
            AND     C.ACRQ_FG  = v_Acrq_Fg
            AND     C.ACRQ_DAY = v_Acrq_Day
            GROUP   BY C.ACRQ_DAY, C.ACRQ_TP, C.BANK_CD, C.ACRQ_ST, C.ACRQ_ST

            ) A;

     IF v_Acrq_Fg = 'A' THEN
        SELECT  COUNT (*)
        INTO    v_cnt1 --조회카운트1
        FROM    RTRE0060 C,
                RTRE0010 B
        WHERE   C.ACRQ_FG  = v_Acrq_Fg
        AND     C.ACRQ_DAY = v_Acrq_Day
        AND     B.ACC_SEQ  = C.ACC_SEQ(+);

        SELECT  COUNT (ACRQ_DAY)
        INTO    v_cnt2 --조회카운트2
        FROM    RTRE0060
        WHERE   ACRQ_FG  = v_Acrq_Fg
        AND     ACRQ_DAY = v_Acrq_Day;
     END IF;

     IF v_cnt1 <>  v_cnt2 THEN
        v_Success_code := -1;
        v_Return_Message := '대상건수에 문제가 있습니다. 시스템 담당자에게 확인하세요.';
     ELSIF v_cnt1 =  v_cnt2 THEN

        SELECT  COUNT (*)
        INTO    v_cnt3
        FROM    RTRE0099
        WHERE   FILE_TP  = v_JOB_GUBUN
        AND     RQST_DAY = v_Acrq_Day
        AND     FILE_NM  = v_JOB_GUBUN || SUBSTR (v_Acrq_Day, 5, 4)
        AND     DEL_YN   = 'N';

        IF v_cnt3 = 0 THEN
            v_Success_code := -1;
            v_Return_Message := '결제신청 대상없음(RTRE0099). 시스템 담당자에게 확인하세요.';
        ELSE

            SELECT  EXTRC_YN,
                    CONFI_YN,
                    FCRET_YN,
                    FTRAN_YN
            INTO    v_Extrc_Yn,
                    v_Confi_Yn,
                    v_Fcret_Yn,
                    v_Ftran_Yn
            FROM    RTRE0099
            WHERE   FILE_TP  = v_Job_Gubun
            AND     RQST_DAY = v_Acrq_Day
            AND     FILE_NM  = v_JOB_GUBUN || SUBSTR (v_Acrq_Day, 5, 4)
            AND     DEL_YN   = 'N';

            --EXTRC_YN(대상집계여부)/CONFI_YN(대상확인여부)/FCRET_YN(파일생성여부)/FTRAN_YN(파일전송여부)
            IF  v_Extrc_Yn  = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상집계가 완료 되지 않았습니다.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상집계 완료, 대상확인 하시기 바랍니다.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '대상확인 완료, 파일생성 하시기 바랍니다.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN
              v_Success_code := 0;
              v_Return_Message := '파일생성 완료, 전송완료 하시기 바랍니다.';
            ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'Y' THEN
              v_Success_code := 0;
              v_Return_Message := '계좌신청 처리 완료 되었습니다.';
            ELSE
              v_Success_code := -1;
              v_Return_Message := '시스템 담당자에게 확인하세요.';
            END IF;
         END IF;
     END IF;

  END p_sRtre0060AccResultList;

  /*****************************************************************************
  -- 계좌신청 내역 관리 - RE-020201_계좌신청 대상집계
  *****************************************************************************/
  PROCEDURE p_InsertRtre0060Aggregate (
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Fr_Rpc_Day     IN VARCHAR,                      /*결제정보 변경시작일자 */
    v_To_Rpc_Day     IN VARCHAR,                      /*결제정보 변경종료일자 */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*송수신파일구분      */
    v_Rqst_Day  RTRE0099.RQST_DAY%TYPE DEFAULT NULL;/*요청일자            */
    v_File_Nm   RTRE0099.FILE_NM%TYPE DEFAULT NULL; /*파일명              */
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;/*파일순번            */

    v_Acrq_Cnt   RTRE0099.ACRQ_CNT%TYPE DEFAULT NULL;  /*계좌신청건수          */
    v_Accnrq_Cnt RTRE0099.ACCNRQ_CNT%TYPE DEFAULT NULL;/*계좌해지건수          */

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:계좌신청일,결제정보 변경시작일자 , 등록자 ID
    IF 0 != ISDATE(v_Acrq_Day) THEN
        v_Return_Message := '계좌신청일('||v_Acrq_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Fr_Rpc_Day) THEN
        v_Return_Message := '결제정보 변경시작일자('||v_Fr_Rpc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_To_Rpc_Day) THEN
        v_Return_Message := '결제정보 변경종료일자('||v_To_Rpc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 초기값 설정
    v_File_Tp  := 'EB13';
    v_File_Nm  := v_File_Tp||SUBSTR(v_Acrq_Day, 5, 4);
    v_Rqst_Day := v_Acrq_Day;

    -- 1. 기준일자 기준으로 대상집계 내역이 존재하는지 확인하고 존재하면 오류로 종료처리하고 오류메시지 제공
    IF 0 != Pkg_Rtre0099.f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') THEN
        v_Return_Message := '해당 기준일자로 대상집계 파일('||v_File_Nm||')이 이미 존재하므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 송수신파일구분/요청일자/파일명 기준  파일순번 획득
    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);

    -- 2. 기준일자 기준으로 대상집계 내역 존재하지 않는 경우 송수신 작업( RTRE0099)에 데이터 생성
    IF 0 != Pkg_Rtre0099.f_InsertRtre0099 (
                v_File_Tp   ,        /*(File_Tp  )송수신파일구분    */
                v_Rqst_Day  ,        /*(Rqst_Day )요청일자          */
                v_File_Nm   ,        /*(File_Nm  )파일명            */
                v_File_Seq  ,        /*(File_Seq )파일순번          */
                NULL,                /*(File_Data)파일데이터        */
                'N',                 /*(Extrc_Yn )대상집계여부      */
                'N',                 /*(Confi_Yn )대상확인여부      */
                'N',                 /*(Fcret_Yn )파일생성여부      */
                'N',                 /*(Ftran_Yn )파일전송여부      */
                NULL,                /*(Stdex_Dd )결제일이체기준    */
                v_Fr_Rpc_Day,        /*(Str_Day  )집계대상 시작일   */
                v_To_Rpc_Day,        /*(End_Day  )집계대상 종료일   */
                'N',                 /*(Header_Yn)HEADER 존재여부   */
                'N',                 /*(Trailer_Y)TRAILER 존재여부  */
                0,                   /*(Tdata_Cnt)데이터 총건수     */
                0,                   /*(Tdata_Amt)데이터 총금액     */
                0,                   /*(Acrq_Cnt )계좌신청건수      */
                0,                   /*(Accnrq_Cn)계좌해지건수      */
                0,                   /*(Rmcnrq_Cn)계좌임의해지건수  */
                0,                   /*(Reqst_Cnt)요청건수          */
                0,                   /*(Reqst_Amt)요청금액          */
                0,                   /*(Cncrq_Cnt)취소요청건수      */
                0,                   /*(Cncrq_Amt)취소요청금액      */
                0,                   /*(Srecp_Cnt)정상결제 처리건수 */
                0,                   /*(Srecp_Amt)정상결제 처리금액 */
                0,                   /*(Hsrcp_Cnt)부분결제 처리건수 */
                0,                   /*(Hsrcp_Amt)부분결제 처리금액 */
                0,                   /*(Erecp_Cnt)결제실패 처리건수 */
                0,                   /*(Erecp_Amt)결제실패 처리금액 */
                0,                   /*(Scnrq_Cnt)취소정상 처리건수 */
                0,                   /*(Scnrq_Amt)취소정상 처리금액 */
                0,                   /*(Ecnrq_Cnt)취소오류 처리건수 */
                0,                   /*(Ecnrq_Amt)취소오류 처리금액 */
                'N',                 /*(Del_Yn   )삭제여부          */
                v_Reg_Id,            /*(Reg_Id   )등록자 ID         */
                v_ErrorText
                ) THEN

        v_Return_Message := ' 송수신 작업(RTRE0099) Insert 실패!!!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 3. 결제정보 변경 대상 기준 계좌신청 내역 생성 및 송순신작업 데이터 업데이트
    p_InsertRtre0060Batch(v_Acrq_Day, v_Fr_Rpc_Day, v_To_Rpc_Day, v_Reg_Id, v_Acrq_Cnt, v_Accnrq_Cnt,
                          v_Success_Code, v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '결제정보 변경 대상 기준 계좌신청 내역 생성 및 송순신작업 데이터 업데이트 실패!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;

    -- 송수신 작업 Update - 계좌신정 대상 배치 결과 업데이트
    IF 0 !=Pkg_Rtre0099.f_UpdateRtre0099BatchResult (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                                     'Y',  v_Acrq_Cnt, v_Accnrq_Cnt, 0, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '송수신 작업 Update - 계좌신정 대상 배치 결과 업데이트 실패!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;
    
    -- 초기값 설정
    v_File_Tp  := 'EI13';
    v_File_Nm  := v_File_Tp||SUBSTR(v_Acrq_Day, 5, 4);

    -- 1. 기준일자 기준으로 대상집계 내역이 존재하는지 확인하고 존재하면 오류로 종료처리하고 오류메시지 제공
    IF 0 != Pkg_Rtre0099.f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') THEN
        v_Return_Message := '해당 기준일자로 대상집계 파일('||v_File_Nm||')이 이미 존재하므로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- 송수신파일구분/요청일자/파일명 기준  파일순번 획득
    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);

    -- 2. 기준일자 기준으로 대상집계 내역 존재하지 않는 경우 송수신 작업( RTRE0099)에 데이터 생성
    IF 0 != Pkg_Rtre0099.f_InsertRtre0099 (
                v_File_Tp   ,        /*(File_Tp  )송수신파일구분    */
                v_Rqst_Day  ,        /*(Rqst_Day )요청일자          */
                v_File_Nm   ,        /*(File_Nm  )파일명            */
                v_File_Seq  ,        /*(File_Seq )파일순번          */
                NULL,                /*(File_Data)파일데이터        */
                'N',                 /*(Extrc_Yn )대상집계여부      */
                'N',                 /*(Confi_Yn )대상확인여부      */
                'N',                 /*(Fcret_Yn )파일생성여부      */
                'N',                 /*(Ftran_Yn )파일전송여부      */
                NULL,                /*(Stdex_Dd )결제일이체기준    */
                v_Fr_Rpc_Day,        /*(Str_Day  )집계대상 시작일   */
                v_To_Rpc_Day,        /*(End_Day  )집계대상 종료일   */
                'N',                 /*(Header_Yn)HEADER 존재여부   */
                'N',                 /*(Trailer_Y)TRAILER 존재여부  */
                0,                   /*(Tdata_Cnt)데이터 총건수     */
                0,                   /*(Tdata_Amt)데이터 총금액     */
                0,                   /*(Acrq_Cnt )계좌신청건수      */
                0,                   /*(Accnrq_Cn)계좌해지건수      */
                0,                   /*(Rmcnrq_Cn)계좌임의해지건수  */
                0,                   /*(Reqst_Cnt)요청건수          */
                0,                   /*(Reqst_Amt)요청금액          */
                0,                   /*(Cncrq_Cnt)취소요청건수      */
                0,                   /*(Cncrq_Amt)취소요청금액      */
                0,                   /*(Srecp_Cnt)정상결제 처리건수 */
                0,                   /*(Srecp_Amt)정상결제 처리금액 */
                0,                   /*(Hsrcp_Cnt)부분결제 처리건수 */
                0,                   /*(Hsrcp_Amt)부분결제 처리금액 */
                0,                   /*(Erecp_Cnt)결제실패 처리건수 */
                0,                   /*(Erecp_Amt)결제실패 처리금액 */
                0,                   /*(Scnrq_Cnt)취소정상 처리건수 */
                0,                   /*(Scnrq_Amt)취소정상 처리금액 */
                0,                   /*(Ecnrq_Cnt)취소오류 처리건수 */
                0,                   /*(Ecnrq_Amt)취소오류 처리금액 */
                'N',                 /*(Del_Yn   )삭제여부          */
                v_Reg_Id,            /*(Reg_Id   )등록자 ID         */
                v_ErrorText
                ) THEN

        v_Return_Message := ' 송수신 작업(RTRE0099) Insert 실패!!!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 송수신 작업 Update - 계좌신정 대상 배치 결과 업데이트
    IF 0 !=Pkg_Rtre0099.f_UpdateRtre0099BatchResult (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                                     'Y',  v_Acrq_Cnt, v_Accnrq_Cnt, 0, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '송수신 작업 Update - 계좌신정 대상 배치 결과 업데이트 실패!!!'||'-'||v_Return_Message;
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_InsertRtre0060Aggregate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_InsertRtre0060Aggregate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0060Aggregate;

  /*****************************************************************************
  -- 계좌신청 내역 관리 - 계좌신청 대상집계 일괄 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0060Batch (
    v_Acrq_Day       IN  RTRE0060.ACRQ_DAY%TYPE,      /*계좌신청일            */
    v_Fr_Rpc_Day     IN  VARCHAR,                     /*결제정보 변경시작일자 */
    v_To_Rpc_Day     IN  VARCHAR,                     /*결제정보 변경종료일자 */
    v_Reg_Id         IN  RTRE0060.REG_ID%TYPE,        /*등록자 ID             */
    v_Acrq_Cnt       OUT RTRE0099.ACRQ_CNT%TYPE,      /*계좌신청건수          */
    v_Accnrq_Cnt     OUT RTRE0099.ACCNRQ_CNT%TYPE,    /*계좌해지건수          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 계좌해지건
    CURSOR  Cur_Terminate IS
    SELECT  '3'  ACRQ_TP, ORD_NO, BFCUST_NO, BFACC_SEQ, RPC_SEQ, BFACRQ_ST
    FROM    RTRE0050
    WHERE   RPC_DAY BETWEEN v_Fr_Rpc_Day AND v_To_Rpc_Day
    AND     BFPAY_MTHD  = 'A'
    AND     BFACRQ_ST   = '6'
    AND     DEL_YN      = 'N'
    AND     BFACC_SEQ IS NOT NULL;

    -- 계좌신청건
--    CURSOR  Cur_Application IS
--    SELECT  '1' ACRQ_TP, ORD_NO, AFCUST_NO, AFACC_SEQ, RPC_SEQ, AFACC_STAT, AFACRQ_ST
--    FROM    RTRE0050
--    WHERE   RPC_DAY BETWEEN v_Fr_Rpc_Day AND v_To_Rpc_Day
--    AND     AFPAY_MTHD  = 'A'
--    AND     AFACC_STAT  = '0'
--    AND     AFACRQ_ST   = '0'
--    AND     DEL_YN      = 'N'
--    AND     AFACC_SEQ IS NOT NULL;
    
    CURSOR  Cur_Application IS
    SELECT  '1' ACRQ_TP, A.ORD_NO, A.AFCUST_NO, A.AFACC_SEQ, A.RPC_SEQ, A.AFACC_STAT, A.AFACRQ_ST, C.TXT_NO
      FROM  RTRE0050 A
         ,  RTRE0010 B
         ,  (
                SELECT  ROW_NUMBER() OVER (PARTITION BY X.CUST_NM, X.BANK_CD, X.ACCT_NO ORDER BY X.REG_DT DESC) AS ROW_NUM
                     ,  X.*
                  FROM  RTRE0013 X
                 WHERE  RSLT_CD = '0000'                     
            ) C
     WHERE  A.RPC_DAY BETWEEN v_Fr_Rpc_Day AND v_To_Rpc_Day  
       AND  A.AFPAY_MTHD  = 'A'
       AND  A.AFACC_STAT  = '0'
       AND  A.AFACRQ_ST   = '0'
       AND  A.DEL_YN      = 'N'
       AND  A.AFACC_SEQ  IS NOT NULL
       AND  A.AFACC_SEQ   = B.ACC_SEQ
--       AND  B.CUST_NM     = C.CUST_NM
       AND  B.BANK_CD     = C.BANK_CD
       AND  B.ACCT_NO     = C.ACCT_NO
       AND  C.ROW_NUM     = 1;                          /*가장최근 인증건     */


    v_Acrq_Seq   RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL;   /*계좌신청순번        */
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;    /*계좌신청 처리상태   */
    v_Bank_Cd    RTRE0060.BANK_CD%TYPE DEFAULT NULL;    /*은행코드            */

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;      -- 데이타 존재여부
  BEGIN

    -- 데이터 초기화
    v_Acrq_Cnt := 0;
    v_Accnrq_Cnt := 0;
    v_Acrq_St := '2';           -- 결제정보 변경이력상 대상집계시 전송으로 적용


    -- 계좌해지건 데이터 처리
    FOR CUR IN Cur_Terminate LOOP
        EXIT WHEN Cur_Terminate%NOTFOUND;
        v_Acrq_Cnt := v_Acrq_Cnt+1;

        -- 계좌신청순번 획득
        v_Acrq_Seq := f_sRtre0060AcrqSeq('A', v_Acrq_Day);

        -- 은행코드회득
        v_Bank_Cd := Pkg_Rtre0010.f_sRtre0010BankCd( CUR.BFACC_SEQ );

        -- 계좌신청내역 생성
        IF 0!= f_InsertRtre0060 (
                      'A',            /*(Acrq_Fg )계좌신청 발생구분     */
                      v_Acrq_Day,     /*(Acrq_Day)계좌신청일            */
                      v_Acrq_Seq,     /*(Acrq_Seq)계좌신청순번          */
                      CUR.ORD_NO,     /*(Ord_No  )계약번호              */
                      CUR.BFCUST_NO,  /*(Cust_No )고객코드              */
                      v_Bank_Cd,      /*(Bank_Cd )은행코드              */
                      CUR.BFACC_SEQ,  /*(Acc_Seq )계좌순번              */
                      CUR.ACRQ_TP,    /*(Acrq_Tp )계좌신청구분          */
                      CUR.RPC_SEQ,    /*(Rpc_Seq )결제변경요청순번      */
                      CUR.BFACRQ_ST,  /*(Acrq_St )계좌신청 처리상태     */
                      NULL,           /*(Acercd  )계좌신청 결과코드     */
                      NULL,           /*(v_Acbrcd)계좌개설 점코드       */
                      NULL,           /*(v_Rqbrcd)취급 점코드           */
                      v_Reg_Id,       /*(Reg_Id  )등록자 ID             */
                      v_ErrorText
                      ) THEN
            v_Return_Message := '계좌해지건 계좌신청 내역 등록중 에러 발생!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;


        -- 결제정보변경이력(RTRQ0050)에 계좌신청 발생구분, 계좌신청일, 계좌신청순번 업데이트
        IF 0!= Pkg_Rtre0050.f_UpdateRtre0050Terminate(CUR.RPC_SEQ, 'A', v_Acrq_Day, v_Acrq_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계좌해지건 결제정보변경이력(RTRQ0050)에 계좌신청 발생구분, 계좌신청일, 계좌신청순번 업데이트 실패!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값(변경전) Update
        IF 0!= Pkg_Rtre0050.f_UpdateRtre0050BeforeResult (CUR.RPC_SEQ, v_Acrq_St, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값 Update 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END LOOP;


    IF Cur_Terminate%ISOPEN THEN
        CLOSE Cur_Terminate;
    END IF;

    -- 계좌신청건 데이터 처리
    FOR CUR IN Cur_Application LOOP
        EXIT WHEN Cur_Application%NOTFOUND;
        v_Accnrq_Cnt := v_Accnrq_Cnt+1;

        -- 계좌신청순번 획득
        v_Acrq_Seq := f_sRtre0060AcrqSeq('A', v_Acrq_Day);

        -- 은행코드회득
        v_Bank_Cd := Pkg_Rtre0010.f_sRtre0010BankCd( CUR.AFACC_SEQ );

        -- 계좌신청내역 생성
        IF 0!= f_InsertRtre0060RecData (
                      'A',             /*(Acrq_Fg    )계좌신청 발생구분     */
                      v_Acrq_Day,      /*(Acrq_Day   )계좌신청일            */
                      v_Acrq_Seq,      /*(Acrq_Seq   )계좌신청순번          */
                      CUR.ORD_NO,      /*(Ord_No     )계약번호              */
                      CUR.AFCUST_NO,   /*(Cust_No    )고객코드              */
                      v_Bank_Cd,       /*(Bank_Cd    )은행코드              */
                      CUR.AFACC_SEQ,   /*(Acc_Seq    )계좌순번              */
                      CUR.ACRQ_TP,     /*(Acrq_Tp    )계좌신청구분          */
                      CUR.RPC_SEQ,     /*(Rpc_Seq    )결제변경요청순번      */
                      CUR.AFACRQ_ST,   /*(Acrq_St    )계좌신청 처리상태     */
                      NULL,            /*(Acercd     )계좌신청 결과코드     */
                      NULL,            /*(v_Acbrcd   )계좌개설 점코드       */
                      NULL,            /*(v_Rqbrcd   )취급 점코드           */
                      v_Reg_Id,        /*(Reg_Id     )등록자 ID             */
                      CUR.TXT_NO,      /*(Txt_No     )전문고유번호          */
                      v_ErrorText
                      ) THEN
            v_Return_Message := '계좌신청건 계좌신청 내역 등록중 에러 발생!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 결제정보변경이력(RTRQ0050)에 계좌신청 발생구분, 계좌신청일, 계좌신청순번 업데이트
        IF 0!= Pkg_Rtre0050.f_UpdateRtre0050Application(CUR.RPC_SEQ, 'A', v_Acrq_Day, v_Acrq_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계좌신청건 결제정보변경이력(RTRQ0050)에 계좌신청 발생구분, 계좌신청일, 계좌신청순번 업데이트 실패!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;

        -- 결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값(변경후) Update
        IF 0!= Pkg_Rtre0050.f_UpdateRtre0050AfterResult (CUR.RPC_SEQ, CUR.AFACC_STAT, v_Acrq_St, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '결제정보 변경이력(RTRE0050)에 계좌신청 결과처리 상태값 Update 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    END LOOP;

    IF Cur_Application%ISOPEN THEN
        CLOSE Cur_Application;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_InsertRtre0060Batch(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.p_InsertRtre0060Batch(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0060Batch;


  /*****************************************************************************
  -- 계좌신청 내역(RTRE0060) Update - 계좌신청처리 상태를 변경
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0060
    SET    ACRQ_ST  = v_Acrq_St,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ACRQ_FG  = v_Acrq_Fg
    AND    ACRQ_DAY = v_Acrq_Day;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060AcrqSt;

  /*****************************************************************************
  -- 계좌신청 내역 Count - 계약번호 포함 존재여부 확인
  *****************************************************************************/
  FUNCTION f_sRtre0060OrdCount(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,          /*계좌신청 발생구분   */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,         /*계좌신청일          */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,         /*계좌신청순번        */
    v_Ord_No         IN RTRE0060.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day
    AND     ACRQ_SEQ = v_Acrq_Seq
    AND     ORD_NO   = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0060OrdCount;


  /*****************************************************************************
  -- 계좌신청 내역(RTRE0060) Update - 계좌신청처리구분 기준 계좌신청처리 상태를 변경
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqTpSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    --계좌신청구분(ACRQ_TP - R015) 1이면 3, 3이면 7, 7이면 7, 그외는 에러처리(에러처리를 위해 강제로 자릿수(1) 에러 발생시킴)
    UPDATE RTRE0060
    SET    ACRQ_ST   = DECODE(ACRQ_TP, '1', '3', '3', '7', '7', '999'),
           ACERCD    = v_Acercd,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACRQ_FG   = v_Acrq_Fg
    AND    ACRQ_DAY  = v_Acrq_Day
    AND    ACRQ_SEQ  = v_Acrq_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060AcrqTpSt;


  /*****************************************************************************
  -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결과코드 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqcdSt (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0060
    SET    ACRQ_ST   = v_Acrq_St,
           ACERCD    = v_Acercd,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACRQ_FG   = v_Acrq_Fg
    AND    ACRQ_DAY  = v_Acrq_Day
    AND    ACRQ_SEQ  = v_Acrq_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060AcrqcdSt;

  /*****************************************************************************
  -- 계좌신청 내역(RTRE0060) Update - 계좌신청 처리상태와 결제변경요청순번 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtre0060AcrqStRpcSeq (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Acrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,       /*계좌신청순번          */
    v_Acrq_St        IN RTRE0060.ACRQ_ST%TYPE,        /*계좌신청 처리상태     */
    v_Acercd         IN RTRE0060.ACERCD%TYPE,         /*계좌신청 결과코드     */
    v_Rpc_Seq        IN RTRE0060.RPC_SEQ%TYPE,        /*결제변경요청순번      */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0060
    SET    ACRQ_ST   = v_Acrq_St,
           ACERCD    = v_Acercd,
           RPC_SEQ   = v_Rpc_Seq,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ACRQ_FG   = v_Acrq_Fg
    AND    ACRQ_DAY  = v_Acrq_Day
    AND    ACRQ_SEQ  = v_Acrq_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0060AcrqStRpcSeq;


  /*****************************************************************************
  -- 계좌신청 내역 Delete - 계좌신청 발생구분, 계좌신청일 기준 모두 삭제
  *****************************************************************************/
  FUNCTION f_DeleteRtre0060All (
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,       /*계좌신청일            */
    v_Reg_Id         IN RTRE0060.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060All(1)', 'v_Acrq_Fg', v_Acrq_Fg);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060All(1)', 'v_Acrq_Day', v_Acrq_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0060.f_DeleteRtre0060All(1)', 'v_Reg_Id', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0060All;


  /*****************************************************************************
  -- 계좌신청 내역 - 계약번호 포함 존재여부 확인
  *****************************************************************************/
  FUNCTION f_sRtre0060AcrqSt(
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Acrq_Day       IN RTRE0060.ACRQ_DAY%TYPE        /*계좌신청일            */
    ) RETURN VARCHAR IS
    v_Acrq_St   RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;   /*계좌신청 처리상태     */
  BEGIN

    SELECT  ACRQ_ST
    INTO    v_Acrq_St
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Acrq_Day;

    RETURN v_Acrq_St;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0060AcrqSt;

END Pkg_Rtre0060;
/
