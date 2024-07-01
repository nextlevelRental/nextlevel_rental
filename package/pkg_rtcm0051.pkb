CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0051 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0051
   PURPOSE:   공통코드 Detail 관리

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 공통코드 Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0051Count(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0051
    WHERE   CD_GRP_CD   = v_Cd_Grp_Cd
    AND     CD          = v_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0051Count;

  /*****************************************************************************
  -- 공통코드 Detail 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0051 (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd        IN  RTCM0051.CD%TYPE,               /*코드                    */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE             /*코드명                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CD_GRP_CD,    /*코드그룹코드*/
            B.CD_GRP_NM,    /*코드그룹명  */
            A.CD,           /*코드        */
            A.CD_NM,        /*코드명      */
            A.CD_DESC,      /*코드설명    */
            A.ORDER_PT,     /*정렬순서    */
            A.USE_YN,       /*사용여부    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*사용여부명     */
            A.REMARK,       /*적요        */
            A.REG_ID,       /*등록자 ID   */
            A.REG_DT,       /*등록일      */
            A.CHG_ID,       /*변경자 ID   */
            A.CHG_DT        /*변경일      */
    FROM    RTCM0051 A,
            RTCM0050 B
    WHERE   A.CD_GRP_CD = DECODE(v_Cd_Grp_Cd, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd)
    AND     A.CD    LIKE v_Cd||'%'
    AND     A.CD_NM LIKE '%'||v_Cd_Nm||'%'
    AND     A.CD_GRP_CD = B.CD_GRP_CD
    ORDER   BY A.ORDER_PT;

  END p_sRtcm0051;

  /*****************************************************************************
  -- 공통코드 Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*코드명              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*코드설명            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*우선순위            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*사용여부            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*적요                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0051 (
            CD_GRP_CD, CD, CD_NM, CD_DESC, ORDER_PT,
            USE_YN, REMARK, REG_ID, REG_DT,
            CHG_ID, CHG_DT
            )
    VALUES  (
            v_Cd_Grp_Cd, v_Cd, NVL(v_Cd_Nm, ' '), v_Cd_Desc, v_Order_Pt,
            v_Use_Yn, v_Remark, v_Reg_Id, SYSDATE,
            v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0051;

  /*****************************************************************************
  -- 공통코드 Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*코드명              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*코드설명            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*우선순위            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*사용여부            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*적요                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0051
    SET     CD_NM     = NVL(v_Cd_Nm,' '),
            CD_DESC   = v_Cd_Desc,
            ORDER_PT  = v_Order_Pt,
            USE_YN    = v_Use_Yn,
            REMARK    = v_Remark,
            CHG_DT    = SYSDATE,
            CHG_ID    = v_Reg_Id
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0051;


  /*****************************************************************************
  -- 공통코드 Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*코드                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*등록자 ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0051
    SET     USE_YN  = 'N',
            CHG_DT  = SYSDATE,
            CHG_ID  = v_Reg_Id
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0051;


  /*****************************************************************************
  -- 공통코드 관리
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0051(
    v_Comm_Dvsn  IN  CHAR,                          /*처리구분(I,U,D)         */
    v_Cd_Grp_Cd  IN  RTCM0051.CD_GRP_CD%TYPE,       /*코드그룹코드            */
    v_Cd         IN  RTCM0051.CD%TYPE,              /*코드                    */
    v_Cd_Nm      IN  RTCM0051.CD_NM%TYPE,           /*코드명                  */
    v_Cd_Desc    IN  RTCM0051.CD_DESC%TYPE,         /*코드설명                */
    v_Order_Pt   IN  RTCM0051.ORDER_PT%TYPE,        /*우선순위                */
    v_Use_Yn     IN  RTCM0051.USE_YN%TYPE,          /*사용여부                */
    v_Remark     IN  RTCM0051.REMARK%TYPE,          /*적요                    */
    v_Reg_Id     IN  RTCM0051.REG_ID%TYPE,          /*등록자 ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 코드그룹코드, 코드, 사용여부 ,등록자 ID
    IF TRIM(v_Cd_Grp_Cd) IS NULL THEN
        v_Return_Message := '코드그룹코드('||v_Cd_Grp_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cd) IS NULL THEN
        v_Return_Message := '코드('||v_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
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

    IF 0 = f_sRtcm0051Count(v_Cd_Grp_Cd, v_Cd) THEN

        IF 0 != f_InsertRtcm0051(v_Cd_Grp_Cd, v_Cd,v_Cd_Nm, v_Cd_Desc, v_Order_Pt, v_Use_Yn,
                                 v_Remark, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '공통코드 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0051(v_Cd_Grp_Cd, v_Cd,v_Cd_Nm, v_Cd_Desc, v_Order_Pt, v_Use_Yn,
                                     v_Remark, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '공통코드 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0051(v_Cd_Grp_Cd, v_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '공통코드 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0051.p_IUDRTCM0051(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0051.p_IUDRTCM0051(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0051;

  /*****************************************************************************
  -- 공통코드 Detail 조회- 대분류코드 기준 소분류코드/명 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0051CodeName (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,            /*코드명                  */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE            /*사용여부                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CD,           /*코드        */
            A.CD_NM,        /*코드명      */
            A.CD_DESC       /*코드설명    */
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = v_Cd_Grp_Cd
    AND     A.USE_YN    = NVL(v_Use_Yn,'Y')
    AND     NVL(CD_NM, ' ') LIKE '%'||v_Cd_Nm||'%'
    ORDER   BY NVL(A.ORDER_PT,0), A.CD_NM;

  END p_sRtcm0051CodeName;


  /*****************************************************************************
  -- 공통코드 Detail 조회- 대분류/소분류코드 기준 소분류코드명 조회
  *****************************************************************************/
  FUNCTION f_sRtcm0051CodeName(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN VARCHAR IS

    v_Cd_Nm      RTCM0051.CD_NM%TYPE; /*코드명      */
  BEGIN

    SELECT  CD_NM
    INTO    v_Cd_Nm
    FROM    RTCM0051
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;
    RETURN v_Cd_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0051CodeName;  
  
  /*****************************************************************************
  -- 공통코드 Detail 조회- 대분류코드 기준 소분류코드  조회(이용기관식별코드 획득시 사용)
  *****************************************************************************/
  FUNCTION f_sRtcm0051Cd(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE             /*코드그룹코드        */
    ) RETURN VARCHAR IS
    
    v_Cd    RTCM0051.CD%TYPE DEFAULT NULL;              /*코드                */
  BEGIN

    SELECT  CD
    INTO    v_Cd
    FROM    (
            SELECT  CD
            FROM    RTCM0051
            WHERE   CD_GRP_CD = v_Cd_Grp_Cd
            AND     USE_YN    = 'Y'
            ORDER BY ORDER_PT ASC
            )
    WHERE   ROWNUM <= 1;
    
    RETURN v_Cd;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN NULL;

  END f_sRtcm0051Cd;
    
  /*****************************************************************************
  -- 공통코드 Detail Count - 사용중인 코드 존재 여부
  *****************************************************************************/
  FUNCTION f_sRtcm0051UseCount(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*코드그룹코드        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*코드                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0051
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd
    AND     USE_YN    = 'Y';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0051UseCount;
  
  /*****************************************************************************
  -- 공통코드 Detail 조회 - 상위코드(CD_DESC)로 조회 
  *****************************************************************************/
  PROCEDURE p_sRtcm0051HCode (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*코드그룹코드            */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE           /*코드설명                */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CD_GRP_CD,    /*코드그룹코드*/
            B.CD_GRP_NM,    /*코드그룹명  */
            A.CD,           /*코드        */
            A.CD_NM,        /*코드명      */
            A.CD_DESC,      /*코드설명    */
            A.ORDER_PT      /*정렬순서    */
    FROM    RTCM0051 A,
            RTCM0050 B
    WHERE   A.CD_GRP_CD = DECODE(v_Cd_Grp_Cd, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd)
    AND     (v_Cd_Desc IS NULL OR A.CD_DESC = v_Cd_Desc)
    AND     A.USE_YN    = 'Y'
    AND     A.CD_GRP_CD = B.CD_GRP_CD
    ORDER   BY A.ORDER_PT;

  END p_sRtcm0051HCode;
  
END Pkg_Rtcm0051;
/
