CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0098 AS
/*******************************************************************************
   NAME      Pkg_Rtre0098
   PURPOSE   ���� �ۼ��� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� �ۼ��� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0098Count(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,          /*���ϸ�              */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE           /*ROW ����            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0098
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     ROW_SEQ  = v_Row_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0098Count;

  /*****************************************************************************
  -- ���� �ۼ��� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0098 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW ����              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*���ϳ���              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT  A.RQST_DAY,                  /*��û����            */
            A.FILE_NM,                   /*���ϸ�              */
            A.ROW_SEQ,                   /*ROW ����            */
            A.FILE_TP,                   /*�ۼ��� ���ϱ���     */
            A.FILE_SEQ,                  /*���� ����           */
            A.ROW_DATA,                  /*���ϳ���            */
            A.DEL_YN,                    /*��������            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0098 A
    WHERE   A.RQST_DAY = v_Rqst_Day
    AND     A.FILE_NM  = DECODE(v_File_Nm , NULL, A.FILE_NM , v_File_Nm)
    AND     A.ROW_SEQ  = DECODE(v_Row_Seq , NULL, A.ROW_SEQ , v_Row_Seq)
    AND     A.FILE_TP  = DECODE(v_File_Tp , NULL, A.FILE_TP , v_File_Tp)
    AND     A.FILE_SEQ = DECODE(v_File_Seq, NULL, A.FILE_SEQ, v_File_Seq)
    AND     A.ROW_DATA = DECODE(v_Row_Data, NULL, A.ROW_DATA, v_Row_Data)
    AND     A.DEL_YN   = DECODE(v_Del_Yn  , NULL, A.DEL_YN  , v_Del_Yn)
    AND     A.REG_ID   = DECODE(v_Reg_Id  , NULL, A.REG_ID  , v_Reg_Id)
    ORDER   BY A.RQST_DAY, A.FILE_NM, A.ROW_SEQ;

  END p_sRtre0098;
  
  
  /*****************************************************************************
  -- ���� �ۼ��� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW ����              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*���ϳ���              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Rqst_Day,
            v_File_Nm,
            v_Row_Seq,
            v_File_Tp,
            v_File_Seq,
            v_Row_Data,
            v_Del_Yn,
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

  END f_InsertRtre0098;
  
  
  /*****************************************************************************
  -- ���� �ۼ��� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW ����              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*���ϳ���              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0098
    SET    FILE_TP  = v_File_Tp,
           FILE_SEQ = v_File_Seq,
           ROW_DATA = v_Row_Data,
           DEL_YN   = v_Del_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RQST_DAY = v_Rqst_Day
    AND    FILE_NM  = v_File_Nm
    AND    ROW_SEQ  = v_Row_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0098;

  /*****************************************************************************
  -- ���� �ۼ��� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW ����              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0098
    SET    DEL_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  RQST_DAY = v_Rqst_Day
    AND    FILE_NM  = v_File_Nm
    AND    ROW_SEQ  = v_Row_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0098;

  /*****************************************************************************
  -- ���� �ۼ��� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0098 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN OUT RTRE0098.ROW_SEQ%TYPE,    /*ROW ����              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*���ϳ���              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ��û����,���ϸ�, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Nm) IS NULL THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN
        
        v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
        IF 0 != f_InsertRtre0098(v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                 v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                 v_ErrorText) THEN
            v_Return_Message := '���� �ۼ��� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtre0098Count(v_Rqst_Day, v_File_Nm, v_Row_Seq) THEN
            v_Return_Message := '�ش� ����('||v_Rqst_Day||','||v_File_Nm||','||v_Row_Seq||')�� ��ϵ� �����Ͱ� �����Ƿ� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtre0098(v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                     v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '���� �ۼ��� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtre0098(v_Rqst_Day, v_File_Nm, v_Row_Seq, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '���� �ۼ��� ���� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_IUDRtre0098(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_IUDRtre0098(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0098;

  /*****************************************************************************
  -- ���� �ۼ��� ���� - ��û����/���ϸ� ���� ROW ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0098RowSeq(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN NUMBER IS
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;     /*ROW ����            */
  BEGIN

    SELECT  NVL((SELECT  MAX(ROW_SEQ)
                FROM    RTRE0098
                WHERE   RQST_DAY       = v_Rqst_Day
                AND     FILE_NM        = v_File_Nm
                )+ 1, 1)  AS ROW_SEQ    
    INTO    v_Row_Seq
    FROM    DUAL;

    RETURN v_Row_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0098RowSeq;
  

  /*****************************************************************************
  -- ���� �ۼ��� ���� - ���½�û���� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EI13Batch (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE       /*��û����              */
    , v_File_Nm        IN RTRE0098.FILE_NM%TYPE        /*���ϸ�                */
    , v_Reg_Id         IN RTRE0098.REG_ID%TYPE         /*����� ID             */
    , v_Crlf_Yn        OUT VARCHAR                     /*CRLF����              */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS    
    -- ���½�û����
    -- -���� �� �Ʒ� ������ȸ ������ �����ʿ�!
    CURSOR  Cur_Rtre0060 IS 
    SELECT  A.ACRQ_DAY    /*��û��            */
         ,  A.ACRQ_SEQ    /*���½�û����      */
         ,  A.ACRQ_TP     /*���½�û����      */
         ,  A.ORD_NO      /*����ȣ          */
         ,  B.CUST_TP     /*������          */
         ,  DECODE(B.CUST_TP, '01', B.EBIR_DAY,'02',B.BUSL_NO) EBIR_BUSL
         ,  B.BANK_CD     /*�����ڵ�          */
         ,  B.ACCT_NO     /*���¹�ȣ          */
         ,  B.EBIR_DAY    /*�����������      */
         ,  B.BUSL_NO     /*����ڹ�ȣ        */
         ,  A.ACRQ_ST     /*��û����          */
         ,  A.TXT_NO      /*�������ϸ�         */
      FROM  RTRE0060 A    /*���½�û����T     */
         ,  RTRE0010 B    /*����������T     */
     WHERE  A.ACRQ_FG  = 'A'
       AND  A.ACRQ_TP  = '1'
       AND  A.ACRQ_DAY = v_Rqst_Day
       AND  A.ACC_SEQ  = B.ACC_SEQ
     ORDER  BY A.ACRQ_FG, A.ACRQ_DAY, A.ACRQ_SEQ;

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                     /*����Ÿ ���翩��       */
    
    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT NULL;   /*�ۼ������ϱ���        */
    v_File_Seq   RTRE0098.FILE_SEQ%TYPE DEFAULT NULL;  /*���� ����             */
    v_Row_Seq    RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW ����              */
    v_Row_Data   RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*���ϳ���              */
    v_Del_Yn     RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*��������              */
    v_Fr_Rpc_Day RTRE0099.STR_DAY%TYPE DEFAULT NULL;   /*������� ������       */
    v_To_Rpc_Day RTRE0099.END_DAY%TYPE DEFAULT NULL;   /*������� ������       */
    v_Company_Cd VARCHAR(10) DEFAULT NULL;             /*����ڵ�              */ 
    v_Tdata_Cnt  NUMBER DEFAULT 0;                     /*DATA RECORD COUNT     */
    v_Rec_Byte   NUMBER DEFAULT 0;                     /*Record Byte ũ��      */
    v_Rec_Seq    NUMBER DEFAULT 0;                     /*Record �Ϸù�ȣ       */    
    
  BEGIN

    -- �ʼ���: ��û����,���ϸ�, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    v_File_Tp := 'EI13';
    
    --  �ۼ���ó�� ����(1��) ���� ���� �۽� ���� ���� CLEAR
    FOR cur IN (
        SELECT  A.FILE_TP                   /*�ۼ��� ���ϱ���  */
             ,  A.FILE_SEQ                  /*���� ����        */
          FROM  RTRE0099 A                  /*�ۼ��� �۾�T     */
         WHERE  A.FILE_TP   = 'EI13'        /*�ۼ������ϱ���   */
           AND  A.RQST_DAY  = v_Rqst_Day
           AND  A.FILE_NM   = v_File_Nm  
           AND  A.DEL_YN    = 'N'  
           AND  A.EXTRC_YN  = 'Y'
--           AND  A.CONFI_YN  = 'Y'
           AND  A.FTRAN_YN  = 'N'
    ) LOOP
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        v_File_Tp   := cur.FILE_TP;
        v_File_Seq  := cur.FILE_SEQ;
        
        dbms_output.put_line('v_Tdata_Cnt = ['||v_Tdata_Cnt||']');
    
        -- �۽� ���� ���� üũ (RTRE0098)    
        IF 0 < f_sRtre0098CountCheck(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq) THEN
     
            -- ���� ����� DEL_YN ������Ʈ  
            IF 0 != f_Delete0098FileClear(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� �۽� ���� ����('||v_Rqst_Day||'-'||v_File_Nm||'-'||cur.FILE_TP||'-'||cur.FILE_SEQ||') ���� ����. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;
    END LOOP;   
             
    -- �ۼ���ó�� ����Ȯ�� ( RTRE0099 )  
    IF 1 != v_Tdata_Cnt THEN
        v_Return_Message := '(1)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;

--    -- �ۼ������ϱ���/��û����/���ϸ� ����  ���ϼ��� ȹ��
--    v_File_Seq := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
--    
--    -- ������� ������, ������ ȹ��
--    SELECT  STR_DAY, END_DAY
--      INTO  v_Fr_Rpc_Day, v_To_Rpc_Day
--      FROM  RTRE0099
--     WHERE  FILE_TP  = 'EB13'
--       AND  RQST_DAY = v_Rqst_Day
--       AND  DEL_YN   = 'N';
--    
--    -- �������� �������� ������� ���� �������� �ʴ� ��� �ۼ��� �۾�( RTRE0099)�� ������ ����
--    IF 0 != Pkg_Rtre0099.f_InsertRtre0099 (
--                v_File_Tp   ,        /*(File_Tp  )�ۼ������ϱ���    */
--                v_Rqst_Day  ,        /*(Rqst_Day )��û����          */
--                v_File_Nm   ,        /*(File_Nm  )���ϸ�            */
--                v_File_Seq  ,        /*(File_Seq )���ϼ���          */
--                NULL,                /*(File_Data)���ϵ�����        */
--                'Y',                 /*(Extrc_Yn )������迩��      */
--                'Y',                 /*(Confi_Yn )���Ȯ�ο���      */
--                'N',                 /*(Fcret_Yn )���ϻ�������      */
--                'N',                 /*(Ftran_Yn )�������ۿ���      */
--                NULL,                /*(Stdex_Dd )��������ü����    */
--                v_Fr_Rpc_Day,        /*(Str_Day  )������ ������   */
--                v_To_Rpc_Day,        /*(End_Day  )������ ������   */
--                'N',                 /*(Header_Yn)HEADER ���翩��   */
--                'N',                 /*(Trailer_Y)TRAILER ���翩��  */
--                0,                   /*(Tdata_Cnt)������ �ѰǼ�     */
--                0,                   /*(Tdata_Amt)������ �ѱݾ�     */
--                0,                   /*(Acrq_Cnt )���½�û�Ǽ�      */
--                0,                   /*(Accnrq_Cn)���������Ǽ�      */
--                0,                   /*(Rmcnrq_Cn)�������������Ǽ�  */
--                0,                   /*(Reqst_Cnt)��û�Ǽ�          */
--                0,                   /*(Reqst_Amt)��û�ݾ�          */
--                0,                   /*(Cncrq_Cnt)��ҿ�û�Ǽ�      */
--                0,                   /*(Cncrq_Amt)��ҿ�û�ݾ�      */
--                0,                   /*(Srecp_Cnt)������� ó���Ǽ� */
--                0,                   /*(Srecp_Amt)������� ó���ݾ� */
--                0,                   /*(Hsrcp_Cnt)�κа��� ó���Ǽ� */
--                0,                   /*(Hsrcp_Amt)�κа��� ó���ݾ� */
--                0,                   /*(Erecp_Cnt)�������� ó���Ǽ� */
--                0,                   /*(Erecp_Amt)�������� ó���ݾ� */
--                0,                   /*(Scnrq_Cnt)������� ó���Ǽ� */
--                0,                   /*(Scnrq_Amt)������� ó���ݾ� */
--                0,                   /*(Ecnrq_Cnt)��ҿ��� ó���Ǽ� */
--                0,                   /*(Ecnrq_Amt)��ҿ��� ó���ݾ� */
--                'N',                 /*(Del_Yn   )��������          */
--                v_Reg_Id,            /*(Reg_Id   )����� ID         */
--                v_ErrorText
--    ) THEN                        
--        v_Return_Message := ' �ۼ��� �۾�(RTRE0099) Insert ����!!!'||'-'||v_ErrorText;
--        RAISE e_Error;
--    END IF;    

    -- ����ڵ�(�̿����ĺ��ڵ�)
    v_Company_Cd := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    
    -- �۾�����(Cur_Rtre0060 �� ������ ���� ����ؾ� ��!)
    SELECT  COUNT(*)
      INTO  v_Tdata_Cnt
      FROM  RTRE0060 A  /*���½�û����T     */
         ,  RTRE0010 B  /*����������T     */
     WHERE  A.ACRQ_FG  = 'A'
       AND  A.ACRQ_TP  = '1'
       AND  A.ACRQ_DAY = v_Rqst_Day
       AND  A.ACC_SEQ  = B.ACC_SEQ
     ORDER  BY A.ACRQ_FG, A.ACRQ_DAY, A.ACRQ_SEQ;
    
    -- �۽����� Header Record ����
    v_Row_Data := 'AE1112'                                  /*���������ڵ�(����)           6 byte*/
               || '11'                                      /*Record����(����)             2 byte*/
               || '0000000'                                 /*�Ϸù�ȣ(����)               7 byte*/
               || v_Rqst_Day                                /*��û��(���ϸ� ���ڿ� ����)   8 byte*/
               || RPAD(NVL(TRIM(v_Company_Cd),' '),20,' ')  /*�̿����ĺ��ڵ�            20 byte*/
               || LPAD(v_Tdata_Cnt,7,'0')                   /*�������ڷᰳ��               7 byte*/
               || RPAD(' ',974,' ');                        /*FILLER(����)               974 byte*/

    v_Rec_Byte := LENGTHB(v_Row_Data);
    
    --  �۽����� Header Record Size ����
    IF v_Rec_Byte != 6+2+7+8+20+7+974 THEN
        v_Return_Message := '�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||') Header Record ������('||v_Rec_Byte||')�� ��ȿ���� �ʽ��ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF; 
    
    -- �۽����� Header Record ������ ��û����/���ϸ� ���� ROW ���� ȹ��
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);    
    
    -- �۽����� Header Record - ���� �ۼ��� ���� Insert
    IF 0 != f_InsertRtre0098(v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' �۽����� Header Record ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- �۽����� Data Record ����
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;
        
        v_Rec_Seq  := v_Rec_Seq + 1;
        
        v_Row_Data := 'AE1112'                                  /*���������ڵ�(����)           6 byte*/
                   || '22'                                      /*Record����(����)             2 byte*/
                   || LPAD(v_Rec_Seq, 7, '0')                   /*�Ϸù�ȣ                     7 byte*/
                   || RPAD(' ',10,' ')                          /*FILLER(����)                10 byte*/
                   || RPAD(NVL(TRIM(v_Company_Cd),' '),20,' ')  /*�̿����ĺ��ڵ�            20 byte*/
                   || RPAD(NVL(CUR.ORD_NO,' '),30,' ')          /*�����ڹ�ȣ                  30 byte*/
                   || LPAD(NVL(CUR.BANK_CD,' '),3,'0')          /*�������(����)�ڵ�           3 byte*/
                   || RPAD(NVL(CUR.ACCT_NO,' '),20,' ')         /*���¹�ȣ                    20 byte*/
                   || v_Rqst_Day                                /*��û��                       8 byte*/
                   || '5'                                       /*�����ڷ� ����(5=ARS)         1 byte*/
                   || 'mp3  '                                   /*�����ڷ� Ȯ����              5 byte*/
                   || '<' || trim(CUR.TXT_NO) || '>';           /*���� �������ϸ� (������� �ƴ�)    */
                   /*
                    * ���� ������ Java���� ����
                    * - �����ڷ� ����(Byte)          7 byte
                    * - �����ڷ� Binary Data         n byte
                    * - FILLER                       n byte
                    */                    

        v_Rec_Byte := LENGTHB(v_Row_Data);
                              
        --  �۽����� Data Record Size ����
--        IF MOD(v_Rec_Byte,1024) != 0 THEN
--            v_Return_Message := '�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')DATA RECORD ������('||v_Rec_Byte||')�� ��ȿ���� �ʽ��ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
--            RAISE e_Error;
--        END IF;
        
        -- �۽����� Data Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
        v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);        
      
        -- �۽����� Data Record - ���� �ۼ��� ���� Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := ' �۽����� DATA RECORD ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
    
    END LOOP;       

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;
    
    -- �۽����� Trailer Record ����
    v_Row_Data := 'AE1112'                                  /*���������ڵ�(����)                               6 byte*/
               || '33'                                      /*Record����(����)                                 2 byte*/
               || '9999999'                                /*�Ϸù�ȣ(����)                                   7 byte*/
               || RPAD(NVL(TRIM(v_Company_Cd),' '),20,' ')  /*�̿����ĺ��ڵ�                                20 byte*/
               || LPAD(v_Tdata_Cnt,7,'0');                  /*��Data Record��(Header�� �������ڷᰳ���� ����)  7 byte*/               
               /*
                * ���� Trailer Record �κ��� java���� ����
                * - ��Data Block��  10 byte
                * - FILLER(����)   972 byte
                */

    v_Rec_Byte := LENGTHB(v_Row_Data);
    
    --  �۽����� Trailer Record Size ����
    IF v_Rec_Byte != 6+2+7+20+7 THEN
        v_Return_Message := '(4)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')Tail RECORD ������('||v_Rec_Byte||')�� ��ȿ���� �ʽ��ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
    
    -- �۽����� Trailer Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    -- �۽����� Trailer Record - ���� �ۼ��� ���� Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' �۽����� Tail RECORD ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- �ۼ��� �Ǽ� ������Ʈ
    IF 0 !=Pkg_Rtre0099.f_UpdateRtre0099BatchResult (
        v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, 'Y', v_Tdata_Cnt, 0, 0, v_Reg_Id, v_ErrorText
    ) THEN
        v_Return_Message := '�ۼ��� �۾� UPDATE - �ۼ��� �Ǽ� ������Ʈ ����!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;
    
    -- �ۼ��� ó������ ������Ʈ (RTRE0099 )
    IF 0 != Pkg_Rtre0099.f_UpdateRtre0099FileResult (
        v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,'Y', 'Y', 'Y', v_Tdata_Cnt, v_Reg_Id,v_ErrorText
    ) THEN
        v_Return_Message := ' �ۼ��� ó������(RTRE0099) ������Ʈ �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 6. ���½�û ���� ���� ������Ʈ (������)
--    UPDATE  RTRE0060
--       SET  ACRQ_ST  = '2'
--     WHERE  ACRQ_FG  = 'A'
--       AND  ACRQ_TP  = '1'
--       AND  ACRQ_DAY = v_Rqst_Day;
        
    v_Crlf_Yn := 'N';
   
    -- ���� �ۼ��� ���� Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
    
    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EI13Batch(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EI13Batch(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098EI13Batch;
  
  /*****************************************************************************
  -- ���� �ۼ��� ���� - ���½�ûó�� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB13Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF����              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    -- �ۼ���ó�� ���� 
    CURSOR  Cur_Rtre0099 IS 
    SELECT  A.FILE_TP,   /*�ۼ��� ���ϱ���  */
            A.FILE_SEQ   /*���� ����        */
    FROM    RTRE0099 A   /*�ۼ��� �۾�T     */
    WHERE   A.FILE_TP   = 'EB13' /*�ۼ������ϱ��� */
    AND     A.RQST_DAY  = v_Rqst_Day
    AND     A.FILE_NM   = v_File_Nm  
    AND     A.DEL_YN    = 'N'  
    AND     A.EXTRC_YN  = 'Y'
    AND     A.CONFI_YN  = 'Y'
    AND     A.FTRAN_YN  = 'N';
    
    -- ���½�û����
    CURSOR  Cur_Rtre0060 IS 
    SELECT  A.ACRQ_DAY, /*��û��            */
            A.ACRQ_SEQ, /*���½�û����      */
            A.ACRQ_TP,  /*���½�û����      */
            A.ORD_NO,   /*����ȣ          */
            B.CUST_TP,  /*������          */
            DECODE(B.CUST_TP, '01', B.EBIR_DAY,'02',B.BUSL_NO) EBIR_BUSL,
            B.BANK_CD,  /*�����ڵ�          */
            B.ACCT_NO,  /*���¹�ȣ          */
            B.EBIR_DAY, /*�����������      */
            B.BUSL_NO,  /*����ڹ�ȣ        */
            A.ACRQ_ST   /*��û����          */
    FROM    RTRE0060 A, /*���½�û����T     */
            RTRE0010 B  /*����������T     */
    WHERE   A.ACRQ_FG  = 'A'
    AND     A.ACRQ_DAY = v_Rqst_Day
    AND     A.ACC_SEQ  = B.ACC_SEQ
    ORDER   BY A.ACRQ_FG, A.ACRQ_DAY, A.ACRQ_SEQ;   
    

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;                  /* ����Ÿ ���翩��    */
    
    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*�ۼ������ϱ���      */
    v_File_Seq  RTRE0098.FILE_SEQ%TYPE DEFAULT NULL;/*���� ����           */
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL; /*ROW ����            */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;/*���ϳ���            */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';   /*��������            */
    v_Company_Cd VARCHAR(10) DEFAULT NULL;          /*����ڵ�            */ 
    v_Tdata_Cnt  NUMBER DEFAULT 0;                  /*DATA RECORD COUNT   */
    v_App_Cnt    NUMBER DEFAULT 0;                  /*���½�û�Ǽ�        */
    v_Ter_Cnt    NUMBER DEFAULT 0;                  /*���������Ǽ�        */
    v_Ran_Cnt    NUMBER DEFAULT 0;                  /*���������Ǽ�        */
    
  BEGIN

    -- �ʼ���: ��û����,���ϸ�, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
   
    --  �ۼ���ó�� ����(1��) ���� ���� �۽� ���� ���� CLEAR
    FOR CUR IN Cur_Rtre0099 LOOP
        EXIT WHEN Cur_Rtre0099%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        v_File_Tp  := CUR.FILE_TP;
        v_File_Seq := CUR.FILE_SEQ;
    
        -- 2. �۽� ���� ���� üũ ( RTRE0098 )    
        IF 0 < f_sRtre0098CountCheck(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq) THEN
     
            -- 2-1) ���� ����� DEL_YN ������Ʈ  
            IF 0 != f_Delete0098FileClear(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� �۽� ���� ����('||v_Rqst_Day||'-'||v_File_Nm||'-'||CUR.FILE_TP||'-'||CUR.FILE_SEQ||') ���� ����. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;
            
    END LOOP;       
    
    -- 1. �ۼ���ó�� ����Ȯ�� ( RTRE0099 )  
    IF 1 != v_Tdata_Cnt THEN
        v_Return_Message := '(1)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
    
    
    IF Cur_Rtre0099%ISOPEN THEN
        CLOSE Cur_Rtre0099;
    END IF;
    
    -- 4. ���� ���� ���� ( RTRE0098 )
        
    -- ����ڵ�(�̿����ĺ��ڵ�)
    v_Company_Cd := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    
    -- �۽����� Header Record ����
    v_Row_Data := 'H' ||
                  '00000000' ||
                  RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                  RPAD(v_File_Nm,8,' ') ||
                  RPAD(SUBSTR(v_Rqst_Day,3),6,' ') ||
                  RPAD(' ',87, ' ');
    
    --  �۽����� Header Record Size ����
    IF LENGTHB(v_Row_Data) != 1+8+10+8+6+87 THEN
        v_Return_Message := '(2)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
 
    
    -- �۽����� Header Record ������ ��û����/���ϸ� ���� ROW ���� ȹ��
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    
    -- �۽����� Header Record - ���� �ۼ��� ���� Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' �۽����� HEADER RECORD ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- �۽����� Data Record ����
    v_Tdata_Cnt := 0;
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;                       
        
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        
        -- �۽����� Data Record ����
        v_Row_Data := 'R' ||
                      LPAD(CUR.ACRQ_SEQ,8,'0') ||
                      RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||                      
                      RPAD(SUBSTR(CUR.ACRQ_DAY,3),6,' ') ||
                      RPAD(NVL(CUR.ACRQ_TP,' '),1,' ') ||                
                      RPAD(NVL(CUR.ORD_NO,' '),20,' ') ||
                      RPAD(NVL(CUR.BANK_CD,' '),7,'0') ||
                      RPAD(NVL(CUR.ACCT_NO,' '),16,' ') ||
                      RPAD(NVL(CUR.EBIR_BUSL,' '),16,' ') ||                      
                      RPAD(' ',4, ' ')||
                      RPAD(' ',2, ' ')||
                      RPAD(' ',1, ' ')||
                      RPAD(' ',4, ' ')||
                      RPAD(' ',1, ' ')||
                      RPAD(' ',12, ' ')||
                      RPAD(' ',11, ' ');
                      
        --  �۽����� Data Record Size ����
        IF LENGTHB(v_Row_Data) != 1+8+10+6+1+20+7+16+16+4+2+1+4+1+12+11 THEN
            v_Return_Message := '(3)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
            RAISE e_Error;
        END IF;
        
        -- �۽����� Data Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
        v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
        
      
        -- �۽����� Data Record - ���� �ۼ��� ���� Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := ' �۽����� HEADER RECORD ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF CUR.ACRQ_TP = '1' THEN
            v_App_Cnt := v_App_Cnt+1; /*���½�û�Ǽ�*/
        ELSIF CUR.ACRQ_TP = '3' THEN    
            v_Ter_Cnt := v_Ter_Cnt+1; /*���������Ǽ�*/
        ELSIF CUR.ACRQ_TP = '7' THEN  
            v_Ran_Cnt := v_Ran_Cnt+1; /*���������Ǽ�*/
        END IF;
    
    END LOOP;       

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;
    
    -- �۽����� Trailer Record ����
    v_Row_Data := 'T' ||
                  '99999999' ||
                  RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                  RPAD(v_File_Nm,8,' ') ||
                  LPAD(v_Tdata_Cnt,8,'0') ||
                  LPAD(v_App_Cnt,8,'0') ||
                  LPAD('0',8,'0') ||
                  LPAD(v_Ter_Cnt,8,'0') ||
                  LPAD(v_Ran_Cnt,8,'0') ||
                  RPAD(' ',43, ' ')||
                  RPAD(' ',10, ' ');
                  
    --  �۽����� Trailer Record Size ����
    IF LENGTH(v_Row_Data) != 1+8+10+8+8+8+8+8+8+43+10 THEN
        v_Return_Message := '(4)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
    
    -- �۽����� Trailer Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    -- �۽����� Trailer Record - ���� �ۼ��� ���� Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' �۽����� HEADER RECORD ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 5. �ۼ��� ó������ ������Ʈ (RTRE0099 )
    IF 0 != Pkg_Rtre0099.f_UpdateRtre0099FileResult (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, 
                                                     'Y', 'Y', 'Y', v_Tdata_Cnt, v_Reg_Id, 
                                                     v_ErrorText) THEN
        v_Return_Message := ' �ۼ��� ó������(RTRE0099) ������Ʈ �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- 6. ���½�û ���� ���� ������Ʈ (������)
    UPDATE RTRE0060
    SET ACRQ_ST = '2'
    WHERE   ACRQ_FG  = 'A'
    AND     ACRQ_DAY = v_Rqst_Day;
        
    v_Crlf_Yn := 'N';
   
    -- ���� �ۼ��� ���� Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
    
    
    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EB13Batch(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EB13Batch(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098EB13Batch;

  /*****************************************************************************
  -- ���� �ۼ��� ���� - ���½�ûó�� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB12Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF����              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    -- �ۼ���ó�� ���� 
    CURSOR  Cur_Rtre0099 IS 
    SELECT  A.FILE_TP,   /*�ۼ��� ���ϱ���  */
            A.FILE_SEQ   /*���� ����        */
    FROM    RTRE0099 A   /*�ۼ��� �۾�T     */
    WHERE   A.FILE_TP   = 'EB12' /*�ۼ������ϱ��� */
    AND     A.RQST_DAY  = v_Rqst_Day
    AND     A.FILE_NM   = v_File_Nm  
    AND     A.DEL_YN    = 'N'  
    AND     A.EXTRC_YN  = 'Y'
    AND     A.CONFI_YN  = 'Y'
    AND     A.FTRAN_YN  = 'N';
    
    -- ���½�û����
    CURSOR  Cur_Rtre0060 IS 
    SELECT  A.ACRQ_DAY, /*��û��            */
            A.ACRQ_SEQ, /*���½�û����      */
            A.ACRQ_TP,  /*���½�û����      */
            A.ORD_NO,   /*����ȣ          */
            B.CUST_TP,  /*������          */
            DECODE(B.CUST_TP, '01', B.EBIR_DAY,'02',B.BUSL_NO) EBIR_BUSL,
            B.BANK_CD,  /*�����ڵ�          */
            B.ACCT_NO,  /*���¹�ȣ          */
            B.EBIR_DAY, /*�����������      */
            B.BUSL_NO,  /*����ڹ�ȣ        */
            A.ACRQ_ST,  /*��û����          */
            A.ACERCD,   /*���½�û ����ڵ� */
            A.ACBRCD,   /*���°��� ���ڵ�   */
            A.RQBRCD    /*��� ���ڵ�       */
    FROM    RTRE0060 A, /*���½�û����T     */
            RTRE0010 B  /*����������T     */
    WHERE   A.ACRQ_FG  = 'B'
    AND     A.ACRQ_DAY = v_Rqst_Day
    AND     A.ACRQ_ST IN ('3', '7') -- ����������
    AND     A.ACC_SEQ  = B.ACC_SEQ
    ORDER   BY A.ACRQ_FG, A.ACRQ_DAY, A.ACRQ_SEQ;   
    

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;      -- ����Ÿ ���翩��
    
    v_File_Tp   RTRE0099.FILE_TP%TYPE DEFAULT NULL; /*�ۼ������ϱ���      */
    v_File_Seq  RTRE0098.FILE_SEQ%TYPE DEFAULT NULL;/*���� ����           */
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL; /*ROW ����            */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;/*���ϳ���            */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';   /*��������            */
    v_Company_Cd VARCHAR(10) DEFAULT NULL;          /*����ڵ�            */ 
    v_Tdata_Cnt NUMBER DEFAULT 0;                   /*DATA RECORD COUNT   */
    v_App_Cnt NUMBER DEFAULT 0;                     /*���½�û�Ǽ�        */
    v_Ter_Cnt NUMBER DEFAULT 0;                     /*���������Ǽ�        */
    v_Ran_Cnt NUMBER DEFAULT 0;                     /*���������Ǽ�        */
    
  BEGIN

    -- �ʼ���: ��û����,���ϸ�, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
   
    --  �ۼ���ó�� ����(1��) ���� ���� �۽� ���� ���� CLEAR
    FOR CUR IN Cur_Rtre0099 LOOP
        EXIT WHEN Cur_Rtre0099%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
        v_File_Tp  := CUR.FILE_TP;
        v_File_Seq := CUR.FILE_SEQ;
    
        -- 2. �۽� ���� ���� üũ ( RTRE0098 )    
        IF 0 < f_sRtre0098CountCheck(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq) THEN
     
            -- 2-1) ���� ����� DEL_YN ������Ʈ  
            IF 0 != f_Delete0098FileClear(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� �۽� ���� ����('||v_Rqst_Day||'-'||v_File_Nm||'-'||CUR.FILE_TP||'-'||CUR.FILE_SEQ||') ���� ����. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;
            
    END LOOP;       
    
    -- 1. �ۼ���ó�� ����Ȯ�� ( RTRE0099 )  
    IF 1 != v_Tdata_Cnt THEN
        v_Return_Message := '(1)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
    
    
    IF Cur_Rtre0099%ISOPEN THEN
        CLOSE Cur_Rtre0099;
    END IF;
    
    -- 4. ���� ���� ���� ( RTRE0098 )
        
    -- ����ڵ�(�̿����ĺ��ڵ�)
    v_Company_Cd := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    
    -- �۽����� Header Record ����
    v_Row_Data := 'H' ||
                  '00000000' ||
                  RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                  RPAD(v_File_Nm,8,' ') ||
                  RPAD(SUBSTR(v_Rqst_Day,3),6,' ') ||
                  RPAD(' ',87, ' ');
    
    --  �۽����� Header Record Size ����
    IF LENGTH(v_Row_Data) != 1+8+10+8+6+87 THEN
        v_Return_Message := '(2)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
 
    
    -- �۽����� Header Record ������ ��û����/���ϸ� ���� ROW ���� ȹ��
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    
    -- �۽����� Header Record - ���� �ۼ��� ���� Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' �۽����� HEADER RECORD ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- �۽����� Data Record ����
    v_Tdata_Cnt := 0;
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;                       
        
        v_Tdata_Cnt := v_Tdata_Cnt + 1;
        
        -- �۽����� Data Record ����
        v_Row_Data := 'R' ||
                      LPAD(CUR.ACRQ_SEQ,8,'0') ||
                      RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||                      
                      RPAD(SUBSTR(CUR.ACRQ_DAY,3),6,' ') ||
                      RPAD(NVL(CUR.ACRQ_TP,' '),1,' ') ||                
                      RPAD(NVL(CUR.ORD_NO,' '),20,' ') ||
                      RPAD(NVL(CUR.BANK_CD||CUR.ACBRCD,' '),7,'0') ||
                      RPAD(NVL(CUR.ACCT_NO,' '),16,' ') ||
                      RPAD(NVL(CUR.EBIR_BUSL,' '),16,' ') ||                      
                      RPAD(NVL(CUR.RQBRCD,' '),4, ' ')||
                      RPAD('00',2, ' ')||
                      RPAD('N',1, ' ')||
                      RPAD(NVL(CUR.ACERCD,' '),4, ' ')||
                      RPAD(' ',1, ' ')||
                      RPAD(' ',12, ' ')||
                      RPAD(' ',11, ' ');                      
                      
        --  �۽����� Data Record Size ����
        IF LENGTH(v_Row_Data) != 1+8+10+6+1+20+7+16+16+4+2+1+4+1+12+11 THEN
            v_Return_Message := '(3)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
            RAISE e_Error;
        END IF;
        
        -- �۽����� Data Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
        v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
        
      
        -- �۽����� Data Record - ���� �ۼ��� ���� Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := ' �۽����� HEADER RECORD ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
        IF CUR.ACRQ_TP = '1' THEN
            v_App_Cnt := v_App_Cnt+1; /*���½�û�Ǽ�*/
        ELSIF CUR.ACRQ_TP = '3' THEN    
            v_Ter_Cnt := v_Ter_Cnt+1; /*���������Ǽ�*/
        ELSIF CUR.ACRQ_TP = '7' THEN  
            v_Ran_Cnt := v_Ran_Cnt+1; /*���������Ǽ�*/
        END IF;
    
    END LOOP;       

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;
    
    -- �۽����� Trailer Record ����
    v_Row_Data := 'T' ||
                  '99999999' ||
                  RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                  RPAD(v_File_Nm,8,' ') ||
                  LPAD(v_Tdata_Cnt,8,'0') ||
                  LPAD(v_App_Cnt,8,'0') ||
                  LPAD('0',8,'0') ||
                  LPAD(v_Ter_Cnt,8,'0') ||
                  LPAD(v_Ran_Cnt,8,'0') ||
                  RPAD(' ',43, ' ')||
                  RPAD(' ',10, ' ');
                  
    --  �۽����� Trailer Record Size ����
    IF LENGTH(v_Row_Data) != 1+8+10+8+8+8+8+8+8+43+10 THEN
        v_Return_Message := '(4)�ش� ����('||v_Rqst_Day||'-'||v_File_Nm||')�� ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
    
    -- �۽����� Trailer Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
    v_Row_Seq := f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
    
    -- �۽����� Trailer Record - ���� �ۼ��� ���� Insert
    IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := ' �۽����� HEADER RECORD ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    -- 5. �ۼ��� ó������ ������Ʈ (RTRE0099 )
    IF 0 != Pkg_Rtre0099.f_UpdateRtre0099FileResult (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, 
                                                     'Y', 'Y', 'Y', v_Tdata_Cnt, v_Reg_Id, 
                                                     v_ErrorText) THEN
        v_Return_Message := ' �ۼ��� ó������(RTRE0099) ������Ʈ �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
    v_Crlf_Yn := 'N';
   
    -- ���� �ۼ��� ���� Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
    
    
    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098BatchFileCreate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098BatchFileCreate(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098EB12Batch;
  
  /*****************************************************************************
  -- ���� �ۼ��� ���� - ���½�ûó�� ���ϻ��� - �޸��� �и��� ��Ʈ�������͸� ����ϴ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB13String (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN STRING,                       /*���ϳ���              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Tdata_Cnt      OUT VARCHAR,                     /*�����ͰǼ�            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    
    CURSOR  Cur_Rtre0098 IS
    SELECT  TRIM(SUBSTR(','||v_Row_Data||',',
                    INSTR(','||v_Row_Data||',', ',', 1, LEVEL)+1,
                    (INSTR(','||v_Row_Data||',', ',', 1, LEVEL+1) - INSTR(','||v_Row_Data||',', ',', 1, LEVEL))-1
                )) AS ROW_DATA
    FROM    DUAL 
    CONNECT BY LEVEL <= ( LENGTH(v_Row_Data) - LENGTH(REPLACE(v_Row_Data, ',', '')) + 1 );


    e_Error     EXCEPTION;
    v_Row_Count NUMBER DEFAULT 0;
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL; /*ROW ����            */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';   /*��������            */
    
  BEGIN

    -- �ʼ���: ��û����,���ϸ�, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
   
  
    SELECT  COUNT(A.ROW_SEQ)
    INTO    v_Row_Count
    FROM    RTRE0098 A
    WHERE   A.RQST_DAY = v_Rqst_Day
    AND     A.FILE_NM  = v_File_Nm
    AND     A.FILE_TP  = v_File_Tp
    AND     A.FILE_SEQ = v_File_Seq
    AND     A.ROW_DATA IN ( SELECT  TRIM(SUBSTR(','||v_Row_Data||',',
                                            INSTR(','||v_Row_Data||',', ',', 1, LEVEL)+1,
                                            (INSTR(','||v_Row_Data||',', ',', 1, LEVEL+1) - INSTR(','||v_Row_Data||',', ',', 1, LEVEL))-1
                                        ))
                            FROM    DUAL 
                            CONNECT BY LEVEL <= ( LENGTH(v_Row_Data) - LENGTH(REPLACE(v_Row_Data, ',', '')) + 1 )
                            );
                  
    
    DBMS_OUTPUT.Put_Line('v_Row_Count = ' || TO_CHAR(v_Row_Count));
    
    IF 0< v_Row_Count THEN
        v_Return_Message := '�̹� ��ϵ� �����Ͱ� �����ϹǷ� ó���� �Ұ��մϴ�.';
        RAISE e_Error;
    END IF;
   
    v_Tdata_Cnt := 0;
    
    --  �ۼ���ó�� ����(1��) ���� ���� �۽� ���� ���� CLEAR
    FOR CUR IN Cur_Rtre0098 LOOP
        EXIT WHEN Cur_Rtre0098%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;
    
        -- �۽����� Data Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
        v_Row_Seq := Pkg_Rtre0098.f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);
        
      
        -- �۽����� Data Record - ���� �ۼ��� ���� Insert
        IF 0 != Pkg_Rtre0098.f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, v_File_Seq, CUR.ROW_DATA, v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
            
    END LOOP;       
        
    
    IF Cur_Rtre0098%ISOPEN THEN
        CLOSE Cur_Rtre0098;
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '���� �ۼ��� ���� ['||TO_CHAR(v_Tdata_Cnt)||']���� ���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EB13String(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098EB13String(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098EB13String;
    
  /*****************************************************************************
  -- ���� �ۼ��� ���� Count - �ۼ���ó�� ���� üũ COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0098CountCheck(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE        /*���� ����             */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0098
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     FILE_TP  = v_File_Tp
    AND     FILE_SEQ = v_File_Seq
    AND     DEL_YN   = 'N';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0098CountCheck;
  
  /*****************************************************************************
  -- ���� �ۼ��� ���� Count - �ۼ���ó�� ���� üũ COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0098CountCheck2(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE         /*���ϸ�                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0098
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     DEL_YN   = 'N';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0098CountCheck2;
  
  /*****************************************************************************
  -- ���� �ۼ��� ���� Update - �۽� ���� ����� DEL_YN ������Ʈ
  *****************************************************************************/
  FUNCTION f_Delete0098FileClear (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0098
    SET     DEL_YN   = 'Y',
            CHG_ID   = v_Reg_Id,
            CHG_DT   = SYSDATE 
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     FILE_TP  = v_File_Tp
    AND     FILE_SEQ = v_File_Seq
    AND     DEL_YN   = 'N';
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_Delete0098FileClear;
  
  /*****************************************************************************
  -- ���� �ۼ��� ���� Update - �۽� ���� ����� DEL_YN ������Ʈ
  *****************************************************************************/
  FUNCTION f_Delete0098FileClear2 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0098
    SET     DEL_YN   = 'Y',
            CHG_ID   = v_Reg_Id,
            CHG_DT   = SYSDATE 
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     DEL_YN   = 'N';
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_Delete0098FileClear2;
  
 
  /*****************************************************************************
  -- ���� �ۼ��� ���� Delete - �۽� ���� ���ε� ��ó���ϱ����� �����ڷ� ����
  *****************************************************************************/
  FUNCTION f_Delete0098Day_Nm (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM    RTRE0098
    WHERE   RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_Delete0098Day_Nm;
  
   
  /*****************************************************************************
  -- ���� �ۼ��� ���� - �����ü�ڷ� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098TransAccum (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_Crlf_Yn        OUT VARCHAR2                     /* CRLF ����            */
    ) IS
    
    e_Error EXCEPTION;
    v_Row_Count  NUMBER DEFAULT 0;
    v_Rcms_Amt   RTRE0070.RCMS_AMT%TYPE;
    v_File_Seq   RTRE0098.FILE_SEQ%TYPE;               /*���ϼ���              */
    v_Row_Seq    RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW ����              */
    v_Del_Yn     RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*��������              */
    v_Company_Cd VARCHAR(10) DEFAULT NULL;             /*����ڵ�              */ 


  BEGIN

    -- �ʼ���: ��û���� ,���ϸ� ,���ϱ��� ,����� ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Tp) IS NULL) OR (4 != LENGTH(TRIM(v_File_Tp))) THEN
        v_Return_Message := '���ϱ���('||v_File_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
        
  -- �����ü ����  Ȯ��(Rtre0099)
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck2 (v_File_Tp, v_Rqst_Day, v_File_Nm, 'TRANS') THEN
        v_Return_Message := '������ ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���.';
        RAISE e_Error;
    END IF;
    
  -- ���� ���  �ڷ�  check(RTre0098)
    v_File_SEQ := Pkg_Rtre0099.f_sRtre0099FinalFileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
    
    SELECT  COUNT(1) 
    INTO    v_Row_Count
    FROM    RTRE0098 A
    WHERE   A.RQST_DAY = v_Rqst_Day
    AND     A.FILE_NM  = v_File_Nm
    AND     A.FILE_TP  = v_File_Tp
    AND     A.FILE_SEQ = v_File_SEQ;
    
  -- ���� ���  �ڷ� ����(Rtre0098)
    IF v_Row_Count  > 0 THEN
        DELETE  RTRE0098 A
        WHERE   A.RQST_DAY = v_Rqst_Day
        AND     A.FILE_NM  = v_File_Nm
        AND     A.FILE_TP  = v_File_Tp
        AND     A.FILE_SEQ = v_File_SEQ;
        IF SQLCODE <> 0 THEN
            v_Return_Message := '�����ü ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.';
            RAISE e_Error;
        END IF;
    END IF; 

  -- ����ڵ�(�̿����ĺ��ڵ�)
    v_Company_Cd := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');

  -- �ۼ������ϳ��� HEAD ����(Rtre0098)
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, 0 ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               (
                 SELECT  'H' || 
                         '00000000'  ||
                         RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
                         SUBSTR(v_File_Nm,1,8) ||
                         SUBSTR(v_Rqst_Day,3,6) ||
                         RPAD((SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R026'), 7, ' ') ||
                         RPAD((SELECT CD FROM RTCM0051 WHERE CD_GRP_CD = 'R027'), 16, ' ') ||
                         RPAD(' ', 94, ' ')  EB21 
                 FROM DUAL  ) ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
       FROM   DUAL;
    
    IF SQLCODE <> 0 THEN
        v_Return_Message := '�����ü ���� �ۼ��� ����(RTRE0098) HEAD���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
    
    
  -- �ۼ������ϳ��� BODY ����(Rtre0098)
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, ROWNUM ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               'R' || LPAD(TO_CHAR(ROWNUM),8,'0')  ||
               RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
               BANK_CD || ACCT_NO || RCMS_AMT ||  BIR_NO ||
               ' ' || '    ' || RPAD('�ؼ�Ÿ�̾�',16,TO_MULTI_BYTE(' ')) ||
               '  ' || ORD_NO || '     ' || '0' ||
               RPAD(' ', 12, ' ') || RPAD(' ', 21, ' ') ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
        FROM (
                SELECT  RPAD(B.BANK_CD,7,'0') BANK_CD, 
                        RPAD(REPLACE(B.ACCT_NO, '-',''),16,' ')  ACCT_NO,
                        LPAD(TO_CHAR(A.RCMS_AMT),13,'0') RCMS_AMT,
                        RPAD(DECODE(B.CUST_TP, '01', B.EBIR_DAY, B.BUSL_NO),13,' ') BIR_NO,
                        RPAD(A.ORD_NO,20, ' ') ORD_NO 
                FROM    RTRE0070 A,
                        RTRE0010 B
                WHERE   A.RCMS_DAY = v_Rqst_Day
                AND     A.ACC_SEQ  = B.ACC_SEQ
                ORDER BY A.RCMS_SEQ
                )
      ;            
    
    IF SQLCODE <> 0 THEN
        v_Return_Message := '�����ü ���� �ۼ��� ����(RTRE0098) BODY���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
 

  -- �ۼ������ϳ��� TAIL ����(Rtre0098)*  
    SELECT  COUNT(1), SUM(RCMS_AMT)
    INTO    v_Row_Count, v_Rcms_Amt
    FROM    RTRE0070 A
    WHERE   A.RCMS_DAY = v_Rqst_day;
    
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, 99999999 ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               'T' || '99999999'  ||
               RPAD(NVL(TRIM(v_Company_Cd),' '),10,' ') ||
               SUBSTR(v_File_Nm,1,8) ||
               LPAD(TO_CHAR(v_Row_Count),8,'0') ||
               LPAD(TO_CHAR(v_Row_Count),8,'0') ||
               LPAD(TO_CHAR(v_Rcms_Amt),13,'0') ||
               '00000000' || '0000000000000' ||
               RPAD(' ', 63, ' ') ||
               RPAD(' ', 10, ' ')  ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
       FROM   DUAL;   
       
    IF SQLCODE <> 0 THEN
        v_Return_Message := '�����ü ���� �ۼ��� ����(RTRE0098) TAIL���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
 
        
  -- �ۼ������ϳ��� ���� ��� Update(Rtre0099)
    IF 0 <> Pkg_Rtre0099.f_UpdateRtre0099FileResult2 (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_SEQ, 
                                                     'Y', 'Y', 'Y', v_Row_Count, v_Rcms_Amt, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�����ü ���� �ۼ��� ����(RTRE0099) UPDATE �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- �����ü ���� ���� ������Ʈ (������)
    UPDATE RTRE0070
    SET RQST_STAT = '2'
    WHERE   RCMS_DAY = v_Rqst_Day;    
  
    -- ���� �ۼ��� ���� Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);


    v_Success_code := 0;
    v_Return_Message := '�����ü ���� �ۼ��� ���� ['||TO_CHAR(v_Row_Count)||']���� ���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    v_Crlf_Yn   := 'N'; -- �����ü�� N, ī����ü�� Y
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098TransAccum(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098TransAccum(2)', v_ErrorText, v_Return_Message);

    
  END p_InsertRtre0098TransAccum;        

      
  /*****************************************************************************
  -- ���� �ۼ��� ���� - ī����ü�ڷ� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098CardTrans (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��������              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_Crlf_Yn        OUT VARCHAR2                     /* CRLF ����            */
    ) IS
    
    e_Error EXCEPTION;
    v_Row_Count NUMBER DEFAULT 0;
    v_Rcrd_Amt  RTRE0080.RCRD_AMT%TYPE;
    v_Rcrd_Day  RTRE0080.RCRD_Day%TYPE;
    v_File_Seq  RTRE0098.FILE_SEQ%TYPE;               /*���ϼ���              */
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW ����              */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*��������              */

  BEGIN

    -- �ʼ���: ��û���� ,���ϸ� ,���ϱ��� ,����� ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (38 != LENGTH(TRIM(v_File_Nm))) THEN
    -- KCP_BACH_FILE_BC02_INX_V5407_20150815
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Tp) IS NULL) OR (8 != LENGTH(TRIM(v_File_Tp))) THEN  
    -- BC02_INX
        v_Return_Message := '���ϱ���('||v_File_Tp||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
        
  -- ī����ü ����  Ȯ��(Rtre0099)
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck2 (v_File_Tp, v_Rqst_Day, v_File_Nm, 'TRANS') THEN
        v_Return_Message := '������ ������ �� �����ϴ�. �����ڿ��� Ȯ���ϼ���.';
        RAISE e_Error;
    END IF;
    
  -- ���� ���  �ڷ�  check(RTre0098)
    v_File_SEQ := Pkg_Rtre0099.f_sRtre0099FinalFileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
    
    SELECT  COUNT(1) 
    INTO    v_Row_Count
    FROM    RTRE0098 A
    WHERE   A.RQST_DAY = v_Rqst_Day
    AND     A.FILE_NM  = v_File_Nm
    AND     A.FILE_TP  = v_File_Tp
    AND     A.FILE_SEQ = v_File_SEQ;
    
  -- ���� ���  �ڷ� ����(Rtre0098)
    IF v_Row_Count  > 0 THEN
        DELETE  RTRE0098 A
        WHERE   A.RQST_DAY = v_Rqst_Day
        AND     A.FILE_NM  = v_File_Nm
        AND     A.FILE_TP  = v_File_Tp
        AND     A.FILE_SEQ = v_File_SEQ;
        IF SQLCODE <> 0 THEN
            v_Return_Message := 'ī����ü ���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.';
            RAISE e_Error;
        END IF;
    END IF; 


    v_Rcrd_Day := v_RQst_Day;
    
  -- �ۼ������ϳ��� HEAD ����(Rtre0098)
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, 0 ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               (
                 SELECT  'S' || 
                         'BC02'  ||
                         RPAD(Pkg_Rtcm0051.f_sRtcm0051Cd('R023'),10,' ')  ||
                         SUBSTR(v_Rqst_Day,1,8) ||
                         'Y' || 'Y' ||
                         RPAD(' ', 473, ' ')  ROW_DATA 
                 FROM DUAL  ) ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
       FROM   DUAL;
    
    IF SQLCODE <> 0 THEN
        v_Return_Message := 'ī����ü ���� �ۼ��� ����(RTRE0098) HEAD���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
    
    
  -- �ۼ������ϳ��� BODY ����(Rtre0098)
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, ROWNUM ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               'D' || LPAD(TO_CHAR(ROWNUM),7,'0') || AA ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
        FROM (
                SELECT  RPAD(Pkg_Rtcm0051.f_sRtcm0051Cd('R024'),10,' ') ||
                        'A' ||
                        RPAD(Pkg_Rtcm0051.f_sRtcm0051Cd('R025'),12,' ') ||
                        RPAD(TRIM(A.BATCH_KEY),16,' ') ||
                        RPAD(' ', 8, ' ') ||
                        LPAD(TO_CHAR(A.RCRD_AMT),12,'0') ||
                        '00' ||
                        RPAD(' ', 125, ' ') ||
                        RPAD(A.ORD_NO || A.CUST_NO || A.RCRD_DAY || LPAD(TO_CHAR(A.RCRD_SEQ),7,'0'), 50, ' ') ||
                        RPAD('�ؼ�Ÿ�̾Ż',  50,  ' ') ||
                        RPAD(' ', 204, ' ') AA 
                FROM    RTRE0080 A
                WHERE   A.RCRD_DAY = v_Rcrd_Day
                ORDER BY A.RCRD_SEQ
                )
      ;            
    
    IF SQLCODE <> 0 THEN
        v_Return_Message := 'ī����ü ���� �ۼ��� ����(RTRE0098) BODY���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
 

  -- �ۼ������ϳ��� TAIL ����(Rtre0098)*  
    SELECT  COUNT(1), SUM(RCRD_AMT)
    INTO    v_Row_Count, v_Rcrd_Amt
    FROM    RTRE0080 A
    WHERE   A.RCRD_DAY = v_Rcrd_day;
    
    INSERT INTO RTRE0098 (
            RQST_DAY,
            FILE_NM,
            ROW_SEQ,
            FILE_TP,
            FILE_SEQ,
            ROW_DATA,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
        SELECT v_Rqst_Day, v_File_Nm, 99999999 ROW_SEQ, v_File_Tp,
               v_File_SEQ FILE_SEQ,
               'E' || 
               LPAD(TO_CHAR(v_Row_Count),7,'0') ||
               LPAD(TO_CHAR(v_Row_Count),7,'0') ||
               LPAD(TO_CHAR(v_Rcrd_Amt),12,'0') ||
               RPAD('0', 95, '0') ||
               RPAD(' ', 376, ' ')  ROW_DATA,
              'N' DEL_YN, 
              v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE  CHG_DT
       FROM   DUAL;   
       
    IF SQLCODE <> 0 THEN
        v_Return_Message := 'ī����ü ���� �ۼ��� ����(RTRE0098) TAIL���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.';
        RAISE e_Error;
    END IF;
 
        
  -- �ۼ������ϳ��� ���� ��� Update(Rtre0099)
    IF 0 <> Pkg_Rtre0099.f_UpdateRtre0099FileResult2 (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_SEQ, 
                                                     'Y', 'Y', 'Y', v_Row_Count, v_Rcrd_Amt, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := 'ī����ü ���� �ۼ��� ����(RTRE0099) UPDATE �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;
    
  
    -- ���� �ۼ��� ���� Select
    p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);


    v_Success_code := 0;
    v_Return_Message := '�����ü ���� �ۼ��� ���� ['||TO_CHAR(v_Row_Count)||']���� ���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    v_Crlf_Yn   := 'Y'; -- ī����ü�� Y, �����ü�� N
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098CardTrans(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        p_sRtre0098 (Ref_Cursor, v_Rqst_Day, v_File_Nm, NULL, v_File_Tp, v_File_Seq, NULL, 'N', NULL);
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098CardTrans(2)', v_ErrorText, v_Return_Message);

    
  END p_InsertRtre0098CardTrans;         

      
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� - ȸ������(A) ������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingA (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Extrc_Yn       IN OUT RTRE0099.EXTRC_YN%TYPE,   /*������迩��          */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER ���翩��       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*������ �ѰǼ�         */
    v_Acrq_Cnt       IN OUT RTRE0099.ACRQ_CNT%TYPE,   /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN OUT RTRE0099.ACCNRQ_CNT%TYPE, /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN OUT RTRE0099.RMCNRQ_CNT%TYPE, /*�������������Ǽ�      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
/*  -- �ؿ��� Parsing�� ����  ó��
  
    -- ���ϵ�����(CLOB)�� 120 BYTE �� �߶� CURSOR ��´�.
    -- ����ڵ�(R018:9924216388) �������� -9 ��ġ���� 150BYTE�� �ڸ� �� CONVERT�Ͽ� �ѱ����� 150BYTE�� ��Ȯ�ϰ� �߶�
    -- 'H000000009924216388EB22101515101502012341234567890123456                                                                                              '
    -- 'R000000029924216388004    956612544555224 0000000096400820123       N    �ؼ�Ÿ�̾�        D15000000527             3                                 '
    CURSOR  Cur_File_Data IS
    SELECT  CONVERT(SUBSTRB(FILE_DATA, 1, 120),'AL32UTF8', 'KO16KSC5601') ROW_DATA
    FROM    (
            SELECT  ROWNUM RN,
                    CONVERT(FILE_DATA,'KO16KSC5601','AL32UTF8') FILE_DATA 
            FROM    (
                    SELECT DBMS_LOB.SUBSTR(FILE_DATA, 120, DBMS_LOB.INSTR (FILE_DATA, COMPANY_CD, 1, LEVEL)-9) FILE_DATA
                    FROM   (
                            SELECT  v_File_Data FILE_DATA,
                                    DBMS_LOB.GETLENGTH(v_File_Data) LEN,
                                    Pkg_Rtcm0051.f_sRtcm0051Cd('R018') COMPANY_CD
                            FROM    DUAL
                            )                    
                    CONNECT BY LEVEL<= LEN / 80 -- �ѱ����� GETLENGTH  150������ �۰� ������ ��Ȯ�� ���� �˼� ���� ���Ƿ� ������ ����, NULL ���� ���� ���� ����
                    )
            WHERE   FILE_DATA IS NOT NULL -- NULL ���� �����Ͽ� ���� �����͸� SET
            );
*/
    
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW ����              */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*���ϳ���              */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*��������              */

    v_Company_Cd VARCHAR(10) DEFAULT NULL;            /*����ڵ�              */ 
    v_Acrq_Seq   RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL; /*���½�û����          */
    v_Ord_No     RTRE0060.ORD_NO%TYPE DEFAULT NULL;   /*����ȣ              */ 
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;  /*���½�û ó������     */
    v_Acercd     RTRE0060.ACERCD%TYPE DEFAULT NULL;   /*���½�û ����ڵ�     */
    
    v_File_Name   RTRE0098.FILE_NM%TYPE DEFAULT NULL; /*���ϸ�                */
        
    e_Error EXCEPTION;
    v_Row_Count     NUMBER DEFAULT 0;
    v_Data_Len      NUMBER DEFAULT 0;
    v_Record_Len    NUMBER DEFAULT 120; -- EB14 �� ������ 120 BYTE�� ������ ó���Ѵ�.
    v_Record_Type   VARCHAR(1) DEFAULT NULL; 
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type      VARCHAR2(10);      /*CLOB TYPE        */
    v_Type           VARCHAR2(20);      /*Parsing ������   */
    v_Spe_Yn         VARCHAR2(20);      /*����ó������     */
    v_Spe_Pos        NUMBER(10);       /*����ó����ġ     */
    
        
  BEGIN

    -- �ʼ���: ��û����, ���ϸ�, �ۼ��� ���ϱ���, ���� ����, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '�ۼ��� ���ϱ���('||v_File_Tp||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Seq) IS NULL THEN
        v_Return_Message := '���� ����('||v_File_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
     
    v_Data_Len := DBMS_LOB.GETLENGTH(v_File_Data);
    
    IF 0 != MOD(v_Data_Len, v_Record_Len) THEN
        v_Return_Message := '���ϵ�����(CLOB) ����('||v_Data_Len||')�� �ùٸ��� �ʾ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    
    v_Header_Yn := 'N';
    v_Trailer_Yn:= 'N';   
    
    
    --  �ۼ���ó�� ����(1��) ���� ���� �۽� ���� ���� CLEAR
    -- ���� ��û ��� ������ ���������͸� ������. ���½�û ����(RTRE0060)�� ���� ���·� �ϰ� ������Ʈ �� �����̸�, �Ʒ����� �����ǿ� ���ؼ��� ������Ʈ�� ��
    --  CLOB �ڷ� Parsing    
    v_Clob_Type := 'ACCOUNT_A';
    v_Type      := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    v_Spe_Yn    := 'Y';
    v_Spe_Pos   := 9;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                        v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB�ڷ� Parsing��  �����Դϴ�. �����ڿ��� �����ϼ���!';
        RAISE e_Error;                
    END IF;                                 


    v_Row_Count := 0;
    
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
    
    
        -- �۽����� Data Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
        v_Row_Seq := Pkg_Rtre0098.f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);

        v_Record_Type := SUBSTR(v_Row_Data, 1, 1); -- ���ڵ� ����

        -- ù��° �����ʹ� �ݵ��� HEADER ������ �����ؾ� �ϸ� ������ ����ó��
        IF v_Row_Count = 1 THEN
        
            IF v_Record_Type = 'H' THEN
                
                -- ����ڵ�(�̿����ĺ��ڵ�)
                v_Company_Cd := TRIM(SUBSTR(v_Row_Data, 10, 10));
                
                IF v_Company_Cd != Pkg_Rtcm0051.f_sRtcm0051Cd('R018') THEN
                    v_Return_Message := '���ϻ��� �̿�Ⱓ�Ǻ��ڵ�('||v_Company_Cd||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;                
                END IF;
                
                -- FILE�̸�
                v_File_Name := TRIM(SUBSTR(v_Row_Data, 20, 8)); 
                
                IF v_File_Name != v_File_Nm THEN
                    v_Return_Message := '���ϻ��� ���ϸ�('||v_File_Name||') ���� �����ϹǷ�('||v_File_Nm||') ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;
                
                -- HEADER ���翩��       
                v_Header_Yn := 'Y';  
                    
            ELSE
                v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER ������ ���� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;                
            END IF;
            
        ELSE 
            -- ������ �κ��̸� �Ľ��� �����͸� �����   
            IF v_Record_Type = 'R' THEN
                            
                v_Acrq_Seq := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 2, 8)));    -- DATA �Ϸù�ȣ 
                v_Ord_No   := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 27, 20)));  -- �����ڹ�ȣ      
                v_Acrq_St  := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 92, 1)));   -- ó�����-����ڵ�
                v_Acercd   := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 93, 4)));   -- ó�����-�Ҵ��ڵ�


                -- ���½�û ���� Count - DATA �Ϸù�ȣ�� �����ڹ�ȣ, ��û�������� RTRE0060������ �������� üũ
                IF 0 < Pkg_Rtre0060.f_sRtre0060OrdCount(v_Acrq_Fg, v_Rqst_Day, v_Acrq_Seq, v_Ord_No) THEN
                
                    -- ���½�û ����(RTRE0060) Update - ���½�ûó������ ���� ���½�ûó�� ����, ����ڵ带 ����
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqTpSt (v_Acrq_Fg, v_Rqst_Day, v_Acrq_Seq, v_Acercd,
                                                                   v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '���½�û ����(RTRE0060) UPDATE - ���½�ûó�� ����,����ڵ带 ���� �� ����!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;                    
                
                END IF;
                
            -- ������ ���ڵ� �̸�
            ELSIF v_Record_Type = 'T' THEN           
            
            
                -- TRAILER ���翩��
                v_Trailer_Yn := 'Y';
                    
            END IF;            
            
        END IF;          
      
                
        -- �۽����� Data Record - ���� �ۼ��� ���� Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                  v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                  v_ErrorText) THEN
            v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
         
        -- ������ ���ڵ� �̸� ��������
        IF v_Record_Type = 'T' THEN
            v_Trailer_Yn := 'Y';
            EXIT;
        END IF;
                    
    END LOOP;       
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER �Ǵ� TRAILER ������ ���� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;  
    END IF;    
    
    v_Tdata_Cnt  := 0; -- ������ �ѰǼ�
    v_Acrq_Cnt   := 0; -- ���½�û�Ǽ�
    v_Accnrq_Cnt := 0; -- ���������Ǽ�
    v_Rmcnrq_Cnt := 0; -- �������������Ǽ�
  
    -- �ۼ������� ó�� ��� ������Ʈ ������ SET ȹ�� 
    SELECT  COUNT(*) TDATA_CNT,
            SUM(DECODE(ACRQ_TP, '1', 1, 0)) ACRQ_CNT,
            SUM(DECODE(ACRQ_TP, '3', 1, 0)) ACCNRQ_CNT,
            SUM(DECODE(ACRQ_TP, '7', 1, 0)) RMCNRQ_CNT
    INTO    v_Tdata_Cnt, v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Rqst_Day;

    -- ���ϻ�������
    v_Extrc_Yn := 'Y';
    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.f_InsertRtre0098FileParsing(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.f_InsertRtre0098FileParsing(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingA;  
  
      
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� - ��������(B) ������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingB (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Extrc_Yn       IN OUT RTRE0099.EXTRC_YN%TYPE,   /*������迩��          */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER ���翩��       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*������ �ѰǼ�         */
    v_Acrq_Cnt       IN OUT RTRE0099.ACRQ_CNT%TYPE,   /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN OUT RTRE0099.ACCNRQ_CNT%TYPE, /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN OUT RTRE0099.RMCNRQ_CNT%TYPE, /*�������������Ǽ�      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

/*    
    -- ���ϵ�����(CLOB)�� 120 BYTE �� �߶� CURSOR ��´�.
    -- ����ڵ�(R018:9924216388) �������� -9 ��ġ���� 150BYTE�� �ڸ� �� CONVERT�Ͽ� �ѱ����� 150BYTE�� ��Ȯ�ϰ� �߶�
    -- 'H000000009924216388EB22101515101502012341234567890123456                                                                                              '
    -- 'R000000029924216388004    956612544555224 0000000096400820123       N    �ؼ�Ÿ�̾�        D15000000527             3                                 '
    CURSOR  Cur_File_Data IS
    SELECT  CONVERT(SUBSTRB(FILE_DATA, 1, 120),'AL32UTF8', 'KO16KSC5601') ROW_DATA
    FROM    (
            SELECT  ROWNUM RN,
                    CONVERT(FILE_DATA,'KO16KSC5601','AL32UTF8') FILE_DATA 
            FROM    (
                    SELECT DBMS_LOB.SUBSTR(FILE_DATA, 120, DBMS_LOB.INSTR (FILE_DATA, COMPANY_CD, 1, LEVEL)-9) FILE_DATA
                    FROM   (
                            SELECT  v_File_Data FILE_DATA,
                                    DBMS_LOB.GETLENGTH(v_File_Data) LEN,
                                    Pkg_Rtcm0051.f_sRtcm0051Cd('R018') COMPANY_CD
                            FROM    DUAL
                            )                    
                    CONNECT BY LEVEL<= LEN / 80 -- �ѱ����� GETLENGTH  150������ �۰� ������ ��Ȯ�� ���� �˼� ���� ���Ƿ� ������ ����, NULL ���� ���� ���� ����
                    )
            WHERE   FILE_DATA IS NOT NULL -- NULL ���� �����Ͽ� ���� �����͸� SET
            );
*/            
    
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;   /*ROW ����              */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*���ϳ���              */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*��������              */

    v_Company_Cd VARCHAR(10) DEFAULT NULL;            /*����ڵ�              */ 
    v_Acrq_Day   RTRE0060.ACRQ_DAY%TYPE DEFAULT NULL; /*���½�û��            */
    v_Acrq_Seq   RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL; /*���½�û����          */
    v_Ord_No     RTRE0060.ORD_NO%TYPE DEFAULT NULL;   /*����ȣ              */ 
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;  /*���½�û ó������     */
    v_Acercd     RTRE0060.ACERCD%TYPE DEFAULT NULL;   /*���½�û ����ڵ�     */
    v_Cust_No    RTRE0060.CUST_NO%TYPE DEFAULT NULL;  /*���ڵ�              */
    v_Acc_Seq    RTRE0060.ACC_SEQ%TYPE DEFAULT NULL;  /*���¼���              */
    v_Acrq_Tp    RTRE0060.ACRQ_TP%TYPE DEFAULT NULL;  /*���½�û����          */
    v_Rpc_Seq    RTRE0060.RPC_SEQ%TYPE DEFAULT NULL;  /*���������û����      */    
    
    v_File_Name   RTRE0098.FILE_NM%TYPE DEFAULT NULL; /*���ϸ�                */
        
    e_Error EXCEPTION;
    v_Row_Count     NUMBER DEFAULT 0;
    v_Data_Len      NUMBER DEFAULT 0;
    v_Record_Len    NUMBER DEFAULT 120; -- EB14 �� ������ 120 BYTE�� ������ ó���Ѵ�.
    v_Record_Type   VARCHAR(1) DEFAULT NULL; 
    
    v_Busl_No     RTSD0100.BUSL_NO%TYPE DEFAULT NULL;  /*����ڹ�ȣ            */
    v_Busl_No1    RTSD0100.BUSL_NO%TYPE DEFAULT NULL;  /*����ڹ�ȣ            */
    v_Busl_No2    RTSD0100.BUSL_NO%TYPE DEFAULT NULL;  /*����ڹ�ȣ            */
    
    v_Bank_Cd     RTRE0010.BANK_CD%TYPE DEFAULT NULL;  /*�����ڵ�              */
    v_Acct_No     RTRE0010.ACCT_NO%TYPE DEFAULT NULL;  /*���¹�ȣ              */
    v_Use_Yn      RTRE0010.USE_YN%TYPE  DEFAULT NULL;  /*��뿩��              */
    v_Acc_Chk     RTRE0010.ACC_CHK%TYPE DEFAULT 'Y';   /*����Ȯ�λ���          */
    v_Acnc_Id     RTRE0010.ACNC_ID%TYPE DEFAULT NULL;  /*���������            */
    v_Acnc_Desc   RTRE0010.ACNC_DESC%TYPE DEFAULT NULL;/*��������              */    
    v_Cust_Nm     RTRE0010.CUST_NM%TYPE DEFAULT NULL;  /*����                */
    v_Cust_Tp     RTRE0010.CUST_TP%TYPE DEFAULT NULL;  /*������              */
    v_Ebir_Day    RTRE0010.EBIR_DAY%TYPE DEFAULT NULL; /*�����������(YYMMDD)  */
    
    
    v_Acbrcd      RTRE0060.ACBRCD%TYPE DEFAULT NULL;   /*���°��� ���ڵ�       */
    v_Rqbrcd      RTRE0060.RQBRCD%TYPE DEFAULT NULL;   /*��� ���ڵ�           */
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type      VARCHAR2(10);      /*CLOB TYPE        */
    v_Type           VARCHAR2(20);      /*Parsing ������   */
    v_Spe_Yn         VARCHAR2(20);      /*����ó������     */
    v_Spe_Pos        NUMBER(10);       /*����ó����ġ     */

    v_exist BOOLEAN DEFAULT FALSE;-- ����Ÿ ���翩��
    
  BEGIN

    -- �ʼ���: ��û����, ���ϸ�, �ۼ��� ���ϱ���, ���� ����, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '�ۼ��� ���ϱ���('||v_File_Tp||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Seq) IS NULL THEN
        v_Return_Message := '���� ����('||v_File_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
     
    v_Data_Len := DBMS_LOB.GETLENGTH(v_File_Data);
    
    IF 0 != MOD(v_Data_Len, v_Record_Len) THEN
        v_Return_Message := '���ϵ�����(CLOB) ����('||v_Data_Len||')�� �ùٸ��� �ʾ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    
    v_Header_Yn := 'N';
    v_Trailer_Yn:= 'N';   
    v_Acrq_Day  := v_Rqst_Day;
    
    -- ��������(B) ���� ��û ��� ���� �� ROW�� �о ��ȿ�� ���� ��  ���½�û ����(RTRE0060)�� �űԻ���
    --  CLOB �ڷ� Parsing    
    v_Clob_Type := 'ACCOUNT_B';
    v_Type      := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    v_Spe_Yn    := 'Y';
    v_Spe_Pos   := 9;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                        v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB�ڷ� Parsing��  �����Դϴ�. �����ڿ��� �����ϼ���!';
        RAISE e_Error;                
    END IF;                                 


    v_Row_Count := 0;
    
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
    
        -- �۽����� Data Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
        v_Row_Seq := Pkg_Rtre0098.f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);

        v_Record_Type := SUBSTR(v_Row_Data, 1, 1); -- ���ڵ� ����

        -- ù��° �����ʹ� �ݵ��� HEADER ������ �����ؾ� �ϸ� ������ ����ó��
        IF v_Row_Count = 1 THEN
        
            IF v_Record_Type = 'H' THEN
                
                -- ����ڵ�(�̿����ĺ��ڵ�)
                v_Company_Cd := TRIM(SUBSTR(v_Row_Data, 10, 10));
                
                IF v_Company_Cd != Pkg_Rtcm0051.f_sRtcm0051Cd('R018') THEN
                    v_Return_Message := '���ϻ��� �̿�Ⱓ�Ǻ��ڵ�('||v_Company_Cd||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;                
                END IF;
                
                -- FILE�̸�
                v_File_Name := TRIM(SUBSTR(v_Row_Data, 20, 8)); 
                
                IF v_File_Name != v_File_Nm THEN
                    v_Return_Message := '���ϻ��� ���ϸ�('||v_File_Name||') ���� �����ϹǷ�('||v_File_Nm||') ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;
                
                -- HEADER ���翩��       
                v_Header_Yn := 'Y';  
                    
            ELSE
                v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER ������ ���� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;                
            END IF;
            
        ELSE 
            -- ������ �κ��̸� �Ľ��� �����͸� �����   
            IF v_Record_Type = 'R' THEN
                            
                v_Ord_No   := TRIM(SUBSTR(v_Row_Data, 27, 20));  -- �����ڹ�ȣ 
                v_Busl_No1 := TRIM(SUBSTR(v_Row_Data, 69, 16));  -- �����������/����ڹ�ȣ
                
                v_Cust_No  := NULL;
                v_Acc_Seq  := NULL;
                v_Cust_Nm  := NULL;
                v_Cust_Tp  := NULL;
                v_Ebir_Day := NULL;
                v_Busl_No  := NULL;
                v_Busl_No2 := NULL;
                v_Acercd   := NULL;
                
                -- ������ȣ�� ȹ��Ǿ�����
                IF v_Ord_No IS NOT NULL THEN
                    
                    IF 0 = Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN
                    
                        v_Acercd := 'A013'; -- ���½�û ����ڵ�
                    ELSE
                    
                        BEGIN
                            -- �������� ����ȣ ȹ��, �������� ���� �����������/����ڹ�ȣ ȹ�� 
                            SELECT  CUST_NO, CUST_NM, CUST_TP, SUBSTR(BIRTH_DAY,3) AS EBIR_DAY, BUSL_NO, DECODE(CUST_TP, '01', SUBSTR(BIRTH_DAY,3), '02', BUSL_NO)
                            INTO    v_Cust_No, v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No, v_Busl_No2 
                            FROM    RTSD0100
                            WHERE   CUST_NO = Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No);
                            
                            v_exist := TRUE;

                            EXCEPTION
                              WHEN NO_DATA_FOUND THEN
                                v_exist := FALSE;
                        END;
                        
                        IF v_exist = FALSE THEN
                            v_Return_Message := '����('||v_Ord_No||') ���� �����̺�(RTSD0100)�� ����ȣ ȹ��, �������� ���� �����������/����ڹ�ȣ ȹ��. �����Ͱ� �������� �������� ó���� �Ұ� �մϴ�.!';
                            RAISE e_Error;
                        END IF;

                        -- ȹ���� �����������/����ڹ�ȣ �����ϸ鼭 ���ϳ����� ������ϰ� ���Ͽ� �ٸ��� ����ȣ �ʱ�ȭ
                        IF (v_Busl_No2 IS NOT NULL) AND (v_Busl_No1 != v_Busl_No2) THEN
                            v_Cust_No := NULL;
                        END IF;
                    
                    END IF;
                    
                ELSE
                    v_Acercd := 'A013'; -- ���½�û ����ڵ�
                END IF;
                
                v_Acrq_Tp  := TRIM(SUBSTR(v_Row_Data, 26, 1));    -- ���½�û����                
                v_Bank_Cd  := TRIM(SUBSTR(v_Row_Data, 47, 3));    -- �����ڵ�: �������(����)�ڵ� 7�ڸ��� ��3�ڸ��� ȹ��
                v_Acct_No  := TRIM(SUBSTR(v_Row_Data, 54, 16));   -- ���¹�ȣ
                v_Acbrcd   := TRIM(SUBSTR(v_Row_Data, 50, 4));    -- ���°��� ���ڵ�: �������(����)�ڵ� 7�ڸ��� ��4�ڸ��� ȹ��
                v_Rqbrcd   := TRIM(SUBSTR(v_Row_Data, 86, 4));    -- ��� ���ڵ�
                v_Acrq_Seq := TO_CHAR(TRIM(SUBSTR(v_Row_Data, 2, 8)));    -- DATA �Ϸù�ȣ
                  
                v_Use_Yn := NULL;
                
                IF v_Acrq_Tp = '1' THEN -- 1: �ű�
                
                    -- ���ڵ尡 NULL �� ��� ����
                    IF v_Cust_No IS NOT NULL THEN
                                
                           
                        -- �� ���� ���� - ����ȣ/�����ڵ�/���¹�ȣ ���� ���翩�� üũ
                        v_Acc_Seq := Pkg_Rtre0010.f_sRtre0010AcctNo(v_Cust_No, v_Bank_Cd, v_Acct_No);
                        
                        
                        IF v_Acc_Seq IS NULL THEN                            
                                
                            v_Use_Yn := 'Y';
                                
                            -- ��ϵ� �����°� ������ �ű� ����
                            Pkg_Rtre0010.p_IUDRtre0010('I', v_Acc_Seq, v_Cust_No,
                                                      v_Cust_Nm, v_Cust_Tp, v_Ebir_Day, v_Busl_No,
                                                      v_Bank_Cd, v_Acct_No, v_Acc_Chk, v_Acnc_Id,
                                                      v_Acnc_Desc, v_Use_Yn, v_Reg_Id, v_Success_Code,
                                                      v_Return_Message, v_ErrorText);
                            IF 0 != v_Success_Code THEN
                                v_Return_Message := '�����°� �ű� ��� ����!!!'||'-'||v_ErrorText;
                                    v_ErrorText := v_ErrorText;
                                RAISE e_Error;

                            END IF;
                        
                        ELSE
                        
                            v_Use_Yn := Pkg_Rtre0010.f_sRtre0010UseYn(v_Cust_No, v_Bank_Cd, v_Acct_No);
                        
                            -- ��ϵ� �����°� ������,��뿩�ΰ� N'�̸� Y�� ������Ʈ��
                            IF v_Use_Yn = 'N' THEN
                                v_Use_Yn := 'Y';
                                IF 0 != Pkg_Rtre0010.f_UpdateRtre0010UseYn(v_Acc_Seq, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                                    v_Return_Message := '�����°� ���� ����!!!'||'-'||v_ErrorText;
                                    v_ErrorText := v_ErrorText;
                                    RAISE e_Error;
                                END IF;
                            
                            END IF;
                        END IF;
       
                    ELSE 
                        v_Acercd := 'A017'; -- ���½�û ����ڵ�
                    END IF;
                    
                ELSIF v_Acrq_Tp IN ('3','7') THEN -- '3' : ���� �Ǵ� '7' : ��������
                
                    -- ���ڵ尡 NULL �� ��� ����
                    IF v_Cust_No IS NULL THEN
                        v_Acercd := 'A017'; -- ���½�û ����ڵ�  
                              
                    ELSE      
                        -- �� ���� ���� - ����ȣ/�����ڵ�/���¹�ȣ ���� ���翩�� üũ
                        v_Acc_Seq := Pkg_Rtre0010.f_sRtre0010AcctNo(v_Cust_No, v_Bank_Cd, v_Acct_No);
                        
                        -- ������ ������ ���� ���� => ACERCD �Ҵ��ڵ� : A017
                        IF v_Acc_Seq IS NULL THEN
                            v_Acercd := 'A017'; -- ���½�û ����ڵ�
                        END IF;    
                                  
                    END IF;
                    
                END IF;
                
                v_Rpc_Seq  := NULL;  -- ���������û����
                
                -- ���� step���� ó�� : ACERCD ���� ������ ������ ó�� :��û������ '1'�� ��� '3' , ��û������ '3','7'�� ��� '7'
                IF v_Acercd IS NULL THEN 
                    v_Acrq_St := '2';
                ELSE
                    IF v_Acrq_Tp = '1' THEN -- 1: �ű�
                        v_Acrq_St := '3';  
                        
                    ELSIF v_Acrq_Tp IN ('3','7') THEN -- '3' : ���� �Ǵ� '7' : ��������
                        v_Acrq_St := '7';  
                    
                    END IF;              
                END IF;   
                
                -- ���½�û���� ȹ��
                --v_Acrq_Seq := Pkg_Rtre0060.f_sRtre0060AcrqSeq(v_Acrq_Fg, v_Acrq_Day);
                    
                -- ���½�û���� ����
                IF 0!= Pkg_Rtre0060.f_InsertRtre0060 (v_Acrq_Fg, v_Acrq_Day, v_Acrq_Seq, v_Ord_No, 
                                                      v_Cust_No, v_Bank_Cd, v_Acc_Seq, v_Acrq_Tp, v_Rpc_Seq, 
                                                      v_Acrq_St, v_Acercd, v_Acbrcd, v_Rqbrcd, 
                                                      v_Reg_Id, v_ErrorText ) THEN
                    v_Return_Message := '���������� ���½�û ���� ����� ���� �߻�!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
                                
            -- ������ ���ڵ� �̸�
            ELSIF v_Record_Type = 'T' THEN
            
                -- TRAILER ���翩��
                v_Trailer_Yn := 'Y';
                    
            END IF;            
            
        END IF;          
      
                
        -- �۽����� Data Record - ���� �ۼ��� ���� Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                  v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                  v_ErrorText) THEN
            v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
         
        -- ������ ���ڵ� �̸� ��������
        IF v_Record_Type = 'T' THEN
            v_Trailer_Yn := 'Y';
            EXIT;
        END IF;
                    
    END LOOP;       
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER �Ǵ� TRAILER ������ ���� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;  
    END IF;    
    
    v_Tdata_Cnt  := 0; -- ������ �ѰǼ�
    v_Acrq_Cnt   := 0; -- ���½�û�Ǽ�
    v_Accnrq_Cnt := 0; -- ���������Ǽ�
    v_Rmcnrq_Cnt := 0; -- �������������Ǽ�
  
    -- �ۼ������� ó�� ��� ������Ʈ ������ SET ȹ�� 
    SELECT  COUNT(*) TDATA_CNT,
            SUM(DECODE(ACRQ_TP, '1', 1, 0)) ACRQ_CNT,
            SUM(DECODE(ACRQ_TP, '3', 1, 0)) ACCNRQ_CNT,
            SUM(DECODE(ACRQ_TP, '7', 1, 0)) RMCNRQ_CNT
    INTO    v_Tdata_Cnt, v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt
    FROM    RTRE0060
    WHERE   ACRQ_FG  = v_Acrq_Fg
    AND     ACRQ_DAY = v_Rqst_Day;

    -- ���ϻ�������
    v_Extrc_Yn := 'Y';
    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingB(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingB(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingB;  
  
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� -  �����ü(T) ������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingT (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
/*  
    -- Parsing�� �ؿ��� ���ν����� ó���Ѵ�. (�ѱ�����)  
    
    -- ���ϵ�����(CLOB)�� 150 BYTE �� �߶� CURSOR ��´�.
    -- ���뿡 �ѱ����ִ� ��� CONVRT�Ͽ� SUBSTRB�� �߶� ó���ϰ�, ��������� �ٽ� CONVERT�Ѵ�.
    -- ����ڵ�(R018:9924216388) �������� -9 ��ġ���� 150BYTE�� �ڸ� �� CONVERT�Ͽ� �ѱ����� 150BYTE�� ��Ȯ�ϰ� �߶�
    -- 'H000000009924216388EB22101515101502012341234567890123456                                                                                              '
    -- 'R000000029924216388004    956612544555224 0000000096400820123       N    �ؼ�Ÿ�̾�        D15000000527             3                                 '
    CURSOR  Cur_File_Data IS
    SELECT  CONVERT(SUBSTRB(FILE_DATA, 1, 150),'AL32UTF8', 'KO16KSC5601') ROW_DATA
    --SELECT  SUBSTRB(FILE_DATA, 1, 150) ROW_DATA
    FROM    (
            SELECT  ROWNUM RN,
                    CONVERT(FILE_DATA,'KO16KSC5601','AL32UTF8') FILE_DATA 
            FROM    (
                    SELECT DBMS_LOB.SUBSTR(FILE_DATA, 150, DBMS_LOB.INSTR (FILE_DATA, COMPANY_CD, 1, LEVEL)-9) FILE_DATA
                    FROM   (
                            SELECT  v_File_Data FILE_DATA,
                                    DBMS_LOB.GETLENGTH(v_File_Data) LEN,
                                    Pkg_Rtcm0051.f_sRtcm0051Cd('R018') COMPANY_CD
                            FROM    DUAL
                            )                    
                    CONNECT BY LEVEL<= LEN / 100 -- �ѱ����� GETLENGTH  150������ �۰� ������ ��Ȯ�� ���� �˼� ���� ���Ƿ� ������ ����, NULL ���� ���� ���� ����
                    )
            WHERE   FILE_DATA IS NOT NULL -- NULL ���� �����Ͽ� ���� �����͸� SET
            );
            
*/                        
        
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*FILE ����             */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT NULL; /*��üû���ݾ�          */
    v_Srecp_Amt  RTRE0099.SRECP_AMT%TYPE DEFAULT NULL; /*��������ݾ�          */
    v_Hsrcp_Amt  RTRE0099.HSRCP_AMT%TYPE DEFAULT NULL; /*�κа����ݾ�          */
    v_Erecp_Amt  RTRE0099.ERECP_AMT%TYPE DEFAULT NULL; /*�������бݾ�          */

    v_Row_Data   RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*���ϳ���              */
    v_Del_Yn     RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*��������              */

    v_Company_Cd VARCHAR(10) DEFAULT NULL;             /*����ڵ�              */ 
    v_Rcms_day   RTRE0070.RCMS_DAY%TYPE DEFAULT NULL;  /*�����ü����          */
    v_Rcms_Seq   RTRE0070.RCMS_SEQ%TYPE DEFAULT NULL;  /*�����ü�Ϸù�ȣ      */
    v_Recp_Amt   RTRE0070.RECP_AMT%TYPE DEFAULT NULL;  /*�����ݾ�              */
    v_Rcms_Amt   RTRE0070.RCMS_AMT%TYPE DEFAULT NULL;  /*�����ü�ݾ�          */
    v_Unrecp_Amt RTRE0070.RECP_AMT%TYPE DEFAULT NULL;  /*��ݺҴɱݾ�          */
    v_Ord_No     RTRE0070.ORD_NO%TYPE DEFAULT NULL;    /*����ȣ              */ 
    v_Rqst_Stat  RTRE0070.RQST_STAT%TYPE DEFAULT NULL; /*�����ü ����         */
    v_Rcercd     RTRE0070.RCERCD%TYPE DEFAULT NULL;    /*�����ü ����ڵ�     */
    
    v_File_Name   RTRE0098.FILE_NM%TYPE DEFAULT NULL;  /*���ϸ�                */
        
    e_Error EXCEPTION;
    v_Row_Count     NUMBER DEFAULT 0;
    v_Data_Len      NUMBER DEFAULT 0;
    v_Record_Len    NUMBER DEFAULT 150; 
    v_Record_Type   VARCHAR(1) DEFAULT NULL; 
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type     VARCHAR2(10);      /*CLOB TYPE        */
    v_Type          VARCHAR2(20);      /*Parsing ������   */
    v_Spe_Yn        VARCHAR2(20);      /*����ó������     */
    v_Spe_Pos       NUMBER(10);        /*����ó����ġ     */
    
    v_Header_Yn  RTRE0099.HEADER_YN%TYPE DEFAULT NULL;  /*HEADER ���翩��       */
    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT NULL; /*TRAILER ���翩��      */
    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT NULL;  /*������ �ѰǼ�         */
    v_Srecp_Cnt  RTRE0099.SRECP_CNT%TYPE DEFAULT NULL;  /*������� ó���Ǽ�     */
    v_Hsrcp_Cnt  RTRE0099.HSRCP_CNT%TYPE DEFAULT NULL;  /*�κа��� ó���Ǽ�     */
    v_Erecp_Cnt  RTRE0099.ERECP_CNT%TYPE DEFAULT NULL;  /*�������� ó���Ǽ�     */
    
  BEGIN

    -- �ʼ���: ��û����, ���ϸ�, �ۼ��� ���ϱ���, ���� ����, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) OR (8 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '�ۼ��� ���ϱ���('||v_File_Tp||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    /* �ѱ� ���Խ� �ڸ��� üũ�� ��Ȯ���� �������� �ּ�ó���� 
    v_Data_Len := DBMS_LOB.GETLENGTH(v_File_Data);
    
    IF 0 != MOD(v_Data_Len, v_Record_Len) THEN
        v_Return_Message := '���ϵ�����(CLOB) ����('||v_Data_Len||')�� �ùٸ��� �ʾ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;*/
    
    
    -- �̹� ó���� �ڷ����� Ȯ��
    IF 0 <> Pkg_Rtre0098.f_sRtre0098CountCheck2(v_Rqst_Day, v_File_Nm) THEN
    
        IF 0 = Pkg_Rtre0099.f_sRtre0099CountCheck2(v_File_Tp, v_Rqst_Day, v_File_Nm, '') THEN
            v_Return_Message := '�̹� ó���� �ڷᰡ �����Ͽ� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        ELSE -- ������ ó���� �ڷᰡ ������ RTRE0099�� DEL_YN = 'Y'�� Update, RTRE0098�� DELETE�� ��ó��
        
            IF Pkg_Rtre0099.f_sRtre0099CountCheck2(v_File_Tp, v_Rqst_Day, v_File_Nm, 'DEL') >= 1 THEN
            
                IF 0 <> Pkg_Rtre0099.f_DeleteRtre0099DelYn(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '�����ڷ�(RTRE0099) Update�� �����Դϴ�.  �����ڿ��� Ȯ���ϼ���!';
                    RAISE e_Error;
                END IF;
                
            END IF;
            
            IF 0 <> Pkg_Rtre0098.f_Delete0098Day_Nm(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����ڷ�(RTRE0098) Delete�� �����Դϴ�.  �����ڿ��� Ȯ���ϼ���!';
                RAISE e_Error;
            END IF;
            
            IF 0 <> Pkg_Rtre0070.f_UpdateRtre0070RqstStat(v_Rqst_Day, '2', v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����ڷ�(RTRE0070) Update�� �����Դϴ�.  �����ڿ��� Ȯ���ϼ���!';
                RAISE e_Error;
            END IF;
            
        END  IF;
        
    END IF;
    
    v_Tdata_Cnt  := 0; -- �����ü �ѰǼ�
    v_Tdata_Amt  := 0; -- ��ü��� ��û�ݾ�
    v_Srecp_Cnt  := 0; -- ������� �ѰǼ�
    v_Srecp_Amt  := 0; -- ������� ó���ݾ�
    v_Hsrcp_Cnt  := 0; -- �κа��� �ѰǼ�
    v_Hsrcp_Amt  := 0; -- �κа��� ó���ݾ�
    v_Erecp_Cnt  := 0; -- �������� �ѰǼ�
    v_Erecp_Amt  := 0; -- �������� ó���ݾ�
  
    v_Header_Yn := 'N';
    v_Trailer_Yn:= 'N';
    v_Rcms_day  := v_Rqst_Day;   

                
    -- ���� ���  �ڷ�  check(RTre0099)
    v_File_SEQ := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
    
    --  CLOB �ڷ� Parsing    
    v_Clob_Type := 'TRANS';
    v_Type      := Pkg_Rtcm0051.f_sRtcm0051Cd('R018');
    v_Spe_Yn    := 'Y';
    v_Spe_Pos   := 9;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                       v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB�ڷ� Parsing��  �����Դϴ�. �����ڿ��� �����ϼ���!';
        RAISE e_Error;                
    END IF;          
              
   
    v_Row_Count := 0;
    
    --  �����üó�� ���� �ݿ�
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
    
        -- �ѱ�ó���� ���Ͽ� �ڷ� CONVERT�Ŀ� �۾�, ���߿� �����Ҷ��� �ٽ� CONVERT
        v_Row_Data := CONVERT(v_Row_Data,'KO16KSC5601','AL32UTF8');
        
        v_Record_Type := TO_CHAR(SUBSTR(v_Row_Data, 1, 1)); -- ���ڵ� ����
        v_Rcms_Seq    := TO_CHAR(SUBSTR(v_Row_Data,2,8));      -- �����ü �Ϸù�ȣ

        -- ����ڵ�(�̿����ĺ��ڵ�)
        v_Company_Cd := TRIM(SUBSTR(v_Row_Data, 10, 10));
                
        IF v_Company_Cd != Pkg_Rtcm0051.f_sRtcm0051Cd('R018') THEN
            v_Return_Message := '���ϻ��� �̿�Ⱓ�ĺ��ڵ�('||v_Company_Cd||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;                
        END IF;
                

        -- ù��° �����ʹ� �ݵ��� HEADER ������ �����ؾ� �ϸ� ������ ����ó��
        IF v_Row_Count = 1 THEN
        
            IF v_Record_Type = 'H' THEN
                
                -- FILE�̸�
                v_File_Name := TRIM(SUBSTR(v_Row_Data, 20, 8)); 
                
                IF v_File_Name != v_File_Nm THEN
                    v_Return_Message := '���ϻ��� ���ϸ�('||v_File_Name||') ���� �����ϹǷ�('||v_File_Nm||') ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;
                
                -- HEADER ���翩��       
                v_Header_Yn := 'Y';  
                    
            ELSE
                v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER ������ ���� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;                
            END IF;
            
        ELSE
         
            -- ������ �κ��̸� �Ľ��� �����͸� �����   
            IF v_Record_Type = 'R' THEN
                            
                v_Unrecp_Amt := TO_CHAR(SUBSTR(v_Row_Data, 43, 13));  -- ��ݺҴɱݾ�      
                v_Rqst_Stat  := TRIM(SUBSTR(v_Row_Data, 69, 1));   -- ó�����-����ڵ�
                v_Rcercd     := TRIM(SUBSTR(v_Row_Data, 70, 4));   -- ó�����-�Ҵ��ڵ�
                v_Ord_No     := TRIM(SUBSTRB(v_Row_Data, 92, 20));  -- �����ڹ�ȣ      

                IF    v_Rqst_Stat = 'N' THEN
                    v_Rqst_Stat := '3';
                ELSIF v_Rqst_Stat = 'P' THEN
                    v_Rqst_Stat := '4';
                ELSE
                    v_Rqst_Stat := '5';
                    v_Rcercd    := '0000';
                END IF;
                

                -- �����ü ���� Count - DATA �Ϸù�ȣ�� �����ڹ��� RTRE0070������ �������� üũ
                IF 0 < Pkg_Rtre0070.f_sRtre0070OrdCount(v_Rcms_Day, v_Rcms_Seq, v_Ord_No) THEN
                   v_Rcms_Amt  := Pkg_Rtre0070.f_sRtre0070RcmsAmt(v_Rcms_Day, v_Rcms_Seq, v_Ord_No);
                   v_Recp_Amt  := v_Rcms_Amt - v_Unrecp_Amt;
                
                    -- �����ü ����(RTRE0070) Update - ó������, ��ݾ� , ����ڵ带 ����
                    IF 0 <> Pkg_Rtre0070.f_UpdateRtre0070RqstResult (v_Rcms_Day, v_Rcms_Seq, v_Rqst_Stat, v_Rcercd,
                                                                     v_Recp_Amt, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '�����ü ����(RTRE0070) Update - ���½�ûó�� ����,����ڵ带 ���� �� ����!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;  
                    
                ELSE                  
                    v_Return_Message := '�����ü������ ����(�Ϸù�ȣ'||v_Rcms_Seq||'�����'||v_Ord_No||')�� ��� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                
                END IF;
                
                
            -- ������ ���ڵ� �̸�
            ELSIF v_Record_Type = 'T' THEN           
            
                -- FILE�̸�
                v_File_Name := TRIM(SUBSTR(v_Row_Data, 20, 8)); 
                
                IF v_File_Name != v_File_Nm THEN
                    v_Return_Message := '���ϻ��� ���ϸ�('||v_File_Name||') ���� �����ϹǷ�('||v_File_Nm||') ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;

                v_Erecp_Cnt := TO_CHAR(SUBSTR(v_Row_Data,36,8));
                v_Erecp_Amt := TO_CHAR(SUBSTR(v_Row_Data,44,13));
                v_Hsrcp_Cnt := TO_CHAR(SUBSTR(v_Row_Data,57,8));
                v_Hsrcp_Amt := TO_CHAR(SUBSTR(v_Row_Data,65,13));
                
                -- TRAILER ���翩��
                v_Trailer_Yn := 'Y';
                    
            END IF;            
            
        END IF;        
        
        -- �����ü Data Record - ���� �ۼ��� ���� Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Rcms_Seq, v_File_Tp, 
                                  v_File_Seq, CONVERT(v_Row_Data,'AL32UTF8', 'KO16KSC5601'), v_Del_Yn, v_Reg_Id, 
                                  v_ErrorText) THEN
            v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
         
        -- ������ ���ڵ� �̸� ��������
        IF v_Record_Type = 'T' THEN
            v_Trailer_Yn := 'Y';
            EXIT;
        END IF;
                    
    END LOOP;       
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER �Ǵ� TRAILER ������ ���� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;  
    END IF;
            
    -- �����ü ó�� ��� ������Ʈ ������ SET ȹ�� 
    v_Tdata_Cnt := Pkg_Rtre0070.f_sRtre0070TotCount(v_Rcms_Day);
    v_Tdata_Amt := Pkg_Rtre0070.f_sRtre0070TotAmt(v_Rcms_Day);
    v_Srecp_Cnt := 0;   --v_Tdata_Cnt - v_Erecp_Cnt -  v_Hsrcp_cnt;
    v_Srecp_Amt := 0;   --v_Tdata_Amt - v_Erecp_Amt -  v_Hsrcp_Amt

    IF 0 != Pkg_Rtre0099.f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             'Y', 'N', 'N', 'N', 
                             NULL, NULL, NULL, v_Header_Yn, 
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, 0, 
                             0, 0, 0, 0, 
                             0, 0, v_Srecp_Cnt, v_Srecp_Amt, 
                             v_Hsrcp_Cnt, v_Hsrcp_Amt, v_Erecp_Cnt, v_Erecp_Amt, 
                             0, 0, 0, 0, 
                             'N', v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾�(RTRE0099) ������ ���� ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;

    END IF;
        
    
    UPDATE Rtre0070
    SET RQST_STAT = '5',
        RECP_AMT  = RCMS_AMT
    WHERE RCMS_DAY  = v_Rcms_Day
    AND   RQST_STAT = '2';


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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.f_InsertRtre0098FileParsingT(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.f_InsertRtre0098FileParsingT(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingT;  
  
      
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� -  ī����ü(C) ��� ���� UPLOAD
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingC (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    v_Header_Yn  RTRE0099.HEADER_YN%TYPE  DEFAULT NULL;/*HEADER ���翩��       */
    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT NULL;/*TRAILER ���翩��      */
    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE  DEFAULT NULL;/*������ �ѰǼ�         */
    v_Srecp_Cnt  RTRE0099.SRECP_CNT%TYPE  DEFAULT NULL;/*������� ó���Ǽ�     */
    v_Hsrcp_Cnt  RTRE0099.HSRCP_CNT%TYPE  DEFAULT NULL;/*�κа��� ó���Ǽ�     */
    v_Erecp_Cnt  RTRE0099.ERECP_CNT%TYPE  DEFAULT NULL;/*�������� ó���Ǽ�     */
    
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*FILE ����             */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT NULL; /*��üû���ݾ�          */
    v_Srecp_Amt  RTRE0099.SRECP_AMT%TYPE DEFAULT NULL; /*��������ݾ�          */
    v_Erecp_Amt  RTRE0099.ERECP_AMT%TYPE DEFAULT NULL; /*�������бݾ�          */

    v_Row_Data   RTRE0098.ROW_DATA%TYPE DEFAULT NULL;  /*���ϳ���              */
    v_Del_Yn     RTRE0098.DEL_YN%TYPE DEFAULT 'N';     /*��������              */

    v_Recp_Amt   RTRE0080.RECP_AMT%TYPE DEFAULT NULL;  /*�����ݾ�              */
    v_Rcrd_day   RTRE0080.RCRD_DAY%TYPE DEFAULT NULL;  /*ī����ü����          */
    v_Rcrd_Seq   RTRE0080.RCRD_SEQ%TYPE DEFAULT NULL;  /*ī����ü�Ϸù�ȣ      */
    v_Rcrd_Amt   RTRE0080.RCRD_AMT%TYPE DEFAULT NULL;  /*ī����ü�ݾ�          */
    v_Tno        RTRE0080.TNO%TYPE DEFAULT NULL;       /*KCP �ŷ���ȣ          */
    v_Rqst_Stat  RTRE0080.RQST_STAT%TYPE DEFAULT NULL; /*ī����ü ����         */
    v_Crercd     RTRE0080.CRERCD%TYPE DEFAULT NULL;    /*ī����ü ����ڵ�     */
    v_Batch_Key  RTRE0080.BATCH_KEY%TYPE DEFAULT NULL; /*��ġ KEY              */
    
    v_File_Name  RTRE0098.FILE_NM%TYPE DEFAULT NULL;   /*���ϸ�                */
        
    v_Row_Count     NUMBER DEFAULT 0;
    v_Data_Len      NUMBER DEFAULT 0;
    v_Record_Len    NUMBER DEFAULT 150; 
    v_Record_Type   VARCHAR(1) DEFAULT NULL; 
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type     VARCHAR2(10);      /*CLOB TYPE        */
    v_Type          VARCHAR2(20);      /*Parsing ������   */
    v_Spe_Yn        VARCHAR2(20);      /*����ó������     */
    v_Spe_Pos       NUMBER(10);        /*����ó����ġ     */
  
    e_Error EXCEPTION;
  BEGIN
  
    -- �ʼ���: ��û����, ���ϸ�, �ۼ��� ���ϱ���, ���� ����, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_File_Nm) IS NULL) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '�ۼ��� ���ϱ���('||v_File_Tp||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    /* �ѱ� ���Խ� �ڸ��� üũ�� ��Ȯ���� �������� �ּ�ó���� 
    v_Data_Len := DBMS_LOB.GETLENGTH(v_File_Data);
    
    IF 0 != MOD(v_Data_Len, v_Record_Len) THEN
        v_Return_Message := '���ϵ�����(CLOB) ����('||v_Data_Len||')�� �ùٸ��� �ʾ� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;*/
    
    
    -- �̹� ó���� �ڷ����� Ȯ��
    IF 0 <> Pkg_Rtre0098.f_sRtre0098CountCheck2(v_Rqst_Day, v_File_Nm) THEN
    
        IF 0 = Pkg_Rtre0099.f_sRtre0099CountCheck2(v_File_Tp, v_Rqst_Day, v_File_Nm, '') THEN
            v_Return_Message := '�̹� ó���� �ڷᰡ �����Ͽ� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        ELSE -- ������ ó���� �ڷᰡ ������ DEL_YN = 'Y'�� Update�� ��ó��
        
            IF Pkg_Rtre0099.f_sRtre0099CountCheck2(v_File_Tp, v_Rqst_Day, v_File_Nm, 'DEL') >= 1 THEN
            
                IF 0 <> Pkg_Rtre0099.f_DeleteRtre0099DelYn(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '�����ڷ�(RTRE0099) Update�� �����Դϴ�.  �����ڿ��� Ȯ���ϼ���!';
                    RAISE e_Error;
                END IF;
                
            END IF;
            
            IF 0 <> Pkg_Rtre0098.f_Delete0098Day_Nm(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����ڷ�(RTRE0098) Delete�� �����Դϴ�.  �����ڿ��� Ȯ���ϼ���!';
                RAISE e_Error;
            END IF;
            
            IF 0 <> Pkg_Rtre0080.f_UpdateRtre0080RqstStat(v_Rqst_Day, '2', v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����ڷ�(RTRE0080) Update�� �����Դϴ�.  �����ڿ��� Ȯ���ϼ���!';
                RAISE e_Error;
            END IF;
            
        END  IF;
        
    END IF;
    
    v_Tdata_Cnt  := 0; -- �����ü �ѰǼ�
    v_Tdata_Amt  := 0; -- ��ü��� ��û�ݾ�
    v_Srecp_Cnt  := 0; -- ������� �ѰǼ�
    v_Srecp_Amt  := 0; -- ������� ó���ݾ�
    v_Erecp_Cnt  := 0; -- �������� �ѰǼ�
    v_Erecp_Amt  := 0; -- �������� ó���ݾ�
  
    v_Header_Yn  := 'N';
    v_Trailer_Yn := 'N';
    v_Rcrd_day  := v_Rqst_Day;   
    
    -- ���� ���  �ڷ�  check(RTre0099)
    v_File_SEQ := Pkg_Rtre0099.f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);
   
    --  CLOB �ڷ� Parsing    
    v_Clob_Type := 'CARD';
    v_Type      := CHR(13)||CHR(10);
    v_Spe_Yn    := 'N';
    v_Spe_Pos   := 0;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                       v_Row_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB�ڷ� Parsing��  �����Դϴ�. �����ڿ��� �����ϼ���!';
        RAISE e_Error;                
    END IF;                                 

    v_Row_Count := 0;
    
    --  �����üó�� ���� �ݿ�
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
        
        /*
        -- �ѱ�ó���� ���Ͽ� �ڷ� CONVERT�Ŀ� �۾�, ���߿� �����Ҷ��� �ٽ� CONVERT
        v_Row_Data := CONVERT(v_Row_Data,'KO16KSC5601','AL32UTF8');
        --DBMS_OUTPUT.Put_Line('v_Row_Data CONVERT ���� = ' || v_Row_Data);
        */
         
        v_Record_Type := SUBSTR(v_Row_Data, 1, 1); -- ���ڵ� ����

        -- ù��° �����ʹ� �ݵ��� HEADER ������ �����ؾ� �ϸ� ������ ����ó��
        IF v_Row_Count = 1 THEN
        
            -- ����ڵ�(�̿����ĺ��ڵ�)
            IF TRIM(SUBSTR(v_Row_Data, 6, 10)) != Pkg_Rtcm0051.f_sRtcm0051Cd('R023') THEN
                v_Return_Message := '���ϻ��� �̿�Ⱓ�ĺ��ڵ�('||TRIM(SUBSTR(v_Row_Data, 6, 10))||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;                
            END IF;

            IF v_Record_Type = 'S' THEN
                
                /*
                -- ��û���� CHECK
                IF v_Rqst_day <> TRIM(SUBSTR(v_Row_Data, 16, 8)) THEN
                    v_Return_Message := '��û����('||v_Rqst_Day||') �� ��������('||TRIM(SUBSTR(v_Row_Data, 16, 8))
                                        ||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;
                */
                
                -- HEADER ���翩��  
                v_Header_Yn := 'Y';  
                v_Rcrd_Seq  := 0;
                    
            ELSE
                v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER ������ ���� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;                
            END IF;
            
        ELSE
         
            -- ������ �κ��̸� �Ľ��� �����͸� �����   
            IF v_Record_Type = 'D' THEN
                            
                -- ����Ʈ�ڵ� CHECK
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('R024') <> TRIM(SUBSTR(v_Row_Data, 9, 10)) THEN
                    v_Return_Message := '�����ڵ�('||Pkg_Rtcm0051.f_sRtcm0051Cd('R024')||') �� ����Ʈ�ڵ�('
                                        ||TRIM(SUBSTR(v_Row_Data, 9, 10))||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;
                
                -- ������ݼ��񽺱׷� CHECK
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('R025') <> TRIM(SUBSTR(v_Row_Data, 20, 12)) THEN
                    v_Return_Message := '�����ڵ�('||Pkg_Rtcm0051.f_sRtcm0051Cd('R025')||') �� ������ݼ��񽺱׷�('
                                        ||TRIM(SUBSTR(v_Row_Data, 20, 12))||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;
                
                v_Rcrd_Seq   := TO_CHAR(SUBSTR(v_Row_Data, 2, 7));
                v_Tno := NVL(TRIM(SUBSTR(v_Row_Data, 70, 14)), '');
                v_Crercd     := TRIM(SUBSTR(v_Row_Data, 295 - 7, 4));   -- ó�����-�Ҵ��ڵ�

--                IF v_Tno IS NOT NULL THEN     -- KCP�ŷ���ȣ ������ ����
                IF v_Crercd = '0000' THEN     -- ó������ڵ尡 '0000'  �̸� ����

                    -- ��ġKEY/û���ݾ� ��ȸ
                    Pkg_Rtre0080.p_sRtre0080BatchAndAmt(v_Rcrd_Day, v_Rcrd_Seq, v_Rcrd_Amt, v_Batch_Key, 
                                                        v_Success_Code, v_Return_Message, v_ErrorText);
                    IF v_Success_Code <> 0 THEN
                        RAISE e_Error;
                    END IF;
                    
                    IF TRIM(v_Batch_Key) <> TRIM(SUBSTR(v_Row_Data, 32, 16)) THEN
                        v_Return_Message := '��ġKEY('||TRIM(v_Batch_Key)||') �� ����Ű('
                                            ||TRIM(SUBSTR(v_Row_Data, 32, 16))||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                        RAISE e_Error;
                    END IF;   
                    
                    v_Recp_Amt := TO_CHAR(SUBSTR(v_Row_Data, 56, 12));
                    
                    IF v_Rcrd_Amt <> v_Recp_Amt THEN
                        v_Return_Message := 'û���ݾ�('||TO_CHAR(v_Rcrd_Amt)||') �� �����ݾ�('
                                            ||TO_CHAR(v_Recp_Amt)||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                        RAISE e_Error;
                    END IF;   
                
                    v_Rqst_Stat  := '5';   -- ó�����-����ڵ�
                    v_Crercd     := '0000';
                    
                ELSE

                    v_Rqst_Stat  := '3';   -- ó�����-����ڵ�
                    --v_Crercd     := TRIM(SUBSTR(v_Row_Data, 295, 4));   -- ó�����-�Ҵ��ڵ�
                    v_Crercd     := TRIM(SUBSTR(v_Row_Data, 295 - 7, 4));   -- ó�����-�Ҵ��ڵ�
                    v_Recp_Amt   := 0;


                END IF;


                -- ī����ü ����(RTRE0080) Update - ó������, ��ݾ� , ����ڵ带 ����
                IF 0 <> Pkg_Rtre0080.f_UpdateRtre0080RqstResult (v_Rcrd_Day, v_Rcrd_Seq, v_Rqst_Stat, v_Tno, v_Crercd,
                                                                 v_Recp_Amt, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '�����ü ����(RTRE0080) Update - ī����üó�� ����,����ڵ带 ���� �� ����!!.'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;  
                
                
            -- ������ ���ڵ� �̸�
            ELSIF v_Record_Type = 'E' THEN           
            
                v_Tdata_Cnt := TO_CHAR(SUBSTR(v_Row_Data,9,7));   -- ī����ü �ѰǼ�
                v_Tdata_Amt := TO_CHAR(SUBSTR(v_Row_Data,16,12)); -- ��ü��ü ��û�ݾ�
                v_Srecp_Cnt := TO_CHAR(SUBSTR(v_Row_Data,47,7));  -- ������� �ѰǼ�
                v_Srecp_Amt := TO_CHAR(SUBSTR(v_Row_Data,54,12)); -- ������� �ѱݾ�
                v_Erecp_Cnt := TO_CHAR(SUBSTR(v_Row_Data,66,7));  -- �������� �ѰǼ�
                v_Erecp_Amt := TO_CHAR(SUBSTR(v_Row_Data,73,12)); -- �������� �ѱݾ� 
                
                -- ī����ü Data ��ü�Ǽ� CHECK
                IF v_Tdata_Cnt <> (v_Srecp_Cnt  + v_Erecp_Cnt) THEN
                    v_Return_Message := '����κ��� ��ü�Ǽ�('||TO_CHAR(v_Tdata_cnt)||') �� ���Ǽ�('
                                        ||TO_CHAR(v_Srecp_Cnt  + v_Erecp_Cnt)||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;
        
                -- ī����ü Data ��ü�ݾ� CHECK
                IF v_Tdata_Amt <> (v_Srecp_Amt  + v_Erecp_Amt) THEN
                    v_Return_Message := '����κ��� ��ü�ݾ�('||TO_CHAR(v_Tdata_Amt)||') �� ���ݾ�('
                                        ||TO_CHAR(v_Srecp_Amt  + v_Erecp_Amt)||') ���� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                    RAISE e_Error;
                END IF;
        
                -- TRAILER ���翩��
                v_Trailer_Yn := 'Y';
                v_Rcrd_Seq   := 99999999;
                    
            END IF;            
            
        END IF;          
      
                
        -- ī����ü Data Record - ���� �ۼ��� ���� Insert
        IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Rcrd_Seq, v_File_Tp, 
                                  --v_File_Seq, CONVERT(v_Row_Data,'AL32UTF8', 'KO16KSC5601'), v_Del_Yn, v_Reg_Id, 
                                  v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                  v_ErrorText) THEN
            v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
        
        
        -- ������ ���ڵ� �̸� ��������
        IF v_Record_Type = 'T' THEN
            v_Trailer_Yn := 'Y';
            EXIT;
        END IF;
                    
    END LOOP;       
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    
    
        
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER �Ǵ� TRAILER ������ ���� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;  
    END IF;
        
    -- �����ü ó�����(RTRE0099) ����
    /*    
    IF 0 <> Pkg_Rtre0099.f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn, 
                             v_Stdex_Dd, v_Str_Day, v_End_Day, v_Header_Yn, 
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, v_Acrq_Cnt, 
                             v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reqst_Cnt, v_Reqst_Amt, 
                             v_Cncrq_Cnt, v_Cncrq_Amt, v_Srecp_Cnt, v_Srecp_Amt, 
                             v_Hsrcp_Cnt, v_Hsrcp_Amt, v_Erecp_Cnt, v_Erecp_Amt, 
                             v_Scnrq_Cnt, v_Scnrq_Amt, v_Ecnrq_Cnt, v_Ecnrq_Amt, 
                             v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
    */
              
    IF 0 <> Pkg_Rtre0099.f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             'Y', 'N', 'N', 'N', 
                             NULL, NULL, NULL, v_Header_Yn, 
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, 0, 
                             0, 0, 0, 0, 
                             0, 0, v_Srecp_Cnt, v_Srecp_Amt, 
                             0, 0, v_Erecp_Cnt, v_Erecp_Amt, 
                             0, 0, 0, 0, 
                             'N', v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾�(RTRE0099) ������ ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingC(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingC(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingC;    
  
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� - ���ݿ����� ������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingCh (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER ���翩��       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*������ �ѰǼ�         */
    v_Tdata_Amt      IN OUT RTRE0099.TDATA_AMT%TYPE,  /*������ �ѱݾ�         */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
/*    
    -- ���ϵ�����(CLOB)�� ';' �����Ͽ� �߶� CURSOR ��´�.                             '
    CURSOR  Cur_File_Data IS    
    SELECT  ROW_DATA, COUNT(*) OVER () AS CNT
    FROM    (                                          
            SELECT  DBMS_LOB.SUBSTR(FILE_DATA, DBMS_LOB.INSTR (FILE_DATA, CRLF, 1, LEVEL) - NVL(DBMS_LOB.INSTR (FILE_DATA, CRLF, 1, LEVEL-1)+1,1) , NVL(DBMS_LOB.INSTR (FILE_DATA, CRLF, 1, LEVEL-1)+1,1)) ROW_DATA
            FROM   (
                    SELECT  v_File_Data FILE_DATA,
                            REGEXP_COUNT(v_File_Data, ';') CNT, -- �ӵ� ���Ϲ����� �־� �����ʿ�,�Ǽ��� �Էƹ޴��� �ƴ� ������� ����
                            ';' CRLF
                    FROM    DUAL
                    )                    
            CONNECT BY LEVEL<= CNT
            );
*/
    
    v_Row_Seq   RTRE0098.ROW_SEQ%TYPE DEFAULT NULL;    /*ROW ����              */
    v_Row_Data  RTRE0098.ROW_DATA%TYPE DEFAULT NULL;   /*���ϳ���              */
    v_Row_Data2 RTRE0098.ROW_DATA%TYPE DEFAULT NULL;   /*���ϳ���              */
    v_Del_Yn    RTRE0098.DEL_YN%TYPE DEFAULT 'N';      /*��������              */
    v_Mat_Nm    RTCS0100.MAT_NM%TYPE DEFAULT NULL;     /*��ǰ��                */

    v_Recv_Seq   RTRE0091.RECV_SEQ%TYPE DEFAULT NULL;  /*�����ŷ���ȣ          */
    v_Cash_Seq   RTRE0091.CASH_SEQ%TYPE DEFAULT NULL;  /*���ݿ����� ���� �Ϸù�*/
    v_Cash_Stat  RTRE0091.CASH_STAT%TYPE DEFAULT NULL; /*���ݿ����� �������   */
    v_Csercd     RTRE0091.CSERCD%TYPE DEFAULT NULL;    /*�߱޿����ڵ�          */
    v_Csermsg    RTRE0091.CSERMSG%TYPE DEFAULT NULL;   /*�߱޿����޼���        */
    v_Cashapp_No RTRE0091.CASHAPP_NO%TYPE DEFAULT NULL;/*���ݿ����� ���ι�ȣ   */
    v_Cash_Amt   RTRE0091.CASH_AMT%TYPE DEFAULT NULL;  /*���ݿ����� ����ݾ�   */
            
    v_Row_Count     NUMBER DEFAULT 0;
    v_Total_Count   NUMBER DEFAULT 0;    
    v_Sum_Amt       NUMBER DEFAULT 0;
    e_Error EXCEPTION;
    
    Cur_File_Data   SYS_REFCURSOR;
    v_Clob_Type     VARCHAR2(10);      /*CLOB TYPE        */
    v_Type          VARCHAR2(20);      /*Parsing ������   */
    v_Spe_Yn        VARCHAR2(20);      /*����ó������     */
    v_Spe_Pos       NUMBER(10);        /*����ó����ġ     */   
    
  BEGIN
  
    -- �ʼ���: ��û����, ���ϸ�, �ۼ��� ���ϱ���, ���� ����, ����� ID    
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    -- KCP_BATCH_FILE_CH01_INX_V3770_20150820
    IF (TRIM(v_File_Nm) IS NULL) OR (38 != LENGTH(TRIM(v_File_Nm))) THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Tp) IS NULL THEN
        v_Return_Message := '�ۼ��� ���ϱ���('||v_File_Tp||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_File_Seq) IS NULL THEN
        v_Return_Message := '���� ����('||v_File_Seq||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    
    v_Row_Count := 0;
    v_Tdata_Amt := 0;   
    v_Header_Yn := 'N';
    v_Trailer_Yn:= 'N';
        
    --  �ۼ���ó�� ����(1��) ���� ���� �۽� ���� ���� CLEAR

    --  CLOB �ڷ� Parsing    
    v_Clob_Type := 'CASH';
    v_Type      := ';';
    v_Spe_Yn    := 'N';
    v_Spe_Pos   := 0;
    Pkg_Rtre0081.p_Rtre0081ClobParsing(Cur_File_Data, v_File_Data, v_Clob_Type, v_Type, v_Spe_Yn, v_Spe_Pos,
                                       v_Total_Count, v_Success_Code, v_Return_Message, v_ErrorText); 
    IF v_Success_Code <> 0  THEN
        v_Return_Message := 'CLOB�ڷ� Parsing��  �����Դϴ�. �����ڿ��� �����ϼ���!';
        RAISE e_Error;                
    END IF;                      
    
    
    LOOP  
    FETCH Cur_File_Data  INTO v_Row_Data;
        EXIT WHEN Cur_File_Data%NOTFOUND;

        v_Row_Count := v_Row_Count+1;
        
        -- ù��° �����ʹ� HEADER ����
        IF v_Row_Count = 1 THEN
                
            -- HEADER ���翩��       
            v_Header_Yn := 'Y'; 
                
        -- ������ �����ʹ� TRAILER ����     
        ELSIF v_Row_Count = v_Total_Count THEN
        
            -- TRAILER ���翩��
            v_Trailer_Yn := 'Y';
            
            -- REGEXP_SUBSTR �̿��Ͽ� ��ġ�� ȹ���ϱ� ���� 1�� ����
            v_Row_Data2    := REPLACE(v_Row_Data,'||','| |');   
            v_Row_Data2    := REPLACE(v_Row_Data2,'||','| |');   
    
            -- �ŷ��ݾ� �հ� �ݾ�
            v_Sum_Amt := TO_NUMBER(TRIM(REPLACE(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,11),',','')));
            
            -- �ŷ��ݾ� �հ�� ������ �ѱݾ��� �����ϸ� ����ó��
            IF v_Sum_Amt <> v_Tdata_Amt THEN
                v_Return_Message := '�ŷ��ݾ� �հ�('||v_Sum_Amt||')�� ������ �ѱݾ�'||v_Tdata_Amt||'�� ���� �ϹǷ� ó���� �Ұ� �մϴ�.!';
                RAISE e_Error;
            END IF;            
            
            EXIT;
        
        -- ������ ó�� �κ�
        ELSE
                
            -- �۽����� Data Record ������  ��û����/���ϸ� ���� ROW ���� ȹ��
            v_Row_Seq := Pkg_Rtre0098.f_sRtre0098RowSeq(v_Rqst_Day, v_File_Nm);

            -- �۽����� Data Record - ���� �ۼ��� ���� Insert
            IF 0 != f_InsertRtre0098 (v_Rqst_Day, v_File_Nm, v_Row_Seq, v_File_Tp, 
                                      v_File_Seq, v_Row_Data, v_Del_Yn, v_Reg_Id, 
                                      v_ErrorText) THEN
                v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� �� ���� �߻�!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
            -- REGEXP_SUBSTR �̿��Ͽ� ��ġ�� ȹ���ϱ� ���� 1�� ����
            v_Row_Data2    := REPLACE(v_Row_Data,'||','| |');   
            v_Row_Data2    := REPLACE(v_Row_Data2,'||','| |');    
            
            --  ��ǰ�� ( LPAD(�����ŷ���ȣ,12,'0')+ LPAD(���ݿ����� ���� �Ϸù�ȣ, 3,'0'))
            v_Mat_Nm := TRIM(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,16));
            
            -- �����ŷ���ȣ : TO_NUMBER(SUBSTR("��ǰ��", 1, 12))
            v_Recv_Seq := TO_NUMBER(SUBSTR(v_Mat_Nm, 1, 12));        
                    
            IF TRIM(v_Recv_Seq) IS NULL THEN
                v_Return_Message := '�����ŷ���ȣ('||v_Recv_Seq||') : ȹ�� ���з� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;
    
            -- ���ݿ����� ���� �Ϸù�ȣ : TO_NUMBER(SUBSTR("��ǰ��", 13, 3))
            v_Cash_Seq := TO_NUMBER(SUBSTR(v_Mat_Nm, 13, 3));
             
            IF TRIM(v_Cash_Seq) IS NULL THEN
                v_Return_Message := '���ݿ����� ���� �Ϸù�ȣ('||v_Cash_Seq||') : ȹ�� ���з� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;
            
            IF 0 = Pkg_Rtre0091.f_sRtre0091Count(v_Recv_Seq, v_Cash_Seq) THEN
                v_Return_Message := '���ݿ������߱޳���('||v_Recv_Seq||'-'||v_Cash_Seq||')�� ���� �����̹Ƿ� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;
            
            -- ���ݿ����� ����ݾ�
            v_Cash_Amt := TO_NUMBER(TRIM(REPLACE(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,11),',','')));
             
            -- �����ι�ȣ
            v_Cashapp_No := TRIM(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,6));
            
            -- ���ݿ����� ������� : ���ι�ȣ ������ ��������('4'), ������ �������('3')
            IF v_Cashapp_No IS NOT NULL THEN
                v_Cash_Stat := '4';
            ELSE
                v_Cash_Stat := '3';
            END IF;
            
            -- �߱޿����޼��� : '�����޽���'
            v_Csermsg := TRIM(REGEXP_SUBSTR(v_Row_Data2,'[^|]+',1,17));
            
            BEGIN
                -- �߱޿����ڵ�: �����ڵ尡 �ִ� ��� ������ NULL,  ������ �����޽����� �̿��Ͽ� �ڵ� ã�� ( �����ڵ� [R028] KCP ����ڵ� )
                SELECT CD 
                INTO   v_Csercd
                FROM   RTCM0051
                WHERE  CD_GRP_CD = 'R028'
                AND    CD_NM     = v_Csermsg
                AND    ROWNUM   <= 1;
                
                EXCEPTION
                  WHEN OTHERS THEN
                    v_Csercd := NULL;
            END;
                
            -- ���ݿ������߱޳���(RTRE0091) Update 
            IF 0 != Pkg_Rtre0091.f_UpdateRtre0091CashUload (v_Recv_Seq, v_Cash_Seq, v_Cash_Stat, v_Cashapp_No, 
                                                            v_Csercd, v_Csermsg, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := ' ���ݿ������߱޳���(RTRE0091) Update ����!!. �����ڿ��� Ȯ���ϼ���!!.'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
            -- ������ �ѱݾ�
            v_Tdata_Amt := v_Tdata_Amt + NVL(v_Cash_Amt,0);
            
        END IF;        
             
    END LOOP;       
    
    -- ������ �ѰǼ�
    v_Tdata_Cnt := v_Row_Count;
    
    IF Cur_File_Data%ISOPEN THEN
        CLOSE Cur_File_Data;
    END IF;
    
    IF (v_Header_Yn = 'N') OR (v_Trailer_Yn = 'N') THEN
        v_Return_Message := '������ ���� �Ľ��Ͽ� ���� �� ���� - HEADER �Ǵ� TRAILER ������ ���� ó���� �Ұ� �մϴ�!';
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingCh(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0098.p_InsertRtre0098FileParsingCh(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0098FileParsingCh;  
  
              
END Pkg_Rtre0098;
/
