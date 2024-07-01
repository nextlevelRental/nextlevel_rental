CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0051 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0051
   PURPOSE:   �����ڵ� Detail ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0051Count(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0051
    WHERE   CD_GRP_CD   = v_Cd_Grp_Cd
    AND     CD          = v_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0051Count;

  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0051 (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd        IN  RTCM0051.CD%TYPE,               /*�ڵ�                    */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE             /*�ڵ��                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CD_GRP_CD,    /*�ڵ�׷��ڵ�*/
            B.CD_GRP_NM,    /*�ڵ�׷��  */
            A.CD,           /*�ڵ�        */
            A.CD_NM,        /*�ڵ��      */
            A.CD_DESC,      /*�ڵ弳��    */
            A.ORDER_PT,     /*���ļ���    */
            A.USE_YN,       /*��뿩��    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            A.REMARK,       /*����        */
            A.REG_ID,       /*����� ID   */
            A.REG_DT,       /*�����      */
            A.CHG_ID,       /*������ ID   */
            A.CHG_DT        /*������      */
    FROM    RTCM0051 A,
            RTCM0050 B
    WHERE   A.CD_GRP_CD = DECODE(v_Cd_Grp_Cd, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd)
    AND     A.CD    LIKE v_Cd||'%'
    AND     A.CD_NM LIKE '%'||v_Cd_Nm||'%'
    AND     A.CD_GRP_CD = B.CD_GRP_CD
    ORDER   BY A.ORDER_PT;

  END p_sRtcm0051;

  /*****************************************************************************
  -- �����ڵ� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*�ڵ�                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*�ڵ��              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*�ڵ弳��            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*�켱����            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*��뿩��            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*����                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0051 (
            CD_GRP_CD, CD, CD_NM, CD_DESC, ORDER_PT,
            USE_YN, REMARK, REG_ID, REG_DT,
            CHG_ID, CHG_DT
            )
    VALUES  (
            v_Cd_Grp_Cd, v_Cd, NVL(v_Cd_Nm, ' '), v_Cd_Desc, v_Order_Pt,
            v_Use_Yn, v_Remark, v_Reg_Id, SYSDATE,
            v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0051;

  /*****************************************************************************
  -- �����ڵ� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*�ڵ�                */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,                /*�ڵ��              */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE,              /*�ڵ弳��            */
    v_Order_Pt  IN  RTCM0051.ORDER_PT%TYPE,             /*�켱����            */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE,               /*��뿩��            */
    v_Remark    IN  RTCM0051.REMARK%TYPE,               /*����                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0051
    SET     CD_NM     = NVL(v_Cd_Nm,' '),
            CD_DESC   = v_Cd_Desc,
            ORDER_PT  = v_Order_Pt,
            USE_YN    = v_Use_Yn,
            REMARK    = v_Remark,
            CHG_DT    = SYSDATE,
            CHG_ID    = v_Reg_Id
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0051;


  /*****************************************************************************
  -- �����ڵ� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0051(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE,                   /*�ڵ�                */
    v_Reg_Id    IN  RTCM0051.REG_ID%TYPE,               /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0051
    SET     USE_YN  = 'N',
            CHG_DT  = SYSDATE,
            CHG_ID  = v_Reg_Id
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0051;


  /*****************************************************************************
  -- �����ڵ� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0051(
    v_Comm_Dvsn  IN  CHAR,                          /*ó������(I,U,D)         */
    v_Cd_Grp_Cd  IN  RTCM0051.CD_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�            */
    v_Cd         IN  RTCM0051.CD%TYPE,              /*�ڵ�                    */
    v_Cd_Nm      IN  RTCM0051.CD_NM%TYPE,           /*�ڵ��                  */
    v_Cd_Desc    IN  RTCM0051.CD_DESC%TYPE,         /*�ڵ弳��                */
    v_Order_Pt   IN  RTCM0051.ORDER_PT%TYPE,        /*�켱����                */
    v_Use_Yn     IN  RTCM0051.USE_YN%TYPE,          /*��뿩��                */
    v_Remark     IN  RTCM0051.REMARK%TYPE,          /*����                    */
    v_Reg_Id     IN  RTCM0051.REG_ID%TYPE,          /*����� ID               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

  BEGIN

    -- �ʼ���: �ڵ�׷��ڵ�, �ڵ�, ��뿩�� ,����� ID
    IF TRIM(v_Cd_Grp_Cd) IS NULL THEN
        v_Return_Message := '�ڵ�׷��ڵ�('||v_Cd_Grp_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Cd) IS NULL THEN
        v_Return_Message := '�ڵ�('||v_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
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

    IF 0 = f_sRtcm0051Count(v_Cd_Grp_Cd, v_Cd) THEN

        IF 0 != f_InsertRtcm0051(v_Cd_Grp_Cd, v_Cd,v_Cd_Nm, v_Cd_Desc, v_Order_Pt, v_Use_Yn,
                                 v_Remark, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�����ڵ� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0051(v_Cd_Grp_Cd, v_Cd,v_Cd_Nm, v_Cd_Desc, v_Order_Pt, v_Use_Yn,
                                     v_Remark, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����ڵ� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0051(v_Cd_Grp_Cd, v_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����ڵ� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := ' ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0051.p_IUDRTCM0051(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0051.p_IUDRTCM0051(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0051;

  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ- ��з��ڵ� ���� �Һз��ڵ�/�� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0051CodeName (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd_Nm     IN  RTCM0051.CD_NM%TYPE,            /*�ڵ��                  */
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE            /*��뿩��                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CD,           /*�ڵ�        */
            A.CD_NM,        /*�ڵ��      */
            A.CD_DESC       /*�ڵ弳��    */
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = v_Cd_Grp_Cd
    AND     A.USE_YN    = NVL(v_Use_Yn,'Y')
    AND     NVL(CD_NM, ' ') LIKE '%'||v_Cd_Nm||'%'
    ORDER   BY NVL(A.ORDER_PT,0), A.CD_NM;

  END p_sRtcm0051CodeName;


  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ- ��з�/�Һз��ڵ� ���� �Һз��ڵ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0051CodeName(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN VARCHAR IS

    v_Cd_Nm      RTCM0051.CD_NM%TYPE; /*�ڵ��      */
  BEGIN

    SELECT  CD_NM
    INTO    v_Cd_Nm
    FROM    RTCM0051
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd;
    RETURN v_Cd_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0051CodeName;  
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ- ��з��ڵ� ���� �Һз��ڵ�  ��ȸ(�̿����ĺ��ڵ� ȹ��� ���)
  *****************************************************************************/
  FUNCTION f_sRtcm0051Cd(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE             /*�ڵ�׷��ڵ�        */
    ) RETURN VARCHAR IS
    
    v_Cd    RTCM0051.CD%TYPE DEFAULT NULL;              /*�ڵ�                */
  BEGIN

    SELECT  CD
    INTO    v_Cd
    FROM    (
            SELECT  CD
            FROM    RTCM0051
            WHERE   CD_GRP_CD = v_Cd_Grp_Cd
            AND     USE_YN    = 'Y'
            ORDER BY ORDER_PT ASC
            )
    WHERE   ROWNUM <= 1;
    
    RETURN v_Cd;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN NULL;

  END f_sRtcm0051Cd;
    
  /*****************************************************************************
  -- �����ڵ� Detail Count - ������� �ڵ� ���� ����
  *****************************************************************************/
  FUNCTION f_sRtcm0051UseCount(
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd        IN  RTCM0051.CD%TYPE                    /*�ڵ�                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0051
    WHERE   CD_GRP_CD = v_Cd_Grp_Cd
    AND     CD        = v_Cd
    AND     USE_YN    = 'Y';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0051UseCount;
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ - �����ڵ�(CD_DESC)�� ��ȸ 
  *****************************************************************************/
  PROCEDURE p_sRtcm0051HCode (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd_Desc   IN  RTCM0051.CD_DESC%TYPE           /*�ڵ弳��                */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.CD_GRP_CD,    /*�ڵ�׷��ڵ�*/
            B.CD_GRP_NM,    /*�ڵ�׷��  */
            A.CD,           /*�ڵ�        */
            A.CD_NM,        /*�ڵ��      */
            A.CD_DESC,      /*�ڵ弳��    */
            A.ORDER_PT      /*���ļ���    */
    FROM    RTCM0051 A,
            RTCM0050 B
    WHERE   A.CD_GRP_CD = DECODE(v_Cd_Grp_Cd, NULL, A.CD_GRP_CD, v_Cd_Grp_Cd)
    AND     (v_Cd_Desc IS NULL OR A.CD_DESC = v_Cd_Desc)
    AND     A.USE_YN    = 'Y'
    AND     A.CD_GRP_CD = B.CD_GRP_CD
    ORDER   BY A.ORDER_PT;

  END p_sRtcm0051HCode;
  
END Pkg_Rtcm0051;
/
