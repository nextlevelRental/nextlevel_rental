CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0123 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0121
    PURPOSE     가계약정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-07-19  kstka            1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 가계약정보 Select
  
     REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2019-07-19  kstka            1. Created this package body.
    1.0.1   2019-07-22  kstka            [20190722] 페이징처리
  *****************************************************************************/
  PROCEDURE p_sRTSD0123 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Ord_Day_F       IN RTSD0123.ORD_DAY%TYPE        /* 주문일자           */
    , v_Ord_Day_T       IN RTSD0123.ORD_DAY%TYPE        /* 주문일자           */
    , v_Proc_Day_F      IN RTSD0123.PROC_DAY%TYPE       /* 장착일자           */
    , v_Proc_Day_T      IN RTSD0123.PROC_DAY%TYPE       /* 장착일자           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY%TYPE         /* 계약종료일자       */    
    , v_Os_Day_T        IN RTSD0123.OS_DAY%TYPE         /* 계약종료일자       */    
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 채널코드           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Call_Day_F      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자          */
    , v_Call_Day_T      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자          */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사 ID         */
    , v_Provsn_No_F     IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Provsn_No_T     IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Rows_Start      IN NUMBER
    , v_Rows_End        IN NUMBER
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;

  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT
        PROVSN_NO
        ,CUST_NO
        ,CUST_NM
        ,MOB_NO
        ,POS_CD
        ,ADDR1
        ,ADDR2
        ,CAR_NO
        ,PATTERN_NM
        ,CNT_CD
        ,PERIOD
        ,REGI_AMT
        ,RENT_AMT
        ,EMAIL_ADDR
        ,ORD_NO
        ,REAL_ORDNO
        ,CHAN_CD
        ,PLAN_DAY
        ,ORD_DAY
        ,PROC_DAY
        ,OS_DAY
        ,OS_DAY_F
        ,OS_DAY_T
        ,PS_CD
        ,CUST_REQ
        ,CONTACT_GET
        ,PROVSN_ST
        ,PROVSN_ST_DTL
        ,CALL_SEQ
        ,RECALL_DAY
        ,RECALL_TM 
        ,MFP_YN
        ,B00007
        ,CALL_DAY 
        ,CALL_ID
        , NAG_YN --필수동의항목
        , CAG_YN --선택동의항목
        , CAG_YN1--선택동의 1.SMS
        , CAG_YN2--선택동의 2.전화
        , CAG_YN3--선택동의 3.이메일
        , CAG_YN4--선택동의 4.주소(우편)
        , CTH_YN1
        , CTH_YN2
        , CTH_YN3
        FROM ( 
    SELECT /*+ INDEX_DESC (RTSD0123 RTSD0123_IDX01) */                         --  [20190722]
         ROWNUM NUM
        ,T.PROVSN_NO
        ,T.CUST_NO
        ,CUST_NM
        ,MOB_NO
        ,POS_CD
        ,ADDR1
        ,ADDR2
        ,CAR_NO
        ,PATTERN_NM
        ,CNT_CD
        ,PERIOD
        ,REGI_AMT
        ,RENT_AMT
        ,EMAIL_ADDR
        ,ORD_NO
        ,REAL_ORDNO
        ,CHAN_CD
        ,PLAN_DAY
        ,ORD_DAY
        ,PROC_DAY
        ,OS_DAY
        ,OS_DAY_F
        ,OS_DAY_T
        ,PS_CD
        ,CUST_REQ
        ,CONTACT_GET
        ,PROVSN_ST
        ,PROVSN_ST_DTL
        ,CALL_SEQ
        ,RECALL_DAY
        ,RECALL_TM
        ,(SELECT NVL(MFP_YN, 'N') FROM RTSD0108 WHERE ORD_NO = T.ORD_NO AND MFP_YN = 'Y' AND END_TP = 'E') MFP_YN
        ,(SELECT SERV_CNTR FROM RTSD0013 WHERE ORD_NO = T.ORD_NO AND PRS_DCD = 'B00007') B00007 
        ,(SELECT CALL_DAY FROM  (SELECT FIRST_VALUE(CALL_DAY) OVER(PARTITION BY PROVSN_NO ORDER BY CALL_SEQ DESC) CALL_DAY
                , PROVSN_NO FROM RTSD0122) WHERE PROVSN_NO = T.PROVSN_NO AND ROWNUM = 1) CALL_DAY
        ,(SELECT CALL_ID FROM  (SELECT FIRST_VALUE(CHG_ID) OVER(PARTITION BY PROVSN_NO ORDER BY CALL_SEQ DESC) CALL_ID
                , PROVSN_NO FROM RTSD0122) WHERE PROVSN_NO = T.PROVSN_NO AND ROWNUM = 1) CALL_ID 
        , Y.NAG_YN
        , Y.CAG_YN
        , Y.CAG_YN1
        , Y.CAG_YN2
        , Y.CAG_YN3
        , Y.CAG_YN4
        , Y.CTH_YN1
        , Y.CTH_YN2
        , Y.CTH_YN3
    FROM RTSD0123 T
    ,(SELECT ROW_NUMBER() OVER(PARTITION BY CUST_NO ORDER BY CUST_NO, SEQ DESC) NUM
               , NAG_YN
               , CAG_YN
               , CAG_YN1
               , CAG_YN2
               , CAG_YN3
               , CAG_YN4
               , CTH_YN1
               , CTH_YN2
               , CTH_YN3
               , CUST_NO 
            FROM RTSD0111) Y
    WHERE 1=1
        AND T.CUST_NO = Y.CUST_NO(+)
        AND Y.NUM(+) = 1
        AND ORD_NO = DECODE(v_Ord_No, NULL, ORD_NO, v_Ord_No)
        AND (v_Proc_Day_F IS NULL OR PROC_DAY BETWEEN v_Proc_Day_F AND v_Proc_Day_T)
        AND CUST_NM = DECODE(v_Cust_Nm, NULL, CUST_NM, v_Cust_Nm)
        AND CAR_NO = DECODE(v_Car_No, NULL, CAR_NO, v_Car_No)
        AND MOB_NO = DECODE(v_Mob_No, NULL, MOB_NO, v_Mob_No)
        AND PROVSN_ST = DECODE(v_Provsn_St, NULL, PROVSN_ST, v_Provsn_St)
        AND PROVSN_ST_DTL = DECODE(v_Provsn_St_Dtl, NULL, PROVSN_ST_DTL, v_Provsn_St_Dtl)
        AND RECALL_DAY = DECODE(v_Recall_Day, NULL, RECALL_DAY, v_Recall_Day)
        AND (v_Provsn_No_F IS NULL OR PROVSN_NO BETWEEN v_Provsn_No_F AND v_Provsn_No_T)
    ) WHERE 1=1
        AND NVL(CALL_ID, '666666') = DECODE(NULL, NULL, NVL(CALL_ID, '666666'), NULL)
        AND (v_Call_Day_F IS NULL OR CALL_DAY BETWEEN v_Call_Day_F AND v_Call_Day_T)
        AND NUM BETWEEN v_Rows_Start AND v_Rows_End;

    v_Success_code   := 0;
    v_Return_Message := '정상조회되었습니다.';
    
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121(2)', v_ErrorText, v_Return_Message);        

  END p_sRTSD0123;
  
  PROCEDURE p_sRTSD0123ForExcel (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Ord_Day_F       IN RTSD0123.ORD_DAY%TYPE        /* 주문일자           */
    , v_Ord_Day_T       IN RTSD0123.ORD_DAY%TYPE        /* 주문일자           */
    , v_Proc_Day_F      IN RTSD0123.PROC_DAY%TYPE       /* 장착일자           */
    , v_Proc_Day_T      IN RTSD0123.PROC_DAY%TYPE       /* 장착일자           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY%TYPE         /* 계약종료일자       */    
    , v_Os_Day_T        IN RTSD0123.OS_DAY%TYPE         /* 계약종료일자       */    
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 채널코드           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 재컨택일자         */
    , v_Call_Day_F      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자          */
    , v_Call_Day_T      IN RTSD0122.CALL_DAY%TYPE       /* 상담일자          */
    , v_Call_Id         IN RTSD0122.CHG_ID%TYPE         /* 상담사 ID         */
    , v_Provsn_No_F     IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Provsn_No_T     IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
  
    e_Error EXCEPTION;

  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT
        PROVSN_NO
        ,CUST_NO
        ,CUST_NM
        ,MOB_NO
        ,POS_CD
        ,ADDR1
        ,ADDR2
        ,CAR_NO
        ,PATTERN_NM
        ,CNT_CD
        ,PERIOD
        ,REGI_AMT
        ,RENT_AMT
        ,EMAIL_ADDR
        ,ORD_NO
        ,REAL_ORDNO
        ,CHAN_CD
        ,PLAN_DAY
        ,ORD_DAY
        ,PROC_DAY
        ,OS_DAY
        ,OS_DAY_F
        ,OS_DAY_T
        ,PS_CD
        ,CUST_REQ
        ,CONTACT_GET
        ,PROVSN_ST
        ,PROVSN_ST_DTL
        ,CALL_SEQ
        ,RECALL_DAY
        ,RECALL_TM 
        ,MFP_YN
        ,B00007
        ,CALL_DAY 
        ,CALL_DTL
        ,CALL_ID
        ,NAG_YN --필수동의항목
        ,CAG_YN --선택동의항목
        ,CAG_YN1--선택동의 1.SMS
        ,CAG_YN2--선택동의 2.전화
        ,CAG_YN3--선택동의 3.이메일
        ,CAG_YN4--선택동의 4.주소(우편)
        ,CTH_YN1
        ,CTH_YN2
        ,CTH_YN3
        FROM ( 
    SELECT /*+ INDEX_DESC (RTSD0123 RTSD0123_IDX01) */                         --  [20190722]
         ROWNUM NUM
        ,T.PROVSN_NO
        ,T.CUST_NO
        ,CUST_NM
        ,MOB_NO
        ,POS_CD
        ,ADDR1
        ,ADDR2
        ,CAR_NO
        ,PATTERN_NM
        ,CNT_CD
        ,PERIOD
        ,REGI_AMT
        ,RENT_AMT
        ,EMAIL_ADDR
        ,ORD_NO
        ,REAL_ORDNO
        ,CHAN_CD
        ,PLAN_DAY
        ,ORD_DAY
        ,PROC_DAY
        ,OS_DAY
        ,OS_DAY_F
        ,OS_DAY_T
        ,PS_CD
        ,CUST_REQ
        ,CONTACT_GET
        ,PROVSN_ST
        ,PROVSN_ST_DTL
        ,CALL_SEQ
        ,RECALL_DAY
        ,RECALL_TM
        ,(SELECT NVL(MFP_YN, 'N') FROM RTSD0108 WHERE ORD_NO = T.ORD_NO AND MFP_YN = 'Y' AND END_TP = 'E') MFP_YN
        ,(SELECT SERV_CNTR FROM RTSD0013 WHERE ORD_NO = T.ORD_NO AND PRS_DCD = 'B00007') B00007 
        ,X.CALL_DAY
        ,X.CALL_DTL
        ,X.CALL_ID 
        ,Y.NAG_YN
        ,Y.CAG_YN
        ,Y.CAG_YN1
        ,Y.CAG_YN2
        ,Y.CAG_YN3
        ,Y.CAG_YN4
        ,Y.CTH_YN1
        ,Y.CTH_YN2
        ,Y.CTH_YN3
    FROM RTSD0123 T
    ,  (SELECT   CALL_DAY
            ,    CALL_DTL
            ,    CHG_ID CALL_ID 
            ,    PROVSN_NO
                 FROM RTSD0122) X
    ,(SELECT ROW_NUMBER() OVER(PARTITION BY CUST_NO ORDER BY CUST_NO, SEQ DESC) NUM
               , NAG_YN
               , CAG_YN
               , CAG_YN1
               , CAG_YN2
               , CAG_YN3
               , CAG_YN4
               , CTH_YN1
               , CTH_YN2
               , CTH_YN3
               , CUST_NO 
            FROM RTSD0111) Y
    WHERE 1=1
        AND T.PROVSN_NO = X.PROVSN_NO(+)
        AND T.CUST_NO = Y.CUST_NO(+)
        AND Y.NUM(+) = 1
        AND (v_Proc_Day_F IS NULL OR PROC_DAY BETWEEN v_Proc_Day_F AND v_Proc_Day_T)
        AND CUST_NM = DECODE(v_Cust_Nm, NULL, CUST_NM, v_Cust_Nm)
        AND CAR_NO = DECODE(v_Car_No, NULL, CAR_NO, v_Car_No)
        AND MOB_NO = DECODE(v_Mob_No, NULL, MOB_NO, v_Mob_No)
        AND PROVSN_ST = DECODE(v_Provsn_St, NULL, PROVSN_ST, v_Provsn_St)
        AND PROVSN_ST_DTL = DECODE(v_Provsn_St_Dtl, NULL, PROVSN_ST_DTL, v_Provsn_St_Dtl)
        AND RECALL_DAY = DECODE(v_Recall_Day, NULL, RECALL_DAY, v_Recall_Day)
        AND (v_Provsn_No_F IS NULL OR T.PROVSN_NO BETWEEN v_Provsn_No_F AND v_Provsn_No_T)
    ) WHERE NVL(CALL_ID, '666666') = DECODE(NULL, NULL, NVL(CALL_ID, '666666'), NULL)
        AND (v_Call_Day_F IS NULL OR CALL_DAY BETWEEN v_Call_Day_F AND v_Call_Day_T);

    v_Success_code   := 0;
    v_Return_Message := '정상조회되었습니다.';
    
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121(1)', v_ErrorText, v_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0121.p_sRTSD0121(2)', v_ErrorText, v_Return_Message);        

  END p_sRTSD0123ForExcel;  
    
  /*****************************************************************************
  -- 가계약정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0123 (
      v_Cust_No         IN RTSD0123.CUST_NO%TYPE        /* 고객명             */
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Pos_Cd          IN RTSD0123.POS_CD%TYPE         /* 휴대폰번호         */
    , v_Addr1           IN RTSD0123.ADDR1%TYPE          /* 주소               */
    , v_Addr2           IN RTSD0123.ADDR2%TYPE          /* 주소               */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0123.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt_Cd          IN RTSD0123.CNT_CD%TYPE         /* 타이어개수         */
    , v_Period          IN RTSD0123.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0123.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0123.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Email_Addr      IN RTSD0123.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Real_OrdNo      IN RTSD0123.REAL_ORDNO%TYPE     /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 계약번호           */
    , v_Plan_Day        IN RTSD0123.PLAN_DAY%TYPE       /* 계약번호           */
    , v_Ord_Day         IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Proc_Day        IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Os_Day          IN RTSD0123.OS_DAY%TYPE         /* 계약번호           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY_F%TYPE       /* 계약번호           */
    , v_Os_Day_T        IN RTSD0123.OS_DAY_T%TYPE       /* 계약번호           */
    , v_Ps_Cd           IN RTSD0123.PS_CD%TYPE          /* 계약번호           */
    , v_Cust_Req        IN RTSD0123.CUST_REQ%TYPE       /* 계약번호           */
    , v_Contact_Get     IN RTSD0123.CONTACT_GET%TYPE    /* 계약번호           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Call_Seq        IN RTSD0123.CALL_SEQ%TYPE       /* 등록자ID           */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 홈쇼핑구분         */
    , v_Recall_Tm       IN RTSD0123.RECALL_TM%TYPE      /* 홈쇼핑주문번호     */    
    , v_Reg_Id          IN RTSD0123.REG_ID%TYPE         /* 반품/취소일        */
    , v_ErrorText       OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN
    
    INSERT  INTO RTSD0123 (
         PROVSN_NO
        ,CUST_NO
        ,CUST_NM
        ,MOB_NO
        ,POS_CD
        ,ADDR1
        ,ADDR2
        ,CAR_NO
        ,PATTERN_NM
        ,CNT_CD
        ,PERIOD
        ,REGI_AMT
        ,RENT_AMT
        ,EMAIL_ADDR
        ,ORD_NO
        ,REAL_ORDNO
        ,CHAN_CD
        ,PLAN_DAY
        ,ORD_DAY
        ,PROC_DAY
        ,OS_DAY
        ,OS_DAY_F
        ,OS_DAY_T
        ,PS_CD
        ,CUST_REQ
        ,CONTACT_GET
        ,PROVSN_ST
        ,PROVSN_ST_DTL
        ,CALL_SEQ
        ,RECALL_DAY
        ,RECALL_TM
        ,REG_ID
        ,REG_DT
        ,CHG_ID
        ,CHG_DT       
        ,CALL_ID
        ,DIST_DAY
    ) VALUES (
          (
            SELECT  'R' || TO_CHAR(SYSDATE, 'YYYYMMDD') || TO_CHAR(NVL2(MAX(PROVSN_NO), TO_NUMBER(MAX(SUBSTR(PROVSN_NO, 10)))+1, 1), 'FM000000') 
              FROM  RTSD0123
             WHERE  PROVSN_NO LIKE 'R' || TO_CHAR(SYSDATE, 'YYYYMMDD') || '%'          
          )
        , v_Cust_No         
        , v_Cust_Nm         
        , v_Mob_No
        , v_Pos_Cd          
        , v_Addr1
        , v_Addr2           
        , v_Car_No          
        , v_Pattern_Nm      
        , v_Cnt_Cd             
        , v_Period          
        , v_Regi_Amt        
        , v_Rent_Amt        
        , v_Email_Addr      
        , v_Ord_No          
        , v_Real_OrdNo      
        , v_Chan_Cd
        , v_Plan_Day         
        , v_Ord_Day         
        , v_Proc_Day        
        , v_Os_Day          
        , v_Os_Day_F        
        , v_Os_Day_T        
        , v_Ps_Cd
        , v_Cust_Req
        , v_Contact_Get           
        , v_Provsn_St       
        , v_Provsn_St_Dtl   
        , v_Call_Seq        
        , v_Recall_Day      
        , v_Recall_Tm        
        , v_Reg_Id
        , SYSDATE
        , v_Reg_Id
        , SYSDATE    
        , ''
        , ''      
    );

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRTSD0123;
  
  /*****************************************************************************
  -- 가계약정보 Update
  REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0    2019-07-19   kstka           
  *****************************************************************************/
  FUNCTION f_UpdateRTSD0123 (
      v_Provsn_No       IN RTSD0123.PROVSN_NO%TYPE      /* 가계약번호         */
    , v_Cust_No         IN RTSD0123.CUST_NO%TYPE        /* 고객명             */
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Pos_Cd          IN RTSD0123.POS_CD%TYPE         /* 주소               */
    , v_Addr1           IN RTSD0123.ADDR1%TYPE          /* 주소               */
    , v_Addr2           IN RTSD0123.ADDR2%TYPE          /* 주소               */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0123.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt_Cd          IN RTSD0123.CNT_CD%TYPE         /* 타이어개수         */
    , v_Period          IN RTSD0123.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0123.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0123.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Email_Addr      IN RTSD0123.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Real_OrdNo      IN RTSD0123.REAL_ORDNO%TYPE     /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 계약번호           */
    , v_Plan_Day        IN RTSD0123.PLAN_DAY%TYPE       /* 계약번호           */
    , v_Ord_Day         IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Proc_Day        IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Os_Day          IN RTSD0123.OS_DAY%TYPE         /* 계약번호           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY_F%TYPE       /* 계약번호           */
    , v_Os_Day_T        IN RTSD0123.OS_DAY_T%TYPE       /* 계약번호           */
    , v_Ps_Cd           IN RTSD0123.PS_CD%TYPE          /* 계약번호           */
    , v_Cust_Req        IN RTSD0123.CUST_REQ%TYPE       /* 계약번호           */
    , v_Contact_Get     IN RTSD0123.CONTACT_GET%TYPE    /* 계약번호           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Call_Seq        IN RTSD0123.CALL_SEQ%TYPE       /* 등록자ID           */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 홈쇼핑구분         */
    , v_Recall_Tm       IN RTSD0123.RECALL_TM%TYPE      /* 홈쇼핑주문번호     */    
    , v_Reg_Id          IN RTSD0123.REG_ID%TYPE         /* 반품/취소일        */
    , v_ErrorText       OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTSD0123
       SET   PLAN_DAY      = v_Plan_Day
            ,POS_CD        = v_Pos_Cd
            ,ADDR1         = v_Addr1
            ,ADDR2         = v_Addr2
            ,REAL_ORDNO    = v_Real_OrdNo
            ,CUST_REQ      = v_Cust_Req
            ,CONTACT_GET   = v_Contact_Get
            ,PROVSN_ST     = v_Provsn_St
            ,PROVSN_ST_DTL = v_Provsn_St_Dtl
            ,CALL_SEQ      = v_Call_Seq
            ,RECALL_DAY    = v_Recall_Day
            ,RECALL_TM     = v_Recall_Tm
            ,CHG_ID        = v_Reg_Id
            ,CHG_DT        = SYSDATE
     WHERE  PROVSN_NO     = v_Provsn_No;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRTSD0123;
  
  /*****************************************************************************
  -- 가계약정보 관리(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------    
    1.0     2017-07-19  kstka                                                                              
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0123 (
      v_Comm_Dvsn       IN CHAR                         /*처리구분(I,U,D)     */
    , v_Provsn_No       IN RTSD0123.PROVSN_NO%TYPE      /*가계약번호          */
    , v_Cust_No         IN RTSD0123.CUST_NO%TYPE        /* 고객명             */
    , v_Cust_Nm         IN RTSD0123.CUST_NM%TYPE        /* 고객명             */
    , v_Mob_No          IN RTSD0123.MOB_NO%TYPE         /* 휴대폰번호         */
    , v_Pos_Cd          IN RTSD0123.POS_CD%TYPE         /* 주소               */
    , v_Addr1           IN RTSD0123.ADDR1%TYPE          /* 주소               */
    , v_Addr2           IN RTSD0123.ADDR2%TYPE          /* 주소               */
    , v_Car_No          IN RTSD0123.CAR_NO%TYPE         /* 차량번호           */
    , v_Pattern_Nm      IN RTSD0123.PATTERN_NM%TYPE     /* 패턴명             */
    , v_Cnt_Cd          IN RTSD0123.CNT_CD%TYPE         /* 타이어개수         */
    , v_Period          IN RTSD0123.PERIOD%TYPE         /* 계약기간           */
    , v_Regi_Amt        IN RTSD0123.REGI_AMT%TYPE       /* 렌탈등록비         */
    , v_Rent_Amt        IN RTSD0123.RENT_AMT%TYPE       /* 월렌탈료           */
    , v_Email_Addr      IN RTSD0123.EMAIL_ADDR%TYPE     /* 이메일주소         */
    , v_Ord_No          IN RTSD0123.ORD_NO%TYPE         /* 계약번호           */
    , v_Real_OrdNo      IN RTSD0123.REAL_ORDNO%TYPE     /* 계약번호           */
    , v_Chan_Cd         IN RTSD0123.CHAN_CD%TYPE        /* 계약번호           */
    , v_Plan_Day        IN RTSD0123.PLAN_DAY%TYPE       /* 계약번호           */
    , v_Ord_Day         IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Proc_Day        IN RTSD0123.ORD_DAY%TYPE        /* 계약번호           */
    , v_Os_Day          IN RTSD0123.OS_DAY%TYPE         /* 계약번호           */
    , v_Os_Day_F        IN RTSD0123.OS_DAY_F%TYPE       /* 계약번호           */
    , v_Os_Day_T        IN RTSD0123.OS_DAY_T%TYPE       /* 계약번호           */
    , v_Ps_Cd           IN RTSD0123.PS_CD%TYPE          /* 계약번호           */
    , v_Cust_Req        IN RTSD0123.CUST_REQ%TYPE       /* 계약번호           */
    , v_Contact_Get     IN RTSD0123.CONTACT_GET%TYPE    /* 계약번호           */
    , v_Provsn_St       IN RTSD0123.PROVSN_ST%TYPE      /* 가계약상태         */
    , v_Provsn_St_Dtl   IN RTSD0123.PROVSN_ST_DTL%TYPE  /* 가계약세부상태     */
    , v_Call_Seq        IN RTSD0123.CALL_SEQ%TYPE       /* 등록자ID           */
    , v_Recall_Day      IN RTSD0123.RECALL_DAY%TYPE     /* 홈쇼핑구분         */
    , v_Recall_Tm       IN RTSD0123.RECALL_TM%TYPE      /* 홈쇼핑주문번호     */    
    , v_Reg_Id          IN RTSD0123.REG_ID%TYPE         /* 반품/취소일        */
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    
  BEGIN

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0123.p_IUDRtsd0123(1)', v_Real_OrdNo, v_Real_OrdNo);

    IF v_Comm_Dvsn = 'I' THEN
      
        
        IF 0 != f_InsertRTSD0123 (
              v_Cust_No         
            , v_Cust_Nm         
            , v_Mob_No 
            , v_Pos_Cd         
            , v_Addr1
            , v_Addr2            
            , v_Car_No          
            , v_Pattern_Nm      
            , v_Cnt_Cd             
            , v_Period          
            , v_Regi_Amt        
            , v_Rent_Amt        
            , v_Email_Addr      
            , v_Ord_No          
            , v_Real_OrdNo      
            , v_Chan_Cd
            , v_Plan_Day         
            , v_Ord_Day         
            , v_Proc_Day        
            , v_Os_Day          
            , v_Os_Day_F        
            , v_Os_Day_T        
            , v_Ps_Cd
            , v_Cust_Req
            , v_Contact_Get           
            , v_Provsn_St       
            , v_Provsn_St_Dtl   
            , v_Call_Seq        
            , v_Recall_Day      
            , v_Recall_Tm        
            , v_Reg_Id
            , v_ErrorText            
        ) THEN
            v_Return_Message := '재렌탈 가계약정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSIF v_Comm_Dvsn = 'U' THEN
        
        IF 0 != f_UpdateRTSD0123 (
              v_Provsn_No
            , v_Cust_No         
            , v_Cust_Nm         
            , v_Mob_No 
            , v_Pos_Cd         
            , v_Addr1
            , v_Addr2            
            , v_Car_No          
            , v_Pattern_Nm      
            , v_Cnt_Cd             
            , v_Period          
            , v_Regi_Amt        
            , v_Rent_Amt        
            , v_Email_Addr      
            , v_Ord_No          
            , v_Real_OrdNo      
            , v_Chan_Cd
            , v_Plan_Day         
            , v_Ord_Day         
            , v_Proc_Day        
            , v_Os_Day          
            , v_Os_Day_F        
            , v_Os_Day_T        
            , v_Ps_Cd
            , v_Cust_Req
            , v_Contact_Get           
            , v_Provsn_St       
            , v_Provsn_St_Dtl   
            , v_Call_Seq        
            , v_Recall_Day      
            , v_Recall_Tm        
            , v_Reg_Id
            , v_ErrorText
        ) THEN
            v_Return_Message := '재렌탈 가계약정보 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;    

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0123.p_IUDRtsd0121(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0123.p_IUDRtsd0121(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0123;

  /*****************************************************************************
  -- 가계약정보 Insert(실시간)
  *****************************************************************************/
  PROCEDURE p_CreateRTSD0123 (
      v_Ord_No          IN RTSD0108.ORD_NO%TYPE
    , v_Success_Code    OUT NUMBER
    , v_Return_Message  OUT VARCHAR2
    , v_ErrorText       OUT VARCHAR2
  ) IS
  
  e_Error EXCEPTION;
  
  v_Cnt NUMBER;
  
  BEGIN
        
        SELECT COUNT(*) INTO v_Cnt FROM RTSD0123 WHERE ORD_NO = v_Ord_No;
        
        IF v_Cnt > 0 THEN
            v_Return_Message := '이미 등록된 가계약 정보 입니다.';
            RAISE e_Error;
        END IF;
  
        INSERT INTO RTSD0123
        SELECT 
            (
            SELECT  'R' || TO_CHAR(SYSDATE, 'YYYYMMDD') || TO_CHAR(NVL2(MAX(PROVSN_NO), TO_NUMBER(MAX(SUBSTR(PROVSN_NO, 10)))+1, 1), 'FM000000') 
              FROM  RTSD0123
             WHERE  PROVSN_NO LIKE 'R' || TO_CHAR(SYSDATE, 'YYYYMMDD') || '%'          
            )
            , B.CUST_NO
            , C.CUST_NM
            , C.MOB_NO
            , C.POS_CD
            , C.ADDR1
            , C.ADDR2
            , B.CAR_NO
            , (SELECT MAT_NM FROM RTSD0005 WHERE MAT_CD = D.MAT_CD) MAT_NM
            , B.CNT_CD
            , B.PERIOD_CD
            , ''
            , ''
            , ''
            , B.ORD_NO
            , ''
            , ''
            , B.CHAN_CD
            , ''
            , B.ORD_DAY
            , B.PROC_DAY
            , TO_CHAR(ADD_MONTHS(TO_DATE(PROC_DAY, 'YYYYMMDD'), B.PERIOD_CD) - 1, 'YYYYMMDD') OS_DAY
            , TO_CHAR(ADD_MONTHS(ADD_MONTHS(TO_DATE(PROC_DAY, 'YYYYMMDD'), B.PERIOD_CD) - 1, -3)
            , 'YYYYMMDD') OS_DAY_F
            , TO_CHAR(ADD_MONTHS(ADD_MONTHS(TO_DATE(PROC_DAY, 'YYYYMMDD'), B.PERIOD_CD) - 1, 60), 'YYYYMMDD') OS_DAY_T
            , B.PS_CD
            , ''
            , ''
            , '20'
            , '2010'
            , 0
            , '00000000'
            , '0000'
            , 'kstka'
            , SYSDATE
            , 'kstka'
            , SYSDATE
            , ''
            , ''
        FROM RTSD0108 B, RTSD0100 C, RTSD0106 D  
        WHERE 1=1
        AND B.CUST_NO = C.CUST_NO
        AND B.ORD_NO = D.ORD_NO
        AND B.ORD_NO = v_Ord_No
        ;


        v_Success_code   := 0;
        v_Return_Message := '정상적으로 등록되었습니다';
        v_ErrorText      := '';
    
  EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0123.p_CreateRtsd0123(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0123.p_CreateRtsd0123(2)', v_ErrorText, v_Return_Message);
        
  END p_CreateRTSD0123;
      
  
END Pkg_Rtsd0123;