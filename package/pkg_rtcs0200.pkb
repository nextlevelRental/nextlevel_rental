CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0200 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0200
   PURPOSE   [CS] â�� ������ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-10-26  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] â�� ������ Count
  *****************************************************************************/
  FUNCTION f_sRtcs0200Count(
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE          /*â���ڵ�            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0200
    WHERE   WAREH_CD       = v_Wareh_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0200Count;

  /*****************************************************************************
  -- [CS] â�� ������ Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.WAREH_CD,                  /*â���ڵ�            */
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
    FROM    RTCS0200 A
    WHERE   A.WAREH_CD         = DECODE(v_Wareh_Cd       , NULL, A.WAREH_CD        , v_Wareh_Cd)
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


  END p_sRtcs0200;

  /*****************************************************************************
  -- [CS] â�� ������ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0200 (
            WAREH_CD,
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

  END f_InsertRtcs0200;

  /*****************************************************************************
  -- [CS] â�� ������ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0200
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
    WHERE  WAREH_CD         = v_Wareh_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0200;

  /*****************************************************************************
  -- [CS] â�� ������ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0200 (
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTCS0200
    WHERE  WAREH_CD         = v_Wareh_Cd;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.f_DeleteRtcs0200(2)', 'â���ڵ�', v_Wareh_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.f_DeleteRtcs0200(2)', '����� ID', v_Reg_Id);


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0200;

  /*****************************************************************************
  -- [CS] â�� ������ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0200 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Begday         IN RTCS0200.BEGDAY%TYPE,         /*����������            */
    v_Endday         IN RTCS0200.ENDDAY%TYPE,         /*����������            */
    v_Bld_Mng_No     IN RTCS0200.BLD_MNG_NO%TYPE,     /*�����ȣ PK           */
    v_Pos_Cd         IN RTCS0200.POS_CD%TYPE,         /*�����ȣ              */
    v_Addr1          IN RTCS0200.ADDR1%TYPE,          /*�ּ�                  */
    v_Addr2          IN RTCS0200.ADDR2%TYPE,          /*���ּ�              */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȣ��ȣ              */
    v_Fax_No         IN RTCS0200.FAX_NO%TYPE,         /*�ѽ���ȣ              */
    v_Mob_No         IN RTCS0200.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCS0200.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Endday1        RTCS0200.ENDDAY%TYPE;            /*����������            */
    v_Wrh_Seq        RTCS0201.WRH_SEQ%TYPE;

  BEGIN

    -- �ʼ���: â���ڵ�, ����� ID
    IF (TRIM(v_Wareh_Cd) IS NULL) THEN
        v_Return_Message := 'â���ڵ�('||v_Wareh_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

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
        ELSIF v_Comm_Dvsn = 'I' AND SUBSTR(v_Begday,1,6) <> SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6) THEN
            v_Return_Message := '����������('||v_Begday||') : ����� �Է� �����մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: ����������
        IF (TRIM(v_Endday) IS NULL) THEN
            v_Return_Message := '����������('||v_Endday||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

--        IF v_Use_Yn = 'Y' AND v_Endday <> '99991231' THEN
--            v_Return_Message := '����������('||v_Endday||') : ��뿩�ΰ� Y�̸� 99991231�ϸ� �����մϴ�!';
--            RAISE e_Error;
--        ELSIF v_Use_Yn = 'N' AND v_Endday <> TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
--            v_Return_Message := '����������('||v_Endday||') : ��뿩�ΰ� N�̸� ���ϸ� �����մϴ�!';
--            RAISE e_Error;
--        END IF;

        IF v_Use_Yn = 'Y' THEN
            v_Endday1 := '99991231';
        ELSE
            v_Endday1 := TO_CHAR(SYSDATE, 'YYYYMMDD');
        END IF;

        -- �ʼ���: �����ȣ
        IF (TRIM(v_Tel_No) IS NULL) THEN
            v_Return_Message := '�����ȣ('||v_Pos_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: �ּ�
        IF (TRIM(v_Addr1) IS NULL) THEN
            v_Return_Message := '�ּ�('||v_Addr1||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: ���ּ�
        IF (TRIM(v_Addr2) IS NULL) THEN
            v_Return_Message := '���ּ�('||v_Addr1||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: ��ȭ��ȣ
        IF (TRIM(v_Tel_No) IS NULL) THEN
            v_Return_Message := '��ȭ��ȣ('||v_Tel_No||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �ʼ���: ��뿩��
        IF (TRIM(v_Use_Yn) IS NULL) THEN
            v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;


        IF v_Comm_Dvsn = 'I' THEN

            IF v_Use_Yn <> 'Y' THEN
                v_Return_Message := '��뿩��('||v_Use_Yn||') : �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;

            IF 0 != f_sRtcs0200Count( v_Wareh_Cd ) THEN
                v_Return_Message := 'â���ڵ�('||v_Wareh_Cd||') : �̹� ��ϵǾ� �ִ� �ڵ��Դϴ�. �ٸ� ��ȣ�� �Է��ϼ���.!';
                RAISE e_Error;
            END IF;

            IF 0 != f_InsertRtcs0200( v_Wareh_Cd,   v_Wareh_Nm, v_Begday,   v_Endday1,
                                      v_Bld_Mng_No, v_Pos_Cd,   v_Addr1,    v_Addr2,
                                      v_Tel_No,     v_Fax_No,   v_Mob_No,   v_Use_Yn,
                                      v_Reg_Id,     v_ErrorText
                                    ) THEN
                v_Return_Message := '[CS] â�� ������ ��� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSE

            IF 0 = f_sRtcs0200Count( v_Wareh_Cd ) THEN
                v_Return_Message := 'â���ڵ�('||v_Wareh_Cd||') : �������� �ʴ� â���ڵ��Դϴ�.!';
                RAISE e_Error;
            END IF;

            -- ������� check(WEB���� ����)
            IF 0 != f_UpdateRtcs0200( v_Wareh_Cd,   v_Wareh_Nm, v_Begday,   v_Endday1,
                                      v_Bld_Mng_No, v_Pos_Cd,   v_Addr1,    v_Addr2,
                                      v_Tel_No,     v_Fax_No,   v_Mob_No,   v_Use_Yn,
                                      v_Reg_Id,     v_ErrorText
                                    ) THEN
                v_Return_Message := '[CS] â�� ������ ���� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;

        -- â�� ����Ÿ ��� �� ����  �� �����̷µ�  ���� ����
        v_Wrh_Seq := Pkg_Rtcs0201.f_sRtcs0201TotCount( v_Wareh_Cd ) + 1;

        IF 0 != Pkg_Rtcs0201.f_InsertRtcs0201( v_Wareh_Cd,   v_Wrh_Seq,  v_Wareh_Nm, v_Begday,   v_Endday1,
                                  v_Bld_Mng_No, v_Pos_Cd,   v_Addr1,    v_Addr2,
                                  v_Tel_No,     v_Fax_No,   v_Mob_No,   v_Use_Yn,
                                  v_Reg_Id,     v_ErrorText
                                 ) THEN
            v_Return_Message := '[CS] â�� ������ �����̷� ��� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;


    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtcs0200( v_Wareh_Cd, v_Reg_Id, v_ErrorText ) THEN
            v_Return_Message := '[CS] â�� ������ ���� ����!!!'||'-'||v_Errortext;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.p_IUDRtcs0200(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.p_IUDRtcs0200(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0200;

  /*****************************************************************************
  -- â�� ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcs0200WareHouse (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE,       /*â���ڵ�              */
    v_Wareh_Nm       IN RTCS0200.WAREH_NM%TYPE,       /*â���                */
    v_Tel_No         IN RTCS0200.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Use_Yn         IN RTCS0200.USE_YN%TYPE,         /*��뿩��              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Cnt   NUMBER;

  BEGIN

--    -- �ʼ���: â���ڵ�, â���, ��ȭ��ȣ ������ �ϳ��� �ʼ�
--    IF  (TRIM(v_Wareh_Cd) IS NULL)
--    AND (TRIM(v_Wareh_Nm) IS NULL)
--    AND (TRIM(v_Tel_No) IS NULL) THEN
--        v_Return_Message := 'â���ڵ�, â���, ��ȭ��ȣ ������ �ϳ��� �ʼ��� ó���� �Ұ� �մϴ�!';
--        RAISE e_Error;
--    END IF;


    OPEN Ref_Cursor FOR
    SELECT  A.WAREH_CD,                  /*â���ڵ�            */
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
    FROM    RTCS0200 A
    WHERE   A.WAREH_CD  = DECODE(v_Wareh_Cd, NULL, A.WAREH_CD, v_Wareh_Cd)
    AND     A.WAREH_NM  LIKE '%'||v_Wareh_Nm||'%'
    AND     A.TEL_NO    LIKE '%'||v_Tel_No||'%'
    AND     A.USE_YN    = DECODE(v_Use_Yn, NULL, A.USE_YN, v_Use_Yn);


--    v_Success_code := 0;
--    v_Return_Message := '���������� ��ȸ�� �Ǿ����ϴ�';
--    v_ErrorText := '';
--    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.p_sRtcs0200WareHouse(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0200.p_sRtcs0200WareHouse(2)', v_ErrorText, v_Return_Message);

  END p_sRtcs0200WareHouse;

  /*****************************************************************************
  -- [CS] â�� ������ ��Ī ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcs0200WarehNm(
    v_Wareh_Cd       IN RTCS0200.WAREH_CD%TYPE          /*â���ڵ�            */
    ) RETURN VARCHAR IS
    
    v_Wareh_Nm   VARCHAR2(50)    DEFAULT NULL;
    
  BEGIN

    SELECT  WAREH_NM
    INTO    v_Wareh_Nm
    FROM    RTCS0200
    WHERE   WAREH_CD       = v_Wareh_Cd;

    RETURN v_Wareh_Nm;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN v_Wareh_Nm;

  END f_sRtcs0200WarehNm;

END Pkg_Rtcs0200;
/
