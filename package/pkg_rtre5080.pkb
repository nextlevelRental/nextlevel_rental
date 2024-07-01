CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5080 AS
/*******************************************************************************
   NAME      Pkg_Rtre5080
   PURPOSE   ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-24  choidh           1. Created this package body.
   1.1        2017-11-30  wjim            [20171117_02] ���� ���� ��� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre5080Count(
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,        /*��Ż������          */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,         /*����ó������      */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE          /*���ݼ���          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5080
    WHERE   AGENCY_CD      = v_Agency_Cd
    AND     APFD_DAY       = v_Apfd_Day
    AND     APFD_SEQ       = v_Apfd_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5080Count;

  /*****************************************************************************
  -- ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre5080 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*���ݱ���            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*���ݹ߻��ݾ�        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*���������ݾ�        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*����ó�� ����       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD,                 /*��Ż������          */
            A.APFD_DAY,                  /*����ó������      */
            A.APFD_SEQ,                  /*���ݼ���          */
            A.APFD_TP,                   /*���ݱ���          */
            A.APFD_PAMT,                 /*���ݹ߻��ݾ�      */
            A.APFD_MAMT,                 /*���������ݾ�      */
            A.APFD_MSG,                  /*����ó�� ����     */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE5080 A
    WHERE   A.AGENCY_CD        = DECODE(v_Agency_Cd      , NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.APFD_DAY         = DECODE(v_Apfd_Day       , NULL, A.APFD_DAY        , v_Apfd_Day)
    AND     A.APFD_SEQ         = DECODE(v_Apfd_Seq       , NULL, A.APFD_SEQ        , v_Apfd_Seq)
    AND     A.APFD_TP          = DECODE(v_Apfd_Tp        , NULL, A.APFD_TP         , v_Apfd_Tp)
    AND     A.APFD_PAMT        = DECODE(v_Apfd_Pamt      , NULL, A.APFD_PAMT       , v_Apfd_Pamt)
    AND     A.APFD_MAMT        = DECODE(v_Apfd_Mamt      , NULL, A.APFD_MAMT       , v_Apfd_Mamt)
    AND     A.APFD_MSG         = DECODE(v_Apfd_Msg       , NULL, A.APFD_MSG        , v_Apfd_Msg)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre5080;

  /*****************************************************************************
  -- ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*���ݱ���            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*���ݹ߻��ݾ�        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*���������ݾ�        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*����ó�� ����       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5080 (
            AGENCY_CD,
            APFD_DAY,
            APFD_SEQ,
            APFD_TP,
            APFD_PAMT,
            APFD_MAMT,
            APFD_MSG,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Agency_Cd,
            v_Apfd_Day,
            v_Apfd_Seq,
            v_Apfd_Tp,
            v_Apfd_Pamt,
            v_Apfd_Mamt,
            v_Apfd_Msg,
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

  END f_InsertRtre5080;

  /*****************************************************************************
  -- ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*���ݱ���            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*���ݹ߻��ݾ�        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*���������ݾ�        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*����ó�� ����       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5080
    SET    APFD_TP          = v_Apfd_Tp,
           APFD_PAMT        = v_Apfd_Pamt,
           APFD_MAMT        = v_Apfd_Mamt,
           APFD_MSG         = v_Apfd_Msg,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  AGENCY_CD        = v_Agency_Cd
    AND    APFD_DAY         = v_Apfd_Day
    AND    APFD_SEQ         = v_Apfd_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5080;

  /*****************************************************************************
  -- ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5080 (
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTRE5080
    WHERE  AGENCY_CD        = v_Agency_Cd
    AND    APFD_DAY         = v_Apfd_Day
    AND    APFD_SEQ         = v_Apfd_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.f_DeleteRtre5080(2)', '��Ż������', v_Agency_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.f_DeleteRtre5080(2)', '����ó������', v_Apfd_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.f_DeleteRtre5080(2)', '���ݼ���', v_Apfd_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.f_DeleteRtre5080(2)', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5080;

  /*****************************************************************************
  -- ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5080 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Apfd_Day       IN RTRE5080.APFD_DAY%TYPE,       /*����ó������        */
    v_Apfd_Seq       IN RTRE5080.APFD_SEQ%TYPE,       /*���ݼ���            */
    v_Apfd_Tp        IN RTRE5080.APFD_TP%TYPE,        /*���ݱ���            */
    v_Apfd_Pamt      IN RTRE5080.APFD_PAMT%TYPE,      /*���ݹ߻��ݾ�        */
    v_Apfd_Mamt      IN RTRE5080.APFD_MAMT%TYPE,      /*���������ݾ�        */
    v_Apfd_Msg       IN RTRE5080.APFD_MSG%TYPE,       /*����ó�� ����       */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ��Ż������, ����ó������, ���ݼ���, ����� ID
    IF (TRIM(v_Agency_Cd) IS NULL) THEN
        v_Return_Message := '��Ż������('||v_Agency_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Apfd_Day) IS NULL) THEN
        v_Return_Message := '����ó������('||v_Apfd_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Apfd_Seq) IS NULL) THEN
        v_Return_Message := '���ݼ���('||v_Apfd_Seq||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        IF (TRIM(v_Apfd_Tp) IS NULL) THEN
            v_Return_Message := '���ݱ���('||v_Apfd_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Apfd_Pamt) IS NULL) THEN
            v_Return_Message := '���ݹ߻��ݾ�('||v_Apfd_Pamt||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Apfd_Mamt) IS NULL) THEN
            v_Return_Message := '���������ݾ�('||v_Apfd_Mamt||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'I' THEN
            IF 0 != f_InsertRtre5080( v_Agency_Cd, v_Apfd_Day,  v_Apfd_Seq,
                                      v_Apfd_Tp,   v_Apfd_Pamt, v_Apfd_Mamt, v_Apfd_Msg,
                                      v_Reg_Id,    v_ErrorText
                                    ) THEN
                v_Return_Message := '���� ���� ��� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_UpdateRtre5080( v_Agency_Cd, v_Apfd_Day,  v_Apfd_Seq,
                                      v_Apfd_Tp,   v_Apfd_Pamt, v_Apfd_Mamt, v_Apfd_Msg,
                                      v_Reg_Id,    v_ErrorText
                                    ) THEN
                v_Return_Message := '���� ���� ���� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtre5080( v_Agency_Cd, v_Apfd_Day,  v_Apfd_Seq,
                                  v_Reg_Id,    v_ErrorText
                                    ) THEN
            v_Return_Message := '���� ���� ���� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '���������� ó���Ǿ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_IUDRtre5080(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_IUDRtre5080(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5080;


  /*****************************************************************************
  -- ���� ���� ó��
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.1        2017-11-30  wjim             [20171117_02] ���� ���� ��� �߰�
  *****************************************************************************/
  PROCEDURE p_CreateRtre5080Allowance (
    v_Period         IN CHAR,                           /*������              */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  ) IS

    -- ������ ��ȸ 
    -- - [20171117_02] �� ���� ���� ��ü
    CURSOR  Cur_Rtre5070 IS
    SELECT  A2.AGENCY_CD
         ,  A2.APFD_DAY
         ,  ROWNUM                                   AS APFD_SEQ
         ,  A2.APFD_TP
         ,  DECODE(A2.APFD_TP, 'O1', A2.APFD_AMT, 0) AS APFD_PAMT
         ,  DECODE(A2.APFD_TP, 'D1', A2.APFD_AMT, 0) AS APFD_MAMT
         ,  A2.APFD_MSG 
      FROM  (
                SELECT  A1.AGENCY_CD
                     ,  'O1'                   AS APFD_TP
                     ,  TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD') AS APFD_DAY   
                     ,  A1.MFAPFD_AMT          AS APFD_AMT
                     ,  '���� ���� - ������' AS APFD_MSG
                  FROM  RTRE5070 A1
                 WHERE  A1.SLCM_YM    = v_Period
                   AND  A1.MFAPFD_AMT > 0
                 UNION  ALL   
                SELECT  B1.AGENCY_CD
                     ,  'D1'                   AS APFD_TP
                     ,  B1.PAY_DAY             AS APFD_DAY
                     ,  B1.PAY_AMT             AS APFD_AMT
                     ,  B1.PAY_MSG             AS APFD_MSG
                  FROM  RTRE0150 B1
                 WHERE  B1.PAY_DAY LIKE v_Period||'%'
                   AND  B1.USE_YN  = 'Y'
            ) A2
     WHERE  1=1
     ORDER  BY A2.AGENCY_CD
         ,  A2.APFD_TP DESC;
     
--     -- [20171117_02] ����
--    SELECT  A.AGENCY_CD                 AGENCY_CD,      /*�Ǹſ���ȣ          */
--            ROWNUM                      APFD_SEQ,       /*���ݼ���          */
--            A.MFAPFD_AMT                MFAPFD_AMT      /*���� �߻��ݾ�     */
--    FROM    RTRE5070 A
--    WHERE   A.SLCM_YM = v_Period
--    AND     A.MFAPFD_AMT > 0;

    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Apfd_Day      RTRE5080.APFD_DAY%TYPE;
    v_Apfd_Msg      RTRE5080.APFD_MSG%TYPE;

  BEGIN

    -- �ʼ���: �������, ����� ID
    IF (TRIM(v_Period) IS NULL) OR (0 <> ISDATE(v_Period)) OR (6 <> LENGTH(TRIM(v_Period))) THEN
        v_Return_Message := '������('||v_Period||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �̹�ó���Ǿ����� Ȯ��
    v_curr_cunt := 0;
    BEGIN

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5080
        WHERE   APFD_DAY BETWEEN v_Period||'01'
                             AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
        AND     APFD_PAMT > 0
        AND     ROWNUM =  1;

        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;

    IF v_curr_cunt > 0 THEN
        v_Return_Message := '������('||v_Period||') : ���� ó���� ������ �����Ͽ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    -- �Ǹ��κ� ������ ���� ���� ����
    v_curr_cunt := 0;
--    v_Apfd_Day  := TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD'); --[20171117_02] �� ���� �̻�� ó��
--    v_Apfd_Msg  := '���� ���� - ������'; --[20171117_02] �� ���� �̻�� ó��

    FOR CUR_5070 IN Cur_Rtre5070 LOOP
        EXIT WHEN Cur_Rtre5070%NOTFOUND;

        v_curr_cunt  := v_curr_cunt + 1;
        
        IF 0 != f_InsertRtre5080( 
              CUR_5070.AGENCY_CD, CUR_5070.APFD_DAY , CUR_5070.APFD_SEQ
            , CUR_5070.APFD_TP  , CUR_5070.APFD_PAMT, CUR_5070.APFD_MAMT, CUR_5070.APFD_MSG
            , v_Reg_Id          , v_ErrorText
        ) THEN
            v_Return_Message := '���� ���� ��� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

--        -- [20171117_02] ����
--        IF 0 != f_InsertRtre5080( CUR_5070.AGENCY_CD, v_Apfd_Day,          CUR_5070.APFD_SEQ,
--                                  'O1',               CUR_5070.MFAPFD_AMT, 0, v_Apfd_Msg,
--                                  v_Reg_Id,           v_ErrorText
--                                ) THEN
--            v_Return_Message := '���� ���� ��� ����!!!'||'-'||v_Errortext;
--            v_Errortext := v_Errortext;
--            RAISE e_Error;
--        END IF;

    END LOOP;

    IF Cur_Rtre5070%ISOPEN THEN
        CLOSE Cur_Rtre5070;
    END IF;


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '���������� ó���Ǿ����ϴ�';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '������('||v_Period||') : ó������ �������� �ʽ��ϴ�!';
        RAISE e_Error;
    END IF;



    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre5070%ISOPEN THEN
            CLOSE Cur_Rtre5070;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_CreateRtre5080Allowance(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre5070%ISOPEN THEN
            CLOSE Cur_Rtre5070;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_CreateRtre5080Allowance(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5080Allowance;


  /*****************************************************************************
  -- �Ǹ��κ� ���� ��Ȳ - �Ǹ��κ� ���� �ܾ��� ��ȸ�ϴ� ���
  *****************************************************************************/
  PROCEDURE p_sRtre5080AgencyAppStatus (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE,      /*��Ż������            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Reg_Id         IN RTRE5080.REG_ID%TYPE,         /*����� ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;

  BEGIN

    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5080.p_sRtre5080AgencyAppStatus(1)', v_ErrorText);
    END IF;

    -- ����� �׷쿡 ���� ��ȸ ���� ���� üũ
    v_Serch_Flag := Pkg_Rtre5070.f_sRtre5070UserInputValueCheck('Pkg_Rtre5080.p_sRtre5080AgencyAppStatus',v_Agency_Cd, v_Sales_Group, v_Sales_Office, v_Reg_Id);

    
    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*��Ż����           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*��Ż����           */ 
      FROM (
    SELECT  A.SALES_GROUP                                             AS SALES_GROUP,      /*����       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018',A.SALES_GROUP)    AS SALES_GROUP_NM,   /*�����     */
            A.SALES_OFFICE                                            AS SALES_OFFICE,     /*����       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019',A.SALES_OFFICE)   AS SALES_OFFICE_NM,  /*������     */
            A.AGENCY_CD                                               AS AGENCY_CD,        /*�Ǹ�ó�ڵ� */
            A.AGENCY_NM                                               AS AGENCY_NM,        /*�Ǹ�ó��   */
            A.LIFNR                                                   AS LIFNR,            /*�����ڵ�   */
            A.APFD_AMT                                                AS APFD_AMT          /*���ݾ�   */
    FROM    (
            SELECT  MIN(B.SALES_GROUP)  AS SALES_GROUP,
                    MIN(B.SALES_OFFICE) AS SALES_OFFICE,
                    A.AGENCY_CD,
                    MIN(B.AGENCY_NM)    AS AGENCY_NM,
                    MIN(B.LIFNR)        AS LIFNR,
                    SUM(NVL(A.APFD_PAMT,0) - NVL(A.APFD_MAMT,0)) AS APFD_AMT,
                    MIN(B.RENTAL_GROUP) AS RENTAL_GROUP,
                    MIN(B.RENTAL_OFFICE) AS RENTAL_OFFICE
            FROM    RTRE5080 A,
                    RTVIEW02 B
            WHERE   v_Serch_Flag   = 0
            AND     A.AGENCY_CD    = B.AGENCY_CD
           -- AND     A.AGENCY_CD    = DECODE( v_Agency_Cd,    NULL, A.AGENCY_CD,    v_Agency_Cd    )
            --AND     B.SALES_GROUP  = DECODE( v_Sales_Group,  NULL, B.SALES_GROUP,  v_Sales_Group  )
            --AND     B.SALES_OFFICE = DECODE( v_Sales_Office, NULL, B.SALES_OFFICE, v_Sales_Office )
            AND     A.AGENCY_CD = CASE WHEN v_Agency_Cd IS NULL THEN A.AGENCY_CD ELSE v_Agency_Cd END
            AND     B.SALES_GROUP = CASE WHEN v_Sales_Group IS NULL THEN B.SALES_GROUP ELSE v_Sales_Group END
            AND     B.SALES_OFFICE = CASE WHEN v_Sales_Office IS NULL THEN B.SALES_OFFICE ELSE v_Sales_Office END
            GROUP   BY A.AGENCY_CD
            ) A
    ORDER BY A.RENTAL_GROUP, A.RENTAL_OFFICE, A.AGENCY_CD
         ) A
         LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
     ) A
    WHERE 1=1
      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- ����ڱ׷� 01, 02�� ��� ��ȸ ����
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- ����ڱ׷� 01, 02�� ��� ��ȸ ����
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1

    ;

  END p_sRtre5080AgencyAppStatus;


  /*****************************************************************************
  -- �Ǹ��κ� ���� ��Ȳ - ���� �߻�/���� ���� ����
  *****************************************************************************/
  PROCEDURE p_sRtre5080AgencyAppList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTRE5080.AGENCY_CD%TYPE       /*��Ż������            */
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD                                           AS AGENCY_CD, /*�Ǹ�ó�ڵ�     */
            B.AGENCY_NM                                           AS AGENCY_NM, /*�Ǹ�ó��       */
            A.APFD_DAY                                            AS APFD_DAY , /*����ó������ */
            A.APFD_TP                                             AS APFD_TP  , /*���ݱ���     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R043',A.APFD_TP)    AS APFD_NM  , /*���� ���и�  */
            A.APFD_PAMT                                           AS APFD_PAMT, /*���� �߻��ݾ�*/
            A.APFD_MAMT                                           AS APFD_MAMT, /*���� �����ݾ�*/
            A.APFD_MSG                                            AS APFD_MSG   /*����ó�� ����*/
    FROM    RTRE5080 A,
            RTVIEW02 B
    WHERE   A.AGENCY_CD = v_Agency_cd
    AND     A.AGENCY_CD = B.AGENCY_CD;

  END p_sRtre5080AgencyAppList;

END Pkg_Rtre5080;
/
