CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0110 AS
/*******************************************************************************
   NAME      Pkg_Rtre0110
   PURPOSE   ä�� ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ä�� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0110Count(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,          /*ä�ǰ������        */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0110
    WHERE   RAMG_YM = v_Ramg_Ym
    AND     CUST_NO = v_Cust_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0110Count;

  /*****************************************************************************
  -- ä�� ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0110 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE       /*ä�ǰ������          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RAMG_YM,                   /*ä�ǰ������        */
            A.CUST_NO,                   /*����ȣ            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM,                /*����              */ 
            A.RAMG_STAT,                 /*ä�ǰ������        */             
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R035', A.RAMG_STAT) RAMG_STAT_NM, /*ä�ǰ������        */ 
            A.RAMG_AMT,                  /*ä�ǰ����ݾ�        */
            A.ARRE_AMT,                  /*��ü�ݾ�            */
            A.RMON_AMT,                  /*���û���ݾ�        */
            A.RAMGRE_AMT,                /*ä�ǰ��������ݾ�    */
            A.ARRERE_AMT,                /*��ü�����ݾ�        */
            A.RMONRE_AMT,                /*���û�������ݾ�    */
            A.OVIN_AMT,                  /*��ü���ڱݾ�        */
            A.OVINRE_AMT,                /*��ü���ڼ����ݾ�    */
            A.RAMG_ID,                   /*ä�ǰ�����          */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.RAMG_ID) RAMG_NM,                 /*ä�ǰ�����          */
            A.ORD_CNT,                   /*���Ǽ�            */
            A.FST_DEL_YM,                /*��ü���۳��        */
            A.REG_ID,                    /*����� ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM,                   /*�����              */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) CHG_NM,                   /*������              */
            A.CHG_DT                     /*������              */
    FROM    RTRE0110 A    
    WHERE   A.RAMG_YM = v_Ramg_Ym
    AND     A.CUST_NO LIKE v_Cust_No||'%'
    AND     (v_Ramg_Stat IS NULL OR A.RAMG_STAT = v_Ramg_Stat);
    
  END p_sRtre0110;

  /*****************************************************************************
  -- ä�� ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*ä�ǰ������          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*��ü���ڼ����ݾ�      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*ä�ǰ�����            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*���Ǽ�              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0110 (
            RAMG_YM,
            CUST_NO,
            RAMG_STAT,
            RAMG_AMT,
            ARRE_AMT,
            RMON_AMT,
            RAMGRE_AMT,
            ARRERE_AMT,
            RMONRE_AMT,
            OVIN_AMT,
            OVINRE_AMT,
            RAMG_ID,
            ORD_CNT,
            FST_DEL_YM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ramg_Ym,
            v_Cust_No,
            v_Ramg_Stat,
            v_Ramg_Amt,
            v_Arre_Amt,
            v_Rmon_Amt,
            v_Ramgre_Amt,
            v_Arrere_Amt,
            v_Rmonre_Amt,
            v_Ovin_Amt,
            v_Ovinre_Amt,
            v_Ramg_Id,
            v_Ord_Cnt,
            v_Fst_Del_Ym,
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

  END f_InsertRtre0110;

  /*****************************************************************************
  -- ä�� ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*ä�ǰ������          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*��ü���ڼ����ݾ�      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*ä�ǰ�����            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*���Ǽ�              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0110
    SET    RAMG_STAT  = v_Ramg_Stat,
           RAMG_AMT   = v_Ramg_Amt,
           ARRE_AMT   = v_Arre_Amt,
           RMON_AMT   = v_Rmon_Amt,
           RAMGRE_AMT = v_Ramgre_Amt,
           ARRERE_AMT = v_Arrere_Amt,
           RMONRE_AMT = v_Rmonre_Amt,
           OVIN_AMT   = v_Ovin_Amt,
           OVINRE_AMT = v_Ovinre_Amt,
           RAMG_ID    = v_Ramg_Id,
           ORD_CNT    = v_Ord_Cnt,
           FST_DEL_YM = v_Fst_Del_Ym,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE 
    WHERE  RAMG_YM    = v_Ramg_Ym
    AND    CUST_NO    = v_Cust_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0110;

  /*****************************************************************************
  -- ä�� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0110 (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0110
    WHERE  RAMG_YM = v_Ramg_Ym
    AND    CUST_NO = v_Cust_No;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110(2)', 'ä�ǰ������', v_Ramg_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110(2)', '����ȣ', v_Cust_No);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110(2)', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0110;

  /*****************************************************************************
  -- ä�� ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0110 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Cust_No        IN RTRE0110.CUST_NO%TYPE,        /*����ȣ              */
    v_Ramg_Stat      IN RTRE0110.RAMG_STAT%TYPE,      /*ä�ǰ������          */
    v_Ramg_Amt       IN RTRE0110.RAMG_AMT%TYPE,       /*ä�ǰ����ݾ�          */
    v_Arre_Amt       IN RTRE0110.ARRE_AMT%TYPE,       /*��ü�ݾ�              */
    v_Rmon_Amt       IN RTRE0110.RMON_AMT%TYPE,       /*���û���ݾ�          */
    v_Ramgre_Amt     IN RTRE0110.RAMGRE_AMT%TYPE,     /*ä�ǰ��������ݾ�      */
    v_Arrere_Amt     IN RTRE0110.ARRERE_AMT%TYPE,     /*��ü�����ݾ�          */
    v_Rmonre_Amt     IN RTRE0110.RMONRE_AMT%TYPE,     /*���û�������ݾ�      */
    v_Ovin_Amt       IN RTRE0110.OVIN_AMT%TYPE,       /*��ü���ڱݾ�          */
    v_Ovinre_Amt     IN RTRE0110.OVINRE_AMT%TYPE,     /*��ü���ڼ����ݾ�      */
    v_Ramg_Id        IN RTRE0110.RAMG_ID%TYPE,        /*ä�ǰ�����            */
    v_Ord_Cnt        IN RTRE0110.ORD_CNT%TYPE,        /*���Ǽ�              */
    v_Fst_Del_Ym     IN RTRE0110.FST_DEL_YM%TYPE,     /*��ü���۳��          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ä�ǰ������,  ����� ID   
    IF (TRIM(v_Ramg_Ym) IS NULL) OR (0 != ISDATE(v_Ramg_Ym)) THEN
        v_Return_Message := 'ä�ǰ������('||v_Ramg_Ym||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;  
    
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '����ȣ('||v_Cust_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Ramg_Stat) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R035', v_Ramg_Stat)) THEN
        v_Return_Message := 'ä�ǰ������('||v_Ramg_Stat||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;        
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtre0110Count(v_Ramg_Ym, v_Cust_No) THEN

        IF 0 != f_InsertRtre0110(v_Ramg_Ym, v_Cust_No, v_Ramg_Stat, v_Ramg_Amt, 
                                 v_Arre_Amt, v_Rmon_Amt, v_Ramgre_Amt, v_Arrere_Amt, 
                                 v_Rmonre_Amt, v_Ovin_Amt, v_Ovinre_Amt, v_Ramg_Id, 
                                 v_Ord_Cnt, v_Fst_Del_Ym, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'ä�� ���� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0110(v_Ramg_Ym, v_Cust_No, v_Ramg_Stat, v_Ramg_Amt, 
                                     v_Arre_Amt, v_Rmon_Amt, v_Ramgre_Amt, v_Arrere_Amt, 
                                     v_Rmonre_Amt, v_Ovin_Amt, v_Ovinre_Amt, v_Ramg_Id, 
                                     v_Ord_Cnt, v_Fst_Del_Ym, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'ä�� ���� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0110(v_Ramg_Ym, v_Cust_No, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'ä�� ���� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.p_IUDRtre0110(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.p_IUDRtre0110(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0110;

  /*****************************************************************************
  -- RE-040111 ä�ǰ������ ���� : �ش� ����� �������� ä�� ���� ���������� ���� 
  *****************************************************************************/
  PROCEDURE p_InsertRtre0110Aggregate (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Proc_Yn        IN VARCHAR,                      /*ó������ ����         */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- ä�Ǵ�� ����: ä�Ǵ�� ����� ���� �����ͷ� ���û���ݾ� + ������ü������ �������� ������.
    CURSOR  Cur_Rtre0110 IS 
    SELECT  v_Ramg_Ym   AS RAMG_YM,
            'D'         AS ARRE_FG,     -- ��ü����
            B.ORD_NO    AS ORD_NO,
            B.CUST_NO   AS CUST_NO,
            A.RECP_TP   AS RECP_TP,
            B.PAY_MTHD  AS PAY_MTHD,
            B.PAY_DD    AS PAY_DD,
            1           AS APPR_SCNT,
            A.ARRE_AMT  AS RAMG_AMT,
            A.ARRE_AMT  AS ARRE_AMT,
            0           AS RMON_AMT,
            0           AS RAMGRE_AMT,
            0           AS ARRERE_AMT,
            0           AS RMONRE_AMT,
            0           AS OVIN_AMT,    -- ��ü���ڱݾ� ���ϱ� ; FUNCTION �űԻ��� �ʿ�
            0           AS OVINRE_AMT,
            B.MFP_YN    AS MFP_YN,
            B.TCAN_YN   AS TCAN_YN,
            B.OS_YN     AS OS_YN,
            ( 
            SELECT  SUBSTR( MIN(F.ZFB_DAY), 1, 6)
            FROM    RTRE0101 E, RTSD0109 F
            WHERE   E.DELY_DAY = TO_CHAR(LAST_DAY(TO_DATE(v_Ramg_Ym, 'YYYYMM')),'YYYYMMDD')
            AND     E.ORD_NO = B.ORD_NO
            AND     E.CUST_NO = B.CUST_NO
            AND     F.ORD_NO = E.ORD_NO
            AND     F.SCHD_SEQ = E.SCHD_SEQ 
            )           AS FST_DEL_YM,
            A.SCHD_SEQ  AS SCHD_SEQ,
            A.RECP_NU   AS RECP_NU,
            A.SALE_AMT  AS MSALE_AMT,
            A.RECP_AMT  AS MRECP_AMT,
            A.ARRE_AMT  AS MARRE_AMT,
            A.PAY_MTHD  AS MPAY_MTHD,
            A.PAY_DD    AS MPAY_DD,
            E.ZFB_DAY        AS MZFB_DAY
    FROM    RTRE0101 A, -- ������ü���� -> RTRE0100   
            RTSD0108 B,
            RTSD0109 E
    WHERE   A.DELY_DAY = TO_CHAR(TO_DATE(v_Ramg_Ym, 'YYYYMM')-1,'YYYYMMDD') -- ä�ǰ������ ���� ��������
    AND     B.ORD_NO   = A.ORD_NO
    AND     E.ORD_NO   = A.ORD_NO
    AND     E.SCHD_SEQ = A.SCHD_SEQ
    UNION
    SELECT  v_Ramg_Ym   AS RAMG_YM,
            'M'         AS ARRE_FG,
            D.ORD_NO    AS ORD_NO,
            D.CUST_NO   AS CUST_NO,
            C.RECP_TP   AS RECP_TP,
            D.PAY_MTHD  AS PAY_MTHD,
            D.PAY_DD    AS PAY_DD,
            0           AS APPR_SCNT,
--            C.ARRE_AMT  AS RAMG_AMT,
--            0           AS ARRE_AMT,
--            C.ARRE_AMT  AS RMON_AMT,
            C.SALE_AMT  AS RAMG_AMT,
            0           AS ARRE_AMT,
            C.SALE_AMT  AS RMON_AMT,
            0           AS RAMGRE_AMT,
            0           AS ARRERE_AMT,
            0           AS RMONRE_AMT,
            0           AS OVIN_AMT, 
            0           AS OVINRE_AMT,
            D.MFP_YN    AS MFP_YN,
            D.TCAN_YN   AS TCAN_YN,
            D.OS_YN     AS OS_YN,
            NULL        AS FST_DEL_YM,
            C.SCHD_SEQ  AS SCHD_SEQ,
            C.RECP_NU   AS RECP_NU,
            C.SALE_AMT  AS MSALE_AMT,
            C.RECP_AMT  AS MRECP_AMT,
            C.ARRE_AMT  AS MARRE_AMT,
            C.PAY_MTHD  AS MPAY_MTHD,
            C.PAY_DD    AS MPAY_DD,
            C.ZFB_DAY   AS MZFB_DAY
    FROM    RTSD0109 C, -- ���û���ݾ� -> RTSD0109  
            RTSD0108 D
    WHERE   C.ZFB_DAY BETWEEN v_Ramg_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Ramg_Ym, 'YYYYMM')),'YYYYMMDD')
    AND     C.SCD_STAT = 'S'
    AND     C.ZLSPR    = 'N'
    AND     C.USE_YN   = 'Y'
    AND     D.ORD_NO   = C.ORD_NO;

    CURSOR  Cur_Rtre0111 IS 
    SELECT  RAMG_YM,
            CUST_NO, 
            --��üȸ�� 0 ~ 2���� ���ݰ���('A'),  3 ~ 6���� ���ݰ���('B'), 7�����̻� ä�ǰ���('C') �� ����
            CASE 
            WHEN MAX(APPR_SCNT) >= 0 AND MAX(APPR_SCNT) <= 2 THEN 'A'
            WHEN MAX(APPR_SCNT) >= 3 AND MAX(APPR_SCNT) <= 6 THEN 'B'
            WHEN MAX(APPR_SCNT) >= 7 THEN 'C'        
            ELSE NULL    
            END AS RAMG_STAT,
            SUM( RAMG_AMT )          AS RAMG_AMT,
            SUM( ARRE_AMT )          AS ARRE_AMT,
            SUM( RMON_AMT )          AS RMON_AMT,
            SUM( OVIN_AMT )          AS OVIN_AMT,
            COUNT( DISTINCT ORD_NO ) AS ORD_CNT,
            MIN ( FST_DEL_YM )       AS FST_DEL_YM
    FROM    RTRE0111
    WHERE   RAMG_YM = v_Ramg_Ym
    GROUP   BY RAMG_YM, CUST_NO;
        
    e_Error EXCEPTION;
    
    v_Tdata_Cnt RTRE0099.TDATA_CNT%TYPE DEFAULT NULL;/*������ �ѰǼ�         */
    v_Ramg_Id   RTRE0110.RAMG_ID%TYPE DEFAULT NULL;  /*ä�ǰ�����            */

  BEGIN

    -- �ʼ���: ä�ǰ������, ó������ ����, ����� ID    
    IF (TRIM(v_Ramg_Ym) IS NULL) OR (0 != ISDATE(v_Ramg_Ym)) THEN
        v_Return_Message := 'ä�ǰ������('||v_Ramg_Ym||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Proc_Yn) IS NULL) OR (TRIM(v_Proc_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := 'ó������ ����('||v_Proc_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ش�� ���� ������ ���� ���� Ȯ��
    IF 0 < f_sRtre0110AfterCount(v_Ramg_Ym) THEN
        v_Return_Message := '�ش��('||v_Ramg_Ym||') ���� ������ �����ϱ� ������ ��ó�� �Ұ��մϴ�!';
        RAISE e_Error;
    END IF;    
    
    -- �ش�� ������ ���� ���� Ȯ��
    IF 0 < f_sRtre0110EqualCount(v_Ramg_Ym) THEN

        IF v_Proc_Yn = 'Y' THEN           
                
            -- �ش�� ä�� ���� ���� Delete
            IF 0 != f_DeleteRtre0110Equal (v_Ramg_Ym, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'ä�� ���� ���� Delete ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- �ش�� ä�� ���� ���γ��� Delete
            IF 0 != Pkg_Rtre0111.f_DeleteRtre0111Equal (v_Ramg_Ym, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'ä�� ���� ���γ��� Delete ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- �ش�� ���û�� ���� ���� Delete
            IF 0 != Pkg_Rtre0112.f_DeleteRtre0112Equal (v_Ramg_Ym, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���û�� ���� ���� Delete ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
        ELSE
            v_Return_Message := 'ä�Ǵ���� �����ϱ� ������ ������ �Ұ��մϴ�!';
            RAISE e_Error;
        END IF; 

    END IF;
    
    v_Tdata_Cnt:= 0;
    
    -- ä�Ǵ�� ����
    FOR CUR IN Cur_Rtre0110 LOOP
        EXIT WHEN Cur_Rtre0110%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        
        -- ä�� ���� ���γ���(RTRE0111) Insert / Update
        Pkg_Rtre0111.p_IUDRtre0111Aggregate (
                    CUR.RAMG_YM,        /*(v_Ramg_Ym   ) ä�ǰ������          */
                    CUR.ORD_NO,         /*(v_Ord_No    ) ����ȣ              */
                    CUR.CUST_NO,        /*(v_Cust_No   ) ����ȣ              */
                    CUR.RECP_TP,        /*(v_Recp_Tp   ) û������              */
                    CUR.PAY_MTHD,       /*(v_Pay_Mthd  ) �������              */
                    CUR.PAY_DD,         /*(v_Pay_Dd    ) ������                */
                    CUR.APPR_SCNT,      /*(v_Appr_Scnt ) ��üȸ��              */
                    CUR.RAMG_AMT,       /*(v_Ramg_Amt  ) ä�ǰ����ݾ�          */
                    CUR.ARRE_AMT,       /*(v_Arre_Amt  ) ��ü�ݾ�              */
                    CUR.RMON_AMT,       /*(v_Rmon_Amt  ) ���û���ݾ�          */
                    CUR.RAMGRE_AMT,     /*(v_Ramgre_Amt) ä�ǰ��������ݾ�      */
                    CUR.ARRERE_AMT,     /*(v_Arrere_Amt) ��ü�����ݾ�          */
                    CUR.RMONRE_AMT,     /*(v_Rmonre_Amt) ���û�������ݾ�      */
                    CUR.OVIN_AMT,       /*(v_Ovin_Amt  ) ��ü���ڱݾ�          */
                    CUR.OVINRE_AMT,     /*(v_Ovinre_Amt) ��ü���� �����ݾ�     */
                    CUR.MFP_YN,         /*(v_Mfp_Yn    ) �ߵ��ϳ�����          */
                    CUR.TCAN_YN,        /*(v_Tcan_Yn   ) �ӽ��ؾ࿩��          */
                    CUR.OS_YN,          /*(v_Os_Yn     ) ��������������        */
                    CUR.FST_DEL_YM,     /*(v_Fst_Del_Ym) ��ü���۳��          */
                    v_Reg_Id,           /*(v_Reg_Id    ) ����� ID             */
                    v_Success_Code,
                    v_Return_Message,
                    v_ErrorText
                    );
            
        IF 0 != v_Success_Code THEN
            v_Return_Message := 'ä�� ���� ���γ���(RTRE0111) ���� ����!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;        
        END IF;
        
        -- ���û�� ���� ����(RTRE0112) Insert    
        IF 0 !=Pkg_Rtre0112.f_InsertRtre0112 (                                                   
                    CUR.RAMG_YM,        /*(v_Ramg_Ym ) ä�ǰ������          */
                    CUR.ORD_NO,         /*(v_Ord_No  ) ����ȣ              */
                    CUR.CUST_NO,        /*(v_Cust_No ) ����ȣ              */
                    CUR.SCHD_SEQ,       /*(v_Schd_Seq) û������              */
                    CUR.RECP_TP,        /*(v_Recp_Tp ) û������              */
                    CUR.RECP_NU,        /*(v_Recp_Nu ) û��ȸ��              */
                    CUR.MSALE_AMT,      /*(v_Sale_Amt) ����ݾ�              */
                    CUR.MRECP_AMT,      /*(v_Recp_Amt) �����ݾ�              */
                    CUR.MARRE_AMT,      /*(v_Arre_Amt) ��ü�ݾ�              */
                    CUR.MPAY_MTHD,      /*(v_Pay_Mthd) ��������              */
                    CUR.MPAY_DD,        /*(v_Pay_Dd  ) ��ü��                */
                    CUR.MZFB_DAY,       /*(v_Zfb_Day ) �����������        */
                    v_Reg_Id,           /*(v_Reg_Id  ) ����� ID             */
                    v_ErrorText                                               
                    ) THEN
            v_Return_Message := 'ä�� ���� ���γ���(RTRE0112) ���� ����!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;                
        END IF;
    
            
    END LOOP;      
    
    IF Cur_Rtre0110%ISOPEN THEN
        CLOSE Cur_Rtre0110;
    END IF;
    
    -- ä�ǰ����� : ���� ä�ǰ����ڿ� ���� ���� ��� ���翡 ���� �����ڵ�� ����, ���� ������
    v_Ramg_Id := Pkg_Rtcm0051.f_sRtcm0051Cd('R034');

    v_Tdata_Cnt:= 0;
    
    -- ä�ǰ��� ����
    FOR CUR IN Cur_Rtre0111 LOOP
        EXIT WHEN Cur_Rtre0111%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        
                        
        -- ä�� ���� ����(RTRE0110) Insert
        p_IUDRtre0110 (
                    'I',                /*(v_Comm_Dvsn ) ó������(I,U,D)       */
                    CUR.RAMG_YM,        /*(v_Ramg_Ym   ) ä�ǰ������          */
                    CUR.CUST_NO,        /*(v_Cust_No   ) ����ȣ              */
                    CUR.RAMG_STAT,      /*(v_Ramg_Stat ) ä�ǰ������          */
                    CUR.RAMG_AMT,       /*(v_Ramg_Amt  ) ä�ǰ����ݾ�          */
                    CUR.ARRE_AMT,       /*(v_Arre_Amt  ) ��ü�ݾ�              */
                    CUR.RMON_AMT,       /*(v_Rmon_Amt  ) ���û���ݾ�          */
                    0,                  /*(v_Ramgre_Amt) ä�ǰ��������ݾ�      */
                    0,                  /*(v_Arrere_Amt) ��ü�����ݾ�          */
                    0,                  /*(v_Rmonre_Amt) ���û�������ݾ�      */
                    CUR.OVIN_AMT,       /*(v_Ovin_Amt  ) ��ü���ڱݾ�          */
                    0,                  /*(v_Ovinre_Amt) ��ü���ڼ����ݾ�      */
                    v_Ramg_Id,          /*(v_Ramg_Id   ) ä�ǰ�����            */
                    CUR.ORD_CNT,        /*(v_Ord_Cnt   ) ���Ǽ�              */
                    CUR.FST_DEL_YM,     /*(v_Fst_Del_Ym) ��ü���۳��          */
                    v_Reg_Id,           /*(v_Reg_Id    ) ����� ID             */
                    v_Success_Code,
                    v_Return_Message,
                    v_ErrorText
                    );
                    
        IF 0 != v_Success_Code THEN
            v_Return_Message := 'ä�� ���� ����(RTRE0110) ���� ����!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;        
        END IF;
                    
    END LOOP;    

    IF Cur_Rtre0111%ISOPEN THEN
        CLOSE Cur_Rtre0111;
    END IF;
    
    
    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.p_InsertRtre0110Aggregate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.p_InsertRtre0110Aggregate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0110Aggregate;
  
  /*****************************************************************************
  -- ä�� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0110AfterCount(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE           /*ä�ǰ������        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0110
    WHERE   RAMG_YM > v_Ramg_Ym;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0110AfterCount;
  

  /*****************************************************************************
  -- ä�� ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0110EqualCount(
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE           /*ä�ǰ������        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0110
    WHERE   RAMG_YM = v_Ramg_Ym;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0110EqualCount;  
  

  /*****************************************************************************
  -- ä�� ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0110Equal (
    v_Ramg_Ym        IN RTRE0110.RAMG_YM%TYPE,        /*ä�ǰ������          */
    v_Reg_Id         IN RTRE0110.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0110
    WHERE  RAMG_YM = v_Ramg_Ym;
    
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110Equal', 'ä�ǰ������', v_Ramg_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0110.f_DeleteRtre0110Equal', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0110Equal;
  
  
END Pkg_Rtre0110;
/
