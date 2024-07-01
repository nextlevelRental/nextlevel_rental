CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0040 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0040
   PURPOSE:   이미지 관리 관리
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 이미지 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtcm0040Count(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE        /*업로드파일번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0040
    WHERE   FILE_SEQ = v_File_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0040Count;

                 
  /*****************************************************************************
  -- 이미지 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0040 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Reg_Fdt        IN VARCHAR,                      /*업로드일자FROM        */
    v_Reg_Tdt        IN VARCHAR,                      /*업로드일자TO          */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*주문번호              */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*논리적 파일명         */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE        /*업로드 프로그램       */
    ) IS
  BEGIN
    

    OPEN Ref_Cursor FOR
    SELECT  C40.FILE_SEQ,       /*업로드파일번호        */
            C40.FILE_GRP_SEQ,   /*업로드파일그룹번호    */
            C40.FILE_LNM,       /*논리적 파일명         */
            C40.FILE_PNM,       /*물리적 파일명         */
            C40.FILE_PATH,      /*파일경로              */
            C40.FILE_SIZE,      /*파일사이즈            */
            C40.UPLPG_CD,       /*업로드 프로그램       */
            C11.PRGM_NM,        /*업로드 프로그램명     */
            C40.CUST_NO,        /*고객번호              */
            S10.CUST_NM,        /*고객명                */
            C40.ORD_NO,         /*주문번호              */
            C40.REG_ID,         /*등록자 ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C40.REG_ID) REG_NM, /*등록자명       */
            C40.REG_DT,         /*등록일                */
            C40.CHG_ID,         /*변경자 ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C40.CHG_ID) CHG_NM, /*변경자명       */
            C40.CHG_DT          /*변경일                */
    FROM    RTCM0040 C40,
            RTCM0011 C11,
            RTSD0100 S10
    WHERE   C40.REG_DT BETWEEN TO_DATE(v_Reg_Fdt||'000000', 'YYYYMMDDHH24MISS') 
                       AND     TO_DATE(v_Reg_Tdt||'235959', 'YYYYMMDDHH24MISS')
    AND     NVL(C40.CUST_NO,' ') LIKE v_Cust_No||'%'
    AND     NVL(C40.ORD_NO, ' ') LIKE v_Ord_No||'%'
    AND     C40.FILE_LNM LIKE '%'||v_File_Lnm||'%'    
    AND     C40.UPLPG_CD = DECODE(v_Uplpg_Cd, NULL, C40.UPLPG_CD, v_Uplpg_Cd)
    AND     C40.UPLPG_CD = C11.PRGM_CD(+)
    AND     C40.CUST_NO  = S10.CUST_NO(+);

                       
  END p_sRtcm0040;

  /*****************************************************************************
  -- 이미지 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*업로드파일번호        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*업로드파일그룹번호    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*논리적 파일명         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*물리적 파일명         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*파일사이즈            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*업로드 프로그램       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*주문번호              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  INSERT  INTO RTCM0040 (
            FILE_SEQ,
            FILE_GRP_SEQ,
            FILE_LNM,
            FILE_PNM,
            FILE_PATH,
            FILE_SIZE,
            UPLPG_CD,
            CUST_NO,
            ORD_NO,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            f_sRtcm0040Seq(),
            v_File_Grp_Seq,
            v_File_Lnm,
            v_File_Pnm,
            v_File_Path,
            v_File_Size,
            v_Uplpg_Cd,
            v_Cust_No,
            v_Ord_No,
            v_Use_Yn,
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
        
  END f_InsertRTCM0040;


  /*****************************************************************************
  -- 이미지 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*업로드파일번호        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*업로드파일그룹번호    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*논리적 파일명         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*물리적 파일명         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*파일사이즈            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*업로드 프로그램       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*주문번호              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN
  
    UPDATE RTCM0040
    SET    FILE_GRP_SEQ = v_File_Grp_Seq,
           FILE_LNM     = v_File_Lnm,
           FILE_PNM     = v_File_Pnm,
           FILE_PATH    = v_File_Path,
           FILE_SIZE    = v_File_Size,
           UPLPG_CD     = v_Uplpg_Cd,
           CUST_NO      = v_Cust_No,
           ORD_NO       = v_Ord_No,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  FILE_SEQ     = v_File_Seq;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0040;

  /*****************************************************************************
  -- 이미지 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*업로드파일번호        */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0040
    SET    USE_YN   = 'N',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  FILE_SEQ = v_File_Seq;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0040;
  
  
  /*****************************************************************************
  -- 이미지 관리 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0040(
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*업로드파일번호        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*업로드파일그룹번호    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*논리적 파일명         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*물리적 파일명         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*파일경로              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*파일사이즈            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*업로드 프로그램       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*주문번호              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*사용여부              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN


    -- 필수값: 논리적 파일명 ,물리적 파일명 ,파일경로 ,파일사이즈 ,업로드 프로그램 ,등록자 ID
    IF TRIM(v_File_Lnm) IS NULL THEN
        v_Return_Message := ' 논리적 파일('||v_File_Lnm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Pnm) IS NULL THEN
        v_Return_Message := '물리적 파일명('||v_File_Pnm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Path) IS NULL THEN
        v_Return_Message := '파일경로('||v_File_Path||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Size) IS NULL THEN
        v_Return_Message := '파일사이즈('||v_File_Size||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Uplpg_Cd) IS NULL THEN
        v_Return_Message := '업로드 프로그램('||v_Uplpg_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
        
        IF 0 != f_InsertRtcm0040(v_File_Seq, v_File_Grp_Seq, v_File_Lnm, v_File_Pnm,
                                 v_File_Path, v_File_Size, v_Uplpg_Cd, v_Cust_No, 
                                 v_Ord_No, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '이미지 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
            
        END IF;   
                             
    ELSIF v_Comm_Dvsn = 'U' THEN
    
        IF 0 = f_sRtcm0040Count(v_File_Seq) THEN        
            v_Return_Message := '해당 파일('||v_File_Seq||')은 등록된 파일이 아니므로 수정이 불가합니다!';
            RAISE e_Error;  
        END IF;
        
        IF 0 != f_UpdateRtcm0040(v_File_Seq, v_File_Grp_Seq, v_File_Lnm, v_File_Pnm,
                                 v_File_Path, v_File_Size, v_Uplpg_Cd, v_Cust_No, 
                                 v_Ord_No, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '이미지 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
         
        
    ELSIF v_Comm_Dvsn = 'D' THEN
    
        IF 0 = f_sRtcm0040Count(v_File_Seq) THEN        
            v_Return_Message := '해당 파일('||v_File_Seq||')은 등록된 파일이 아니므로 삭제가 불가합니다!';
            RAISE e_Error;  
        END IF;
        
        IF 0 != f_DeleteRtcm0040(v_File_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '이미지 삭제 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
       END IF;
            
    ELSE
        v_Return_Message := ' 처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0040.p_IUDRTCM0040(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0040.p_IUDRTCM0040(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0040;


  /*****************************************************************************
  -- 이미지 관리 Count - 업로드파일번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcm0040Seq RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL((SELECT  /*+ INDEX_DESC ( RTCM0040 RTCM0040_PK ) */ 
                    FILE_SEQ + 1
            FROM    RTCM0040
            WHERE   ROWNUM <= 1), 1)
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0040Seq;
  
  /*****************************************************************************
  -- 이미지 관리 Count - 업로드파일그룹번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcm0040GrpSeq RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  SEQ_RTCM0040FILE_GRP_SEQ.nextval GRP_SEQ
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0040GrpSeq;

      
  /*****************************************************************************
  -- 이미지 관리 Select - 업로드파일그룹번호 기준 파일정보 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0040FileGrpList (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE    /*업로드파일그룹번호    */
    ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  C40.FILE_SEQ,       /*업로드파일번호        */
            C40.FILE_GRP_SEQ,   /*업로드파일그룹번호    */
            C40.FILE_LNM,       /*논리적 파일명         */
            C40.FILE_PNM,       /*물리적 파일명         */
            C40.FILE_PATH,      /*파일경로              */
            C40.FILE_SIZE,      /*파일사이즈            */
            C40.UPLPG_CD,       /*업로드 프로그램       */
            C40.CUST_NO,        /*고객번호              */
            C40.ORD_NO          /*주문번호              */
    FROM    RTCM0040 C40
    WHERE   C40.FILE_GRP_SEQ = v_File_Grp_Seq
    AND     C40.USE_YN = 'Y';
    
  END p_sRtcm0040FileGrpList;
  
    /*****************************************************************************
  -- 이미지 관리 Select - 업로드파일그룹번호 기준 파일정보 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0040FileOne (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_File_Seq   IN RTCM0040.FILE_SEQ%TYPE    /*업로드파일그룹번호    */
    ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  C40.FILE_SEQ,       /*업로드파일번호        */
            C40.FILE_GRP_SEQ,   /*업로드파일그룹번호    */
            C40.FILE_LNM,       /*논리적 파일명         */
            C40.FILE_PNM,       /*물리적 파일명         */
            C40.FILE_PATH,      /*파일경로              */
            C40.FILE_SIZE,      /*파일사이즈            */
            C40.UPLPG_CD,       /*업로드 프로그램       */
            C40.CUST_NO,        /*고객번호              */
            C40.ORD_NO          /*주문번호              */
    FROM    RTCM0040 C40
    WHERE   C40.FILE_SEQ = v_File_Seq
    AND     C40.USE_YN = 'Y';
    
  END p_sRtcm0040FileOne;
      
END Pkg_Rtcm0040;
/
