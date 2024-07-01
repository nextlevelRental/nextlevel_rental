CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0204 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0204
   PURPOSE:   �������� Detail ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0204Count(
    v_Send_Pos   IN  RTCM0204.SEND_POS%TYPE            /*�ڵ�׷��ڵ�        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0204
    WHERE   SEND_POS   = v_Send_Pos;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0204Count;
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0204 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,          /*�ڵ�׷��ڵ�            */
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd             IN  RTCM0204.CD%TYPE                 /*�����ڵ�            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SEND_POS,
            A.MID_GRP_CD,    /*�ڵ�׷��ڵ�*/
            A.CD,           /*�ڵ�        */
            A.REMARK,
            A.USE_YN,       /*��뿩��    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            A.REG_ID,       /*����� ID   */
            A.REG_DT,       /*�����      */
            A.CHG_ID,       /*������ ID   */
            A.CHG_DT        /*������      */
    FROM    RTCM0204 A
    WHERE   1=1
    AND     A.SEND_POS = DECODE(v_Send_Pos, NULL, A.SEND_POS, v_Send_Pos)
    AND     A.MID_GRP_CD = DECODE(v_Mid_Grp_Cd, NULL, A.MID_GRP_CD, v_Mid_Grp_Cd)
    AND     A.CD         = DECODE(v_Cd, NULL, A.CD, v_Cd)
    ORDER   BY A.SEND_POS;

  END p_sRtcm0204;

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*�����ڵ�            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*�����ڵ��          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0204 (
            SEND_POS, MID_GRP_CD, CD, REMARK, USE_YN,
            REG_ID, REG_DT, CHG_ID, CHG_DT
            )
    VALUES  (
            v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Remark, v_Use_Yn,
            v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0204;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*�����ڵ�            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*�����ڵ��          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0204
    SET     MID_GRP_CD      = v_Mid_Grp_Cd,
            CD              = v_Cd,
            REMARK          = v_Remark,        
            USE_YN          = v_Use_Yn,
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   SEND_POS        = v_Send_Pos;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0204;


  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0204(
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,         /*�ڵ�׷��ڵ�        */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0204
    SET     USE_YN     = 'N',
            CHG_DT     = SYSDATE,
            CHG_ID     = v_Reg_Id
    WHERE   SEND_POS   = v_Send_Pos;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0204;


  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0204(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0204.CD%TYPE,               /*�����ڵ�            */
    v_Remark         IN  RTCM0204.REMARK%TYPE,            /*�����ڵ��          */
    v_Use_Yn         IN  RTCM0204.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0204.REG_ID%TYPE,           /*����� ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS

    e_Error EXCEPTION;

  BEGIN

    -- �ʼ���: �ڵ�׷��ڵ�, �ڵ�, ��뿩�� ,����� ID
    IF TRIM(v_Send_Pos) IS NULL THEN
        v_Return_Message := '�߼���ġ�ڵ�('||v_Send_Pos||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Mid_Grp_Cd) IS NULL THEN
        v_Return_Message := '�ڵ�׷��ڵ�('||v_Mid_Grp_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
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

    IF 0 = f_sRTCM0204Count(v_Send_Pos) THEN

        IF 0 != f_InsertRTCM0204(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Remark, v_Use_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRTCM0204(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Remark, v_Use_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRTCM0204(v_Send_Pos, v_Reg_Id, v_ErrorText) THEN
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0204.p_IUDRTCM0204(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0204.p_IUDRTCM0204(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0204;
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sMessageInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0204.SEND_POS%TYPE,          /*�ڵ�׷��ڵ�            */
    v_Mid_Grp_Cd     IN  RTCM0204.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd             IN  RTCM0204.CD%TYPE                 /*�����ڵ�            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SEND_POS,
            A.MID_GRP_CD,    /*�ڵ�׷��ڵ�*/
            A.CD,           /*�ڵ�        */
            A.REMARK,
            A.USE_YN,       /*��뿩��    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            B.MSG_CONTENTS,
            B.KAKAO_MSG_CD,
            B.MSG_TYPE,
            B.RESERVED_TYPE,
            A.REG_ID,       /*����� ID   */
            A.REG_DT,       /*�����      */
            A.CHG_ID,       /*������ ID   */
            A.CHG_DT        /*������      */
    FROM    RTCM0204 A
           ,RTCM0201 B
    WHERE   1=1
    AND     A.SEND_POS      = DECODE(v_Send_Pos, NULL, A.SEND_POS, v_Send_Pos)
    AND     A.MID_GRP_CD    = DECODE(v_Mid_Grp_Cd, NULL, A.MID_GRP_CD, v_Mid_Grp_Cd)
    AND     B.CD            = DECODE(v_Cd, NULL, A.CD, v_Cd)
    AND     A.MID_GRP_CD    = B.MID_GRP_CD 
    AND     A.USE_YN = 'Y'
    AND     B.USE_YN = 'Y';

  END p_sMessageInfo;
  
  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0204SeqNumber
  RETURN VARCHAR IS
    v_curr_cunt   VARCHAR(5) DEFAULT '00000';
  BEGIN

    SELECT  TO_CHAR(SEQ_SMS_POS.NEXTVAL, 'FM00000')
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN '00000';

  END f_sRtcm0204SeqNumber;
  
  
END Pkg_Rtcm0204;
/