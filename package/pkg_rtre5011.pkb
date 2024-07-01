CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5011 AS
/*******************************************************************************
   NAME      Pkg_Rtre5011
   PURPOSE   ���¸� �Ǹż����� ����ǥ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Count
  *****************************************************************************/
  FUNCTION f_sRtre5011Count(
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,        /*�Ǹſ��ڵ�          */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE           /*����ǥ����          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5011
    WHERE   ORD_AGENT = v_Ord_Agent
    AND     CHR_SEQ   = v_Chr_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5011Count;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Select
  *****************************************************************************/
  PROCEDURE p_sRtre5011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Standard_Day   IN RTRE5011.STR_DAY%TYPE,        /*��������              */
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE       /*�Ǹſ��ڵ�            */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_AGENT,                 /*�Ǹſ��ڵ�          */
            Pkg_Rtsd0113.f_sRtsd0113FieldValue(A.ORD_AGENT, 'ORG_AGNM', NULL) AS AGENT_NM, /*�Ǹſ���  */
            A.CHR_SEQ,                   /*����ǥ����          */
            A.STR_DAY,                   /*��������            */
            A.END_DAY,                   /*��������            */
            A.SLCM_AMT,                  /*�Ǹż�����          */
            A.APFD_AMT,                  /*��缳���ݾ�        */
            A.USE_YN,                    /*�������            */
            A.REG_ID,                    /*����� ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.REG_ID )          AS REG_NM, /*����ڸ� */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            Pkg_Rtcm0001.f_sRtcm0001UserNm( A.CHG_ID )          AS CHG_NM, /*�����ڸ� */
            A.CHG_DT                     /*������              */
    FROM    RTRE5011 A
    WHERE   A.STR_DAY  <= v_Standard_Day
    AND     A.END_DAY  >= v_Standard_Day
    AND     A.ORD_AGENT = DECODE(v_Ord_Agent, NULL, A.ORD_AGENT, v_Ord_Agent)
    AND     A.USE_YN    = 'Y';

  END p_sRtre5011;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5011 (
            ORD_AGENT,
            CHR_SEQ,
            STR_DAY,
            END_DAY,
            SLCM_AMT,
            APFD_AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_Agent,
            v_Chr_Seq,
            v_Str_Day,
            v_End_Day,
            v_Slcm_Amt,
            v_Apfd_Amt,
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

  END f_InsertRtre5011;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5011
    SET    STR_DAY   = v_Str_Day,
           END_DAY   = v_End_Day,
           SLCM_AMT  = v_Slcm_Amt,
           APFD_AMT  = v_Apfd_Amt,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  ORD_AGENT = v_Ord_Agent
    AND    CHR_SEQ   = v_Chr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5011;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5011 (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5011
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  ORD_AGENT = v_Ord_Agent
    AND    CHR_SEQ   = v_Chr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5011;

  
  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre5011 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN OUT RTRE5011.CHR_SEQ%TYPE,    /*����ǥ����            */
    v_Str_Day        IN RTRE5011.STR_DAY%TYPE,        /*��������              */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*��������              */
    v_Slcm_Amt       IN RTRE5011.SLCM_AMT%TYPE,       /*�Ǹż�����            */
    v_Apfd_Amt       IN RTRE5011.APFD_AMT%TYPE,       /*��缳���ݾ�          */
    v_Use_Yn         IN RTRE5011.USE_YN%TYPE,         /*�������              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Count      NUMBER DEFAULT 0;
    v_Chan_Cd    RTSD0113.CHAN_CD%TYPE;        /*ä��                  */
    v_Chr_SeqB   RTRE5011.CHR_SEQ%TYPE;        /*����ǥ����            */
    v_Str_DayB   RTRE5011.STR_DAY%TYPE;        /*��������              */
    v_Str_DayC   RTRE5011.STR_DAY%TYPE;        /*��������              */
    v_End_DayB   RTRE5011.END_DAY%TYPE;        /*��������              */
    v_Slcm_AmtB  RTRE5011.SLCM_AMT%TYPE;       /*�Ǹż�����            */
    v_Apfd_AmtB  RTRE5011.APFD_AMT%TYPE;       /*��缳���ݾ�          */
  BEGIN

    -- �ʼ���: �Ǹſ��ڵ�, ����ǥ����, ����� ID
    IF (TRIM(v_Ord_Agent) IS NULL) OR ('04' <> Pkg_Rtsd0113.f_sRtsd0113FieldValue(TRIM(v_Ord_Agent), 'CHAN_CD', 'Y'))THEN
        v_Return_Message := '�Ǹſ��ڵ�('||v_Ord_Agent||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Use_Yn) IS NULL)  THEN
        v_Return_Message := '�������('||v_Use_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn IN ('I', 'U' ) THEN

        IF (TRIM(v_Str_Day) IS NULL)  THEN
            v_Return_Message := '��������('||v_Str_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_End_Day) IS NULL)  THEN
            v_Return_Message := '��������('||v_End_Day||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        -- �Ǹż�����, ���ݱݾ�: 0�� ���ų� 0���� ū ���� ex) x >= 0
        IF (TRIM(v_Slcm_Amt) IS NULL) OR (TRIM(v_Slcm_Amt) < 0) THEN
            v_Return_Message := '�Ǹż�����('||v_Slcm_Amt||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Apfd_Amt) IS NULL) OR (TRIM(v_Apfd_Amt) < 0)  THEN
            v_Return_Message := '��缳���ݾ�('||v_Apfd_Amt||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        

        IF v_Comm_Dvsn = 'I' THEN
        
            -- ��������: ���1�Ϻ��� �Ϳ����ϱ��� �Է� ���� ex) �������� : 2015�� 12�� 7��  -> 2015�� 12�� 1�� ~ 2016�� 1��31�� 
            IF NOT (((TO_CHAR(SYSDATE,'YYYYMM')||'01' <= TRIM(v_Str_Day)) AND (TRIM(v_Str_Day) <= TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,+1)),'YYYYMMDD')))) THEN
                v_Return_Message := '��������('||v_Str_Day||')�� ���1�Ϻ��� �Ϳ����ϱ����� �Է��� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;
            
            -- �������� : '99991231' �� ���� ( ���� ������ ���ɼ� ������ import���� �̿���, ���� �������δ� '99991231'�� ����)
            IF TRIM(v_End_Day) <> '99991231' THEN
                v_Return_Message := '��������('||v_End_Day||') : 99991231 �� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;
            
            -- ��뿩��: �ű� �� ��� : 'Y'
            IF (TRIM(v_Use_Yn) <> 'Y')  THEN
                v_Return_Message := '�ű� �� ��� �������('||v_Use_Yn||')�� Y�θ� ó�������ϹǷ� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;             

            v_Count := 1;
                            
            BEGIN
                -- ���� ��ǰ, ä�ΰǿ� ���Ͽ� �����̷� üũ
                SELECT  CHR_SEQ, STR_DAY, END_DAY
                INTO    v_Chr_SeqB, v_Str_DayB, v_End_DayB
                FROM    RTRE5011
                WHERE   ORD_AGENT  = v_Ord_Agent
                AND     USE_YN  = 'Y'
                AND     END_DAY = '99991231';

            EXCEPTION                
              WHEN NO_DATA_FOUND THEN
                v_Count := 0;
              WHEN OTHERS THEN
                v_Return_Message := '���¸� �Ǹż����� ����ǥ �����̷� üũ�� ���� �߻�.�ý��۰����� ���ǿ��.! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;
            
            -- ���� �̷��� �����ϸ�    
            IF 0 < v_Count THEN
                
                -- ���������� STR_DAY ���� �ԷµǴ� ���۳�¥���� �۰ų� ���ƾ� �Ѵ�. 
                IF TRIM(v_Str_DayB) > TRIM(v_Str_Day) THEN
                    v_Return_Message := '�Է��Ͻ� ��¥('||v_Str_Day||')�� ���� ��������('||v_Str_DayB||')���� �����Ƿ� ó���� �Ұ� �մϴ�.!';
                    RAISE e_Error;
                END IF;
                
                -- ���������� �������� = �űԵ�� �������� -1��
                v_End_DayB := TO_CHAR(TO_DATE(TRIM(v_Str_Day),'YYYYMMDD')-1,'YYYYMMDD');
                    
                -- �Ǹż����� ����ǥ - �����̷� �������� ������Ʈ
                IF 0 != f_UpdateRtre5011EndDay(v_Ord_Agent, v_Chr_SeqB,
                                               v_End_DayB,  v_Reg_Id,  v_ErrorText
                                               ) THEN
                    v_Return_Message := '���¸� �Ǹż����� ����ǥ - �����̷� �������� ������Ʈ ����!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
                            
            END IF;
            
            -- �Ǹż����� ����ǥ ����ǥ���� ���
            v_Chr_Seq := f_sRtre5011ChrSeq(v_Ord_Agent);
            
            -- ���¸� �Ǹż����� ����ǥ Insert
            IF 0 != f_InsertRtre5011( v_Ord_Agent, v_Chr_Seq,
                                      v_Str_Day, v_End_Day, v_Slcm_Amt, v_Apfd_Amt,
                                      v_Use_Yn,  v_Reg_Id,  v_ErrorText
                                     ) THEN
                v_Return_Message := '���¸� �Ǹż����� ����ǥ ��� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
        ELSE
        
            -- ����ǥ���� �ʼ�
            IF (TRIM(v_Chr_Seq) IS NULL) OR (0 = f_sRtre5011Count(v_Ord_Agent, v_Chr_Seq)) THEN
                v_Return_Message := '����ǥ����('||v_Chr_Seq||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;

            BEGIN
                -- �����ϰ��� �ϴ� �̷� ������ ȹ��
                SELECT  STR_DAY, END_DAY, SLCM_AMT, APFD_AMT
                INTO    v_Str_DayB, v_End_DayB, v_Slcm_AmtB, v_Apfd_AmtB
                FROM    RTRE5011
                WHERE   ORD_AGENT = v_Ord_Agent
                AND     CHR_SEQ   = v_Chr_Seq;

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '���¸� �Ǹż����� ����ǥ �̷� üũ�� ���� �߻�.�ý��۰����� ���ǿ��.! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;
            
            -- ���� �̷¸� ����������.
            IF TRIM(v_End_DayB) <> '99991231' THEN
                v_Return_Message := '�����̷� ��������('||v_End_DayB||') : ���� �̷¸� �������������� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;
            
            -- �Ǹż�����, ���� �����ݾ� : �������ڰ� �������(�������)�� ��쿡�� ���� ����
            IF (SUBSTR(TRIM(v_Str_Day), 1, 6) < TO_CHAR(SYSDATE,'YYYYMM')) AND 
                ((TRIM(v_Slcm_AmtB) <> TRIM(v_Slcm_Amt)) OR (TRIM(v_Apfd_AmtB) <> TRIM(v_Apfd_Amt))) THEN
                v_Return_Message := '�������ڰ� ���� ������ ������ �ݾ��� ������ �� �����ϴ�.!';
                RAISE e_Error;
            END IF;

            -- ��������: ���1�Ϻ��� �Ϳ����ϱ��� �Է� ���� ex) �������� : 2015�� 12�� 7��  -> 2015�� 12�� 1�� ~ 2016�� 1��31�� 
            IF NOT ((TO_CHAR(SYSDATE,'YYYYMM')||'01' <= TRIM(v_Str_DayB)) AND (TRIM(v_Str_DayB) <= TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,+1)),'YYYYMMDD'))) AND
               NOT ((TO_CHAR(SYSDATE,'YYYYMM')||'01' <= TRIM(v_Str_Day )) AND (TRIM(v_Str_Day ) <= TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,+1)),'YYYYMMDD'))) THEN
                v_Return_Message := '��������('||v_Str_Day||')�� ���1�Ϻ��� �Ϳ����ϱ����� �Է��� �����ϹǷ� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;

            v_Count := 1;
                
            BEGIN
                -- ���� ��ǰ, ä�ΰǿ� ���Ͽ� �����̷� üũ
                SELECT  CHR_SEQ, STR_DAY
                INTO    v_Chr_SeqB, v_Str_DayC
                FROM    (
                        SELECT  CHR_SEQ, STR_DAY
                        FROM    RTRE5011
                        WHERE   ORD_AGENT = v_Ord_Agent
                        AND     CHR_SEQ <> v_Chr_Seq
                        AND     STR_DAY <= v_Str_DayB
                        AND     USE_YN  = 'Y'
                        --AND     END_DAY = '99991231'
                        AND     END_DAY = (TO_CHAR(TO_DATE(v_Str_DayB, 'YYYYMMDD') - 1, 'YYYYMMDD'))
                        ORDER BY CHR_SEQ DESC, STR_DAY DESC 
                        )
                WHERE   ROWNUM <= 1;

            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Count := 0;
              WHEN OTHERS THEN
                v_Return_Message := '���¸� �Ǹż����� ����ǥ �̷� üũ�� ���� �߻�.�ý��۰����� ���ǿ��.! - '||SUBSTR(SQLERRM, 1, 200);
                RAISE e_Error;
            END;

            -- �����̷��� ������ ���     
            IF v_Count >= 1 THEN
            
                -- �����̷��� �������ں��� ���� �������ڷ� ���� �Ұ�
                IF TRIM(v_Str_Day) < TRIM(v_Str_DayC) THEN
                    v_Return_Message := '�Է��Ͻ� ��¥('||v_Str_Day||')�� ���� ��������('||v_Str_DayC||')���� �����Ƿ� ó���� �Ұ� �մϴ�.!';
                    RAISE e_Error;
                END IF;
                        
                            
                -- ���������� �������� = �űԵ�� �������� -1��
                IF v_Use_yn = 'Y' THEN
                    v_End_DayB := TO_CHAR(TO_DATE(TRIM(v_Str_Day),'YYYYMMDD')-1,'YYYYMMDD');
                ELSE
                    v_End_DayB := '99991231';
                END IF;
                                
                -- �Ǹż����� ����ǥ - �����̷� �������� ������Ʈ
                IF 0 != f_UpdateRtre5011EndDay(v_Ord_Agent, v_Chr_SeqB,
                                               v_End_DayB,  v_Reg_Id,  v_ErrorText
                                               ) THEN
                    v_Return_Message := '���¸� �Ǹż����� ����ǥ - �����̷� �������� ������Ʈ ����!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;   
                
            END IF;

            -- ���¸� �Ǹż����� ����ǥ Update
            IF 0 != f_UpdateRtre5011( v_Ord_Agent, v_Chr_Seq,
                                      v_Str_Day, v_End_Day, v_Slcm_Amt, v_Apfd_Amt,
                                      v_Use_Yn,  v_Reg_Id,  v_ErrorText
                                     ) THEN
                v_Return_Message := '���¸� �Ǹż����� ����ǥ ���� ����!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF (TRIM(v_Chr_Seq) IS NULL)  THEN
            v_Return_Message := '����ǥ����('||v_Chr_Seq||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
            RAISE e_Error;
        END IF;
        
        -- ��뿩��: ���� �� ��� : 'N'
        IF (TRIM(v_Use_Yn) <> 'N')  THEN
            v_Return_Message := '���� �� ��� �������('||v_Use_Yn||')�� N�θ� ó�������մϴ�!';
            RAISE e_Error;
        END IF;             

        IF 0 != f_DeleteRtre5011( v_Ord_Agent, v_Chr_Seq,
                                  v_Reg_Id,    v_ErrorText
                                     ) THEN
            v_Return_Message := '���¸� �Ǹż����� ����ǥ ���� ����!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '���������� ó���Ǿ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5011.p_IUDRtre5011(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5011.p_IUDRtre5011(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5011;

  
  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ - �����̷� �������� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre5011EndDay (
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE,      /*�Ǹſ��ڵ�            */
    v_Chr_Seq        IN RTRE5011.CHR_SEQ%TYPE,        /*����ǥ����            */
    v_End_Day        IN RTRE5011.END_DAY%TYPE,        /*��������              */
    v_Reg_Id         IN RTRE5011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5011
    SET    END_DAY   = v_End_Day,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  ORD_AGENT = v_Ord_Agent
    AND    CHR_SEQ   = v_Chr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5011EndDay;

  /*****************************************************************************
  -- ���¸� �Ǹż����� ����ǥ - ����ǥ���� ���
  *****************************************************************************/
  FUNCTION f_sRtre5011ChrSeq(
    v_Ord_Agent      IN RTRE5011.ORD_AGENT%TYPE         /*�Ǹſ��ڵ�          */
    ) RETURN NUMBER IS
    v_Chr_Seq RTRE5011.CHR_SEQ%TYPE;                    /*����ǥ����          */
  BEGIN

    SELECT  NVL((SELECT  MAX(CHR_SEQ)
                 FROM    RTRE5011
                 WHERE   ORD_AGENT = v_Ord_Agent)+ 1, 1) AS CHR_SEQ
    INTO    v_Chr_Seq
    FROM    DUAL;
    
    RETURN v_Chr_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre5011ChrSeq;
  
END Pkg_Rtre5011;
/
