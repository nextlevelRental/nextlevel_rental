CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0205 AS
/*******************************************************************************
   NAME:      Pkg_RTCM0205
   PURPOSE:   �������� Detail ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2023-01-31  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0205Count(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE            /*�����ڵ��          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0205
    WHERE   SEND_POS   = v_Send_Pos
    AND     MID_GRP_CD = v_Mid_Grp_Cd
    AND     CD = v_Cd
    AND     CUST_NO = v_Cust_No
    AND     ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0205Count;
  
  /*****************************************************************************
  -- �����ڵ� Detail ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0205 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE            /*�����ڵ��          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SEND_POS,
            A.MID_GRP_CD,    /*�ڵ�׷��ڵ�*/
            A.CD,           /*�ڵ�        */
            A.CUST_NO,
            A.ORD_NO,
            A.LOCK_YN,
            A.LOCK_TYPE,
            A.REG_ID,       /*����� ID   */
            A.REG_DT,       /*�����      */
            A.CHG_ID,       /*������ ID   */
            A.CHG_DT        /*������      */
    FROM    RTCM0205 A
    WHERE   1=1
    AND     A.SEND_POS = DECODE(v_Send_Pos, NULL, A.SEND_POS, v_Send_Pos)
    AND     A.MID_GRP_CD = DECODE(v_Mid_Grp_Cd, NULL, A.MID_GRP_CD, v_Mid_Grp_Cd)
    AND     A.CD         = DECODE(v_Cd, NULL, A.CD, v_Cd)
    AND     A.CUST_NO = DECODE(v_Cust_No, NULL, A.CUST_NO, v_Cust_No)
    AND     A.ORD_NO = DECODE(v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
    ORDER   BY A.CUST_NO, A.ORD_NO;

  END p_sRtcm0205;

  /*****************************************************************************
  -- �������� Detail Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*�����ڵ��          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*�����ڵ��          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT INTO RTCM0205 (
            SEND_POS, MID_GRP_CD, CD, CUST_NO, ORD_NO, SEQ,
            STR_DAY, END_DAY, LOCK_YN, LOCK_TYPE, 
            REG_ID, REG_DT, CHG_ID, CHG_DT
            )
    VALUES  (
            v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No, 1,
            v_Str_Day, v_End_Day, v_Lock_Yn, v_Lock_Type, 
            v_Reg_Id, SYSDATE, v_Reg_Id, SYSDATE
           );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0205;

  /*****************************************************************************
  -- �������� Detail Update
  *****************************************************************************/
  FUNCTION f_UpdateRTCM0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*�����ڵ��          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*�����ڵ��          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0205
    SET     STR_DAY         = v_Str_Day,
            END_DAY         = v_End_Day,
            LOCK_YN         = v_Lock_Yn,
            LOCK_TYPE       = v_Lock_Type,
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   SEND_POS        = v_Send_Pos
      AND   MID_GRP_CD      = v_Mid_Grp_Cd
      AND   CD              = v_Cd
      AND   CUST_NO         = v_Cust_No
      AND   ORD_NO          = v_Ord_No
      AND   SEQ             = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0205;


  /*****************************************************************************
  -- �������� Detail Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0205(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*����� ID           */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTCM0205
    SET     LOCK_YN         = 'N',
            CHG_DT          = SYSDATE,
            CHG_ID          = v_Reg_Id
    WHERE   SEND_POS        = v_Send_Pos
      AND   MID_GRP_CD      = v_Mid_Grp_Cd
      AND   CD              = v_Cd
      AND   CUST_NO         = v_Cust_No
      AND   ORD_NO          = v_Ord_No
      AND   SEQ             = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcm0205;


  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0205(
    v_Comm_Dvsn      IN  CHAR,                           /* ó������(I,U,D)        */
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Seq            IN  RTCM0205.SEQ%TYPE,
    v_Str_Day        IN  RTCM0205.STR_DAY%TYPE,
    v_End_Day        IN  RTCM0205.END_DAY%TYPE,
    v_Lock_Yn        IN  RTCM0205.LOCK_YN%TYPE,            /*�����ڵ��          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE,            /*�����ڵ��          */
    v_Reg_Id         IN  RTCM0205.REG_ID%TYPE,           /*����� ID           */
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

    IF TRIM(v_Lock_Yn) IS NULL THEN
        v_Return_Message := '��뿩��('||v_Lock_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRTCM0205Count(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No) THEN

        IF 0 != f_InsertRTCM0205(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No, 
                                 v_Str_Day, v_End_Day, v_Lock_Yn, v_Lock_Type, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRTCM0205(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No, v_Seq,
                                 v_Str_Day, v_End_Day, v_Lock_Yn, v_Lock_Type, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRTCM0205(v_Send_Pos, v_Mid_Grp_Cd, v_Cd, v_Cust_No, v_Ord_No, v_Seq, v_Reg_Id, v_ErrorText) THEN
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0205.p_IUDRTCM0205(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0205.p_IUDRTCM0205(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0205;
  
  /*****************************************************************************
  -- �����ڵ� Detail Count
  *****************************************************************************/
  FUNCTION f_sRtcm0205LockYn(
    v_Send_Pos       IN  RTCM0205.SEND_POS%TYPE,       /*�ڵ�׷��ڵ�        */ 
    v_Mid_Grp_Cd     IN  RTCM0205.MID_GRP_CD%TYPE,       /*�ڵ�׷��ڵ�        */    
    v_Cd             IN  RTCM0205.CD%TYPE,               /*�����ڵ�            */
    v_Cust_No        IN  RTCM0205.CUST_NO%TYPE,            /*�����ڵ��          */
    v_Ord_No         IN  RTCM0205.ORD_NO%TYPE,            /*�����ڵ��          */
    v_Lock_Type      IN  RTCM0205.LOCK_TYPE%TYPE            /*�����ڵ��          */
    ) RETURN VARCHAR2 IS
    v_lock_yn   VARCHAR2(1) DEFAULT 'N';
  BEGIN

    SELECT  CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END
    INTO    v_lock_yn
    FROM    RTCM0205
    WHERE       SEND_POS    = v_Send_Pos
        AND     MID_GRP_CD  = v_Mid_Grp_Cd
        AND     CD          = v_Cd
        AND     (CASE WHEN v_Lock_Type = '01' THEN 
                            CASE WHEN CUST_NO     = v_Cust_No THEN 1 ELSE 0 END
                      ELSE 
                            CASE WHEN ORD_NO      = v_Ord_No THEN 1 ELSE 0 END
                      END) = 1
        AND     LOCK_YN     = 'Y'
        AND     TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN STR_DAY AND END_DAY;

    RETURN v_lock_yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 'N';

  END f_sRtcm0205LockYn;
  
END Pkg_Rtcm0205;
/