CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0030 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0030
   PURPOSE:   �������� ����
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jungsoo         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �������� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0030Count(
    v_Ntc_Seq    IN     RTCM0030.NTC_SEQ%TYPE        /* �������� ����         */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0030
    WHERE   NTC_SEQ = v_Ntc_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0030Count;

  /*****************************************************************************
  -- �������� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0030 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Title          IN RTCM0030.TITLE%TYPE,          /*����                  */
    v_Reg_Fdt        IN VARCHAR,                      /*�����FROM            */
    v_Reg_Tdt        IN VARCHAR,                      /*�����TO              */
    v_User_Nm        IN RTCM0001.USER_NM%TYPE         /*�ۼ���                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  C30.NTC_SEQ,                               /*��������              */
            C30.NTC_TYPE,                              /*��������(�ȳ�/����...)*/
            C30.TITLE,                                 /*����                  */
            C30.CONTENTS  CONTENTS,                              /*��������              */
            C30.START_DT,                              /*�����Խ� ������       */
            C30.END_DT,                                /*�����Խ� ������       */
            C30.READ_CNT,                              /*��ȸ�Ǽ�              */
            --C30.ATTCH_FL_SEQ,                          /*÷������ ����         */
            (SELECT COUNT(*) FROM RTCM0040 WHERE FILE_GRP_SEQ = C30.ATTCH_FL_SEQ) FILE_CNT , /* ÷�����ϰ���*/
            C30.ATTCH_FL_SEQ,                           /*÷����������*/
            C30.DEL_YN,                                /*��������              */
            C30.REG_ID,                                /*����� ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C30.REG_ID) REG_NM,                  /*����ڸ�       */
            C30.REG_DT,                                /*�����                */
            C30.CHG_ID,                                /*������ ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C30.CHG_ID) CHG_NM,                  /*�����ڸ�       */
            C30.CHG_DT                                 /*������                */
    FROM    RTCM0030 C30,
            RTCM0001 C01
    WHERE   C30.DEL_YN  = 'N'-- ��ȿ�Ⱓ �� �������� ���� ��
    AND     C30.TITLE LIKE '%'||v_Title||'%'
    AND     C30.REG_ID = C01.USER_ID
    AND     ((TRIM(v_Reg_Fdt) IS NULL AND TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN C30.START_DT AND C30.END_DT)
--    OR     (TRIM(v_Reg_Fdt) IS NOT NULL AND C30.REG_DT BETWEEN TO_DATE(v_Reg_Fdt||'000000', 'YYYYMMDDHH24MISS')
--                                                       AND     TO_DATE(v_Reg_Tdt||'235959', 'YYYYMMDDHH24MISS')))
    OR     (TRIM(v_Reg_Fdt) IS NOT NULL AND v_Reg_Fdt BETWEEN C30.START_DT AND C30.END_DT))
    AND     C01.USER_NM LIKE '%'||v_User_Nm||'%'
    ORDER   BY C30.NTC_SEQ DESC;



  END p_sRtcm0030;

  /*****************************************************************************
  -- �������� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0030(
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*��������(�ȳ�/����...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*����                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*��������              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*�����Խ� ������       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*�����Խ� ������       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*��ȸ�Ǽ�              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  
    INSERT  INTO RTCM0030 (
            NTC_SEQ,
            NTC_TYPE,
            TITLE,
            CONTENTS,
            START_DT,
            END_DT,
            READ_CNT,
            ATTCH_FL_SEQ,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )                        
    SELECT  NVL((SELECT  /*+ INDEX_DESC ( RTCM0030 RTCM0030_PK ) */ 
                         NTC_SEQ
                 FROM    RTCM0030
                 WHERE   ROWNUM <= 1)+1, 1),
            v_Ntc_Type,
            v_Title,
            v_Contents,
            v_Start_Dt,
            v_End_Dt,
            v_Read_Cnt,
            v_Attch_Fl_Seq,
            v_Del_Yn,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
     FROM   DUAL;
            
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRtcm0030;


  /*****************************************************************************
  -- �������� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0030(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*��������              */
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*��������(�ȳ�/����...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*����                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*��������              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*�����Խ� ������       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*�����Խ� ������       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*��ȸ�Ǽ�              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN
  
    UPDATE RTCM0030
    SET    NTC_TYPE     = V_Ntc_Type,
           TITLE        = V_Title,
           CONTENTS     = V_Contents,
           START_DT     = V_Start_Dt,
           END_DT       = V_End_Dt,
           READ_CNT     = V_Read_Cnt,
           --ATTCH_FL_SEQ = V_Attch_Fl_Seq,
           DEL_YN       = V_Del_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  NTC_SEQ      = V_Ntc_Seq;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;   
             
  END f_UpdateRtcm0030;
  
  /*****************************************************************************
  -- �������� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0030(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*��������              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0030
    SET    DEL_YN    = 'Y',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  NTC_SEQ   = v_Ntc_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0030;

  
  /*****************************************************************************
  -- �������� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0030(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*��������              */
    v_Ntc_Type       IN RTCM0030.NTC_TYPE%TYPE,       /*��������(�ȳ�/����...)*/
    v_Title          IN RTCM0030.TITLE%TYPE,          /*����                  */
    v_Contents       IN RTCM0030.CONTENTS%TYPE,       /*��������              */
    v_Start_Dt       IN RTCM0030.START_DT%TYPE,       /*�����Խ� ������       */
    v_End_Dt         IN RTCM0030.END_DT%TYPE,         /*�����Խ� ������       */
    v_Read_Cnt       IN RTCM0030.READ_CNT%TYPE,       /*��ȸ�Ǽ�              */
    v_Attch_Fl_Seq   IN RTCM0030.ATTCH_FL_SEQ%TYPE,   /*÷������ ����         */
    v_Del_Yn         IN RTCM0030.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTCM0030.REG_ID%TYPE,         /*����� ID             */    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
  
    e_Error EXCEPTION;
    
  BEGIN
  
    -- �ʼ���: ����,�����Խ� ������, ��������, ����� ID
    IF TRIM(v_Title) IS NULL THEN
        v_Return_Message := '����('||v_Title||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Start_Dt) IS NULL THEN
        v_Return_Message := '�����Խ� ����('||v_Start_Dt||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    IF TRIM(v_End_Dt) IS NULL THEN
        v_Return_Message := '�����Խ� ������ ('||v_End_Dt||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Del_Yn) IS NULL THEN
        v_Return_Message := '��������('||v_Del_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtcm0030Count(v_Ntc_Seq) THEN

        IF 0 != f_InsertRtcm0030(v_Ntc_Type, v_Title, v_Contents, v_Start_Dt,
                                 v_End_Dt, v_Read_Cnt, v_Attch_Fl_Seq, v_Del_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�������� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;            
        END IF;       
                         
    ELSE
    
        IF v_Comm_Dvsn IN ('I', 'U') THEN
        
            IF 0 != f_UpdateRtcm0030(v_Ntc_Seq, v_Ntc_Type, v_Title, v_Contents, v_Start_Dt,
                                     v_End_Dt, v_Read_Cnt, v_Attch_Fl_Seq, v_Del_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
         
        
        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcm0030(v_Ntc_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
           END IF;
            
        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;
                  
        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ó���Ǿ����ϴ�';
    v_ErrorText := '';
   -- COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0030.p_IUDRtcm0030(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0030.p_IUDRtcm0030(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0030;


  /*****************************************************************************
  -- �������� Update - �������� ��ȸ�Ǽ� ������Ʈ
  *****************************************************************************/
  PROCEDURE p_UpdateRtcm0030ReadCnt(
    v_Ntc_Seq        IN RTCM0030.NTC_SEQ%TYPE,        /*��������              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
  
    e_Error EXCEPTION;
    
  BEGIN
        
    IF 0 < f_sRtcm0030Count(v_Ntc_Seq) THEN

        BEGIN
            UPDATE RTCM0030
            SET    READ_CNT     = NVL(READ_CNT,0)+1
            WHERE  NTC_SEQ      = V_Ntc_Seq;
        
        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '�������� ��ȸ�Ǽ� ������Ʈ ����!!!';
            v_ErrorText := SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
        END;
    ELSE
        v_Return_Message := '�ش� ������ȣ('||v_Ntc_Seq||')�� ���� ��ȣ�� ��ȸ�Ǽ� ������Ʈ �Ұ��մϴ�.!!';
        RAISE e_Error; 
    END IF;

    
    v_Success_code := 0;
    v_Return_Message := '���������� ����Ǿ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0030.p_UpdateRtcm0030ReadCnt(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcm0030.p_UpdateRtcm0030ReadCnt(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtcm0030ReadCnt;
    
END Pkg_Rtcm0030;
/
