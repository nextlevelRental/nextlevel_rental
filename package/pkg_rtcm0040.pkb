CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0040 AS
/*******************************************************************************
   NAME:      Pkg_Rtcm0040
   PURPOSE:   �̹��� ���� ����
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �̹��� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcm0040Count(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE        /*���ε����Ϲ�ȣ        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCM0040
    WHERE   FILE_SEQ = v_File_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRTCM0040Count;

                 
  /*****************************************************************************
  -- �̹��� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcm0040 (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Reg_Fdt        IN VARCHAR,                      /*���ε�����FROM        */
    v_Reg_Tdt        IN VARCHAR,                      /*���ε�����TO          */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*���� ���ϸ�         */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE        /*���ε� ���α׷�       */
    ) IS
  BEGIN
    

    OPEN Ref_Cursor FOR
    SELECT  C40.FILE_SEQ,       /*���ε����Ϲ�ȣ        */
            C40.FILE_GRP_SEQ,   /*���ε����ϱ׷��ȣ    */
            C40.FILE_LNM,       /*���� ���ϸ�         */
            C40.FILE_PNM,       /*������ ���ϸ�         */
            C40.FILE_PATH,      /*���ϰ��              */
            C40.FILE_SIZE,      /*���ϻ�����            */
            C40.UPLPG_CD,       /*���ε� ���α׷�       */
            C11.PRGM_NM,        /*���ε� ���α׷���     */
            C40.CUST_NO,        /*����ȣ              */
            S10.CUST_NM,        /*����                */
            C40.ORD_NO,         /*�ֹ���ȣ              */
            C40.REG_ID,         /*����� ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C40.REG_ID) REG_NM, /*����ڸ�       */
            C40.REG_DT,         /*�����                */
            C40.CHG_ID,         /*������ ID             */
            Pkg_Rtcm0001.f_sRtcm0001UserNm(C40.CHG_ID) CHG_NM, /*�����ڸ�       */
            C40.CHG_DT          /*������                */
    FROM    RTCM0040 C40,
            RTCM0011 C11,
            RTSD0100 S10
    WHERE   C40.REG_DT BETWEEN TO_DATE(v_Reg_Fdt||'000000', 'YYYYMMDDHH24MISS') 
                       AND     TO_DATE(v_Reg_Tdt||'235959', 'YYYYMMDDHH24MISS')
    AND     NVL(C40.CUST_NO,' ') LIKE v_Cust_No||'%'
    AND     NVL(C40.ORD_NO, ' ') LIKE v_Ord_No||'%'
    AND     C40.FILE_LNM LIKE '%'||v_File_Lnm||'%'    
    AND     C40.UPLPG_CD = DECODE(v_Uplpg_Cd, NULL, C40.UPLPG_CD, v_Uplpg_Cd)
    AND     C40.UPLPG_CD = C11.PRGM_CD(+)
    AND     C40.CUST_NO  = S10.CUST_NO(+);

                       
  END p_sRtcm0040;

  /*****************************************************************************
  -- �̹��� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*���ε����Ϲ�ȣ        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*���ε����ϱ׷��ȣ    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*���� ���ϸ�         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*������ ���ϸ�         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*���ϻ�����            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*���ε� ���α׷�       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
  INSERT  INTO RTCM0040 (
            FILE_SEQ,
            FILE_GRP_SEQ,
            FILE_LNM,
            FILE_PNM,
            FILE_PATH,
            FILE_SIZE,
            UPLPG_CD,
            CUST_NO,
            ORD_NO,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            f_sRtcm0040Seq(),
            v_File_Grp_Seq,
            v_File_Lnm,
            v_File_Pnm,
            v_File_Path,
            v_File_Size,
            v_Uplpg_Cd,
            v_Cust_No,
            v_Ord_No,
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
        
  END f_InsertRTCM0040;


  /*****************************************************************************
  -- �̹��� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*���ε����Ϲ�ȣ        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*���ε����ϱ׷��ȣ    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*���� ���ϸ�         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*������ ���ϸ�         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*���ϻ�����            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*���ε� ���α׷�       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN
  
    UPDATE RTCM0040
    SET    FILE_GRP_SEQ = v_File_Grp_Seq,
           FILE_LNM     = v_File_Lnm,
           FILE_PNM     = v_File_Pnm,
           FILE_PATH    = v_File_Path,
           FILE_SIZE    = v_File_Size,
           UPLPG_CD     = v_Uplpg_Cd,
           CUST_NO      = v_Cust_No,
           ORD_NO       = v_Ord_No,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  FILE_SEQ     = v_File_Seq;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcm0040;

  /*****************************************************************************
  -- �̹��� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtcm0040(
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*���ε����Ϲ�ȣ        */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTCM0040
    SET    USE_YN   = 'N',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  FILE_SEQ = v_File_Seq;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_DeleteRtcm0040;
  
  
  /*****************************************************************************
  -- �̹��� ���� ����
  *****************************************************************************/
  PROCEDURE p_IUDRtcm0040(
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_File_Seq       IN RTCM0040.FILE_SEQ%TYPE,       /*���ε����Ϲ�ȣ        */
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE,   /*���ε����ϱ׷��ȣ    */
    v_File_Lnm       IN RTCM0040.FILE_LNM%TYPE,       /*���� ���ϸ�         */
    v_File_Pnm       IN RTCM0040.FILE_PNM%TYPE,       /*������ ���ϸ�         */
    v_File_Path      IN RTCM0040.FILE_PATH%TYPE,      /*���ϰ��              */
    v_File_Size      IN RTCM0040.FILE_SIZE%TYPE,      /*���ϻ�����            */
    v_Uplpg_Cd       IN RTCM0040.UPLPG_CD%TYPE,       /*���ε� ���α׷�       */
    v_Cust_No        IN RTCM0040.CUST_NO%TYPE,        /*����ȣ              */
    v_Ord_No         IN RTCM0040.ORD_NO%TYPE,         /*�ֹ���ȣ              */
    v_Use_Yn         IN RTCM0040.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTCM0040.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN


    -- �ʼ���: ���� ���ϸ� ,������ ���ϸ� ,���ϰ�� ,���ϻ����� ,���ε� ���α׷� ,����� ID
    IF TRIM(v_File_Lnm) IS NULL THEN
        v_Return_Message := ' ���� ����('||v_File_Lnm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Pnm) IS NULL THEN
        v_Return_Message := '������ ���ϸ�('||v_File_Pnm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Path) IS NULL THEN
        v_Return_Message := '���ϰ��('||v_File_Path||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Size) IS NULL THEN
        v_Return_Message := '���ϻ�����('||v_File_Size||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Uplpg_Cd) IS NULL THEN
        v_Return_Message := '���ε� ���α׷�('||v_Uplpg_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
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

    IF v_Comm_Dvsn = 'I' THEN
        
        IF 0 != f_InsertRtcm0040(v_File_Seq, v_File_Grp_Seq, v_File_Lnm, v_File_Pnm,
                                 v_File_Path, v_File_Size, v_Uplpg_Cd, v_Cust_No, 
                                 v_Ord_No, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�̹��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
            
        END IF;   
                             
    ELSIF v_Comm_Dvsn = 'U' THEN
    
        IF 0 = f_sRtcm0040Count(v_File_Seq) THEN        
            v_Return_Message := '�ش� ����('||v_File_Seq||')�� ��ϵ� ������ �ƴϹǷ� ������ �Ұ��մϴ�!';
            RAISE e_Error;  
        END IF;
        
        IF 0 != f_UpdateRtcm0040(v_File_Seq, v_File_Grp_Seq, v_File_Lnm, v_File_Pnm,
                                 v_File_Path, v_File_Size, v_Uplpg_Cd, v_Cust_No, 
                                 v_Ord_No, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�̹��� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
         
        
    ELSIF v_Comm_Dvsn = 'D' THEN
    
        IF 0 = f_sRtcm0040Count(v_File_Seq) THEN        
            v_Return_Message := '�ش� ����('||v_File_Seq||')�� ��ϵ� ������ �ƴϹǷ� ������ �Ұ��մϴ�!';
            RAISE e_Error;  
        END IF;
        
        IF 0 != f_DeleteRtcm0040(v_File_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�̹��� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
       END IF;
            
    ELSE
        v_Return_Message := ' ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0040.p_IUDRTCM0040(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_RTCM0040.p_IUDRTCM0040(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcm0040;


  /*****************************************************************************
  -- �̹��� ���� Count - ���ε����Ϲ�ȣ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcm0040Seq RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL((SELECT  /*+ INDEX_DESC ( RTCM0040 RTCM0040_PK ) */ 
                    FILE_SEQ + 1
            FROM    RTCM0040
            WHERE   ROWNUM <= 1), 1)
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0040Seq;
  
  /*****************************************************************************
  -- �̹��� ���� Count - ���ε����ϱ׷��ȣ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcm0040GrpSeq RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  SEQ_RTCM0040FILE_GRP_SEQ.nextval GRP_SEQ
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcm0040GrpSeq;

      
  /*****************************************************************************
  -- �̹��� ���� Select - ���ε����ϱ׷��ȣ ���� �������� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0040FileGrpList (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_File_Grp_Seq   IN RTCM0040.FILE_GRP_SEQ%TYPE    /*���ε����ϱ׷��ȣ    */
    ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  C40.FILE_SEQ,       /*���ε����Ϲ�ȣ        */
            C40.FILE_GRP_SEQ,   /*���ε����ϱ׷��ȣ    */
            C40.FILE_LNM,       /*���� ���ϸ�         */
            C40.FILE_PNM,       /*������ ���ϸ�         */
            C40.FILE_PATH,      /*���ϰ��              */
            C40.FILE_SIZE,      /*���ϻ�����            */
            C40.UPLPG_CD,       /*���ε� ���α׷�       */
            C40.CUST_NO,        /*����ȣ              */
            C40.ORD_NO          /*�ֹ���ȣ              */
    FROM    RTCM0040 C40
    WHERE   C40.FILE_GRP_SEQ = v_File_Grp_Seq
    AND     C40.USE_YN = 'Y';
    
  END p_sRtcm0040FileGrpList;
  
    /*****************************************************************************
  -- �̹��� ���� Select - ���ε����ϱ׷��ȣ ���� �������� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0040FileOne (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_File_Seq   IN RTCM0040.FILE_SEQ%TYPE    /*���ε����ϱ׷��ȣ    */
    ) IS
  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  C40.FILE_SEQ,       /*���ε����Ϲ�ȣ        */
            C40.FILE_GRP_SEQ,   /*���ε����ϱ׷��ȣ    */
            C40.FILE_LNM,       /*���� ���ϸ�         */
            C40.FILE_PNM,       /*������ ���ϸ�         */
            C40.FILE_PATH,      /*���ϰ��              */
            C40.FILE_SIZE,      /*���ϻ�����            */
            C40.UPLPG_CD,       /*���ε� ���α׷�       */
            C40.CUST_NO,        /*����ȣ              */
            C40.ORD_NO          /*�ֹ���ȣ              */
    FROM    RTCM0040 C40
    WHERE   C40.FILE_SEQ = v_File_Seq
    AND     C40.USE_YN = 'Y';
    
  END p_sRtcm0040FileOne;
      
END Pkg_Rtcm0040;
/
