CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0040 AS
/*******************************************************************************
   NAME:      PKG_RTSD0040
   PURPOSE    ��ະ ��������

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-09  sePark         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ��ະ �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0040 (
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE,         /* ����ȣ             */
    v_Seq            IN RTSD0040.SEQ%TYPE,            /* ����                 */
    v_Rent_Amt       IN RTSD0106.RENT_AMT%TYPE,       /*����Ż��(����ǥ)      */
    v_Mon_Dcamt      IN RTSD0106.MON_DCAMT%TYPE,      /*����Ż�� ���ξ�       */
    v_Mon_Amt        IN RTSD0106.MON_AMT%TYPE,        /*����Ż��              */
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
  --��ະ �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0040 (
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0040
    WHERE  ORD_NO = v_Ord_No;

    Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0040.f_DeleteRtsd0040', '�ֹ���ȣ', v_Ord_No);

    RETURN SQLCODE;
  END f_DeleteRtsd0040;


END PKG_RTSD0040;
/
