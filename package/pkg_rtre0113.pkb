CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0113 AS
/*******************************************************************************
   NAME      Pkg_Rtre0113
   PURPOSE   채권 관리 처리결과 등록 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Count
  *****************************************************************************/
  FUNCTION f_sRtre0113Count(
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,          /*고객번호            */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE          /*채권관리순번        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0113
    WHERE   CUST_NO  = v_Cust_No
    AND     RAMG_SEQ = v_Ramg_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0113Count;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*채권관리순번          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*계약번호              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*채권관리결과등록일    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*채권관리결과등록구분  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*채권관리결과내용      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            A.RAMG_SEQ,                  /*채권관리순번        */
            A.RAMG_YM,                   /*채권관리년월        */
            A.ORD_NO,                    /*계약번호            */
            A.CNTCT_DAY,                 /*채권관리결과등록일  */
            A.CNTCT_GB,                  /*채권관리결과등록구분*/
            A.CNTCT_DESC,                /*채권관리결과내용    */
            A.ATTCH_FL_SEQ,              /*첨부파일정보        */
            A.DEL_YN,                    /*삭제여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0113 A
    WHERE   A.CUST_NO                = DECODE(v_Cust_No    , NULL, A.CUST_NO    , v_Cust_No)
    AND     A.RAMG_SEQ               = DECODE(v_Ramg_Seq   , NULL, A.RAMG_SEQ   , v_Ramg_Seq)
    AND     A.RAMG_YM                = DECODE(v_Ramg_Ym    , NULL, A.RAMG_YM    , v_Ramg_Ym)
    AND     A.ORD_NO                 = DECODE(v_Ord_No     , NULL, A.ORD_NO     , v_Ord_No)
    AND     A.CNTCT_DAY              = DECODE(v_Cntct_Day  , NULL, A.CNTCT_DAY  , v_Cntct_Day)
    AND     A.CNTCT_GB               = DECODE(v_Cntct_Gb   , NULL, A.CNTCT_GB   , v_Cntct_Gb)
    AND     A.CNTCT_DESC             = DECODE(v_Cntct_Desc , NULL, A.CNTCT_DESC , v_Cntct_Desc)
    AND     (v_Attch_Fl_Seq IS NULL OR A.ATTCH_FL_SEQ = v_Attch_Fl_Seq)
    AND     A.DEL_YN                 = DECODE(v_Del_Yn     , NULL, A.DEL_YN     , v_Del_Yn)
    AND     A.REG_ID                 = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0113;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*채권관리순번          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*계약번호              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*채권관리결과등록일    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*채권관리결과등록구분  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*채권관리결과내용      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0113 (
            CUST_NO,
            RAMG_SEQ,
            RAMG_YM,
            ORD_NO,
            CNTCT_DAY,
            CNTCT_GB,
            CNTCT_DESC,
            ATTCH_FL_SEQ,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Cust_No,
            v_Ramg_Seq,
            v_Ramg_Ym,
            v_Ord_No,
            v_Cntct_Day,
            v_Cntct_Gb,
            v_Cntct_Desc,
            v_Attch_Fl_Seq,
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

  END f_InsertRtre0113;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*채권관리순번          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*계약번호              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*채권관리결과등록일    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*채권관리결과등록구분  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*채권관리결과내용      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0113
    SET    --RAMG_YM      = v_Ramg_Ym,
           --ORD_NO       = v_Ord_No,
           --CNTCT_DAY    = v_Cntct_Day,
           CNTCT_GB     = v_Cntct_Gb,
           CNTCT_DESC   = v_Cntct_Desc,
           --ATTCH_FL_SEQ = v_Attch_Fl_Seq,-- 첨부파일SEQ는 최초생성시 무조건 생성등록하므로 업데이트는 안함
           --DEL_YN       = v_Del_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE 
    WHERE  CUST_NO      = v_Cust_No
    AND    RAMG_SEQ     = v_Ramg_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0113;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*채권관리순번          */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0113
    SET    DEL_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  CUST_NO  = v_Cust_No
    AND    RAMG_SEQ = v_Ramg_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0113;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0113 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN OUT RTRE0113.RAMG_SEQ%TYPE,   /*채권관리순번          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*계약번호              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*채권관리결과등록일    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*채권관리결과등록구분  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*채권관리결과내용      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값:고객번호,채권관리년월, 채권관리결과등록일, 삭제여부, 등록자 ID    
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Ramg_Ym) IS NULL) OR (0 != ISDATE(v_Ramg_Ym)) THEN
        v_Return_Message := '채권관리년월('||v_Ramg_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
    
    /*
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    */
    
    IF (TRIM(v_Cntct_Day) IS NULL) OR (0 != ISDATE(v_Cntct_Day)) THEN
        v_Return_Message := '채권관리결과등록일('||v_Cntct_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
    
    IF (TRIM(v_Del_Yn) IS NULL) OR (TRIM(v_Del_Yn) NOT IN('Y','N')) THEN
        v_Return_Message := '삭제여부('||v_Del_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        v_Ramg_Seq := Pkg_Rtre0113.f_sRtre0113RamgSeq(v_Cust_No);

        IF 0 != f_InsertRtre0113(v_Cust_No, v_Ramg_Seq, v_Ramg_Ym, v_Ord_No, 
                                 v_Cntct_Day, v_Cntct_Gb, v_Cntct_Desc, v_Attch_Fl_Seq,
                                 v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '채권 관리 처리결과 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0113Count(v_Cust_No, v_Ramg_Seq) THEN
            v_Return_Message := '해당  채권 관리 처리결과('||v_Cust_No||'-'||v_Ramg_Seq||') 정보가 존재하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
       
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0113(v_Cust_No, v_Ramg_Seq, v_Ramg_Ym, v_Ord_No, 
                                     v_Cntct_Day, v_Cntct_Gb, v_Cntct_Desc, v_Attch_Fl_Seq, 
                                     v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '채권 관리 처리결과 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0113(v_Cust_No, v_Ramg_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '채권 관리 처리결과 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0113.p_IUDRtre0113(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0113.p_IUDRtre0113(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0113;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Select - RE-040106_추심결과 등록 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0113List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE          /*계약번호              */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*고객번호            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM,                /*고객명              */
            A.RAMG_SEQ,                  /*채권관리순번        */
            A.RAMG_YM,                   /*채권관리년월        */
            A.ORD_NO,                    /*계약번호            */
            A.CNTCT_DAY,                 /*채권관리결과등록일  */
            A.CNTCT_GB,                  /*채권관리결과등록구분*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R036', A.CNTCT_GB) CNTCT_GB_NM,  /*채권관리결과등록구분*/
            A.CNTCT_DESC,                /*채권관리결과내용    */
            A.ATTCH_FL_SEQ,              /*첨부파일정보        */
            (SELECT COUNT(*) FROM RTCM0040 Z WHERE Z.FILE_GRP_SEQ = A.ATTCH_FL_SEQ) FILE_CNT , /* 첨부파일갯수*/
            A.DEL_YN,                    /*삭제여부            */
            A.REG_ID,                    /*등록자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                   /*등록자              */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                   /*변경자              */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0113 A
    WHERE   A.RAMG_YM = v_Ramg_Ym
    AND     A.CUST_NO = v_Cust_No
    AND     (v_Ord_No IS NULL OR A.ORD_NO = v_Ord_No)
    AND     A.DEL_YN  = 'N'
    ORDER BY A.RAMG_YM, A.CUST_NO, A.RAMG_SEQ;

  END p_sRtre0113List;


  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Count - 채권관리순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0113RamgSeq(
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER IS
    v_Ramg_Seq RTRE0113.RAMG_SEQ%TYPE DEFAULT NULL;     /*채권관리순번        */
  BEGIN

    SELECT  NVL((SELECT  MAX(RAMG_SEQ)
                 FROM    RTRE0113
                 WHERE   CUST_NO  = v_Cust_No)+ 1, 1) AS RAMG_SEQ
    INTO    v_Ramg_Seq
    FROM    DUAL;
    
    RETURN v_Ramg_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0113RamgSeq;

END Pkg_Rtre0113;