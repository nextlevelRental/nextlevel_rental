CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0092 AS
/*******************************************************************************
   NAME      Pkg_Rtre0092
   PURPOSE   ���ݿ����� �ǽð� ó�� �̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-11-30  jemcarry         1. Created this package body.
   1.1        2019-05-31  wjim             [20190429_01] ä�ǸŰ���� ���ݿ����� ����Ұ� ó��
*******************************************************************************/

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� Count
  *****************************************************************************/
  FUNCTION f_sRtre0092Count(
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,         /*���ݿ����� ���� �Ϸ�*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE         /*���ݿ����� �̷¹�ȣ */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0092
    WHERE   RECV_SEQ  = v_Recv_Seq
    AND     CASH_SEQ  = v_Cash_Seq
    AND     CASH_ISEQ = v_Cash_Iseq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0092Count;

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0092 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Cash_Day       IN RTRE0092.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0092.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0092.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0092.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0092.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0092.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0092.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0092.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0092.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0092.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0092.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0092.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0092.CNC_YN%TYPE,         /*��ҿ���              */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*���ݿ����� �ŷ���ȣ   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*���ݿ����� ���νð�   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*��ϻ����ڵ�          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*��ϻ��¼���          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.RECV_SEQ,                  /*�����ŷ���ȣ        */
            A.CASH_SEQ,                  /*���ݿ����� ���� �Ϸ�*/
            A.CASH_ISEQ,                 /*���ݿ����� �̷¹�ȣ */
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
            A.CASH_TNO,                  /*���ݿ����� �ŷ���ȣ */
            A.CASHAPP_TM,                /*���ݿ����� ���νð� */
            A.CREG_ST,                   /*��ϻ����ڵ�        */
            A.CREG_DESC,                 /*��ϻ��¼���        */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0092 A
    WHERE   A.RECV_SEQ         = DECODE(v_Recv_Seq       , NULL, A.RECV_SEQ        , v_Recv_Seq)
    AND     A.CASH_SEQ         = DECODE(v_Cash_Seq       , NULL, A.CASH_SEQ        , v_Cash_Seq)
    AND     A.CASH_ISEQ        = DECODE(v_Cash_Iseq      , NULL, A.CASH_ISEQ       , v_Cash_Iseq)
    AND     A.CASH_DAY         = DECODE(v_Cash_Day       , NULL, A.CASH_DAY        , v_Cash_Day)
    AND     A.FILE_SEQ         = DECODE(v_File_Seq       , NULL, A.FILE_SEQ        , v_File_Seq)
    AND     A.RECV_DAY         = DECODE(v_Recv_Day       , NULL, A.RECV_DAY        , v_Recv_Day)
    AND     A.RECV_TIME        = DECODE(v_Recv_Time      , NULL, A.RECV_TIME       , v_Recv_Time)
    AND     A.CUST_NO          = DECODE(v_Cust_No        , NULL, A.CUST_NO         , v_Cust_No)
    AND     A.CUST_NM          = DECODE(v_Cust_Nm        , NULL, A.CUST_NM         , v_Cust_Nm)
    AND     A.CASHD_TP         = DECODE(v_Cashd_Tp       , NULL, A.CASHD_TP        , v_Cashd_Tp)
    AND     A.CASHD_FG         = DECODE(v_Cashd_Fg       , NULL, A.CASHD_FG        , v_Cashd_Fg)
    AND     A.CHI_NO           = DECODE(v_Chi_No         , NULL, A.CHI_NO          , v_Chi_No)
    AND     A.CASH_AMT         = DECODE(v_Cash_Amt       , NULL, A.CASH_AMT        , v_Cash_Amt)
    AND     A.CASH_NAMT        = DECODE(v_Cash_Namt      , NULL, A.CASH_NAMT       , v_Cash_Namt)
    AND     A.CASH_VAMT        = DECODE(v_Cash_Vamt      , NULL, A.CASH_VAMT       , v_Cash_Vamt)
    AND     A.CASH_STAT        = DECODE(v_Cash_Stat      , NULL, A.CASH_STAT       , v_Cash_Stat)
    AND     A.CASHAPP_NO       = DECODE(v_Cashapp_No     , NULL, A.CASHAPP_NO      , v_Cashapp_No)
    AND     A.CSERCD           = DECODE(v_Csercd         , NULL, A.CSERCD          , v_Csercd)
    AND     A.CSERMSG          = DECODE(v_Csermsg        , NULL, A.CSERMSG         , v_Csermsg)
    AND     A.OCAPP_NO         = DECODE(v_Ocapp_No       , NULL, A.OCAPP_NO        , v_Ocapp_No)
    AND     A.OCASH_DAY        = DECODE(v_Ocash_Day      , NULL, A.OCASH_DAY       , v_Ocash_Day)
    AND     A.CNC_YN           = DECODE(v_Cnc_Yn         , NULL, A.CNC_YN          , v_Cnc_Yn)
    AND     A.CASH_TNO         = DECODE(v_Cash_Tno       , NULL, A.CASH_TNO        , v_Cash_Tno)
    AND     A.CASHAPP_TM       = DECODE(v_Cashapp_Tm     , NULL, A.CASHAPP_TM      , v_Cashapp_Tm)
    AND     A.CREG_ST          = DECODE(v_Creg_St        , NULL, A.CREG_ST         , v_Creg_St)
    AND     A.CREG_DESC        = DECODE(v_Creg_Desc      , NULL, A.CREG_DESC       , v_Creg_Desc)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre0092;

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0092 (
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Cash_Day       IN RTRE0092.CASH_DAY%TYPE,       /*���ݿ�������������    */
    v_File_Seq       IN RTRE0092.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Recv_Day       IN RTRE0092.RECV_DAY%TYPE,       /*��������              */
    v_Recv_Time      IN RTRE0092.RECV_TIME%TYPE,      /*�����ð�              */
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*����                */
    v_Cashd_Tp       IN RTRE0092.CASHD_TP%TYPE,       /*�ŷ�����              */
    v_Cashd_Fg       IN RTRE0092.CASHD_FG%TYPE,       /*�����󱸺�          */
    v_Chi_No         IN RTRE0092.CHI_NO%TYPE,         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt       IN RTRE0092.CASH_AMT%TYPE,       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt      IN RTRE0092.CASH_NAMT%TYPE,      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt      IN RTRE0092.CASH_VAMT%TYPE,      /*���ݿ����� ���� �ΰ���*/
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Ocapp_No       IN RTRE0092.OCAPP_NO%TYPE,       /*�����ι�ȣ            */
    v_Ocash_Day      IN RTRE0092.OCASH_DAY%TYPE,      /*����������            */
    v_Cnc_Yn         IN RTRE0092.CNC_YN%TYPE,         /*��ҿ���              */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*���ݿ����� �ŷ���ȣ   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*���ݿ����� ���νð�   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*��ϻ����ڵ�          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*��ϻ��¼���          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0092 (
            RECV_SEQ,
            CASH_SEQ,
            CASH_ISEQ,
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
            CASH_TNO,
            CASHAPP_TM,
            CREG_ST,
            CREG_DESC,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Recv_Seq,
            v_Cash_Seq,
            v_Cash_Iseq,
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
            v_Cash_Tno,
            v_Cashapp_Tm,
            v_Creg_St,
            v_Creg_Desc,
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

  END f_InsertRtre0092;

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� - �̷¹�ȣ ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0092CashIseq(
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,         /*�����ŷ���ȣ        */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE          /*���ݿ����� ���� �Ϸ�*/
    ) RETURN NUMBER IS

    v_Cash_Iseq RTRE0092.CASH_ISEQ%TYPE DEFAULT NULL;   /*���ݿ����� �̷¹�ȣ */
  BEGIN

    SELECT  NVL((SELECT  MAX(CASH_ISEQ)
                 FROM    RTRE0092
                 WHERE   RECV_SEQ  = v_Recv_Seq
                 AND     CASH_SEQ  = v_Cash_Seq)+ 1, 1) AS CASH_ISEQ
    INTO    v_Cash_Iseq
    FROM    DUAL;

    RETURN v_Cash_Iseq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0092CashIseq;

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� - ���ݿ����� ����/��Ҹ� ���� ������ ��ȸ �� �̷� ���� ó�� �Ѵ�.
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2019-05-31  wjim             [20190429_01] ä�ǸŰ���� ���ݿ����� ����Ұ� ó��
                                           - ä�ǸŰ� ������(2019-03-31)���� ������ ���� ���ݿ����� ���� �Ұ���
  *****************************************************************************/
  PROCEDURE p_IRtre0092CreateCashApp (
    v_Job_Gb         IN  VARCHAR2,                     /*�۾�����(C:����,D:���*/
    v_Recv_Seq       IN  RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Reg_Id         IN  RTRE0092.REG_ID%TYPE,         /*����� ID             */
    v_Cash_Seq       OUT RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Iseq      OUT RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Ordr_Idxx      OUT VARCHAR2,                     /*�ֹ����й�ȣ          */
    v_Good_Nm        OUT VARCHAR2,                     /*��ǰ��                */
    v_Buyr_Nm        OUT VARCHAR2,                     /*�ֹ��ڸ�              */
    v_Buyr_Tel       OUT VARCHAR2,                     /*�ֹ��� ��ȭ��ȣ       */
    v_Req_Tx         OUT VARCHAR2,                     /*��û ����             */
    v_Co_Type        OUT VARCHAR2,                     /*����� ����           */
    v_Ctax_Type      OUT VARCHAR2,                     /*����/�鼼 ����        */
    v_Ctax_No        OUT VARCHAR2,                     /*���� ����ڹ�ȣ       */
    v_Co_Nm          OUT VARCHAR2,                     /*��ȣ                  */
    v_Cowner_Nm      OUT VARCHAR2,                     /*��ǥ�ڸ�              */
    v_Co_Add         OUT VARCHAR2,                     /*����� �ּ�           */
    v_Co_Tel         OUT VARCHAR2,                     /*����� ��ǥ ����ó    */
    v_Trad_Tm        OUT VARCHAR2,                     /*�� �ŷ��ð�           */
    v_Tr_Code        OUT VARCHAR2,                     /*����뵵              */
    v_Id_Info        OUT VARCHAR2,                     /*�ź�Ȯ�� ID           */
    v_Amt_Tot        OUT VARCHAR2,                     /*�ŷ��ݾ� �� ��        */
    v_Amt_Sup        OUT VARCHAR2,                     /*���ް���              */
    v_Amt_Svc        OUT VARCHAR2,                     /*�����                */
    v_Amt_Tax        OUT VARCHAR2,                     /*�ΰ���ġ��            */
    v_Mod_Type       OUT VARCHAR2,                     /*���� Ÿ��             */
    v_Mod_Gb         OUT VARCHAR2,                     /*�����û �ŷ���ȣ ����*/
    v_Mod_Val        OUT VARCHAR2,                     /*�����û �ŷ���ȣ     */
    v_Mod_Mny        OUT VARCHAR2,                     /*�����û �ݾ�         */
    v_Rem_Mny        OUT VARCHAR2,                     /*����ó�� ���� �ݾ�    */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Cnc_Yn_Cnt    NUMBER DEFAULT 0;
    v_Chk_Cnt       NUMBER DEFAULT 0;

    v_Cash_Yn    RTRE0030.CASH_YN%TYPE;        /*���ݿ����� ���࿩��   */
    v_Cust_Tp    RTSD0100.CUST_TP%TYPE;        /*������              */
    v_Mob_No     RTSD0100.MOB_NO%TYPE;         /*�޴�����ȣ            */

    v_Cash_Day   RTRE0092.CASH_DAY%TYPE;       /*���ݿ�������������    */
    v_File_Seq   RTRE0092.FILE_SEQ%TYPE;       /*���ϼ���              */
    v_Recv_Day   RTRE0092.RECV_DAY%TYPE;       /*��������              */
    v_Recv_Time  RTRE0092.RECV_TIME%TYPE;      /*�����ð�              */
    v_Cust_No    RTRE0092.CUST_NO%TYPE;        /*����ȣ              */
    v_Cust_Nm    RTRE0092.CUST_NM%TYPE;        /*����                */
    v_Cash_Stat  RTRE0092.CASH_STAT%TYPE;      /*���ݿ����� �������   */
    v_Cashapp_No RTRE0092.CASHAPP_NO%TYPE;     /*���ݿ����� ���ι�ȣ   */
    v_Chi_No     RTRE0092.CHI_NO%TYPE;         /*���ݿ����� �ĺ���ȣ   */
    v_Cash_Amt   RTRE0092.CASH_AMT%TYPE;       /*���ݿ����� ����ݾ�   */
    v_Cash_Namt  RTRE0092.CASH_NAMT%TYPE;      /*���ݿ����� ���� ���ް�*/
    v_Cash_Vamt  RTRE0092.CASH_VAMT%TYPE;      /*���ݿ����� ���� �ΰ���*/
    v_Cashd_Tp   RTRE0092.CASHD_TP%TYPE;       /*�ŷ�����              */
    v_Cashd_Fg   RTRE0092.CASHD_FG%TYPE;       /*�����󱸺�          */
    v_Csercd     RTRE0092.CSERCD%TYPE;         /*�߱޿����ڵ�          */
    v_Csermsg    RTRE0092.CSERMSG%TYPE;        /*�߱޿����޼���        */
    v_Ocapp_No   RTRE0092.OCAPP_NO%TYPE;       /*�����ι�ȣ            */
    v_Ocash_Day  RTRE0092.OCASH_DAY%TYPE;      /*����������            */
    v_Cnc_Yn     RTRE0092.CNC_YN%TYPE;         /*��ҿ���              */
    v_Cash_Tno   RTRE0092.CASH_TNO%TYPE;       /*���ݿ����� �ŷ���ȣ   */
    v_Cashapp_Tm RTRE0092.CASHAPP_TM%TYPE;     /*���ݿ����� ���νð�   */
    v_Creg_St    RTRE0092.CREG_ST%TYPE;        /*��ϻ����ڵ�          */
    v_Creg_Desc  RTRE0092.CREG_DESC%TYPE;      /*��ϻ��¼���          */
    v_Reg_Dt     RTRE0092.REG_DT%TYPE;         /*�����                */

    v_Cash_DayB   RTRE0092.CASH_DAY%TYPE;      /*���ݿ�������������    */
    v_Cash_StatB  RTRE0092.CASH_STAT%TYPE;     /*���ݿ����� �������   */
    v_Cashapp_NoB RTRE0092.CASHAPP_NO%TYPE;    /*���ݿ����� ���ι�ȣ   */


  BEGIN

    -- �ʼ���:
    IF (TRIM(v_Job_Gb) IS NULL) OR (TRIM(v_Job_Gb) NOT IN ('C','D')) THEN
        v_Return_Message := '�۾�����(C:����,D:���)('||v_Job_Gb||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '�����ŷ���ȣ('||v_Recv_Seq||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    BEGIN
        SELECT  A.CASH_YN, A.CUST_NO, B.CUST_NM, B.CUST_TP, B.MOB_NO, A.RECV_DAY, A.REG_DT
        INTO    v_Cash_Yn, v_Cust_No, v_Cust_Nm, v_Cust_Tp, v_Mob_No, v_Recv_Day, v_Reg_Dt
        FROM    RTRE0030 A,
                RTSD0100 B
        WHERE   A.RECV_SEQ = v_Recv_Seq
        AND     A.CUST_NO  = B.CUST_NO
        AND     ROWNUM <= 1;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '���� ����('||v_Recv_Seq||')�� ���ݿ����� ���࿩�� ȹ�� �����Ͽ� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
    END;

    IF '01' <> v_Cust_Tp THEN
        v_Return_Message := '�ش� ����('||v_Cust_No||')�� ���ΰ��� �ƴϱ� ������ ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    -- [20190429_01] ä�ǸŰ���� ���ݿ����� ���� �Ұ�
    BEGIN
        SELECT  COUNT(*)
          INTO  v_Chk_Cnt
          FROM  RTRE0030            A1
             ,  RTTEMPIWJ_190429_01 B1
         WHERE  A1.RECV_SEQ = v_Recv_Seq
           AND  A1.ORD_NO   = B1.COL_01
        ;
        
        IF v_Chk_Cnt > 0 THEN
            v_Return_Message := '��������� ä�ǸŰ� ����� �����Ͽ� ó���� �Ұ��մϴ�!';
            RAISE e_Error;
        END IF;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := 'ä�ǸŰ����� Ȯ�� �����Ͽ� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
    END;

    SELECT  COUNT(*)
    INTO    v_Cnc_Yn_Cnt
    FROM    RTRE0091
    WHERE   RECV_SEQ = v_Recv_Seq
    AND     CNC_YN   = 'N';

    v_Cash_Seq := Pkg_Rtre0091.f_sRtre0091CashSeq(v_Recv_Seq);

    IF v_Job_Gb = 'C' THEN

        IF NVL(v_Cash_Yn,'') <> 'N' THEN
            v_Return_Message := '���� ������ ���ݿ����� ���࿩�ΰ� ('||v_Cash_Yn||')�̹Ƿ� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF v_Cnc_Yn_Cnt > 0 THEN
            v_Return_Message := '����Ǿ��ų� ������('||TO_CHAR(v_Cnc_Yn_Cnt)||'��)�̱� ������ ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;


        SELECT  MAX( DECODE( NVL(C.CHI_NO, 'N') , 'N', B.MOB_NO, C.CHI_NO)) AS CHI_NO,
                SUM( A.RECP_AMT )                                           AS RECP_AMT,
                ROUND( SUM( A.RECP_AMT) / 1.1 )                             AS RECP_NAMT,
                SUM( A.RECP_AMT ) - ROUND( SUM( A.RECP_AMT ) / 1.1 )        AS RECP_VAMT
        INTO    v_Chi_No, v_Cash_Amt, v_Cash_Namt, v_Cash_Vamt
        FROM    RTRE0030 A,
                RTSD0100 B,
                RTRE0090 C
        WHERE   A.RECV_SEQ = v_Recv_Seq
        AND     A.RECP_TP <> '41' -- ���ݿ����� ������ ����
        AND     A.RECP_PAY IN ( SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R032' AND USE_YN = 'Y' )
        AND     A.CASH_YN  = 'N'
        AND     A.CNC_STAT = 'N'
        AND     A.RECP_FG  = '01'
        AND     B.CUST_NO  = A.CUST_NO
        AND     B.CUST_TP  = '01'
        AND     C.CUST_NO(+) = A.CUST_NO
        AND     C.STR_DAY(+) <= TO_CHAR(SYSDATE,'YYYYMMDD')
        AND     C.END_DAY(+) >= TO_CHAR(SYSDATE,'YYYYMMDD')
        AND     C.DEL_YN(+)  = 'N';

        v_Cash_Iseq     := f_sRtre0092CashIseq(v_Recv_Seq, v_Cash_Seq);
        v_Cash_Day      :=  TO_CHAR(SYSDATE,'YYYYMMDD');
        v_File_Seq      := '0';
        v_Recv_Time     := TO_CHAR(v_Reg_Dt, 'HH24MISS');
        v_Cashd_Tp      := '7100'; -- ����
        v_Cashd_Fg      := '0';
        v_Cash_Stat     := '2';
        v_Cashapp_No    := NULL;
        v_Csercd        := NULL;
        v_Csermsg       := NULL;
        v_Ocapp_No      := NULL;
        v_Ocash_Day     := NULL;
        v_Cnc_Yn        := 'N';    -- ����
        v_Cash_Tno      := NULL;
        v_Cashapp_Tm    := NULL;
        v_Creg_St       := NULL;
        v_Creg_Desc     := NULL;

        IF 0 != f_InsertRtre0092(v_Recv_Seq ,v_Cash_Seq ,v_Cash_Iseq, v_Cash_Day ,v_File_Seq ,
                                 v_Recv_Day ,v_Recv_Time ,v_Cust_No ,v_Cust_Nm ,
                                 v_Cashd_Tp ,v_Cashd_Fg ,v_Chi_No ,v_Cash_Amt ,
                                 v_Cash_Namt ,v_Cash_Vamt ,v_Cash_Stat ,v_Cashapp_No ,
                                 v_Csercd ,v_Csermsg ,v_Ocapp_No ,v_Ocash_Day ,
                                 v_Cnc_Yn ,v_Cash_Tno ,v_Cashapp_Tm ,v_Creg_St ,
                                 v_Creg_Desc ,v_Reg_Id ,v_ErrorText) THEN
            v_Return_Message := '���ݿ����� �ǽð� ó�� �̷� ��� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;



        v_Ordr_Idxx := v_Cust_No||v_Recv_Seq||v_Cash_Seq;  /*�ֹ����й�ȣ          */
        v_Good_Nm   := '�ؼ�Ÿ�̾� ��Ż';                  /*��ǰ��                */
        v_Buyr_Nm   := v_Cust_Nm;                          /*�ֹ��ڸ�              */
        v_Buyr_Tel  := v_Mob_No;                           /*�ֹ��� ��ȭ��ȣ       */
        v_Req_Tx    := 'pay';                              /*��û ����             */
        v_Co_Type   := '0';                                /*����� ����           */
        v_Ctax_Type := 'TG01';                             /*����/�鼼 ����        */
        v_Ctax_No   := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R023', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R023' )); /*���� ����ڹ�ȣ       */
        v_Co_Nm     := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R045', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R045' )); /*��ȣ                  */
        v_Cowner_Nm := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R046', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R046' )); /*��ǥ�ڸ�              */
        v_Co_Add    := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R047', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R047' )); /*����� �ּ�           */
        v_Co_Tel    := Pkg_Rtcm0051.f_sRtcm0051CodeName ( 'R048', Pkg_Rtcm0051.f_sRtcm0051Cd( 'R048' )); /*����� ��ǥ ����ó    */

        v_Trad_Tm   := v_Cash_Day||v_Recv_Time;            /*�� �ŷ��ð�           */
        v_Tr_Code   := '0';                                /*����뵵              */
        v_Id_Info   := v_Chi_No;                           /*�ź�Ȯ�� ID           */
        v_Amt_Tot   := v_Cash_Amt;                         /*�ŷ��ݾ� �� ��        */
        v_Amt_Sup   := v_Cash_Namt;                        /*���ް���              */
        v_Amt_Svc   := '0';                                /*�����                */
        v_Amt_Tax   := v_Cash_Vamt;                        /*�ΰ���ġ��            */

    ELSIF v_Job_Gb = 'D' THEN

        IF NVL(v_Cash_Yn,'') <> 'Y' THEN
            v_Return_Message := '���� ������ ���ݿ����� ���࿩�ΰ� ('||v_Cash_Yn||')�̹Ƿ� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF v_Cnc_Yn_Cnt <> 1 THEN
            v_Return_Message := '�����('||TO_CHAR(v_Cnc_Yn_Cnt)||') ������ ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        SELECT  RECV_DAY, RECV_TIME, CUST_NO, CUST_NM,
                CHI_NO, CASH_AMT, CASH_NAMT, CASH_VAMT,
                CASH_STAT, CASHAPP_NO, CASH_DAY
        INTO    v_Recv_Day, v_Recv_Time, v_Cust_No, v_Cust_Nm,
                v_Chi_No, v_Cash_Amt, v_Cash_Namt, v_Cash_Vamt,
                v_Cash_StatB, v_Cashapp_NoB, v_Cash_DayB
        FROM    RTRE0091
        WHERE   RECV_SEQ = v_Recv_Seq
        AND     CNC_YN   = 'N';

        IF (TRIM(v_Cash_StatB) IS NULL) OR (TRIM(v_Cash_StatB) <> 5) THEN
            v_Return_Message := '����� ����('||v_Cash_StatB||')�� ���� ������ ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;


        v_Cash_Iseq     := f_sRtre0092CashIseq(v_Recv_Seq, v_Cash_Seq);
        v_Cash_Day      :=  TO_CHAR(SYSDATE,'YYYYMMDD');
        v_File_Seq      := '0';
        v_Recv_Time     := TO_CHAR(v_Reg_Dt, 'HH24MISS');
        v_Cashd_Tp      := '7102'; -- ���
        v_Cashd_Fg      := '0';
        v_Cash_Stat     := '2';
        v_Cashapp_No    := NULL;
        v_Csercd        := NULL;
        v_Csermsg       := NULL;
        v_Ocapp_No      := v_Cashapp_NoB;
        v_Ocash_Day     := v_Cash_DayB;
        v_Cnc_Yn        := 'Y';    -- ���
        v_Cash_Tno      := NULL;
        v_Cashapp_Tm    := NULL;
        v_Creg_St       := NULL;
        v_Creg_Desc     := NULL;

        IF 0 != f_InsertRtre0092(v_Recv_Seq ,v_Cash_Seq ,v_Cash_Iseq, v_Cash_Day ,v_File_Seq ,
                                 v_Recv_Day ,v_Recv_Time ,v_Cust_No ,v_Cust_Nm ,
                                 v_Cashd_Tp ,v_Cashd_Fg ,v_Chi_No ,v_Cash_Amt ,
                                 v_Cash_Namt ,v_Cash_Vamt ,v_Cash_Stat ,v_Cashapp_No ,
                                 v_Csercd ,v_Csermsg ,v_Ocapp_No ,v_Ocash_Day ,
                                 v_Cnc_Yn ,v_Cash_Tno ,v_Cashapp_Tm ,v_Creg_St ,
                                 v_Creg_Desc ,v_Reg_Id ,v_ErrorText) THEN
            v_Return_Message := '���ݿ����� �ǽð� ó�� �̷� ��� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

        v_Req_Tx    := 'mod';                              /*��û ����             */
        v_Trad_Tm   := v_Ocash_Day||v_Recv_Time;           /*�� �ŷ��ð�           */
        v_Mod_Type  := 'STSC';                             /*���� Ÿ��             */
        v_Mod_Gb    := 'MG02';                             /*�����û �ŷ���ȣ ����*/
        v_Mod_Val   := v_Cashapp_NoB;                      /*�����û �ŷ���ȣ     */
        v_Mod_Mny   := ' ';                                /*�����û �ݾ�         */
        v_Rem_Mny   := ' ';                                /*����ó�� ���� �ݾ�    */

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0092.p_IRtre0092CreateCashApp(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0092.p_IRtre0092CreateCashApp(2)', v_ErrorText, v_Return_Message);

  END p_IRtre0092CreateCashApp;

  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� - ���ݿ����� ����/��� �ǽð� ��� ������ ������Ʈ �Ѵ�.
  *****************************************************************************/
  FUNCTION f_UpdateRtre0092ResultCashApp (
    v_Recv_Seq       IN RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Iseq      IN RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Cash_Stat      IN RTRE0092.CASH_STAT%TYPE,      /*���ݿ����� �������   */
    v_Cashapp_No     IN RTRE0092.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Csercd         IN RTRE0092.CSERCD%TYPE,         /*�߱޿����ڵ�          */
    v_Csermsg        IN RTRE0092.CSERMSG%TYPE,        /*�߱޿����޼���        */
    v_Cash_Tno       IN RTRE0092.CASH_TNO%TYPE,       /*���ݿ����� �ŷ���ȣ   */
    v_Cashapp_Tm     IN RTRE0092.CASHAPP_TM%TYPE,     /*���ݿ����� ���νð�   */
    v_Creg_St        IN RTRE0092.CREG_ST%TYPE,        /*��ϻ����ڵ�          */
    v_Creg_Desc      IN RTRE0092.CREG_DESC%TYPE,      /*��ϻ��¼���          */
    v_Reg_Id         IN RTRE0092.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0092
    SET    CASH_STAT  = v_Cash_Stat,
           CASHAPP_NO = v_Cashapp_No,
           CSERCD     = v_Csercd,
           CSERMSG    = v_Csermsg,
           CASH_TNO   = v_Cash_Tno,
           CASHAPP_TM = v_Cashapp_Tm,
           CREG_ST    = v_Creg_St,
           CREG_DESC  = v_Creg_Desc,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  RECV_SEQ   = v_Recv_Seq
    AND    CASH_SEQ   = v_Cash_Seq
    AND    CASH_ISEQ  = v_Cash_Iseq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0092ResultCashApp;


  /*****************************************************************************
  -- ���ݿ����� �ǽð� ó�� �̷� - ���ݿ����� ����/��� �ǽð� ��� ������ ������Ʈ �Ѵ�.
  *****************************************************************************/
  PROCEDURE p_IRtre0092ResultCashApp (
    v_Job_Gb         IN  VARCHAR2,                     /*�۾�����(C:����,D:���*/
    v_Recv_Seq       IN  RTRE0092.RECV_SEQ%TYPE,       /*�����ŷ���ȣ          */
    v_Cash_Seq       IN  RTRE0092.CASH_SEQ%TYPE,       /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Iseq      IN  RTRE0092.CASH_ISEQ%TYPE,      /*���ݿ����� �̷¹�ȣ   */
    v_Res_Cd         IN  VARCHAR2,                     /*����ڵ�              */
    v_Res_Msg        IN  VARCHAR2,                     /*����޽���            */
    v_Cash_Tno       IN  RTRE0092.CASH_TNO%TYPE,       /*���ݿ����� �ŷ���ȣ   */
    v_Cashapp_No     IN  RTRE0092.CASHAPP_NO%TYPE,     /*���ݿ����� ���ι�ȣ   */
    v_Cashapp_Tm     IN  RTRE0092.CASHAPP_TM%TYPE,     /*���ݿ����� ���νð�   */
    v_Creg_St        IN  RTRE0092.CREG_ST%TYPE,        /*��ϻ����ڵ�          */
    v_Creg_Desc      IN  RTRE0092.CREG_DESC%TYPE,      /*��ϻ��¼���          */
    v_Reg_Id         IN  RTRE0092.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Cash_Stat RTRE0092.CASH_STAT%TYPE;               /*���ݿ����� �������   */
    v_Cash_Yn   RTRE0030.CASH_YN%TYPE;                 /*���ݿ����� ���࿩��   */

  BEGIN

    -- �ʼ���:
    IF (TRIM(v_Job_Gb) IS NULL) OR (TRIM(v_Job_Gb) NOT IN ('C','D')) THEN
        v_Return_Message := '�۾�����(C:����,D:���)('||v_Job_Gb||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '�����ŷ���ȣ('||v_Recv_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Seq) IS NULL THEN
        v_Return_Message := '���ݿ����� ���� �Ϸù�ȣ('||v_Cash_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cash_Iseq) IS NULL THEN
        v_Return_Message := '���ݿ����� �̷¹�('||v_Cash_Iseq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtre0092Count(v_Recv_Seq, v_Cash_Seq, v_Cash_Iseq) THEN
        v_Return_Message := '���ݿ����� �ǽð� ó�� �̷�('||v_Recv_Seq||'-'||v_Cash_Seq||'-'||v_Cash_Iseq||')�� �����Ƿ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Res_Cd) IS NULL THEN
        v_Return_Message := '�߱޿����ڵ�('||v_Res_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Res_Msg) IS NULL THEN
        v_Return_Message := '�߱޿����޽���('||v_Res_Msg||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Res_Cd) = '0000' THEN   /* ����ó���� */

        IF TRIM(v_Cash_Tno) IS NULL THEN
            v_Return_Message := '���ݿ����� �ŷ���ȣ('||v_Cash_Tno||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Cashapp_No) IS NULL THEN
            v_Return_Message := '���ݿ����� ���ι�ȣ('||v_Cashapp_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Cashapp_Tm) IS NULL THEN
            v_Return_Message := '���ݿ����� ���νð�('||v_Cashapp_Tm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

    END IF;

    -- �۾�����(C:����,D:���)
    IF TRIM(v_Job_Gb) = 'C' THEN
        v_Cash_Stat := '5'; -- ���ݿ����� ������� (5:�������)
        v_Cash_Yn   := 'Y'; -- ���ݿ����� ���࿩�� (Y:����)
    ELSIF TRIM(v_Job_Gb) = 'D' THEN
        v_Cash_Stat := '8'; -- ���ݿ����� ������� (8:���)
        v_Cash_Yn   := 'N'; -- ���ݿ����� ���࿩�� (N:�̹���)
    END IF;

    --  ���ݿ����� ����/��� �ǽð� ��� ������ ������Ʈ �Ѵ�.
    IF 0 != f_UpdateRtre0092ResultCashApp (
                    v_Recv_Seq,         /*�����ŷ���ȣ          */
                    v_Cash_Seq,         /*���ݿ����� ���� �Ϸù�*/
                    v_Cash_Iseq,        /*���ݿ����� �̷¹�ȣ   */
                    v_Cash_Stat,        /*���ݿ����� �������   */
                    TRIM(v_Cashapp_No), /*���ݿ����� ���ι�ȣ   */
                    TRIM(v_Res_Cd),     /*�߱޿����ڵ�          */
                    TRIM(v_Res_Msg),    /*�߱޿����޼���        */
                    TRIM(v_Cash_Tno),   /*���ݿ����� �ŷ���ȣ   */
                    TRIM(v_Cashapp_Tm), /*���ݿ����� ���νð�   */
                    TRIM(v_Creg_St),    /*��ϻ����ڵ�          */
                    TRIM(v_Creg_Desc),  /*��ϻ��¼���          */
                    v_Reg_Id,           /*����� ID             */
                    v_ErrorText
                    ) THEN
        v_Return_Message := '���ݿ����� �ǽð� ó�� �̷�(RTRE0092) ��� ����!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    IF 0 != v_Success_code THEN
        v_Return_Message := '���ݿ����� �ǽð� ó�� �̷�(RTRE0092) �������� ���ݿ������߱޳���(RTRE0091) ��� ����!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    IF TRIM(v_Res_Cd) = '0000' THEN

    -- ���ݿ����� �ǽð� ó�� �̷�(RTRE0092) �������� ���ݿ������߱޳���(RTRE0091) ���
        BEGIN

            INSERT  INTO RTRE0091 (
                    RECV_SEQ,CASH_SEQ,CASH_DAY,FILE_SEQ,
                    RECV_DAY,RECV_TIME,CUST_NO,CUST_NM,
                    CASHD_TP,CASHD_FG,CHI_NO,CASH_AMT,
                    CASH_NAMT,CASH_VAMT,CASH_STAT,CASHAPP_NO,
                    CSERCD,CSERMSG,OCAPP_NO,OCASH_DAY,
                    CNC_YN,REG_ID,REG_DT,CHG_ID,CHG_DT
                    )
            SELECT  RECV_SEQ,CASH_SEQ,CASH_DAY,FILE_SEQ,
                    RECV_DAY,RECV_TIME,CUST_NO,CUST_NM,
                    CASHD_TP,CASHD_FG,CHI_NO,CASH_AMT,
                    CASH_NAMT,CASH_VAMT,CASH_STAT,CASHAPP_NO,
                    CSERCD,CSERMSG,OCAPP_NO,OCASH_DAY,
                    CNC_YN,v_Reg_Id,SYSDATE,v_Reg_Id,SYSDATE
            FROM    RTRE0092
            WHERE   RECV_SEQ  = v_Recv_Seq
            AND     CASH_SEQ  = v_Cash_Seq
            AND     CASH_ISEQ = v_Cash_Iseq;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '���ݿ����� �̷�(RTRE0092) �������� ���ݿ������߱޳���(RTRE0091) ��� �����Ͽ� ó���� �Ұ� �մϴ�! - '||SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
        END;

        -- ���� ���� Update -  ���ݿ����� ���࿩��(CASH_YN) �� v_Job_Gb�� 'C'�̸� 'Y', v_Job_Gb�� 'C'�̸� 'N' ������ ������Ʈ �Ѵ�.
        IF 0 != Pkg_Rtre0030.f_UpdateRtre0030Aggregate (v_Recv_Seq, v_Cash_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���ݿ����� ���࿩��(RTRE0030.CASH_YN)�� ������Ʈ ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


        -- ����� ���
        IF TRIM(v_Job_Gb) = 'D' THEN

            -- ���ݿ����� �ǽð� ó�� �̷�(RTRE0092) �������� ���ݿ������߱޳���(RTRE0091) ������Ʈ(�����)
            BEGIN

                UPDATE  RTRE0091 A
                SET     (A.CNC_YN, A.OCAPP_NO, A.OCASH_DAY) =
                        (
                        SELECT  'Y', B.CASHAPP_NO, B.CASH_DAY
                        FROM    RTRE0092 B
                        WHERE   B.RECV_SEQ   = v_Recv_Seq
                        AND     B.CASH_SEQ   = v_Cash_Seq
                        AND     B.CASH_ISEQ  = v_Cash_Iseq
                        AND     A.CASHAPP_NO = B.OCAPP_NO
                        AND     A.CASH_DAY   = B.OCASH_DAY
                        )
                WHERE   (A.CASHAPP_NO, A.CASH_DAY) =
                        (
                        SELECT  B.OCAPP_NO, B.OCASH_DAY
                        FROM    RTRE0092 B
                        WHERE   B.RECV_SEQ  = v_Recv_Seq
                        AND     B.CASH_SEQ  = v_Cash_Seq
                        AND     B.CASH_ISEQ = v_Cash_Iseq
                        );

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '���ݿ����� �̷�(RTRE0092) �������� ���ݿ������߱޳���(RTRE0091) ������Ʈ �����Ͽ� ó���� �Ұ� �մϴ�! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;

        END IF;

        v_Success_code := 0;
        v_Return_Message := '���������� ó���Ǿ����ϴ�';
        v_ErrorText := '';
    --COMMIT;
    END IF;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0092.p_IRtre0092ResultCashApp(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0092.p_IRtre0092ResultCashApp(2)', v_ErrorText, v_Return_Message);

  END p_IRtre0092ResultCashApp;


END Pkg_Rtre0092;
/
