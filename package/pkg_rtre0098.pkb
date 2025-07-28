CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0098 AS
/*******************************************************************************
   NAME      Pkg_Rtre0098
   PURPOSE   파일 송수신 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 파일 송수신 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0098Count(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,          /*파일명              */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE           /*ROW 순번            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0098
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     ROW_SEQ  = v_Row_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0098Count;

  /*****************************************************************************
  -- 파일 송수신 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0098 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW 순번              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*파일내용              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.RQST_DAY,                  /*요청일자            */
            A.FILE_NM,                   /*파일명              */
            A.ROW_SEQ,                   /*ROW 순번            */
            A.FILE_TP,                   /*송수신 파일구분     */
            A.FILE_SEQ,                  /*파일 순번           */
            A.ROW_DATA,                  /*파일내용            */
            A.DEL_YN,                    /*삭제여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0098 A
    WHERE   A.RQST_DAY = v_Rqst_Day
    AND     A.FILE_NM  = DECODE(v_File_Nm , NULL, A.FILE_NM , v_File_Nm)
    AND     A.ROW_SEQ  = DECODE(v_Row_Seq , NULL, A.ROW_SEQ , v_Row_Seq)
    AND     A.FILE_TP  = DECODE(v_File_Tp , NULL, A.FILE_TP , v_File_Tp)
    AND     A.FILE_SEQ = DECODE(v_File_Seq, NULL, A.FILE_SEQ, v_File_Seq)
    AND     A.ROW_DATA = DECODE(v_Row_Data, NULL, A.ROW_DATA, v_Row_Data)
    AND     A.DEL_YN   = DECODE(v_Del_Yn  , NULL, A.DEL_YN  , v_Del_Yn)
    AND     A.REG_ID   = DECODE(v_Reg_Id  , NULL, A.REG_ID  , v_Reg_Id)
    ORDER   BY A.RQST_DAY, A.FILE_NM, A.ROW_SEQ;

  END p_sRtre0098;
  
  
  /*****************************************************************************
  -- 파일 송수신 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW 순번              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*파일내용              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Rqst_Day,
            v_File_Nm,
            v_Row_Seq,
            v_File_Tp,
            v_File_Seq,
            v_Row_Data,
            v_Del_Yn,
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

  END f_InsertRtre0098;
  
  
  /*****************************************************************************
  -- 파일 송수신 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW 순번              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*파일내용              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0098
    SET    FILE_TP  = v_File_Tp,
           FILE_SEQ = v_File_Seq,
           ROW_DATA = v_Row_Data,
           DEL_YN   = v_Del_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RQST_DAY = v_Rqst_Day
    AND    FILE_NM  = v_File_Nm
    AND    ROW_SEQ  = v_Row_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0098;

  /*****************************************************************************
  -- 파일 송수신 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW 순번              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0098
    SET    DEL_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RQST_DAY = v_Rqst_Day
    AND    FILE_NM  = v_File_Nm
    AND    ROW_SEQ  = v_Row_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0098;

  /*****************************************************************************
  -- 파일 송수신 내역 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0098 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Row_Seq        IN OUT RTRE0098.ROW_SEQ%TYPE,    /*ROW 순번              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*파일내용              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 요청일자,파일명, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Nm) IS NULL THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN
        
        v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
        IF 0 != f_InsertRtre0098(v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                 v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '파일 송수신 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0098Count(v_Rqst_Day, v_File_Nm, v_Row_Seq) THEN
            v_Return_Message := '해당 정보('||v_Rqst_Day||','||v_File_Nm||','||v_Row_Seq||')로 등록된 데이터가 없으므로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0098(v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                     v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '파일 송수신 내역 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0098(v_Rqst_Day, v_File_Nm, v_Row_Seq, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '파일 송수신 내역 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_IUDRtre0098(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_IUDRtre0098(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0098;

  /*****************************************************************************
  -- 파일 송수신 내역 - 요청일자/파일명 기준 ROW 순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0098RowSeq(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,         /*요청일자            */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE           /*파일명              */
    ) RETURN NUMBER IS
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;     /*ROW 순번            */
  BEGIN

    SELECT  NVL((SELECT  MAX(ROW_SEQ)
                FROM    RTRE0098
                WHERE   RQST_DAY       = v_Rqst_Day
                AND     FILE_NM        = v_File_Nm
                )+ 1, 1)  AS ROW_SEQ    
    INTO    v_Row_Seq
    FROM    DUAL;

    RETURN v_Row_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0098RowSeq;
  

  /*****************************************************************************
  -- 파일 송수신 내역 - 계좌신청인증 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EI13Batch (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE       /*요청일자              */
    , v_File_Nm        IN RTRE0098.FILE_NM%TYPE        /*파일명                */
    , v_Reg_Id         IN RTRE0098.REG_ID%TYPE         /*등록자 ID             */
    , v_Crlf_Yn        OUT VARCHAR                     /*CRLF여부              */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS    
    -- 계좌신청내역
    -- -수정 시 아래 개수조회 쿼리도 수정필요!
    CURSOR  Cur_Rtre0060 IS 
    SELECT  A.ACRQ_DAY    /*신청일            */
         ,  A.ACRQ_SEQ    /*계좌신청순번      */
         ,  A.ACRQ_TP     /*계좌신청구분      */
         ,  A.ORD_NO      /*계약번호          */
         ,  B.CUST_TP     /*고객유형          */
         ,  DECODE(B.CUST_TP, '01', B.EBIR_DAY,'02',B.BUSL_NO) EBIR_BUSL
         ,  B.BANK_CD     /*은행코드          */
         ,  B.ACCT_NO     /*계좌번호          */
         ,  B.EBIR_DAY    /*법정생년월일      */
         ,  B.BUSL_NO     /*사업자번호        */
         ,  A.ACRQ_ST     /*신청상태          */
         ,  A.TXT_NO      /*녹취파일명         */
      FROM  RTRE0060 A    /*계좌신청내역T     */
         ,  RTRE0010 B    /*고객계좌정보T     */
     WHERE  A.ACRQ_FG  = 'A'
       AND  A.ACRQ_TP  = '1'
       AND  A.ACRQ_DAY = v_Rqst_Day
       AND  A.ACC_SEQ  = B.ACC_SEQ
     ORDER  BY A.ACRQ_FG, A.ACRQ_DAY, A.ACRQ_SEQ;

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                     /*데이타 존재여부       */
    
    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT NULL;   /*송수신파일구분        */
    v_File_Seq   RTRE0098.FILE_SEQ%TYPE DEFAULT NULL;  /*파일 순번             */
    v_Row_Seq    RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW 순번              */
    v_Row_Data   RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*파일내용              */
    v_Del_Yn     RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*삭제여부              */
    v_Fr_Rpc_Day RTRE0099.STR_DAY%TYPE DEFAULT NULL;   /*대상집계 시작일       */
    v_To_Rpc_Day RTRE0099.END_DAY%TYPE DEFAULT NULL;   /*대상집계 종료일       */
    v_Company_Cd VARCHAR(10) DEFAULT NULL;             /*기관코드              */ 
    v_Tdata_Cnt  NUMBER DEFAULT 0;                     /*DATA RECORD COUNT     */
    v_Rec_Byte   NUMBER DEFAULT 0;                     /*Record Byte 크기      */
    v_Rec_Seq    NUMBER DEFAULT 0;                     /*Record 일련번호       */    
    
  BEGIN

    -- 필수값: 요청일자,파일명, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    v_File_Tp := 'EI13';
    
    --  송수신처리 내역(1건) 기준 기존 송신 파일 내역 CLEAR
    FOR cur IN (
        SELECT  A.FILE_TP                   /*송수신 파일구분  */
             ,  A.FILE_SEQ                  /*파일 순번        */
          FROM  RTRE0099 A                  /*송수신 작업T     */
         WHERE  A.FILE_TP   = 'EI13'        /*송수신파일구분   */
           AND  A.RQST_DAY  = v_Rqst_Day
           AND  A.FILE_NM   = v_File_Nm  
           AND  A.DEL_YN    = 'N'  
           AND  A.EXTRC_YN  = 'Y'
--           AND  A.CONFI_YN  = 'Y'
           AND  A.FTRAN_YN  = 'N'
    ) LOOP
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        v_File_Tp   := cur.FILE_TP;
        v_File_Seq  := cur.FILE_SEQ;
        
        dbms_output.put_line('v_Tdata_Cnt = ['||v_Tdata_Cnt||']');
    
        -- 송신 파일 내역 체크 (RTRE0098)    
        IF 0 < f_sRtre0098CountCheck(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq) THEN
     
            -- 내역 존재시 DEL_YN 업데이트  
            IF 0 != f_Delete0098FileClear(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기존 송신 파일 내역('||v_Rqst_Day||'-'||v_File_Nm||'-'||cur.FILE_TP||'-'||cur.FILE_SEQ||') 삭제 실패. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;
    END LOOP;   
             
    -- 송수신처리 내역확인 ( RTRE0099 )  
    IF 1 != v_Tdata_Cnt THEN
        v_Return_Message := '(1)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;

--    -- 송수신파일구분/요청일자/파일명 기준  파일순번 획득
--    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
--    
--    -- 대상집계 시작일, 종료일 획득
--    SELECT  STR_DAY, END_DAY
--      INTO  v_Fr_Rpc_Day, v_To_Rpc_Day
--      FROM  RTRE0099
--     WHERE  FILE_TP  = 'EB13'
--       AND  RQST_DAY = v_Rqst_Day
--       AND  DEL_YN   = 'N';
--    
--    -- 기준일자 기준으로 대상집계 내역 존재하지 않는 경우 송수신 작업( RTRE0099)에 데이터 생성
--    IF 0 != Pkg_Rtre0099.f_InsertRtre0099 (
--                v_File_Tp   ,        /*(File_Tp  )송수신파일구분    */
--                v_Rqst_Day  ,        /*(Rqst_Day )요청일자          */
--                v_File_Nm   ,        /*(File_Nm  )파일명            */
--                v_File_Seq  ,        /*(File_Seq )파일순번          */
--                NULL,                /*(File_Data)파일데이터        */
--                'Y',                 /*(Extrc_Yn )대상집계여부      */
--                'Y',                 /*(Confi_Yn )대상확인여부      */
--                'N',                 /*(Fcret_Yn )파일생성여부      */
--                'N',                 /*(Ftran_Yn )파일전송여부      */
--                NULL,                /*(Stdex_Dd )결제일이체기준    */
--                v_Fr_Rpc_Day,        /*(Str_Day  )집계대상 시작일   */
--                v_To_Rpc_Day,        /*(End_Day  )집계대상 종료일   */
--                'N',                 /*(Header_Yn)HEADER 존재여부   */
--                'N',                 /*(Trailer_Y)TRAILER 존재여부  */
--                0,                   /*(Tdata_Cnt)데이터 총건수     */
--                0,                   /*(Tdata_Amt)데이터 총금액     */
--                0,                   /*(Acrq_Cnt )계좌신청건수      */
--                0,                   /*(Accnrq_Cn)계좌해지건수      */
--                0,                   /*(Rmcnrq_Cn)계좌임의해지건수  */
--                0,                   /*(Reqst_Cnt)요청건수          */
--                0,                   /*(Reqst_Amt)요청금액          */
--                0,                   /*(Cncrq_Cnt)취소요청건수      */
--                0,                   /*(Cncrq_Amt)취소요청금액      */
--                0,                   /*(Srecp_Cnt)정상결제 처리건수 */
--                0,                   /*(Srecp_Amt)정상결제 처리금액 */
--                0,                   /*(Hsrcp_Cnt)부분결제 처리건수 */
--                0,                   /*(Hsrcp_Amt)부분결제 처리금액 */
--                0,                   /*(Erecp_Cnt)결제실패 처리건수 */
--                0,                   /*(Erecp_Amt)결제실패 처리금액 */
--                0,                   /*(Scnrq_Cnt)취소정상 처리건수 */
--                0,                   /*(Scnrq_Amt)취소정상 처리금액 */
--                0,                   /*(Ecnrq_Cnt)취소오류 처리건수 */
--                0,                   /*(Ecnrq_Amt)취소오류 처리금액 */
--                'N',                 /*(Del_Yn   )삭제여부          */
--                v_Reg_Id,            /*(Reg_Id   )등록자 ID         */
--                v_ErrorText
--    ) THEN                        
--        v_Return_Message := ' 송수신 작업(RTRE0099) Insert 실패!!!'||'-'||v_ErrorText;
--        RAISE e_Error;
--    END IF;    

    -- 기관코드(이용기관식별코드)
    v_Company_Cd := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    
    -- 작업개수(Cur_Rtre0060 과 동일한 쿼리 사용해야 함!)
    SELECT  COUNT(*)
      INTO  v_Tdata_Cnt
      FROM  RTRE0060 A  /*계좌신청내역T     */
         ,  RTRE0010 B  /*고객계좌정보T     */
     WHERE  A.ACRQ_FG  = 'A'
       AND  A.ACRQ_TP  = '1'
       AND  A.ACRQ_DAY = v_Rqst_Day
       AND  A.ACC_SEQ  = B.ACC_SEQ
     ORDER  BY A.ACRQ_FG, A.ACRQ_DAY, A.ACRQ_SEQ;
    
    -- 송신전문 Header Record 구성
    v_Row_Data := 'AE1112'                                  /*업무구분코드(고정)           6 byte*/
               || '11'                                      /*Record구분(고정)             2 byte*/
               || '0000000'                                 /*일련번호(고정)               7 byte*/
               || v_Rqst_Day                                /*신청일(파일명 날자와 동일)   8 byte*/
               || RPAD(NVL(TRIM(v_Company_Cd),' '),20,' ')  /*이용기관식별코드            20 byte*/
               || LPAD(v_Tdata_Cnt,7,'0')                   /*총증빙자료개수               7 byte*/
               || RPAD(' ',974,' ');                        /*FILLER(고정)               974 byte*/

    v_Rec_Byte := LENGTHB(v_Row_Data);
    
    --  송신전문 Header Record Size 검증
    IF v_Rec_Byte != 6+2+7+8+20+7+974 THEN
        v_Return_Message := '해당 파일('||v_Rqst_Day||'-'||v_File_Nm||') Header Record 사이즈('||v_Rec_Byte||')가 유효하지 않습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF; 
    
    -- 송신전문 Header Record 생성용 요청일자/파일명 기준 ROW 순번 획득
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);    
    
    -- 송신전문 Header Record - 파일 송수신 내역 Insert
    IF 0 != f_InsertRtre0098(v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' 송신전문 Header Record 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 송신전문 Data Record 구성
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;
        
        v_Rec_Seq  := v_Rec_Seq + 1;
        
        v_Row_Data := 'AE1112'                                  /*업무구분코드(고정)           6 byte*/
                   || '22'                                      /*Record구분(고정)             2 byte*/
                   || LPAD(v_Rec_Seq, 7, '0')                   /*일련번호                     7 byte*/
                   || RPAD(' ',10,' ')                          /*FILLER(고정)                10 byte*/
                   || RPAD(NVL(TRIM(v_Company_Cd),' '),20,' ')  /*이용기관식별코드            20 byte*/
                   || RPAD(NVL(CUR.ORD_NO,' '),30,' ')          /*납부자번호                  30 byte*/
                   || LPAD(NVL(CUR.BANK_CD,' '),3,'0')          /*참가기관(은행)코드           3 byte*/
                   || RPAD(NVL(CUR.ACCT_NO,' '),20,' ')         /*계좌번호                    20 byte*/
                   || v_Rqst_Day                                /*신청일                       8 byte*/
                   || '5'                                       /*증빙자료 구분(5=ARS)         1 byte*/
                   || 'mp3  '                                   /*증빙자료 확장자              5 byte*/
                   || '<' || trim(CUR.TXT_NO) || '>';           /*증빙 녹취파일명 (전문양식 아님)    */
                   /*
                    * 이후 전문은 Java에서 생성
                    * - 증빙자료 길이(Byte)          7 byte
                    * - 증빙자료 Binary Data         n byte
                    * - FILLER                       n byte
                    */                    

        v_Rec_Byte := LENGTHB(v_Row_Data);
                              
        --  송신전문 Data Record Size 검증
--        IF MOD(v_Rec_Byte,1024) != 0 THEN
--            v_Return_Message := '해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')DATA RECORD 사이즈('||v_Rec_Byte||')가 유효하지 않습니다. 관리자에게 확인하세요!!.';
--            RAISE e_Error;
--        END IF;
        
        -- 송신전문 Data Record 생성용  요청일자/파일명 기준 ROW 순번 획득
        v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);        
      
        -- 송신전문 Data Record - 파일 송수신 내역 Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := ' 송신전문 DATA RECORD 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
    
    END LOOP;       

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;
    
    -- 송신전문 Trailer Record 구성
    v_Row_Data := 'AE1112'                                  /*업무구분코드(고정)                               6 byte*/
               || '33'                                      /*Record구분(고정)                                 2 byte*/
               || '9999999'                                /*일련번호(고정)                                   7 byte*/
               || RPAD(NVL(TRIM(v_Company_Cd),' '),20,' ')  /*이용기관식별코드                                20 byte*/
               || LPAD(v_Tdata_Cnt,7,'0');                  /*총Data Record수(Header의 총증빙자료개수와 동일)  7 byte*/               
               /*
                * 이후 Trailer Record 부분은 java에서 생성
                * - 총Data Block수  10 byte
                * - FILLER(고정)   972 byte
                */

    v_Rec_Byte := LENGTHB(v_Row_Data);
    
    --  송신전문 Trailer Record Size 검증
    IF v_Rec_Byte != 6+2+7+20+7 THEN
        v_Return_Message := '(4)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')Tail RECORD 사이즈('||v_Rec_Byte||')가 유효하지 않습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
    
    -- 송신전문 Trailer Record 생성용  요청일자/파일명 기준 ROW 순번 획득
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    -- 송신전문 Trailer Record - 파일 송수신 내역 Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' 송신전문 Tail RECORD 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 송수신 건수 업데이트
    IF 0 !=Pkg_Rtre0099.f_UpdateRtre0099BatchResult (
        v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, 'Y', v_Tdata_Cnt, 0, 0, v_Reg_Id, v_ErrorText
    ) THEN
        v_Return_Message := '송수신 작업 UPDATE - 송수신 건수 업데이트 실패!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;
    
    -- 송수신 처리내역 업데이트 (RTRE0099 )
    IF 0 != Pkg_Rtre0099.f_UpdateRtre0099FileResult (
        v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,'Y', 'Y', 'Y', v_Tdata_Cnt, v_Reg_Id,v_ErrorText
    ) THEN
        v_Return_Message := ' 송수신 처리내역(RTRE0099) 업데이트 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 6. 계좌신청 내역 상태 업데이트 (전송중)
--    UPDATE  RTRE0060
--       SET  ACRQ_ST  = '2'
--     WHERE  ACRQ_FG  = 'A'
--       AND  ACRQ_TP  = '1'
--       AND  ACRQ_DAY = v_Rqst_Day;
        
    v_Crlf_Yn := 'N';
   
    -- 파일 송수신 내역 Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EI13Batch(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EI13Batch(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098EI13Batch;
  
  /*****************************************************************************
  -- 파일 송수신 내역 - 계좌신청처리 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB13Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    -- 송수신처리 내역 
    CURSOR  Cur_Rtre0099 IS 
    SELECT  A.FILE_TP,   /*송수신 파일구분  */
            A.FILE_SEQ   /*파일 순번        */
    FROM    RTRE0099 A   /*송수신 작업T     */
    WHERE   A.FILE_TP   = 'EB13' /*송수신파일구분 */
    AND     A.RQST_DAY  = v_Rqst_Day
    AND     A.FILE_NM   = v_File_Nm  
    AND     A.DEL_YN    = 'N'  
    AND     A.EXTRC_YN  = 'Y'
    AND     A.CONFI_YN  = 'Y'
    AND     A.FTRAN_YN  = 'N';
    
    -- 계좌신청내역
    CURSOR  Cur_Rtre0060 IS 
    SELECT  A.ACRQ_DAY, /*신청일            */
            A.ACRQ_SEQ, /*계좌신청순번      */
            A.ACRQ_TP,  /*계좌신청구분      */
            A.ORD_NO,   /*계약번호          */
            B.CUST_TP,  /*고객유형          */
            DECODE(B.CUST_TP, '01', B.EBIR_DAY,'02',B.BUSL_NO) EBIR_BUSL,
            B.BANK_CD,  /*은행코드          */
            B.ACCT_NO,  /*계좌번호          */
            B.EBIR_DAY, /*법정생년월일      */
            B.BUSL_NO,  /*사업자번호        */
            A.ACRQ_ST   /*신청상태          */
    FROM    RTRE0060 A, /*계좌신청내역T     */
            RTRE0010 B  /*고객계좌정보T     */
    WHERE   A.ACRQ_FG  = 'A'
    AND     A.ACRQ_DAY = v_Rqst_Day
    AND     A.ACC_SEQ  = B.ACC_SEQ
    ORDER   BY A.ACRQ_FG, A.ACRQ_DAY, A.ACRQ_SEQ;   
    

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                  /* 데이타 존재여부    */
    
    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*송수신파일구분      */
    v_File_Seq  RTRE0098.FILE_SEQ%TYPE DEFAULT NULL;/*파일 순번           */
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL; /*ROW 순번            */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;/*파일내용            */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';   /*삭제여부            */
    v_Company_Cd VARCHAR(10) DEFAULT NULL;          /*기관코드            */ 
    v_Tdata_Cnt  NUMBER DEFAULT 0;                  /*DATA RECORD COUNT   */
    v_App_Cnt    NUMBER DEFAULT 0;                  /*계좌신청건수        */
    v_Ter_Cnt    NUMBER DEFAULT 0;                  /*계좌해지건수        */
    v_Ran_Cnt    NUMBER DEFAULT 0;                  /*임의해지건수        */
    
  BEGIN

    -- 필수값: 요청일자,파일명, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
   
    --  송수신처리 내역(1건) 기준 기존 송신 파일 내역 CLEAR
    FOR CUR IN Cur_Rtre0099 LOOP
        EXIT WHEN Cur_Rtre0099%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        v_File_Tp  := CUR.FILE_TP;
        v_File_Seq := CUR.FILE_SEQ;
    
        -- 2. 송신 파일 내역 체크 ( RTRE0098 )    
        IF 0 < f_sRtre0098CountCheck(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq) THEN
     
            -- 2-1) 내역 존재시 DEL_YN 업데이트  
            IF 0 != f_Delete0098FileClear(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기존 송신 파일 내역('||v_Rqst_Day||'-'||v_File_Nm||'-'||CUR.FILE_TP||'-'||CUR.FILE_SEQ||') 삭제 실패. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;
            
    END LOOP;       
    
    -- 1. 송수신처리 내역확인 ( RTRE0099 )  
    IF 1 != v_Tdata_Cnt THEN
        v_Return_Message := '(1)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
    
    
    IF Cur_Rtre0099%ISOPEN THEN
        CLOSE Cur_Rtre0099;
    END IF;
    
    -- 4. 파일 내역 생성 ( RTRE0098 )
        
    -- 기관코드(이용기관식별코드)
    v_Company_Cd := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    
    -- 송신전문 Header Record 구성
    v_Row_Data := 'H' ||
                  '00000000' ||
                  RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                  RPAD(v_File_Nm,8,' ') ||
                  RPAD(SUBSTR(v_Rqst_Day,3),6,' ') ||
                  RPAD(' ',87, ' ');
    
    --  송신전문 Header Record Size 검증
    IF LENGTHB(v_Row_Data) != 1+8+10+8+6+87 THEN
        v_Return_Message := '(2)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
 
    
    -- 송신전문 Header Record 생성용 요청일자/파일명 기준 ROW 순번 획득
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    
    -- 송신전문 Header Record - 파일 송수신 내역 Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' 송신전문 HEADER RECORD 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 송신전문 Data Record 구성
    v_Tdata_Cnt := 0;
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;                       
        
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        
        -- 송신전문 Data Record 구성
        v_Row_Data := 'R' ||
                      LPAD(CUR.ACRQ_SEQ,8,'0') ||
                      RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||                      
                      RPAD(SUBSTR(CUR.ACRQ_DAY,3),6,' ') ||
                      RPAD(NVL(CUR.ACRQ_TP,' '),1,' ') ||                
                      RPAD(NVL(CUR.ORD_NO,' '),20,' ') ||
                      RPAD(NVL(CUR.BANK_CD,' '),7,'0') ||
                      RPAD(NVL(CUR.ACCT_NO,' '),16,' ') ||
                      RPAD(NVL(CUR.EBIR_BUSL,' '),16,' ') ||                      
                      RPAD(' ',4, ' ')||
                      RPAD(' ',2, ' ')||
                      RPAD(' ',1, ' ')||
                      RPAD(' ',4, ' ')||
                      RPAD(' ',1, ' ')||
                      RPAD(' ',12, ' ')||
                      RPAD(' ',11, ' ');
                      
        --  송신전문 Data Record Size 검증
        IF LENGTHB(v_Row_Data) != 1+8+10+6+1+20+7+16+16+4+2+1+4+1+12+11 THEN
            v_Return_Message := '(3)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
            RAISE e_Error;
        END IF;
        
        -- 송신전문 Data Record 생성용  요청일자/파일명 기준 ROW 순번 획득
        v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
        
      
        -- 송신전문 Data Record - 파일 송수신 내역 Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := ' 송신전문 HEADER RECORD 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF CUR.ACRQ_TP = '1' THEN
            v_App_Cnt := v_App_Cnt+1; /*계좌신청건수*/
        ELSIF CUR.ACRQ_TP = '3' THEN    
            v_Ter_Cnt := v_Ter_Cnt+1; /*계좌해지건수*/
        ELSIF CUR.ACRQ_TP = '7' THEN  
            v_Ran_Cnt := v_Ran_Cnt+1; /*임의해지건수*/
        END IF;
    
    END LOOP;       

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;
    
    -- 송신전문 Trailer Record 구성
    v_Row_Data := 'T' ||
                  '99999999' ||
                  RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                  RPAD(v_File_Nm,8,' ') ||
                  LPAD(v_Tdata_Cnt,8,'0') ||
                  LPAD(v_App_Cnt,8,'0') ||
                  LPAD('0',8,'0') ||
                  LPAD(v_Ter_Cnt,8,'0') ||
                  LPAD(v_Ran_Cnt,8,'0') ||
                  RPAD(' ',43, ' ')||
                  RPAD(' ',10, ' ');
                  
    --  송신전문 Trailer Record Size 검증
    IF LENGTH(v_Row_Data) != 1+8+10+8+8+8+8+8+8+43+10 THEN
        v_Return_Message := '(4)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
    
    -- 송신전문 Trailer Record 생성용  요청일자/파일명 기준 ROW 순번 획득
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    -- 송신전문 Trailer Record - 파일 송수신 내역 Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' 송신전문 HEADER RECORD 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 5. 송수신 처리내역 업데이트 (RTRE0099 )
    IF 0 != Pkg_Rtre0099.f_UpdateRtre0099FileResult (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, 
                                                     'Y', 'Y', 'Y', v_Tdata_Cnt, v_Reg_Id, 
                                                     v_ErrorText) THEN
        v_Return_Message := ' 송수신 처리내역(RTRE0099) 업데이트 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 6. 계좌신청 내역 상태 업데이트 (전송중)
    UPDATE RTRE0060
    SET ACRQ_ST = '2'
    WHERE   ACRQ_FG  = 'A'
    AND     ACRQ_DAY = v_Rqst_Day;
        
    v_Crlf_Yn := 'N';
   
    -- 파일 송수신 내역 Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
    
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EB13Batch(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EB13Batch(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098EB13Batch;

  /*****************************************************************************
  -- 파일 송수신 내역 - 계좌신청처리 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB12Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    -- 송수신처리 내역 
    CURSOR  Cur_Rtre0099 IS 
    SELECT  A.FILE_TP,   /*송수신 파일구분  */
            A.FILE_SEQ   /*파일 순번        */
    FROM    RTRE0099 A   /*송수신 작업T     */
    WHERE   A.FILE_TP   = 'EB12' /*송수신파일구분 */
    AND     A.RQST_DAY  = v_Rqst_Day
    AND     A.FILE_NM   = v_File_Nm  
    AND     A.DEL_YN    = 'N'  
    AND     A.EXTRC_YN  = 'Y'
    AND     A.CONFI_YN  = 'Y'
    AND     A.FTRAN_YN  = 'N';
    
    -- 계좌신청내역
    CURSOR  Cur_Rtre0060 IS 
    SELECT  A.ACRQ_DAY, /*신청일            */
            A.ACRQ_SEQ, /*계좌신청순번      */
            A.ACRQ_TP,  /*계좌신청구분      */
            A.ORD_NO,   /*계약번호          */
            B.CUST_TP,  /*고객유형          */
            DECODE(B.CUST_TP, '01', B.EBIR_DAY,'02',B.BUSL_NO) EBIR_BUSL,
            B.BANK_CD,  /*은행코드          */
            B.ACCT_NO,  /*계좌번호          */
            B.EBIR_DAY, /*법정생년월일      */
            B.BUSL_NO,  /*사업자번호        */
            A.ACRQ_ST,  /*신청상태          */
            A.ACERCD,   /*계좌신청 결과코드 */
            A.ACBRCD,   /*계좌개설 점코드   */
            A.RQBRCD    /*취급 점코드       */
    FROM    RTRE0060 A, /*계좌신청내역T     */
            RTRE0010 B  /*고객계좌정보T     */
    WHERE   A.ACRQ_FG  = 'B'
    AND     A.ACRQ_DAY = v_Rqst_Day
    AND     A.ACRQ_ST IN ('3', '7') -- 오류내역만
    AND     A.ACC_SEQ  = B.ACC_SEQ
    ORDER   BY A.ACRQ_FG, A.ACRQ_DAY, A.ACRQ_SEQ;   
    

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;      -- 데이타 존재여부
    
    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*송수신파일구분      */
    v_File_Seq  RTRE0098.FILE_SEQ%TYPE DEFAULT NULL;/*파일 순번           */
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL; /*ROW 순번            */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;/*파일내용            */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';   /*삭제여부            */
    v_Company_Cd VARCHAR(10) DEFAULT NULL;          /*기관코드            */ 
    v_Tdata_Cnt NUMBER DEFAULT 0;                   /*DATA RECORD COUNT   */
    v_App_Cnt NUMBER DEFAULT 0;                     /*계좌신청건수        */
    v_Ter_Cnt NUMBER DEFAULT 0;                     /*계좌해지건수        */
    v_Ran_Cnt NUMBER DEFAULT 0;                     /*임의해지건수        */
    
  BEGIN

    -- 필수값: 요청일자,파일명, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
   
    --  송수신처리 내역(1건) 기준 기존 송신 파일 내역 CLEAR
    FOR CUR IN Cur_Rtre0099 LOOP
        EXIT WHEN Cur_Rtre0099%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        v_File_Tp  := CUR.FILE_TP;
        v_File_Seq := CUR.FILE_SEQ;
    
        -- 2. 송신 파일 내역 체크 ( RTRE0098 )    
        IF 0 < f_sRtre0098CountCheck(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq) THEN
     
            -- 2-1) 내역 존재시 DEL_YN 업데이트  
            IF 0 != f_Delete0098FileClear(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기존 송신 파일 내역('||v_Rqst_Day||'-'||v_File_Nm||'-'||CUR.FILE_TP||'-'||CUR.FILE_SEQ||') 삭제 실패. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;
            
    END LOOP;       
    
    -- 1. 송수신처리 내역확인 ( RTRE0099 )  
    IF 1 != v_Tdata_Cnt THEN
        v_Return_Message := '(1)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
    
    
    IF Cur_Rtre0099%ISOPEN THEN
        CLOSE Cur_Rtre0099;
    END IF;
    
    -- 4. 파일 내역 생성 ( RTRE0098 )
        
    -- 기관코드(이용기관식별코드)
    v_Company_Cd := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    
    -- 송신전문 Header Record 구성
    v_Row_Data := 'H' ||
                  '00000000' ||
                  RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                  RPAD(v_File_Nm,8,' ') ||
                  RPAD(SUBSTR(v_Rqst_Day,3),6,' ') ||
                  RPAD(' ',87, ' ');
    
    --  송신전문 Header Record Size 검증
    IF LENGTH(v_Row_Data) != 1+8+10+8+6+87 THEN
        v_Return_Message := '(2)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
 
    
    -- 송신전문 Header Record 생성용 요청일자/파일명 기준 ROW 순번 획득
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    
    -- 송신전문 Header Record - 파일 송수신 내역 Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' 송신전문 HEADER RECORD 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 송신전문 Data Record 구성
    v_Tdata_Cnt := 0;
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;                       
        
        v_Tdata_Cnt := v_Tdata_Cnt + 1;
        
        -- 송신전문 Data Record 구성
        v_Row_Data := 'R' ||
                      LPAD(CUR.ACRQ_SEQ,8,'0') ||
                      RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||                      
                      RPAD(SUBSTR(CUR.ACRQ_DAY,3),6,' ') ||
                      RPAD(NVL(CUR.ACRQ_TP,' '),1,' ') ||                
                      RPAD(NVL(CUR.ORD_NO,' '),20,' ') ||
                      RPAD(NVL(CUR.BANK_CD||CUR.ACBRCD,' '),7,'0') ||
                      RPAD(NVL(CUR.ACCT_NO,' '),16,' ') ||
                      RPAD(NVL(CUR.EBIR_BUSL,' '),16,' ') ||                      
                      RPAD(NVL(CUR.RQBRCD,' '),4, ' ')||
                      RPAD('00',2, ' ')||
                      RPAD('N',1, ' ')||
                      RPAD(NVL(CUR.ACERCD,' '),4, ' ')||
                      RPAD(' ',1, ' ')||
                      RPAD(' ',12, ' ')||
                      RPAD(' ',11, ' ');                      
                      
        --  송신전문 Data Record Size 검증
        IF LENGTH(v_Row_Data) != 1+8+10+6+1+20+7+16+16+4+2+1+4+1+12+11 THEN
            v_Return_Message := '(3)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
            RAISE e_Error;
        END IF;
        
        -- 송신전문 Data Record 생성용  요청일자/파일명 기준 ROW 순번 획득
        v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
        
      
        -- 송신전문 Data Record - 파일 송수신 내역 Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := ' 송신전문 HEADER RECORD 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF CUR.ACRQ_TP = '1' THEN
            v_App_Cnt := v_App_Cnt+1; /*계좌신청건수*/
        ELSIF CUR.ACRQ_TP = '3' THEN    
            v_Ter_Cnt := v_Ter_Cnt+1; /*계좌해지건수*/
        ELSIF CUR.ACRQ_TP = '7' THEN  
            v_Ran_Cnt := v_Ran_Cnt+1; /*임의해지건수*/
        END IF;
    
    END LOOP;       

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;
    
    -- 송신전문 Trailer Record 구성
    v_Row_Data := 'T' ||
                  '99999999' ||
                  RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                  RPAD(v_File_Nm,8,' ') ||
                  LPAD(v_Tdata_Cnt,8,'0') ||
                  LPAD(v_App_Cnt,8,'0') ||
                  LPAD('0',8,'0') ||
                  LPAD(v_Ter_Cnt,8,'0') ||
                  LPAD(v_Ran_Cnt,8,'0') ||
                  RPAD(' ',43, ' ')||
                  RPAD(' ',10, ' ');
                  
    --  송신전문 Trailer Record Size 검증
    IF LENGTH(v_Row_Data) != 1+8+10+8+8+8+8+8+8+43+10 THEN
        v_Return_Message := '(4)해당 파일('||v_Rqst_Day||'-'||v_File_Nm||')을 생성할 수 없습니다. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
    
    -- 송신전문 Trailer Record 생성용  요청일자/파일명 기준 ROW 순번 획득
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    -- 송신전문 Trailer Record - 파일 송수신 내역 Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' 송신전문 HEADER RECORD 파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 5. 송수신 처리내역 업데이트 (RTRE0099 )
    IF 0 != Pkg_Rtre0099.f_UpdateRtre0099FileResult (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, 
                                                     'Y', 'Y', 'Y', v_Tdata_Cnt, v_Reg_Id, 
                                                     v_ErrorText) THEN
        v_Return_Message := ' 송수신 처리내역(RTRE0099) 업데이트 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    v_Crlf_Yn := 'N';
   
    -- 파일 송수신 내역 Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
    
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098BatchFileCreate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098BatchFileCreate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098EB12Batch;
  
  /*****************************************************************************
  -- 파일 송수신 내역 - 계좌신청처리 파일생성 - 콤마로 분리된 스트링데이터를 등록하는 샘플
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB13String (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Row_Data       IN STRING,                       /*파일내용              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Tdata_Cnt      OUT VARCHAR,                     /*데이터건수            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    
    CURSOR  Cur_Rtre0098 IS
    SELECT  TRIM(SUBSTR(','||v_Row_Data||',',
                    INSTR(','||v_Row_Data||',', ',', 1, LEVEL)+1,
                    (INSTR(','||v_Row_Data||',', ',', 1, LEVEL+1) - INSTR(','||v_Row_Data||',', ',', 1, LEVEL))-1
                )) AS ROW_DATA
    FROM    DUAL 
    CONNECT BY LEVEL <= ( LENGTH(v_Row_Data) - LENGTH(REPLACE(v_Row_Data, ',', '')) + 1 );


    e_Error     EXCEPTION;
    v_Row_Count NUMBER DEFAULT 0;
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL; /*ROW 순번            */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';   /*삭제여부            */
    
  BEGIN

    -- 필수값: 요청일자,파일명, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
   
  
    SELECT  COUNT(A.ROW_SEQ)
    INTO    v_Row_Count
    FROM    RTRE0098 A
    WHERE   A.RQST_DAY = v_Rqst_Day
    AND     A.FILE_NM  = v_File_Nm
    AND     A.FILE_TP  = v_File_Tp
    AND     A.FILE_SEQ = v_File_Seq
    AND     A.ROW_DATA IN ( SELECT  TRIM(SUBSTR(','||v_Row_Data||',',
                                            INSTR(','||v_Row_Data||',', ',', 1, LEVEL)+1,
                                            (INSTR(','||v_Row_Data||',', ',', 1, LEVEL+1) - INSTR(','||v_Row_Data||',', ',', 1, LEVEL))-1
                                        ))
                            FROM    DUAL 
                            CONNECT BY LEVEL <= ( LENGTH(v_Row_Data) - LENGTH(REPLACE(v_Row_Data, ',', '')) + 1 )
                            );
                  
    
    DBMS_OUTPUT.Put_Line('v_Row_Count = ' || TO_CHAR(v_Row_Count));
    
    IF 0< v_Row_Count THEN
        v_Return_Message := '이미 등록된 데이터가 존재하므로 처리가 불가합니다.';
        RAISE e_Error;
    END IF;
   
    v_Tdata_Cnt := 0;
    
    --  송수신처리 내역(1건) 기준 기존 송신 파일 내역 CLEAR
    FOR CUR IN Cur_Rtre0098 LOOP
        EXIT WHEN Cur_Rtre0098%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
    
        -- 송신전문 Data Record 생성용  요청일자/파일명 기준 ROW 순번 획득
        v_Row_Seq := Pkg_Rtre0098.f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
        
      
        -- 송신전문 Data Record - 파일 송수신 내역 Insert
        IF 0 != Pkg_Rtre0098.f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, CUR.ROW_DATA, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
            
    END LOOP;       
        
    
    IF Cur_Rtre0098%ISOPEN THEN
        CLOSE Cur_Rtre0098;
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '파일 송수신 내역 ['||TO_CHAR(v_Tdata_Cnt)||']건을 정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EB13String(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EB13String(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098EB13String;
    
  /*****************************************************************************
  -- 파일 송수신 내역 Count - 송수신처리 내역 체크 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0098CountCheck(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE        /*파일 순번             */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0098
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     FILE_TP  = v_File_Tp
    AND     FILE_SEQ = v_File_Seq
    AND     DEL_YN   = 'N';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0098CountCheck;
  
  /*****************************************************************************
  -- 파일 송수신 내역 Count - 송수신처리 내역 체크 COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0098CountCheck2(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE         /*파일명                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0098
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     DEL_YN   = 'N';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0098CountCheck2;
  
  /*****************************************************************************
  -- 파일 송수신 내역 Update - 송신 파일 존재시 DEL_YN 업데이트
  *****************************************************************************/
  FUNCTION f_Delete0098FileClear (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0098
    SET     DEL_YN   = 'Y',
            CHG_ID   = v_Reg_Id,
            CHG_DT   = SYSDATE 
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     FILE_TP  = v_File_Tp
    AND     FILE_SEQ = v_File_Seq
    AND     DEL_YN   = 'N';
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_Delete0098FileClear;
  
  /*****************************************************************************
  -- 파일 송수신 내역 Update - 송신 파일 존재시 DEL_YN 업데이트
  *****************************************************************************/
  FUNCTION f_Delete0098FileClear2 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0098
    SET     DEL_YN   = 'Y',
            CHG_ID   = v_Reg_Id,
            CHG_DT   = SYSDATE 
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     DEL_YN   = 'N';
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_Delete0098FileClear2;
  
 
  /*****************************************************************************
  -- 파일 송수신 내역 Delete - 송신 파일 업로드 재처리하기위해 기존자료 삭제
  *****************************************************************************/
  FUNCTION f_Delete0098Day_Nm (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM    RTRE0098
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_Delete0098Day_Nm;
  
   
  /*****************************************************************************
  -- 파일 송수신 내역 - 출금이체자료 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098TransAccum (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_Crlf_Yn        OUT VARCHAR2                     /* CRLF 여부            */
    ) IS
    
    e_Error EXCEPTION;
    v_Row_Count  NUMBER DEFAULT 0;
    v_Rcms_Amt   RTRE0070.RCMS_AMT%TYPE;
    v_File_Seq   RTRE0098.FILE_SEQ%TYPE;               /*파일순번              */
    v_Row_Seq    RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW 순번              */
    v_Del_Yn     RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*삭제여부              */
    v_Company_Cd VARCHAR(10) DEFAULT NULL;             /*기관코드              */ 


  BEGIN

    -- 필수값: 요청일자 ,파일명 ,파일구분 ,등록자 ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Tp) IS NULL) OR (4 != LENGTH(TRIM(v_File_Tp))) THEN
        v_Return_Message := '파일구분('||v_File_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
        
  -- 출금이체 내역  확인(Rtre0099)
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck2 (v_File_Tp, v_Rqst_Day, v_File_Nm, 'TRANS') THEN
        v_Return_Message := '파일을 생성할 수 없습니다. 관리자에게 확인하세요.';
        RAISE e_Error;
    END IF;
    
  -- 기존 등록  자료  check(RTre0098)
    v_File_SEQ := Pkg_Rtre0099.f_sRtre0099FinalFileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
    
    SELECT  COUNT(1) 
    INTO    v_Row_Count
    FROM    RTRE0098 A
    WHERE   A.RQST_DAY = v_Rqst_Day
    AND     A.FILE_NM  = v_File_Nm
    AND     A.FILE_TP  = v_File_Tp
    AND     A.FILE_SEQ = v_File_SEQ;
    
  -- 기존 등록  자료 삭제(Rtre0098)
    IF v_Row_Count  > 0 THEN
        DELETE  RTRE0098 A
        WHERE   A.RQST_DAY = v_Rqst_Day
        AND     A.FILE_NM  = v_File_Nm
        AND     A.FILE_TP  = v_File_Tp
        AND     A.FILE_SEQ = v_File_SEQ;
        IF SQLCODE <> 0 THEN
            v_Return_Message := '출금이체 파일 송수신 내역(RTRE0098) 삭제 중 에러 발생!!. 관리자에게 확인하세요!!.';
            RAISE e_Error;
        END IF;
    END IF; 

  -- 기관코드(이용기관식별코드)
    v_Company_Cd := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');

  -- 송수신파일내역 HEAD 생성(Rtre0098)
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, 0 ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               (
                 SELECT  'H' || 
                         '00000000'  ||
                         RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                         SUBSTR(v_File_Nm,1,8) ||
                         SUBSTR(v_Rqst_Day,3,6) ||
                         RPAD((SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R026'), 7, ' ') ||
                         RPAD((SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R027'), 16, ' ') ||
                         RPAD(' ', 94, ' ')  EB21 
                 FROM DUAL  ) ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
       FROM   DUAL;
    
    IF SQLCODE <> 0 THEN
        v_Return_Message := '출금이체 파일 송수신 내역(RTRE0098) HEAD생성 중 에러 발생!!. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
    
    
  -- 송수신파일내역 BODY 생성(Rtre0098)
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, ROWNUM ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               'R' || LPAD(TO_CHAR(ROWNUM),8,'0')  ||
               RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
               BANK_CD || ACCT_NO || RCMS_AMT ||  BIR_NO ||
               ' ' || '    ' || RPAD('넥센타이어',16,TO_MULTI_BYTE(' ')) ||
               '  ' || ORD_NO || '     ' || '0' ||
               RPAD(' ', 12, ' ') || RPAD(' ', 21, ' ') ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
        FROM (
                SELECT  RPAD(B.BANK_CD,7,'0') BANK_CD, 
                        RPAD(REPLACE(B.ACCT_NO, '-',''),16,' ')  ACCT_NO,
                        LPAD(TO_CHAR(A.RCMS_AMT),13,'0') RCMS_AMT,
                        RPAD(DECODE(B.CUST_TP, '01', B.EBIR_DAY, B.BUSL_NO),13,' ') BIR_NO,
                        RPAD(A.ORD_NO,20, ' ') ORD_NO 
                FROM    RTRE0070 A,
                        RTRE0010 B
                WHERE   A.RCMS_DAY = v_Rqst_Day
                AND     A.ACC_SEQ  = B.ACC_SEQ
                ORDER BY A.RCMS_SEQ
                )
      ;            
    
    IF SQLCODE <> 0 THEN
        v_Return_Message := '출금이체 파일 송수신 내역(RTRE0098) BODY생성 중 에러 발생!!. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
 

  -- 송수신파일내역 TAIL 생성(Rtre0098)*  
    SELECT  COUNT(1), SUM(RCMS_AMT)
    INTO    v_Row_Count, v_Rcms_Amt
    FROM    RTRE0070 A
    WHERE   A.RCMS_DAY = v_Rqst_day;
    
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, 99999999 ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               'T' || '99999999'  ||
               RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
               SUBSTR(v_File_Nm,1,8) ||
               LPAD(TO_CHAR(v_Row_Count),8,'0') ||
               LPAD(TO_CHAR(v_Row_Count),8,'0') ||
               LPAD(TO_CHAR(v_Rcms_Amt),13,'0') ||
               '00000000' || '0000000000000' ||
               RPAD(' ', 63, ' ') ||
               RPAD(' ', 10, ' ')  ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
       FROM   DUAL;   
       
    IF SQLCODE <> 0 THEN
        v_Return_Message := '출금이체 파일 송수신 내역(RTRE0098) TAIL생성 중 에러 발생!!. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
 
        
  -- 송수신파일내역 생성 결과 Update(Rtre0099)
    IF 0 <> Pkg_Rtre0099.f_UpdateRtre0099FileResult2 (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_SEQ, 
                                                     'Y', 'Y', 'Y', v_Row_Count, v_Rcms_Amt, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '출금이체 파일 송수신 내역(RTRE0099) UPDATE 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 출금이체 내역 상태 업데이트 (전송중)
    UPDATE RTRE0070
    SET RQST_STAT = '2'
    WHERE   RCMS_DAY = v_Rqst_Day;    
  
    -- 파일 송수신 내역 Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);


    v_Success_code := 0;
    v_Return_Message := '출금이체 파일 송수신 내역 ['||TO_CHAR(v_Row_Count)||']건을 정상적으로 등록되었습니다';
    v_ErrorText := '';
    v_Crlf_Yn   := 'N'; -- 출금이체는 N, 카드이체는 Y
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098TransAccum(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098TransAccum(2)', v_ErrorText, v_Return_Message);

    
  END p_InsertRtre0098TransAccum;        

      
  /*****************************************************************************
  -- 파일 송수신 내역 - 카드이체자료 파일생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098CardTrans (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*전송일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_Crlf_Yn        OUT VARCHAR2                     /* CRLF 여부            */
    ) IS
    
    e_Error EXCEPTION;
    v_Row_Count NUMBER DEFAULT 0;
    v_Rcrd_Amt  RTRE0080.RCRD_AMT%TYPE;
    v_Rcrd_Day  RTRE0080.RCRD_Day%TYPE;
    v_File_Seq  RTRE0098.FILE_SEQ%TYPE;               /*파일순번              */
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW 순번              */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*삭제여부              */

  BEGIN

    -- 필수값: 요청일자 ,파일명 ,파일구분 ,등록자 ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (38 != LENGTH(TRIM(v_File_Nm))) THEN
    -- KCP_BACH_FILE_BC02_INX_V5407_20150815
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Tp) IS NULL) OR (8 != LENGTH(TRIM(v_File_Tp))) THEN  
    -- BC02_INX
        v_Return_Message := '파일구분('||v_File_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
        
  -- 카드이체 내역  확인(Rtre0099)
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck2 (v_File_Tp, v_Rqst_Day, v_File_Nm, 'TRANS') THEN
        v_Return_Message := '파일을 생성할 수 없습니다. 관리자에게 확인하세요.';
        RAISE e_Error;
    END IF;
    
  -- 기존 등록  자료  check(RTre0098)
    v_File_SEQ := Pkg_Rtre0099.f_sRtre0099FinalFileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
    
    SELECT  COUNT(1) 
    INTO    v_Row_Count
    FROM    RTRE0098 A
    WHERE   A.RQST_DAY = v_Rqst_Day
    AND     A.FILE_NM  = v_File_Nm
    AND     A.FILE_TP  = v_File_Tp
    AND     A.FILE_SEQ = v_File_SEQ;
    
  -- 기존 등록  자료 삭제(Rtre0098)
    IF v_Row_Count  > 0 THEN
        DELETE  RTRE0098 A
        WHERE   A.RQST_DAY = v_Rqst_Day
        AND     A.FILE_NM  = v_File_Nm
        AND     A.FILE_TP  = v_File_Tp
        AND     A.FILE_SEQ = v_File_SEQ;
        IF SQLCODE <> 0 THEN
            v_Return_Message := '카드이체 파일 송수신 내역(RTRE0098) 삭제 중 에러 발생!!. 관리자에게 확인하세요!!.';
            RAISE e_Error;
        END IF;
    END IF; 


    v_Rcrd_Day := v_RQst_Day;
    
  -- 송수신파일내역 HEAD 생성(Rtre0098)
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, 0 ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               (
                 SELECT  'S' || 
                         'BC02'  ||
                         RPAD(Pkg_Rtcm0051.f_sRtcm0051Cd('R023'),10,' ')  ||
                         SUBSTR(v_Rqst_Day,1,8) ||
                         'Y' || 'Y' ||
                         RPAD(' ', 473, ' ')  ROW_DATA 
                 FROM DUAL  ) ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
       FROM   DUAL;
    
    IF SQLCODE <> 0 THEN
        v_Return_Message := '카드이체 파일 송수신 내역(RTRE0098) HEAD생성 중 에러 발생!!. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
    
    
  -- 송수신파일내역 BODY 생성(Rtre0098)
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, ROWNUM ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               'D' || LPAD(TO_CHAR(ROWNUM),7,'0') || AA ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
        FROM (
                SELECT  RPAD(Pkg_Rtcm0051.f_sRtcm0051Cd('R024'),10,' ') ||
                        'A' ||
                        RPAD(Pkg_Rtcm0051.f_sRtcm0051Cd('R025'),12,' ') ||
                        RPAD(TRIM(A.BATCH_KEY),16,' ') ||
                        RPAD(' ', 8, ' ') ||
                        LPAD(TO_CHAR(A.RCRD_AMT),12,'0') ||
                        '00' ||
                        RPAD(' ', 125, ' ') ||
                        RPAD(A.ORD_NO || A.CUST_NO || A.RCRD_DAY || LPAD(TO_CHAR(A.RCRD_SEQ),7,'0'), 50, ' ') ||
                        RPAD('넥센타이어렌탈',  50,  ' ') ||
                        RPAD(' ', 204, ' ') AA 
                FROM    RTRE0080 A
                WHERE   A.RCRD_DAY = v_Rcrd_Day
                ORDER BY A.RCRD_SEQ
                )
      ;            
    
    IF SQLCODE <> 0 THEN
        v_Return_Message := '카드이체 파일 송수신 내역(RTRE0098) BODY생성 중 에러 발생!!. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
 

  -- 송수신파일내역 TAIL 생성(Rtre0098)*  
    SELECT  COUNT(1), SUM(RCRD_AMT)
    INTO    v_Row_Count, v_Rcrd_Amt
    FROM    RTRE0080 A
    WHERE   A.RCRD_DAY = v_Rcrd_day;
    
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, 99999999 ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               'E' || 
               LPAD(TO_CHAR(v_Row_Count),7,'0') ||
               LPAD(TO_CHAR(v_Row_Count),7,'0') ||
               LPAD(TO_CHAR(v_Rcrd_Amt),12,'0') ||
               RPAD('0', 95, '0') ||
               RPAD(' ', 376, ' ')  ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
       FROM   DUAL;   
       
    IF SQLCODE <> 0 THEN
        v_Return_Message := '카드이체 파일 송수신 내역(RTRE0098) TAIL생성 중 에러 발생!!. 관리자에게 확인하세요!!.';
        RAISE e_Error;
    END IF;
 
        
  -- 송수신파일내역 생성 결과 Update(Rtre0099)
    IF 0 <> Pkg_Rtre0099.f_UpdateRtre0099FileResult2 (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_SEQ, 
                                                     'Y', 'Y', 'Y', v_Row_Count, v_Rcrd_Amt, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '카드이체 파일 송수신 내역(RTRE0099) UPDATE 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
  
    -- 파일 송수신 내역 Select
    --[20210725_01] kstka 파일생성시에 조회를 하는데 중복으로 조회하고 있어서 필수데이터만 가져올 수 있도록 1번째 행 데이터만 조회하게 변경
--    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, 0, v_File_Tp, v_File_Seq, NULL, 'N', NULL);


    v_Success_code := 0;
    v_Return_Message := '출금이체 파일 송수신 내역 ['||TO_CHAR(v_Row_Count)||']건을 정상적으로 등록되었습니다';
    v_ErrorText := '';
    v_Crlf_Yn   := 'Y'; -- 카드이체는 Y, 출금이체는 N
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
--        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, 0, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098CardTrans(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
--        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, 0, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098CardTrans(2)', v_ErrorText, v_Return_Message);

    
  END p_InsertRtre0098CardTrans;         

      
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 - 회사접수(A) 데이터 파일 파싱하여 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingA (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Extrc_Yn       IN OUT RTRE0099.EXTRC_YN%TYPE,   /*대상집계여부          */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER 존재여부       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*데이터 총건수         */
    v_Acrq_Cnt       IN OUT RTRE0099.ACRQ_CNT%TYPE,   /*계좌신청건수          */
    v_Accnrq_Cnt     IN OUT RTRE0099.ACCNRQ_CNT%TYPE, /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN OUT RTRE0099.RMCNRQ_CNT%TYPE, /*계좌임의해지건수      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
/*  -- 밑에서 Parsing은 별도  처리
  
    -- 파일데이터(CLOB)를 120 BYTE 씩 잘라서 CURSOR 담는다.
    -- 기관코드(R018:9924216388) 기준으로 -9 위치부터 150BYTE를 자른 후 CONVERT하여 한글포함 150BYTE로 정확하게 잘라냄
    -- 'H000000009924216388EB22101515101502012341234567890123456                                                                                              '
    -- 'R000000029924216388004    956612544555224 0000000096400820123       N    넥센타이어        D15000000527             3                                 '
    CURSOR  Cur_File_Data IS
    SELECT  CONVERT(SUBSTRB(FILE_DATA, 1, 120),'AL32UTF8', 'KO16KSC5601') ROW_DATA
    FROM    (
            SELECT  ROWNUM RN,
                    CONVERT(FILE_DATA,'KO16KSC5601','AL32UTF8') FILE_DATA 
            FROM    (
                    SELECT DBMS_LOB.SUBSTR(FILE_DATA, 120, DBMS_LOB.INSTR (FILE_DATA, COMPANY_CD, 1, LEVEL)-9) FILE_DATA
                    FROM   (
                            SELECT  v_File_Data FILE_DATA,
                                    DBMS_LOB.GETLENGTH(v_File_Data) LEN,
                                    Pkg_Rtcm0051.f_sRtcm0051Cd('R018') COMPANY_CD
                            FROM    DUAL
                            )                    
                    CONNECT BY LEVEL<= LEN / 80 -- 한글포함 GETLENGTH  150값보다 작게 나오나 정확한 값을 알수 없어 임의로 작은값 설정, NULL 값을 포함 열이 나옴
                    )
            WHERE   FILE_DATA IS NOT NULL -- NULL 값은 제외하여 정상 데이터만 SET
            );
*/
    
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW 순번              */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*파일내용              */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*삭제여부              */

    v_Company_Cd VARCHAR(10) DEFAULT NULL;            /*기관코드              */ 
    v_Acrq_Seq   RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL; /*계좌신청순번          */
    v_Ord_No     RTRE0060.ORD_NO%TYPE DEFAULT NULL;   /*계약번호              */ 
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;  /*계좌신청 처리상태     */
    v_Acercd     RTRE0060.ACERCD%TYPE DEFAULT NULL;   /*계좌신청 결과코드     */
    
    v_File_Name   RTRE0098.FILE_NM%TYPE DEFAULT NULL; /*파일명                */
        
    e_Error EXCEPTION;
    v_Row_Count     NUMBER DEFAULT 0;
    v_Data_Len      NUMBER DEFAULT 0;
    v_Record_Len    NUMBER DEFAULT 120; -- EB14 인 파일은 120 BYTE로 나눠서 처리한다.
    v_Record_Type   VARCHAR(1) DEFAULT NULL; 
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type      VARCHAR2(10);      /*CLOB TYPE        */
    v_Type           VARCHAR2(20);      /*Parsing 구분자   */
    v_Spe_Yn         VARCHAR2(20);      /*별도처리여부     */
    v_Spe_Pos        NUMBER(10);       /*별도처리위치     */
    
        
  BEGIN

    -- 필수값: 요청일자, 파일명, 송수신 파일구분, 파일 순번, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '송수신 파일구분('||v_File_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Seq) IS NULL THEN
        v_Return_Message := '파일 순번('||v_File_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
     
    v_Data_Len := DBMS_LOB.GETLENGTH(v_File_Data);
    
    IF 0 != MOD(v_Data_Len, v_Record_Len) THEN
        v_Return_Message := '파일데이터(CLOB) 길이('||v_Data_Len||')가 올바르지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    v_Header_Yn := 'N';
    v_Trailer_Yn:= 'N';   
    
    
    --  송수신처리 내역(1건) 기준 기존 송신 파일 내역 CLEAR
    -- 계좌 신청 결과 파일은 에러데이터만 존재함. 계좌신청 내역(RTRE0060)에 전송 상태로 일괄 업데이트 된 상태이며, 아래에서 에러건에 대해서만 업데이트를 함
    --  CLOB 자료 Parsing    
    v_Clob_Type := 'ACCOUNT_A';
    v_Type      := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    v_Spe_Yn    := 'Y';
    v_Spe_Pos   := 9;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                        v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB자료 Parsing중  오류입니다. 관리자에게 문의하세요!';
        RAISE e_Error;                
    END IF;                                 


    v_Row_Count := 0;
    
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
    
    
        -- 송신전문 Data Record 생성용  요청일자/파일명 기준 ROW 순번 획득
        v_Row_Seq := Pkg_Rtre0098.f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);

        v_Record_Type := SUBSTR(v_Row_Data, 1, 1); -- 레코드 구분

        -- 첫번째 데이터는 반듯이 HEADER 정보가 존재해야 하며 없으면 에러처리
        IF v_Row_Count = 1 THEN
        
            IF v_Record_Type = 'H' THEN
                
                -- 기관코드(이용기관식별코드)
                v_Company_Cd := TRIM(SUBSTR(v_Row_Data, 10, 10));
                
                IF v_Company_Cd != Pkg_Rtcm0051.f_sRtcm0051Cd('R018') THEN
                    v_Return_Message := '파일상의 이용기간실별코드('||v_Company_Cd||') 값이 상이하므로 처리가 불가 합니다!';
                    RAISE e_Error;                
                END IF;
                
                -- FILE이름
                v_File_Name := TRIM(SUBSTR(v_Row_Data, 20, 8)); 
                
                IF v_File_Name != v_File_Nm THEN
                    v_Return_Message := '파일상의 파일명('||v_File_Name||') 값이 상이하므로('||v_File_Nm||') 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
                
                -- HEADER 존재여부       
                v_Header_Yn := 'Y';  
                    
            ELSE
                v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 정보가 없어 처리가 불가 합니다!';
                RAISE e_Error;                
            END IF;
            
        ELSE 
            -- 데이터 부분이면 파싱한 데이터를 등록함   
            IF v_Record_Type = 'R' THEN
                            
                v_Acrq_Seq := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 2, 8)));    -- DATA 일련번호 
                v_Ord_No   := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 27, 20)));  -- 납부자번호      
                v_Acrq_St  := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 92, 1)));   -- 처리결과-결과코드
                v_Acercd   := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 93, 4)));   -- 처리결과-불능코드


                -- 계좌신청 내역 Count - DATA 일련번호와 납부자번호, 신청구분으로 RTRE0060내역와 동일한지 체크
                IF 0 < Pkg_Rtre0060.f_sRtre0060OrdCount(v_Acrq_Fg, v_Rqst_Day, v_Acrq_Seq, v_Ord_No) THEN
                
                    -- 계좌신청 내역(RTRE0060) Update - 계좌신청처리구분 기준 계좌신청처리 상태, 결과코드를 변경
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqTpSt (v_Acrq_Fg, v_Rqst_Day, v_Acrq_Seq, v_Acercd,
                                                                   v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '계좌신청 내역(RTRE0060) UPDATE - 계좌신청처리 상태,결과코드를 변경 중 에러!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;                    
                
                END IF;
                
            -- 마지막 레코드 이면
            ELSIF v_Record_Type = 'T' THEN           
            
            
                -- TRAILER 존재여부
                v_Trailer_Yn := 'Y';
                    
            END IF;            
            
        END IF;          
      
                
        -- 송신전문 Data Record - 파일 송수신 내역 Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                  v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                  v_ErrorText) THEN
            v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
         
        -- 마지막 레코드 이면 빠져나감
        IF v_Record_Type = 'T' THEN
            v_Trailer_Yn := 'Y';
            EXIT;
        END IF;
                    
    END LOOP;       
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 또는 TRAILER 정보가 없어 처리가 불가 합니다!';
        RAISE e_Error;  
    END IF;    
    
    v_Tdata_Cnt  := 0; -- 데이터 총건수
    v_Acrq_Cnt   := 0; -- 계좌신청건수
    v_Accnrq_Cnt := 0; -- 계좌해지건수
    v_Rmcnrq_Cnt := 0; -- 계좌임의해지건수
  
    -- 송수신파일 처리 결과 업데이트 데이터 SET 획득 
    SELECT  COUNT(*) TDATA_CNT,
            SUM(DECODE(ACRQ_TP, '1', 1, 0)) ACRQ_CNT,
            SUM(DECODE(ACRQ_TP, '3', 1, 0)) ACCNRQ_CNT,
            SUM(DECODE(ACRQ_TP, '7', 1, 0)) RMCNRQ_CNT
    INTO    v_Tdata_Cnt, v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Rqst_Day;

    -- 파일생성여부
    v_Extrc_Yn := 'Y';
    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.f_InsertRtre0098FileParsing(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.f_InsertRtre0098FileParsing(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingA;  
  
      
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 - 은행접수(B) 데이터 파일 파싱하여 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingB (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*계좌신청 발생구분     */
    v_Extrc_Yn       IN OUT RTRE0099.EXTRC_YN%TYPE,   /*대상집계여부          */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER 존재여부       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*데이터 총건수         */
    v_Acrq_Cnt       IN OUT RTRE0099.ACRQ_CNT%TYPE,   /*계좌신청건수          */
    v_Accnrq_Cnt     IN OUT RTRE0099.ACCNRQ_CNT%TYPE, /*계좌해지건수          */
    v_Rmcnrq_Cnt     IN OUT RTRE0099.RMCNRQ_CNT%TYPE, /*계좌임의해지건수      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

/*    
    -- 파일데이터(CLOB)를 120 BYTE 씩 잘라서 CURSOR 담는다.
    -- 기관코드(R018:9924216388) 기준으로 -9 위치부터 150BYTE를 자른 후 CONVERT하여 한글포함 150BYTE로 정확하게 잘라냄
    -- 'H000000009924216388EB22101515101502012341234567890123456                                                                                              '
    -- 'R000000029924216388004    956612544555224 0000000096400820123       N    넥센타이어        D15000000527             3                                 '
    CURSOR  Cur_File_Data IS
    SELECT  CONVERT(SUBSTRB(FILE_DATA, 1, 120),'AL32UTF8', 'KO16KSC5601') ROW_DATA
    FROM    (
            SELECT  ROWNUM RN,
                    CONVERT(FILE_DATA,'KO16KSC5601','AL32UTF8') FILE_DATA 
            FROM    (
                    SELECT DBMS_LOB.SUBSTR(FILE_DATA, 120, DBMS_LOB.INSTR (FILE_DATA, COMPANY_CD, 1, LEVEL)-9) FILE_DATA
                    FROM   (
                            SELECT  v_File_Data FILE_DATA,
                                    DBMS_LOB.GETLENGTH(v_File_Data) LEN,
                                    Pkg_Rtcm0051.f_sRtcm0051Cd('R018') COMPANY_CD
                            FROM    DUAL
                            )                    
                    CONNECT BY LEVEL<= LEN / 80 -- 한글포함 GETLENGTH  150값보다 작게 나오나 정확한 값을 알수 없어 임의로 작은값 설정, NULL 값을 포함 열이 나옴
                    )
            WHERE   FILE_DATA IS NOT NULL -- NULL 값은 제외하여 정상 데이터만 SET
            );
*/            
    
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW 순번              */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*파일내용              */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*삭제여부              */

    v_Company_Cd VARCHAR(10) DEFAULT NULL;            /*기관코드              */ 
    v_Acrq_Day   RTRE0060.ACRQ_DAY%TYPE DEFAULT NULL; /*계좌신청일            */
    v_Acrq_Seq   RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL; /*계좌신청순번          */
    v_Ord_No     RTRE0060.ORD_NO%TYPE DEFAULT NULL;   /*계약번호              */ 
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;  /*계좌신청 처리상태     */
    v_Acercd     RTRE0060.ACERCD%TYPE DEFAULT NULL;   /*계좌신청 결과코드     */
    v_Cust_No    RTRE0060.CUST_NO%TYPE DEFAULT NULL;  /*고객코드              */
    v_Acc_Seq    RTRE0060.ACC_SEQ%TYPE DEFAULT NULL;  /*계좌순번              */
    v_Acrq_Tp    RTRE0060.ACRQ_TP%TYPE DEFAULT NULL;  /*계좌신청구분          */
    v_Rpc_Seq    RTRE0060.RPC_SEQ%TYPE DEFAULT NULL;  /*결제변경요청순번      */    
    
    v_File_Name   RTRE0098.FILE_NM%TYPE DEFAULT NULL; /*파일명                */
        
    e_Error EXCEPTION;
    v_Row_Count     NUMBER DEFAULT 0;
    v_Data_Len      NUMBER DEFAULT 0;
    v_Record_Len    NUMBER DEFAULT 120; -- EB14 인 파일은 120 BYTE로 나눠서 처리한다.
    v_Record_Type   VARCHAR(1) DEFAULT NULL; 
    
    v_Busl_No     RTSD0100.BUSL_NO%TYPE DEFAULT NULL;  /*사업자번호            */
    v_Busl_No1    RTSD0100.BUSL_NO%TYPE DEFAULT NULL;  /*사업자번호            */
    v_Busl_No2    RTSD0100.BUSL_NO%TYPE DEFAULT NULL;  /*사업자번호            */
    
    v_Bank_Cd     RTRE0010.BANK_CD%TYPE DEFAULT NULL;  /*은행코드              */
    v_Acct_No     RTRE0010.ACCT_NO%TYPE DEFAULT NULL;  /*계좌번호              */
    v_Use_Yn      RTRE0010.USE_YN%TYPE  DEFAULT NULL;  /*사용여부              */
    v_Acc_Chk     RTRE0010.ACC_CHK%TYPE DEFAULT 'Y';   /*계좌확인상태          */
    v_Acnc_Id     RTRE0010.ACNC_ID%TYPE DEFAULT NULL;  /*해지사용자            */
    v_Acnc_Desc   RTRE0010.ACNC_DESC%TYPE DEFAULT NULL;/*해지사유              */    
    v_Cust_Nm     RTRE0010.CUST_NM%TYPE DEFAULT NULL;  /*고객명                */
    v_Cust_Tp     RTRE0010.CUST_TP%TYPE DEFAULT NULL;  /*고객유형              */
    v_Ebir_Day    RTRE0010.EBIR_DAY%TYPE DEFAULT NULL; /*법정생년월일(YYMMDD)  */
    
    
    v_Acbrcd      RTRE0060.ACBRCD%TYPE DEFAULT NULL;   /*계좌개설 점코드       */
    v_Rqbrcd      RTRE0060.RQBRCD%TYPE DEFAULT NULL;   /*취급 점코드           */
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type      VARCHAR2(10);      /*CLOB TYPE        */
    v_Type           VARCHAR2(20);      /*Parsing 구분자   */
    v_Spe_Yn         VARCHAR2(20);      /*별도처리여부     */
    v_Spe_Pos        NUMBER(10);       /*별도처리위치     */

    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
    
  BEGIN

    -- 필수값: 요청일자, 파일명, 송수신 파일구분, 파일 순번, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '송수신 파일구분('||v_File_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Seq) IS NULL THEN
        v_Return_Message := '파일 순번('||v_File_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
     
    v_Data_Len := DBMS_LOB.GETLENGTH(v_File_Data);
    
    IF 0 != MOD(v_Data_Len, v_Record_Len) THEN
        v_Return_Message := '파일데이터(CLOB) 길이('||v_Data_Len||')가 올바르지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    v_Header_Yn := 'N';
    v_Trailer_Yn:= 'N';   
    v_Acrq_Day  := v_Rqst_Day;
    
    -- 은행접수(B) 계좌 신청 결과 파일 한 ROW씩 읽어서 유효성 검증 및  계좌신청 내역(RTRE0060)에 신규생성
    --  CLOB 자료 Parsing    
    v_Clob_Type := 'ACCOUNT_B';
    v_Type      := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    v_Spe_Yn    := 'Y';
    v_Spe_Pos   := 9;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                        v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB자료 Parsing중  오류입니다. 관리자에게 문의하세요!';
        RAISE e_Error;                
    END IF;                                 


    v_Row_Count := 0;
    
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
    
        -- 송신전문 Data Record 생성용  요청일자/파일명 기준 ROW 순번 획득
        v_Row_Seq := Pkg_Rtre0098.f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);

        v_Record_Type := SUBSTR(v_Row_Data, 1, 1); -- 레코드 구분

        -- 첫번째 데이터는 반듯이 HEADER 정보가 존재해야 하며 없으면 에러처리
        IF v_Row_Count = 1 THEN
        
            IF v_Record_Type = 'H' THEN
                
                -- 기관코드(이용기관식별코드)
                v_Company_Cd := TRIM(SUBSTR(v_Row_Data, 10, 10));
                
                IF v_Company_Cd != Pkg_Rtcm0051.f_sRtcm0051Cd('R018') THEN
                    v_Return_Message := '파일상의 이용기간실별코드('||v_Company_Cd||') 값이 상이하므로 처리가 불가 합니다!';
                    RAISE e_Error;                
                END IF;
                
                -- FILE이름
                v_File_Name := TRIM(SUBSTR(v_Row_Data, 20, 8)); 
                
                IF v_File_Name != v_File_Nm THEN
                    v_Return_Message := '파일상의 파일명('||v_File_Name||') 값이 상이하므로('||v_File_Nm||') 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
                
                -- HEADER 존재여부       
                v_Header_Yn := 'Y';  
                    
            ELSE
                v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 정보가 없어 처리가 불가 합니다!';
                RAISE e_Error;                
            END IF;
            
        ELSE 
            -- 데이터 부분이면 파싱한 데이터를 등록함   
            IF v_Record_Type = 'R' THEN
                            
                v_Ord_No   := TRIM(SUBSTR(v_Row_Data, 27, 20));  -- 납부자번호 
                v_Busl_No1 := TRIM(SUBSTR(v_Row_Data, 69, 16));  -- 법정생년월일/사업자번호
                
                v_Cust_No  := NULL;
                v_Acc_Seq  := NULL;
                v_Cust_Nm  := NULL;
                v_Cust_Tp  := NULL;
                v_Ebir_Day := NULL;
                v_Busl_No  := NULL;
                v_Busl_No2 := NULL;
                v_Acercd   := NULL;
                
                -- 오더번호가 획득되었으면
                IF v_Ord_No IS NOT NULL THEN
                    
                    IF 0 = Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN
                    
                        v_Acercd := 'A013'; -- 계좌신청 결과코드
                    ELSE
                    
                        BEGIN
                            -- 오더기준 고객번호 획득, 고객유형에 따라 법정생년월일/사업자번호 획득 
                            SELECT  CUST_NO, CUST_NM, CUST_TP, SUBSTR(BIRTH_DAY,3) AS EBIR_DAY, BUSL_NO, DECODE(CUST_TP, '01', SUBSTR(BIRTH_DAY,3), '02', BUSL_NO)
                            INTO    v_Cust_No, v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No, v_Busl_No2 
                            FROM    RTSD0100
                            WHERE   CUST_NO = Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No);
                            
                            v_exist := TRUE;

                            EXCEPTION
                              WHEN NO_DATA_FOUND THEN
                                v_exist := FALSE;
                        END;
                        
                        IF v_exist = FALSE THEN
                            v_Return_Message := '오더('||v_Ord_No||') 기준 고객테이블(RTSD0100)에 고객번호 획득, 고객유형에 따라 법정생년월일/사업자번호 획득. 데이터가 존재하지 않음으로 처리가 불가 합니다.!';
                            RAISE e_Error;
                        END IF;

                        -- 획득한 법정생년월일/사업자번호 존재하면서 파일내용의 생년월일과 비교하여 다르면 고객번호 초기화
                        IF (v_Busl_No2 IS NOT NULL) AND (v_Busl_No1 != v_Busl_No2) THEN
                            v_Cust_No := NULL;
                        END IF;
                    
                    END IF;
                    
                ELSE
                    v_Acercd := 'A013'; -- 계좌신청 결과코드
                END IF;
                
                v_Acrq_Tp  := TRIM(SUBSTR(v_Row_Data, 26, 1));    -- 계좌신청구분                
                v_Bank_Cd  := TRIM(SUBSTR(v_Row_Data, 47, 3));    -- 은행코드: 참가기관(은행)코드 7자리중 앞3자리만 획득
                v_Acct_No  := TRIM(SUBSTR(v_Row_Data, 54, 16));   -- 계좌번호
                v_Acbrcd   := TRIM(SUBSTR(v_Row_Data, 50, 4));    -- 계좌개설 점코드: 참가기관(은행)코드 7자리중 뒤4자리만 획득
                v_Rqbrcd   := TRIM(SUBSTR(v_Row_Data, 86, 4));    -- 취급 점코드
                v_Acrq_Seq := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 2, 8)));    -- DATA 일련번호
                  
                v_Use_Yn := NULL;
                
                IF v_Acrq_Tp = '1' THEN -- 1: 신규
                
                    -- 고객코드가 NULL 인 경우 제외
                    IF v_Cust_No IS NOT NULL THEN
                                
                           
                        -- 고객 계좌 정보 - 고객번호/은행코드/계좌번호 기준 존재여부 체크
                        v_Acc_Seq := Pkg_Rtre0010.f_sRtre0010AcctNo(v_Cust_No, v_Bank_Cd, v_Acct_No);
                        
                        
                        IF v_Acc_Seq IS NULL THEN                            
                                
                            v_Use_Yn := 'Y';
                                
                            -- 등록된 고객계좌가 없으면 신규 생성
                            Pkg_Rtre0010.p_IUDRtre0010('I', v_Acc_Seq, v_Cust_No,
                                                      v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                                      v_Bank_Cd, v_Acct_No, v_Acc_Chk, v_Acnc_Id,
                                                      v_Acnc_Desc, v_Use_Yn, v_Reg_Id, v_Success_Code,
                                                      v_Return_Message, v_ErrorText);
                            IF 0 != v_Success_Code THEN
                                v_Return_Message := '고객계좌가 신규 등록 실패!!!'||'-'||v_Return_Message;
                                    v_ErrorText := v_ErrorText;
                                RAISE e_Error;

                            END IF;
                        
                        ELSE
                        
                            v_Use_Yn := Pkg_Rtre0010.f_sRtre0010UseYn(v_Cust_No, v_Bank_Cd, v_Acct_No);
                        
                            -- 등록된 고객계좌가 있으나,사용여부가 N'이면 Y로 업데이트함
                            IF v_Use_Yn = 'N' THEN
                                v_Use_Yn := 'Y';
                                IF 0 != Pkg_Rtre0010.f_UpdateRtre0010UseYn(v_Acc_Seq, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                                    v_Return_Message := '고객계좌가 수정 실패!!!'||'-'||v_ErrorText;
                                    v_ErrorText := v_ErrorText;
                                    RAISE e_Error;
                                END IF;
                            
                            END IF;
                        END IF;
       
                    ELSE 
                        v_Acercd := 'A017'; -- 계좌신청 결과코드
                    END IF;
                    
                ELSIF v_Acrq_Tp IN ('3','7') THEN -- '3' : 해지 또는 '7' : 임의해지
                
                    -- 고객코드가 NULL 인 경우 제외
                    IF v_Cust_No IS NULL THEN
                        v_Acercd := 'A017'; -- 계좌신청 결과코드  
                              
                    ELSE      
                        -- 고객 계좌 정보 - 고객번호/은행코드/계좌번호 기준 존재여부 체크
                        v_Acc_Seq := Pkg_Rtre0010.f_sRtre0010AcctNo(v_Cust_No, v_Bank_Cd, v_Acct_No);
                        
                        -- 없으면 오류로 셋팅 안함 => ACERCD 불능코드 : A017
                        IF v_Acc_Seq IS NULL THEN
                            v_Acercd := 'A017'; -- 계좌신청 결과코드
                        END IF;    
                                  
                    END IF;
                    
                END IF;
                
                v_Rpc_Seq  := NULL;  -- 결제변경요청순번
                
                -- 다음 step에서 처리 : ACERCD 값이 있으면 오류로 처리 :신청구분이 '1'인 경우 '3' , 신청구분이 '3','7'인 경우 '7'
                IF v_Acercd IS NULL THEN 
                    v_Acrq_St := '2';
                ELSE
                    IF v_Acrq_Tp = '1' THEN -- 1: 신규
                        v_Acrq_St := '3';  
                        
                    ELSIF v_Acrq_Tp IN ('3','7') THEN -- '3' : 해지 또는 '7' : 임의해지
                        v_Acrq_St := '7';  
                    
                    END IF;              
                END IF;   
                
                -- 계좌신청순번 획득
                --v_Acrq_Seq := Pkg_Rtre0060.f_sRtre0060AcrqSeq(v_Acrq_Fg, v_Acrq_Day);
                    
                -- 계좌신청내역 생성
                IF 0!= Pkg_Rtre0060.f_InsertRtre0060 (v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq, v_Ord_No, 
                                                      v_Cust_No, v_Bank_Cd, v_Acc_Seq, v_Acrq_Tp, v_Rpc_Seq, 
                                                      v_Acrq_St, v_Acercd, v_Acbrcd, v_Rqbrcd, 
                                                      v_Reg_Id, v_ErrorText ) THEN
                    v_Return_Message := '계좌해지건 계좌신청 내역 등록중 에러 발생!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
                                
            -- 마지막 레코드 이면
            ELSIF v_Record_Type = 'T' THEN
            
                -- TRAILER 존재여부
                v_Trailer_Yn := 'Y';
                    
            END IF;            
            
        END IF;          
      
                
        -- 송신전문 Data Record - 파일 송수신 내역 Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                  v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                  v_ErrorText) THEN
            v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
         
        -- 마지막 레코드 이면 빠져나감
        IF v_Record_Type = 'T' THEN
            v_Trailer_Yn := 'Y';
            EXIT;
        END IF;
                    
    END LOOP;       
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 또는 TRAILER 정보가 없어 처리가 불가 합니다!';
        RAISE e_Error;  
    END IF;    
    
    v_Tdata_Cnt  := 0; -- 데이터 총건수
    v_Acrq_Cnt   := 0; -- 계좌신청건수
    v_Accnrq_Cnt := 0; -- 계좌해지건수
    v_Rmcnrq_Cnt := 0; -- 계좌임의해지건수
  
    -- 송수신파일 처리 결과 업데이트 데이터 SET 획득 
    SELECT  COUNT(*) TDATA_CNT,
            SUM(DECODE(ACRQ_TP, '1', 1, 0)) ACRQ_CNT,
            SUM(DECODE(ACRQ_TP, '3', 1, 0)) ACCNRQ_CNT,
            SUM(DECODE(ACRQ_TP, '7', 1, 0)) RMCNRQ_CNT
    INTO    v_Tdata_Cnt, v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Rqst_Day;

    -- 파일생성여부
    v_Extrc_Yn := 'Y';
    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingB(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingB(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingB;  
  
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 -  출금이체(T) 데이터 파일 파싱하여 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingT (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
/*  
    -- Parsing은 밑에서 프로시저로 처리한다. (한글주의)  
    
    -- 파일데이터(CLOB)를 150 BYTE 씩 잘라서 CURSOR 담는다.
    -- 내용에 한글이있는 경우 CONVRT하여 SUBSTRB로 잘라서 처리하고, 최종저장시 다시 CONVERT한다.
    -- 기관코드(R018:9924216388) 기준으로 -9 위치부터 150BYTE를 자른 후 CONVERT하여 한글포함 150BYTE로 정확하게 잘라냄
    -- 'H000000009924216388EB22101515101502012341234567890123456                                                                                              '
    -- 'R000000029924216388004    956612544555224 0000000096400820123       N    넥센타이어        D15000000527             3                                 '
    CURSOR  Cur_File_Data IS
    SELECT  CONVERT(SUBSTRB(FILE_DATA, 1, 150),'AL32UTF8', 'KO16KSC5601') ROW_DATA
    --SELECT  SUBSTRB(FILE_DATA, 1, 150) ROW_DATA
    FROM    (
            SELECT  ROWNUM RN,
                    CONVERT(FILE_DATA,'KO16KSC5601','AL32UTF8') FILE_DATA 
            FROM    (
                    SELECT DBMS_LOB.SUBSTR(FILE_DATA, 150, DBMS_LOB.INSTR (FILE_DATA, COMPANY_CD, 1, LEVEL)-9) FILE_DATA
                    FROM   (
                            SELECT  v_File_Data FILE_DATA,
                                    DBMS_LOB.GETLENGTH(v_File_Data) LEN,
                                    Pkg_Rtcm0051.f_sRtcm0051Cd('R018') COMPANY_CD
                            FROM    DUAL
                            )                    
                    CONNECT BY LEVEL<= LEN / 100 -- 한글포함 GETLENGTH  150값보다 작게 나오나 정확한 값을 알수 없어 임의로 작은값 설정, NULL 값을 포함 열이 나옴
                    )
            WHERE   FILE_DATA IS NOT NULL -- NULL 값은 제외하여 정상 데이터만 SET
            );
            
*/                        
        
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*FILE 순번             */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT NULL; /*전체청구금액          */
    v_Srecp_Amt  RTRE0099.SRECP_AMT%TYPE DEFAULT NULL; /*정상결제금액          */
    v_Hsrcp_Amt  RTRE0099.HSRCP_AMT%TYPE DEFAULT NULL; /*부분결제금액          */
    v_Erecp_Amt  RTRE0099.ERECP_AMT%TYPE DEFAULT NULL; /*결제실패금액          */

    v_Row_Data   RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*파일내용              */
    v_Del_Yn     RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*삭제여부              */

    v_Company_Cd VARCHAR(10) DEFAULT NULL;             /*기관코드              */ 
    v_Rcms_day   RTRE0070.RCMS_DAY%TYPE DEFAULT NULL;  /*출금이체일자          */
    v_Rcms_Seq   RTRE0070.RCMS_SEQ%TYPE DEFAULT NULL;  /*출금이체일련번호      */
    v_Recp_Amt   RTRE0070.RECP_AMT%TYPE DEFAULT NULL;  /*수납금액              */
    v_Rcms_Amt   RTRE0070.RCMS_AMT%TYPE DEFAULT NULL;  /*출금이체금액          */
    v_Unrecp_Amt RTRE0070.RECP_AMT%TYPE DEFAULT NULL;  /*출금불능금액          */
    v_Ord_No     RTRE0070.ORD_NO%TYPE DEFAULT NULL;    /*계약번호              */ 
    v_Rqst_Stat  RTRE0070.RQST_STAT%TYPE DEFAULT NULL; /*출금이체 상태         */
    v_Rcercd     RTRE0070.RCERCD%TYPE DEFAULT NULL;    /*출금이체 결과코드     */
    
    v_File_Name   RTRE0098.FILE_NM%TYPE DEFAULT NULL;  /*파일명                */
        
    e_Error EXCEPTION;
    v_Row_Count     NUMBER DEFAULT 0;
    v_Data_Len      NUMBER DEFAULT 0;
    v_Record_Len    NUMBER DEFAULT 150; 
    v_Record_Type   VARCHAR(1) DEFAULT NULL; 
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type     VARCHAR2(10);      /*CLOB TYPE        */
    v_Type          VARCHAR2(20);      /*Parsing 구분자   */
    v_Spe_Yn        VARCHAR2(20);      /*별도처리여부     */
    v_Spe_Pos       NUMBER(10);        /*별도처리위치     */
    
    v_Header_Yn  RTRE0099.HEADER_YN%TYPE DEFAULT NULL;  /*HEADER 존재여부       */
    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT NULL; /*TRAILER 존재여부      */
    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT NULL;  /*데이터 총건수         */
    v_Srecp_Cnt  RTRE0099.SRECP_CNT%TYPE DEFAULT NULL;  /*정상결제 처리건수     */
    v_Hsrcp_Cnt  RTRE0099.HSRCP_CNT%TYPE DEFAULT NULL;  /*부분결제 처리건수     */
    v_Erecp_Cnt  RTRE0099.ERECP_CNT%TYPE DEFAULT NULL;  /*결제실패 처리건수     */
    
  BEGIN

    -- 필수값: 요청일자, 파일명, 송수신 파일구분, 파일 순번, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '송수신 파일구분('||v_File_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /* 한글 포함시 자리수 체크가 정확하지 못함으로 주석처리함 
    v_Data_Len := DBMS_LOB.GETLENGTH(v_File_Data);
    
    IF 0 != MOD(v_Data_Len, v_Record_Len) THEN
        v_Return_Message := '파일데이터(CLOB) 길이('||v_Data_Len||')가 올바르지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;*/
    
    
    -- 이미 처리한 자료인지 확인
    IF 0 <> Pkg_Rtre0098.f_sRtre0098CountCheck2(v_Rqst_Day, v_File_Nm) THEN
    
        IF 0 = Pkg_Rtre0099.f_sRtre0099CountCheck2(v_File_Tp, v_Rqst_Day, v_File_Nm, '') THEN
            v_Return_Message := '이미 처리한 자료가 존재하여 처리가 불가 합니다!';
            RAISE e_Error;
        ELSE -- 기존에 처리한 자료가 있으면 RTRE0099는 DEL_YN = 'Y'로 Update, RTRE0098은 DELETE후 재처리
        
            IF Pkg_Rtre0099.f_sRtre0099CountCheck2(v_File_Tp, v_Rqst_Day, v_File_Nm, 'DEL') >= 1 THEN
            
                IF 0 <> Pkg_Rtre0099.f_DeleteRtre0099DelYn(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '기존자료(RTRE0099) Update시 오류입니다.  관리자에게 확인하세요!';
                    RAISE e_Error;
                END IF;
                
            END IF;
            
            IF 0 <> Pkg_Rtre0098.f_Delete0098Day_Nm(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기존자료(RTRE0098) Delete시 오류입니다.  관리자에게 확인하세요!';
                RAISE e_Error;
            END IF;
            
            IF 0 <> Pkg_Rtre0070.f_UpdateRtre0070RqstStat(v_Rqst_Day, '2', v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기존자료(RTRE0070) Update시 오류입니다.  관리자에게 확인하세요!';
                RAISE e_Error;
            END IF;
            
        END  IF;
        
    END IF;
    
    v_Tdata_Cnt  := 0; -- 출금이체 총건수
    v_Tdata_Amt  := 0; -- 전체출금 요청금액
    v_Srecp_Cnt  := 0; -- 정상결제 총건수
    v_Srecp_Amt  := 0; -- 정상결제 처리금액
    v_Hsrcp_Cnt  := 0; -- 부분결제 총건수
    v_Hsrcp_Amt  := 0; -- 부분결제 처리금액
    v_Erecp_Cnt  := 0; -- 결제실패 총건수
    v_Erecp_Amt  := 0; -- 결제실패 처리금액
  
    v_Header_Yn := 'N';
    v_Trailer_Yn:= 'N';
    v_Rcms_day  := v_Rqst_Day;   

                
    -- 기존 등록  자료  check(RTre0099)
    v_File_SEQ := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
    
    --  CLOB 자료 Parsing    
    v_Clob_Type := 'TRANS';
    v_Type      := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    v_Spe_Yn    := 'Y';
    v_Spe_Pos   := 9;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                       v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB자료 Parsing중  오류입니다. 관리자에게 문의하세요!';
        RAISE e_Error;                
    END IF;          
              
   
    v_Row_Count := 0;
    
    --  출금이체처리 내역 반영
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
    
        -- 한글처리를 위하여 자료 CONVERT후에 작업, 나중에 저장할때는 다시 CONVERT
        v_Row_Data := CONVERT(v_Row_Data,'KO16KSC5601','AL32UTF8');
        
        v_Record_Type := TO_CHAR(SUBSTR(v_Row_Data, 1, 1)); -- 레코드 구분
        v_Rcms_Seq    := TO_CHAR(SUBSTR(v_Row_Data,2,8));      -- 출금이체 일련번호

        -- 기관코드(이용기관식별코드)
        v_Company_Cd := TRIM(SUBSTR(v_Row_Data, 10, 10));
                
        IF v_Company_Cd != Pkg_Rtcm0051.f_sRtcm0051Cd('R018') THEN
            v_Return_Message := '파일상의 이용기간식별코드('||v_Company_Cd||') 값이 상이하므로 처리가 불가 합니다!';
            RAISE e_Error;                
        END IF;
                

        -- 첫번째 데이터는 반듯이 HEADER 정보가 존재해야 하며 없으면 에러처리
        IF v_Row_Count = 1 THEN
        
            IF v_Record_Type = 'H' THEN
                
                -- FILE이름
                v_File_Name := TRIM(SUBSTR(v_Row_Data, 20, 8)); 
                
                IF v_File_Name != v_File_Nm THEN
                    v_Return_Message := '파일상의 파일명('||v_File_Name||') 값이 상이하므로('||v_File_Nm||') 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
                
                -- HEADER 존재여부       
                v_Header_Yn := 'Y';  
                    
            ELSE
                v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 정보가 없어 처리가 불가 합니다!';
                RAISE e_Error;                
            END IF;
            
        ELSE
         
            -- 데이터 부분이면 파싱한 데이터를 등록함   
            IF v_Record_Type = 'R' THEN
                            
                v_Unrecp_Amt := TO_CHAR(SUBSTR(v_Row_Data, 43, 13));  -- 출금불능금액      
                v_Rqst_Stat  := TRIM(SUBSTR(v_Row_Data, 69, 1));   -- 처리결과-결과코드
                v_Rcercd     := TRIM(SUBSTR(v_Row_Data, 70, 4));   -- 처리결과-불능코드
                v_Ord_No     := TRIM(SUBSTRB(v_Row_Data, 92, 20));  -- 납부자번호      

                IF    v_Rqst_Stat = 'N' THEN
                    v_Rqst_Stat := '3';
                ELSIF v_Rqst_Stat = 'P' THEN
                    v_Rqst_Stat := '4';
                ELSE
                    v_Rqst_Stat := '5';
                    v_Rcercd    := '0000';
                END IF;
                

                -- 출금이체 정보 Count - DATA 일련번호와 납부자번로 RTRE0070내역과 동일한지 체크
                IF 0 < Pkg_Rtre0070.f_sRtre0070OrdCount(v_Rcms_Day, v_Rcms_Seq, v_Ord_No) THEN
                   v_Rcms_Amt  := Pkg_Rtre0070.f_sRtre0070RcmsAmt(v_Rcms_Day, v_Rcms_Seq, v_Ord_No);
                   v_Recp_Amt  := v_Rcms_Amt - v_Unrecp_Amt;
                
                    -- 출금이체 내역(RTRE0070) Update - 처리구분, 출금액 , 결과코드를 변경
                    IF 0 <> Pkg_Rtre0070.f_UpdateRtre0070RqstResult (v_Rcms_Day, v_Rcms_Seq, v_Rqst_Stat, v_Rcercd,
                                                                     v_Recp_Amt, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '출금이체 내역(RTRE0070) Update - 계좌신청처리 상태,결과코드를 변경 중 에러!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;  
                    
                ELSE                  
                    v_Return_Message := '출금이체상세정보 오류(일련번호'||v_Rcms_Seq||'계약자'||v_Ord_No||')가 없어서 처리가 불가 합니다!';
                    RAISE e_Error;
                
                END IF;
                
                
            -- 마지막 레코드 이면
            ELSIF v_Record_Type = 'T' THEN           
            
                -- FILE이름
                v_File_Name := TRIM(SUBSTR(v_Row_Data, 20, 8)); 
                
                IF v_File_Name != v_File_Nm THEN
                    v_Return_Message := '파일상의 파일명('||v_File_Name||') 값이 상이하므로('||v_File_Nm||') 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;

                v_Erecp_Cnt := TO_CHAR(SUBSTR(v_Row_Data,36,8));
                v_Erecp_Amt := TO_CHAR(SUBSTR(v_Row_Data,44,13));
                v_Hsrcp_Cnt := TO_CHAR(SUBSTR(v_Row_Data,57,8));
                v_Hsrcp_Amt := TO_CHAR(SUBSTR(v_Row_Data,65,13));
                
                -- TRAILER 존재여부
                v_Trailer_Yn := 'Y';
                    
            END IF;            
            
        END IF;        
        
        -- 출금이체 Data Record - 파일 송수신 내역 Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Rcms_Seq, v_File_Tp, 
                                  v_File_Seq, CONVERT(v_Row_Data,'AL32UTF8', 'KO16KSC5601'), v_Del_Yn, v_Reg_Id, 
                                  v_ErrorText) THEN
            v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
         
        -- 마지막 레코드 이면 빠져나감
        IF v_Record_Type = 'T' THEN
            v_Trailer_Yn := 'Y';
            EXIT;
        END IF;
                    
    END LOOP;       
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 또는 TRAILER 정보가 없어 처리가 불가 합니다!';
        RAISE e_Error;  
    END IF;
            
    -- 출금이체 처리 결과 업데이트 데이터 SET 획득 
    v_Tdata_Cnt := Pkg_Rtre0070.f_sRtre0070TotCount(v_Rcms_Day);
    v_Tdata_Amt := Pkg_Rtre0070.f_sRtre0070TotAmt(v_Rcms_Day);
    v_Srecp_Cnt := 0;   --v_Tdata_Cnt - v_Erecp_Cnt -  v_Hsrcp_cnt;
    v_Srecp_Amt := 0;   --v_Tdata_Amt - v_Erecp_Amt -  v_Hsrcp_Amt

    IF 0 != Pkg_Rtre0099.f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             'Y', 'N', 'N', 'N', 
                             NULL, NULL, NULL, v_Header_Yn, 
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, 0, 
                             0, 0, 0, 0, 
                             0, 0, v_Srecp_Cnt, v_Srecp_Amt, 
                             v_Hsrcp_Cnt, v_Hsrcp_Amt, v_Erecp_Cnt, v_Erecp_Amt, 
                             0, 0, 0, 0, 
                             'N', v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '송수신 작업(RTRE0099) 데이터 생성 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;

    END IF;
        
    
    UPDATE Rtre0070
    SET RQST_STAT = '5',
        RECP_AMT  = RCMS_AMT
    WHERE RCMS_DAY  = v_Rcms_Day
    AND   RQST_STAT = '2';


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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.f_InsertRtre0098FileParsingT(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.f_InsertRtre0098FileParsingT(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingT;  
  
      
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 -  카드이체(C) 결과 파일 UPLOAD
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingC (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    v_Header_Yn  RTRE0099.HEADER_YN%TYPE  DEFAULT NULL;/*HEADER 존재여부       */
    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT NULL;/*TRAILER 존재여부      */
    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE  DEFAULT NULL;/*데이터 총건수         */
    v_Srecp_Cnt  RTRE0099.SRECP_CNT%TYPE  DEFAULT NULL;/*정상결제 처리건수     */
    v_Hsrcp_Cnt  RTRE0099.HSRCP_CNT%TYPE  DEFAULT NULL;/*부분결제 처리건수     */
    v_Erecp_Cnt  RTRE0099.ERECP_CNT%TYPE  DEFAULT NULL;/*결제실패 처리건수     */
    
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*FILE 순번             */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT NULL; /*전체청구금액          */
    v_Srecp_Amt  RTRE0099.SRECP_AMT%TYPE DEFAULT NULL; /*정상결제금액          */
    v_Erecp_Amt  RTRE0099.ERECP_AMT%TYPE DEFAULT NULL; /*결제실패금액          */

    v_Row_Data   RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*파일내용              */
    v_Del_Yn     RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*삭제여부              */

    v_Recp_Amt   RTRE0080.RECP_AMT%TYPE DEFAULT NULL;  /*수납금액              */
    v_Rcrd_day   RTRE0080.RCRD_DAY%TYPE DEFAULT NULL;  /*카드이체일자          */
    v_Rcrd_Seq   RTRE0080.RCRD_SEQ%TYPE DEFAULT NULL;  /*카드이체일련번호      */
    v_Rcrd_Amt   RTRE0080.RCRD_AMT%TYPE DEFAULT NULL;  /*카드이체금액          */
    v_Tno        RTRE0080.TNO%TYPE DEFAULT NULL;       /*KCP 거래번호          */
    v_Rqst_Stat  RTRE0080.RQST_STAT%TYPE DEFAULT NULL; /*카드이체 상태         */
    v_Crercd     RTRE0080.CRERCD%TYPE DEFAULT NULL;    /*카드이체 결과코드     */
    v_Batch_Key  RTRE0080.BATCH_KEY%TYPE DEFAULT NULL; /*배치 KEY              */
    
    v_File_Name  RTRE0098.FILE_NM%TYPE DEFAULT NULL;   /*파일명                */
        
    v_Row_Count     NUMBER DEFAULT 0;
    v_Data_Len      NUMBER DEFAULT 0;
    v_Record_Len    NUMBER DEFAULT 150; 
    v_Record_Type   VARCHAR(1) DEFAULT NULL; 
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type     VARCHAR2(10);      /*CLOB TYPE        */
    v_Type          VARCHAR2(20);      /*Parsing 구분자   */
    v_Spe_Yn        VARCHAR2(20);      /*별도처리여부     */
    v_Spe_Pos       NUMBER(10);        /*별도처리위치     */
  
    e_Error EXCEPTION;
  BEGIN
  
    -- 필수값: 요청일자, 파일명, 송수신 파일구분, 파일 순번, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '송수신 파일구분('||v_File_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /* 한글 포함시 자리수 체크가 정확하지 못함으로 주석처리함 
    v_Data_Len := DBMS_LOB.GETLENGTH(v_File_Data);
    
    IF 0 != MOD(v_Data_Len, v_Record_Len) THEN
        v_Return_Message := '파일데이터(CLOB) 길이('||v_Data_Len||')가 올바르지 않아 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;*/
    
    
    -- 이미 처리한 자료인지 확인
    IF 0 <> Pkg_Rtre0098.f_sRtre0098CountCheck2(v_Rqst_Day, v_File_Nm) THEN
    
        IF 0 = Pkg_Rtre0099.f_sRtre0099CountCheck2(v_File_Tp, v_Rqst_Day, v_File_Nm, '') THEN
            v_Return_Message := '이미 처리한 자료가 존재하여 처리가 불가 합니다!';
            RAISE e_Error;
        ELSE -- 기존에 처리한 자료가 있으면 DEL_YN = 'Y'로 Update후 재처리
        
            IF Pkg_Rtre0099.f_sRtre0099CountCheck2(v_File_Tp, v_Rqst_Day, v_File_Nm, 'DEL') >= 1 THEN
            
                IF 0 <> Pkg_Rtre0099.f_DeleteRtre0099DelYn(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '기존자료(RTRE0099) Update시 오류입니다.  관리자에게 확인하세요!';
                    RAISE e_Error;
                END IF;
                
            END IF;
            
            IF 0 <> Pkg_Rtre0098.f_Delete0098Day_Nm(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기존자료(RTRE0098) Delete시 오류입니다.  관리자에게 확인하세요!';
                RAISE e_Error;
            END IF;
            
            IF 0 <> Pkg_Rtre0080.f_UpdateRtre0080RqstStat(v_Rqst_Day, '2', v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '기존자료(RTRE0080) Update시 오류입니다.  관리자에게 확인하세요!';
                RAISE e_Error;
            END IF;
            
        END  IF;
        
    END IF;
    
    v_Tdata_Cnt  := 0; -- 출금이체 총건수
    v_Tdata_Amt  := 0; -- 전체출금 요청금액
    v_Srecp_Cnt  := 0; -- 정상결제 총건수
    v_Srecp_Amt  := 0; -- 정상결제 처리금액
    v_Erecp_Cnt  := 0; -- 결제실패 총건수
    v_Erecp_Amt  := 0; -- 결제실패 처리금액
  
    v_Header_Yn  := 'N';
    v_Trailer_Yn := 'N';
    v_Rcrd_day  := v_Rqst_Day;   
    
    -- 기존 등록  자료  check(RTre0099)
    v_File_SEQ := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
   
    --  CLOB 자료 Parsing    
    v_Clob_Type := 'CARD';
    v_Type      := CHR(13)||CHR(10);
    v_Spe_Yn    := 'N';
    v_Spe_Pos   := 0;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                       v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB자료 Parsing중  오류입니다. 관리자에게 문의하세요!';
        RAISE e_Error;                
    END IF;                                 

    v_Row_Count := 0;
    
    --  출금이체처리 내역 반영
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
        
        /*
        -- 한글처리를 위하여 자료 CONVERT후에 작업, 나중에 저장할때는 다시 CONVERT
        v_Row_Data := CONVERT(v_Row_Data,'KO16KSC5601','AL32UTF8');
        --DBMS_OUTPUT.Put_Line('v_Row_Data CONVERT 이후 = ' || v_Row_Data);
        */
         
        v_Record_Type := SUBSTR(v_Row_Data, 1, 1); -- 레코드 구분

        -- 첫번째 데이터는 반듯이 HEADER 정보가 존재해야 하며 없으면 에러처리
        IF v_Row_Count = 1 THEN
        
            -- 기관코드(이용기관식별코드)
            IF TRIM(SUBSTR(v_Row_Data, 6, 10)) != Pkg_Rtcm0051.f_sRtcm0051Cd('R023') THEN
                v_Return_Message := '파일상의 이용기간식별코드('||TRIM(SUBSTR(v_Row_Data, 6, 10))||') 값이 상이하므로 처리가 불가 합니다!';
                RAISE e_Error;                
            END IF;

            IF v_Record_Type = 'S' THEN
                
                /*
                -- 요청일자 CHECK
                IF v_Rqst_day <> TRIM(SUBSTR(v_Row_Data, 16, 8)) THEN
                    v_Return_Message := '요청일자('||v_Rqst_Day||') 와 전송일자('||TRIM(SUBSTR(v_Row_Data, 16, 8))
                                        ||') 값이 상이하므로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
                */
                
                -- HEADER 존재여부  
                v_Header_Yn := 'Y';  
                v_Rcrd_Seq  := 0;
                    
            ELSE
                v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 정보가 없어 처리가 불가 합니다!';
                RAISE e_Error;                
            END IF;
            
        ELSE
         
            -- 데이터 부분이면 파싱한 데이터를 등록함   
            IF v_Record_Type = 'D' THEN
                            
                -- 사이트코드 CHECK
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('R024') <> TRIM(SUBSTR(v_Row_Data, 9, 10)) THEN
                    v_Return_Message := '공통코드('||Pkg_Rtcm0051.f_sRtcm0051Cd('R024')||') 와 사이트코드('
                                        ||TRIM(SUBSTR(v_Row_Data, 9, 10))||') 값이 상이하므로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
                
                -- 정기과금서비스그룹 CHECK
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('R025') <> TRIM(SUBSTR(v_Row_Data, 20, 12)) THEN
                    v_Return_Message := '공통코드('||Pkg_Rtcm0051.f_sRtcm0051Cd('R025')||') 와 정기과금서비스그룹('
                                        ||TRIM(SUBSTR(v_Row_Data, 20, 12))||') 값이 상이하므로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
                
                v_Rcrd_Seq   := TO_CHAR(SUBSTR(v_Row_Data, 2, 7));
                v_Tno := NVL(TRIM(SUBSTR(v_Row_Data, 70, 14)), '');
                v_Crercd     := TRIM(SUBSTR(v_Row_Data, 295 - 7, 4));   -- 처리결과-불능코드

--                IF v_Tno IS NOT NULL THEN     -- KCP거래번호 있으면 정상
                IF v_Crercd = '0000' THEN     -- 처리결과코드가 '0000'  이면 정상

                    -- 배치KEY/청구금액 조회
                    Pkg_Rtre0080.p_sRtre0080BatchAndAmt(v_Rcrd_Day, v_Rcrd_Seq, v_Rcrd_Amt, v_Batch_Key, 
                                                        v_Success_Code, v_Return_Message, v_ErrorText);
                    IF v_Success_Code <> 0 THEN
                        RAISE e_Error;
                    END IF;
                    
                    IF TRIM(v_Batch_Key) <> TRIM(SUBSTR(v_Row_Data, 32, 16)) THEN
                        v_Return_Message := '배치KEY('||TRIM(v_Batch_Key)||') 와 인증키('
                                            ||TRIM(SUBSTR(v_Row_Data, 32, 16))||') 값이 상이하므로 처리가 불가 합니다!';
                        RAISE e_Error;
                    END IF;   
                    
                    v_Recp_Amt := TO_CHAR(SUBSTR(v_Row_Data, 56, 12));
                    
                    IF v_Rcrd_Amt <> v_Recp_Amt THEN
                        v_Return_Message := '청구금액('||TO_CHAR(v_Rcrd_Amt)||') 과 결제금액('
                                            ||TO_CHAR(v_Recp_Amt)||') 값이 상이하므로 처리가 불가 합니다!';
                        RAISE e_Error;
                    END IF;   
                
                    v_Rqst_Stat  := '5';   -- 처리결과-결과코드
                    v_Crercd     := '0000';
                    
                ELSE

                    v_Rqst_Stat  := '3';   -- 처리결과-결과코드
                    --v_Crercd     := TRIM(SUBSTR(v_Row_Data, 295, 4));   -- 처리결과-불능코드
                    v_Crercd     := TRIM(SUBSTR(v_Row_Data, 295 - 7, 4));   -- 처리결과-불능코드
                    v_Recp_Amt   := 0;


                END IF;


                -- 카드이체 내역(RTRE0080) Update - 처리구분, 출금액 , 결과코드를 변경
                IF 0 <> Pkg_Rtre0080.f_UpdateRtre0080RqstResult (v_Rcrd_Day, v_Rcrd_Seq, v_Rqst_Stat, v_Tno, v_Crercd,
                                                                 v_Recp_Amt, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '출금이체 내역(RTRE0080) Update - 카드이체처리 상태,결과코드를 변경 중 에러!!.'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;  
                
                
            -- 마지막 레코드 이면
            ELSIF v_Record_Type = 'E' THEN           
            
                v_Tdata_Cnt := TO_CHAR(SUBSTR(v_Row_Data,9,7));   -- 카드이체 총건수
                v_Tdata_Amt := TO_CHAR(SUBSTR(v_Row_Data,16,12)); -- 전체이체 요청금액
                v_Srecp_Cnt := TO_CHAR(SUBSTR(v_Row_Data,47,7));  -- 정상결제 총건수
                v_Srecp_Amt := TO_CHAR(SUBSTR(v_Row_Data,54,12)); -- 정상결제 총금액
                v_Erecp_Cnt := TO_CHAR(SUBSTR(v_Row_Data,66,7));  -- 결제실패 총건수
                v_Erecp_Amt := TO_CHAR(SUBSTR(v_Row_Data,73,12)); -- 결제실패 총금액 
                
                -- 카드이체 Data 전체건수 CHECK
                IF v_Tdata_Cnt <> (v_Srecp_Cnt  + v_Erecp_Cnt) THEN
                    v_Return_Message := '종료부분의 전체건수('||TO_CHAR(v_Tdata_cnt)||') 과 계산건수('
                                        ||TO_CHAR(v_Srecp_Cnt  + v_Erecp_Cnt)||') 값이 상이하므로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
        
                -- 카드이체 Data 전체금액 CHECK
                IF v_Tdata_Amt <> (v_Srecp_Amt  + v_Erecp_Amt) THEN
                    v_Return_Message := '종료부분의 전체금액('||TO_CHAR(v_Tdata_Amt)||') 과 계산금액('
                                        ||TO_CHAR(v_Srecp_Amt  + v_Erecp_Amt)||') 값이 상이하므로 처리가 불가 합니다!';
                    RAISE e_Error;
                END IF;
        
                -- TRAILER 존재여부
                v_Trailer_Yn := 'Y';
                v_Rcrd_Seq   := 99999999;
                    
            END IF;            
            
        END IF;          
      
                
        -- 카드이체 Data Record - 파일 송수신 내역 Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Rcrd_Seq, v_File_Tp, 
                                  --v_File_Seq, CONVERT(v_Row_Data,'AL32UTF8', 'KO16KSC5601'), v_Del_Yn, v_Reg_Id, 
                                  v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                  v_ErrorText) THEN
            v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
        
        -- 마지막 레코드 이면 빠져나감
        IF v_Record_Type = 'T' THEN
            v_Trailer_Yn := 'Y';
            EXIT;
        END IF;
                    
    END LOOP;       
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    
    
        
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 또는 TRAILER 정보가 없어 처리가 불가 합니다!';
        RAISE e_Error;  
    END IF;
        
    -- 출금이체 처리결과(RTRE0099) 생성
    /*    
    IF 0 <> Pkg_Rtre0099.f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn, 
                             v_Stdex_Dd, v_Str_Day, v_End_Day, v_Header_Yn, 
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, v_Acrq_Cnt, 
                             v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reqst_Cnt, v_Reqst_Amt, 
                             v_Cncrq_Cnt, v_Cncrq_Amt, v_Srecp_Cnt, v_Srecp_Amt, 
                             v_Hsrcp_Cnt, v_Hsrcp_Amt, v_Erecp_Cnt, v_Erecp_Amt, 
                             v_Scnrq_Cnt, v_Scnrq_Amt, v_Ecnrq_Cnt, v_Ecnrq_Amt, 
                             v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
    */
              
    IF 0 <> Pkg_Rtre0099.f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             'Y', 'N', 'N', 'N', 
                             NULL, NULL, NULL, v_Header_Yn, 
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, 0, 
                             0, 0, 0, 0, 
                             0, 0, v_Srecp_Cnt, v_Srecp_Amt, 
                             0, 0, v_Erecp_Cnt, v_Erecp_Amt, 
                             0, 0, 0, 0, 
                             'N', v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '송수신 작업(RTRE0099) 데이터 생성 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingC(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingC(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingC;    
  
  /*****************************************************************************
  -- 파일 송수신 내역(RTRE0098) 생성 - 현금영수증 데이터 파일 파싱하여 생성
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingCh (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*요청일자              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*송수신 파일구분       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*파일 순번             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*파일데이터(CLOB)      */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER 존재여부       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER 존재여부      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*데이터 총건수         */
    v_Tdata_Amt      IN OUT RTRE0099.TDATA_AMT%TYPE,  /*데이터 총금액         */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
/*    
    -- 파일데이터(CLOB)를 ';' 구분하여 잘라서 CURSOR 담는다.                             '
    CURSOR  Cur_File_Data IS    
    SELECT  ROW_DATA, COUNT(*) OVER () AS CNT
    FROM    (                                          
            SELECT  DBMS_LOB.SUBSTR(FILE_DATA, DBMS_LOB.INSTR (FILE_DATA, CRLF, 1, LEVEL) - NVL(DBMS_LOB.INSTR (FILE_DATA, CRLF, 1, LEVEL-1)+1,1) , NVL(DBMS_LOB.INSTR (FILE_DATA, CRLF, 1, LEVEL-1)+1,1)) ROW_DATA
            FROM   (
                    SELECT  v_File_Data FILE_DATA,
                            REGEXP_COUNT(v_File_Data, ';') CNT, -- 속도 저하문제가 있어 개선필요,건수를 입렵받던가 아님 평션으로 구성
                            ';' CRLF
                    FROM    DUAL
                    )                    
            CONNECT BY LEVEL<= CNT
            );
*/
    
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;    /*ROW 순번              */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;   /*파일내용              */
    v_Row_Data2 RTRE0098.ROW_DATA%TYPE DEFAULT NULL;   /*파일내용              */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';      /*삭제여부              */
    v_Mat_Nm    RTCS0100.MAT_NM%TYPE DEFAULT NULL;     /*상품명                */

    v_Recv_Seq   RTRE0091.RECV_SEQ%TYPE DEFAULT NULL;  /*수납거래번호          */
    v_Cash_Seq   RTRE0091.CASH_SEQ%TYPE DEFAULT NULL;  /*현금영수증 발행 일련번*/
    v_Cash_Stat  RTRE0091.CASH_STAT%TYPE DEFAULT NULL; /*현금영수증 발행상태   */
    v_Csercd     RTRE0091.CSERCD%TYPE DEFAULT NULL;    /*발급오류코드          */
    v_Csermsg    RTRE0091.CSERMSG%TYPE DEFAULT NULL;   /*발급오류메세지        */
    v_Cashapp_No RTRE0091.CASHAPP_NO%TYPE DEFAULT NULL;/*현금영수증 승인번호   */
    v_Cash_Amt   RTRE0091.CASH_AMT%TYPE DEFAULT NULL;  /*현금영수증 발행금액   */
            
    v_Row_Count     NUMBER DEFAULT 0;
    v_Total_Count   NUMBER DEFAULT 0;    
    v_Sum_Amt       NUMBER DEFAULT 0;
    e_Error EXCEPTION;
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type     VARCHAR2(10);      /*CLOB TYPE        */
    v_Type          VARCHAR2(20);      /*Parsing 구분자   */
    v_Spe_Yn        VARCHAR2(20);      /*별도처리여부     */
    v_Spe_Pos       NUMBER(10);        /*별도처리위치     */   
    
  BEGIN
  
    -- 필수값: 요청일자, 파일명, 송수신 파일구분, 파일 순번, 등록자 ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '요청일자('||v_Rqst_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- KCP_BATCH_FILE_CH01_INX_V3770_20150820
    IF (TRIM(v_File_Nm) IS NULL) OR (38 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '파일명('||v_File_Nm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '송수신 파일구분('||v_File_Tp||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Seq) IS NULL THEN
        v_Return_Message := '파일 순번('||v_File_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    v_Row_Count := 0;
    v_Tdata_Amt := 0;   
    v_Header_Yn := 'N';
    v_Trailer_Yn:= 'N';
        
    --  송수신처리 내역(1건) 기준 기존 송신 파일 내역 CLEAR

    --  CLOB 자료 Parsing    
    v_Clob_Type := 'CASH';
    v_Type      := ';';
    v_Spe_Yn    := 'N';
    v_Spe_Pos   := 0;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                       v_Total_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB자료 Parsing중  오류입니다. 관리자에게 문의하세요!';
        RAISE e_Error;                
    END IF;                      
    
    
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
        
        -- 첫번째 데이터는 HEADER 정보
        IF v_Row_Count = 1 THEN
                
            -- HEADER 존재여부       
            v_Header_Yn := 'Y'; 
                
        -- 마지막 데이터는 TRAILER 정보     
        ELSIF v_Row_Count = v_Total_Count THEN
        
            -- TRAILER 존재여부
            v_Trailer_Yn := 'Y';
            
            -- REGEXP_SUBSTR 이용하여 위치값 획득하기 위해 1차 가공
            v_Row_Data2    := REPLACE(v_Row_Data,'||','| |');   
            v_Row_Data2    := REPLACE(v_Row_Data2,'||','| |');   
    
            -- 거래금액 합계 금액
            v_Sum_Amt := TO_NUMBER(TRIM(REPLACE(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,11),',','')));
            
            -- 거래금액 합계와 데이터 총금액이 상이하면 오류처리
            IF v_Sum_Amt <> v_Tdata_Amt THEN
                v_Return_Message := '거래금액 합계('||v_Sum_Amt||')와 데이터 총금액'||v_Tdata_Amt||'이 상이 하므로 처리가 불가 합니다.!';
                RAISE e_Error;
            END IF;            
            
            EXIT;
        
        -- 데이터 처리 부분
        ELSE
                
            -- 송신전문 Data Record 생성용  요청일자/파일명 기준 ROW 순번 획득
            v_Row_Seq := Pkg_Rtre0098.f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);

            -- 송신전문 Data Record - 파일 송수신 내역 Insert
            IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                      v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                      v_ErrorText) THEN
                v_Return_Message := '파일 송수신 내역(RTRE0098) 생성 중 에러 발생!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
            -- REGEXP_SUBSTR 이용하여 위치값 획득하기 위해 1차 가공
            v_Row_Data2    := REPLACE(v_Row_Data,'||','| |');   
            v_Row_Data2    := REPLACE(v_Row_Data2,'||','| |');    
            
            --  상품명 ( LPAD(수납거래번호,12,'0')+ LPAD(현금영수증 발행 일련번호, 3,'0'))
            v_Mat_Nm := TRIM(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,16));
            
            -- 수납거래번호 : TO_NUMBER(SUBSTR("상품명", 1, 12))
            v_Recv_Seq := TO_NUMBER(SUBSTR(v_Mat_Nm, 1, 12));        
                    
            IF TRIM(v_Recv_Seq) IS NULL THEN
                v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 획득 실패로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
    
            -- 현금영수증 발행 일련번호 : TO_NUMBER(SUBSTR("상품명", 13, 3))
            v_Cash_Seq := TO_NUMBER(SUBSTR(v_Mat_Nm, 13, 3));
             
            IF TRIM(v_Cash_Seq) IS NULL THEN
                v_Return_Message := '현금영수증 발행 일련번호('||v_Cash_Seq||') : 획득 실패로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
            
            IF 0 = Pkg_Rtre0091.f_sRtre0091Count(v_Recv_Seq, v_Cash_Seq) THEN
                v_Return_Message := '현금영수증발급내역('||v_Recv_Seq||'-'||v_Cash_Seq||')이 없는 정보이므로 처리가 불가 합니다!';
                RAISE e_Error;
            END IF;
            
            -- 현금영수증 발행금액
            v_Cash_Amt := TO_NUMBER(TRIM(REPLACE(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,11),',','')));
             
            -- 원승인번호
            v_Cashapp_No := TRIM(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,6));
            
            -- 현금영수증 발행상태 : 승인번호 있으면 발행정상('4'), 없으면 발행오류('3')
            IF v_Cashapp_No IS NOT NULL THEN
                v_Cash_Stat := '4';
            ELSE
                v_Cash_Stat := '3';
            END IF;
            
            -- 발급오류메세지 : '에러메시지'
            v_Csermsg := TRIM(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,17));
            
            BEGIN
                -- 발급오류코드: 에러코드가 있는 경우 없으면 NULL,  있으면 에러메시지를 이용하여 코드 찾기 ( 공통코드 [R028] KCP 결과코드 )
                SELECT CD 
                INTO   v_Csercd
                FROM   RTCM0051
                WHERE  CD_GRP_CD = 'R028'
                AND    CD_NM     = v_Csermsg
                AND    ROWNUM   <= 1;
                
                EXCEPTION
                  WHEN OTHERS THEN
                    v_Csercd := NULL;
            END;
                
            -- 현금영수증발급내역(RTRE0091) Update 
            IF 0 != Pkg_Rtre0091.f_UpdateRtre0091CashUload (v_Recv_Seq, v_Cash_Seq, v_Cash_Stat, v_Cashapp_No, 
                                                            v_Csercd, v_Csermsg, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := ' 현금영수증발급내역(RTRE0091) Update 실패!!. 관리자에게 확인하세요!!.'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
            -- 데이터 총금액
            v_Tdata_Amt := v_Tdata_Amt + NVL(v_Cash_Amt,0);
            
        END IF;        
             
    END LOOP;       
    
    -- 데이터 총건수
    v_Tdata_Cnt := v_Row_Count;
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '데이터 파일 파싱하여 생성 중 에러 - HEADER 또는 TRAILER 정보가 없어 처리가 불가 합니다!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingCh(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingCh(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingCh;  
  
              
END Pkg_Rtre0098;