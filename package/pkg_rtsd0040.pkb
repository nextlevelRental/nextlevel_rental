CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0040 AS
/*******************************************************************************
   NAME:      PKG_RTSD0040
   PURPOSE    계약별 할인정보

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-09  sePark         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 계약별 할인정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0040 (
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE,         /* 계약번호             */
    v_Seq            IN RTSD0040.SEQ%TYPE,            /* 순번                 */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*월렌탈료(조견표)      */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*월렌탈료 할인액       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*월렌탈료              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0040 (
            ORD_NO,
            SEQ,
            DC_GB,
            DC_AMT,
            AMT,
            L_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT T.ORD_NO,
           T.SEQ,
           (SELECT CASE WHEN A.GRP_YN = 'Y' THEN 'B'
                   ELSE 'G'
                   END
            FROM RTSD0104 A 
            WHERE A.ORD_NO = T.ORD_NO) AS DC_GB,
           v_Mon_Dcamt AS DC_AMT,
           v_Rent_Amt AS AMT,
           v_Mon_Amt AS MON_AMT,
           T.REG_ID,
           SYSDATE,
           T.CHG_ID,
           SYSDATE
    FROM   RTSD0106 T
    WHERE  T.ORD_NO = v_Ord_No
    AND    T.SEQ = v_Seq;
            
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0040;


  /*****************************************************************************
  --계약별 할인정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0040 (
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0040
    WHERE  ORD_NO = v_Ord_No;

    Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0040.f_DeleteRtsd0040', '주문번호', v_Ord_No);

    RETURN SQLCODE;
  END f_DeleteRtsd0040;


END PKG_RTSD0040;