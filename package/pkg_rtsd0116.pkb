CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0116 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0116
   PURPOSE   배송완료 대상 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 배송완료 대상 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0116Count(
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,           /*계약번호            */
    v_Vbeln          IN RTSD0116.VBELN%TYPE             /*SAP 주문번호        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0116
    WHERE   ORD_NO = v_Ord_No
    AND     VBELN  = v_Vbeln;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0116Count;

  /*****************************************************************************
  -- 배송완료 대상 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0116 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS 발송일자          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS 발송여부          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.VBELN,                     /*SAP 주문번호        */
            A.VBELN_D,                   /*SAP 배송번호        */
            A.GI_DAY,                    /*배송일자            */
            A.SMS_DAY,                   /*SMS 발송일자        */
            A.SMS_YN,                    /*SMS 발송여부        */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0116 A
    WHERE   A.ORD_NO   = DECODE(v_Ord_No  , NULL, A.ORD_NO  , v_Ord_No)
    AND     A.VBELN    = DECODE(v_Vbeln   , NULL, A.VBELN   , v_Vbeln)
    AND     A.VBELN_D  = DECODE(v_Vbeln_D , NULL, A.VBELN_D , v_Vbeln_D)
    AND     A.GI_DAY   = DECODE(v_Gi_Day  , NULL, A.GI_DAY  , v_Gi_Day)
    AND     A.SMS_DAY  = DECODE(v_Sms_Day , NULL, A.SMS_DAY , v_Sms_Day)
    AND     A.SMS_YN   = DECODE(v_Sms_Yn  , NULL, A.SMS_YN  , v_Sms_Yn)
    AND     A.REG_ID   = DECODE(v_Reg_Id  , NULL, A.REG_ID  , v_Reg_Id);

  END p_sRtsd0116;

  /*****************************************************************************
  -- 배송완료 대상 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS 발송일자          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS 발송여부          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0116 (
            ORD_NO,
            VBELN,
            VBELN_D,
            GI_DAY,
            SMS_DAY,
            SMS_YN,
            NUM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            SUBSTR(v_Ord_No,1,12),
            v_Vbeln,
            v_Vbeln_D,
            v_Gi_Day,
            v_Sms_Day,
            v_Sms_Yn,
            SUBSTR(v_Ord_No,14,1),
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

  END f_InsertRtsd0116;

  /*****************************************************************************
  -- 배송완료 대상 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS 발송일자          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS 발송여부          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0116
    SET    VBELN_D = v_Vbeln_D,
           GI_DAY  = v_Gi_Day,
           SMS_DAY = v_Sms_Day,
           SMS_YN  = v_Sms_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  ORD_NO  = v_Ord_No
    AND    VBELN   = v_Vbeln;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0116;

  /*****************************************************************************
  -- 배송완료 대상 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0116 (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0116
    SET    SMS_YN = 'N',
           CHG_ID = v_Reg_Id,
           CHG_DT = SYSDATE 
    WHERE  ORD_NO = v_Ord_No
    AND    VBELN  = v_Vbeln;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0116;

  /*****************************************************************************
  -- 배송완료 대상 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0116 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Sms_Day        IN RTSD0116.SMS_DAY%TYPE,        /*SMS 발송일자          */
    v_Sms_Yn         IN RTSD0116.SMS_YN%TYPE,         /*SMS 발송여부          */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0116Count(v_Ord_No, v_Vbeln) THEN

        IF 0 != f_InsertRtsd0116(v_Ord_No, v_Vbeln, v_Vbeln_D, v_Gi_Day, 
                                 v_Sms_Day, v_Sms_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '배송완료 대상 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtsd0116(v_Ord_No, v_Vbeln, v_Vbeln_D, v_Gi_Day, 
                                     v_Sms_Day, v_Sms_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '배송완료 대상 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtsd0116(v_Ord_No, v_Vbeln, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '배송완료 대상 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0116.p_IUDRtsd0116(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0116.p_IUDRtsd0116(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0116;


  /*****************************************************************************
  -- 배송완료 대상 Update - Erprecvdelivery
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0116Recv (
    v_Ord_No         IN RTSD0116.ORD_NO%TYPE,         /*계약번호              */
    v_Vbeln          IN RTSD0116.VBELN%TYPE,          /*SAP 주문번호          */
    v_Vbeln_D        IN RTSD0116.VBELN_D%TYPE,        /*SAP 배송번호          */
    v_Gi_Day         IN RTSD0116.GI_DAY%TYPE,         /*배송일자              */
    v_Reg_Id         IN RTSD0116.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0116
    SET    VBELN_D = v_Vbeln_D,
           GI_DAY  = v_Gi_Day,
           NUM     = SUBSTR(v_Ord_No,14,1),
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  ORD_NO  = SUBSTR(v_Ord_No,1,12)
    AND    VBELN   = v_Vbeln;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0116Recv;
  
END Pkg_Rtsd0116;
/
