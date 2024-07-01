CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0040 AS
/*******************************************************************************
   NAME:      PKG_RTSD0040
   PURPOSE    ��ະ��������

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
    ) RETURN NUMBER;

    /*****************************************************************************
  --��ະ �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0040 (
    v_Ord_No         IN RTSD0040.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN NUMBER;
  
END PKG_RTSD0040;
/
