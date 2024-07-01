CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0200 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0200
   PURPOSE:   �������� Detail ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0200Count(
    v_Mid_Grp_Cd IN  RTCM0200.MID_GRP_CD%TYPE             /*�ڵ�׷��ڵ�        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0200
    WHERE   MID_GRP_CD   = v_Mid_Grp_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0200Count;
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0200 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE         /*�ڵ�׷��ڵ�            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.LRG_GRP_CD,
            A.MID_GRP_CD,    /*�ڵ�׷��ڵ�*/
            A.MID_GRP_NM,
            A.USE_YN,       /*��뿩��    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            A.REG_ID,       /*����� ID   */
            A.REG_DT,       /*�����      */
            A.CHG_ID,       /*������ ID   */
            A.CHG_DT        /*������      */
    FROM    RTCM0200 A
    WHERE   A.MID_GRP_CD = DECODE(v_Mid_Grp_Cd, NULL, A.MID_GRP_CD, v_Mid_Grp_Cd)
    ORDER   BY A.MID_GRP_CD;

  END p_sRtcm0200;

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0200(
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*�ڵ�׷��ڵ�        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0200 (
            LRG_GRP_CD, MID_GRP_CD, MID_GRP_NM, MID_GRP_DESC, USE_YN,
            REG_ID, REG_DT, CHG_ID, CHG_DT
            )
    VALUES  (
            v_Lrg_Grp_Cd, v_Mid_Grp_Cd, v_Mid_Grp_Nm, v_Mid_Grp_Desc,
            v_Use_Yn, v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0200;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0200(
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*�ڵ�׷��ڵ�        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0200
    SET     MID_GRP_CD      = v_Mid_Grp_Cd,
            MID_GRP_NM      = v_Mid_Grp_Nm,
            MID_GRP_DESC    = v_Mid_Grp_Desc,
            USE_YN          = v_Use_Yn,
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   MID_GRP_CD      = v_Mid_Grp_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0200;


  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0200(
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0200
    SET     USE_YN     = 'N',
            CHG_DT     = SYSDATE,
            CHG_ID     = v_Reg_Id
    WHERE   MID_GRP_CD = v_Mid_Grp_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0200;


  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0200(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Lrg_Grp_Cd     IN  RTCM0200.LRG_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0200.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Nm     IN  RTCM0200.MID_GRP_NM%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Mid_Grp_Desc   IN  RTCM0200.MID_GRP_DESC%TYPE,     /*�ڵ�׷��ڵ�        */  
    v_Use_Yn         IN  RTCM0200.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0200.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS

    e_Error EXCEPTION;

  BEGIN

    -- �ʼ���: �ڵ�׷��ڵ�, �ڵ�, ��뿩�� ,����� ID
    IF TRIM(v_Mid_Grp_Cd) IS NULL THEN
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

    IF 0 = f_sRTCM0200Count(v_Mid_Grp_Cd) THEN

        IF 0 != f_InsertRtcm0200(v_Lrg_Grp_Cd, v_Mid_Grp_Cd, v_Mid_Grp_Nm, v_Mid_Grp_Desc,  
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0200(v_Lrg_Grp_Cd, v_Mid_Grp_Cd, v_Mid_Grp_Nm, v_Mid_Grp_Desc,  
                                     v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0200(v_Mid_Grp_Cd, v_Reg_Id, v_ErrorText) THEN
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0200.p_IUDRTCM0200(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0200.p_IUDRTCM0200(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0200;
  
  
END Pkg_Rtcm0200;
/