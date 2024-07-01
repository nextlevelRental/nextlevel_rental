CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0004 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0004
   PURPOSE   ����_�������� �԰� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-29  jemcarry         1. Created this package body.
   1.1        2017-11-06  wjim             [20171106_01] ���ı��� ����
                                           - ���, �԰� 
*******************************************************************************/

  /*****************************************************************************
  -- ����_�������� �԰� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0004Count(
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,      /*���                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,            /*���� ����           */
    v_Section_Width  IN RTSD0004.SECTION_WIDTH%TYPE,    /*�ܸ���              */
    v_Aspect_Ratio   IN RTSD0004.ASPECT_RATIO%TYPE,     /*�����              */
    v_Wheel_Inches   IN RTSD0004.WHEEL_INCHES%TYPE,     /*��ġ                */
    v_Ply_Rating     IN RTSD0004.PLY_RATING%TYPE        /*PR(����)            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0004
    WHERE   MODEL_CD       = v_Model_Cd
    AND     CONTENTS_CD    = v_Contents_Cd
    AND     FR_CD          = v_Fr_Cd
    AND     SECTION_WIDTH  = v_Section_Width
    AND     ASPECT_RATIO   = v_Aspect_Ratio
    AND     WHEEL_INCHES   = v_Wheel_Inches
    AND     PLY_RATING     = v_Ply_Rating;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0004Count;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-11-06  wjim             [20171106_01] ���ı��� ����
                                           - ��ġ > �� > ���� > PR �� �������� ����
  *****************************************************************************/
  PROCEDURE p_sRtsd0004 (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MODEL_CD,                  /*����                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)         AS MODEL_CD_NM,
            A.CONTENTS_CD,               /*���                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD)      AS CONTENTS_CD_NM,
            A.FR_CD,                     /*���� ����           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S004',A.FR_CD)            AS FR_CD_NM,
            A.SECTION_WIDTH,             /*�ܸ���              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S006',A.SECTION_WIDTH)    AS SECTION_WIDTH_NM,
            A.ASPECT_RATIO,              /*�����              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S007',A.ASPECT_RATIO)     AS ASPECT_RATIO_NM,
            A.WHEEL_INCHES,              /*��ġ                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S008',A.WHEEL_INCHES)     AS WHEEL_INCHES_NM,
            A.PLY_RATING,                /*PR(����)            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S009',A.PLY_RATING)       AS PLY_RATING_NM,
            A.WHEEL_QTY,                 /*������              */
            A.WHEEL_LIMIT_QTY,           /*�������� ������     */
            A.CLASS_CD,                  /*�����з�            */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id)
    ORDER   BY TO_NUMBER(A.WHEEL_INCHES), TO_NUMBER(SECTION_WIDTH), TO_NUMBER(DECODE(ASPECT_RATIO,'Z',0,ASPECT_RATIO)), TO_NUMBER(PLY_RATING) --[20171106_01]
    ;

  END p_sRtsd0004;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0004 (
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0004 (
            MODEL_CD,
            CONTENTS_CD,
            FR_CD,
            SECTION_WIDTH,
            ASPECT_RATIO,
            WHEEL_INCHES,
            PLY_RATING,
            WHEEL_QTY,
            WHEEL_LIMIT_QTY,
            CLASS_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Model_Cd,
            v_Contents_Cd,
            v_Fr_Cd,
            v_Section_Width,
            v_Aspect_Ratio,
            v_Wheel_Inches,
            v_Ply_Rating,
            v_Wheel_Qty,
            v_Wheel_Limit_Qty,
            v_Class_Cd,
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

  END f_InsertRtsd0004;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0004 (
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0004
    SET    WHEEL_QTY        = v_Wheel_Qty,
           WHEEL_LIMIT_QTY  = v_Wheel_Limit_Qty,
           CLASS_CD         = v_Class_Cd,
           USE_YN           = v_Use_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  MODEL_CD         = v_Model_Cd
    AND    CONTENTS_CD      = v_Contents_Cd
    AND    FR_CD            = v_Fr_Cd
    AND    SECTION_WIDTH    = v_Section_Width
    AND    ASPECT_RATIO     = v_Aspect_Ratio
    AND    WHEEL_INCHES     = v_Wheel_Inches
    AND    PLY_RATING       = v_Ply_Rating;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0004;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0004 (
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,       /*����                  */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,    /*���                  */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,          /*���� ����             */
    v_Section_Width  IN RTSD0004.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0004.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0004.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0004.PLY_RATING%TYPE,     /*PR(����)              */
    v_Reg_Id         IN RTSD0004.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0004
    SET    USE_YN        = 'N',
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE
    WHERE  MODEL_CD      = v_Model_Cd
    AND    CONTENTS_CD   = v_Contents_Cd
    AND    FR_CD         = v_Fr_Cd
    AND    SECTION_WIDTH = v_Section_Width
    AND    ASPECT_RATIO  = v_Aspect_Ratio
    AND    WHEEL_INCHES  = v_Wheel_Inches
    AND    PLY_RATING    = v_Ply_Rating;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0004;

  /*****************************************************************************
  -- ����_�������� �԰� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0004 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE,          /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ���� ,��� ,���� ���� ,�ܸ��� ,����� ,��ġ ,PR(����), ��뿩�� ,����� ID
    IF TRIM(v_Model_Cd) IS NULL THEN
        v_Return_Message := '����('||v_Model_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Contents_Cd) IS NULL THEN
        v_Return_Message := '���('||v_Contents_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Fr_Cd) IS NULL THEN
        v_Return_Message := '���� ����('||v_Fr_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Section_Width) IS NULL THEN
        v_Return_Message := '�ܸ���('||v_Section_Width||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Aspect_Ratio) IS NULL THEN
        v_Return_Message := '�����('||v_Aspect_Ratio||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Wheel_Inches) IS NULL THEN
        v_Return_Message := '��ġ('||v_Wheel_Inches||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ply_Rating) IS NULL THEN
        v_Return_Message := 'PR(����)('||v_Ply_Rating||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0004Count(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Section_Width,
                            v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating) THEN

        IF 0 != f_InsertRtsd0004(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Section_Width,
                                 v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, v_Wheel_Qty,
                                 v_Wheel_Limit_Qty, v_Class_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '����_�������� �԰� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0004(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Section_Width,
                                     v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, v_Wheel_Qty,
                                     v_Wheel_Limit_Qty, v_Class_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '����_�������� �԰� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0004(v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Section_Width,
                                     v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := '����_�������� �԰� ���� ����!!!'||'-'||v_ErrorText;
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
    COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0004.p_IUDRtsd0004(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0004.p_IUDRtsd0004(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0004;


  /*****************************************************************************
  -- ����_�������� �԰� ���� Count - ����,���,���ı��� ���� ������� �Ǽ� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtsd0004UseYnCount(
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*����                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,      /*���                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE             /*���� ����           */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0004
    WHERE   MODEL_CD    = v_Model_Cd
    AND     CONTENTS_CD = v_Contents_Cd
    AND     FR_CD       LIKE v_Fr_Cd||'%'
    AND     USE_YN      = 'Y';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0004UseYnCount;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[���]
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-11-06  wjim             [20171106_01] ���ı��� ����
                                           - ���� > ���� > �ѱ� �� �������� ����
  *****************************************************************************/
  PROCEDURE p_sRtsd0004ContentsCd (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  *
      FROM  (
                SELECT  DISTINCT
                        A.CONTENTS_CD,                              /*���                */
                        Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD)  AS CONTENTS_CD_NM
                FROM    RTSD0004 A
                WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
                AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
                AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
                AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
                AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
                AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
                AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
                AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
                AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
                AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
                AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
                AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id)
            )
     ORDER  BY UPPER(CONTENTS_CD_NM) --[20171106_01]           
    ;

  END p_sRtsd0004ContentsCd;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[���ı���]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004FrCd (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.FR_CD,                                    /*���� ����           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S004',A.FR_CD) AS FR_CD_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004FrCd;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[PR����]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004PlyRatingCd (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.PLY_RATING,                               /*PR(����)            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S009',A.PLY_RATING) AS PLY_RATING_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004PlyRatingCd;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[�ܸ���]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004SectionWidth (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.SECTION_WIDTH,                            /*�ܸ���              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S006',A.SECTION_WIDTH) AS SECTION_WIDTH_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004SectionWidth;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[�����]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004AspectRatio (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.ASPECT_RATIO,                              /*�����              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S007',A.ASPECT_RATIO) AS ASPECT_RATIO_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004AspectRatio;

  /*****************************************************************************
  -- ����_�������� �԰� ���� Select[��ġ]
  *****************************************************************************/
  PROCEDURE p_sRtsd0004WheelInches (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Model_Cd        IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd     IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd           IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width   IN RTSD0004.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio    IN RTSD0004.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches    IN RTSD0004.WHEEL_INCHES%TYPE,    /*��ġ                */
    v_Ply_Rating      IN RTSD0004.PLY_RATING%TYPE,      /*PR(����)            */
    v_Wheel_Qty       IN RTSD0004.WHEEL_QTY%TYPE,       /*������              */
    v_Wheel_Limit_Qty IN RTSD0004.WHEEL_LIMIT_QTY%TYPE, /*�������� ������     */
    v_Class_Cd        IN RTSD0004.CLASS_CD%TYPE,        /*�����з�            */
    v_Use_Yn          IN RTSD0004.USE_YN%TYPE,          /*��뿩��            */
    v_Reg_Id          IN RTSD0004.REG_ID%TYPE           /*����� ID           */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.WHEEL_INCHES,                             /*��ġ                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S008',A.WHEEL_INCHES) AS WHEEL_INCHES_NM
    FROM    RTSD0004 A
    WHERE   (v_Model_Cd          IS NULL OR A.MODEL_CD        =  v_Model_Cd)
    AND     (v_Contents_Cd      IS NULL OR A.CONTENTS_CD     =  v_Contents_Cd)
    AND     (v_Fr_Cd              IS NULL OR A.FR_CD           =  v_Fr_Cd)
    AND     (v_Section_Width    IS NULL OR A.SECTION_WIDTH   =  v_Section_Width)
    AND     (v_Aspect_Ratio     IS NULL OR A.ASPECT_RATIO    =  v_Aspect_Ratio)
    AND     (v_Wheel_Inches     IS NULL OR A.WHEEL_INCHES    =  v_Wheel_Inches)
    AND     (v_Ply_Rating          IS NULL OR A.PLY_RATING      =  v_Ply_Rating)
    AND     (v_Wheel_Qty          IS NULL OR A.WHEEL_QTY       =  v_Wheel_Qty)
    AND     (v_Wheel_Limit_Qty  IS NULL OR A.WHEEL_LIMIT_QTY =  v_Wheel_Limit_Qty)
    AND     (v_Class_Cd         IS NULL OR A.CLASS_CD        =  v_Class_Cd)
    AND     (v_Use_Yn           IS NULL OR A.USE_YN          =  v_Use_Yn)
    AND     (v_Reg_Id           IS NULL OR A.REG_ID          =  v_Reg_Id);

  END p_sRtsd0004WheelInches;
  
  /*****************************************************************************
  -- ����_�ķ��������� ���� (LTR �̿��� ������ ��� �ķ��� 2������ ����)
  -- ���� ������ �������� ���������� ���� ��� WHEEL_QTY�� �����ϰ� �����ϸ� �ȴ�.
  *****************************************************************************/
  FUNCTION f_sRtsd0004WheelQty (
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,       /*����                  */
    v_Class_Cd       IN RTSD0004.CLASS_CD%TYPE,       /*���                  */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,          /*���� ����             */
    v_Mat_Cd         IN RTSD0005.MAT_CD%TYPE          /*�ܸ���                */
    ) RETURN VARCHAR2 IS
    
    v_Wheel_Qty VARCHAR2(4);
  BEGIN
    
     IF v_Class_Cd = 'L1' AND v_Fr_Cd = 'R' THEN
         SELECT TRIM(TO_CHAR(WHEEL_QTY, '00'))  
         INTO v_Wheel_Qty
         FROM RTSD0004 A, 
              RTSD0005 B, 
              RTCM0051 C 
         WHERE A.SECTION_WIDTH = B.SECTION_WIDTH 
         AND A.ASPECT_RATIO = B.ASPECT_RATIO 
         AND A.WHEEL_INCHES = B.WHEEL_INCHES
         AND A.PLY_RATING = B.PLY_RATING
         AND B.MAT_CD = v_Mat_Cd
         AND MODEL_CD = v_Model_Cd
         AND A.CLASS_CD = v_Class_Cd
         AND A.FR_CD = v_Fr_Cd
         AND A.MODEL_CD = C.CD
         AND C.CD_GRP_CD = 'S002'; 
     ELSE
        v_Wheel_Qty := '02';
     END IF;
     
     RETURN v_Wheel_Qty;

  END f_sRtsd0004WheelQty;

END Pkg_Rtsd0004;
/
