CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0102 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0102
   PURPOSE   결합 고객 관리 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-08  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 결합 고객 관리 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0102Count(
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE            /*고객결합번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0102
    WHERE   GRP_NO = v_Grp_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0102Count;

  /*****************************************************************************
  -- 결합 고객 관리 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0102 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,           /*고객결합번호        */
    v_Grp_Day_Start  IN RTSD0102.GRP_DAY%TYPE,          /*결합일자            */
    v_Grp_Day_End    IN RTSD0102.GRP_DAY%TYPE,          /*결합일자            */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,           /*결합여부            */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE           /*고객번호            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.GRP_NO  ,       /*고객결합번호   */
            A.GRP_DAY ,       /*결합일자       */
            A.SPT_DAY ,       /*분리일자       */
            A.GRP_YN  ,       /*결합여부       */
            A.REG_ID  ,       /*등록자 ID      */
            A.REG_DT  ,       /*등록일        */
            A.CHG_ID  ,       /*변경자 ID      */
            A.CHG_DT  ,       /*변경일         */
            COUNT(B.GRP_NO)  AS CUST_GRP_COUNT
    FROM    RTSD0102 A LEFT OUTER JOIN RTSD0103 B ON A.GRP_NO = B.GRP_NO
    WHERE   (v_Grp_No        IS NULL OR A.GRP_NO = v_Grp_No)
    AND     (v_Grp_Day_Start IS NULL OR A.GRP_DAY BETWEEN v_Grp_Day_Start AND v_Grp_Day_End)
    AND     (v_Grp_Yn        IS NULL OR A.GRP_YN = v_Grp_Yn)
    AND     (v_Cust_No       IS NULL OR B.CUST_NO = v_Cust_No)
    GROUP   BY A.GRP_NO, A.GRP_DAY, A.SPT_DAY, A.SPT_DAY, A.GRP_YN, A.REG_ID, A.REG_DT, A.CHG_ID, A.CHG_DT
    ORDER   BY A.GRP_NO ASC;

  END p_sRtsd0102;

  /*****************************************************************************
  -- 결합 고객 관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*고객결합번호          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0102 (
            GRP_NO,
            GRP_DAY,
            SPT_DAY,
            GRP_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Grp_No,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            v_Spt_Day,
            'Y',
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

  END f_InsertRtsd0102;

  /*****************************************************************************
  -- 결합 고객 관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*고객결합번호          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0102
    SET    GRP_DAY = DECODE(v_Grp_Yn,'Y',TO_CHAR(SYSDATE,'YYYYMMDD'),v_Grp_Day),
           SPT_DAY = DECODE(v_Grp_Yn,'N',TO_CHAR(SYSDATE,'YYYYMMDD'),''),
           GRP_YN  = v_Grp_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  GRP_NO  = v_Grp_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0102;

  /*****************************************************************************
  -- 결합 고객 관리 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0102 (
    v_Grp_No         IN RTSD0102.GRP_NO%TYPE,         /*고객결합번호          */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0102
    WHERE  GRP_NO = v_Grp_No;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0102.f_DeleteRtsd0102(1)', 'v_Grp_No', v_Grp_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0102.f_DeleteRtsd0102(1)', 'v_Reg_Id', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0102;

  /*****************************************************************************
  -- 결합 고객 관리 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0102 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Grp_No         IN OUT RTSD0102.GRP_NO%TYPE,     /*고객결합번호          */
    v_Grp_Day        IN RTSD0102.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0102.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0102.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0102.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Grp_Yn) IS NULL THEN
        v_Return_Message := '결합여부('||v_Grp_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtsd0102Count(v_Grp_No) THEN

        v_Grp_No := f_sRtsd0102GrpNo();

        IF 0 != f_InsertRtsd0102(v_Grp_No, v_Grp_Day , v_Spt_Day , v_Grp_Yn , 
                                 v_Reg_Id , v_ErrorText) THEN
            v_Return_Message := '결합 고객 관리 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0102(v_Grp_No , v_Grp_Day , v_Spt_Day , v_Grp_Yn , 
                                     v_Reg_Id , v_ErrorText) THEN
                v_Return_Message := '결합 고객 관리 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0102(v_Grp_No , v_Reg_Id ,
                                     v_ErrorText) THEN
                v_Return_Message := '결합 고객 관리 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0102.p_IUDRtsd0102(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0102.p_IUDRtsd0102(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0102;

  /*****************************************************************************
  -- 결합 고객 마스터 - 결합 고객 번호 체번
  *****************************************************************************/
  FUNCTION f_sRtsd0102GrpNo RETURN VARCHAR IS
    v_Grp_No   RTSD0102.GRP_NO%TYPE DEFAULT NULL;   /*결합고객번호            */
  BEGIN

    SELECT  NVL(MAX(GRP_NO)+1,'1000000001')
    INTO    v_Grp_No
    FROM    RTSD0102;

    RETURN v_Grp_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0102GrpNo;
END Pkg_Rtsd0102;
/
