CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0201 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0201
   PURPOSE   [CS] â�� ������ �����̷� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0201Count(
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,         /*â���ڵ�            */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE           /*â�������        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0201
    WHERE   WAREH_CD       = v_Wareh_Cd
    AND     WRH_SEQ        = v_Wrh_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0201Count;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0201 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Wareh_Nm       IN RTCS0201.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0201.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0201.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0201.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0201.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0201.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0201.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0201.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0201.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0201.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.WAREH_CD,                  /*â���ڵ�            */
            A.WRH_SEQ,                   /*â�������        */
            A.WAREH_NM,                  /*â���              */
            A.BEGDAY,                    /*����������          */
            A.ENDDAY,                    /*����������          */
            A.BLD_MNG_NO,                /*�����ȣ PK         */
            A.POS_CD,                    /*�����ȣ            */
            A.ADDR1,                     /*�ּ�                */
            A.ADDR2,                     /*���ּ�            */
            A.TEL_NO,                    /*��ȣ��ȣ            */
            A.FAX_NO,                    /*�ѽ���ȣ            */
            A.MOB_NO,                    /*�޴�����ȣ          */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTCS0201 A
    WHERE   A.WAREH_CD         = DECODE(v_Wareh_Cd       , NULL, A.WAREH_CD        , v_Wareh_Cd)
    AND     A.WRH_SEQ          = DECODE(v_Wrh_Seq        , NULL, A.WRH_SEQ         , v_Wrh_Seq)
    AND     A.WAREH_NM         = DECODE(v_Wareh_Nm       , NULL, A.WAREH_NM        , v_Wareh_Nm)
    AND     A.BEGDAY           = DECODE(v_Begday         , NULL, A.BEGDAY          , v_Begday)
    AND     A.ENDDAY           = DECODE(v_Endday         , NULL, A.ENDDAY          , v_Endday)
    AND     A.BLD_MNG_NO       = DECODE(v_Bld_Mng_No     , NULL, A.BLD_MNG_NO      , v_Bld_Mng_No)
    AND     A.POS_CD           = DECODE(v_Pos_Cd         , NULL, A.POS_CD          , v_Pos_Cd)
    AND     A.ADDR1            = DECODE(v_Addr1          , NULL, A.ADDR1           , v_Addr1)
    AND     A.ADDR2            = DECODE(v_Addr2          , NULL, A.ADDR2           , v_Addr2)
    AND     A.TEL_NO           = DECODE(v_Tel_No         , NULL, A.TEL_NO          , v_Tel_No)
    AND     A.FAX_NO           = DECODE(v_Fax_No         , NULL, A.FAX_NO          , v_Fax_No)
    AND     A.MOB_NO           = DECODE(v_Mob_No         , NULL, A.MOB_NO          , v_Mob_No)
    AND     A.USE_YN           = DECODE(v_Use_Yn         , NULL, A.USE_YN          , v_Use_Yn)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtcs0201;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0201 (
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Wareh_Nm       IN RTCS0201.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0201.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0201.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0201.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0201.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0201.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0201.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0201.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0201.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0201.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0201 (
            WAREH_CD,
            WRH_SEQ,
            WAREH_NM,
            BEGDAY,
            ENDDAY,
            BLD_MNG_NO,
            POS_CD,
            ADDR1,
            ADDR2,
            TEL_NO,
            FAX_NO,
            MOB_NO,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Wareh_Cd,
            v_Wrh_Seq,
            v_Wareh_Nm,
            v_Begday,
            v_Endday,
            v_Bld_Mng_No,
            v_Pos_Cd,
            v_Addr1,
            v_Addr2,
            v_Tel_No,
            v_Fax_No,
            v_Mob_No,
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

  END f_InsertRtcs0201;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0201 (
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Wareh_Nm       IN RTCS0201.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0201.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0201.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0201.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0201.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0201.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0201.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0201.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0201.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0201.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0201
    SET    WAREH_NM         = v_Wareh_Nm,
           BEGDAY           = v_Begday,
           ENDDAY           = v_Endday,
           BLD_MNG_NO       = v_Bld_Mng_No,
           POS_CD           = v_Pos_Cd,
           ADDR1            = v_Addr1,
           ADDR2            = v_Addr2,
           TEL_NO           = v_Tel_No,
           FAX_NO           = v_Fax_No,
           MOB_NO           = v_Mob_No,
           USE_YN           = v_Use_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE 
    WHERE  WAREH_CD         = v_Wareh_Cd
    AND    WRH_SEQ          = v_Wrh_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0201;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0201 (
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTCS0201
    WHERE  WAREH_CD         = v_Wareh_Cd
    AND    WRH_SEQ          = v_Wrh_Seq;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0201.f_DeleteRtcs0201(2)', 'â���ڵ�', v_Wareh_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0201.f_DeleteRtcs0201(2)', 'â�������', v_Wrh_Seq);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0201.f_DeleteRtcs0201(2)', '����� ID', v_Reg_Id);


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0201;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0201 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wrh_Seq        IN RTCS0201.WRH_SEQ%TYPE,        /*â�������          */
    v_Wareh_Nm       IN RTCS0201.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0201.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0201.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0201.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0201.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0201.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0201.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0201.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0201.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0201.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0201.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0201.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: â���ڵ�, â�������, ����� ID
    IF (TRIM(v_Wareh_Cd) IS NULL) THEN
        v_Return_Message := 'â���ڵ�('||v_Wareh_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Wrh_Seq) IS NULL) THEN
        v_Return_Message := 'â�������('||v_Wrh_Seq||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ʼ���: ����� ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        -- �ʼ���: â���
        IF (TRIM(v_Wareh_Nm) IS NULL) THEN
            v_Return_Message := 'â���('||v_Wareh_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: ����������
        IF (TRIM(v_Begday) IS NULL) THEN
            v_Return_Message := '����������('||v_Begday||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: ����������
        IF (TRIM(v_Endday) IS NULL) THEN
            v_Return_Message := '����������('||v_Endday||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: ��ȭ��ȣ
        IF (TRIM(v_Tel_No) IS NULL) THEN
            v_Return_Message := '��ȭ��ȣ('||v_Tel_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;


        IF v_Comm_Dvsn = 'I' THEN
            IF 0 != f_InsertRtcs0201( v_Wareh_Cd,   v_Wrh_Seq,  v_Wareh_Nm, v_Begday,   v_Endday,
                                      v_Bld_Mng_No, v_Pos_Cd,   v_Addr1,    v_Addr2,
                                      v_Tel_No,     v_Fax_No,   v_Mob_No,   v_Use_Yn,
                                      v_Reg_Id,     v_ErrorText            
                                     ) THEN
                v_Return_Message := '[CS] â�� ������ �����̷� ��� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
        ELSE

            IF 0 != f_UpdateRtcs0201( v_Wareh_Cd,   v_Wrh_Seq,  v_Wareh_Nm, v_Begday,   v_Endday,
                                      v_Bld_Mng_No, v_Pos_Cd,   v_Addr1,    v_Addr2,
                                      v_Tel_No,     v_Fax_No,   v_Mob_No,   v_Use_Yn,
                                      v_Reg_Id,     v_ErrorText            
                                     ) THEN
                v_Return_Message := '[CS] â�� ������ �����̷� ���� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
        END  IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtcs0201( v_Wareh_Cd, v_Wrh_Seq, v_Reg_Id, v_ErrorText ) THEN
            v_Return_Message := '[CS] â�� ������ �����̷� ���� ����!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0201.p_IUDRtcs0201(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0201.p_IUDRtcs0201(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0201;

  /*****************************************************************************
  -- â�� �����̷� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0201WareHistory (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Cnt   NUMBER;

  BEGIN

    
    OPEN Ref_Cursor FOR
    SELECT  A.WAREH_CD,                  /*â���ڵ�            */
            A.WRH_SEQ,                   /*â�������        */
            A.WAREH_NM,                  /*â���              */
            A.BEGDAY,                    /*����������          */
            A.ENDDAY,                    /*����������          */
            A.BLD_MNG_NO,                /*�����ȣ PK         */
            A.POS_CD,                    /*�����ȣ            */
            A.ADDR1,                     /*�ּ�                */
            A.ADDR2,                     /*���ּ�            */
            A.TEL_NO,                    /*��ȣ��ȣ            */
            A.FAX_NO,                    /*�ѽ���ȣ            */
            A.MOB_NO,                    /*�޴�����ȣ          */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTCS0201 A
    WHERE   A.WAREH_CD = v_Wareh_Cd
    ORDER BY WRH_SEQ DESC;

--
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0201.p_sRtcs0201WareHistory(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0201.p_sRtcs0201WareHistory(2)', v_ErrorText, v_Return_Message);

  END p_sRtcs0201WareHistory;

  /*****************************************************************************
  -- [CS] â�� ������ �����̷� â���ڵ庰 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0201TotCount(
    v_Wareh_Cd       IN RTCS0201.WAREH_CD%TYPE          /*â���ڵ�            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL(COUNT(*), 0)
    INTO    v_curr_cunt
    FROM    RTCS0201
    WHERE   WAREH_CD       = v_Wareh_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0201TotCount;

END Pkg_Rtcs0201;
/
