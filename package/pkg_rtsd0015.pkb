CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0015 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0015
   PURPOSE   WINTER ���μ���(����,��ü) ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-28  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0015Count(
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,            /*�����̾�����      */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,          /*�󼼼���          */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE            /*Ÿ�̾��          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0015
    WHERE   PS_CD          = v_Ps_Cd
    AND     PRS_DCD        = v_Prs_Dcd
    AND     PERIOD_CD      = v_Period_Cd
    AND     CNT_CD         = v_Cnt_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0015Count;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0015 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PS_CD,                     /*�����̾�����      */
            A.PRS_DCD,                   /*�󼼼���          */
            A.PERIOD_CD,                 /*�Ⱓ�ڵ�            */
            A.CNT_CD,                    /*Ÿ�̾��          */
            A.SERV_CNT,                  /*����Ƚ��          */
            A.SERV_AMT,                  /*�߰���Ż��          */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0015 A
    WHERE   A.PS_CD            = DECODE(v_Ps_Cd          , NULL, A.PS_CD           , v_Ps_Cd)
    AND     A.PRS_DCD          = DECODE(v_Prs_Dcd        , NULL, A.PRS_DCD         , v_Prs_Dcd)
    AND     A.PERIOD_CD        = DECODE(v_Period_Cd      , NULL, A.PERIOD_CD       , v_Period_Cd)
    AND     A.CNT_CD           = DECODE(v_Cnt_Cd         , NULL, A.CNT_CD          , v_Cnt_Cd)
    AND     A.SERV_CNT         = DECODE(v_Serv_Cnt       , NULL, A.SERV_CNT        , v_Serv_Cnt)
    AND     A.SERV_AMT         = DECODE(v_Serv_Amt       , NULL, A.SERV_AMT        , v_Serv_Amt)
    AND     A.USE_YN           = DECODE(v_Use_Yn         , NULL, A.USE_YN          , v_Use_Yn)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtsd0015;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0015 (
            PS_CD,
            PRS_DCD,
            PERIOD_CD,
            CNT_CD,
            SERV_CNT,
            SERV_AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ps_Cd,
            v_Prs_Dcd,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Serv_Cnt,
            v_Serv_Amt,
            v_Use_Yn,
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

  END f_InsertRtsd0015;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0015
    SET    SERV_CNT         = v_Serv_Cnt,
           SERV_AMT         = v_Serv_Amt,
           USE_YN           = v_Use_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE 
    WHERE  PS_CD            = v_Ps_Cd
    AND    PRS_DCD          = v_Prs_Dcd
    AND    PERIOD_CD        = v_Period_Cd
    AND    CNT_CD           = v_Cnt_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0015;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0015 (
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTSD0015
    WHERE  PS_CD            = v_Ps_Cd
    AND    PRS_DCD          = v_Prs_Dcd
    AND    PERIOD_CD        = v_Period_Cd
    AND    CNT_CD           = v_Cnt_Cd;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0015.f_DeleteRtsd0015(1)', '�����̾�����', v_Ps_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0015.f_DeleteRtsd0015(1)', '�󼼼���', v_Prs_Dcd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0015.f_DeleteRtsd0015(1)', '�Ⱓ�ڵ�', v_Period_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0015.f_DeleteRtsd0015(1)', 'Ÿ�̾��', v_Cnt_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0015.f_DeleteRtsd0015(1)', '����� ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0015;

  /*****************************************************************************
  -- WINTER ���μ���(����,��ü) ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0015 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ps_Cd          IN RTSD0015.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0015.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0015.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0015.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0015.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0015.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0015.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0015.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: �����̾�����, �󼼼���, �Ⱓ�ڵ�, Ÿ�̾��, ����� ID
    IF (TRIM(v_Ps_Cd) IS NULL)  THEN
        v_Return_Message := '�����̾�����('||v_Ps_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Prs_Dcd) IS NULL)  THEN
        v_Return_Message := '�󼼼���('||v_Prs_Dcd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Period_Cd) IS NULL)  THEN
        v_Return_Message := '�Ⱓ�ڵ�('||v_Period_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL)  THEN
        v_Return_Message := 'Ÿ�̾��('||v_Cnt_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        IF v_Comm_Dvsn = 'I' THEN
            
            IF 0 != f_InsertRtsd0015( v_Ps_Cd,  v_Prs_Dcd,  v_Period_Cd,    v_Cnt_Cd,
                                      v_Serv_Cnt,   v_Serv_Amt, v_Use_Yn,
                                      v_Reg_Id, v_ErrorText
                                    ) THEN
                v_Return_Message := 'WINTER ���μ���(����,��ü) ���� ��� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE

            IF 0 != f_UpdateRtsd0015( v_Ps_Cd,  v_Prs_Dcd,  v_Period_Cd,    v_Cnt_Cd,
                                      v_Serv_Cnt,   v_Serv_Amt, v_Use_Yn,
                                      v_Reg_Id, v_ErrorText
                                    ) THEN
                v_Return_Message := 'WINTER ���μ���(����,��ü) ���� ���� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
                
        END IF;    

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtsd0015( v_Ps_Cd,  v_Prs_Dcd,  v_Period_Cd,    v_Cnt_Cd,
                                  v_Reg_Id, v_ErrorText
                                ) THEN
            v_Return_Message := 'WINTER ���μ���(����,��ü) ���� ���� ����!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0015.p_IUDRtsd0015(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0015.p_IUDRtsd0015(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0015;

END Pkg_Rtsd0015;
/
