CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0090 AS
/*******************************************************************************
   NAME      Pkg_Rtre0090
   PURPOSE   ���ݿ����� �߱ޱ��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-14  jemcarry         1. Created this package body.
   1.1        2017-04-06  wjim             [20170406_01] 0�� ������ �߱޺Ұ�
   1.2        2017-11-03  wjim             [20171103_02] KCP �뷮��û ���ε� ���� ����
                                           - '���ݿ����� �ŷ���ȣ' �߰� (10/26)
   1.3        2019-05-31  wjim             [20190429_01] ä�ǸŰ���� ���� ����                                           
*******************************************************************************/

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0090Count(
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,          /*����ȣ            */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE            /*��ϼ���            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0090
    WHERE   CUST_NO = v_Cust_No
    AND     CC_SEQ  = v_Cc_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0090Count;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0090 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*��ϼ���              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*���������            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*����������            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*���ݿ����� �߱ޱ���   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*���ݿ����� �߱޹�ȣ   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CUST_NO,                   /*����ȣ            */
            A.CC_SEQ,                    /*��ϼ���            */
            A.STR_DAY,                   /*���������          */
            A.END_DAY,                   /*����������          */
            A.CHI_TP,                    /*���ݿ����� �߱ޱ��� */
            A.CHI_NO,                    /*���ݿ����� �߱޹�ȣ */
            A.DEL_YN,                    /*��������            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0090 A
    WHERE   A.CUST_NO = DECODE(v_Cust_No , NULL, A.CUST_NO , v_Cust_No)
    AND     A.CC_SEQ  = DECODE(v_Cc_Seq  , NULL, A.CC_SEQ  , v_Cc_Seq)
    AND     A.STR_DAY = DECODE(v_Str_Day , NULL, A.STR_DAY , v_Str_Day)
    AND     A.END_DAY = DECODE(v_End_Day , NULL, A.END_DAY , v_End_Day)
    AND     A.CHI_TP  = DECODE(v_Chi_Tp  , NULL, A.CHI_TP  , v_Chi_Tp)
    AND     A.CHI_NO  = DECODE(v_Chi_No  , NULL, A.CHI_NO  , v_Chi_No)
    AND     A.DEL_YN  = DECODE(v_Del_Yn  , NULL, A.DEL_YN  , v_Del_Yn)
    AND     A.REG_ID  = DECODE(v_Reg_Id  , NULL, A.REG_ID  , v_Reg_Id);

  END p_sRtre0090;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*��ϼ���              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*���������            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*����������            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*���ݿ����� �߱ޱ���   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*���ݿ����� �߱޹�ȣ   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0090 (
            CUST_NO,
            CC_SEQ,
            STR_DAY,
            END_DAY,
            CHI_TP,
            CHI_NO,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Cust_No,
            v_Cc_Seq,
            v_Str_Day,
            v_End_Day,
            v_Chi_Tp,
            v_Chi_No,
            v_Del_Yn,
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

  END f_InsertRtre0090;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*��ϼ���              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*���������            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*����������            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*���ݿ����� �߱ޱ���   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*���ݿ����� �߱޹�ȣ   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0090
    SET    STR_DAY = v_Str_Day,
           END_DAY = v_End_Day,
           CHI_TP  = v_Chi_Tp,
           CHI_NO  = v_Chi_No,
           DEL_YN  = v_Del_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  CUST_NO = v_Cust_No
    AND    CC_SEQ  = v_Cc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0090;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*��ϼ���              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0090
    SET    DEL_YN  = 'Y',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  CUST_NO = v_Cust_No
    AND    CC_SEQ  = v_Cc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0090;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0090 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*����ȣ              */
    v_Cc_Seq         IN OUT RTRE0090.CC_SEQ%TYPE,     /*��ϼ���              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*���������            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*����������            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*���ݿ����� �߱ޱ���   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*���ݿ����� �߱޹�ȣ   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:����ȣ,���������,����������,���ݿ����� �߱ޱ���,���ݿ����� �߱޹�ȣ, ��������, ����� ID
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '����ȣ('||v_Cust_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Str_Day) THEN
        v_Return_Message := '���������('||v_Str_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_End_Day) THEN
        v_Return_Message := '����������('||v_End_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Chi_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('A029', v_Chi_Tp)) THEN
        v_Return_Message := '���ݿ����� �߱ޱ���('||v_Chi_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Chi_No) IS NULL THEN
        v_Return_Message := '���ݿ����� �߱޹�ȣ('||v_Chi_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Del_Yn) IS NULL) OR (TRIM(v_Del_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '��������('||v_Del_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtre0090Count(v_Cust_No, v_Cc_Seq) THEN
            v_Return_Message := '�ش� ����ȣ('||v_Cust_No||'-'||v_Cc_Seq||')�� �̹� ��ϵ� �����Ͱ� ���������� �űԵ��ó���� �Ұ��մϴ�.!!';
            RAISE e_Error;
        END IF;

        v_Cc_Seq := f_sRtre0090CcSeq(v_Cust_No);

        IF 0 != f_InsertRtre0090(v_Cust_No, v_Cc_Seq, v_Str_Day, v_End_Day,
                                     v_Chi_Tp, v_Chi_No, v_Del_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
            v_Return_Message := '���ݿ����� �߱ޱ��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 = f_sRtre0090Count(v_Cust_No, v_Cc_Seq) THEN
                v_Return_Message := '�ش� ����ȣ('||v_Cust_No||'-'||v_Cc_Seq||')�� ��ϵ� �����Ͱ� �������� �������� ����/����ó���� �Ұ��մϴ�.!!';
                RAISE e_Error;
            END IF;


            IF 0 != f_UpdateRtre0090(v_Cust_No, v_Cc_Seq, v_Str_Day, v_End_Day,
                                     v_Chi_Tp, v_Chi_No, v_Del_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '���ݿ����� �߱ޱ��� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0090(v_Cust_No, v_Cc_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ݿ����� �߱ޱ��� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_IUDRtre0090(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_IUDRtre0090(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0090;

  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� - ��ϼ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0090CcSeq(
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER IS
    v_Cc_Seq    RTRE0090.CC_SEQ%TYPE DEFAULT NULL;      /*��ϼ���            */
  BEGIN

    SELECT  NVL((SELECT  MAX(CC_SEQ)
                 FROM    RTRE0090
                 WHERE   CUST_NO = v_Cust_No)+ 1, 1)
    INTO    v_Cc_Seq
    FROM    DUAL;

    RETURN v_Cc_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0090CcSeq;


  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� - RE-030101_���ݿ����� �������
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-04-06  wjim             [20170406_01] 0�� ������ �߱޺Ұ�
                                           - ����� �� ���������� 0�� �ߵ����� ó�� �� 0�� ���� �߻� (������ �����۾�)
                                           - 0�� ���ݿ����� ������ �Ұ��ϹǷ� 0�� ������ ��� ����(����)��󿡼� ����
   1.3        2019-05-31  wjim             [20190429_01] ä�ǸŰ���� ���� ����                                           
  *****************************************************************************/
  PROCEDURE p_InsertRtre0090Aggregate (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_Recv_SDay      IN RTRE0030.RECV_DAY%TYPE,       /*��������START         */
    v_Recv_EDay      IN RTRE0030.RECV_DAY%TYPE,       /*��������END           */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    /*
    �������� �����ϰ� �������� ������ ���̿� ���ݿ����� �߱��� ������ ����������� ����ó���� ������ ���Ͽ� �����Ѵ�.
     1) �����Ⱓ : RECV_DAY BETWEEN RECV_DAY_F AND RECV_DAY_T
     2) ���ݿ����� �߱��� ������ ������� : �����ڵ� R032
        RECP_PAY IN ( SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R032' AND USE_YN = 'Y' )
     3) ���ݿ����� ������ ����
        CASH_YN = 'N'
     4) ������Ұ� ����
        CNC_STAT = 'N'
     5) ���������� '����ó��'/'�������'�� ��츸 �ش�
        RECP_FG = '01'
     6) ���ݰ�꼭�� ����-���� ������ ��� �ش�
        RTSD0100.CUST_TP = '01'
    */

    -- ���ݿ����� ���� ��� ��ȸ
    CURSOR  Cur_Rtre0090 IS
    SELECT  A.RECV_SEQ         AS RECV_SEQ,
            MAX ( A.RECV_DAY ) AS RECV_DAY,
            MAX ( TO_CHAR(A.REG_DT, 'HH24MISS' ) ) AS RECV_TIME,
            MAX ( A.CUST_NO )  AS CUST_NO,
            MAX ( B.CUST_NM )  AS CUST_NM,
            DECODE( A.RECP_FG, '01', '7100', '7102' )   AS CASHD_TP,
            '0'                AS CASHD_FG,
            MAX( DECODE( NVL(C.CHI_NO, 'N') , 'N', B.MOB_NO, C.CHI_NO)) AS CHI_NO,
            --MAX( DECODE( NVL(C.CHI_NO, 'N') , 'N', B.TEL_NO, C.CHI_NO)) AS CHI_NO,
            SUM( A.RECP_AMT )  AS RECP_AMT,
            ROUND( SUM( A.RECP_AMT) / 1.1 ) AS RECP_NAMT,
            SUM( A.RECP_AMT ) - ROUND( SUM( A.RECP_AMT ) / 1.1 ) AS RECP_VAMT
    FROM    RTRE0030 A,
            RTSD0100 B,
            RTRE0090 C
    WHERE   A.RECV_DAY BETWEEN v_Recv_SDay AND v_Recv_EDay
--    AND     A.RECP_TP <> '41'                   -- ���ݿ����� ������ ���� ��â�ΰ����û 2015-11-04 -> 12-03 ����
    AND     A.RECP_PAY IN ( SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R032' AND USE_YN = 'Y' )
    AND     A.CASH_YN  = 'N'
    AND     A.CNC_STAT = 'N'
    AND     A.RECP_FG  IN ( '01', '11' )
    AND     A.RECP_AMT <> 0 --[20170406_01] 
    AND     B.CUST_NO  = A.CUST_NO
    AND     B.CUST_TP  = '01'
    AND     C.CUST_NO(+) = A.CUST_NO
    AND     C.STR_DAY(+) <= v_Cash_Day
    AND     C.END_DAY(+) >= v_Cash_Day
    AND     C.DEL_YN(+)  = 'N'
    AND     NOT EXISTS (SELECT 1 FROM RTTEMPIWJ_190429_01 WHERE COL_01 = A.ORD_NO) --[20190429_01]
    GROUP   BY A.RECV_SEQ, DECODE( A.RECP_FG, '01', '7100', '7102' );

    v_Cash_Seq  RTRE0091.CASH_SEQ%TYPE DEFAULT NULL; /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Stat RTRE0091.CASH_STAT%TYPE DEFAULT NULL;/*���ݿ����� �������   */

    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*�ۼ������ϱ���      */
    v_Rqst_Day  RTRE0099.RQST_DAY%TYPE DEFAULT NULL;/*��û����            */
    v_File_Nm   RTRE0099.FILE_NM%TYPE DEFAULT NULL; /*���ϸ�              */
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;/*���ϼ���            */

    v_Acrq_Cnt   RTRE0099.ACRQ_CNT%TYPE DEFAULT NULL;  /*���½�û�Ǽ�          */
    v_Accnrq_Cnt RTRE0099.ACCNRQ_CNT%TYPE DEFAULT NULL;/*���������Ǽ�          */

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:���ݿ�������������,��������START,��������END,  ����� ID
    IF 0 != ISDATE(v_Cash_Day) THEN
        v_Return_Message := '���ݿ�������������('||v_Cash_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Recv_SDay) THEN
        v_Return_Message := '��������START('||v_Recv_SDay||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Recv_EDay) THEN
        v_Return_Message := '��������END('||v_Recv_EDay||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ʱⰪ ����
    v_File_Tp  := 'CH01_INX';
    v_File_Nm  := 'KCP_BATCH_FILE_CH01_INX_V3770_'||v_Cash_Day;
    v_Rqst_Day := v_Cash_Day;


    -- 1. �������� �������� ������� ������ �����ϴ��� Ȯ���ϰ� �����ϸ� ������ ����ó���ϰ� �����޽��� ����
    IF 0 != Pkg_Rtre0099.f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') THEN
        v_Return_Message := '�ش� �������ڷ� ������� ����('||v_File_Nm||')�� �̹� �����ϹǷ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    -- �ۼ������ϱ���/��û����/���ϸ� ����  ���ϼ��� ȹ��
    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);

    -- 2. �������� �������� ������� ���� �������� �ʴ� ��� �ۼ��� �۾�( RTRE0099)�� ������ ����
    IF 0 != Pkg_Rtre0099.f_InsertRtre0099 (
                v_File_Tp   ,        /*(File_Tp  )�ۼ������ϱ���    */
                v_Rqst_Day  ,        /*(Rqst_Day )��û����          */
                v_File_Nm   ,        /*(File_Nm  )���ϸ�            */
                v_File_Seq  ,        /*(File_Seq )���ϼ���          */
                NULL,                /*(File_Data)���ϵ�����        */
                'N',                 /*(Extrc_Yn )������迩��      */
                'N',                 /*(Confi_Yn )���Ȯ�ο���      */
                'N',                 /*(Fcret_Yn )���ϻ�������      */
                'N',                 /*(Ftran_Yn )�������ۿ���      */
                NULL,                /*(Stdex_Dd )��������ü����    */
                v_Recv_SDay,        /*(Str_Day  )������ ������   */
                v_Recv_EDay,        /*(End_Day  )������ ������   */
                'N',                 /*(Header_Yn)HEADER ���翩��   */
                'N',                 /*(Trailer_Y)TRAILER ���翩��  */
                0,                   /*(Tdata_Cnt)������ �ѰǼ�     */
                0,                   /*(Tdata_Amt)������ �ѱݾ�     */
                0,                   /*(Acrq_Cnt )���½�û�Ǽ�      */
                0,                   /*(Accnrq_Cn)���������Ǽ�      */
                0,                   /*(Rmcnrq_Cn)�������������Ǽ�  */
                0,                   /*(Reqst_Cnt)��û�Ǽ�          */
                0,                   /*(Reqst_Amt)��û�ݾ�          */
                0,                   /*(Cncrq_Cnt)��ҿ�û�Ǽ�      */
                0,                   /*(Cncrq_Amt)��ҿ�û�ݾ�      */
                0,                   /*(Srecp_Cnt)������� ó���Ǽ� */
                0,                   /*(Srecp_Amt)������� ó���ݾ� */
                0,                   /*(Hsrcp_Cnt)�κа��� ó���Ǽ� */
                0,                   /*(Hsrcp_Amt)�κа��� ó���ݾ� */
                0,                   /*(Erecp_Cnt)�������� ó���Ǽ� */
                0,                   /*(Erecp_Amt)�������� ó���ݾ� */
                0,                   /*(Scnrq_Cnt)������� ó���Ǽ� */
                0,                   /*(Scnrq_Amt)������� ó���ݾ� */
                0,                   /*(Ecnrq_Cnt)��ҿ��� ó���Ǽ� */
                0,                   /*(Ecnrq_Amt)��ҿ��� ó���ݾ� */
                'N',                 /*(Del_Yn   )��������          */
                v_Reg_Id,            /*(Reg_Id   )����� ID         */
                v_ErrorText
                ) THEN

        v_Return_Message := ' �ۼ��� �۾�(RTRE0099) Insert ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- ������ �ʱ�ȭ
    v_Acrq_Cnt   := 0;   -- ���½�û�Ǽ�
    v_Accnrq_Cnt := 0;   -- ���������Ǽ�
    v_Cash_Stat  := '1'; -- ���ݿ����� �������('R033') : �������(1), ����(2), �������(3), ����Ϸ�(5)

    -- ���ݿ����� ���� ��� ��û�� ó��
    FOR CUR IN Cur_Rtre0090 LOOP
        EXIT WHEN Cur_Rtre0090%NOTFOUND;
        v_Acrq_Cnt := v_Acrq_Cnt+1;

        -- ���� �������� ���� ��� �����͸� �̿��Ͽ� ���� ����(RTRE0091)�� INSERT �Ѵ�.
        Pkg_Rtre0091.p_IUDRtre0091 (
                    'I'           ,    /*(v_Comm_Dvsn )ó������(I,U,D)       */
                    CUR.RECV_SEQ  ,    /*(v_Recv_Seq  )�����ŷ���ȣ          */
                    v_Cash_Seq    ,    /*(v_Cash_Seq  )���ݿ����� ���� �Ϸù�*/
                    v_Cash_Day    ,    /*(v_Cash_Day  )���ݿ�������������    */
                    v_File_Seq    ,    /*(v_File_Seq  )���ϼ���              */
                    CUR.RECV_DAY  ,    /*(v_Recv_Day  )��������              */
                    CUR.RECV_TIME ,    /*(v_Recv_Time )�����ð�              */
                    CUR.CUST_NO   ,    /*(v_Cust_No   )����ȣ              */
                    CUR.CUST_NM   ,    /*(v_Cust_Nm   )����                */
                    CUR.CASHD_TP  ,    /*(v_Cashd_Tp  )�ŷ�����              */
                    CUR.CASHD_FG  ,    /*(v_Cashd_Fg  )�����󱸺�          */
                    CUR.CHI_NO    ,    /*(v_Chi_No    )���ݿ����� �ĺ���ȣ   */
                    CUR.RECP_AMT  ,    /*(v_Cash_Amt  )���ݿ����� ����ݾ�   */
                    CUR.RECP_NAMT ,    /*(v_Cash_Namt )���ݿ����� ���� ���ް�*/
                    CUR.RECP_VAMT ,    /*(v_Cash_Vamt )���ݿ����� ���� �ΰ���*/
                    v_Cash_Stat   ,    /*(v_Cash_Stat )���ݿ����� �������   */
                    NULL          ,    /*(v_Cashapp_No)���ݿ����� ���ι�ȣ   */
                    NULL          ,    /*(v_Csercd    )�߱޿����ڵ�          */
                    NULL          ,    /*(v_Csermsg   )�߱޿����޼���        */
                    NULL          ,    /*(v_Ocapp_No  )�����ι�ȣ            */
                    NULL          ,    /*(v_Ocash_Day )����������            */
                    'N'           ,    /*(v_Cnc_Yn    )��ҿ���              */
                    v_Reg_Id      ,    /*(v_Reg_Id    )����� ID             */
                    v_Success_Code,
                    v_Return_Message,
                    v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '���� ����(RTRE0091) ����� ���� �߻�!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

        -- �������� ���������� ���ݿ����� ���࿩��(CASH_YN) �� 'P' (����ó����) ������ ������Ʈ �Ѵ�.
        IF 0 != Pkg_Rtre0030.f_UpdateRtre0030Aggregate (CUR.RECV_SEQ, 'P', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := ' �������� ���������� ���ݿ����� ���࿩�ο� P(����ó����) ������ ������Ʈ ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0090%ISOPEN THEN
        CLOSE Cur_Rtre0090;
    END IF;

    -- �ۼ��� �۾� Update - ���½��� ��� ��ġ ��� ������Ʈ
    IF 0 !=Pkg_Rtre0099.f_UpdateRtre0099BatchResult (v_File_Tp, v_Cash_Day, v_File_Nm, v_File_Seq,
                                                     'Y',  v_Acrq_Cnt, v_Accnrq_Cnt, 0, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾�(RTRE0099) Update - ���½��� ��� ��ġ ��� ������Ʈ ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_InsertRtre0090Aggregate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_InsertRtre0090Aggregate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0090Aggregate;


  /*****************************************************************************
  -- ���ݿ����� �߱ޱ��� - RE-030102_���ݿ����� ���ϻ��� : ī����ü ������ �������� �۽� ��� ���� ���·� ������ �����ϰ� ���ϻ����ڷḦ RETURN �ϴ� �Լ�
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-11-03  wjim             [20171103_02] KCP �뷮��û ���ε� ���� ����
                                           - '���ݿ����� �ŷ���ȣ' �߰� (10/26)
  *****************************************************************************/
  PROCEDURE p_InsertRtre0090FileCreate (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*ī����ü����          */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*����� ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF����              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- �ۼ���ó�� ����
    CURSOR  Cur_Rtre0099 IS
    SELECT  A.FILE_TP,   /*�ۼ��� ���ϱ���  */
            A.FILE_SEQ   /*���� ����        */
    FROM    RTRE0099 A   /*�ۼ��� �۾�T     */
    WHERE   A.FILE_TP   = 'CH01_INX' /*�ۼ������ϱ��� */
    AND     A.RQST_DAY  = v_Rcrd_Day
    AND     A.FILE_NM   = v_File_Nm
    AND     A.DEL_YN    = 'N'
    AND     A.EXTRC_YN  = 'Y'
    AND     A.CONFI_YN  = 'Y'
    AND     A.FTRAN_YN  = 'N';

    -- ���ݿ����� ���
    CURSOR  Cur_Rtre0091 (v_File_Seq NUMBER) IS
    SELECT  A.RECV_SEQ,                  /*�����ŷ���ȣ        */
            A.CASH_SEQ,                  /*���ݿ����� ���� �Ϸ�*/
            A.CASH_DAY,                  /*���ݿ�������������  */
            A.FILE_SEQ,                  /*���ϼ���            */
            A.RECV_DAY,                  /*��������            */
            A.RECV_TIME,                 /*�����ð�            */
            A.CUST_NO,                   /*����ȣ            */
            A.CUST_NM,                   /*����              */
            A.CASHD_TP,                  /*�ŷ�����            */
            A.CASHD_FG,                  /*�����󱸺�        */
            A.CHI_NO,                    /*���ݿ����� �ĺ���ȣ */
            A.CASH_AMT,                  /*���ݿ����� ����ݾ� */
            A.CASH_NAMT,                 /*���ݿ����� ���� ����*/
            A.CASH_VAMT,                 /*���ݿ����� ���� �ΰ�*/
            A.CASH_STAT,                 /*���ݿ����� ������� */
            A.CASHAPP_NO,                /*���ݿ����� ���ι�ȣ */
            A.CSERCD,                    /*�߱޿����ڵ�        */
            A.CSERMSG,                   /*�߱޿����޼���      */
            A.OCAPP_NO,                  /*�����ι�ȣ          */
            A.OCASH_DAY,                 /*����������          */
            A.CNC_YN                     /*��ҿ���            */
    FROM    RTRE0091 A
    WHERE   A.CASH_DAY  = v_Rcrd_Day
    AND     A.FILE_SEQ  = v_File_Seq;


    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*�ۼ������ϱ���      */
    v_Rqst_Day  RTRE0099.RQST_DAY%TYPE DEFAULT NULL;/*��û����            */
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;/*���ϼ���            */
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL; /*ROW ����            */

    v_Row_Data   RTRE0098.ROW_DATA%TYPE DEFAULT NULL;/*���ϳ���           */
    v_Re0099_Cnt NUMBER DEFAULT 0;                  /*DATA RECORD COUNT   */
    v_Re0091_Cnt NUMBER DEFAULT 0;                  /*DATA RECORD COUNT   */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT NULL; /*������ �ѱݾ�    */
    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:ī����ü����,���ϸ�, ����� ID
    IF 0 != ISDATE(v_Rcrd_Day) THEN
        v_Return_Message := 'ī����ü����('||v_Rcrd_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_File_Nm) IS NULL) OR (38 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    -- �ʱⰪ ����
    v_File_Tp  := 'CH01_INX';
    v_Rqst_Day := v_Rcrd_Day;


    -- �������� �������� ������� ������ �����ϴ��� Ȯ���ϰ� 1���� �ƴϸ� ����ó���ϰ� �����޽��� ����
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck(v_File_Tp, v_Rqst_Day, v_File_Nm) THEN
        v_Return_Message := '(1)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||') �̹� �����Ǿ��ų� ����/���Ȯ�ΰ� �ȵǾ� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;


    --  �ۼ���ó�� ����(1��) ���� ���� �۽� ���� ���� CLEAR
    FOR CUR IN Cur_Rtre0099 LOOP
        EXIT WHEN Cur_Rtre0099%NOTFOUND;
        v_Re0099_Cnt := v_Re0099_Cnt+1;
        v_File_Tp  := CUR.FILE_TP;
        v_File_Seq := CUR.FILE_SEQ;

        -- 2. �۽� ���� ���� üũ ( RTRE0098 )
        IF 0 < Pkg_Rtre0098.f_sRtre0098CountCheck(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq) THEN

            -- 2-1) ���� ����� DEL_YN ������Ʈ
            IF 0 != Pkg_Rtre0098.f_Delete0098FileClear(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� �۽� ���� ����('||v_Rqst_Day||'-'||v_File_Nm||'-'||CUR.FILE_TP||'-'||CUR.FILE_SEQ||') ���� ����. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;

    END LOOP;

    --  �ۼ���ó�� ����Ȯ�� ( RTRE0099 )
    IF 1 != v_Re0099_Cnt THEN
        v_Return_Message := '(1)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||') �̹� �����Ǿ��ų� ����/���Ȯ�ΰ� �ȵǾ� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;

    IF Cur_Rtre0099%ISOPEN THEN
        CLOSE Cur_Rtre0099;
    END IF;

    -- �۽����� Data Record ���� : ���� ���� ���� ( RTRE0098 )
    FOR CUR IN Cur_Rtre0091(v_File_Seq) LOOP
        EXIT WHEN Cur_Rtre0091%NOTFOUND;
        v_Re0091_Cnt := v_Re0091_Cnt+1;

        -- ������ �ѱݾ� : SUM(���ݿ����� ����ݾ�)
        v_Tdata_Amt := v_Tdata_Amt + NVL(CUR.CASH_AMT,0);


        -- �۽����� Data Record ����
        v_Row_Data := SUBSTR(CUR.CASH_DAY, 3, 6)||CUR.RECV_TIME || '|' ||         --�ŷ�����(����Ͻú���)
                      CUR.CASHD_TP ||'|' ||                                       --�ŷ�Ÿ��(����:7100, ���:7102)
                      '00000000000000' ||'|' ||                                   --���ݿ����� �ŷ���ȣ(������ ��� �ŷ���ȣ �����Ƿ� 14�ڸ� 0���� �Է�) [20171103_02]
                      CUR.CASHD_FG ||'|' ||                                       --��������(�Һ���:0, �����:1)
                      CUR.CHI_NO ||'|' ||                                         --�ĺ���ȣ(�Һ���:�޴�����ȣ, �ֹι�ȣ, ī���ȣ / �����:����ڹ�ȣ, ī���ȣ)
                      CUR.CASH_AMT ||'|' ||                                       --�ŷ��ݾ�(���ް��� + ����� + �ΰ���ġ��)
                      CUR.CASH_NAMT ||'|' ||                                      --���ް���(�ŷ��ݾ�/1.1)
--                      CUR.CASH_VAMT ||'|' ||
                      '0' ||'|' ||                                                --�����
                      CUR.CASH_VAMT ||'|' ||                                      --�ΰ���ġ��(�ŷ��ݾ�-���ް���)
                      SUBSTRB(CUR.CUST_NM, 1,20*1.5)  ||'|' ||                    --�ֹ��ڸ�
                      LPAD(CUR.RECV_SEQ,12,'0')||LPAD(CUR.CASH_SEQ, 3,'0') ||';'; --�ֹ���ǰ��

        -- �۽����� Data Record - ���� �ۼ��� ����(RTRE0098) Insert
        Pkg_Rtre0098.p_IUDRtre0098 ('I', v_Rqst_Day, v_File_Nm, v_Row_Seq,
                                    v_File_Tp, v_File_Seq, v_Row_Data, 'N',
                                    v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '�۽����� ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    END LOOP;

    IF Cur_Rtre0091%ISOPEN THEN
        CLOSE Cur_Rtre0091;
    END IF;

    -- ���ݿ����� ���(RTRE0091)�� ���� ó�� �Ұ�
    IF 1 > v_Re0091_Cnt THEN
        v_Return_Message := '���ݿ����� ���(RTRE0091)�� ���� ó�� �Ұ�!!. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;

    -- �ۼ��� ó������ ������Ʈ (RTRE0099 )
    IF 0 != Pkg_Rtre0099.f_UpdateRtre0099FileResult2 (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                                     'Y', 'N', 'N', v_Re0091_Cnt, v_Tdata_Amt,
                                                     v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' �ۼ��� ó������(RTRE0099) ������Ʈ �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- ���� �ۼ��� ���� Select
    Pkg_Rtre0098.p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);

    v_Crlf_Yn := 'Y';

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        Pkg_Rtre0098.p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_InsertRtre0090FileCreate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        Pkg_Rtre0098.p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0090.p_InsertRtre0090FileCreate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0090FileCreate;

END Pkg_Rtre0090;
/
