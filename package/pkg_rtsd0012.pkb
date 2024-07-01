CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0012 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0012
   PURPOSE   �����̾����� ����(���μ���) ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
   1.1        2018-02-19  wjim             [20180212_01] ������ �����̾� ���� ����
*******************************************************************************/

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Count
  *****************************************************************************/
  FUNCTION f_sRtsd0012Count(
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,            /*�����̾�����      */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,          /*�󼼼���          */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE            /*Ÿ�̾��          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0012
    WHERE   PS_CD   = v_Ps_Cd
    AND     PRS_DCD = v_Prs_Dcd
    AND     PERIOD_CD = v_Period_Cd
    AND     CNT_CD  = v_Cnt_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0012Count;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0012 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PS_CD,                     /*�����̾�����      */
            A.PRS_DCD,                   /*�󼼼���          */
            A.PERIOD_CD,                 /*�Ⱓ�ڵ�            */
            A.CNT_CD,                    /*Ÿ�̾��          */
            A.SERV_CNT,                  /*����Ƚ��          */
            A.SERV_AMT,                  /*�߰���Ż��          */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0012 A
    WHERE   A.PS_CD    = DECODE(v_Ps_Cd    , NULL, A.PS_CD    , v_Ps_Cd)
    AND     A.PRS_DCD  = DECODE(v_Prs_Dcd  , NULL, A.PRS_DCD  , v_Prs_Dcd)
    AND     A.PERIOD_CD  = DECODE(v_Period_Cd  , NULL, A.PERIOD_CD  , v_Period_Cd)
    AND     A.CNT_CD   = DECODE(v_Cnt_Cd   , NULL, A.CNT_CD   , v_Cnt_Cd)
    AND     A.SERV_CNT = DECODE(v_Serv_Cnt , NULL, A.SERV_CNT , v_Serv_Cnt)
    AND     A.SERV_AMT = DECODE(v_Serv_Amt , NULL, A.SERV_AMT , v_Serv_Amt)
    AND     A.USE_YN   = DECODE(v_Use_Yn   , NULL, A.USE_YN   , v_Use_Yn)
    AND     A.REG_ID   = DECODE(v_Reg_Id   , NULL, A.REG_ID   , v_Reg_Id);

  END p_sRtsd0012;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0012 (
            PS_CD,
            PRS_DCD,
            PERIOD_CD,
            CNT_CD,
            SERV_CNT,
            SERV_AMT,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ps_Cd,
            v_Prs_Dcd,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Serv_Cnt,
            v_Serv_Amt,
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

  END f_InsertRtsd0012;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0012
    SET    SERV_CNT = v_Serv_Cnt,
           SERV_AMT = v_Serv_Amt,
           USE_YN   = v_Use_Yn,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE 
    WHERE  PS_CD    = v_Ps_Cd
    AND    PRS_DCD  = v_Prs_Dcd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD   = v_Cnt_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0012;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0012 (
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0012
    SET    USE_YN  = 'N',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE 
    WHERE  PS_CD   = v_Ps_Cd
    AND    PRS_DCD = v_Prs_Dcd
    AND    PERIOD_CD = v_Period_Cd
    AND    CNT_CD  = v_Cnt_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0012;

  /*****************************************************************************
  -- �����̾����� ����(���μ���) ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0012 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ps_Cd          IN RTSD0012.PS_CD%TYPE,          /*�����̾�����        */
    v_Prs_Dcd        IN RTSD0012.PRS_DCD%TYPE,        /*�󼼼���            */
    v_Period_Cd      IN RTSD0012.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0012.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Serv_Cnt       IN RTSD0012.SERV_CNT%TYPE,       /*����Ƚ��            */
    v_Serv_Amt       IN RTSD0012.SERV_AMT%TYPE,       /*�߰���Ż��            */
    v_Use_Yn         IN RTSD0012.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0012.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:�����̾�����,�󼼼���, �Ⱓ�ڵ�, Ÿ�̾��, ��뿩��, ����� ID    
    IF (TRIM(v_Ps_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S043', v_Ps_Cd)) THEN
        v_Return_Message := '�����̾�����('||v_Ps_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Prs_Dcd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S044', v_Prs_Dcd)) THEN
        v_Return_Message := '�󼼼���('||v_Prs_Dcd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '�Ⱓ�ڵ�('||v_Period_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := 'Ÿ�̾��('||v_Cnt_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
        
    IF (TRIM(v_Use_Yn) IS NULL) OR (TRIM(v_Use_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '��뿩��('||v_Use_Yn||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;      
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtsd0012Count(v_Ps_Cd, v_Prs_Dcd, v_Period_Cd, v_Cnt_Cd) THEN

        IF 0 != f_InsertRtsd0012(v_Ps_Cd, v_Prs_Dcd, v_Period_Cd, v_Cnt_Cd, v_Serv_Cnt, 
                                 v_Serv_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�����̾����� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0012(v_Ps_Cd, v_Prs_Dcd, v_Period_Cd, v_Cnt_Cd, v_Serv_Cnt, 
                                     v_Serv_Amt, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����̾����� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0012(v_Ps_Cd, v_Prs_Dcd, v_Period_Cd, v_Cnt_Cd, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����̾����� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0012.p_IUDRtsd0012(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0012.p_IUDRtsd0012(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0012;
  
  /*****************************************************************************
  -- Ư�� �����̾� ���񽺿� �� ���� ��ȸ
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-21  wjim             [20180212_01] �ű� ���� 
  *****************************************************************************/
  PROCEDURE p_sRtsd0012_ByPrmSvc (
      Ref_Cursor     IN OUT SYS_REFCURSOR
    , v_Ps_Cd        IN RTSD0012.PS_CD%TYPE           /*�����ڵ�            */
    , v_Period_Cd    IN RTSD0012.PERIOD_CD%TYPE       /*�Ⱓ�ڵ�(S021)        */
    , v_Cnt_Cd       IN RTSD0012.CNT_CD%TYPE          /*����(S022)            */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A2.PS_CD
         ,  A2.PRS_DCD
         ,  B2.CD_NM     AS PRS_NM
         ,  A2.PERIOD_CD
         ,  A2.CNT_CD
         ,  A2.SERV_CNT
         ,  A2.SERV_AMT
         ,  A2.USE_YN
         ,  A2.REG_ID
         ,  A2.REG_DT
         ,  A2.CHG_ID
         ,  A2.CHG_DT
         ,  A2.MEMO
      FROM  (
                SELECT  A1.*
                     ,  ROW_NUMBER() OVER (PARTITION BY A1.PS_CD, A1.PRS_DCD ORDER BY A1.PERIOD_CD) AS NUM_PERIOD
                     ,  ROW_NUMBER() OVER (PARTITION BY A1.PS_CD, A1.PRS_DCD ORDER BY A1.CNT_CD)    AS NUM_CNT
                  FROM  RTSD0012 A1
                 WHERE  A1.PS_CD     = v_Ps_Cd
                   AND  A1.PERIOD_CD IN (v_Period_Cd, 'ZZ')
                   AND  A1.CNT_CD    IN (v_Cnt_Cd, 'ZZ')
                   AND  A1.USE_YN    = 'Y'
            ) A2
         ,  RTCM0051 B2
     WHERE  A2.NUM_PERIOD   = 1
       AND  A2.NUM_CNT      = 1
       AND  A2.PRS_DCD      = B2.CD(+)
       AND  B2.CD_GRP_CD(+) = 'S044'
     ORDER  BY A2.PRS_DCD;

  END p_sRtsd0012_ByPrmSvc;
  
  /*****************************************************************************
  -- ���񽺵���˾�
  *****************************************************************************/
  PROCEDURE p_sRtsd0012_srvcPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR    
    SELECT A.PRS_DCD,
           A.PRS_NM
      FROM (SELECT PRS_DCD,
	               Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', PRS_DCD) AS PRS_NM
	          FROM RTSD0012
	         WHERE 1=1
               --AND PERIOD_CD != 'ZZ'
	           AND SERV_CNT != 0
               AND USE_YN = 'Y'
          GROUP BY PRS_DCD
          ORDER BY PRS_DCD ASC
    ) A;

  END p_sRtsd0012_srvcPopup;  

END Pkg_Rtsd0012;
/
