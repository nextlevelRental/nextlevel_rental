CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0205 AS
/*******************************************************************************
   NAME:      Pkg_RTCM0205
   PURPOSE:   문자포맷 Detail 관리

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-31  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0205Count(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE            /*하위코드명          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0205
    WHERE   SEND_POS   = v_Send_Pos
    AND     MID_GRP_CD = v_Mid_Grp_Cd
    AND     CD = v_Cd
    AND     CUST_NO = v_Cust_No
    AND     ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0205Count;
  
  /*****************************************************************************
  -- 공통코드 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0205 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE            /*하위코드명          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SEND_POS,
            A.MID_GRP_CD,    /*코드그룹코드*/
            A.CD,           /*코드        */
            A.CUST_NO,
            A.ORD_NO,
            A.LOCK_YN,
            A.LOCK_TYPE,
            A.REG_ID,       /*등록자 ID   */
            A.REG_DT,       /*등록일      */
            A.CHG_ID,       /*변경자 ID   */
            A.CHG_DT        /*변경일      */
    FROM    RTCM0205 A
    WHERE   1=1
    AND     A.SEND_POS = DECODE(v_Send_Pos, NULL, A.SEND_POS, v_Send_Pos)
    AND     A.MID_GRP_CD = DECODE(v_Mid_Grp_Cd, NULL, A.MID_GRP_CD, v_Mid_Grp_Cd)
    AND     A.CD         = DECODE(v_Cd, NULL, A.CD, v_Cd)
    AND     A.CUST_NO = DECODE(v_Cust_No, NULL, A.CUST_NO, v_Cust_No)
    AND     A.ORD_NO = DECODE(v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
    ORDER   BY A.CUST_NO, A.ORD_NO;

  END p_sRtcm0205;

  /*****************************************************************************
  -- 문자포맷 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*하위코드명          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*하위코드명          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0205 (
            SEND_POS, MID_GRP_CD, CD, CUST_NO, ORD_NO, SEQ,
            STR_DAY, END_DAY, LOCK_YN, LOCK_TYPE, 
            REG_ID, REG_DT, CHG_ID, CHG_DT
            )
    VALUES  (
            v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No, 1,
            v_Str_Day, v_End_Day, v_Lock_Yn, v_Lock_Type, 
            v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0205;

  /*****************************************************************************
  -- 문자포맷 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*하위코드명          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*하위코드명          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0205
    SET     STR_DAY         = v_Str_Day,
            END_DAY         = v_End_Day,
            LOCK_YN         = v_Lock_Yn,
            LOCK_TYPE       = v_Lock_Type,
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   SEND_POS        = v_Send_Pos
      AND   MID_GRP_CD      = v_Mid_Grp_Cd
      AND   CD              = v_Cd
      AND   CUST_NO         = v_Cust_No
      AND   ORD_NO          = v_Ord_No
      AND   SEQ             = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0205;


  /*****************************************************************************
  -- 문자포맷 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0205
    SET     LOCK_YN         = 'N',
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   SEND_POS        = v_Send_Pos
      AND   MID_GRP_CD      = v_Mid_Grp_Cd
      AND   CD              = v_Cd
      AND   CUST_NO         = v_Cust_No
      AND   ORD_NO          = v_Ord_No
      AND   SEQ             = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0205;


  /*****************************************************************************
  -- 문자포맷 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0205(
    v_Comm_Dvsn      IN  CHAR,                           /* 처리구분(I,U,D)        */
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*하위코드명          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*하위코드명          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 코드그룹코드, 코드, 사용여부 ,등록자 ID
    IF TRIM(v_Send_Pos) IS NULL THEN
        v_Return_Message := '발송위치코드('||v_Send_Pos||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Mid_Grp_Cd) IS NULL THEN
        v_Return_Message := '코드그룹코드('||v_Mid_Grp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cd) IS NULL THEN
        v_Return_Message := '코드('||v_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Lock_Yn) IS NULL THEN
        v_Return_Message := '사용여부('||v_Lock_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRTCM0205Count(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No) THEN

        IF 0 != f_InsertRTCM0205(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No, 
                                 v_Str_Day, v_End_Day, v_Lock_Yn, v_Lock_Type, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '문자포맷 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRTCM0205(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No, v_Seq,
                                 v_Str_Day, v_End_Day, v_Lock_Yn, v_Lock_Type, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '문자포맷 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRTCM0205(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No, v_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '문자포맷 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := ' 처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0205.p_IUDRTCM0205(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0205.p_IUDRTCM0205(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0205;
  
  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0205LockYn(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*코드그룹코드        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*코드그룹코드        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*하위코드            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*하위코드명          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*하위코드명          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE            /*하위코드명          */
    ) RETURN VARCHAR2 IS
    v_lock_yn   VARCHAR2(1) DEFAULT 'N';
  BEGIN

    SELECT  CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END
    INTO    v_lock_yn
    FROM    RTCM0205
    WHERE       SEND_POS    = v_Send_Pos
        AND     MID_GRP_CD  = v_Mid_Grp_Cd
        AND     CD          = v_Cd
        AND     (CASE WHEN v_Lock_Type = '01' THEN 
                            CASE WHEN CUST_NO     = v_Cust_No THEN 1 ELSE 0 END
                      ELSE 
                            CASE WHEN ORD_NO      = v_Ord_No THEN 1 ELSE 0 END
                      END) = 1
        AND     LOCK_YN     = 'Y'
        AND     TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN STR_DAY AND END_DAY;

    RETURN v_lock_yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 'N';

  END f_sRtcm0205LockYn;
  
END Pkg_Rtcm0205;
/