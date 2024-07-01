CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0011 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0011
   PURPOSE   �����̾����� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-22  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �����̾����� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0011Count(
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,            /*�����̾�����      */
    v_Seq            IN RTSD0011.SEQ%TYPE               /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0011
    WHERE   PS_CD = v_Ps_Cd
    AND     SEQ   = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0011Count;

  /*****************************************************************************
  -- �����̾����� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0011 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*��������              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PS_CD,                     /*�����̾�����      */
            A.SEQ,                       /*����                */
            A.STR_DAY,                   /*�������� ������     */
            A.END_DAY,                   /*�������� �Ϸ���     */
            A.SEASON_CD,                 /*��������            */
            A.USE_YN,                    /*��뿩��            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTSD0011 A
    WHERE   A.PS_CD     = DECODE(v_Ps_Cd     , NULL, A.PS_CD     , v_Ps_Cd)
    AND     A.SEQ       = DECODE(v_Seq       , NULL, A.SEQ       , v_Seq)
    AND     A.STR_DAY   = DECODE(v_Str_Day   , NULL, A.STR_DAY   , v_Str_Day)
    AND     A.END_DAY   = DECODE(v_End_Day   , NULL, A.END_DAY   , v_End_Day)
    AND     A.SEASON_CD = DECODE(v_Season_Cd , NULL, A.SEASON_CD , v_Season_Cd)
    AND     A.USE_YN    = DECODE(v_Use_Yn    , NULL, A.USE_YN    , v_Use_Yn)
    AND     A.REG_ID    = DECODE(v_Reg_Id    , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtsd0011;

  /*****************************************************************************
  -- �����̾����� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*��������              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0011 (
            PS_CD,
            SEQ,
            STR_DAY,
            END_DAY,
            SEASON_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ps_Cd,
            v_Seq,
            v_Str_Day,
            v_End_Day,
            v_Season_Cd,
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

  END f_InsertRtsd0011;

  /*****************************************************************************
  -- �����̾����� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*��������              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0011
    SET    STR_DAY   = v_Str_Day,
           END_DAY   = v_End_Day,
           SEASON_CD = v_Season_Cd,
           USE_YN    = v_Use_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  PS_CD     = v_Ps_Cd
    AND    SEQ       = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0011;

  /*****************************************************************************
  -- �����̾����� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0011 (
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0011
    SET    USE_YN = 'N',
           CHG_ID = v_Reg_Id,
           CHG_DT = SYSDATE
    WHERE  PS_CD  = v_Ps_Cd
    AND    SEQ    = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0011;

  /*****************************************************************************
  -- �����̾����� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0011 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Ps_Cd          IN RTSD0011.PS_CD%TYPE,          /*�����̾�����        */
    v_Seq            IN RTSD0011.SEQ%TYPE,            /*����                  */
    v_Str_Day        IN RTSD0011.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0011.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Season_Cd      IN RTSD0011.SEASON_CD%TYPE,      /*��������              */
    v_Use_Yn         IN RTSD0011.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0011.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:�����̾�����,�������� ������, �������� �Ϸ���, ��뿩��, ����� ID
    IF (TRIM(v_Ps_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S043', v_Ps_Cd)) THEN
        v_Return_Message := '�����̾�����('||v_Ps_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Str_Day) THEN
        v_Return_Message := '�������� ������('||v_Str_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_End_Day) THEN
        v_Return_Message := '�������� �Ϸ���('||v_Str_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Season_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S014', v_Season_Cd)) THEN
        v_Return_Message := '��������('||v_Season_Cd||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
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

    IF 0 = f_sRtsd0011Count(v_Ps_Cd, v_Seq) THEN

        IF 0 != f_InsertRtsd0011(v_Ps_Cd, v_Seq, v_Str_Day, v_End_Day,
                                 v_Season_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�����̾����� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0011(v_Ps_Cd, v_Seq, v_Str_Day, v_End_Day,
                                     v_Season_Cd, v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�����̾����� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0011(v_Ps_Cd, v_Seq, v_Reg_Id, v_ErrorText) THEN
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0011.p_IUDRtsd0011(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0011.p_IUDRtsd0011(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0011;


  /*****************************************************************************
  -- �����̾������˾�
  *****************************************************************************/
  PROCEDURE p_sRtsd0011_preminumPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_applyDate          IN RTSD0011.STR_DAY%TYPE,              /*��������          */
      v_cnt                IN RTSD0012.CNT_CD%TYPE,              /*Ÿ�̾��         */
      v_season            IN RTSD0011.SEASON_CD%TYPE,            /*������           */
      v_Period_Cd       IN RTSD0012.PERIOD_CD%TYPE          /*�Ⱓ�ڵ�        */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.PS_CD,                                                           /*�����̾����� */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S043', A.PS_CD) AS PS_NM,        /*�����̾����� */
            A.SEQ,                                                             /*����           */
            A.STR_DAY,                                                         /*�������� ������*/
            A.END_DAY,                                                         /*�������� �Ϸ���*/
            A.SEASON_CD,                                                       /*��������       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S014', A.SEASON_CD) AS SEASON_NM,/*�������и�     */
            B.PRS_DCD,                                                         /*�󼼼���     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', B.PRS_DCD) AS PRS_NM,     /*�󼼼���     */
            B.CNT_CD,                                                          /*Ÿ�̾��     */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', B.CNT_CD) AS CNT_NM,      /*Ÿ�̾��     */
            B.SERV_CNT,                                                        /*����Ƚ��     */
            B.SERV_AMT,                                                        /*�߰���Ż��     */
            B.PERIOD_CD                                                        /*�Ⱓ�ڵ�       */
    FROM    RTSD0011 A,
            RTSD0012 B
    WHERE   (v_applyDate IS NULL OR v_applyDate BETWEEN A.STR_DAY AND A.END_DAY)
    AND     (v_cnt       IS NULL OR B.CNT_CD =  v_cnt)
    AND     (v_season    IS NULL OR A.SEASON_CD =  v_season)
    AND     (v_Period_Cd IS NULL OR B.PERIOD_CD =  v_Period_Cd)
    AND     A.PS_CD  = B.PS_CD
    AND     A.USE_YN = 'Y'
    AND     B.USE_YN = 'Y'
    ORDER   BY STR_DAY, END_DAY;

  END p_sRtsd0011_preminumPopup;
  
  /*****************************************************************************
  -- ������ �����̾� ���� �˾� ��ȸ
  -- 1) ���ڱ��� 
      - ALL(��ü), TODAY(����), IN(��������)
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2018-02-19  wjim             [20180212_01] �ű� ���� 
  *****************************************************************************/
  PROCEDURE p_sRtsd0011_masterChoicePopup (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_dayTp           IN VARCHAR2                     /*���ڱ���            */
    , v_applyDate       IN RTSD0011.STR_DAY%TYPE        /*��������            */
    , v_ordId           IN RTSD0011.ORD_ID%TYPE         /*�ֹ�����(S029)      */
    , v_chanCd          IN RTSD0011.CHAN_CD%TYPE        /*ä�α���(S030)      */
    , v_Season_Cd       IN RTSD0011.SEASON_CD%TYPE      /*��������(S014)      */
  ) IS
  
    ls_applyDay         VARCHAR2(8);

  BEGIN
  
    -- ���ڱ��п� ���� �������� ����
    IF v_dayTp = 'ALL' THEN
        ls_applyDay := NULL;
    ELSIF v_dayTp = 'IN' THEN
        ls_applyDay := v_applyDate;
    ELSE
        ls_applyDay := TO_CHAR(SYSDATE, 'YYYYMMDD');
    END IF;

    OPEN Ref_Cursor FOR
    SELECT  A2.PS_CD
         ,  A2.SEQ
         ,  NVL(B2.CD_NM, A2.MEMO) AS PS_NM
         ,  A2.ORD_ID
         ,  A2.CHAN_CD
         ,  A2.SEASON_CD
         ,  A2.SERV_AMT
         ,  A2.MEMO
         ,  A2.STR_DAY
         ,  A2.END_DAY     
         ,  A2.USE_YN     
         ,  A2.REG_ID
         ,  A2.REG_DT
         ,  A2.CHG_ID
         ,  A2.CHG_DT
      FROM  (
                SELECT  A1.*
                     ,  CASE
                            WHEN SUM(DECODE(A1.ORD_ID, v_ordId, 1, 0)) OVER () = 0 THEN
                                'Y'
                            ELSE 
                                DECODE(A1.ORD_ID, v_ordId, 'Y', 'N')
                        END AS ORD_CHK                    
                     ,  CASE
                            WHEN SUM(DECODE(A1.CHAN_CD, v_chanCd, 1, 0)) OVER () = 0 THEN
                                'Y'
                            ELSE 
                                DECODE(A1.CHAN_CD, v_chanCd, 'Y', 'N')
                        END AS CHAN_CHK   
                     ,  CASE
                            WHEN SUM(DECODE(A1.SEASON_CD, v_Season_Cd, 1, 0)) OVER () = 0 THEN
                                'Y'
                            ELSE 
                                DECODE(A1.SEASON_CD, v_Season_Cd, 'Y', 'N')
                        END AS SEASON_CHK
                  FROM  RTSD0011 A1
                 WHERE  1=1
                   AND  (ls_applyDay IS NULL OR ls_applyDay BETWEEN A1.STR_DAY AND A1.END_DAY)
                   AND  A1.ORD_ID    IN (v_ordId    , 'ZZ')
                   AND  A1.CHAN_CD   IN (v_chanCd   , 'ZZ')
                   AND  A1.SEASON_CD IN (v_Season_Cd, 'ZZ')
                   AND  A1.USE_YN = 'Y'
            ) A2
         ,  RTCM0051 B2
     WHERE  1=1
       AND  A2.ORD_CHK      = 'Y'
       AND  A2.CHAN_CHK     = 'Y'
       AND  A2.SEASON_CHK   = 'Y'
       AND  A2.PS_CD        = B2.CD(+)
       AND  B2.CD_GRP_CD(+) = 'S043'   
    ;

  END p_sRtsd0011_masterChoicePopup;
END Pkg_Rtsd0011;
/
