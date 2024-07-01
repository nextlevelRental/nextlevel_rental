CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0003 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0003
   PURPOSE   Ÿ�̾� �԰� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0003Count(
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,    /*�ܸ���              */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,     /*�����              */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,     /*��ġ                */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE        /*PR(����)            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0003
    WHERE   SECTION_WIDTH  = v_Section_Width
    AND     ASPECT_RATIO   = v_Aspect_Ratio
    AND     WHEEL_INCHES   = v_Wheel_Inches
    AND     PLY_RATING     = v_Ply_Rating;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0003Count;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0003 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*�԰�                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*�԰�2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SECTION_WIDTH,             /*�ܸ���              */
            A.ASPECT_RATIO,              /*�����              */
            A.WHEEL_INCHES,              /*��ġ                */
            A.PLY_RATING,                /*PR(����)            */
            A.SIZE_CD,                   /*�԰�                */
            A.SIZE_CD2,                  /*�԰�2               */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0003 A
    WHERE   A.SECTION_WIDTH = DECODE(v_Section_Width , NULL, A.SECTION_WIDTH , v_Section_Width)
    AND     A.ASPECT_RATIO  = DECODE(v_Aspect_Ratio  , NULL, A.ASPECT_RATIO  , v_Aspect_Ratio)
    AND     A.WHEEL_INCHES  = DECODE(v_Wheel_Inches  , NULL, A.WHEEL_INCHES  , v_Wheel_Inches)
    AND     A.PLY_RATING    = DECODE(v_Ply_Rating    , NULL, A.PLY_RATING    , v_Ply_Rating)
    AND     A.SIZE_CD       = DECODE(v_Size_Cd       , NULL, A.SIZE_CD       , v_Size_Cd)
    AND     A.SIZE_CD2      = DECODE(v_Size_Cd2      , NULL, A.SIZE_CD2      , v_Size_Cd2)
    AND     A.USE_YN        = DECODE(v_Use_Yn        , NULL, A.USE_YN        , v_Use_Yn)
    AND     A.REG_ID        = DECODE(v_Reg_Id        , NULL, A.REG_ID        , v_Reg_Id);

  END p_sRtsd0003;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*�԰�                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*�԰�2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0003 (
            SECTION_WIDTH,
            ASPECT_RATIO,
            WHEEL_INCHES,
            PLY_RATING,
            SIZE_CD,
            SIZE_CD2,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Section_Width,
            v_Aspect_Ratio,
            v_Wheel_Inches,
            v_Ply_Rating,
            v_Size_Cd,
            v_Size_Cd2,
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

  END f_InsertRtsd0003;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*�԰�                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*�԰�2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0003
    SET    SIZE_CD       = v_Size_Cd,
           SIZE_CD2      = v_Size_Cd2,
           USE_YN        = v_Use_Yn,
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE 
    WHERE  SECTION_WIDTH = v_Section_Width
    AND    ASPECT_RATIO  = v_Aspect_Ratio
    AND    WHEEL_INCHES  = v_Wheel_Inches
    AND    PLY_RATING    = v_Ply_Rating;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0003;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0003 (
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0003
    SET    USE_YN        = 'N',
           CHG_ID        = v_Reg_Id,
           CHG_DT        = SYSDATE 
    WHERE  SECTION_WIDTH = v_Section_Width
    AND    ASPECT_RATIO  = v_Aspect_Ratio
    AND    WHEEL_INCHES  = v_Wheel_Inches
    AND    PLY_RATING    = v_Ply_Rating;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0003;

  /*****************************************************************************
  -- Ÿ�̾� �԰� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0003 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Section_Width  IN RTSD0003.SECTION_WIDTH%TYPE,  /*�ܸ���                */
    v_Aspect_Ratio   IN RTSD0003.ASPECT_RATIO%TYPE,   /*�����                */
    v_Wheel_Inches   IN RTSD0003.WHEEL_INCHES%TYPE,   /*��ġ                  */
    v_Ply_Rating     IN RTSD0003.PLY_RATING%TYPE,     /*PR(����)              */
    v_Size_Cd        IN RTSD0003.SIZE_CD%TYPE,        /*�԰�                  */
    v_Size_Cd2       IN RTSD0003.SIZE_CD2%TYPE,       /*�԰�2                 */
    v_Use_Yn         IN RTSD0003.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0003.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
  
    -- �ʼ���: �ܸ���, �����,��ġ, PR(����), �԰�, ��뿩�� ,����� ID
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
    
    IF TRIM(v_Size_Cd) IS NULL THEN
        v_Return_Message := '�԰�('||v_Size_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
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

    IF 0 = f_sRtsd0003Count(v_Section_Width, v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating) THEN

        IF 0 != f_InsertRtsd0003(v_Section_Width, v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, 
                                 v_Size_Cd, v_Size_Cd2, v_Use_Yn, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := 'Ÿ�̾� �԰� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0003(v_Section_Width, v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, 
                                     v_Size_Cd, v_Size_Cd2, v_Use_Yn, v_Reg_Id,
                                     v_ErrorText) THEN
                v_Return_Message := 'Ÿ�̾� �԰� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0003(v_Section_Width, v_Aspect_Ratio, v_Wheel_Inches, v_Ply_Rating, 
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'Ÿ�̾� �԰� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0003.p_IUDRtsd0003(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0003.p_IUDRtsd0003(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0003;

END Pkg_Rtsd0003;
/
