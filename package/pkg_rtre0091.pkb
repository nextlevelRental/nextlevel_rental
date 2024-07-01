CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0091 AS
/*******************************************************************************
   NAME      Pkg_Rtre0091
   PURPOSE   ���ݿ������߱޳��� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-14  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���ݿ������߱޳��� Count
  *****************************************************************************/
  FUNCTION f_sRtre0091Count(
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE          /*���ݿ����� ���� �Ϸ�*/
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0091
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CASH_SEQ = v_Cash_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0091Count;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0091 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*��ҿ���              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
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
            A.CNC_YN,                    /*��ҿ���            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0091 A
    WHERE   A.RECV_SEQ   = DECODE(v_Recv_Seq  , NULL, A.RECV_SEQ   , v_Recv_Seq)
    AND     A.CASH_SEQ   = DECODE(v_Cash_Seq  , NULL, A.CASH_SEQ   , v_Cash_Seq)
    AND     A.CASH_DAY   = DECODE(v_Cash_Day  , NULL, A.CASH_DAY   , v_Cash_Day)
    AND     A.FILE_SEQ   = DECODE(v_File_Seq  , NULL, A.FILE_SEQ   , v_File_Seq)
    AND     A.RECV_DAY   = DECODE(v_Recv_Day  , NULL, A.RECV_DAY   , v_Recv_Day)
    AND     A.RECV_TIME  = DECODE(v_Recv_Time , NULL, A.RECV_TIME  , v_Recv_Time)
    AND     A.CUST_NO    = DECODE(v_Cust_No   , NULL, A.CUST_NO    , v_Cust_No)
    AND     A.CUST_NM    = DECODE(v_Cust_Nm   , NULL, A.CUST_NM    , v_Cust_Nm)
    AND     A.CASHD_TP   = DECODE(v_Cashd_Tp  , NULL, A.CASHD_TP   , v_Cashd_Tp)
    AND     A.CASHD_FG   = DECODE(v_Cashd_Fg  , NULL, A.CASHD_FG   , v_Cashd_Fg)
    AND     A.CHI_NO     = DECODE(v_Chi_No    , NULL, A.CHI_NO     , v_Chi_No)
    AND     A.CASH_AMT   = DECODE(v_Cash_Amt  , NULL, A.CASH_AMT   , v_Cash_Amt)
    AND     A.CASH_NAMT  = DECODE(v_Cash_Namt , NULL, A.CASH_NAMT  , v_Cash_Namt)
    AND     A.CASH_VAMT  = DECODE(v_Cash_Vamt , NULL, A.CASH_VAMT  , v_Cash_Vamt)
    AND     A.CASH_STAT  = DECODE(v_Cash_Stat , NULL, A.CASH_STAT  , v_Cash_Stat)
    AND     A.CASHAPP_NO = DECODE(v_Cashapp_No, NULL, A.CASHAPP_NO , v_Cashapp_No)
    AND     A.CSERCD     = DECODE(v_Csercd    , NULL, A.CSERCD     , v_Csercd)
    AND     A.CSERMSG    = DECODE(v_Csermsg   , NULL, A.CSERMSG    , v_Csermsg)
    AND     A.OCAPP_NO   = DECODE(v_Ocapp_No  , NULL, A.OCAPP_NO   , v_Ocapp_No)
    AND     A.OCASH_DAY  = DECODE(v_Ocash_Day , NULL, A.OCASH_DAY  , v_Ocash_Day)
    AND     A.CNC_YN     = DECODE(v_Cnc_Yn    , NULL, A.CNC_YN     , v_Cnc_Yn)
    AND     A.REG_ID     = DECODE(v_Reg_Id    , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0091;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*��ҿ���              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0091 (
            RECV_SEQ,
            CASH_SEQ,
            CASH_DAY,
            FILE_SEQ,
            RECV_DAY,
            RECV_TIME,
            CUST_NO,
            CUST_NM,
            CASHD_TP,
            CASHD_FG,
            CHI_NO,
            CASH_AMT,
            CASH_NAMT,
            CASH_VAMT,
            CASH_STAT,
            CASHAPP_NO,
            CSERCD,
            CSERMSG,
            OCAPP_NO,
            OCASH_DAY,
            CNC_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Cash_Seq,
            v_Cash_Day,
            v_File_Seq,
            v_Recv_Day,
            v_Recv_Time,
            v_Cust_No,
            v_Cust_Nm,
            v_Cashd_Tp,
            v_Cashd_Fg,
            v_Chi_No,
            v_Cash_Amt,
            v_Cash_Namt,
            v_Cash_Vamt,
            v_Cash_Stat,
            v_Cashapp_No,
            v_Csercd,
            v_Csermsg,
            v_Ocapp_No,
            v_Ocash_Day,
            v_Cnc_Yn,
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

  END f_InsertRtre0091;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*��ҿ���              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0091
    SET    CASH_DAY   = v_Cash_Day,
           FILE_SEQ   = v_File_Seq,
           RECV_DAY   = v_Recv_Day,
           RECV_TIME  = v_Recv_Time,
           CUST_NO    = v_Cust_No,
           CUST_NM    = v_Cust_Nm,
           CASHD_TP   = v_Cashd_Tp,
           CASHD_FG   = v_Cashd_Fg,
           CHI_NO     = v_Chi_No,
           CASH_AMT   = v_Cash_Amt,
           CASH_NAMT  = v_Cash_Namt,
           CASH_VAMT  = v_Cash_Vamt,
           CASH_STAT  = v_Cash_Stat,
           CASHAPP_NO = v_Cashapp_No,
           CSERCD     = v_Csercd,
           CSERMSG    = v_Csermsg,
           OCAPP_NO   = v_Ocapp_No,
           OCASH_DAY  = v_Ocash_Day,
           CNC_YN     = v_Cnc_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  RECV_SEQ   = v_Recv_Seq
    AND    CASH_SEQ   = v_Cash_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0091;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0091 (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0091
    SET    CNC_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  RECV_SEQ = v_Recv_Seq
    AND    CASH_SEQ = v_Cash_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0091;

  /*****************************************************************************
  -- ���ݿ������߱޳��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0091 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN OUT RTRE0091.CASH_SEQ%TYPE,   /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0091.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0091.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0091.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0091.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0091.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0091.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0091.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0091.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0091.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0091.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0091.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0091.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0091.CNC_YN%TYPE,         /*��ҿ���              */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: �����ŷ���ȣ, ���ݿ����� ���� �Ϸù�ȣ, ���ݿ�������������, ���ϼ���, ��������, �����ð�, ����ȣ, ����, �ŷ�����, �����󱸺�, ���ݿ����� �ĺ���ȣ, ���ݿ����� ����ݾ�, ���ݿ����� ���� ���ް���, ���ݿ����� ���� �ΰ���, ���ݿ����� �������  ����� ID
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '�����ŷ���ȣ('||v_Chi_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Cash_Day) THEN
        v_Return_Message := '���ݿ�������������('||v_Cash_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Seq) IS NULL THEN
        v_Return_Message := '���ϼ���('||v_File_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '��������('||v_Recv_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISTIME(v_Recv_Time) THEN
        v_Return_Message := '�����ð�('||v_Recv_Time||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '����ȣ('||v_Cust_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '����('||v_Cust_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cashd_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R030', v_Cashd_Tp)) THEN
        v_Return_Message := '�ŷ�����('||v_Cashd_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cashd_Fg) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R031', v_Cashd_Fg)) THEN
        v_Return_Message := '�����󱸺�('||v_Cashd_Fg||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Chi_No) IS NULL THEN
        v_Return_Message := '���ݿ����� �ĺ���ȣ('||v_Chi_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Amt) IS NULL THEN
        v_Return_Message := '���ݿ����� ����ݾ�('||v_Cash_Amt||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Namt) IS NULL THEN
        v_Return_Message := '���ݿ����� ���� ���ް���('||v_Cash_Namt||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Vamt) IS NULL THEN
        v_Return_Message := '���ݿ����� ���� �ΰ�����('||v_Cash_Vamt||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cash_Stat) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R033', v_Cash_Stat)) THEN
        v_Return_Message := '���ݿ����� �������('||v_Cash_Stat||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Csercd) IS NOT NULL) AND (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R028', v_Csercd)) THEN
        v_Return_Message := '�߱޿����ڵ�('||v_Csercd||') : �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn = 'I' THEN

        v_Cash_Seq := f_sRtre0091CashSeq(v_Recv_Seq);

        IF 0 != f_InsertRtre0091(v_Recv_Seq, v_Cash_Seq, v_Cash_Day, v_File_Seq,
                                 v_Recv_Day, v_Recv_Time, v_Cust_No, v_Cust_Nm,
                                 v_Cashd_Tp, v_Cashd_Fg, v_Chi_No, v_Cash_Amt,
                                 v_Cash_Namt, v_Cash_Vamt, v_Cash_Stat, v_Cashapp_No,
                                 v_Csercd, v_Csermsg, v_Ocapp_No, v_Ocash_Day,
                                 v_Cnc_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���ݿ������߱޳��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE

        IF 0 = f_sRtre0091Count(v_Recv_Seq, v_Cash_Seq) THEN
            v_Return_Message := '�ش� �����ŷ���ȣ('||v_Reg_Id||'-'||v_Cash_Seq||')�� ��ϵ� �����Ͱ� �������� �������� ����/������ �Ұ��մϴ�!';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0091(v_Recv_Seq, v_Cash_Seq, v_Cash_Day, v_File_Seq,
                                     v_Recv_Day, v_Recv_Time, v_Cust_No, v_Cust_Nm,
                                     v_Cashd_Tp, v_Cashd_Fg, v_Chi_No, v_Cash_Amt,
                                     v_Cash_Namt, v_Cash_Vamt, v_Cash_Stat, v_Cashapp_No,
                                     v_Csercd, v_Csermsg, v_Ocapp_No, v_Ocash_Day,
                                     v_Cnc_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ݿ������߱޳��� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0091(v_Recv_Seq, v_Cash_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ݿ������߱޳��� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_IUDRtre0091(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_IUDRtre0091(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0091;


  /*****************************************************************************
  -- ���ݿ������߱޳��� - ���ݿ����� ���� �Ϸ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0091CashSeq(
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE          /*�����ŷ���ȣ        */
    ) RETURN NUMBER IS
    v_Cash_Seq RTRE0091.CASH_SEQ%TYPE DEFAULT NULL;     /*���ݿ����� ���� �Ϸ�*/
  BEGIN

    SELECT  NVL((SELECT  MAX(CASH_SEQ)
                 FROM    RTRE0091
                 WHERE   RECV_SEQ = v_Recv_Seq)+ 1, 1)
    INTO    v_Cash_Seq
    FROM    DUAL;

    RETURN v_Cash_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0091CashSeq;


  /*****************************************************************************
  -- ���ݿ������߱޳��� Update - ���ݿ����� �������
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashStat (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0091
    SET    CASH_STAT = v_Cash_Stat,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  RECV_SEQ  = v_Recv_Seq
    AND    CASH_SEQ  = v_Cash_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0091CashStat;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Update - ���ݿ����� �������
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashStat2 (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0091.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0091
    SET    CASH_STAT = v_Cash_Stat,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  CASH_DAY  = v_Cash_Day
    AND    FILE_SEQ  = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0091CashStat2;


  /*****************************************************************************
  -- ���ݿ������߱޳��� Update - ���ݿ����� ������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  FUNCTION f_UpdateRtre0091CashUload (
    v_Recv_Seq       IN RTRE0091.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0091.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Stat      IN RTRE0091.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0091.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0091.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0091.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Reg_Id         IN RTRE0091.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0091
    SET     CASH_STAT  = v_Cash_Stat,
            CASHAPP_NO = v_Cashapp_No,
            CSERCD     = v_Csercd,
            CSERMSG    = v_Csermsg,
            CHG_ID     = v_Reg_Id,
            CHG_DT     = SYSDATE
    WHERE   RECV_SEQ   = v_Recv_Seq
    AND     CASH_SEQ   = v_Cash_Seq;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0091CashUload;

  /*****************************************************************************
  -- ���ݿ������߱޳��� Select - �������� �������� ������ ���� ��Ȳ�� ��ȸ�Ѵ�.
  *****************************************************************************/
  PROCEDURE p_sRtre0091TargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*���ϼ���              */
    v_Extrc_Yn  RTRE0099.EXTRC_YN%TYPE DEFAULT NULL;  /*������迩��          */
    v_Confi_Yn  RTRE0099.CONFI_YN%TYPE DEFAULT NULL;  /*���Ȯ�ο���          */
    v_Fcret_Yn  RTRE0099.FCRET_YN%TYPE DEFAULT NULL;  /*���ϻ�������          */
    v_Ftran_Yn  RTRE0099.FTRAN_YN%TYPE DEFAULT NULL;  /*�������ۿ���          */
  BEGIN

    -- ������ ���� ��Ȳ
    OPEN Ref_Cursor FOR
    SELECT  A.CASH_DAY,                  /*���ݿ�������������  */
            A.CASH_STAT,                 /*���ݿ����� ������� */
            Pkg_Rtcm0051.f_sRtcm0051Codename('R033', A.CASH_STAT) CASH_STAT_NM,   /*���ݿ����� ������� */
            A.CASH_CNT,                  /*���ݿ����� �Ǽ� */
            A.CASH_AMT,                  /*���ݿ����� ����ݾ� */
            A.CASH_NAMT,                 /*���ݿ����� ���� ����*/
            A.CASH_VAMT                  /*���ݿ����� ���� �ΰ�*/
    FROM    (
            SELECT  CASH_DAY,
                    CASH_STAT,
                    COUNT(*) AS CASH_CNT,
                    SUM(CASH_AMT ) AS CASH_AMT,
                    SUM(CASH_NAMT ) AS CASH_NAMT,
                    SUM(CASH_VAMT ) AS CASH_VAMT
            FROM    RTRE0091
            WHERE   CASH_DAY = v_Cash_Day
            AND     FILE_SEQ = ( SELECT FILE_SEQ FROM RTRE0099
                                 WHERE FILE_TP  = 'CH01_INX'
                                 AND   RQST_DAY = v_Cash_Day
                                 AND   DEL_YN = 'N'
                                 AND   ROWNUM = 1 )
            GROUP   BY CASH_DAY, CASH_STAT
            ) A;

    -- �ۼ��� �۾� ��� SET
    SELECT  FILE_SEQ,
            EXTRC_YN,
            CONFI_YN,
            FCRET_YN,
            FTRAN_YN
    INTO    v_File_Seq, v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn
    FROM    RTRE0099
    WHERE   FILE_TP  = 'CH01_INX'
    AND     RQST_DAY = v_Cash_Day
    AND     FILE_NM  = 'KCP_BATCH_FILE_CH01_INX_V3770_' ||v_Cash_Day
    AND     DEL_YN   = 'N';


    IF  v_Extrc_Yn  = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
      v_Success_code := 0;
      v_Return_Message := '������谡 �Ϸ� ���� �ʾҽ��ϴ�.';
    ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
      v_Success_code := 0;
      v_Return_Message := '������� �Ϸ�, ���Ȯ�� �Ͻñ� �ٶ��ϴ�.';
    ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN
      v_Success_code := 0;
      v_Return_Message := '���Ȯ�� �Ϸ�, ���ϻ��� �Ͻñ� �ٶ��ϴ�.';
    ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN
      v_Success_code := 0;
      v_Return_Message := '���ϻ��� �Ϸ�, ���ۿϷ� �Ͻñ� �ٶ��ϴ�.';
    ELSIF v_Extrc_Yn  = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'Y' THEN
      v_Success_code := 0;
      v_Return_Message := '���ݿ����� ���� ó�� �Ϸ� �Ǿ����ϴ�.';
    ELSE
      v_Success_code := -1;
      v_Return_Message := '�ý��� ����ڿ��� Ȯ���ϼ���.';
    END IF;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_Success_Code := -1;
        v_Return_Message := '���ݿ����� ������(RTRE0099)�� �������� ó�� �Ұ��մϴ�.';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_sRtre0091TargetList(2)', v_Errortext, v_Return_Message);
      WHEN OTHERS THEN
        v_Success_Code := -1;
        v_Return_Message := '�ý��� ����ڿ��� Ȯ���ϼ���.';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_sRtre0091TargetList(2)', v_Errortext, v_Return_Message);

  END p_sRtre0091TargetList;

  /*****************************************************************************
  -- ���ݿ��������� > ���ݿ����� ��ȸ select
  *****************************************************************************/
  PROCEDURE p_sRtre0091CashReceiptList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Day_F       IN RTRE0091.RECV_DAY%TYPE,        /*�������� ��ȸ��������           */
    v_Recv_Day_T       IN RTRE0091.RECV_DAY%TYPE,        /*�������� ��ȸ��������           */
    v_Cash_Day_F       IN RTRE0091.CASH_DAY%TYPE,        /*���ݿ����� �������� ��ȸ��������*/
    v_Cash_Day_T       IN RTRE0091.CASH_DAY%TYPE,        /*���ݿ����� �������� ��ȸ��������*/
    v_Cust_No          IN RTRE0091.CUST_NO%TYPE,         /*����ȣ*/
    v_Cash_Stat        IN RTRE0091.CASH_STAT%TYPE,       /*���ݿ����� �������*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    WITH TMRE0091 AS (
            SELECT  A.RECV_SEQ, A.RECV_DAY, A.CASH_AMT, A.CASH_NAMT,
                    A.CASH_VAMT, A.CUST_NO, A.CHI_NO, A.CASH_DAY,
                    A.CASHAPP_NO, A.CASH_STAT, A.CSERMSG,
                    A.CASH_SEQ
            FROM    RTRE0091 A
            WHERE   A.CASH_DAY BETWEEN v_Cash_Day_F AND v_Cash_Day_T
            AND     A.RECV_DAY BETWEEN v_Recv_Day_F AND v_Recv_Day_T
            AND     A.CUST_NO = DECODE( v_Cust_No, NULL, A.CUST_NO, v_Cust_No)
            AND     (v_Cash_Stat IS NULL OR A.CASH_STAT =  v_Cash_Stat)
            )
    SELECT  A.RECV_DAY,                                                         /*��������                      */
            A.CASH_AMT,                                                         /*���ݿ����� ���� �ݾ�          */
            A.CASH_NAMT,                                                        /*���ݿ����� ���� ���ް���      */
            A.CASH_VAMT,                                                        /*���ݿ����� ���� �ΰ���        */
            Pkg_Rtre0030.f_sRtre0030Recp_Pay(A.RECV_SEQ) AS RECV_PAY,           /*�������                      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R019', Pkg_Rtre0030.f_sRtre0030Recp_Pay(A.RECV_SEQ)) AS RECV_PAY_NM, /*��������� */
            A.CUST_NO,                                                          /*����ȣ                      */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) AS CUST_NM,             /*����                        */
            A.CHI_NO,                                                           /*���ݿ����� �ĺ���ȣ           */
            A.CASH_DAY,                                                         /*���ݿ����� ��������           */
            A.CASHAPP_NO,                                                       /*���ݿ����� ���ι�ȣ           */
            A.CASH_STAT,                                                        /*���ݿ����� �������           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R033', A.CASH_STAT) AS CASH_STAT_NM,/*���ݿ����� ������¸�       */
            A.CSERMSG,                                                          /*�߱޿����޼���                */
            A.RECV_SEQ,                                                         /*�����ŷ���ȣ                  */
            B.REGI_AMT,                                                         /*��Ϻ�                        */
            B.RENT_AMT,                                                         /*��Ż��                        */
            B.RTAR_AMT,                                                         /*��Ż��ü��                    */
            B.CANC_AMT,                                                         /*��Ҽ�����                    */
            B.PNTY_AMT,                                                         /*�����                        */
            B.PPAY_AMT,                                                         /*������                        */
            B.ETC_AMT,                                                          /*��Ÿ                          */
            A.CASH_SEQ                                                          /*���ݿ������������            */
    FROM    TMRE0091 A,
            (
            SELECT  B.RECV_SEQ,
                    SUM(DECODE(B.RECP_TP, '01', B.RECP_AMT,0)) REGI_AMT,       /*��Ϻ�     */
                    SUM(DECODE(B.RECP_TP, '11', B.RECP_AMT,0)) RENT_AMT,       /*��Ż��     */
                    SUM(DECODE(B.RECP_TP, '12', B.RECP_AMT,0)) RTAR_AMT,       /*��Ż��ü�� */
                    SUM(DECODE(B.RECP_TP, '41', B.RECP_AMT,0)) CANC_AMT,       /*��Ҽ����� */
                    SUM(DECODE(B.RECP_TP, '42', B.RECP_AMT,0)) PNTY_AMT,       /*�����     */
                    SUM(DECODE(B.RECP_TP, '90', B.RECP_AMT,0)) PPAY_AMT,       /*������     */
                    SUM(DECODE(B.RECP_TP, '01',0,'11',0,'12',0,'41',0,'42',0,'90',0,B.RECP_AMT,0)) ETC_AMT /*��Ÿ       */
            FROM    RTRE0030 B
            WHERE   B.RECV_SEQ IN (SELECT C.RECV_SEQ FROM  TMRE0091 C)           
            GROUP   BY B.RECV_SEQ
            ) B
    WHERE   A.RECV_SEQ = B.RECV_SEQ(+)
    ORDER BY A.RECV_SEQ, A.CASH_SEQ;

  END p_sRtre0091CashReceiptList;


  /*****************************************************************************
  -- ���ݿ������߱޳��� - ���ݿ����� ��� ������ �������� ���������� ���࿩�� ������Ʈ ó��
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0091CashReltApply (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- ���ݿ������߱޳���
    CURSOR  Cur_Rtre0091 (v_File_Seq NUMBER) IS
    SELECT  RECV_SEQ, CASH_SEQ, CASH_STAT
    FROM    RTRE0091
    WHERE   CASH_DAY = v_Cash_Day
    AND     FILE_SEQ = v_File_Seq;

    v_Total_Cnt  NUMBER DEFAULT 0;
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;   /*���ϼ���              */
    v_Cash_Yn    RTRE0030.CASH_YN%TYPE DEFAULT NULL;    /*���ݿ����� ���࿩��   */
    v_Cash_Stat  RTRE0091.CASH_STAT%TYPE DEFAULT NULL;  /*���ݿ����� �������   */
    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:���ݿ�������������, ����� ID
    IF 0 != ISDATE(v_Cash_Day) THEN
        v_Return_Message := '���ݿ�������������('||v_Cash_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    BEGIN
        -- �ۼ������� ���� ȹ��
        SELECT  FILE_SEQ
        INTO    v_File_Seq
        FROM    RTRE0099
        WHERE   FILE_TP   = 'CH01_OUT'
        AND     RQST_DAY  = v_Cash_Day
        AND     DEL_YN    = 'N'
        AND     EXTRC_YN  = 'Y'
        AND     CONFI_YN  = 'Y'
        AND     FCRET_YN  = 'N'
        AND     FTRAN_YN  = 'N';

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '������('||v_Cash_Day||')�� ���� Ȯ�οϷ� ó���� ������� �ʾҽ��ϴ�.!!. �ý��۰����� ���� �ٶ�!';
            RAISE e_Error;
    END;

    IF v_File_Seq IS NULL THEN
        v_Return_Message := '������('||v_Cash_Day||')�� ���� Ȯ�οϷ� ó���� ������� �ʾҽ��ϴ�.!!. �ý��۰����� ���� �ٶ�!';
        RAISE e_Error;
    END IF;

    BEGIN
        -- �ۼ������� ���� ȹ��
        SELECT  FILE_SEQ
        INTO    v_File_Seq
        FROM    RTRE0099
        WHERE   FILE_TP   = 'CH01_INX'
        AND     RQST_DAY  = v_Cash_Day
        AND     DEL_YN    = 'N'
        AND     EXTRC_YN  = 'Y'
        AND     CONFI_YN  = 'Y'
        AND     FCRET_YN  = 'Y'
        AND     FTRAN_YN  = 'Y';

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '�ۼ������� ���� ȹ�� ����!!!. �ý��۰����� ���� �ٶ�!(ERR CODE: E3S9C3)';
            RAISE e_Error;
    END;

    IF v_File_Seq IS NULL THEN
        v_Return_Message := 'ó���� ���� �ۼ��� ����(RTRE0099) ����� �����ϴ�!!. �ý��۰����� ���� �ٶ�!';
        RAISE e_Error;
    END IF;

    -- ���ݿ������߱޳���(RTRE0091) ���� ���� ����(RTRE0030) ���ݿ��������࿩�� �� ���ݿ������߱޳���(RTRE0091) ������� ������Ʈ
    FOR CUR IN Cur_Rtre0091(v_File_Seq) LOOP
        EXIT WHEN Cur_Rtre0091%NOTFOUND;
        v_Total_Cnt := v_Total_Cnt+1;

        IF CUR.CASH_STAT = '4' THEN

            -- ���ݿ����� ���࿩��
            v_Cash_Yn := 'Y';

            -- ���� ����(RTRE0030) ���ݿ��������࿩�� Update
            IF 0!= Pkg_Rtre0030.f_UpdateRtre0030Aggregate(CUR.RECV_SEQ, v_Cash_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� ����(RTRE0030) ���ݿ��������࿩�� Update ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- ���ݿ����� �������
            v_Cash_Stat := '5';

            -- ���ݿ������߱޳���(RTRE0091) ������� ������Ʈ
            IF 0!= Pkg_Rtre0091.f_UpdateRtre0091CashStat (CUR.RECV_SEQ, CUR.CASH_SEQ, v_Cash_Stat , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ݿ������߱޳���(RTRE0091) ������� ������Ʈ ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF CUR.CASH_STAT = '3' THEN

            -- ���ݿ����� ���࿩��
            v_Cash_Yn := 'N';

            -- ���� ����(RTRE0030) ���ݿ��������࿩�� Update
            IF 0!= Pkg_Rtre0030.f_UpdateRtre0030Aggregate(CUR.RECV_SEQ, v_Cash_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := ' ���� ����(RTRE0030) ���ݿ��������࿩�� Update ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '���ݿ����� ��� �ݿ�ó�� �� �� �ִ� ����('||CUR.CASH_STAT||')�� �ƴϹǷ� ó�� �Ұ�!!.';
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0091%ISOPEN THEN
        CLOSE Cur_Rtre0091;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_UpdateRtre0091CashReltApply(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0091.p_UpdateRtre0091CashReltApply(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0091CashReltApply;

END Pkg_Rtre0091;
/
