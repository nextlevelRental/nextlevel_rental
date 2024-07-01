CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTSD0060 AS
/******************************************************************************* 
   NAME      PKG_RTSD0060 
   PURPOSE   ��Ż���� ���� 
 
   REVISIONS 
   Ver        Date        Author           Description 
   ---------  ----------  ---------------  ------------------------------------- 
   1.0        2018-11-01  Sean         1. Created this package body. 
*******************************************************************************/ 
  /***************************************************************************** 
  -- ��Ż���� ��ȸ Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService ( 
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,               /* �������  */
    v_Chan_Lcis_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,          /* ä�δ�з�  */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,           /* ä���ߺз�  */  
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE         /*������              */       
    ) IS 
  BEGIN 
    OPEN Ref_Cursor FOR 
    SELECT
    COMM_TP,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('R042', COMM_TP) as COMM_TP_NM,
    CHAN_LCLS_CD,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('S090', CHAN_LCLS_CD) as CHAN_LCLS_NM,
    CHAN_MCLS_CD,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('S091', CHAN_MCLS_CD) as CHAN_MCLS_NM,
    CHR_SEQ,
    MIN_CNT,
    STR_DAY,
    MAX_CNT,
    END_DAY

    FROM RTSD0060

     WHERE COMM_TP  = DECODE(v_COMM_TP, NULL, COMM_TP, v_COMM_TP)  /*����                  */
       AND CHAN_LCLS_CD  = DECODE(v_Chan_Lcis_Cd, NULL, CHAN_LCLS_CD, v_Chan_Lcis_Cd)
       AND CHAN_MCLS_CD  = DECODE(v_Chan_Mcls_Cd, NULL, CHAN_MCLS_CD, v_Chan_Mcls_Cd)
       AND CHR_SEQ  = DECODE(v_Chr_Seq, NULL, CHR_SEQ, v_Chr_Seq)
    
     ORDER BY COMM_TP, CHAN_LCLS_CD
       ;  
  END p_sRtsd0060visitorService; 


  /***************************************************************************** 
  -- ��Ż���� ��ȸ Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService2 ( 
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,               /* �������  */
    v_Chan_Lcis_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,          /* ä�δ�з�  */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE           /* ä���ߺз�  */     
    ) IS 
  BEGIN 
    OPEN Ref_Cursor FOR 
    SELECT 
        COMM_TP,
        CHAN_LCLS_CD,
        CHAN_MCLS_CD,
        CHR_SEQ,
        SEQ,
        SALE_MIN_CNT,
        COMM_AMT,
        SALE_MAX_CNT,
        USE_YN
    FROM RTSD0061

     WHERE COMM_TP  = DECODE(v_COMM_TP, NULL, COMM_TP, v_COMM_TP)  /*����                  */
       AND CHAN_LCLS_CD  = DECODE(v_Chan_Lcis_Cd, NULL, CHAN_LCLS_CD, v_Chan_Lcis_Cd)
       AND CHAN_MCLS_CD  = DECODE(v_Chan_Mcls_Cd, NULL, CHAN_MCLS_CD, v_Chan_Mcls_Cd)
       AND USE_YN='Y'
     ORDER BY SEQ,COMM_TP, CHAN_LCLS_CD
       ;  
  END p_sRtsd0060visitorService2;  
   /***************************************************************************** 
  -- ��Ż���� ��ȸ Select 
  *****************************************************************************/  
  PROCEDURE p_IUDRtsd0060 (
    v_Comm_Dvsn         IN CHAR,                         /*ó������(I,U,D)       */
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*�������� ������       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*�������� �Ϸ���       */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*����                  */ 
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*����� ID             */  
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����_�ݾ����� , ��ǰ�ڵ�,�Ⱓ�ڵ�,Ÿ�̾��, ��Ϻ��ڵ�,�������� ������,�������� �Ϸ���,  ��뿩�� ,����� ID
    IF TRIM(v_Comm_Tp) IS NULL THEN
        v_Return_Message := '����_�ݾ����� ('||v_Comm_Tp||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;


IF 0 = f_sRtsd0060Count(v_Comm_Tp, v_Chr_Seq, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                            v_Seq) THEN

        IF 0 != f_InsertRtsd0060(v_Comm_Tp, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                                 v_Sale_Min_Cnt, v_Comm_Amt, v_Sale_Max_Cnt,
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�湮 ���� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF
        ;
    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0060(v_Comm_Tp, v_Chr_Seq, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                                 v_Sale_Min_Cnt, v_Comm_Amt, v_Sale_Max_Cnt, v_Seq,
                                 v_Use_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�湮 ���� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0060(v_Comm_Tp, v_Chr_Seq, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                                 v_Seq, v_ErrorText) THEN
                v_Return_Message := '�湮 ���� ���� ���� ����!!!'||'-'||v_ErrorText;
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

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0060.p_IUDRtsd0060(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0060.p_IUDRtsd0060(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0060;  
  
  
  /*****************************************************************************
  -- �湮 ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060Count(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Seq               IN RTSD0061.SEQ%TYPE            /*����                  */ 
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0061
    WHERE   COMM_TP  = v_Comm_Tp 
    AND     CHAN_MCLS_CD = v_Chan_Mcls_Cd
    AND     CHAN_LCLS_CD    = v_Chan_Lcls_Cd
    AND     CHR_SEQ         = v_Chr_Seq
    AND     SEQ             = v_Seq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0060Count;    


  /*****************************************************************************
  -- �湮 ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */    
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*�������� ������       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*�������� �Ϸ���       */   
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER IS
   
  BEGIN

    INSERT INTO RTSD0061
    (
        COMM_TP,
        CHAN_MCLS_CD,
        CHAN_LCLS_CD,        
        CHR_SEQ,
        SEQ,
        SALE_MIN_CNT,
        COMM_AMT,
        SALE_MAX_CNT,
        USE_YN,
        REG_ID,
        REG_DT    
    )VALUES(
        v_Comm_Tp,
        v_Chan_Mcls_Cd,
        v_Chan_Lcls_Cd,
        (select max(chr_seq)+1 from rtsd0061),
        (select max(seq)+1 from rtsd0061),
        v_Sale_Min_Cnt,
        v_Comm_Amt,
        v_Sale_Max_Cnt,    
        v_Use_Yn,
        v_Reg_Id,
        SYSDATE   
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0060; 


  /*****************************************************************************
  -- �湮 ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*�������� ������       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*�������� �Ϸ���       */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*����                  */ 
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText         OUT VARCHAR2 
    ) RETURN NUMBER IS
  
  BEGIN

    UPDATE RTSD0061
    SET    SALE_MIN_CNT = v_Sale_Min_Cnt,
           SALE_MAX_CNT = v_Sale_Max_Cnt,
           COMM_AMT     = v_Comm_Amt,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  COMM_TP      = v_Comm_Tp
    AND    CHR_SEQ      = v_Chr_Seq
    AND    CHAN_MCLS_CD = v_Chan_Mcls_Cd
    AND    CHAN_LCLS_CD = v_Chan_Lcls_Cd  
    AND    SEQ          = v_Seq;

   RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0060; 


  /*****************************************************************************
  -- �湮 ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*����                  */
    v_ErrorText         OUT VARCHAR2  
    ) RETURN NUMBER IS
   
  BEGIN

   DELETE FROM RTSD0061
   WHERE COMM_TP = v_Comm_Tp AND CHR_SEQ = v_Chr_Seq
        AND CHAN_MCLS_CD = v_Chan_Mcls_Cd AND CHAN_LCLS_CD = v_Chan_Lcls_Cd
        AND SEQ = v_Seq;

   RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0060;
  
  
  
    /*****************************************************************************
  -- �����ڵ� Detail ��ȸ- ��з��ڵ� ���� �Һз��ڵ�/�� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0060CodeName (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd        IN  RTCM0051.CD%TYPE,            /*�ڵ��                  */
    v_Cd2    IN  RTCM0051.CD%TYPE,        /*�ڵ�׷��ڵ�            */ 
    v_Cd3    IN  RTCM0051.CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd4    IN  RTCM0051.CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd5    IN  RTCM0051.CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */   
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE            /*��뿩��                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CD,           /*�ڵ�        */
            A.CD_NM,        /*�ڵ��      */
            A.CD_DESC       /*�ڵ弳��    */
    FROM    RTCM0051 A
    WHERE   A.CD_GRP_CD = v_Cd_Grp_Cd
    AND     A.USE_YN    = NVL(v_Use_Yn,'Y')
    AND     NVL(CD, ' ') LIKE '%'||v_Cd||'%'
    OR      NVL(CD, ' ') LIKE '%'||v_Cd2||'%'
    OR      NVL(CD, ' ') LIKE '%'||v_Cd3||'%'
    OR      NVL(CD, ' ') LIKE '%'||v_Cd4||'%'
    OR      NVL(CD, ' ') LIKE '%'||v_Cd5||'%' 
    
    ORDER   BY NVL(A.ORDER_PT,0), A.CD_NM;

  END p_sRtsd0060CodeName;  
  
  
/***************************************************************************** 
  -- ��Ż���� ��ȸ Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService3 ( 
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,               /* �������  */
    v_Chan_Lcis_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE         /* ä�δ�з�  */   
    ) IS 
  BEGIN 
    OPEN Ref_Cursor FOR 
    SELECT
    COMM_TP,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('R042', COMM_TP) as COMM_TP_NM,
    CHAN_LCLS_CD,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('S090', CHAN_LCLS_CD) as CHAN_LCLS_NM,
    CHAN_MCLS_CD,
    Pkg_Rtcm0051.f_sRtcm0051CodeName('S091', CHAN_MCLS_CD) as CHAN_MCLS_NM,
    CHR_SEQ,
    MIN_CNT,
    STR_DAY,
    MAX_CNT,
    END_DAY,
    COMM_AMT,
    USE_YN
    FROM RTSD0060
    
    WHERE   COMM_TP  = DECODE(v_COMM_TP, NULL, COMM_TP, v_COMM_TP)  /*����                  */
    AND     CHAN_LCLS_CD  = DECODE(v_Chan_Lcis_Cd, NULL, CHAN_LCLS_CD, v_Chan_Lcis_Cd)
    
    ORDER BY COMM_TP,CHAN_LCLS_CD,CHAN_MCLS_CD,MIN_CNT,MAX_CNT;
   
   END p_sRtsd0060visitorService3; 
   
   
   /***************************************************************************** 
  --�μ�Ƽ�� ����
  *****************************************************************************/  
  PROCEDURE p_IUDRtsd0060Insentive (
    v_Comm_Dvsn         IN CHAR,                         /*ó������(I,U,D)       */
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*ä���ߺз�              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*ä�δ�з�            */
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE,         /*������              */   
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*��Ϻ��ڵ�   .         */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*�������� ������       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*�������� �Ϸ���       */    
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*����� ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*����� ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*����� ID             */    
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    
  BEGIN   
  
  
  IF (TRIM(v_Comm_Tp) IS NULL) THEN
        v_Return_Message := '�������('||v_Comm_Tp||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Chan_Mcls_Cd) IS NULL) THEN
        v_Return_Message := 'ä�δ�з�('||v_Chan_Mcls_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Chan_Lcls_Cd) IS NULL) THEN
        v_Return_Message := 'ä���ߺз�('||v_Chan_Lcls_Cd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Min_Cnt) IS NULL) THEN
        v_Return_Message := '�ּҰǼ�('||v_Min_Cnt||') : �ּҰǼ��� �Է����ּ���';
        RAISE e_Error;
    END IF;
  
    IF (TRIM(v_Max_Cnt) IS NULL) THEN
        v_Return_Message := '�ִ�Ǽ�('||v_Max_Cnt||') : �ִ�Ǽ��� �Է����ּ���!';
        RAISE e_Error;
    END IF;  
  
  
  
  
  IF 0 = f_sRtsd0060CountInsentive(v_Comm_Tp, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,v_Chr_Seq) THEN

        IF 0 !=f_InsertRtsd0060Insentive(v_Comm_Tp, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd,
                                 v_Min_Cnt, v_Comm_Amt, v_Max_Cnt,
                                 v_Use_Yn, v_Reg_Id, v_Str_Day,v_End_Day,v_ErrorText)
                                 THEN
            v_Return_Message := '�μ�Ƽ�� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF
        ;
  ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtsd0060Insentive(v_Comm_Tp, v_Chan_Mcls_Cd, v_Chan_Lcls_Cd, v_Chr_Seq,
                                 v_Min_Cnt, v_Comm_Amt, v_Max_Cnt, 
                                 v_Use_Yn, v_Reg_Id, v_Str_Day,v_End_Day, v_ErrorText) THEN
                v_Return_Message := '�湮 ���� ���� ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
        END IF;
  END IF;
  
     v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
   
  EXCEPTION
    WHEN e_Error THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0105.p_InsertRtsd0105SaveOrder(1)', v_ErrorText, v_Return_Message);
  
    WHEN OTHERS THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200);
      Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0105.p_InsertRtsd0105SaveOrder(2)', v_ErrorText, v_Return_Message);
      
   
  END p_IUDRtsd0060Insentive;
  
  
  /*****************************************************************************
  -- �湮 ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*����,�ݾ�����         */   
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
     v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE         /*��ǰ�ڵ�              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0060
    WHERE   COMM_TP  = v_Comm_Tp 
    AND     CHAN_MCLS_CD = v_Chan_Mcls_Cd
    AND     CHAN_LCLS_CD    = v_Chan_Lcls_Cd
    AND     CHR_SEQ         = v_Chr_Seq;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0060CountInsentive;    


  /*****************************************************************************
  -- �湮 ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0060Insentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*����,�ݾ�����         */    
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*�������� ������       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*�������� �Ϸ���       */   
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*����� ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*����� ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*����� ID             */    
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER IS
   
  BEGIN

    INSERT INTO RTSD0060
    (
        COMM_TP,
        CHAN_MCLS_CD,
        CHAN_LCLS_CD,        
        CHR_SEQ,
        MIN_CNT,
        COMM_AMT,
        MAX_CNT,
        USE_YN,
        REG_ID,
        REG_DT,
        STR_DAY,
        END_DAY   
    )VALUES(
        v_Comm_Tp,
        v_Chan_Mcls_Cd,
        v_Chan_Lcls_Cd,
        (select max(chr_seq)+1 from rtsd0061),     
        v_Min_Cnt,
        v_Comm_Amt,
        v_Max_Cnt,    
        v_Use_Yn,
        v_Reg_Id,
        SYSDATE,
        v_Str_Day,
        v_End_Day
    );
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0060Insentive; 

  /*****************************************************************************
  -- �湮 ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0060Insentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��          */
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*�������� ������       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*�������� �Ϸ���       */ 
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*����� ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*����� ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*����� ID             */        
    v_ErrorText         OUT VARCHAR2 
    ) RETURN NUMBER IS
  
  BEGIN

    UPDATE RTSD0060
    SET    MIN_CNT = v_Min_Cnt,
           MAX_CNT = v_Max_Cnt,
           COMM_AMT     = v_Comm_Amt,
           USE_YN       = v_Use_Yn,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE,
           STR_DAY      = v_Str_Day,
           END_DAY      = v_End_Day
    WHERE  COMM_TP      = v_Comm_Tp
    AND    CHR_SEQ      = v_Chr_Seq
    AND    CHAN_MCLS_CD = v_Chan_Mcls_Cd
    AND    CHAN_LCLS_CD = v_Chan_Lcls_Cd;    

   RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
       v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0060Insentive;
  
  
  
  
  /***************************************************************************** 
  --�μ�Ƽ�� ����
  *****************************************************************************/  
  PROCEDURE p_IUDRtsd0060Insentive2 (  
    v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE,       /*����,�ݾ�����         */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE         /*����� ID             */      
    ) IS
   
  
  BEGIN
  IF 'D3' = f_sRtsd0060CountInsentive4(v_Slcm_Ym) THEN
  
   INSERT INTO RTSD0062 (AGENCY_CD ,SLCM_YM,COMM_TP,SALE_CNT,BONUS_AMT,CHAN_LCLS_CD,CHAN_MCLS_CD,REG_ID,REG_DT,CHG_ID,CHG_DT) 
   
   SELECT C.ORD_AGENT,
          v_Slcm_Ym,
          C.COMM_TP,
          C.SUMCNT_CD,
          C.CNT_CD * f_sRtsd0060CountInsentive3(v_Slcm_Ym),
          D.CHAN_LCLS_CD,
          D.CHAN_MCLS_CD,
          v_Reg_Id,
          SYSDATE,
          v_Reg_Id,
          SYSDATE
   FROM          
        (SELECT A.CNT_CD,B.ORD_AGENT,B.COMM_TP,B.SUMCNT_CD FROM (SELECT ORD_AGENT,COMM_TP,SUM(CNT_CD) SUMCNT_CD FROM RTRE5040 WHERE SLCM_YM=v_Slcm_Ym GROUP BY ORD_AGENT,COMM_TP) B,RTRE5040 A WHERE A.ORD_AGENT=B.ORD_AGENT)C,
         RTSD0113 D
   WHERE C.ORD_AGENT=D.ORD_AGENT
   ORDER BY C.ORD_AGENT;
  
  END IF;
  
  IF 'D2' = f_sRtsd0060CountInsentive4(v_Slcm_Ym) THEN  
    
  INSERT INTO RTSD0062 (AGENCY_CD ,SLCM_YM,COMM_TP,SALE_CNT,BONUS_AMT,CHAN_LCLS_CD,CHAN_MCLS_CD,REG_ID,REG_DT,CHG_ID,CHG_DT) 
   
   SELECT A.ORD_AGENT,
          v_Slcm_Ym,
          A.COMM_TP,
          A.CNT_CD,
          f_sRtsd0060CountInsentive3(v_Slcm_Ym)*A.CNT_CD,
          B.CHAN_LCLS_CD,
          B.CHAN_MCLS_CD,
          v_Reg_Id,
          SYSDATE,
          v_Reg_Id,
          SYSDATE
   FROM          
        (SELECT ORD_AGENT,COMM_TP,CNT_CD FROM RTRE5040 WHERE SLCM_YM=v_Slcm_Ym   GROUP BY ORD_AGENT,COMM_TP)A,
         RTSD0113 B
   WHERE A.ORD_AGENT=B.ORD_AGENT
   ORDER BY A.ORD_AGENT; 
    
  
  
        ELSE IF 'C3' = f_sRtsd0060CountInsentive4(v_Slcm_Ym) THEN  
    
        INSERT INTO RTSD0062 (AGENCY_CD ,SLCM_YM,COMM_TP,SALE_CNT,BONUS_AMT,CHAN_LCLS_CD,CHAN_MCLS_CD,REG_ID,REG_DT,CHG_ID,CHG_DT) 
   
        SELECT A.ORD_AGENT,
          v_Slcm_Ym,
          A.COMM_TP,
          A.CNT_CD,
          0,
          B.CHAN_LCLS_CD,
          B.CHAN_MCLS_CD,
          v_Reg_Id,
          SYSDATE,
          v_Reg_Id,
          SYSDATE
        FROM          
        (SELECT ORD_AGENT,COMM_TP,CNT_CD FROM RTRE5040 WHERE SLCM_YM=v_Slcm_Ym   GROUP BY ORD_AGENT,COMM_TP)A,
             RTSD0113 B
         WHERE A.ORD_AGENT=B.ORD_AGENT
        ORDER BY A.ORD_AGENT;         
      
   
   ELSE
   INSERT INTO RTSD0062 (AGENCY_CD ,SLCM_YM,COMM_TP,SALE_CNT,BONUS_AMT,CHAN_LCLS_CD,CHAN_MCLS_CD,REG_ID,REG_DT,CHG_ID,CHG_DT) 
   
   SELECT A.ORD_AGENT,
          v_Slcm_Ym,
          A.COMM_TP,
          A.SUMCNT_CD,
          f_sRtsd0060CountInsentive3(v_Slcm_Ym),
          B.CHAN_LCLS_CD,
          B.CHAN_MCLS_CD,
          v_Reg_Id,
          SYSDATE,
          v_Reg_Id,
          SYSDATE
   FROM          
        (SELECT ORD_AGENT,COMM_TP,SUM(CNT_CD) SUMCNT_CD   FROM RTRE5040 WHERE SLCM_YM=v_Slcm_Ym   GROUP BY ORD_AGENT,COMM_TP)A,
         RTSD0113 B
   WHERE A.ORD_AGENT=B.ORD_AGENT
   ORDER BY A.ORD_AGENT;
        END IF;
    END IF;

   
  END p_IUDRtsd0060Insentive2;
  
  /*****************************************************************************
  -- �湮 ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive3(
   v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE       /*����,�ݾ�����         */    
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT NVL(COMM_AMT, 0)
        INTO    v_curr_cunt
      FROM RTSD0060
     WHERE USE_YN='Y'
   AND STR_DAY>=v_Slcm_Ym+00
   AND END_DAY<=v_Slcm_Ym+99
   AND MIN_CNT<=(SELECT SUM(CNT_CD)
          FROM RTRE5040
         WHERE SLCM_YM=v_Slcm_Ym)
   AND MAX_CNT>=(SELECT SUM(CNT_CD)
          FROM RTRE5040
         WHERE SLCM_YM=v_Slcm_Ym);
         
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0060CountInsentive3;
  
  
    /*****************************************************************************
  -- �湮 ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive4(
   v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE       /*����,�ݾ�����         */    
    ) RETURN VARCHAR2 IS
    v_curr_cunt   VARCHAR(2);
  
  BEGIN
  

    SELECT COMM_TP
        INTO    v_curr_cunt
      FROM RTRE5040
      WHERE SLCM_YM=v_Slcm_Ym
        GROUP BY COMM_TP;
         
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;  


  END f_sRtsd0060CountInsentive4;  
  
   
END PKG_RTSD0060;
/
