CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0120 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0120
   PURPOSE   �Ǹ��� ���� �̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-12-16  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �Ǹ��� ���� �̷� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0120Count(
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,        /*�Ǹ��ι�ȣ          */
    v_Seq            IN RTSD0120.SEQ%TYPE               /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0120
    WHERE   ORD_AGENT = v_Ord_Agent
    AND     SEQ       = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0120Count;

  /*****************************************************************************
  -- �Ǹ��� ���� �̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0120 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Seq            IN RTSD0120.SEQ%TYPE             /*����                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_AGENT,                 /*�Ǹ��ι�ȣ          */
            A.SEQ,                       /*����                */
            A.ORG_AGNM,                  /*�Ǹ��θ�            */
            A.ORG_AGTEL,                 /*����ó              */
            A.CHAN_CD,                   /*ä�α���            */
            A.LIFNR,                     /*�����ڵ�            */
            A.NUM,                       /*�������            */
            A.SALES_GROUP,               /*����                */
            A.SALES_OFFICE,              /*����                */
            A.TAX_RQCD,                  /*���ݰ�꼭 ������ */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0120 A
    WHERE   A.ORD_AGENT = v_Ord_Agent
    AND     A.SEQ       = v_Seq;

  END p_sRtsd0120;

  /*****************************************************************************
  -- �Ǹ��� ���� �̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0120 (
    v_Ord_Agent      IN RTSD0120.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0120 (
            ORD_AGENT,
            SEQ,
            ORG_AGNM,
            ORG_AGTEL,
            CHAN_CD,
            LIFNR,
            NUM,
            SALES_GROUP,
            SALES_OFFICE,
            TAX_RQCD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  A.ORD_AGENT,                 /*�Ǹ��ι�ȣ          */
            NVL((SELECT  MAX(B.SEQ)
                 FROM    RTSD0120 B
                 WHERE   B.ORD_AGENT = A.ORD_AGENT)+ 1, 1) AS SEQ, /*����                */   
            A.ORG_AGNM,                  /*�Ǹ��θ�            */
            A.ORG_AGTEL,                 /*����ó              */
            A.CHAN_CD,                   /*ä�α���            */
            A.LIFNR,                     /*�����ڵ�            */
            A.NUM,                       /*�������            */
            A.SALES_GROUP,               /*����                */
            A.SALES_OFFICE,              /*����                */
            A.TAX_RQCD,                  /*���ݰ�꼭 ������ */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0113 A
    WHERE   A.ORD_AGENT = v_Ord_Agent;
    
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0120;

END Pkg_Rtsd0120;
/
