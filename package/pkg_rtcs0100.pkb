CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0100 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0100
   PURPOSE   �����ݴ�� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-24  jemcarry         1. Created this package body.
   1.1        2017-06-21  wjim             [20170621_01] ����� �߰� 
   1.2        2019-08-20  wjim             [20180820_01] �޽����̷� ��ȸ��� ����
*******************************************************************************/

  /*****************************************************************************
  -- �����ݴ�� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0100Count(
    v_Call_No        IN RTCS0100.CALL_NO%TYPE           /*����ȣ            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0100
    WHERE   CALL_NO = v_Call_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0100Count;

  /*****************************************************************************
  -- �����ݻ��� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0100 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day1       IN RTCS0100.JOB_DAY%TYPE,        /*ó������FROM          */
    v_Job_Day2       IN RTCS0100.JOB_DAY%TYPE,        /*ó������TO            */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE      /*��������              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.JOB_TP,                                                             /*�������     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', A.JOB_TP) JOB_TP_NM,         /*���������   */
            A.CALL_NO,                                                            /*����ȣ     */
            A.ORD_NO,                                                             /*����ȣ     */
            A.JOB_DAY,                                                            /*ó������     */
            A.BAEJUNG_YN,                                                         /*��������     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('H003', A.BAEJUNG_YN) BAEJUNG_YN_NM, /*�������θ�   */
            A.USER_ID,                                                            /*����ID     */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,                 /*�����     */
            A.BAEJUNG_DAY                                                         /*��������     */
    FROM    RTCS0100 A
    WHERE   A.JOB_TP   = v_Job_Tp
    AND     A.JOB_DAY  BETWEEN v_Job_Day1 AND v_Job_Day2
    AND     A.BAEJUNG_YN = DECODE(v_Baejung_Yn, NULL, A.BAEJUNG_YN, v_Baejung_Yn)
    AND     A.CALL_STATUS = 'I'
    AND     A.RETRY_CNT = 0 ;

  END p_sRtcs0100;


  /*****************************************************************************
  -- �����ݴ�� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0100 (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*����ȣ              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*ó������              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*�����ID(����)      */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*��������              */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*��������              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*�õ� �Ǽ�             */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Proc_Day       IN RTCS0100.PROC_DAY%TYPE,       /*��������              */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*�����븮��            */
    v_Mat_Cd         IN RTCS0100.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Mat_Nm         IN RTCS0100.MAT_NM%TYPE,         /*��ǰ��                */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Car_No         IN RTCS0100.CAR_NO%TYPE,         /*������ȣ              */
    v_Vkbur          IN RTCS0100.VKBUR%TYPE,          /*����                  */
    v_Vkgrp          IN RTCS0100.VKGRP%TYPE,          /*����                  */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */
    v_Serv_Seq       IN RTCS0100.SERV_SEQ%TYPE,       /*���� ����           */
    v_Proc_In_Cd     IN RTCS0100.PROC_IN_CD%TYPE,     /*���� ó����         */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0100 (
            CALL_NO,
            JOB_TP,
            JOB_DAY,
            CALL_DAY,
            CALL_STATUS,
            USER_ID,
            BAEJUNG_DAY,
            BAEJUNG_YN,
            RETRY_CNT,
            ORD_NO,
            PROC_DAY,
            AGENCY_CD,
            MAT_CD,
            MAT_NM,
            CUST_NO,
            CUST_NM,
            MOB_NO,
            TEL_NO,
            CAR_NO,
            VKBUR,
            VKGRP,
            CALL_DTL,
            SERV_SEQ,       /*���� ����           */
            PROC_IN_CD,     /*���� ó����         */
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Call_No,
            v_Job_Tp,
            v_Job_Day,
            v_Call_Day,
            v_Call_Status,
            v_User_Id,
            v_Baejung_Day,
            v_Baejung_Yn,
            v_Retry_Cnt,
            v_Ord_No,
            v_Proc_Day,
            v_Agency_Cd,
            v_Mat_Cd,
            v_Mat_Nm,
            v_Cust_No,
            v_Cust_Nm,
            v_Mob_No,
            v_Tel_No,
            v_Car_No,
            v_Vkbur,
            v_Vkgrp,
            v_Call_Dtl,
            v_Serv_Seq,       /*���� ����           */
            v_Proc_In_Cd,     /*���� ó����         */
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

  END f_InsertRtcs0100;

  /*****************************************************************************
  -- �����ݴ�� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0100 (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*����ȣ              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*ó������              */
    v_User_Id        IN RTCM0001.USER_ID%TYPE,        /*����� ID             */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*��������              */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*��������              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCS0100
    SET    JOB_TP      = v_Job_Tp,
           JOB_DAY     = v_Job_Day,
           USER_ID     = v_User_Id,
           BAEJUNG_YN  = v_Baejung_Yn,
           BAEJUNG_DAY = v_Baejung_Day,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  CALL_NO     = v_Call_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0100;


  /*****************************************************************************
  -- �����ݴ�� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0100 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Call_No        IN OUT RTCS0100.CALL_NO%TYPE,    /*����ȣ              */
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day        IN RTCS0100.JOB_DAY%TYPE,        /*ó������              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*�����ID(����)      */
    v_Baejung_Day    IN RTCS0100.BAEJUNG_DAY%TYPE,    /*��������              */
    v_Baejung_Yn     IN RTCS0100.BAEJUNG_YN%TYPE,     /*��������              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*�õ� �Ǽ�             */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Proc_Day       IN RTCS0100.PROC_DAY%TYPE,       /*��������              */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*�����븮��            */
    v_Mat_Cd         IN RTCS0100.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Mat_Nm         IN RTCS0100.MAT_NM%TYPE,         /*��ǰ��                */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*����/���θ�         */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Car_No         IN RTCS0100.CAR_NO%TYPE,         /*������ȣ              */
    v_Vkbur          IN RTCS0100.VKBUR%TYPE,          /*����                  */
    v_Vkgrp          IN RTCS0100.VKGRP%TYPE,          /*����                  */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */
    v_Serv_Seq       IN RTCS0100.SERV_SEQ%TYPE,       /*���� ����           */
    v_Proc_In_Cd     IN RTCS0100.PROC_IN_CD%TYPE,     /*���� ó����         */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:�������, ó������, ��ȭ����,��������,����ȣ, ��������,��ǰ�ڵ�, ��ǰ��,����ȣ,����ȣ, ����� ID
    IF (TRIM(v_Job_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H001', v_Job_Tp)) THEN
        v_Return_Message := '�������('||v_Job_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Baejung_Yn) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H003', v_Baejung_Yn)) THEN
        v_Return_Message := '��������('||v_Baejung_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Comm_Dvsn) = 'I' THEN

        IF 0!= ISDATE(v_Job_Day) THEN
            v_Return_Message := 'ó������('||v_Job_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;

        END IF;

        IF (TRIM(v_Call_Status) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('H002', v_Call_Status)) THEN
            v_Return_Message := '��ȭ����('||v_Call_Status||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF 0 != ISDATE(v_Proc_Day) THEN
            v_Return_Message := '��������('||v_Proc_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Agency_Cd) IS NULL) OR (0 = Pkg_Rtsd0007.f_sRtsd0007Count(v_Agency_Cd)) THEN
            v_Return_Message := '�����븮��('||v_Agency_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Mat_Cd) IS NULL) OR (0 = Pkg_Rtsd0005.f_sRtsd0005Count(v_Mat_Cd)) THEN
            v_Return_Message := '��ǰ�ڵ�('||v_Mat_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Mat_Nm) IS NULL THEN
            v_Return_Message := '��ǰ��('||v_Mat_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
            v_Return_Message := '����ȣ('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
            v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

     END IF;


     IF v_Comm_Dvsn = 'I' THEN

        v_Call_No := f_sRtcs0100CallNo();

        IF 0 != f_InsertRtcs0100(v_Call_No, v_Job_Tp, v_Job_Day, v_Call_Day,
                                 v_Call_Status, v_User_Id, v_Baejung_Day, v_Baejung_Yn,
                                 v_Retry_Cnt, v_Ord_No, v_Proc_Day, v_Agency_Cd, v_Mat_Cd,
                                 v_Mat_Nm, v_Cust_No, v_Cust_Nm, v_Mob_No,
                                 v_Tel_No, v_Car_No, v_Vkbur, v_Vkgrp,
                                 v_Call_Dtl, v_Serv_Seq, v_Proc_In_Cd,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�����ݴ�� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 = f_sRtcs0100Count(v_Call_No) THEN
            v_Return_Message := '�ش� ����ȣ('||v_Call_No||')�� ��ϵ� ������ ���� ���� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF 0 != f_UpdateRtcs0100(v_Call_No, v_Job_Tp, v_Job_Day, v_User_Id,
                                 v_Baejung_Yn,v_Baejung_Day, v_Reg_Id , v_ErrorText) THEN
            v_Return_Message := '�����ݴ�� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        v_Return_Message := 'ó������(I,U,D) ��('||v_Comm_Dvsn||') ������ ó�� �Ұ�!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_IUDRtcs0100(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_IUDRtcs0100(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0100;

  /*****************************************************************************
  -- �����ݻ�� ��� ��ȸ
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-06-21  wjim             [20170621_01] ����� �߰� 
  *****************************************************************************/
  PROCEDURE p_sRtcs0100Regf (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Job_Day1       IN RTCS0100.JOB_DAY%TYPE,        /*ó������FROM          */
    v_Job_Day2       IN RTCS0100.JOB_DAY%TYPE,        /*ó������TO            */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*����ID              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*����                */
    v_Agency_Cd      IN RTCS0100.AGENCY_CD%TYPE,      /*�����븮��            */
    v_Mob_No         IN RTCS0100.MOB_NO%TYPE,         /*�޴��ȣ              */
    v_Tel_No         IN RTCS0100.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.*,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*��Ż����           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*��Ż����           */
      FROM (
    SELECT X.JOB_TP_NM,                                                                /*���������   */
           X.CALL_NO,                                                                  /*����ȣ     */
           X.USER_ID_NM,                                                               /*�����     */
           X.CALL_STATUS,
           X.CALL_STATUS_NM,                                                           /*��ȭ����     */
           X.ORD_NO,                                                                   /*����ȣ     */
           X.AGENCY_NM,                                                                /*�븮��       */
           X.CUST_NM,                                                                  /*����       */
           X.MOB_NO,                                                                   /*�޴�����ȣ   */
           X.TEL_NO,                                                                   /*��ȭ��ȣ     */
           X.RETRY_CNT,                                                                /*�õ��Ǽ�     */
           X.JOB_DAY,                                                                  /*ó������     */
           X.CALL_DAY,                                                                 /*��ȭ����     */
           X.CALL_DTL,                                                                 /*��㳻��     */
           X.SERV_SEQ,                                                                 /*���� ����  */
           X.PROC_IN_NM,
           Y.ANSWER,                                                                   /*���������� */
           X.CHG_ID,                                                                   /*����� [20170621_01] */
           X.SERVICE_CD,
           X.SERVICE_NM,
           X.AGENCY_CD
    FROM (
       SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', A.JOB_TP) JOB_TP_NM,           /*���������   */
               A.CALL_NO,                                                              /*����ȣ     */
               Pkg_Rtcm0001.f_sRtcm0001UserNm(A.USER_ID) USER_ID_NM,                   /*�����     */
               A.CALL_STATUS,
               Pkg_Rtcm0051.f_sRtcm0051CodeName('H002', A.CALL_STATUS) CALL_STATUS_NM, /*��ȭ����     */
               A.ORD_NO,                                                               /*����ȣ     */
               Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD) AGENCY_NM,                /*�븮��       */
               A.CUST_NM,                                                              /*����       */
               A.MOB_NO,                                                               /*�޴�����ȣ   */
               A.TEL_NO,                                                               /*��ȭ��ȣ     */
               A.RETRY_CNT,                                                            /*�õ��Ǽ�     */
               A.JOB_DAY,                                                              /*ó������     */
               A.CALL_DAY,                                                             /*��ȭ����     */
               A.CALL_DTL,                                                             /*��㳻��     */
               A.SERV_SEQ,                                                             /*���� ����  */
               CASE WHEN A.JOB_TP = 'H1' THEN Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)
               ELSE CASE WHEN (SELECT AGENCY_NM    FROM RTSD0007 WHERE A.PROC_IN_CD = AGENCY_CD)    IS NOT NULL THEN
                                      Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)
                         WHEN (SELECT CARMASTER_NM FROM RTCS0002 WHERE A.PROC_IN_CD = CARMASTER_NU) IS NOT NULL THEN
                                      (SELECT CARMASTER_NM FROM RTCS0002 WHERE A.PROC_IN_CD = CARMASTER_NU)
                    ELSE ''
                    END
               END AS PROC_IN_NM,
               CASE WHEN B.OBJECT_QUS_01 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_01
                    WHEN B.OBJECT_QUS_02 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_02
                    WHEN B.OBJECT_QUS_03 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_03
                    WHEN B.OBJECT_QUS_04 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_04
                    WHEN B.OBJECT_QUS_05 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_05
                    WHEN B.OBJECT_QUS_06 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_06
                    WHEN B.OBJECT_QUS_07 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_07
                    WHEN B.OBJECT_QUS_08 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_08
                    WHEN B.OBJECT_QUS_09 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_09
                    WHEN B.OBJECT_QUS_10 = DECODE(A.JOB_TP,'H1','003','H2','005','') THEN OBJECT_ANS_10
               END AS SERV_ANS_CD,
               A.CHG_ID,
               C.SERVICE_CD,
               D.CD_NM SERVICE_NM,
               A.AGENCY_CD
       FROM    RTCS0100 A,
               RTCS0101 B,
               RTCS0008 C,
               RTCM0051 D
       WHERE   A.JOB_TP   = v_Job_Tp
       AND     A.JOB_DAY  BETWEEN v_Job_Day1 AND v_Job_Day2
       AND     (v_Call_Status  IS NULL OR A.CALL_STATUS =  v_Call_Status)
       AND     (v_User_Id      IS NULL OR A.USER_ID     =  v_User_Id)
       AND     (v_Cust_Nm      IS NULL OR A.CUST_NM     =  v_Cust_Nm)
       AND     A.MOB_NO LIKE   DECODE(v_Mob_No, NULL, A.MOB_NO, '%'||v_Mob_No)
       AND     A.TEL_NO LIKE   DECODE(v_Tel_No, NULL, A.TEL_NO, '%'||v_Tel_No)
       AND     A.CALL_NO       = B.CALL_NO (+)
       AND     A.ORD_NO = C.ORD_NO(+)
       AND     A.SERV_SEQ = C.SERV_SEQ(+)
       AND     C.SERVICE_CD = D.CD(+)
       AND     D.CD_GRP_CD(+) = 'S044'
    ) X,
    (SELECT ANSWER_NO||ANSWER_SEQ AS OBJECT_ANS, ANSWER
     FROM   RTCS0113 ) Y
    WHERE  X.SERV_ANS_CD = Y.OBJECT_ANS (+)
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
    ;

  END p_sRtcs0100Regf;

  /*****************************************************************************
  -- �����ݴ�� - ����ȣ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0100CallNo RETURN NUMBER IS
    v_Call_No   RTCS0100.CALL_NO%TYPE DEFAULT NULL;     /*����ȣ            */
  BEGIN

    SELECT  SEQ_RTCS0100CALL_NO.NEXTVAL
    INTO    v_Call_No
    FROM    DUAL;

    RETURN v_Call_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0100CallNo;

  /*****************************************************************************
  -- �����ݻ�� ��� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0100Ctf (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE           /*����ȣ              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.ORD_NO,                                                       /*����ȣ     */
            A.CUST_NM,                                                      /*����       */
            A.MOB_NO,                                                       /*�޴�����ȣ   */
            A.TEL_NO,                                                       /*��ȭ��ȣ     */
            Pkg_Rtsd0007.f_sRtsd0007AgencyNm(B.AGENCY_CD) AGENCY_NM ,       /*�����븮��   */
            B.PROC_DAY,                                                     /*��������     */
            C.MAT_CD,                                                       /*��ǰ�ڵ�     */
            Pkg_Rtsd0005.f_sRtsd0005MatName(C.MAT_CD) MAT_NM,               /*��ǰ��       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S023', B.REGI_CD) REGI_NM,    /*��Ϻ�       */
            B.MON_AMT,                                                      /*����Ż��     */
            B.CNT_CD,                                                       /*Ÿ�̾��   */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', B.PERIOD_CD) PERIOD_NM,/*��Ż�Ⱓ(��) */
            D.MF_CD MANUFACTURE_DROP,                                       /*������*/
            D.MODEL_NM MODEL_NM,                                            /*�𵨸�*/
            D.WIDTH_CD    WIDTH_DROP,                                       /*�ܸ���*/
            D.RATIO_CD   RATIO_DROP,                                        /*�����*/
            D.INCH_CD     INCH_DROP                                         /*��ġ*/
    FROM    RTSD0100 A,
            RTSD0108 B,
            RTSD0106 C,
            RTCS0120 D
    WHERE   A.CUST_NO = B.CUST_NO
    AND     B.ORD_NO = C.ORD_NO
    AND     B.ORD_NO = v_Ord_No
    AND     C.ORD_NO = D.ORD_NO(+);

  END p_sRtcs0100Ctf;

  /*****************************************************************************
  -- �����ݻ�� ���
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0100Reg (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*�õ��Ǽ�              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0100
    SET    CALL_DTL    = v_Call_Dtl,
           CALL_STATUS = v_Call_Status,
           RETRY_CNT   = v_Retry_Cnt,
           CALL_DAY    = v_Call_Day,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  CALL_NO     = v_Call_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0100Reg;

 /*****************************************************************************
  -- �����ݴ�� ��� ���
  *****************************************************************************/
  PROCEDURE p_UpdateRtcs0100reg (
    v_Call_No        IN RTCS0100.CALL_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_Retry_Cnt      IN RTCS0100.RETRY_CNT%TYPE,      /*�õ��Ǽ�              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    IF 0 = f_sRtcs0100Count(v_Call_No) THEN
        v_Return_Message := '�ش� ����ȣ('||v_Call_No||')�� ��ϵ� ������ ���� ���� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Call_Dtl) IS NULL THEN
        v_Return_Message := '�ش� ��㳻��('||v_Call_Dtl||')���� ���� ���� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != f_UpdateRtcs0100Reg(v_Call_No, v_Ord_No, v_Call_Dtl, v_Call_Status,
                                v_Retry_Cnt, v_Call_Day, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�����ݴ�� ��� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_UpdateRtcs0100reg(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_UpdateRtcs0100reg(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtcs0100reg;

  /*****************************************************************************
  -- �����ݻ�� ��� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0100ServiceHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE,          /*����ȣ              */
    v_Serv_Seq      IN RTCS0100.SERV_SEQ%TYPE         /*���� ����           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT
         B.SERVICE_CD
        ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', B.SERVICE_CD) AS SERVICE_NM
        ,A.PROC_IN_CD
        ,CASE WHEN (SELECT AGENCY_NM    FROM RTSD0007 WHERE A.PROC_IN_CD = AGENCY_CD)    IS NOT NULL THEN Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.PROC_IN_CD)
              WHEN (SELECT CARMASTER_NM FROM RTCS0002 WHERE A.PROC_IN_CD = CARMASTER_NU) IS NOT NULL THEN (SELECT CARMASTER_NM FROM RTCS0002 WHERE A.PROC_IN_CD = CARMASTER_NU)
         ELSE ''
         END AS PROC_IN_NM
        ,A.PROC_DAY
        ,A.PROC_TM
    FROM RTCS0007 A INNER JOIN RTCS0008 B ON A.ORD_NO = B.ORD_NO AND A.SERV_SEQ = B.SERV_SEQ
    WHERE A.ORD_NO   = v_Ord_No
    AND   A.SERV_SEQ = v_Serv_Seq;
  END p_sRtcs0100ServiceHistory;
  
  
  /*****************************************************************************
  -- ������ ����̷� ��ȸ 
  *****************************************************************************/
  PROCEDURE p_sRtcs0100AdviceHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Ord_No        IN RTCS0100.ORD_NO%TYPE          /*����ȣ              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT RECV_TP        /*��������ڵ�      */
     , RECV_TP_NM     /*���������        */
     , RECV_DAY       /*��ȭ����          */
     , RESU_ST        /*ó�������ڵ��    */
     , RESU_ST_NM     /*ó�����¸�        */
     , ORD_NO         /*����ȣ          */
     , CUST_NO        /*����ȣ          */
     , CUST_NM        /*����Ī          */
     , END_DAY        /*ó������ */
     , CALL_NO        /*����ȣ */
     , USER_ID        /*����ID          */
     , USER_ID_NM     /*�����          */
     , MOB_NO         /*�����ȭ��ȣ*/
     , CAR_NO         /*��������ȣ          */
     , TEL_NO         /*������ó          */
     , CALL_DTL       /*��㳻��          */
     , BOUND_GB       /*��㱸��*/
  FROM (
        SELECT RECV_TP
             , Pkg_Rtcm0051.f_sRtcm0051CodeName('H005', RECV_TP) RECV_TP_NM
             , RECV_DAY
             , RESU_ST
             , Pkg_Rtcm0051.f_sRtcm0051CodeName('H006', RESU_ST) RESU_ST_NM
             , ORD_NO
             , CUST_NO
             , CUST_NM
             , END_DAY
             , TO_NUMBER(CALL_NO) AS CALL_NO
             , USER_ID
             , Pkg_Rtcm0001.f_sRtcm0001UserNm(USER_ID) USER_ID_NM
             , TEL_NO AS MOB_NO
             , CAR_NO
             , CALL_DTL
             , TEL_NO
             , 'OUT' AS BOUND_GB
          FROM RTCS0102
         WHERE 1=1
           AND ORD_NO = v_Ord_No      

        UNION ALL
           
        SELECT JOB_TP AS RECV_TP
             , Pkg_Rtcm0051.f_sRtcm0051CodeName('H001', JOB_TP) RECV_TP_NM
             , CALL_DAY AS RECV_DAY
             , CALL_STATUS AS RESU_ST
             , Pkg_Rtcm0051.f_sRtcm0051CodeName('H002', CALL_STATUS) AS RESU_ST_NM
             , ORD_NO
             , CUST_NO
             , CUST_NM
             , JOB_DAY AS END_DAY
             , CALL_NO  
             , USER_ID
             , Pkg_Rtcm0001.f_sRtcm0001UserNm(USER_ID) USER_ID_NM
             , MOB_NO AS 
             , CAR_NO
             , CALL_DTL
             , TEL_NO
             , 'IN' AS BOUND_GB 
            FROM    RTCS0100 A
           WHERE  1=1
             AND ORD_NO = v_Ord_No     
       )
  WHERE 1=1
    ORDER BY RECV_DAY DESC;
    
  END p_sRtcs0100AdviceHistory;
  
  
   /*****************************************************************************
  -- ������ �޽����̷� ��ȸ 
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2019-08-20  wjim             [20180820_01] �޽����̷� ��ȸ��� ����
  *****************************************************************************/
  PROCEDURE p_sRtcs0100MessageHistory (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Mob_No        IN RTCS0100.MOB_NO%TYPE          /*����ȣ              */
    ) IS 
    
    BEGIN
    OPEN Ref_Cursor FOR

    SELECT CASE WHEN B.MSG_SNDER_NM = 'KAKAO' THEN B.MSG_SNDER_NM
           ELSE 'SMS' END AS MSG_GB                            /*�޼�������*/
         , A.REG_ID
         , Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) REG_NM     /*����ڸ� */
         , A.RCV_PHN_ID                                        /*�޴�����ȣ*/
         , TO_CHAR(TO_DATE(NVL(B.SND_DATE, A.RESERVED_DTTM),'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS') AS REG_DT  /*�߼��Ͻ�*/
         , A.SND_MSG                                           /* �޽������� */
      FROM RTSD0205 A
         , RTSD0207 B
     WHERE 1=1
       AND A.CMP_MSG_ID = B.MSG_ID(+) 
       AND A.RCV_PHN_ID = v_Mob_No
       AND B.RESULT_CD(+) = 'OK'
     ORDER BY NVL(B.SND_DATE, A.RESERVED_DTTM) DESC;         
    
--    SELECT 'SMS' AS MSG_GB                                   /*�޼�������*/
--     , REG_ID
--     , Pkg_Rtcm0001.f_sRtcm0001UserNm(REG_ID) REG_NM     /*����ڸ� */
--     , RCV_PHN_ID                                        /*�޴�����ȣ*/
--     , TO_CHAR(REG_DT, 'YYYY-MM-DD HH:MM:SS') AS REG_DT  /*�߼��Ͻ�*/
--     , SND_MSG                                           /* �޽������� */
--  FROM RTSD0205
-- WHERE 1=1
--   AND RCV_PHN_ID = v_Mob_No;
   END p_sRtcs0100MessageHistory;
    

  /*****************************************************************************
  -- ������ In ������� 
  *****************************************************************************/
  PROCEDURE p_sRtcs010SaveAdvice (
    v_Job_Tp         IN RTCS0100.JOB_TP%TYPE,         /*�������              */
    v_Call_Day       IN RTCS0100.CALL_DAY%TYPE,       /*��ȭ����              */
    v_Call_Status    IN RTCS0100.CALL_STATUS%TYPE,    /*��ȭ����              */
    v_Ord_No         IN RTCS0100.ORD_NO%TYPE,         /*����ȣ              */
    v_Cust_No        IN RTCS0100.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTCS0100.CUST_NM%TYPE,        /*����/���θ�         */    
    v_Call_No        IN OUT RTCS0100.CALL_NO%TYPE,    /*����ȣ              */
    v_User_Id        IN RTCS0100.USER_ID%TYPE,        /*�����ID(����)      */
    v_Call_Dtl       IN RTCS0100.CALL_DTL%TYPE,       /*��㳻��              */    
    v_Reg_Id         IN RTCS0100.REG_ID%TYPE,         /*����� ID             */
    v_Bonus_Gb       IN VARCHAR2,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    )
    IS
     e_Error EXCEPTION; 
    BEGIN
    
    
    IF v_Bonus_Gb = 'IN' THEN    
     
    UPDATE RTCS0100
    SET    CALL_DTL    = v_Call_Dtl,
           CALL_STATUS = v_Call_Status,
           CALL_DAY    = v_Call_Day,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  CALL_NO     = v_Call_No;
    
    ELSE
    UPDATE RTCS0102
    SET    CALL_DTL    = v_Call_Dtl,
           RECV_DAY    = v_Call_Day,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  CALL_NO     = v_Call_No;
    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_sRtcs010SaveAdvice(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0100.p_sRtcs010SaveAdvice(2)', v_ErrorText, v_Return_Message);
    END p_sRtcs010SaveAdvice;  

END Pkg_Rtcs0100;
/
