CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0113 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0113
   PURPOSE   �Ǹ������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
   1.1        2016-04-21  �̿���           ä�� ��/�ߺз� �׸� �߰�
   1.1.1      2016-12-06  wjim             [20161206_02] '�ݼ���(�ƿ��ٿ��)' ����ڱ׷� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �Ǹ������� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0113Count(
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE         /*�Ǹ��ι�ȣ          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0113
    WHERE   ORD_AGENT = v_Ord_Agent;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0113Count;

  /*****************************************************************************
  -- �Ǹ������� Select
  -- �����̷�: 2016-04-21 �̿���, ä�� ��/�ߺз� �׸� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtsd0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE       /*����ó                */    
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_AGENT,                 /*�Ǹ��ι�ȣ          */
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
    WHERE   A.ORD_AGENT LIKE v_Ord_Agent||'%'
    AND     A.ORG_AGNM  LIKE v_Org_Agnm||'%'
    AND     A.ORG_AGTEL LIKE REPLACE(v_Org_Agtel,'-','')||'%'
    AND     A.USE_YN = 'Y';

  END p_sRtsd0113;

  /*****************************************************************************
  -- �Ǹ������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*����ó                */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*ä�α���              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*�����ڵ�              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*�������              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*����                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0113 (
            ORD_AGENT,
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
            CHG_DT,
            CHAN_LCLS_CD,
            CHAN_MCLS_CD,
            RENTAL_GROUP,
            RENTAL_OFFICE
            )
    VALUES  (
            v_Ord_Agent,
            v_Org_Agnm,
            v_Org_Agtel,
            v_Chan_Cd,
            v_Lifnr,
            v_Num,
            v_Sales_Group,
            v_Sales_Office,
            v_Tax_Rqcd,
            v_Use_Yn,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_chan_Lcls_Cd,
            v_chan_Mcls_Cd,
            v_Rental_Group,
            v_Rental_Office
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0113;

  /*****************************************************************************
  -- �Ǹ������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*����ó                */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*ä�α���              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*�����ڵ�              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*�������              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*����                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */      
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0113
    SET    ORG_AGNM      = v_Org_Agnm,
           ORG_AGTEL     = v_Org_Agtel,
           CHAN_CD       = v_Chan_Cd,
           LIFNR         = v_Lifnr,
           NUM           = v_Num,
           SALES_GROUP   = v_Sales_Group,
           SALES_OFFICE  = v_Sales_Office,
           TAX_RQCD      = v_Tax_Rqcd,
           USE_YN        = v_Use_Yn,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE,
           CHAN_LCLS_CD  = v_chan_Lcls_Cd,
           CHAN_MCLS_CD  = v_chan_Mcls_Cd,
           RENTAL_GROUP  = v_Rental_Group,
           RENTAL_OFFICE = v_Rental_Office
    WHERE  ORD_AGENT     = v_Ord_Agent;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0113;

  /*****************************************************************************
  -- �Ǹ������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0113 (
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0113
    SET    USE_YN    = 'Y',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ORD_AGENT = v_Ord_Agent;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0113;

  /*****************************************************************************
  -- �Ǹ������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0113 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Org_Agtel      IN RTSD0113.ORG_AGTEL%TYPE,      /*����ó                */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE,        /*ä�α���              */
    v_Lifnr          IN RTSD0113.LIFNR%TYPE,          /*�����ڵ�              */
    v_Num            IN RTSD0113.NUM%TYPE,            /*�������              */
    v_Sales_Group    IN RTSD0113.SALES_GROUP%TYPE,    /*����                  */
    v_Sales_Office   IN RTSD0113.SALES_OFFICE%TYPE,   /*����                  */
    v_Tax_Rqcd       IN RTSD0113.TAX_RQCD%TYPE,       /*���ݰ�꼭 ������   */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0113.REG_ID%TYPE,         /*����� ID             */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */
    v_Rental_Group   IN RTSD0113.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTSD0113.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */     
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: �Ǹ��ι�ȣ, �Ǹ��θ�,����ó, ��뿩��, ����� ID
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '�Ǹ��ι�ȣ('||v_Reg_Id||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Org_Agnm) IS NULL THEN
        v_Return_Message := '�Ǹ��θ�('||v_Org_Agnm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Org_Agtel) IS NULL THEN
        v_Return_Message := '����ó('||v_Org_Agtel||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL) OR (TRIM(v_Use_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0113Count(v_Ord_Agent) THEN

        IF 0 != f_InsertRtsd0113(v_Ord_Agent, v_Org_Agnm, v_Org_Agtel, v_Chan_Cd,
                                 v_Lifnr, v_Num, v_Sales_Group, v_Sales_Office,
                                 v_Tax_Rqcd, v_Use_Yn, v_Reg_Id, v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_Rental_Group, v_Rental_Office, v_ErrorText) THEN
            v_Return_Message := '�Ǹ������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtsd0113(v_Ord_Agent, v_Org_Agnm, v_Org_Agtel, v_Chan_Cd,
                                     v_Lifnr, v_Num, v_Sales_Group, v_Sales_Office,
                                     v_Tax_Rqcd, v_Use_Yn, v_Reg_Id, v_chan_Lcls_Cd, v_chan_Mcls_Cd, v_Rental_Group, v_Rental_Office, v_ErrorText) THEN
                v_Return_Message := '�Ǹ������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtsd0113(v_Ord_Agent, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�Ǹ������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- ���� �̷� ����
    IF 0 != Pkg_Rtsd0120.f_InsertRtsd0120(v_Ord_Agent, v_ErrorText) THEN
        v_Return_Message := '�Ǹ��� ���� ���� �̷� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0113.p_IUDRtsd0113(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0113.p_IUDRtsd0113(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0113;

  /*****************************************************************************
  -- �Ǹ������� Select - �Ǹ��� ���� ��ȸ �˾�
  *****************************************************************************/
  PROCEDURE p_sRtsd0113Popup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ����ڵ�            */
    v_Org_Agnm       IN RTSD0113.ORG_AGNM%TYPE,       /*�Ǹ��θ�              */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_Chan_Cd        IN RTSD0113.CHAN_CD%TYPE         /*ä������              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_AGENT                                                , /*�Ǹ����ڵ� */
            A.ORG_AGNM                                                 , /*�Ǹ��θ�   */
            A.ORG_AGTEL                                                , /*����ó     */
            A.CHAN_CD                                                  , /*ä�α���   */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S030', A.CHAN_CD) CHAN_NM, /*ä�θ�     */
            A.LIFNR                                                    , /*�����ڵ�   */
            A.NUM                                                      , /*�������   */
            A.SALES_GROUP                                              , /*����       */
            A.SALES_OFFICE                                             , /*����       */
            A.TAX_RQCD                                                 , /*���ݰ�꼭 ������ */
            A.USE_YN                                                     /*��뿩��   */
    FROM    RTSD0113 A
    WHERE   A.ORG_AGNM  LIKE '%'||v_Org_Agnm||'%'
    AND     A.ORD_AGENT = DECODE(v_Ord_Agent, NULL, A.ORD_AGENT, v_Ord_Agent)
    AND     A.USE_YN    = DECODE(v_Use_Yn   , NULL, A.USE_YN   , v_Use_Yn)
    AND     A.CHAN_CD   = DECODE(v_Chan_Cd  , NULL, A.CHAN_CD  , v_Chan_Cd)
    ORDER   BY A.NUM, A.ORD_AGENT;

  END p_sRtsd0113Popup;

  /*****************************************************************************
  -- �Ǹ������� Select - ���ѱ׷캰 ��ȸ
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
   1.1        2016-04-21  �̿���           ä�� ��/�ߺз� �׸� �߰�
   1.1.1      2016-12-06  wjim             [20161206_02] '�ݼ���(�ƿ��ٿ��)' ����ڱ׷� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtsd0113UserGrp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_User_Grp       IN RTCM0001.USER_GRP%TYPE        /*���ѱ׷�              */
    ) IS
                                                                                                                                                                                                                       
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  CD    ,                                   /*�Ǹ����ڵ�            */
            CD_NM ,                                   /*�Ǹ��θ�              */
            TEL   ,                                   /*����ó                */
            CHAN_CD
    FROM    (
       --USER_GRP:'01' ���������� - ����,���¸�,B2B
       SELECT  A.ORD_AGENT CD    ,                    /*�Ǹ����ڵ�            */
               A.ORG_AGNM  CD_NM ,                    /*�Ǹ��θ�              */
               A.ORG_AGTEL TEL   ,                    /*����ó                */
               A.NUM       NUM   ,                    /*�������              */
               A.CHAN_CD
       FROM    RTSD0113 A
       WHERE   A.CHAN_CD       IN ('03','04','06')
       AND     A.USE_YN         = 'Y'
       AND     TRIM(v_User_Grp) = '01'
       UNION ALL
       --USER_GRP:'02' �ݼ��� - ����,���¸�
       SELECT  A.ORD_AGENT CD    ,                    /*�Ǹ����ڵ�            */
               A.ORG_AGNM  CD_NM ,                    /*�Ǹ��θ�              */
               A.ORG_AGTEL TEL   ,                    /*����ó                */
               A.NUM       NUM   ,                    /*�������              */
               A.CHAN_CD
       FROM    RTSD0113 A
       WHERE   A.CHAN_CD       IN ('03','04','06')
       AND     A.USE_YN         = 'Y'
       AND     TRIM(v_User_Grp) IN ('02','13')        /*[20161206_02]         */
       UNION ALL
       --USER_GRP:'09' �湮�Ǹ� - ����
       SELECT  A.ORD_AGENT CD    ,                    /*�Ǹ����ڵ�            */
               A.ORG_AGNM  CD_NM ,                    /*�Ǹ��θ�              */
               A.ORG_AGTEL TEL   ,                    /*����ó                */
               A.NUM       NUM   ,                    /*�������              */
               A.CHAN_CD
       FROM    RTSD0113 A
       WHERE   A.CHAN_CD        = '03'
       AND     A.USE_YN         = 'Y'
       AND     TRIM(v_User_Grp) = '09'
    )
    ORDER   BY NUM, CD;

  END p_sRtsd0113UserGrp;

  /*****************************************************************************
  -- �Ǹ������� Select - �Ǹ��� ���
  *****************************************************************************/
  PROCEDURE p_sRtsd0113List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE,         /*��뿩��              */
    v_chan_Lcls_Cd   IN RTSD0113.CHAN_LCLS_CD%TYPE,   /* ä�� ��з�          */
    v_chan_Mcls_Cd   IN RTSD0113.CHAN_MCLS_CD%TYPE,   /* ä�� �ߺз�          */
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP      IN VARCHAR2                      /* �α��� ����� �׷� */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    
    SELECT  A.ORD_AGENT,                                                   /*�Ǹ��ι�ȣ          */
            A.ORG_AGNM,                                                    /*�Ǹ��θ�            */
            A.ORG_AGTEL,                                                   /*����ó              */
            A.CHAN_CD,                                                     /*ä�α���            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S030', A.CHAN_CD) CHAN_NM,   /*ä��                */
            A.LIFNR,                                                       /*�����ڵ�            */
            A.NUM,                                                         /*�������            */
            A.SALES_GROUP,                                                 /*�����ڵ�            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.SALES_GROUP) SG_NM, /*����                */
            A.SALES_OFFICE,                                                /*�����ڵ�            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SO_NM,/*����                */
            A.TAX_RQCD,                                                    /*��꼭 ������ �ڵ�*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S078', A.TAX_RQCD) TAX_RQNM, /*���ݰ�꼭 ������ */
            A.USE_YN,                                                      /*��뿩�� �ڵ�       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_NM,     /*��뿩��            */
            A.REG_ID,                                                      /*����� ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.REG_ID) AS REG_NM,            /*����� ��           */
            A.REG_DT,                                                      /*�����              */
            A.CHG_ID,                                                      /*������ ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(A.CHG_ID) AS CHG_NM,            /*������ ��           */
            A.CHG_DT,                                                      /*������              */
            A.CHAN_LCLS_CD,                                                /*ä�� ��з�         */
            A.CHAN_MCLS_CD,                                                /*ä�� �ߺз�         */
           A.RENTAL_GROUP,
           A.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',A.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*��Ż����           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',A.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*��Ż����           */
    FROM    RTSD0113 A
    WHERE   A.ORD_AGENT = DECODE(v_Ord_Agent   , NULL, A.ORD_AGENT   , v_Ord_Agent)
    AND     DECODE(v_chan_Lcls_Cd,NULL,' ',A.CHAN_LCLS_CD) = DECODE(v_chan_Lcls_Cd,NULL,' ',v_chan_Lcls_Cd)
    AND     DECODE(v_chan_Mcls_Cd,NULL,' ',A.CHAN_MCLS_CD) = DECODE(v_chan_Mcls_Cd,NULL,' ',v_chan_Mcls_Cd)     
    AND     A.USE_YN    = v_Use_Yn
    ;

  END p_sRtsd0113List;

  /*****************************************************************************
  -- �Ǹ������� -  �Ǹ��ι�ȣ ���� �ʵ����� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0113FieldValue(
    v_Ord_Agent      IN RTSD0113.ORD_AGENT%TYPE,        /*�Ǹ��ι�ȣ          */
    v_Field_Nm       IN VARCHAR,                        /*�ʵ��              */
    v_Use_Yn         IN RTSD0113.USE_YN%TYPE            /*��뿩��            */    
    ) RETURN VARCHAR2 IS
    v_Field_Value VARCHAR(2000);                         /*�ʵ尪              */
  BEGIN

    SELECT  TO_CHAR(DECODE(UPPER(TRIM(v_Field_Nm)), 
                           'ORG_AGNM',     ORG_AGNM,
                           'ORG_AGTEL',    ORG_AGTEL,
                           'CHAN_CD',      CHAN_CD,
                           'LIFNR',        LIFNR,
                           'NUM',          NUM,
                           'SALES_GROUP',  SALES_GROUP,
                           'SALES_OFFICE', SALES_OFFICE,
                           'TAX_RQCD',     TAX_RQCD,
                           'USE_YN',       USE_YN,
                           'REG_ID',       REG_ID,
                           'REG_DT',       REG_DT,
                           'CHG_ID',       CHG_ID,
                           'CHG_DT',       CHG_DT)) FIELD_VALUE                  
    INTO    v_Field_Value
    FROM    RTSD0113    
    WHERE   ORD_AGENT = v_Ord_Agent
    AND     USE_YN    LIKE v_Use_Yn||'%';

    RETURN v_Field_Value;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0113FieldValue;
  
END Pkg_Rtsd0113;
/
