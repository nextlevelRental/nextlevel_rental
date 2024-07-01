CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0203 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0203
   PURPOSE:   �������� Detail ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0203Count(
    v_Mid_Grp_Cd IN  RTCM0203.MID_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd         IN  RTCM0203.CD%TYPE,                    /*�ڵ�                */
    v_Param_Cd   IN  RTCM0203.PARAM_CD%TYPE               /*�Ķ���� �ڵ�        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0203
    WHERE   MID_GRP_CD   = v_Mid_Grp_Cd
    AND     CD           = v_Cd
    AND     PARAM_CD     = v_Param_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0203Count;
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0203 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd             IN  RTCM0203.CD%TYPE,                /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE               /*�Ķ���� �ڵ�        */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MID_GRP_CD,    /*�ڵ�׷��ڵ�*/
            A.CD,           /*�ڵ�        */
            A.PARAM_CD,
            A.PARAM_CD_NM,        /*�ڵ��      */
            A.PARAM_CD_DESC,
            A.ORDER_PT,     /*���ļ���    */
            A.USE_YN,       /*��뿩��    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            A.REG_ID,       /*����� ID   */
            A.REG_DT,       /*�����      */
            A.CHG_ID,       /*������ ID   */
            A.CHG_DT        /*������      */
    FROM    RTCM0203 A,
            RTCM0201 B
    WHERE   A.MID_GRP_CD = v_Mid_Grp_Cd
    AND     A.CD    = v_Cd
    AND     A.PARAM_CD = DECODE(v_Param_Cd, NULL, A.PARAM_CD, v_Param_Cd)
    AND     A.MID_GRP_CD = B.MID_GRP_CD
    AND     A.CD = B.CD
    ORDER   BY A.ORDER_PT;

  END p_sRtcm0203;

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*�����ڵ��          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*�ڵ弳��            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*�˸����ڵ�            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0203 (
            MID_GRP_CD, CD, PARAM_CD, PARAM_CD_NM, PARAM_CD_DESC,
            ORDER_PT, USE_YN, REG_ID, REG_DT, CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Mid_Grp_Cd, v_Cd, v_Param_Cd, v_Param_Cd_Nm, v_Param_Cd_Desc,
            v_Order_Pt, v_Use_Yn, v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0203;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*�����ڵ��          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*�ڵ弳��            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*�˸����ڵ�            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0203
    SET     PARAM_CD_NM     = v_Param_Cd_Nm,
            PARAM_CD_DESC   = v_Param_Cd_Desc,
            ORDER_PT        = v_Order_Pt,            
            USE_YN          = v_Use_Yn,
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   MID_GRP_CD      = v_Mid_Grp_Cd
    AND     CD              = v_Cd
    AND     PARAM_CD        = v_Param_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0203;


  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0203(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */
    v_Cd             IN  RTCM0203.CD%TYPE,               /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,               /*�����ڵ�            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0203
    SET     USE_YN     = 'N',
            CHG_DT     = SYSDATE,
            CHG_ID     = v_Reg_Id
    WHERE   MID_GRP_CD = v_Mid_Grp_Cd
    AND     CD         = v_Cd
    AND     PARAM_CD   = v_Param_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0203;


  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0203(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0203.CD%TYPE,               /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,            /*�����ڵ��          */
    v_Param_Cd_Nm    IN  RTCM0203.PARAM_CD_NM%TYPE,     /*�ڵ弳��            */
    v_Param_Cd_Desc  IN  RTCM0203.PARAM_CD_DESC%TYPE,     /*�˸����ڵ�            */
    v_Order_Pt       IN  RTCM0203.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0203.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS

    e_Error EXCEPTION;

  BEGIN

    -- �ʼ���: �ڵ�׷��ڵ�, �ڵ�, ��뿩�� ,����� ID
    IF TRIM(v_Param_Cd) IS NULL THEN
        v_Return_Message := '�ڵ�׷��ڵ�('||v_Mid_Grp_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
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

    IF 0 = f_sRTCM0203Count(v_Mid_Grp_Cd, v_Cd, v_Param_Cd) THEN

        IF 0 != f_InsertRTCM0203(v_Mid_Grp_Cd, v_Cd, v_Param_Cd, v_Param_Cd_Nm, v_Param_Cd_Desc,  
                                 v_Order_Pt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRTCM0203(v_Mid_Grp_Cd, v_Cd, v_Param_Cd, v_Param_Cd_Nm, v_Param_Cd_Desc,  
                                     v_Order_Pt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRTCM0203(v_Mid_Grp_Cd, v_Cd, v_Param_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0203.p_IUDRTCM0203(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0203.p_IUDRTCM0203(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0203;
  
  /*****************************************************************************
  -- �������� Detail ��ȸ- ��з�/�Һз��ڵ� ���� �Һз��ڵ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0203CodeName(
    v_Mid_Grp_Cd     IN  RTCM0203.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�         */
    v_Cd             IN  RTCM0203.CD%TYPE,                /*�����ڵ�            */
    v_Param_Cd       IN  RTCM0203.PARAM_CD%TYPE,          /*�Ķ�����ڵ�         */
    v_Use_Yn         IN  RTCM0203.USE_YN%TYPE             /*��뿩��           */
    ) RETURN VARCHAR IS

    v_Param_Cd_Nm      RTCM0203.PARAM_CD_NM%TYPE; /*�ڵ��      */
  BEGIN

    SELECT  PARAM_CD_NM
    INTO    v_Param_Cd_Nm
    FROM    RTCM0203
    WHERE   MID_GRP_CD = v_Mid_Grp_Cd
    AND     CD         = v_Cd
    AND     PARAM_CD   = v_Param_Cd;
    RETURN v_Param_Cd_Nm;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0203CodeName;
  
  
END Pkg_Rtcm0203;
/