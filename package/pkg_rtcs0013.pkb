CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0013 AS
/*******************************************************************************
    NAME        Pkg_Rtcs0013
    PURPOSE     �湮���� �ź�öȸ ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-26  wjim            [20170726_01] �ű԰���
    1.1     2017-08-04  wjim            [20170804_01] �ź�/öȸ SMS �߼۱�� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �湮���� �ź�öȸ���� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRTCS0013 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTCS0013.ORD_NO%TYPE           /* ����ȣ         */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.ORD_NO
         ,  A1.EQU_NO
         ,  C1.CUST_NM
         ,  A1.DENY_SEQ
         ,  A1.DENY_YN
         ,  A1.DENY_YMD
         ,  A1.DENY_ID
         ,  A1.DENY_STD_YM
         ,  A1.DENY_DESC
         ,  A1.WTHDRW_YMD
         ,  A1.WTHDRW_ID
         ,  A1.WTHDRW_STD_YM
         ,  A1.WTHDRW_DESC
         ,  A1.REG_ID
         ,  to_char(A1.REG_DT,'YYYYMMDDHH24MISS') AS REG_DT
         ,  A1.CHG_ID
         ,  to_char(A1.CHG_DT,'YYYYMMDDHH24MISS') AS CHG_DT
      FROM  RTCS0013 A1
         ,  RTSD0108 B1
         ,  RTSD0100 C1
     WHERE  A1.ORD_NO  = DECODE(v_Ord_No, NULL, A1.ORD_NO, v_Ord_No)
       AND  A1.ORD_NO  = B1.ORD_NO(+)
       AND  B1.CUST_NO = C1.CUST_NO(+)
     ORDER  BY A1.DENY_SEQ DESC
    ;

  END p_sRTCS0013;
  
  /*****************************************************************************
  -- �湮���� �źε��
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-26  wjim            [20170726_01] �ű԰���
    1.1     2017-08-04  wjim            [20170804_01] SMS �߼۱�� �߰�
  *****************************************************************************/
  PROCEDURE p_SaveRtcs0013Deny (
      v_Ord_No          IN RTCS0013.ORD_NO%TYPE            /* ����ȣ        */
    , v_Equ_No          IN RTCS0013.EQU_NO%TYPE            /* �����ȣ        */
    , v_Deny_Std_Ym     IN RTCS0013.DENY_STD_YM%TYPE       /* �źα��س��    */
    , v_Deny_Desc       IN RTCS0013.DENY_DESC%TYPE         /* �źγ���        */       
    , v_Reg_Id          IN RTCS0013.REG_ID%TYPE            /* �����ID        */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    ls_Equ_No   RTCS0001.EQU_NO%TYPE;
    ls_Mob_No   RTCS0006.MOB_NO%TYPE;
    ls_Sms_Msg  RTSD0205.SND_MSG%TYPE := '';
    ln_chk_cnt  NUMBER DEFAULT 0;    
    
    e_Error     EXCEPTION;
    
  BEGIN

    -- �ʼ��� Ȯ��
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '����ȣ('||v_Ord_No||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '�����ID('||v_Reg_Id||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
   
    --�����ȣ�� ������ �� ���� ��츦 ���
    --�����ȣ�� ������ ����ȣ�� ��ȸ
    IF TRIM(v_Equ_No) IS NULL THEN
        SELECT  EQU_NO
          INTO  ls_Equ_No
          FROM  RTCS0001
         WHERE  ORD_NO = v_Ord_No;
    ELSE
        ls_Equ_No := v_Equ_No;
    END IF;
    
    --�ش� ����� �źλ������� Ȯ��
    SELECT  COUNT(*)
      INTO  ln_chk_cnt
      FROM  RTCS0013
     WHERE  ORD_NO = v_Ord_No
       AND  EQU_NO = ls_Equ_No
       AND  DENY_YN = 'Y'
    ;
    
    --�̹� �źλ����� ��� ����ó��
    IF ln_chk_cnt > 0 THEN
        v_Return_Message := '�̹� �湮���� �źλ����̹Ƿ� �źε���� �Ұ��մϴ�!';
        RAISE e_Error;
    END IF;
    
    --�湮���� �ź�öȸ ���� ���
    INSERT INTO RTCS0013 (
          ORD_NO
        , EQU_NO
        , DENY_SEQ
        , DENY_YN
        , DENY_YMD        
        , DENY_ID
        , DENY_STD_YM
        , DENY_DESC
        , WTHDRW_YMD
        , WTHDRW_ID
        , WTHDRW_STD_YM
        , WTHDRW_DESC
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT    
    ) VALUES (
          v_Ord_No
        , ls_Equ_No
        , (
            SELECT  NVL2(MAX(DENY_SEQ), TO_NUMBER(MAX(DENY_SEQ))+1, 1) 
              FROM  RTCS0013
             WHERE  ORD_NO = v_Ord_No
               AND  EQU_NO = ls_Equ_No
          )
        , 'Y'
        , TO_CHAR(SYSDATE, 'YYYYMMDD')
        , v_Reg_Id
        , v_Deny_Std_Ym
        , v_Deny_Desc
        , NULL
        , NULL
        , NULL
        , NULL
        , v_Reg_Id
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );
    
    --�湮���� �۾������ �źη� ����
    -- -�źα��ؿ� ���� ó�����°�'�ʱ����'�� �ǵ��� '���˰ź�' ���·� ����
    UPDATE  RTCS0005
       SET  CHK_STAT  = '05'
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  ORD_NO    = v_Ord_No
       AND  EQU_NO    = ls_Equ_No
       AND  STD_YM   >= v_Deny_Std_Ym
       AND  CHK_STAT IN ('01')
    ;
    
    -- �źε�� SMS �߼� [20170804_01]
    BEGIN
        -- SMS�߼� ���� = ���� �ֱ� ���������� �޴�����ȣ 
        SELECT  MOB_NO
          INTO  ls_Mob_No
          FROM  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO, X.EQU_NO ORDER BY X.STD_YM DESC, X.JOB_SEQ DESC, X.SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0006 X
                     WHERE  X.ORD_NO = v_Ord_No
                       AND  X.EQU_NO = v_Equ_No
                )
         WHERE  ROW_NUM = 1;
        
        -- SMS �޽��� 
        ls_Sms_Msg := '[�ؼ�Ÿ�̾�] ���Բ� ������ �湮���� ���񽺴� ������ ��û�� ���� �� �� ���� ���� ������ �ߴܵ˴ϴ�.';
        ls_Sms_Msg := ls_Sms_Msg||CHR(13)||CHR(10);
        ls_Sms_Msg := ls_Sms_Msg||'�湮���� ���񽺸� ���Ͻ� ��� �ؽ�Ʈ���� �ݼ���(1855-0100)���� �����ֽñ� �ٶ��ϴ�.';
         
         Pkg_Rtsd0205.p_Rtsd0205InterfaceNew(
              'I'                   /*���� ���ۿ���         */
            , NULL                  /*���� ���۽ð�         */
            , ls_Mob_No             /*�޴� ��ȭ��ȣ         */
            , '18550100'            /*������ ��ȭ��ȣ       */
            , ls_Sms_Msg            /*�޽�������            */
            , 'S017'                /*��������� �ʵ�       */
            , v_Ord_No              /*��������� �ʵ�       */
            , '2'
            , 'RENTAL00000000000053'
            , v_Reg_Id              /*����� ID             */
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
            
        IF v_Success_Code <> 0 THEN
            v_Return_Message := '�źε�� SMS�߼۽���(1):'||v_ErrorText;
            RAISE e_Error;
        END IF;
    
    EXCEPTION
        WHEN OTHERS THEN
            v_Return_Message := '�źε�� SMS �߼۽���(2):'||SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
    END;
    
    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0013.p_SaveRtcs0013Deny(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0013.p_SaveRtcs0013Deny(2)', v_ErrorText, v_Return_Message);

  END p_SaveRtcs0013Deny;
  
  /*****************************************************************************
  -- �湮���� öȸ���
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-26  wjim            [20170726_01] �ű԰���
    1.1     2017-08-04  wjim            [20170804_01] SMS �߼۱�� �߰�
  *****************************************************************************/
  PROCEDURE p_SaveRtcs0013Withdraw (
      v_Ord_No          IN RTCS0013.ORD_NO%TYPE            /* ����ȣ        */
    , v_Equ_No          IN RTCS0013.EQU_NO%TYPE            /* �����ȣ        */
    , v_Deny_Seq        IN RTCS0013.DENY_SEQ%TYPE          /* �źμ���        */
    , v_Wthdrw_Std_Ym   IN RTCS0013.WTHDRW_STD_YM%TYPE     /* öȸ���س��    */
    , v_Wthdrw_Desc     IN RTCS0013.WTHDRW_DESC%TYPE       /* öȸ����        */       
    , v_Reg_Id          IN RTCS0013.REG_ID%TYPE            /* �����ID        */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS

    lr_Cs0013   RTCS0013%ROWTYPE;
    ls_Mob_No   RTCS0006.MOB_NO%TYPE;
    ls_Sms_Msg  RTSD0205.SND_MSG%TYPE := '';
    
    e_Error     EXCEPTION;
    
  BEGIN

    -- �ʼ��� Ȯ��
    IF TRIM(v_Ord_No) IS NULL THEN
        v_Return_Message := '����ȣ('||v_Ord_No||') : �ʼ� �Է°� �������� ó���� �� �����ϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '�����ID('||v_Reg_Id||') : �ʼ� �Է°� �������� ó���� �� �����ϴ�!';
        RAISE e_Error;
    END IF;
    
    --������ ���� ���� �ź����� ��ȸ
    SELECT  *
      INTO  lr_Cs0013
      FROM  RTCS0013
     WHERE  ORD_NO   = v_Ord_No
       AND  EQU_NO   = v_Equ_No
       AND  DENY_SEQ = v_Deny_Seq;

    --�źλ��°� �ƴ� ��� ����ó��
    IF lr_Cs0013.DENY_YN = 'N' THEN
        v_Return_Message := '�źλ��°� �ƴ϶� öȸ�� �� �����ϴ�!';
        RAISE e_Error;
    END IF;
    
    --�źα��ؿ��� öȸ���ؿ��� �ٸ� ��� ����ó��
    -- - ���� �ٸ� �� �ֵ��� ���������� ó�� ������ �����Ͽ� �ϴ� ������ ��Ȳ�� ó�������ϵ��� ���� 
    IF lr_Cs0013.DENY_STD_YM <> v_Wthdrw_Std_Ym  THEN
        v_Return_Message := '�źα��ؿ�('||lr_Cs0013.DENY_STD_YM||')�� öȸ���ؿ�('||v_Wthdrw_Std_Ym||')�� �ٸ��ϴ�!';
        RAISE e_Error;
    END IF;
    
    --�湮���� �ź�öȸ���� ����
    UPDATE  RTCS0013
       SET  DENY_YN       = 'N'
         ,  WTHDRW_YMD    = TO_CHAR(SYSDATE, 'YYYYMMDD')
         ,  WTHDRW_ID     = v_Reg_Id
         ,  WTHDRW_STD_YM = v_Wthdrw_Std_Ym
         ,  WTHDRW_DESC   = v_Wthdrw_Desc
         ,  CHG_ID        = v_Reg_Id
         ,  CHG_DT        = SYSDATE
     WHERE  ORD_NO        = v_Ord_No
       AND  EQU_NO        = v_Equ_No
       AND  DENY_SEQ      = v_Deny_Seq;
       
    --�湮���� �۾������ öȸ���·� ����
    -- -öȸ���ؿ� ���� ó�����°�'���˰ź�'�� �ǵ��� '�ʱ����' ���·� ����
    UPDATE  RTCS0005
       SET  CHK_STAT  = '01'
         ,  CHG_ID    = v_Reg_Id
         ,  CHG_DT    = SYSDATE
     WHERE  ORD_NO    = v_Ord_No
       AND  EQU_NO    = v_Equ_No
       AND  STD_YM   >= v_Wthdrw_Std_Ym
       AND  CHK_STAT IN ('05'); 

    -- öȸ��� SMS �߼� [20170804_01]
    BEGIN
        -- SMS�߼� ���� = ���� �ֱ� ���������� �޴�����ȣ 
        SELECT  MOB_NO
          INTO  ls_Mob_No
          FROM  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO, X.EQU_NO ORDER BY X.STD_YM DESC, X.JOB_SEQ DESC, X.SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0006 X
                     WHERE  X.ORD_NO = v_Ord_No
                       AND  X.EQU_NO = v_Equ_No
                )
         WHERE  ROW_NUM = 1;
        
        -- SMS �޽��� 
        ls_Sms_Msg := '[�ؼ�Ÿ�̾�] ��û�ϽŴ�� �ؽ�Ʈ���� �湮���� ���� ���� �ߴ��� �����Ǿ����ϴ�.';
         
        Pkg_Rtsd0205.p_Rtsd0205InterfaceNew(
              'I'                   /*���� ���ۿ���         */
            , NULL                  /*���� ���۽ð�         */
            , ls_Mob_No             /*�޴� ��ȭ��ȣ         */
            , '18550100'            /*������ ��ȭ��ȣ       */
            , ls_Sms_Msg            /*�޽�������            */
            , 'S018'                /*��������� �ʵ�       */
            , v_Ord_No              /*��������� �ʵ�       */
            , '2'
            , 'RENTAL00000000000054'
            , v_Reg_Id              /*����� ID             */
            , v_Success_Code
            , v_Return_Message
            , v_ErrorText
        );
            
        IF v_Success_Code <> 0 THEN
            v_Return_Message := 'öȸ��� SMS�߼۽���(1):'||v_ErrorText;
            RAISE e_Error;
        END IF;
    
    EXCEPTION
        WHEN OTHERS THEN
            v_Return_Message := 'öȸ��� SMS �߼۽���(2):'||SUBSTR(SQLERRM, 1, 200);
            RAISE e_Error;
    END;
    
    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0013.p_SaveRtcs0013Withdraw(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('p_IUDRtcs0013.p_SaveRtcs0013Withdraw(2)', v_ErrorText, v_Return_Message);

  END p_SaveRtcs0013Withdraw;
        
END Pkg_Rtcs0013;
/
