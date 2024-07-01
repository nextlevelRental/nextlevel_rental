CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0150 AS
/*******************************************************************************
    NAME        PKG_RTRE0150
    PURPOSE     ���� ���޳���

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-11-17  wjim            [20171117_02] �ű� ����
*******************************************************************************/

  /*****************************************************************************
  -- ���� ���޳��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0150 (
      Ref_Cursor        IN OUT SYS_REFCURSOR    
    , v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*��ϳ��               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*��ϼ���               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*�븮���ڵ�             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*��������               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*���ޱݾ�               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*���޻���               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*��뿩��               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*�����ID               */
    , v_LOGIN_ID        IN VARCHAR2                  /* �α���ID: �����׸� ���� ���� */
    , v_LOGIN_GRP       IN VARCHAR2                  /* �α��� ����� �׷� */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.*,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*��Ż����           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*��Ż����           */
      FROM (
    SELECT  A1.REG_YM
         ,  A1.REG_SEQ
         ,  A1.AGENCY_CD
         ,  B1.AGENCY_NM
         ,  A1.PAY_DAY
         ,  A1.PAY_AMT
         ,  A1.PAY_MSG
         ,  A1.USE_YN
         ,  A1.REG_ID
         ,  TO_CHAR(A1.REG_DT, 'YYYYMMDDHH24MISS') AS REG_DT 
         ,  A1.CHG_ID
         ,  TO_CHAR(A1.CHG_DT, 'YYYYMMDDHH24MISS') AS CHG_DT
      FROM  RTRE0150 A1
         ,  RTSD0007 B1
     WHERE  1=1
       AND  A1.AGENCY_CD = B1.AGENCY_CD(+)
       AND  A1.REG_YM    = DECODE(v_Reg_Ym   , NULL, A1.REG_YM   , v_Reg_Ym   )
       AND  A1.REG_SEQ   = DECODE(v_Reg_Seq  , NULL, A1.REG_SEQ  , v_Reg_Seq  )
       AND  A1.AGENCY_CD = DECODE(v_Agency_Cd, NULL, A1.AGENCY_CD, v_Agency_Cd)
       AND  A1.PAY_DAY   = DECODE(v_Pay_Day  , NULL, A1.PAY_DAY  , v_Pay_Day  )
       AND  A1.USE_YN    = DECODE(v_Use_Yn   , NULL, A1.USE_YN   , v_Use_Yn   )       
       AND  A1.REG_ID    = DECODE(v_Reg_Id   , NULL, A1.REG_ID   , v_Reg_Id   )
     ORDER  BY A1.REG_YM
         ,  A1.REG_SEQ
         ) A
         LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
    ;

  END p_sRtre0150;
  
  /*****************************************************************************
  -- ���� ���޳��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0150 (      
      v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*��ϳ��               */  
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*�븮���ڵ�             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*��������               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*���ޱݾ�               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*���޻���               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*��뿩��               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*�����ID               */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS  
  
  BEGIN
    
    INSERT INTO RTRE0150 (
          REG_YM
        , REG_SEQ
        , AGENCY_CD
        , PAY_DAY
        , PAY_AMT
        , PAY_MSG
        , USE_YN        
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    ) VALUES (
          v_Reg_Ym
        , (
            SELECT  TO_NUMBER(NVL(MAX(REG_SEQ),0))+1 
              FROM  RTRE0150
             WHERE  REG_YM = v_Reg_Ym
          )
        , v_Agency_Cd
        , v_Pay_Day
        , v_Pay_Amt
        , v_Pay_Msg
        , v_Use_Yn
        , v_Reg_Id   
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );
    
    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0150;
  
  /*****************************************************************************
  -- ���� ���޳��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0150 (
      v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*��ϳ��               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*��ϼ���               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*�븮���ڵ�             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*��������               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*���ޱݾ�               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*���޻���               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*��뿩��               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*�����ID               */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTRE0150
       SET  AGENCY_CD = v_Agency_Cd
         ,  PAY_DAY   = v_Pay_Day
         ,  PAY_AMT   = v_Pay_Amt
         ,  PAY_MSG   = v_Pay_Msg
         ,  USE_YN    = v_Use_Yn
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  REG_YM    = v_Reg_Ym
       AND  REG_SEQ   = v_Reg_Seq
    ;     

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0150;
  
  /*****************************************************************************
  -- ���� ���޳��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0150 (
      v_Comm_Dvsn       IN CHAR                      /* ó������(I,U,D)       */
    , v_Reg_Ym          IN RTRE0150.REG_YM%TYPE      /*��ϳ��               */
    , v_Reg_Seq         IN RTRE0150.REG_SEQ%TYPE     /*��ϼ���               */
    , v_Agency_Cd       IN RTRE0150.AGENCY_CD%TYPE   /*�븮���ڵ�             */
    , v_Pay_Day         IN RTRE0150.PAY_DAY%TYPE     /*��������               */
    , v_Pay_Amt         IN RTRE0150.PAY_AMT%TYPE     /*���ޱݾ�               */
    , v_Pay_Msg         IN RTRE0150.PAY_MSG%TYPE     /*���޻���               */
    , v_Use_Yn          IN RTRE0150.USE_YN%TYPE      /*��뿩��               */
    , v_Reg_Id          IN RTRE0150.REG_ID%TYPE      /*�����ID               */     
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    
    ls_Slcm_Ym      VARCHAR2(6);        --������ ����/�������
    ln_Btapfd_Amt   NUMBER(13);         --������������ ��紩���
    ln_Pay_Amt      NUMBER(13);         --��� ������� ��ϵ� ���� ���� �Ѿ�
    
    lr_RE0150       RTRE0150%ROWTYPE;

    e_Error         EXCEPTION;
  BEGIN

    -- �ʼ��� Ȯ��
    IF TRIM(v_Agency_Cd) IS NULL THEN
        v_Return_Message := '�븮���ڵ� : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Pay_Day) IS NULL THEN
        v_Return_Message := '�������� : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    -- �Է°� ����
    IF v_Pay_Amt <= 0 THEN
        v_Return_Message := '���ޱݾ�('||v_Pay_Amt||') : ���ޱݾ��� 0�� �̻��̾�� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    -- ������ ����/������ ��ȸ
    -- - ���� ���谡 �Ϸ�Ǹ� �ش�� �Ǵ� �������δ� �ű� ��� �� ���� �Ұ�
    SELECT  SUBSTR(MAX(APFD_DAY), 1, 6)
      INTO  ls_Slcm_Ym 
      FROM  RTRE5080;
      
    -- �Է� ���޿��� �̹� ����� ��� ���/���� �Ұ�
    IF SUBSTR(v_Pay_Day, 1, 6) <= ls_Slcm_Ym THEN
        v_Return_Message := '�Է� ���޳��('||SUBSTR(v_Pay_Day, 1, 6)||') : �ش� ���޿��� �̹� ���� �Ǵ� �����Ǿ����ϴ�!';
        RAISE e_Error;
    END IF;
    
    -- �Է��� ���޾��� ���� ���� ����׺��� ������ Ȯ��
    -- ��, ��뿩�θ� 'N'���� �Է�/�����ϴ� ���� ����
    IF v_Use_Yn = 'Y' THEN
        -- �����ޱ��� �ش� �븮�� ���� ����� ��ȸ
        SELECT  NVL(SUM(APFD_PAMT), 0) - NVL(SUM(APFD_MAMT), 0)
          INTO  ln_Btapfd_Amt
          FROM  RTRE5080
         WHERE  AGENCY_CD = v_Agency_Cd;
        
        -- ��� ������� ��ϵ� ���� ���� �հ� ��ȸ 
        SELECT  NVL(SUM(PAY_AMT), 0)
          INTO  ln_Pay_Amt
          FROM  RTRE0150
         WHERE  AGENCY_CD  = v_Agency_Cd
           AND  PAY_DAY LIKE SUBSTR(v_Pay_Day, 1, 6)||'%'
           AND  USE_YN     = 'Y';
        
        -- �Է��� ������ޱݾ��� �����ޱ����� ��紩��׺��� Ŭ �� ����    
        IF ln_Btapfd_Amt - ln_Pay_Amt - v_Pay_Amt < 0 THEN
            v_Return_Message := '���ޱݾ�('||v_Pay_Amt||') : �Է��� ���ޱݾ��� ���� ���� �����('||ln_Btapfd_Amt||'-'||ln_Pay_Amt||')�� �ʰ��մϴ�!';
            RAISE e_Error;
        END IF;  
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0150 (
              TO_CHAR(SYSDATE, 'YYYYMM')  
            , v_Agency_Cd
            , v_Pay_Day
            , v_Pay_Amt
            , v_Pay_Msg
            , v_Use_Yn
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '���� ���޳��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN
        
        -- ������ ���� ���޳��� ��ȸ
        SELECT  *
          INTO  lr_RE0150
          FROM  RTRE0150
         WHERE  REG_YM  = v_Reg_Ym
           AND  REG_SEQ = v_Reg_Seq;
        
        -- ���� ���޿��� �̹� ����� ��� ���� �Ұ�
        IF SUBSTR(lr_RE0150.PAY_DAY, 1, 6) <= ls_Slcm_Ym THEN
            v_Return_Message := '���� ���޳��('||SUBSTR(lr_RE0150.PAY_DAY, 1, 6)||') : �ش� ���޿��� �̹� ���� �Ǵ� �����Ǿ����ϴ�!';
            RAISE e_Error;
        END IF;

        IF 0 != f_UpdateRtre0150 (
              v_Reg_Ym
            , v_Reg_Seq
            , v_Agency_Cd
            , v_Pay_Day
            , v_Pay_Amt
            , v_Pay_Msg
            , v_Use_Yn
            , v_Reg_Id    
            , v_ErrorText
        ) THEN
            v_Return_Message := '���� ���޳��� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;    

    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtre0150.p_IUDRtre0150(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtre0150.p_IUDRtre0150(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0150;
        
END PKG_RTRE0150;
/
