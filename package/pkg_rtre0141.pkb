CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE0141 AS
/*******************************************************************************
    NAME        PKG_RTRE0141
    PURPOSE     ������� ���γ��� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-10-02  wjim            [20170224_01] �ű� ����
*******************************************************************************/

  /*****************************************************************************
  -- ������� ���γ��� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0141 (
      Ref_Cursor      IN OUT SYS_REFCURSOR
    , v_Rva_Day       IN RTRE0141.RVA_DAY%TYPE     /*��û����                 */
    , v_Rva_Seq       IN RTRE0141.RVA_SEQ%TYPE     /*��û�Ϸù�ȣ             */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.RVA_DAY
         ,  A1.RVA_SEQ
         ,  A1.CUST_NO
         ,  A1.TORD_NO
         ,  A1.ORD_NO
         ,  A1.SCHD_SEQ
         ,  A1.RECP_TP
         ,  B1.CD_NM    AS RECP_TP_NM
         ,  A1.DEMD_DT
         ,  A1.ZFBDT
         ,  A1.SALE_AMT
         ,  A1.ARRE_AMT
         ,  A1.REG_ID
         ,  A1.REG_DT
         ,  A1.CHG_ID
         ,  A1.CHG_DT
      FROM  RTRE0141 A1
         ,  RTCM0051 B1
     WHERE  1=1
       AND  A1.RVA_DAY      = DECODE(v_Rva_Day, NULL, A1.RVA_DAY, v_Rva_Day)
       AND  A1.RVA_SEQ      = DECODE(v_Rva_Seq, NULL, A1.RVA_SEQ, v_Rva_Seq)
       AND  A1.RECP_TP      = B1.CD(+)
       AND  B1.CD_GRP_CD(+) = 'R007'
     ORDER  BY A1.RVA_DAY
         ,  A1.RVA_SEQ
         ,  A1.SCHD_SEQ
    ;

  END p_sRtre0141;
    
  /*****************************************************************************
  -- ������� ���γ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0141 (
      v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* ��û����         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* ��û�Ϸù�ȣ     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* ����ȣ         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* ����û������ȣ */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* ����ȣ         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* û������         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* û������         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* û������         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* �����������   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* ����ݾ�         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* ��ü�ݾ�         */        
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* �����ID         */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    INSERT  INTO RTRE0141 (
          RVA_DAY
        , RVA_SEQ
        , CUST_NO
        , TORD_NO
        , ORD_NO
        , SCHD_SEQ
        , RECP_TP
        , DEMD_DT
        , ZFBDT
        , SALE_AMT
        , ARRE_AMT
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    ) VALUES (
          v_Rva_Day      /* ��û����         */
        , v_Rva_Seq      /* ��û�Ϸù�ȣ     */
        , v_Cust_No      /* ����ȣ         */
        , v_Tord_No      /* ����û������ȣ */
        , v_Ord_No       /* ����ȣ         */
        , v_Schd_Seq     /* û������         */
        , v_Recp_Tp      /* û������         */
        , v_Demd_Dt      /* û������         */ 
        , v_Zfbdt        /* �����������   */
        , v_Sale_Amt     /* ����ݾ�         */
        , v_Arre_Amt     /* ��ü�ݾ�         */        
        , v_Reg_Id       /* �����ID         */   
        , SYSDATE
        , v_Reg_Id
        , SYSDATE
    );

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0141;
  
  /*****************************************************************************
  -- ������� ���γ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0141 (
      v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* ��û����         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* ��û�Ϸù�ȣ     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* ����ȣ         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* ����û������ȣ */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* ����ȣ         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* û������         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* û������         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* û������         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* �����������   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* ����ݾ�         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* ��ü�ݾ�         */
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* �����ID         */    
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTRE0141
       SET  RECP_TP  = v_Recp_Tp      /* û������         */
         ,  DEMD_DT  = v_Demd_Dt      /* û������         */ 
         ,  ZFBDT    = v_Zfbdt        /* �����������   */
         ,  SALE_AMT = v_Sale_Amt     /* ����ݾ�         */
         ,  ARRE_AMT = v_Arre_Amt     /* ��ü�ݾ�         */
         ,  CHG_ID   = v_Reg_Id
         ,  CHG_DT   = SYSDATE
     WHERE  RVA_DAY  = v_Rva_Day
       AND  RVA_SEQ  = v_Rva_Seq
       AND  CUST_NO  = v_Cust_No
       AND  TORD_NO  = v_Tord_No
       AND  ORD_NO   = v_Ord_No
       AND  SCHD_SEQ = v_Schd_Seq
    ;     

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0141;
  
  /*****************************************************************************
  -- ������� ���γ��� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0141 (
      v_Comm_Dvsn       IN CHAR                     /* ó������(I,U,D) */
    , v_Rva_Day         IN RTRE0141.RVA_DAY%TYPE    /* ��û����         */
    , v_Rva_Seq         IN RTRE0141.RVA_SEQ%TYPE    /* ��û�Ϸù�ȣ     */
    , v_Cust_No         IN RTRE0141.CUST_NO%TYPE    /* ����ȣ         */
    , v_Tord_No         IN RTRE0141.TORD_NO%TYPE    /* ����û������ȣ */
    , v_Ord_No          IN RTRE0141.ORD_NO%TYPE     /* ����ȣ         */
    , v_Schd_Seq        IN RTRE0141.SCHD_SEQ%TYPE   /* û������         */
    , v_Recp_Tp         IN RTRE0141.RECP_TP%TYPE    /* û������         */
    , v_Demd_Dt         IN RTRE0141.DEMD_DT%TYPE    /* û������         */ 
    , v_Zfbdt           IN RTRE0141.ZFBDT%TYPE      /* �����������   */
    , v_Sale_Amt        IN RTRE0141.SALE_AMT%TYPE   /* ����ݾ�         */
    , v_Arre_Amt        IN RTRE0141.ARRE_AMT%TYPE   /* ��ü�ݾ�         */        
    , v_Reg_Id          IN RTRE0141.REG_ID%TYPE     /* �����ID         */ 
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ��� Ȯ��
    IF TRIM(v_Rva_Day) IS NULL THEN
        v_Return_Message := '��û���� : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0141 (
              v_Rva_Day         /* ��û����         */
            , v_Rva_Seq         /* ��û�Ϸù�ȣ     */
            , v_Cust_No         /* ����ȣ         */
            , v_Tord_No         /* ����û������ȣ */
            , v_Ord_No          /* ����ȣ         */
            , v_Schd_Seq        /* û������         */
            , v_Recp_Tp         /* û������         */
            , v_Demd_Dt         /* û������         */ 
            , v_Zfbdt           /* �����������   */
            , v_Sale_Amt        /* ����ݾ�         */
            , v_Arre_Amt        /* ��ü�ݾ�         */        
            , v_Reg_Id          /* �����ID         */    
            , v_ErrorText      
        ) THEN
            v_Return_Message := '������� ���γ��� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtre0141 (
              v_Rva_Day         /* ��û����         */
            , v_Rva_Seq         /* ��û�Ϸù�ȣ     */
            , v_Cust_No         /* ����ȣ         */
            , v_Tord_No         /* ����û������ȣ */
            , v_Ord_No          /* ����ȣ         */
            , v_Schd_Seq        /* û������         */
            , v_Recp_Tp         /* û������         */
            , v_Demd_Dt         /* û������         */ 
            , v_Zfbdt           /* �����������   */
            , v_Sale_Amt        /* ����ݾ�         */
            , v_Arre_Amt        /* ��ü�ݾ�         */
            , v_Reg_Id          /* �����ID         */    
            , v_ErrorText
        ) THEN
            v_Return_Message := '������� ���γ��� ���� ����!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0141.p_IUDRtre0141(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE0141.p_IUDRtre0141(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0141;
        
END PKG_RTRE0141;
/
