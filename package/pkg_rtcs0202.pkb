CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0202 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0202
   PURPOSE   [CS] �븮�� - â�� �������� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0202Count(
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,        /*�븮���ڵ�          */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE            /*â�������        */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0202
    WHERE   AGENCY_CD      = v_Agency_Cd
    AND     AW_SEQ         = v_Aw_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0202Count;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0202 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*����������            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD,                 /*�븮���ڵ�          */
            A.AW_SEQ,                    /*â�������        */
            A.BEGDAY,                    /*����������          */
            A.ENDDAY,                    /*����������          */
            A.WAREH_CD,                  /*â���ڵ�            */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTCS0202 A
    WHERE   A.AGENCY_CD        = DECODE(v_Agency_Cd      , NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.AW_SEQ           = DECODE(v_Aw_Seq         , NULL, A.AW_SEQ          , v_Aw_Seq)
    AND     A.BEGDAY           = DECODE(v_Begday         , NULL, A.BEGDAY          , v_Begday)
    AND     A.ENDDAY           = DECODE(v_Endday         , NULL, A.ENDDAY          , v_Endday)
    AND     A.WAREH_CD         = DECODE(v_Wareh_Cd       , NULL, A.WAREH_CD        , v_Wareh_Cd)
    AND     A.USE_YN           = DECODE(v_Use_Yn         , NULL, A.USE_YN          , v_Use_Yn)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0202;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*����������            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0202 (
            AGENCY_CD,
            AW_SEQ,
            BEGDAY,
            ENDDAY,
            WAREH_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Agency_Cd,
            v_Aw_Seq,
            v_Begday,
            v_Endday,
            v_Wareh_Cd,
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

  END f_InsertRtcs0202;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*����������            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0202
    SET    BEGDAY           = v_Begday,
           ENDDAY           = v_Endday,
           WAREH_CD         = v_Wareh_Cd,
           USE_YN           = v_Use_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  AGENCY_CD        = v_Agency_Cd
    AND    AW_SEQ           = v_Aw_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0202;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0202 (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTCS0202
    WHERE  AGENCY_CD        = v_Agency_Cd
    AND    AW_SEQ           = v_Aw_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.f_DeleteRtcs0202(2)', '�븮���ڵ�', v_Agency_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.f_DeleteRtcs0202(2)', 'â�������', v_Aw_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.f_DeleteRtcs0202(2)', '����� ID', v_Reg_Id);


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0202;

  /*****************************************************************************
  -- [CS] �븮�� - â�� �������� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0202 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Begday         IN RTCS0202.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0202.ENDDAY%TYPE,         /*����������            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0202.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error     EXCEPTION;
    v_EndDay1   RTCS0202.ENDDAY%TYPE;
    v_Aw_Seq1   RTCS0202.AW_SEQ%TYPE;

  BEGIN

    -- �ʼ���: �븮���ڵ�, â�������, ����� ID
    IF (TRIM(v_Agency_Cd) IS NULL) OR 0 = Pkg_Rtsd0007.f_sRtsd0007Count( v_Agency_Cd ) THEN
        v_Return_Message := '�븮���ڵ�('||v_Agency_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ʼ���: â���ڵ�
    IF (TRIM(v_Wareh_Cd) IS NULL) OR 0 = Pkg_Rtcs0200.f_sRtcs0200Count( v_Wareh_Cd ) THEN
        v_Return_Message := 'â���ڵ�('||v_Wareh_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Aw_Seq) IS NULL) AND v_Comm_Dvsn = 'U' THEN
        v_Return_Message := 'â�������('||v_Aw_Seq||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ʼ���: ����� ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        -- �ʼ���: ����������
        IF (TRIM(v_Begday) IS NULL) THEN
            v_Return_Message := '����������('||v_Begday||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: ����������
        IF v_Comm_Dvsn = 'I' THEN
            v_Aw_Seq1 := f_sRtcs0202Use_Yn ( v_Agency_Cd, NULL, NULL, NULL ) + 1;
            v_Endday1 := '99991231';
        ELSE
            IF v_Use_Yn = 'N' THEN
                v_Aw_Seq1 := v_Aw_Seq;
                v_Endday1 := TO_CHAR(SYSDATE, 'YYYYMMDD');
            ELSE
                v_Aw_Seq1 := v_Aw_Seq;
                v_Endday1 := '99991231';
            END IF;
        END IF;

        IF v_Comm_Dvsn = 'I' THEN

            -- �űԸ� ������ ������ ���� �ִ��� check(������ΰ�)
            IF 0 != f_sRtcs0202Use_Yn( v_Agency_Cd,  NULL,  v_Wareh_Cd, 'Y'  ) THEN
                v_Return_Message := '������ ������ â�� ��ϵǾ� �ֽ��ϴ�.';
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

            IF 0 != f_InsertRtcs0202( v_Agency_Cd,  v_Aw_Seq1,
                                      v_Begday,     v_Endday1,   v_Wareh_Cd, 'Y',
                                      v_Reg_Id,     v_ErrorText
                                     ) THEN
                v_Return_Message := '[CS] �븮�� - â�� �������� ���� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE

            -- �����̸� ������ ������ ���� �ִ��� check(������ΰ�)
            IF 0 = f_sRtcs0202Use_Yn( v_Agency_Cd,  v_Aw_Seq,  v_Wareh_Cd,  NULL  ) THEN
                v_Return_Message := '������ �ڷᰡ �������� �ֽ��ϴ�.';
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            IF 0 != f_UpdateRtcs0202( v_Agency_Cd,  v_Aw_Seq1,
                                      v_Begday,     v_Endday1,   v_Wareh_Cd,    v_Use_Yn,
                                      v_Reg_Id,     v_ErrorText
                                     ) THEN
                v_Return_Message := '[CS] �븮�� - â�� �������� ��� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtcs0202( v_Agency_Cd, v_Aw_Seq, v_Reg_Id, v_ErrorText ) THEN
            v_Return_Message := '[CS] �븮�� - â�� �������� ���� ����!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.p_IUDRtcs0202(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.p_IUDRtcs0202(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0202;

  /*****************************************************************************
  -- �븮�� - â�� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0202AgencyWareh (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* �α���ID: �����׸� ���� ���� */
    v_LOGIN_GRP     IN VARCHAR2                       /* �α��� ����� �׷� */
    ) IS

    v_Cnt   NUMBER;
    e_Error EXCEPTION;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.*,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*��Ż����           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*��Ż����           */
      FROM (
    SELECT  A.AGENCY_CD,                 /*�븮���ڵ�          */
            A.AW_SEQ,                    /*â�������        */
            B.AGENCY_NM,                 /*�븮����            */
            A.WAREH_CD,                  /*â���ڵ�            */
            C.WAREH_NM,                  /*â���              */
            A.BEGDAY,                    /*����������          */
            A.ENDDAY,                    /*����������          */
            A.USE_YN                     /*��뿩��            */
    FROM    RTCS0202 A, RTSD0007 B, RTCS0200 C
    WHERE   A.AGENCY_CD = DECODE(v_Agency_Cd, NULL, A.AGENCY_CD, v_Agency_Cd)
    AND     A.WAREH_CD  = DECODE(v_Wareh_Cd,  NULL, A.WAREH_CD,  v_Wareh_Cd)
    AND     A.AGENCY_CD = B.AGENCY_CD
    AND     A.WAREH_CD  = C.WAREH_CD
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

--    v_Success_code := 0;
--    v_Return_Message := '���������� ��ȸ�Ǿ����ϴ�';
--    v_ErrorText := '';
--    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.p_sRtcs0202AgencyWareh(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.p_sRtcs0202AgencyWareh(2)', v_ErrorText, v_Return_Message);

  END p_sRtcs0202AgencyWareh;

  /*****************************************************************************
  -- [CS] �븮�� - â�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0202Use_Yn (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Aw_Seq         IN RTCS0202.AW_SEQ%TYPE,         /*â�������          */
    v_Wareh_Cd       IN RTCS0202.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Use_Yn         IN RTCS0202.USE_YN%TYPE          /*��뿩��              */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0202
    WHERE   AGENCY_CD = v_Agency_Cd
    AND     AW_SEQ    = DECODE(v_Aw_Seq, NULL, AW_SEQ, v_Aw_Seq)
    AND     WAREH_CD  = DECODE(v_Wareh_Cd, NULL, WAREH_CD, v_Wareh_Cd)
    AND     USE_YN    = DECODE(v_Use_Yn, NULL, USE_YN, v_Use_Yn);

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;


  END f_sRtcs0202Use_Yn;

  /*****************************************************************************
  -- �븮�� - â�� ���� ��ȸ(��밡�� â��)
  *****************************************************************************/
  PROCEDURE p_sRtcs0202UseAgencyWareh (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Cnt   NUMBER;
    e_Error EXCEPTION;

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.AGENCY_CD,                 /*�븮���ڵ�          */
            A.WAREH_CD,                  /*â���ڵ�            */
            B.WAREH_NM,                  /*â���              */
            B.ADDR1||' '||B.ADDR2 ADDR,  /*â���ּ�            */
            B.TEL_NO,                    /*â�� ��ȭ��ȣ       */
            B.MOB_NO                     /*â�� �޴�����ȣ     */
    FROM    RTCS0202 A, RTCS0200 B
    WHERE   A.AGENCY_CD = v_Agency_Cd
    AND     A.WAREH_CD  = B.WAREH_CD
    AND     A.USE_YN    = 'Y'
    AND     B.USE_YN    = 'Y';

--    v_Success_code := 0;
--    v_Return_Message := '���������� ��ȸ�Ǿ����ϴ�';
--    v_ErrorText := '';
--    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.p_sRtcs0202UseAgencyWareh(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0202.p_sRtcs0202UseAgencyWareh(2)', v_ErrorText, v_Return_Message);

  END p_sRtcs0202UseAgencyWareh;

  /*****************************************************************************
  -- [CS] �븮�� ��ȿ â�� �Ǽ� COUNT (���������)
  *****************************************************************************/
  FUNCTION f_sRtcs0202UseCntCheck (
    v_Agency_Cd      IN RTCS0202.AGENCY_CD%TYPE       /*�븮���ڵ�            */
    ) RETURN NUMBER IS

    v_Wareh_Cnt NUMBER DEFAULT 0;

  BEGIN

    SELECT  COUNT(*)
    INTO    v_Wareh_Cnt
    FROM    RTCS0202 A, RTCS0200 B
    WHERE   A.AGENCY_CD = v_Agency_Cd
    AND     A.WAREH_CD  = B.WAREH_CD
    AND     A.USE_YN    = 'Y'
    AND     B.USE_YN    = 'Y';

    RETURN v_Wareh_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0202UseCntCheck;

END Pkg_Rtcs0202;
/
