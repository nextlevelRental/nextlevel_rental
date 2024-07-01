CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_ZTSD0008 AS

  PROCEDURE p_sZtsd0008 (
    Ref_Cursor  IN OUT SYS_REFCURSOR, 
    v_PRICE_CD               ZTSD0008.PRICE_CD%TYPE, /*����,�ݾ�����         */
    v_MAT_CD                 ZTSD0008.MAT_CD%TYPE,   /*��ǰ�ڵ�              */
    v_PERIOD_CD              ZTSD0008.PERIOD_CD%TYPE,/*�Ⱓ�ڵ�              */ 
    v_CNT_CD                 ZTSD0008.CNT_CD%TYPE,   /*Ÿ�̾��            */ 
    v_REGI_CD                ZTSD0008.REGI_CD%TYPE,  /*��Ϻ��ڵ�            */ 
    v_STR_DAY                ZTSD0008.STR_DAY%TYPE,  /*�������� ������       */ 
    v_END_DAY                ZTSD0008.END_DAY%TYPE,  /*�������� �Ϸ���       */
    v_SEQ                    ZTSD0008.SEQ%TYPE, 
    v_AMT                    ZTSD0008.AMT%TYPE,      /*�ݾ�                  */ 
    v_USE_YN                 ZTSD0008.USE_YN%TYPE, 
    v_REG_ID                 ZTSD0008.REG_ID%TYPE
  ) IS
  BEGIN
    Open Ref_Cursor for
    select A.PRICE_CD
          , A.MAT_CD
          , '' MAT_NM
          , A.PERIOD_CD
          , A.CNT_CD
          , A.REGI_CD
          , A.STR_DAY
          , A.END_DAY
          , A.SEQ
          , A.AMT
          , A.USE_YN
          , A.REG_ID
          , A.REG_DT
          , A.CHG_ID
          , A.CHG_DT
     from ZTSD0008 A
    where 1=1
     AND   A.PRICE_CD  = DECODE(v_Price_Cd  , NULL, A.PRICE_CD  , v_Price_Cd)
     AND    A.PERIOD_CD = DECODE(v_Period_Cd , NULL, A.PERIOD_CD , v_Period_Cd)    
     AND    A.CNT_CD    = DECODE(v_Cnt_Cd    , NULL, A.CNT_CD    , v_Cnt_Cd)
     AND     A.MAT_CD    = DECODE(v_Mat_Cd    , NULL, A.MAT_CD    , v_Mat_Cd)
     --and A.MAT_CD = '12370NX'     
     --and A.regi_cd = '0003'
    --and A.seq = 1
    --and A.reg_id = 'admin'      
  ;
  
  /*
  insert into ZTDBGLOG(parm_nm, parm_val)
  values ('v_CNT_CD', v_CNT_CD);  
  commit;
  */
  
  END p_sZtsd0008;

  /*****************************************************************************
  -- ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN OUT Ztsd0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    v_Seq := f_sZtsd0008MaxSeq(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd, v_Str_Day, v_End_Day);

    INSERT  INTO Ztsd0008 (
            PRICE_CD,
            MAT_CD,
            PERIOD_CD,
            CNT_CD,
            REGI_CD,
            STR_DAY,
            END_DAY,
            SEQ,
            AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Price_Cd,
            v_Mat_Cd,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Regi_Cd,
            '20181008',
            '20181030',
            v_Seq,
            v_Amt,
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

  END f_InsertZtsd0008;

  /*****************************************************************************
  -- ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN Ztsd0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE Ztsd0008
    SET    AMT       = v_Amt,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateZtsd0008;

  /*****************************************************************************
  -- ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteZtsd0008 (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN Ztsd0008.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE Ztsd0008
    SET    USE_YN    = 'N',
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PRICE_CD  = v_Price_Cd
    AND    MAT_CD    = v_Mat_Cd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD    = v_Cnt_Cd
    AND    REGI_CD   = v_Regi_Cd
    AND    STR_DAY   = v_Str_Day
    AND    END_DAY   = v_End_Day
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteZtsd0008;

  /*****************************************************************************
  -- ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDZtsd0008 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN OUT Ztsd0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN Ztsd0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN Ztsd0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN Ztsd0008.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����_�ݾ����� , ��ǰ�ڵ�,�Ⱓ�ڵ�,Ÿ�̾��, ��Ϻ��ڵ�,�������� ������,�������� �Ϸ���,  ��뿩�� ,����� ID
    /*IF 0 = f_sZtsd0008Count(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                            v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq) THEN */
    IF v_Comm_Dvsn = 'I' THEN                            
        IF 0 != f_InsertZtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                 v_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSIF v_Comm_Dvsn = 'U' THEN
        IF 0 != f_UpdateZtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                 v_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���� ���� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteZtsd0008(v_Price_Cd, v_Mat_Cd, v_Period_Cd, v_Cnt_Cd,
                                 v_Regi_Cd, v_Str_Day, v_End_Day, v_Seq,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '���� ���� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
       END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;

begin
  insert into ZTDBGLOG(parm_nm, parm_val)
  values ('v_Comm_Dvsn', v_Comm_Dvsn);  
  commit;
end;


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

        Pkg_Utility.p_ErrorFileWrite('Pkg_Ztsd0008.p_IUDZtsd0008(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Ztsd0008.p_IUDZtsd0008(2)', v_ErrorText, v_Return_Message);

  END p_IUDZtsd0008;

  FUNCTION f_sZtsd0008MaxSeq (
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,          /*�������� ������     */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE          /*�������� �Ϸ���     */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL((SELECT
                        SEQ + 1
                FROM    Ztsd0008
                WHERE   PRICE_CD   = v_Price_Cd
                AND     MAT_CD     = v_Mat_Cd
                AND     PERIOD_CD  =  v_Period_Cd
                AND     CNT_CD     = v_Cnt_Cd
                AND     REGI_CD    = v_Regi_Cd
                AND     STR_DAY    = v_Str_Day
                AND     END_DAY    = v_End_Day
                AND     ROWNUM    <= 1), 1)
    INTO    v_curr_cunt
    FROM    DUAL;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sZtsd0008MaxSeq;

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sZtsd0008Count(
    v_Price_Cd       IN Ztsd0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN Ztsd0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN Ztsd0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN Ztsd0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN Ztsd0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Str_Day        IN Ztsd0008.STR_DAY%TYPE,          /*�������� ������     */
    v_End_Day        IN Ztsd0008.END_DAY%TYPE,          /*�������� �Ϸ���     */
    v_Seq            IN Ztsd0008.SEQ%TYPE               /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    Ztsd0008
    WHERE   PRICE_CD  = v_Price_Cd
    AND     MAT_CD    = v_Mat_Cd
    AND     PERIOD_CD = v_Period_Cd
    AND     CNT_CD    = v_Cnt_Cd
    AND     REGI_CD   = v_Regi_Cd
    AND     STR_DAY   = v_Str_Day
    AND     END_DAY   = v_End_Day
    AND     SEQ       = v_Seq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sZtsd0008Count;


END PKG_ZTSD0008;
/
