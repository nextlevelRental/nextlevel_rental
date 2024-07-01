CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0022 AS
/*******************************************************************************
   NAME      Pkg_Rtre0022
   PURPOSE   ī������ ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-21  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ī������ ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0022Count(
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,        /*ī����������        */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE         /*ī����������        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0022
    WHERE   CCERT_DAY = v_Ccert_Day
    AND     CCERT_SEQ = v_Ccert_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0022Count;

  /*****************************************************************************
  -- ī������ ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0022 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*ī����������          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*������                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*����                */
    v_Mob_No         IN RTRE0022.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Email_Addr     IN RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CCERT_DAY,                 /*ī����������        */
            A.CCERT_SEQ,                 /*ī����������        */
            A.CARD_NO,                   /*ī���ȣ            */
            A.EXPIRE_YM,                 /*��ȿ�Ⱓ            */
            A.OWNER_NM,                  /*������              */
            A.CUST_TP,                   /*������            */
            A.EBIR_DAY,                  /*�����������(YYMMDD)*/
            A.BUSL_NO,                   /*����ڹ�ȣ          */
            A.CCERT_ID,                  /*������û��          */
            A.CUST_NO,                   /*����ȣ            */
            A.CUST_NM,                   /*����              */
            A.MOB_NO,                    /*�޴�����ȣ          */
            A.EMAIL_ADDR,                /*E-Mail�ּ�          */
            A.BKEY_CHK,                  /*ī��Ȯ�λ���        */
            A.CARDCOM_CD,                /*ī����ڵ�          */
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0022 A
    WHERE   A.CCERT_DAY  = DECODE(v_Ccert_Day , NULL, A.CCERT_DAY , v_Ccert_Day)
    AND     A.CCERT_SEQ  = DECODE(v_Ccert_Seq , NULL, A.CCERT_SEQ , v_Ccert_Seq)
    AND     A.CARD_NO    = DECODE(v_Card_No   , NULL, A.CARD_NO   , v_Card_No)
    AND     A.EXPIRE_YM  = DECODE(v_Expire_Ym , NULL, A.EXPIRE_YM , v_Expire_Ym)
    AND     A.OWNER_NM   = DECODE(v_Owner_Nm  , NULL, A.OWNER_NM  , v_Owner_Nm)
    AND     A.CUST_TP    = DECODE(v_Cust_Tp   , NULL, A.CUST_TP   , v_Cust_Tp)
    AND     A.EBIR_DAY   = DECODE(v_Ebir_Day  , NULL, A.EBIR_DAY  , v_Ebir_Day)
    AND     A.BUSL_NO    = DECODE(v_Busl_No   , NULL, A.BUSL_NO   , v_Busl_No)
    AND     A.CCERT_ID   = DECODE(v_Ccert_Id  , NULL, A.CCERT_ID  , v_Ccert_Id)
    AND     A.CUST_NO    = DECODE(v_Cust_No   , NULL, A.CUST_NO   , v_Cust_No)
    AND     A.CUST_NM    = DECODE(v_Cust_Nm   , NULL, A.CUST_NM   , v_Cust_Nm)
    AND     A.MOB_NO     = DECODE(v_Mob_No    , NULL, A.MOB_NO    , v_Mob_No)
    AND     A.EMAIL_ADDR = DECODE(v_Email_Addr, NULL, A.EMAIL_ADDR, v_Email_Addr)
    AND     A.BKEY_CHK   = DECODE(v_Bkey_Chk  , NULL, A.BKEY_CHK  , v_Bkey_Chk)
    AND     A.CARDCOM_CD = DECODE(v_Cardcom_Cd, NULL, A.CARDCOM_CD, v_Cardcom_Cd)
    AND     A.BATCH_KEY  = DECODE(v_Batch_Key , NULL, A.BATCH_KEY , v_Batch_Key)
    AND     A.REG_ID     = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtre0022;

  /*****************************************************************************
  -- ī������ ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0022 (
    v_Ccert_Day      IN OUT RTRE0022.CCERT_DAY%TYPE,  /*ī����������          */
    v_Ccert_Seq      IN OUT RTRE0022.CCERT_SEQ%TYPE,  /*ī����������          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*������                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*����                */
    v_Mob_No         IN OUT RTRE0022.MOB_NO%TYPE,     /*�޴�����ȣ            */
    v_Email_Addr     IN OUT RTRE0022.EMAIL_ADDR%TYPE, /*E-Mail�ּ�            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2,
    v_Return_Message OUT VARCHAR2
    ) RETURN NUMBER IS

    e_Error EXCEPTION;
  BEGIN

    IF TRIM(v_Card_No) IS NULL THEN
        v_Return_Message := 'ī���ȣ('||v_Card_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;        
    
    IF TRIM(v_Expire_Ym) IS NULL THEN
        v_Return_Message := '��ȿ�Ⱓ('||v_Expire_Ym||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Cust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Cust_Tp)) THEN
        v_Return_Message := '������('||v_Cust_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    -- ����(01), �����(02)
    IF TRIM(v_Cust_Tp) = '01' THEN
    
        IF TRIM(v_Ebir_Day) IS NULL THEN
            v_Return_Message := '�����������(YYMMDD)('||v_Ebir_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;     
    ELSE
        IF TRIM(v_Busl_No) IS NULL THEN
            v_Return_Message := '����ڹ�ȣ('||v_Busl_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;  
    END IF;   
    
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No)) THEN
        v_Return_Message := '����ȣ('||v_Cust_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_Nm) IS NULL THEN
        v_Return_Message := '����('||v_Cust_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    
    IF (TRIM(v_Cardcom_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R002', v_Cardcom_Cd)) THEN
        v_Return_Message := 'ī����ڵ�('||v_Cardcom_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
    
    IF (TRIM(v_Bkey_Chk) IS NULL) OR (TRIM(v_Bkey_Chk) NOT IN ('Y','N')) THEN
        v_Return_Message := 'ī��Ȯ�λ���('||v_Bkey_Chk||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;    
                     
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;      
     
  
    v_Ccert_Day := to_char(sysdate, 'YYYYMMDD');
    v_Ccert_Seq := f_sRtre0022CcertSeq();
    
    BEGIN
    
        SELECT  MOB_NO, EMAIL_ADDR 
        INTO    v_Mob_No, v_Email_Addr
        FROM    RTSD0100 where CUST_NO = v_Cust_No;
        
    END;

    INSERT  INTO RTRE0022 (
            CCERT_DAY,
            CCERT_SEQ,
            CARD_NO,
            EXPIRE_YM,
            OWNER_NM,
            CUST_TP,
            EBIR_DAY,
            BUSL_NO,
            CCERT_ID,
            CUST_NO,
            CUST_NM,
            MOB_NO,
            EMAIL_ADDR,
            BKEY_CHK,
            CARDCOM_CD,
            BATCH_KEY,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ccert_Day,
            v_Ccert_Seq,
            v_Card_No,
            v_Expire_Ym,
            v_Owner_Nm,
            v_Cust_Tp,
            v_Ebir_Day,
            v_Busl_No,
            v_Ccert_Id,
            v_Cust_No,
            v_Cust_Nm,
            v_Mob_No,
            v_Email_Addr,
            v_Bkey_Chk,
            v_Cardcom_Cd,
            v_Batch_Key,
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

  END f_InsertRtre0022;

  /*****************************************************************************
  -- ī������ ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0022 (
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*ī����������          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*������                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*����                */
    v_Mob_No         IN RTRE0022.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Email_Addr     IN RTRE0022.EMAIL_ADDR%TYPE,     /*E-Mail�ּ�            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*����� ID             */
    v_Res_Cd         IN RTRE0022.RES_CD%TYPE,         /* �����ڵ�*/
    v_Res_Msg        IN RTRE0022.RES_MSG%TYPE,        /* ����޽���*/
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0022
    SET    BKEY_CHK         = v_Bkey_Chk,
           CARDCOM_CD       = v_Cardcom_Cd,
           BATCH_KEY        = v_Batch_Key,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE ,
           RES_CD           = v_Res_Cd,
           RES_MSG          = v_Res_Msg
    WHERE  CCERT_DAY        = v_Ccert_Day
    AND    CCERT_SEQ        = v_Ccert_Seq;
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0022;

  /*****************************************************************************
  -- ī������ ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0022 (
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Ccert_Seq      IN RTRE0022.CCERT_SEQ%TYPE,      /*ī����������          */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTRE0022
    WHERE  CCERT_DAY        = v_Ccert_Day
    AND    CCERT_SEQ        = v_Ccert_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.f_DeleteRtre0022(2)', 'ī����������', v_Ccert_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.f_DeleteRtre0022(2)', 'ī����������', v_Ccert_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.f_DeleteRtre0022(2)', '����� ID ', v_Reg_Id);        
        
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0022;

  /*****************************************************************************
  -- ī������ ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0022 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ccert_Day      IN OUT RTRE0022.CCERT_DAY%TYPE,  /*ī����������          */
    v_Ccert_Seq      IN OUT RTRE0022.CCERT_SEQ%TYPE,  /*ī����������          */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE,        /*ī���ȣ              */
    v_Expire_Ym      IN RTRE0022.EXPIRE_YM%TYPE,      /*��ȿ�Ⱓ              */
    v_Owner_Nm       IN RTRE0022.OWNER_NM%TYPE,       /*������                */
    v_Cust_Tp        IN RTRE0022.CUST_TP%TYPE,        /*������              */
    v_Ebir_Day       IN RTRE0022.EBIR_DAY%TYPE,       /*�����������(YYMMDD)  */
    v_Busl_No        IN RTRE0022.BUSL_NO%TYPE,        /*����ڹ�ȣ            */
    v_Ccert_Id       IN RTRE0022.CCERT_ID%TYPE,       /*������û��            */
    v_Cust_No        IN RTRE0022.CUST_NO%TYPE,        /*����ȣ              */
    v_Cust_Nm        IN RTRE0022.CUST_NM%TYPE,        /*����                */
    v_Mob_No         IN OUT RTRE0022.MOB_NO%TYPE,     /*�޴�����ȣ            */
    v_Email_Addr     IN OUT RTRE0022.EMAIL_ADDR%TYPE, /*E-Mail�ּ�            */
    v_Bkey_Chk       IN RTRE0022.BKEY_CHK%TYPE,       /*ī��Ȯ�λ���          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Batch_Key      IN RTRE0022.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTRE0022.REG_ID%TYPE,         /*����� ID             */
    v_Res_Cd         IN RTRE0022.RES_CD%TYPE,         /* �����ڵ�*/
    v_Res_Msg        IN RTRE0022.RES_MSG%TYPE,        /* ����޽���*/
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN


    IF 0 = f_sRtre0022Count(v_Ccert_Day, v_Ccert_Seq) THEN

        IF 0 != f_InsertRtre0022(v_Ccert_Day, v_Ccert_Seq, v_Card_No, v_Expire_Ym, 
                                 v_Owner_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No, 
                                 v_Ccert_Id, v_Cust_No, v_Cust_Nm, v_Mob_No, 
                                 v_Email_Addr, v_Bkey_Chk, v_Cardcom_Cd, v_Batch_Key, 
                                 v_Reg_Id, v_ErrorText, v_Return_Message) THEN
            v_Return_Message := v_Return_Message;
                v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0022(v_Ccert_Day, v_Ccert_Seq, v_Card_No, v_Expire_Ym, 
                                     v_Owner_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No, 
                                     v_Ccert_Id, v_Cust_No, v_Cust_Nm, v_Mob_No, 
                                     v_Email_Addr, v_Bkey_Chk, v_Cardcom_Cd, v_Batch_Key, 
                                     v_Reg_Id, v_Res_Cd, v_Res_Msg, v_ErrorText) THEN
                v_Return_Message := 'ī������ ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0022(v_Ccert_Day, v_Ccert_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'ī������ ���� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.p_IUDRtre0022(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0022.p_IUDRtre0022(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0022;


  /*****************************************************************************
  --  ī������ ���� - ī������ ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0022CcertSeq RETURN NUMBER IS
    
    v_Ccert_Seq   RTRE0022.CCERT_SEQ%TYPE DEFAULT 0;   /*ī����������          */
  BEGIN

    SELECT  SEQ_RTRE0022CCERT_SEQ.NEXTVAL CCERT_SEQ
    INTO    v_Ccert_Seq
    FROM    DUAL;

    RETURN v_Ccert_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0022CcertSeq;
  
  
  /*****************************************************************************
  --  ī������ ����  - Ư���� ī�� ���� ���� ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0022CcertChkSeq(
    v_Ccert_Day      IN RTRE0022.CCERT_DAY%TYPE,      /*ī����������          */
    v_Cardcom_Cd     IN RTRE0022.CARDCOM_CD%TYPE,     /*ī����ڵ�            */
    v_Card_No        IN RTRE0022.CARD_NO%TYPE         /*ī���ȣ              */
    ) RETURN NUMBER IS
    
    v_Ccert_Seq RTRE0022.CCERT_SEQ%TYPE DEFAULT NULL; /*ī����������          */
  BEGIN

    SELECT  CCERT_SEQ
    INTO    v_Ccert_Seq
    FROM    RTRE0022
    WHERE   CCERT_DAY  = v_Ccert_Day
    AND     CARDCOM_CD = v_Cardcom_Cd
    AND     CARD_NO    = v_Card_No
    AND     BKEY_CHK   = 'Y'  /*ī��Ȯ�λ���(Y,N) */
    AND     ROWNUM     = 1;
    
    RETURN v_Ccert_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0022CcertChkSeq;


END Pkg_Rtre0022;
/
