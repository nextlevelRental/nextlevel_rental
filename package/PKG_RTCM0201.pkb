CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0201 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0201
   PURPOSE:   �������� Detail ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-16  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0201Count(
    v_Mid_Grp_Cd IN  RTCM0201.MID_GRP_CD%TYPE,            /*�ڵ�׷��ڵ�        */
    v_Cd         IN  RTCM0201.CD%TYPE                     /*�ڵ�                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0201
    WHERE   MID_GRP_CD   = v_Mid_Grp_Cd
    AND     CD           = v_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0201Count;
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0201 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd             IN  RTCM0201.CD%TYPE                 /*�����ڵ�            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MID_GRP_CD,    /*�ڵ�׷��ڵ�*/
            A.CD,           /*�ڵ�        */
            A.CD_NM,        /*�ڵ��      */
            A.MSG_CONTENTS,
            A.KAKAO_MSG_CD,
            A.MSG_TYPE,
            A.RESERVED_TYPE,
            A.ORDER_PT,     /*���ļ���    */
            A.USE_YN,       /*��뿩��    */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C004', A.USE_YN) USE_YN_NM, /*��뿩�θ�     */
            A.REG_ID,       /*����� ID   */
            A.REG_DT,       /*�����      */
            A.CHG_ID,       /*������ ID   */
            A.CHG_DT        /*������      */
    FROM    RTCM0201 A,
            RTCM0200 B
    WHERE   A.MID_GRP_CD = DECODE(v_Mid_Grp_Cd, NULL, A.MID_GRP_CD, v_Mid_Grp_Cd)
    AND     A.CD         = DECODE(v_Cd, NULL, A.CD, v_Cd)
    AND     A.MID_GRP_CD = B.MID_GRP_CD
    ORDER   BY A.ORDER_PT;

  END p_sRtcm0201;

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0201.CD%TYPE,               /*�����ڵ�            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*�����ڵ��          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*�ڵ弳��            */
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*�˸����ڵ�            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*�߼�����            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*��ù߼ۿ���         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0201 (
            MID_GRP_CD, CD, CD_NM, MSG_CONTENTS, ORDER_PT, 
            KAKAO_MSG_CD, MSG_TYPE, RESERVED_TYPE, USE_YN,
            REG_ID, REG_DT, CHG_ID, CHG_DT
            )
    VALUES  (
            v_Mid_Grp_Cd, v_Cd, NVL(v_Cd_Nm, ' '), v_Msg_Contents,
            v_Order_Pt, v_Kakao_Msg_Cd, v_Msg_Type, v_Reserved_Type, v_Use_Yn,
            v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0201;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0201.CD%TYPE,               /*�����ڵ�            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*�����ڵ��          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*�ڵ弳��            */
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*�˸����ڵ�            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*�߼�����            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*��ù߼ۿ���         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0201
    SET     CD_NM           = NVL(v_Cd_Nm,' '),
            MSG_CONTENTS    = v_Msg_Contents,
            KAKAO_MSG_CD    = v_Kakao_Msg_Cd,
            MSG_TYPE        = v_Msg_Type,
            RESERVED_TYPE   = v_Reserved_Type,
            ORDER_PT        = v_Order_Pt,            
            USE_YN          = v_Use_Yn,
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   MID_GRP_CD      = v_Mid_Grp_Cd
    AND     CD              = v_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0201;


  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0201(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */
    v_Cd             IN  RTCM0201.CD%TYPE,               /*�����ڵ�            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0201
    SET     USE_YN     = 'N',
            CHG_DT     = SYSDATE,
            CHG_ID     = v_Reg_Id
    WHERE   MID_GRP_CD = v_Mid_Grp_Cd
    AND     CD         = v_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0201;


  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0201(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */
    v_Cd             IN  RTCM0201.CD%TYPE,               /*�����ڵ�            */
    v_Cd_Nm          IN  RTCM0201.CD_NM%TYPE,            /*�����ڵ��          */
    v_Msg_Contents   IN  RTCM0201.MSG_CONTENTS%TYPE,     /*�ڵ弳��            */    
    v_Kakao_Msg_Cd   IN  RTCM0201.KAKAO_MSG_CD%TYPE,     /*�˸����ڵ�            */
    v_Msg_Type       IN  RTCM0201.MSG_TYPE%TYPE,         /*�߼�����            */
    v_Reserved_Type  IN  RTCM0201.RESERVED_TYPE%TYPE,    /*��ù߼ۿ���         */
    v_Order_Pt       IN  RTCM0201.ORDER_PT%TYPE,         /*���ļ���            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE,           /*��뿩��            */
    v_Reg_Id         IN  RTCM0201.REG_ID%TYPE,           /*����� ID               */
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

    IF 0 = f_sRtcm0201Count(v_Mid_Grp_Cd, v_Cd) THEN

        IF 0 != f_InsertRtcm0201(v_Mid_Grp_Cd, v_Cd, v_Cd_Nm, v_Msg_Contents,  
                                 v_Kakao_Msg_Cd, v_Msg_Type, v_Reserved_Type, v_Order_Pt, v_Use_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcm0201(v_Mid_Grp_Cd, v_Cd, v_Cd_Nm, v_Msg_Contents,  
                                     v_Kakao_Msg_Cd, v_Msg_Type, v_Reserved_Type, v_Order_Pt, v_Use_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0201(v_Mid_Grp_Cd, v_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := ' ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    --���� �����丮 ���
    IF 0 != Pkg_Rtcm0202.f_InsertRtcm0202(v_Mid_Grp_Cd, v_Cd, v_Msg_Contents,  
                                          v_Kakao_Msg_Cd, v_Msg_Type, v_Reserved_Type, 
                                          v_Order_Pt, v_Use_Yn,
                                          v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�������� �����丮 ��� ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0201.p_IUDRTCM0201(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0201.p_IUDRTCM0201(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0201;
  
  /*****************************************************************************
  -- �������� Detail ��ȸ- ��з�/�Һз��ڵ� ���� �Һз��ڵ�� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtcm0201Msg(
    v_Mid_Grp_Cd     IN  RTCM0201.MID_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�        */
    v_Cd             IN  RTCM0201.CD%TYPE,                /*�����ڵ�            */
    v_Use_Yn         IN  RTCM0201.USE_YN%TYPE              /*��뿩��            */
    ) RETURN VARCHAR IS

    v_Msg_Contents      RTCM0201.MSG_CONTENTS%TYPE; /*�ڵ��      */
  BEGIN

    SELECT  MSG_CONTENTS
    INTO    v_Msg_Contents
    FROM    RTCM0201
    WHERE   MID_GRP_CD = v_Mid_Grp_Cd
    AND     CD         = v_Cd;
    RETURN v_Msg_Contents;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtcm0201Msg;
  
END Pkg_Rtcm0201;
/