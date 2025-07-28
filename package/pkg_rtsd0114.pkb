CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0114 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0114
   PURPOSE   서비스 확인서 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 서비스 확인서 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0114Count(
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,           /*계약번호            */
    v_Seq            IN RTSD0114.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0114
    WHERE   ORD_NO = v_Ord_No
    AND     SEQ    = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0114Count;

  /*****************************************************************************
  -- 서비스 확인서 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0114 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_FDay      IN RTSD0114.PROC_DAY%TYPE,       /*처리일자FROM          */
    v_Proc_TDay      IN RTSD0114.PROC_DAY%TYPE        /*처리일자TO            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.SEQ,                       /*순번                */
            A.PROC_DAY,                  /*처리일자            */
            A.PRS_DCD1,                  /*서비스명1_엔진오일  */
            A.PRS_DCD2,                  /*서비스명2_위치교환  */
            A.PRS_DCD3,                  /*서비스명3_방문점검  */
            A.PRS_DCD4,                  /*Door-to-Door        */
            A.PRS_DCD5,                  /*서비스명5_WINTER교체  */
            A.A_MILEAGE,                 /*주행거리(평균)      */
            A.SV_SERT,                   /*서비스 만족도       */
            A.INPUT_DT,                  /*PAD입력일시         */
            A.FILE_PATH,                 /*서비스 확인서 파일경*/
            A.FILE_NAME,                 /*서비스 확인서 파일명*/
            A.SMS_YN,                    /*SMS 발송여부        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0114 A
    WHERE   A.ORD_NO = v_Ord_No
    AND     A.PROC_DAY BETWEEN v_Proc_FDay AND v_Proc_TDay;

  END p_sRtsd0114;

  /*****************************************************************************
  -- 서비스 확인서 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0114 (
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0114.SEQ%TYPE,            /*순번                  */
    v_Proc_Day       IN RTSD0114.PROC_DAY%TYPE,       /*처리일자              */
    v_Prs_Dcd1       IN RTSD0114.PRS_DCD1%TYPE,       /*서비스명1_엔진오일    */
    v_Prs_Dcd2       IN RTSD0114.PRS_DCD2%TYPE,       /*서비스명2_위치교환    */
    v_Prs_Dcd3       IN RTSD0114.PRS_DCD3%TYPE,       /*서비스명3_방문점검    */
    v_Prs_Dcd4       IN RTSD0114.PRS_DCD4%TYPE,       /*Door-to-Door          */
    v_Prs_Dcd5       IN RTSD0114.PRS_DCD5%TYPE,       /*서비스명5_WINTER교체  */
    v_Prs_Dcd6       IN RTSD0114.PRS_DCD6%TYPE,       /*서비스명6_걱정제로체  */
    v_Prs_Dcd8       IN RTSD0114.PRS_DCD8%TYPE,       /*서비스명8_얼라인먼트  */
    v_Prs_Dcd9       IN RTSD0114.PRS_DCD9%TYPE,       /*서비스명9_무상얼라인먼트  */
    v_Prs_Dcd10      IN RTSD0114.PRS_DCD10%TYPE,      /*서비스명10_Nexen Check  */
    v_Prs_Dcd11      IN RTSD0114.PRS_DCD11%TYPE,      /*서비스명11_조기마모파손보증  */
    v_Prs_Dcd12      IN RTSD0114.PRS_DCD12%TYPE,      /*서비스명12_파손보증  */
    v_A_Mileage      IN RTSD0114.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Sv_Sert        IN RTSD0114.SV_SERT%TYPE,        /*서비스 만족도         */
    v_Input_Dt       IN RTSD0114.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0114.FILE_PATH%TYPE,      /*서비스 확인서 파일경로*/
    v_File_Name      IN RTSD0114.FILE_NAME%TYPE,      /*서비스 확인서 파일명  */
    v_Reg_Id         IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0114 (
            ORD_NO,
            SEQ,
            PROC_DAY,
            PRS_DCD1,
            PRS_DCD2,
            PRS_DCD3,
            PRS_DCD4,
            PRS_DCD5,
            PRS_DCD6,
            PRS_DCD8,      
            PRS_DCD9,
            PRS_DCD10, 
            PRS_DCD11,
            PRS_DCD12,             
            A_MILEAGE,
            SV_SERT,
            INPUT_DT,
            FILE_PATH,
            FILE_NAME,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Seq,
            v_Proc_Day,
            v_Prs_Dcd1,
            v_Prs_Dcd2,
            v_Prs_Dcd3,
            v_Prs_Dcd4,
            v_Prs_Dcd5,
            v_Prs_Dcd6,
            v_Prs_Dcd8, 
            v_Prs_Dcd9, 
            v_Prs_Dcd10,  
            v_Prs_Dcd11,
            v_Prs_Dcd12,             
            v_A_Mileage,
            v_Sv_Sert,
            v_Input_Dt,
            v_File_Path,
            v_File_Name,
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

  END f_InsertRtsd0114;

  /*****************************************************************************
  -- 서비스 확인서 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0114 (
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0114.SEQ%TYPE,            /*순번                  */
    v_Proc_Day       IN RTSD0114.PROC_DAY%TYPE,       /*처리일자              */
    v_Prs_Dcd1       IN RTSD0114.PRS_DCD1%TYPE,       /*서비스명1_엔진오일    */
    v_Prs_Dcd2       IN RTSD0114.PRS_DCD2%TYPE,       /*서비스명2_위치교환    */
    v_Prs_Dcd3       IN RTSD0114.PRS_DCD3%TYPE,       /*서비스명3_방문점검    */
    v_Prs_Dcd4       IN RTSD0114.PRS_DCD4%TYPE,       /*Door-to-Door          */
    v_Prs_Dcd5       IN RTSD0114.PRS_DCD5%TYPE,       /*서비스명5_WINTER교체  */
    v_Prs_Dcd6       IN RTSD0114.PRS_DCD6%TYPE,       /*서비스명6_걱정제로체  */  
    v_Prs_Dcd8       IN RTSD0114.PRS_DCD8%TYPE,       /*서비스명8_얼라인먼트  */    
    v_Prs_Dcd9       IN RTSD0114.PRS_DCD9%TYPE,       /*서비스명9_무상얼라인먼트  */    
    v_Prs_Dcd10      IN RTSD0114.PRS_DCD10%TYPE,      /*서비스명10_Nexen Check  */    
    v_Prs_Dcd11      IN RTSD0114.PRS_DCD11%TYPE,      /*서비스명11_조기마모파손보증  */    
    v_Prs_Dcd12      IN RTSD0114.PRS_DCD12%TYPE,      /*서비스명12_파손보증  */    
    v_A_Mileage      IN RTSD0114.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Sv_Sert        IN RTSD0114.SV_SERT%TYPE,        /*서비스 만족도         */
    v_Input_Dt       IN RTSD0114.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0114.FILE_PATH%TYPE,      /*서비스 확인서 파일경로*/
    v_File_Name      IN RTSD0114.FILE_NAME%TYPE,      /*서비스 확인서 파일명  */
    v_Reg_Id         IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0114
    SET    PROC_DAY   = v_Proc_Day,
           PRS_DCD1   = v_Prs_Dcd1,
           PRS_DCD2   = v_Prs_Dcd2,
           PRS_DCD3   = v_Prs_Dcd3,
           PRS_DCD4   = v_Prs_Dcd4,
           PRS_DCD5   = v_Prs_Dcd5,
           PRS_DCD6   = v_Prs_Dcd6,
           PRS_DCD8   = v_Prs_Dcd8,
           PRS_DCD9   = v_Prs_Dcd9,
           PRS_DCD10  = v_Prs_Dcd10,
           PRS_DCD11  = v_Prs_Dcd11,
           PRS_DCD12  = v_Prs_Dcd12,
           A_MILEAGE  = v_A_Mileage,
           SV_SERT    = v_Sv_Sert,
           INPUT_DT   = v_Input_Dt,
           FILE_PATH  = v_File_Path,
           FILE_NAME  = v_File_Name,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  ORD_NO     = v_Ord_No
    AND    SEQ        = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0114;

  /*****************************************************************************
  -- 서비스 확인서 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0114 (
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN RTSD0114.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0114
    WHERE  ORD_NO = v_Ord_No
    AND    SEQ    = v_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0114.f_DeleteRtsd0114(1)', '계약번호', v_Ord_No);   
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0114.f_DeleteRtsd0114(1)', '순번', v_Seq);   
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0114.f_DeleteRtsd0114(1)', '등록자 ID', v_Reg_Id);    

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0114;

  /*****************************************************************************
  -- 서비스 확인서 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0114 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE,         /*계약번호              */
    v_Seq            IN OUT RTSD0114.SEQ%TYPE,        /*순번                  */
    v_Proc_Day       IN RTSD0114.PROC_DAY%TYPE,       /*처리일자              */
    v_Prs_Dcd1       IN RTSD0114.PRS_DCD1%TYPE,       /*서비스명1_엔진오일    */
    v_Prs_Dcd2       IN RTSD0114.PRS_DCD2%TYPE,       /*서비스명2_위치교환    */
    v_Prs_Dcd3       IN RTSD0114.PRS_DCD3%TYPE,       /*서비스명3_방문점검    */
    v_Prs_Dcd4       IN RTSD0114.PRS_DCD4%TYPE,       /*Door-to-Door          */
    v_Prs_Dcd5       IN RTSD0114.PRS_DCD5%TYPE,       /*서비스명5_WINTER교체  */
    v_Prs_Dcd6       IN RTSD0114.PRS_DCD6%TYPE,       /*서비스명6_걱정제로교체  */
    v_Prs_Dcd8       IN RTSD0114.PRS_DCD8%TYPE,       /*서비스명8_얼라인먼트  */
    v_Prs_Dcd9       IN RTSD0114.PRS_DCD9%TYPE,       /*서비스명9_무상얼라인먼트  */
    v_Prs_Dcd10      IN RTSD0114.PRS_DCD10%TYPE,      /*서비스명10_Nexen Check  */
    v_Prs_Dcd11      IN RTSD0114.PRS_DCD11%TYPE,      /*서비스명11_조기마모파손보증  */
    v_Prs_Dcd12      IN RTSD0114.PRS_DCD12%TYPE,      /*서비스명12_파손보증  */
    v_A_Mileage      IN RTSD0114.A_MILEAGE%TYPE,      /*주행거리(평균)        */
    v_Sv_Sert        IN RTSD0114.SV_SERT%TYPE,        /*서비스 만족도         */
    v_Input_Dt       IN RTSD0114.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0114.FILE_PATH%TYPE,      /*서비스 확인서 파일경로*/
    v_File_Name      IN RTSD0114.FILE_NAME%TYPE,      /*서비스 확인서 파일명  */
    v_Reg_Id         IN RTSD0114.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    
    -- 필수값:계약번호 , 서비스명1_엔진오일 , 서비스명2_위치교환 , 서비스명3_방문점검 , 서비스 만족도 , 등록자 ID , PAD입력일시 , 개인정보 제공동의서 파일경로 , 개인정보 제공동의서 파일명
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 != ISDATE(v_Proc_Day) THEN
        v_Return_Message := '처리일자('||v_Proc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Prs_Dcd1) IS NULL) OR (TRIM(v_Prs_Dcd1) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명1_엔진오일('||v_Prs_Dcd1 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Prs_Dcd2) IS NULL) OR (TRIM(v_Prs_Dcd2) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명2_위치교환('||v_Prs_Dcd2 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Prs_Dcd3) IS NULL) OR (TRIM(v_Prs_Dcd3) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명3_방문점검('||v_Prs_Dcd3 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
    
    IF (TRIM(v_Prs_Dcd4) IS NULL) OR (TRIM(v_Prs_Dcd4) NOT IN ('Y','N')) THEN
        v_Return_Message := 'Door-to-Door('||v_Prs_Dcd4 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
    
    IF (TRIM(v_Prs_Dcd5) IS NULL) OR (TRIM(v_Prs_Dcd5) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명5_WINTER교체('||v_Prs_Dcd5 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;        
    
    IF (TRIM(v_Prs_Dcd6) IS NULL) OR (TRIM(v_Prs_Dcd6) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명6_걱정제로('||v_Prs_Dcd6 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
    
    IF (TRIM(v_Prs_Dcd8) IS NULL) OR (TRIM(v_Prs_Dcd8) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명8_얼라인먼트('||v_Prs_Dcd8 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;   
    
    IF (TRIM(v_Prs_Dcd9) IS NULL) OR (TRIM(v_Prs_Dcd9) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명9_무상얼라인먼트('||v_Prs_Dcd9 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
    
    IF (TRIM(v_Prs_Dcd10) IS NULL) OR (TRIM(v_Prs_Dcd10) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명10_Nexen Check('||v_Prs_Dcd10 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
    
    IF (TRIM(v_Prs_Dcd11) IS NULL) OR (TRIM(v_Prs_Dcd11) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명11_조기마모파손보증('||v_Prs_Dcd11 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;  
    
    IF (TRIM(v_Prs_Dcd12) IS NULL) OR (TRIM(v_Prs_Dcd12) NOT IN ('Y','N')) THEN
        v_Return_Message := '서비스명12_파손보증('||v_Prs_Dcd12 ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF; 
        
    IF (TRIM(v_Sv_Sert) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S062', v_Sv_Sert)) THEN
        v_Return_Message := '서비스만족도('||v_Sv_Sert ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF 0 != ISDATE(v_Input_Dt) THEN
        v_Return_Message := 'PAD입력일시('||v_Input_Dt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
        
    IF TRIM(v_File_Path) IS NULL THEN
        v_Return_Message := '개인정보 제공동의서 파일경로('||v_File_Path||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Name) IS NULL THEN
        v_Return_Message := '개인정보 제공동의서 파일명('||v_File_Name||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_sRtsd0114Count(v_Ord_No, v_Seq) THEN
            v_Return_Message := '해당 서비스 확인서 데이터('||v_Ord_No||'-'||v_Seq||')는 이미 등록된 상태이므로 신규등록 처리가 불가합니다.';
            RAISE e_Error;        
        END IF;
        
        v_Seq := f_sRtsd0114Seq(v_Ord_No);
        
        IF 0 != f_InsertRtsd0114(v_Ord_No , v_Seq , v_Proc_Day , v_Prs_Dcd1 , 
                                 v_Prs_Dcd2 , v_Prs_Dcd3 , v_Prs_Dcd4, v_Prs_Dcd5,
                                 v_Prs_Dcd6, v_Prs_Dcd8, v_Prs_Dcd9, v_Prs_Dcd10, v_Prs_Dcd11, v_Prs_Dcd12,  v_A_Mileage, v_Sv_Sert , v_Input_Dt , 
                                 v_File_Path , v_File_Name , v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '서비스 확인서 데이터 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtsd0114Count(v_Ord_No, v_Seq) THEN
            v_Return_Message := '해당 서비스 확인서 데이터('||v_Ord_No||'-'||v_Seq||')는 미등록으로 수정/삭제가 처리가 불가합니다.';
            RAISE e_Error;        
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0114(v_Ord_No , v_Seq , v_Proc_Day , v_Prs_Dcd1 , 
                                     v_Prs_Dcd2 , v_Prs_Dcd3 , v_Prs_Dcd4, v_Prs_Dcd5, 
                                     v_Prs_Dcd6, v_Prs_Dcd8, v_Prs_Dcd9, v_Prs_Dcd10, v_Prs_Dcd11, v_Prs_Dcd12, v_A_Mileage, v_Sv_Sert , v_Input_Dt , 
                                     v_File_Path , v_File_Name , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '서비스 확인서 데이터 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0114(v_Ord_No , v_Seq, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '서비스 확인서 데이터삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0114.p_IUDRtsd0114(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0114.p_IUDRtsd0114(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0114;
  
  
  /*****************************************************************************
  -- 서비스 확인서 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0114Seq(
    v_Ord_No         IN RTSD0114.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS
    
    v_Seq RTSD0114.SEQ%TYPE DEFAULT NULL;               /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTSD0114
                 WHERE   ORD_NO = v_Ord_No)+ 1, 1)
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0114Seq;
  

END Pkg_Rtsd0114;