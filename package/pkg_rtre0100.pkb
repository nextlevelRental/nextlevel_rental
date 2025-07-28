CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0100 AS
/*******************************************************************************
   NAME      Pkg_Rtre0100
   PURPOSE   연체대상 집계 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-24  jemcarry         1. Created this package body.
   1.1        2017-08-28  wjim             [20170828_01] 연체집계 사전 검증로직 추가
                                           - 출금결과 정상반영 여부 확인
   1.2        2017-10-12  wjim             [20171012_01] 연체집계 사전 검증로직 제외                                           
   1.3        2017-11-16  wjim             [20171116_01] 계약번호별 연체내역조회 '우편번호' 항목 추가
   1.4        2018-08-07  wjim             [20180807_01] 계약번호별 연체내역조회 항목 추가
   1.5        2019-02-14  wjim             [20190214_01] 계약번호별 연체내역조회 월렌탈료 기준 변경
   1.6        2019-04-21  kstka            [20190421_01] 연체해제기능 추가
*******************************************************************************/

  /*****************************************************************************
  -- 연체대상 집계 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0100Count(
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,         /*연체기준일자        */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,           /*계약번호            */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,          /*고객번호            */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE           /*청구구분            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0100
    WHERE   DELY_DAY = v_Dely_Day
    AND     ORD_NO   = v_Ord_No
    AND     CUST_NO  = v_Cust_No
    AND     RECP_TP  = v_Recp_Tp;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0100Count;

  /*****************************************************************************
  -- 연체대상 집계 내역 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0100 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Appr_Amt       IN RTRE0100.APPR_AMT%TYPE,       /*연체금액              */
    v_Appr_Scnt      IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차              */
    v_Pay_Mthd       IN RTRE0100.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0100.PAY_DD%TYPE,         /*결제일자              */
    v_Acc_Seq        IN RTRE0100.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTRE0100.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Stat       IN RTRE0100.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Batch_Key      IN RTRE0100.BATCH_KEY%TYPE,      /*배치키                */
    v_Mfp_Yn         IN RTRE0100.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0100.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0100.OS_YN%TYPE,          /*소유권이전여부        */
    v_Del_Yn         IN RTRE0100.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  NVL(A.USE_YN, 'N') USE_YN,
            A.DELY_DAY,                  /*연체기준일자        */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.RECP_TP,                   /*청구구분            */
            A.APPR_AMT,                  /*연체금액            */
            A.APPR_SCNT,                 /*연체회차            */
            A.PAY_MTHD,                  /*결제방법            */
            A.PAY_DD,                    /*결제일자            */
            A.ACC_SEQ,                   /*계좌순번            */
            A.CRD_SEQ,                   /*카드순번            */
            A.ACC_STAT,                  /*계좌신청상태        */
            A.BATCH_KEY,                 /*배치키              */
            A.MFP_YN,                    /*중도완납여부        */
            A.TCAN_YN,                   /*임시해약여부        */
            A.OS_YN,                     /*소유권이전여부      */
            A.DEL_YN,                    /*삭제여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE0100 A
    WHERE   A.DELY_DAY  = DECODE(v_Dely_Day , NULL, A.DELY_DAY  , v_Dely_Day)
    AND     A.ORD_NO    = DECODE(v_Ord_No   , NULL, A.ORD_NO    , v_Ord_No)
    AND     A.CUST_NO   = DECODE(v_Cust_No  , NULL, A.CUST_NO   , v_Cust_No)
    AND     A.RECP_TP   = DECODE(v_Recp_Tp  , NULL, A.RECP_TP   , v_Recp_Tp)
    AND     A.APPR_AMT  = DECODE(v_Appr_Amt , NULL, A.APPR_AMT  , v_Appr_Amt)
    AND     A.APPR_SCNT = DECODE(v_Appr_Scnt, NULL, A.APPR_SCNT , v_Appr_Scnt)
    AND     A.PAY_MTHD  = DECODE(v_Pay_Mthd , NULL, A.PAY_MTHD  , v_Pay_Mthd)
    AND     A.PAY_DD    = DECODE(v_Pay_Dd   , NULL, A.PAY_DD    , v_Pay_Dd)
    AND     A.ACC_SEQ   = DECODE(v_Acc_Seq  , NULL, A.ACC_SEQ   , v_Acc_Seq)
    AND     A.CRD_SEQ   = DECODE(v_Crd_Seq  , NULL, A.CRD_SEQ   , v_Crd_Seq)
    AND     A.ACC_STAT  = DECODE(v_Acc_Stat , NULL, A.ACC_STAT  , v_Acc_Stat)
    AND     A.BATCH_KEY = DECODE(v_Batch_Key, NULL, A.BATCH_KEY , v_Batch_Key)
    AND     A.MFP_YN    = DECODE(v_Mfp_Yn   , NULL, A.MFP_YN    , v_Mfp_Yn)
    AND     A.TCAN_YN   = DECODE(v_Tcan_Yn  , NULL, A.TCAN_YN   , v_Tcan_Yn)
    AND     A.OS_YN     = DECODE(v_Os_Yn    , NULL, A.OS_YN     , v_Os_Yn)
    AND     A.DEL_YN    = DECODE(v_Del_Yn   , NULL, A.DEL_YN    , v_Del_Yn)
    AND     A.REG_ID    = DECODE(v_Reg_Id   , NULL, A.REG_ID    , v_Reg_Id);

  END p_sRtre0100;

  /*****************************************************************************
  -- 연체내역조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0100ArrearsList  (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Appr_Scnt_F    IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차 시작         */
    v_Appr_Scnt_T    IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차 종료         */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE         /*청구구분              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
--    SELECT NVL(A.USE_YN, 'N') USE_YN,
--           A.DELY_DAY,                                                                              /*연체집계일자  */
--           A.ORD_NO,                                                                                /*계약번호      */
--           A.CUST_NO,                                                                               /*고객번호      */
--           Pkg_Rtsd0100.f_sRtsd0100CustName( A.CUST_NO ) AS CUST_NM,                                /*고객명        */
--           Pkg_Rtsd0106.f_sRtsd0106MatCd( A.ORD_NO ) AS MAT_NO,                                     /*상품코드      */
--           Pkg_Rtsd0005.f_sRtsd0005MatName( Pkg_Rtsd0106.f_sRtsd0106MatCd( A.ORD_NO ) ) AS MAT_NM,  /*상품명        */
--           B.PERIOD_CD,                                                                             /*계약기간      */
--           B.CAR_NO,                                                                                /*차량번호      */
--           B.PROC_DAY,                                                                              /*장착일자      */
--           A.PAY_MTHD,                                                                              /*결제방법      */
--           Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R004', A.PAY_MTHD ) AS PAY_MTHD_NM,                   /*결제방법명    */
--           A.PAY_DD,                                                                                /*결제일자      */
--           A.RECP_TP,                                                                               /*청구구분      */
--           Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R007', A.RECP_TP ) AS RECP_TP_NM,                     /*청구구분명    */
--           A.APPR_SCNT,                                                                             /*연체회차      */
--           A.APPR_AMT,                                                                              /*연체금액      */
--           Pkg_Rtsd0104.f_sRtsd0104AgentInfo( A.ORD_NO, '01' ) AS AGENCY,                           /*판매인코드    */
--           Pkg_Rtsd0104.f_sRtsd0104AgentInfo( A.ORD_NO, '02' ) AS AGENCY_NM,                        /*판매인명      */
--           Pkg_Rtsd0104.f_sRtsd0104AgentInfo( A.ORD_NO, '03' ) AS AGENCY_TEL                        /*판매인전화    */
--    FROM RTRE0100 A, RTSD0108 B
--    WHERE A.DELY_DAY  = DECODE (v_Dely_Day, NULL, A.DELY_DAY, v_Dely_Day)
--      AND A.APPR_SCNT BETWEEN v_Appr_Scnt_F AND v_Appr_Scnt_T
--      AND A.ORD_NO    = DECODE (v_Ord_No   , NULL, A.ORD_NO    , v_Ord_No)
--      AND A.CUST_NO   = DECODE (v_Cust_No, NULL, A.CUST_NO, v_Cust_No)
--      AND A.RECP_TP   = DECODE (v_Recp_Tp, NULL, A.RECP_TP, v_Recp_Tp)
--      AND A.ORD_NO    = B.ORD_NO;

--     [20190421_01] 연체해제기능 추가

--        SELECT DECODE(C.RES_YN, 'N', '1', '0') AS USE_YN,
--           A.DELY_DAY,                                                                              /*연체집계일자  */
--           A.ORD_NO,                                                                                /*계약번호      */
--           DECODE(A.CUST_NO, '9999999999', C.CUST_NO, A.CUST_NO) AS CUST_NO,                                                                                /*고객번호      */
--           Pkg_Rtsd0100.f_sRtsd0100CustName( A.CUST_NO ) AS CUST_NM,                                /*고객명        */
--           Pkg_Rtsd0106.f_sRtsd0106MatCd( A.ORD_NO ) AS MAT_NO,                                     /*상품코드      */
--           Pkg_Rtsd0005.f_sRtsd0005MatName( Pkg_Rtsd0106.f_sRtsd0106MatCd( A.ORD_NO ) ) AS MAT_NM,  /*상품명        */
--           B.PERIOD_CD,                                                                             /*계약기간      */
--           B.CAR_NO,                                                                                /*차량번호      */
--           B.PROC_DAY,                                                                              /*장착일자      */
--           A.PAY_MTHD,                                                                              /*결제방법      */
--           Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R004', A.PAY_MTHD ) AS PAY_MTHD_NM,                   /*결제방법명    */
--           A.PAY_DD,                                                                                /*결제일자      */
--           A.RECP_TP,                                                                               /*청구구분      */
--           Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R007', A.RECP_TP ) AS RECP_TP_NM,                     /*청구구분명    */
--           A.APPR_SCNT,                                                                             /*연체회차      */
--           A.APPR_AMT,                                                                              /*연체금액      */
--           Pkg_Rtsd0104.f_sRtsd0104AgentInfo( A.ORD_NO, '01' ) AS AGENCY,                           /*판매인코드    */
--           Pkg_Rtsd0104.f_sRtsd0104AgentInfo( A.ORD_NO, '02' ) AS AGENCY_NM,                        /*판매인명      */
--           Pkg_Rtsd0104.f_sRtsd0104AgentInfo( A.ORD_NO, '03' ) AS AGENCY_TEL                        /*판매인전화    */
--    FROM RTRE0100 A, RTSD0108 B,
--         (SELECT  ROW_NUMBER() OVER (PARTITION BY X.CUST_NO, X.ORD_NO, X.DELY_DAY, X.RES_YN ORDER BY X.SEQ DESC) AS ROW_NUM
--                     ,  X.*
--                  FROM  RTTM0002 X
--                  WHERE RES_YN = 'N') C
--    WHERE A.DELY_DAY  = DECODE (v_Dely_Day, NULL, A.DELY_DAY, v_Dely_Day)
--      AND A.APPR_SCNT BETWEEN CASE WHEN C.RES_YN = 'N' THEN 0 ELSE v_Appr_Scnt_F END AND v_Appr_Scnt_T
--      AND NVL(A.ORD_NO, C.ORD_NO)    = DECODE (v_Ord_No   , NULL, NVL(A.ORD_NO, C.ORD_NO)    , v_Ord_No)
--      AND A.CUST_NO   = DECODE (v_Cust_No, NULL, A.CUST_NO, v_Cust_No)
--      AND A.RECP_TP   = DECODE (v_Recp_Tp, NULL, A.RECP_TP, v_Recp_Tp)
--      AND A.ORD_NO    = B.ORD_NO
--      AND A.ORD_NO    = C.ORD_NO(+)
--      AND A.DELY_DAY  = C.DELY_DAY(+)
--      AND C.ROW_NUM(+) = 1;

--  연체집계 후 최초수납내역 추가     
      
    SELECT  DECODE(C.RES_YN, 'N', '1', '0')                       AS USE_YN
         ,  ROWNUM                                                AS ROW_NUM
         ,  A.DELY_DAY
         ,  A.ORD_NO
         ,  DECODE(A.CUST_NO, '9999999999', C.CUST_NO, A.CUST_NO) AS CUST_NO                    /*고객번호      */
         ,  Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO)           AS CUST_NM                    /*고객명        */
         ,  Pkg_Rtsd0106.f_sRtsd0106MatCd(A.ORD_NO)               AS MAT_NO                     /*상품코드      */
         ,  Pkg_Rtsd0005.f_sRtsd0005MatName(Pkg_Rtsd0106.f_sRtsd0106MatCd(A.ORD_NO)) AS MAT_NM  /*상품명        */
         ,  B.PERIOD_CD                                                                         /*계약기간      */
         ,  B.CAR_NO                                                                            /*차량번호      */
         ,  B.PROC_DAY                                                                          /*장착일자      */
         ,  A.PAY_MTHD                                                                          /*결제방법      */
         ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', A.PAY_MTHD)  AS PAY_MTHD_NM                /*결제방법명    */
         ,  A.PAY_DD                                                                            /*결제일자      */
         ,  A.RECP_TP                                                                           /*청구구분      */
         ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('R007', A.RECP_TP)   AS RECP_TP_NM                 /*청구구분명    */
         ,  A.APPR_SCNT                                                                         /*연체회차      */
         ,  A.APPR_AMT                                                                          /*연체금액      */
         ,  Pkg_Rtsd0104.f_sRtsd0104AgentInfo(A.ORD_NO, '01')     AS AGENCY                     /*판매인코드    */
         ,  Pkg_Rtsd0104.f_sRtsd0104AgentInfo(A.ORD_NO, '02')     AS AGENCY_NM                  /*판매인명      */
         ,  Pkg_Rtsd0104.f_sRtsd0104AgentInfo(A.ORD_NO, '03')     AS AGENCY_TEL                 /*판매인전화    */
         ,  D.RECV_DAY                                                                          /*수납기준일자  */
         ,  D.REG_DT                                              AS RECV_DT                    /*수납반영일시  */
         ,  D.RECP_PAY                                                                          /* 수납유형     */
         ,  Pkg_Rtcm0051.f_sRtcm0051CodeName('R019', D.RECP_PAY)  AS RECP_PAY_NM                /*수납유형명    */
         ,  D.CNT_RECP                                                                          /*수납회차      */
         ,  D.RECP_TOT_AMT                                                                      /*수납금액      */    
         ,  D.CNC_STAT                                            AS RECV_CNC_ST                /*수납취소여부  */
      FROM  RTRE0100 A
         ,  RTSD0108 B
         ,  (
                SELECT  ROW_NUMBER() OVER (PARTITION BY X.CUST_NO, X.ORD_NO, X.DELY_DAY, X.RES_YN ORDER BY X.SEQ DESC) AS ROW_NUM
                     ,  X.*
                  FROM  RTTM0002 X
                 WHERE  RES_YN = 'N'
            ) C
         ,  (
                SELECT  ROW_NUMBER() OVER (PARTITION BY X1.ORD_NO ORDER BY RECV_DAY, REG_DT)     AS ROW_NUM      --수납순서
                     ,  COUNT(1) OVER (PARTITION BY X1.ORD_NO ORDER BY RECV_DAY, REG_DT)         AS CNT_RECP     --수납회차
                     ,  SUM(X1.RECP_AMT) OVER (PARTITION BY X1.ORD_NO ORDER BY RECV_DAY, REG_DT) AS RECP_TOT_AMT --총수납금액                 
                     ,  X1.*                  
                  FROM  RTRE0030 X1
                 WHERE  X1.RECV_DAY >= v_Dely_Day   --[입력] 연체기준일자(YYYYMMDD)
                   AND  X1.CNC_STAT = 'N'           --수납취소건 제외
            ) D
     WHERE  A.DELY_DAY   = DECODE (v_Dely_Day, NULL, A.DELY_DAY, v_Dely_Day)
       AND  A.APPR_SCNT BETWEEN CASE WHEN C.RES_YN = 'N' THEN 0 ELSE v_Appr_Scnt_F END AND v_Appr_Scnt_T
       AND  NVL(A.ORD_NO, C.ORD_NO)    = DECODE (v_Ord_No   , NULL, NVL(A.ORD_NO, C.ORD_NO)    , v_Ord_No)
       AND  A.CUST_NO    = DECODE (v_Cust_No, NULL, A.CUST_NO, v_Cust_No)
       AND  A.RECP_TP    = DECODE (v_Recp_Tp, NULL, A.RECP_TP, v_Recp_Tp)
       AND  A.ORD_NO     = B.ORD_NO
       AND  A.ORD_NO     = C.ORD_NO(+)
       AND  A.DELY_DAY   = C.DELY_DAY(+)
       AND  C.ROW_NUM(+) = 1
       AND  A.ORD_NO     = D.ORD_NO(+)
       AND  A.REG_DT    <= D.REG_DT(+)
       AND  D.ROW_NUM(+) = 1           
       ;      

  END p_sRtre0100ArrearsList;

  /*****************************************************************************
  -- 연체대상 집계 내역 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0100 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Appr_Amt       IN RTRE0100.APPR_AMT%TYPE,       /*연체금액              */
    v_Appr_Scnt      IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차              */
    v_Pay_Mthd       IN RTRE0100.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0100.PAY_DD%TYPE,         /*결제일자              */
    v_Acc_Seq        IN RTRE0100.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTRE0100.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Stat       IN RTRE0100.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Batch_Key      IN RTRE0100.BATCH_KEY%TYPE,      /*배치키                */
    v_Mfp_Yn         IN RTRE0100.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0100.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0100.OS_YN%TYPE,          /*소유권이전여부        */
    v_Del_Yn         IN RTRE0100.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0100 (
            DELY_DAY,
            ORD_NO,
            CUST_NO,
            RECP_TP,
            APPR_AMT,
            APPR_SCNT,
            PAY_MTHD,
            PAY_DD,
            ACC_SEQ,
            CRD_SEQ,
            ACC_STAT,
            BATCH_KEY,
            MFP_YN,
            TCAN_YN,
            OS_YN,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Dely_Day,
            v_Ord_No,
            v_Cust_No,
            v_Recp_Tp,
            v_Appr_Amt,
            v_Appr_Scnt,
            v_Pay_Mthd,
            v_Pay_Dd,
            v_Acc_Seq,
            v_Crd_Seq,
            v_Acc_Stat,
            v_Batch_Key,
            v_Mfp_Yn,
            v_Tcan_Yn,
            v_Os_Yn,
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

  END f_InsertRtre0100;

  /*****************************************************************************
  -- 연체대상 집계 내역 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0100 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Appr_Amt       IN RTRE0100.APPR_AMT%TYPE,       /*연체금액              */
    v_Appr_Scnt      IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차              */
    v_Pay_Mthd       IN RTRE0100.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0100.PAY_DD%TYPE,         /*결제일자              */
    v_Acc_Seq        IN RTRE0100.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTRE0100.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Stat       IN RTRE0100.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Batch_Key      IN RTRE0100.BATCH_KEY%TYPE,      /*배치키                */
    v_Mfp_Yn         IN RTRE0100.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0100.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0100.OS_YN%TYPE,          /*소유권이전여부        */
    v_Del_Yn         IN RTRE0100.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    /*
    UPDATE RTRE0100
    SET    APPR_AMT  = v_Appr_Amt,
           APPR_SCNT = v_Appr_Scnt,
           PAY_MTHD  = v_Pay_Mthd,
           PAY_DD    = v_Pay_Dd,
           ACC_SEQ   = v_Acc_Seq,
           CRD_SEQ   = v_Crd_Seq,
           ACC_STAT  = v_Acc_Stat,
           BATCH_KEY = v_Batch_Key,
           MFP_YN    = v_Mfp_Yn,
           TCAN_YN   = v_Tcan_Yn,
           OS_YN     = v_Os_Yn,
           DEL_YN    = v_Del_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  DELY_DAY  = v_Dely_Day
    AND    ORD_NO    = v_Ord_No
    AND    CUST_NO   = v_Cust_No
    AND    RECP_TP   = v_Recp_Tp;*/

    UPDATE RTRE0100
    SET    APPR_AMT  = NVL(APPR_AMT,0) + NVL(v_Appr_Amt,0),
           APPR_SCNT = NVL(APPR_SCNT,0) + 1,
           DEL_YN    = v_Del_Yn,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  DELY_DAY  = v_Dely_Day
    AND    ORD_NO    = v_Ord_No
    AND    CUST_NO   = v_Cust_No
    AND    RECP_TP   = v_Recp_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0100;

  /*****************************************************************************
  -- 연체대상 집계 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0100 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0100
    SET    DEL_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  DELY_DAY = v_Dely_Day
    AND    ORD_NO   = v_Ord_No
    AND    CUST_NO  = v_Cust_No
    AND    RECP_TP  = v_Recp_Tp;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0100;

  /*****************************************************************************
  -- 연체대상 집계 내역 관리(IUD).
  *****************************************************************************/
  PROCEDURE p_IUDRtre0100 (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Appr_Amt       IN RTRE0100.APPR_AMT%TYPE,       /*연체금액              */
    v_Appr_Scnt      IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차              */
    v_Pay_Mthd       IN RTRE0100.PAY_MTHD%TYPE,       /*결제방법              */
    v_Pay_Dd         IN RTRE0100.PAY_DD%TYPE,         /*결제일자              */
    v_Acc_Seq        IN RTRE0100.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTRE0100.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Stat       IN RTRE0100.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Batch_Key      IN RTRE0100.BATCH_KEY%TYPE,      /*배치키                */
    v_Mfp_Yn         IN RTRE0100.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTRE0100.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTRE0100.OS_YN%TYPE,          /*소유권이전여부        */
    v_Del_Yn         IN RTRE0100.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtre0100Count(v_Dely_Day, v_Ord_No, v_Cust_No, v_Recp_Tp) THEN

        IF 0 != f_InsertRtre0100(v_Dely_Day, v_Ord_No, v_Cust_No, v_Recp_Tp,
                                 v_Appr_Amt, v_Appr_Scnt, v_Pay_Mthd, v_Pay_Dd,
                                 v_Acc_Seq, v_Crd_Seq, v_Acc_Stat, v_Batch_Key,
                                 v_Mfp_Yn, v_Tcan_Yn, v_Os_Yn, v_Del_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '연체대상 집계 내역 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 != f_UpdateRtre0100(v_Dely_Day, v_Ord_No, v_Cust_No, v_Recp_Tp,
                                 v_Appr_Amt, v_Appr_Scnt, v_Pay_Mthd, v_Pay_Dd,
                                 v_Acc_Seq, v_Crd_Seq, v_Acc_Stat, v_Batch_Key,
                                 v_Mfp_Yn, v_Tcan_Yn, v_Os_Yn, v_Del_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '연체대상 집계 내역 수정 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;


    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0100.p_IUDRtre0100(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0100.p_IUDRtre0100(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0100;

  /*****************************************************************************
  -- 연체대상 집계 내역 - 채권대상집계 - 연체내역 집계: 기준일자를 기준으로 연체된 내역을 집계한다.
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-08-28  wjim             [20170828_01] 연체집계 사전 검증로직 추가
                                           - (카드)출금결과 반영 진행중인 상태에서 연체집계 시 수납결과 미반영으로 연체건 급증
                                           - 출금결과 정상반영 여부 확인
                                           - 단, 연체집계일에 CMS, 카드출금이 항상 존재한다는 전제하에 개발 (김혜련 사원과 협의) 
   1.2        2017-10-12  wjim             [20171012_01] 연체집계 사전 검증로직 제외
                                           - 무통장 입금 후 연체집계를 위해 [20170828_01] 작업본 주석처리
   1.3        2019-03-26  kstka            [20190326_01] 연체집계시 취소계약 제외                                                                                   
  *****************************************************************************/
  PROCEDURE p_IUDRtre0100Aggregate (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Proc_Yn        IN VARCHAR,                      /*처리가능 여부         */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 연체대상 집계
    -- 현재시점의 스케줄 내역을 기준으로 연체집계일자보다 만기기준일자가 같거나 작은 내역을 발췌한다.
    -- 연체기준일자보다 크고 작업일자(SYSDATE) 보다 작은 일자에 발생한 수납내역을 구분해서 대상 발췌한다.
    CURSOR  Cur_Rtre0100 IS
    SELECT  *
      FROM  (
                SELECT  'Y' AS RECP_YN,      /* 수납여부 확인 */
                        A.ORD_NO,
                        A.CUST_NO,
                        A.SCHD_SEQ,
                        A.RECP_TP,
                        A.RECP_NU,
                        A.SALE_AMT,
                        A.RECP_AMT,
                        A.ARRE_AMT,
                        A.PAY_MTHD,
                        A.PAY_DD,
                        B.PAY_MTHD   AS ORD_PAY_MTHD,
                        B.PAY_DD     AS ORD_PAY_DD,
                        B.ACC_SEQ,
                        B.CRD_SEQ,
                        B.ACC_STAT,
                        B.BATCH_KEY,
                        B.MFP_YN,
                        B.TCAN_YN,
                        B.OS_YN
                FROM    RTSD0109 A,
                        RTSD0108 B
                WHERE   A.ZFB_DAY <= v_Dely_Day
                AND     A.ARRE_AMT = 0
                AND     A.RECP_TP <> '41'
                AND     A.SCD_STAT = 'S'
                AND     A.ZLSPR    = 'N'
                AND     B.ORD_NO   = A.ORD_NO
                AND     A.ORD_NO  IN ( SELECT  C.ORD_NO
                                        FROM    RTRE0030 C
                                        WHERE   RECV_DAY > v_Dely_Day
                                        AND     RECV_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                        AND     SCHD_SEQ IS NOT NULL )
                UNION ALL
                SELECT 'N' AS RECP_YN,
                        A.ORD_NO,
                        A.CUST_NO,
                        A.SCHD_SEQ,
                        A.RECP_TP,
                        A.RECP_NU,
                        A.SALE_AMT,
                        A.RECP_AMT,
                        A.ARRE_AMT,
                        A.PAY_MTHD,
                        A.PAY_DD,
                        B.PAY_MTHD   AS ORD_PAY_MTHD,
                        B.PAY_DD     AS ORD_PAY_DD,
                        B.ACC_SEQ,
                        B.CRD_SEQ,
                        B.ACC_STAT,
                        B.BATCH_KEY,
                        B.MFP_YN,
                        B.TCAN_YN,
                        B.OS_YN
                FROM    RTSD0109 A,
                        RTSD0108 B
                WHERE   A.ZFB_DAY <= v_Dely_Day
                AND     A.ARRE_AMT > 0
                AND     A.RECP_TP <> '41'
                AND     A.SCD_STAT = 'S'
                AND     A.ZLSPR    = 'N'
                AND     B.ORD_NO   = A.ORD_NO
                AND     A.ORD_NO   NOT IN (SELECT  C.ORD_NO
                                            FROM    RTRE0030 C
                                            WHERE   RECV_DAY > v_Dely_Day
                                            AND     RECV_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                            AND     SCHD_SEQ IS NOT NULL )
                UNION
                SELECT  'Y' AS RECP_YN,      /* 수납여부 확인 */
                        A.ORD_NO,
                        A.CUST_NO,
                        A.SCHD_SEQ,
                        A.RECP_TP,
                        A.RECP_NU,
                        A.SALE_AMT,
                        A.RECP_AMT,
                        A.ARRE_AMT,
                        A.PAY_MTHD,
                        A.PAY_DD,
                        B.PAY_MTHD   AS ORD_PAY_MTHD,
                        B.PAY_DD     AS ORD_PAY_DD,
                        B.ACC_SEQ,
                        B.CRD_SEQ,
                        B.ACC_STAT,
                        B.BATCH_KEY,
                        '' AS MFP_YN,
                        '' AS TCAN_YN,
                        '' AS OS_YN
                FROM    RTSD0109 A,
                        RTSD0104 B
                WHERE   A.ZFB_DAY <= v_Dely_Day
                AND     A.ARRE_AMT = 0
                AND     A.RECP_TP  = '41'
                AND     A.SCD_STAT = 'S'
                AND     A.ZLSPR    = 'N'
                AND     B.ORD_NO   = A.ORD_NO
                AND     A.ORD_NO  IN ( SELECT  C.ORD_NO
                                        FROM    RTRE0030 C
                                        WHERE   RECV_DAY > v_Dely_Day
                                        AND     RECV_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                        AND     SCHD_SEQ IS NOT NULL )
                UNION ALL
                SELECT 'N' AS RECP_YN,
                        A.ORD_NO,
                        A.CUST_NO,
                        A.SCHD_SEQ,
                        A.RECP_TP,
                        A.RECP_NU,
                        A.SALE_AMT,
                        A.RECP_AMT,
                        A.ARRE_AMT,
                        A.PAY_MTHD,
                        A.PAY_DD,
                        B.PAY_MTHD   AS ORD_PAY_MTHD,
                        B.PAY_DD     AS ORD_PAY_DD,
                        B.ACC_SEQ,
                        B.CRD_SEQ,
                        B.ACC_STAT,
                        B.BATCH_KEY,
                        '' AS MFP_YN,
                        '' AS TCAN_YN,
                        '' AS OS_YN
                FROM    RTSD0109 A,
                        RTSD0104 B
                WHERE   A.ZFB_DAY <= v_Dely_Day
                AND     A.ARRE_AMT > 0
                AND     A.RECP_TP  = '41'
                AND     A.SCD_STAT = 'S'
                AND     A.ZLSPR    = 'N'
                AND     B.STAT_CD NOT IN ('06')
                AND     B.ORD_NO   = A.ORD_NO
                AND     A.ORD_NO   NOT IN (SELECT  C.ORD_NO
                                            FROM    RTRE0030 C
                                            WHERE   RECV_DAY > v_Dely_Day
                                            AND     RECV_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD')
                                            AND     SCHD_SEQ IS NOT NULL )
            )
     WHERE  ORD_NO NOT IN (
                 'D19000197177'
                ,'D19000197182'
                ,'D19000197435'
                ,'D19000197982'
                ,'D19000198421'
                ,'D19000198549'
                ,'D19000198971'  
                ,'D19000200166'
            ) --렌탈고도화 오픈 이후 출금이체동의 누락건 임시제외, 2019-03-06 임욱재     
            AND NOT EXISTS (SELECT 1 FROM RTTEMPIWJ_190429_01 WHERE COL_01 = ORD_NO)       
--     WHERE  ORD_NO NOT IN (
--                 'D17000082859'
--                ,'D17000083917'
--                ,'D17000084013'
--                ,'D17000085744'
--                ,'D17000086242'
--                ,'D17000087543'
--                ,'D17000088016'
--                ,'D17000089537'
--                ,'D17000089580'
--                ,'D17000090050'
--                ,'D17000091086'
--                ,'D17000091204'
--                ,'D17000091242'   
--            ) --출금이체동의 누락건 임시 제외, 2017-09-05 임욱재, 2017-12-19 제외 해제
;


    e_Error EXCEPTION;

    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT NULL;/*데이터 총건수         */
    v_Ramg_Id    RTRE0110.RAMG_ID%TYPE DEFAULT NULL;  /*채권관리자            */
    v_Ramg_Ym    RTRE0110.RAMG_YM%TYPE DEFAULT NULL;  /*채권관리년월          */
    v_AFRecp_Amt RTRE0030.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */
    v_Recp_Amt   RTRE0101.RECP_AMT%TYPE  DEFAULT NULL;/*수납금액              */
    v_Arre_Amt   RTRE0101.ARRE_AMT%TYPE  DEFAULT NULL;/*연체금액              */
    
    ln_chk       NUMBER DEFAULT 0;


  BEGIN
    
    -- 필수값: 연체기준일자, 처리가능 여부, 등록자 ID
    IF (TRIM(v_Dely_Day) IS NULL) OR (0 != ISDATE(v_Dely_Day)) THEN
        v_Return_Message := '연체기준일자('||v_Dely_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Proc_Yn) IS NULL) OR (TRIM(v_Proc_Yn) NOT IN ('Y','N')) THEN
        v_Return_Message := '처리가능 여부('||v_Proc_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 정기출금 반영완료여부 확인 [20170828_01]    
    -- - 매월 말일은 출금없이 마감용 집계를 진행하므로 확인 제외
    -- - [20171012_01] 에 의해 주석처리
--    IF v_Dely_Day <> TO_CHAR(LAST_DAY(TO_DATE(SUBSTR(v_Dely_Day,1,6),'YYYYMM')),'yyyymmdd') THEN
--        -- CMS 출금결과 반영완료여부 확인
--        SELECT  COUNT(*)
--          INTO  ln_chk
--          FROM  RTRE0070
--         WHERE  RCMS_DAY = v_Dely_Day
--           AND  RECV_SEQ IS NOT NULL
--        ;    
--        
--        IF ln_chk = 0 THEN
--            v_Return_Message := 'CMS출금결과 수납건이 존재하지 않습니다. 출금결과 반영완료여부를 확인하시기 바랍니다.';
--            RAISE e_Error;
--        END IF;
--        
--        -- 카드출금결과 반영완료여부 확인
--        SELECT  COUNT(*)
--          INTO  ln_chk
--          FROM  RTRE0080
--         WHERE  RCRD_DAY = v_Dely_Day
--           AND  RECV_SEQ IS NOT NULL
--        ;
--        
--        IF ln_chk = 0 THEN
--            v_Return_Message := '카드출금결과 수납건이 존재하지 않습니다. 출금결과 반영완료여부를 확인하시기 바랍니다.';
--            RAISE e_Error;
--        END IF;
--    END IF;
    
    -- 연체기준일자'의 익월
    v_Ramg_Ym := TO_CHAR(ADD_MONTHS(TO_DATE(v_Dely_Day, 'YYYYMMDD'),+1),'YYYYMM');

    IF 0 < f_sRtre0100DelyDayCount(v_Dely_Day) THEN

        IF v_Proc_Yn = 'Y' THEN

            -- 채권대상이 없는 경우 연체내역 삭제 가능
            IF 0 = Pkg_Rtre0110.f_sRtre0110EqualCount(v_Ramg_Ym) THEN

                IF 0 != f_DeleteRtre0100DelyDayAll(v_Dely_Day, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '연체대상 집계 내역(RTRE0100) 삭제 실패!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

                IF 0 != Pkg_Rtre0101.f_DeleteRtre0101DelyDayAll(v_Dely_Day, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '연체대상 세부 내역(RTRE0101) 삭제 실패!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSE
                v_Return_Message := '채권대상이 존재하기 때문에 삭제 불가합니다.!!';
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '연체집계일자('||v_Dely_Day||')는 집계내역이 존재합니다. 처리할 수 없습니다.!!';
            RAISE e_Error;
        END IF;

    END IF;

    v_Tdata_Cnt:= 0;

    -- 채권대상 집계
    FOR CUR IN Cur_Rtre0100 LOOP
        EXIT WHEN Cur_Rtre0100%NOTFOUND;
        v_Tdata_Cnt := v_Tdata_Cnt+1;

        v_AFRecp_Amt := 0;
        v_Recp_Amt   := 0;
        v_Arre_Amt   := 0;

        IF CUR.RECP_YN = 'Y' THEN

            -- 수납금액 획득
            v_AFRecp_Amt := Pkg_Rtre0030.f_sRtre0030AFRecpAmtSum(CUR.ORD_NO, CUR.CUST_NO, v_Dely_Day, CUR.SCHD_SEQ);

            v_Recp_Amt := NVL(CUR.RECP_AMT,0) - v_AFRecp_Amt;
            v_Arre_Amt := NVL(CUR.ARRE_AMT,0) + v_AFRecp_Amt;
        ELSE
            v_Recp_Amt := NVL(CUR.RECP_AMT,0);
            v_Arre_Amt := NVL(CUR.ARRE_AMT,0);
        END IF;

        -- 미납금액이 없는 경우 제외
        IF v_Arre_Amt > 0 THEN

            -- 연체대상 세부 내역(RTRE0101) Insert
            IF 0 != Pkg_Rtre0101.f_InsertRtre0101 (
                        v_Dely_Day,         /*(v_Dely_Day) 연체기준일자          */
                        CUR.ORD_NO,         /*(v_Ord_No  ) 계약번호              */
                        CUR.CUST_NO,        /*(v_Cust_No ) 고객번호              */
                        CUR.SCHD_SEQ,       /*(v_Schd_Seq) 청구순번              */
                        CUR.RECP_TP,        /*(v_Recp_Tp ) 청구구분              */
                        CUR.RECP_NU,        /*(v_Recp_Nu ) 청구회차              */
                        CUR.SALE_AMT,       /*(v_Sale_Amt) 매출금액              */
                        v_Recp_Amt,         /*(v_Recp_Amt) 수납금액              */
                        v_Arre_Amt,         /*(v_Arre_Amt) 연체금액              */
                        CUR.PAY_MTHD,       /*(v_Pay_Mthd) 결제구분              */
                        CUR.PAY_DD,         /*(v_Pay_Dd  ) 이체일                */
                        v_Reg_Id,           /*(v_Reg_Id  ) 등록자 ID             */
                        v_ErrorText
                        ) THEN
                v_Return_Message := '연체대상 세부 내역(RTRE0101) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- 연체대상 집계 내역(RTRE0100) Insert / Update
            p_IUDRtre0100 (
                    v_Dely_Day,         /*(v_Dely_Day ) 연체기준일자          */
                    CUR.ORD_NO,         /*(v_Ord_No   ) 계약번호              */
                    CUR.CUST_NO,        /*(v_Cust_No  ) 고객번호              */
                    CUR.RECP_TP,        /*(v_Recp_Tp  ) 청구구분              */
                    v_Arre_Amt,         /*(v_Appr_Amt ) 연체금액              */
                    1,                  /*(v_Appr_Scnt) 연체회차              */
                    CUR.PAY_MTHD,       /*(v_Pay_Mthd ) 결제방법              */
                    CUR.PAY_DD,         /*(v_Pay_Dd   ) 결제일자              */
                    CUR.ACC_SEQ,        /*(v_Acc_Seq  ) 계좌순번              */
                    CUR.CRD_SEQ,        /*(v_Crd_Seq  ) 카드순번              */
                    CUR.ACC_STAT,       /*(v_Acc_Stat ) 계좌신청상태          */
                    CUR.BATCH_KEY,      /*(v_Batch_Key) 배치키                */
                    CUR.MFP_YN,         /*(v_Mfp_Yn   ) 중도완납여부          */
                    CUR.TCAN_YN,        /*(v_Tcan_Yn  ) 임시해약여부          */
                    CUR.OS_YN,          /*(v_Os_Yn    ) 소유권이전여부        */
                    'N',                /*(v_Del_Yn   ) 삭제여부              */
                    v_Reg_Id,           /*(v_Reg_Id   ) 등록자 ID             */
                    v_Success_Code,
                    v_Return_Message,
                    v_ErrorText
                    );

            IF 0 != v_Success_Code THEN
                v_Return_Message := '연체대상 집계 내역(RTRE0100) 생성 실패!!!'||'-'||v_Return_Message;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;

    END LOOP;

    IF Cur_Rtre0100%ISOPEN THEN
        CLOSE Cur_Rtre0100;
    END IF;

    --[20220802_01] kstka 연체대상집계일 별도 저장
    IF Pkg_Rtcm0051.f_UpdateRTCM0051('R082', 'DELY_DAY', v_Dely_Day, '', 1, 'Y', '', v_Reg_Id, v_ErrorText) < 0 THEN
        v_Return_Message := '연체대상집계일자 등록 실패!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0100.p_IUDRtre0100Aggregate(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0100.p_IUDRtre0100Aggregate(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre0100Aggregate;

  /*****************************************************************************
  -- 연체대상 집계 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre0100DelyDayCount(
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE          /*연체기준일자        */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0100
    WHERE   DELY_DAY = v_Dely_Day
    AND     DEL_YN   = 'N';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0100DelyDayCount;

  /*****************************************************************************
  -- 연체대상 집계 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0100DelyDayAll (
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Reg_Id         IN RTRE0100.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0100
    SET    DEL_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  DELY_DAY = v_Dely_Day;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0100DelyDayAll;


  /*****************************************************************************
  -- 연체내역 조회 : 고객번호 전월말일 기준
  *****************************************************************************/
  FUNCTION f_sRtre0100BMonthDelyAmt(
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE,        /*고객번호              */
    v_Recp_Tp        IN RTRE0100.RECP_TP%TYPE,        /*청구구분              */
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE        /*기준일                */
    ) RETURN NUMBER IS

    v_Dely_Amt  NUMBER DEFAULT 0;
    v_Day       RTRE0100.DELY_DAY%TYPE DEFAULT NULL;

  BEGIN

    -- 입력받은 기준일이 유효하지 않을 경우 전월말일로 셋팅
    IF (TRIM(v_Dely_Day) IS NULL) OR (8 <> LENGTH(TRIM(v_Dely_Day))) OR (0 <> ISDATE(v_Dely_Day)) THEN
       v_Day := TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE,-1)),'YYYYMMDD'); /*전월말일*/
    ELSE
       v_Day := v_Dely_Day;
    END IF;

    SELECT  NVL(SUM(B.APPR_AMT),0)
    INTO    v_Dely_Amt
    FROM    RTSD0108 A,
            RTRE0100 B
    WHERE   A.CUST_NO  = v_Cust_No
    AND     A.ORD_NO   = B.ORD_NO
    AND     A.CUST_NO  = B.CUST_NO
    AND     B.DELY_DAY = v_Day
    AND     B.RECP_TP  = DECODE(v_Recp_Tp, NULL, B.RECP_TP, v_Recp_Tp);

    RETURN v_Dely_Amt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0100BMonthDelyAmt;


  /*****************************************************************************
  -- 연체내역 조회 : 에러메시지 획득
  *****************************************************************************/
  FUNCTION f_sRtre0100ErrMsg(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Pay_Mthd       IN RTSD0108.PAY_MTHD%TYPE,       /*결제구분              */
    v_Acc_Stat       IN RTSD0108.ACC_STAT%TYPE        /*계좌신청상태          */
    ) RETURN VARCHAR IS

    v_Err_Msg  VARCHAR(150) DEFAULT NULL;

  BEGIN

    IF (v_Pay_Mthd = 'A') AND (v_Acc_Stat = 0) THEN

        v_Err_Msg := '계좌신청중';

    ELSIF (v_Pay_Mthd = 'A') AND (v_Acc_Stat = 3) THEN

        SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R003', ACERCD ) ERR_MSG
        INTO    v_Err_Msg
        FROM    (
                SELECT  ACERCD
                FROM    RTRE0060
                WHERE   ORD_NO    = v_Ord_No
                AND     CUST_NO   = v_Cust_No
                AND     ACRQ_DAY <= v_Dely_Day
                AND     ACRQ_TP   = 1
                ORDER  BY ACRQ_DAY DESC, ACRQ_SEQ DESC
                )
        WHERE   ROWNUM <= 1;


    ELSIF (v_Pay_Mthd = 'A') AND (v_Acc_Stat = 4) THEN

        BEGIN

            SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R003', RCERCD ) ERR_MSG
            INTO    v_Err_Msg
            FROM    (
                    SELECT  RCERCD
                    FROM    RTRE0070
                    WHERE   ORD_NO    = v_Ord_No
                    AND     CUST_NO   = v_Cust_No
                    AND     RCMS_DAY <= v_Dely_Day
                    ORDER  BY RCMS_DAY DESC, RCMS_SEQ DESC
                    )
            WHERE   ROWNUM <= 1;

            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Err_Msg := '미청구';
        END;

    ELSIF (v_Pay_Mthd = 'A') AND (v_Acc_Stat = 5) THEN

        v_Err_Msg := '계좌신청 오류';

    ELSIF (v_Pay_Mthd = 'C') AND (v_Acc_Stat = 5) THEN


        BEGIN

            SELECT  Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R028', CRERCD ) ERR_MSG
            INTO    v_Err_Msg
            FROM    (
                    SELECT  CRERCD
                    FROM    RTRE0080
                    WHERE   ORD_NO    = v_Ord_No
                    AND     CUST_NO   = v_Cust_No
                    AND     RCRD_DAY <= v_Dely_Day
                    ORDER  BY RCRD_DAY DESC, RCRD_SEQ DESC
                    )
            WHERE   ROWNUM <= 1;

            EXCEPTION
              WHEN NO_DATA_FOUND THEN
                v_Err_Msg := '미청구';
        END;

    END IF;

    RETURN v_Err_Msg;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0100ErrMsg;


  /*****************************************************************************
  -- 계약번호별 연체내역조회

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0.1      2016-05-04  이영근           MG신용보증 전달을 위해 일부 컬럼 추가   
   1.3        2017-11-16  wjim             [20171116_01] '우편번호' 항목 추가
   1.4        2018-08-07  wjim             [20180807_01] '월렌탈료','성별','SAFEKEY' 항목 추가
   1.5        2019-02-14  wjim             [20190214_01] 월렌탈료 기준 변경
                                           - 고도화 프로젝트에 따른 변경
  *****************************************************************************/
  PROCEDURE p_sRtre0100ArrearsListOrdSum  (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Dely_Day       IN RTRE0100.DELY_DAY%TYPE,       /*연체기준일자          */
    v_Appr_Scnt_F    IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차 시작         */
    v_Appr_Scnt_T    IN RTRE0100.APPR_SCNT%TYPE,      /*연체회차 종료         */
    v_Ord_No         IN RTRE0100.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0100.CUST_NO%TYPE         /*고객번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A2.DELY_DAY                                                                                     /*연체집계일자  */
         ,  A2.ORD_NO                                                                                       /*계약번호      */
         ,  A2.CUST_NO                                                                                      /*고객번호      */
         ,  C2.CUST_NM                                                                                      /*고객명        */
         ,  C2.BIRTH_DAY                                                                                    /*생년월일      */
         ,  C2.ADDR1||C2.ADDR2 AS ADDR                                                                      /*주소          */
         ,  C2.MOB_NO                                                                                       /*휴대폰번호    */  
         ,  D2.MAT_CD          AS MAT_NO                                                                    /*상품코드      */
         ,  E2.MAT_NM                                                                                       /*상품명        */ 
         ,  B2.PERIOD_CD                                                                                    /*계약기간      */
         ,  B2.CAR_NO                                                                                       /*차량번호      */
         ,  B2.PROC_DAY                                                                                     /*장착일자      */
         ,  B2.PAY_MTHD                                                                                     /*결제방법      */
         ,  ZA.CD_NM           AS PAY_MTHD_NM                                                               /*결제방법명    */
         ,  B2.PAY_DD                                                                                       /*결제일자      */
         ,  A2.REGI_AMT                                                                                     /*등록비        */
         ,  A2.RENT_AMT                                                                                     /*렌탈료        */
         ,  A2.PNTY_AMT                                                                                     /*위약금        */
         ,  A2.ETC_AMT                                                                                      /*기타          */
         ,  A2.APPR_SCNT                                                                                    /*연체회차      */
         ,  A2.APPR_AMT                                                                                     /*연체금액      */
         ,  CASE 
                WHEN F2.CHAN_CD = '01' THEN F2.AGENCY_CD
                WHEN F2.CHAN_CD = '02' AND  F2.ORD_AGENT IS NOT NULL THEN F2.ORD_AGENT
                WHEN F2.CHAN_CD = '02' AND  F2.ORD_AGENT IS NULL     THEN 'O00001'
                WHEN F2.CHAN_CD = '03' THEN F2.ORD_AGENT
                WHEN F2.CHAN_CD = '04' THEN F2.ORD_AGENT
                WHEN F2.CHAN_CD = '05' THEN F2.AGENCY_CD
                WHEN F2.CHAN_CD = '06' THEN F2.ORD_AGENT
                WHEN F2.CHAN_CD = '09' THEN F2.ORD_AGENT
                ELSE NULL
            END   AS AGENCY                                                                                 /*판매인코드    */
         ,  CASE 
                WHEN F2.CHAN_CD = '01' THEN G2.AGENCY_NM
                WHEN F2.CHAN_CD = '02' AND  F2.ORD_AGENT IS NOT NULL THEN H2.ORG_AGNM
                WHEN F2.CHAN_CD = '02' AND  F2.ORD_AGENT IS NULL     THEN '온라인몰'
                WHEN F2.CHAN_CD = '03' THEN H2.ORG_AGNM
                WHEN F2.CHAN_CD = '04' THEN H2.ORG_AGNM
                WHEN F2.CHAN_CD = '05' THEN G2.AGENCY_NM
                WHEN F2.CHAN_CD = '06' THEN H2.ORG_AGNM
                WHEN F2.CHAN_CD = '09' THEN H2.ORG_AGNM
                ELSE NULL
            END  AS AGENCY_NM                                                                               /*판매인명      */      
         ,  CASE 
                WHEN F2.CHAN_CD = '01' THEN G2.TEL_NO
                WHEN F2.CHAN_CD = '02' AND  F2.ORD_AGENT IS NOT NULL THEN H2.ORG_AGTEL
                WHEN F2.CHAN_CD = '02' AND  F2.ORD_AGENT IS NULL     THEN NULL
                WHEN F2.CHAN_CD = '03' THEN H2.ORG_AGTEL
                WHEN F2.CHAN_CD = '04' THEN H2.ORG_AGTEL
                WHEN F2.CHAN_CD = '05' THEN G2.TEL_NO
                WHEN F2.CHAN_CD = '06' THEN H2.ORG_AGTEL
                WHEN F2.CHAN_CD = '09' THEN H2.ORG_AGTEL
                ELSE NULL
            END  AS AGENCY_TEL                                                                              /*판매인전화    */
         ,  Pkg_Rtre0100.f_sRtre0100ErrMsg(A2.ORD_NO,A2.CUST_NO,A2.DELY_DAY,B2.PAY_MTHD,B2.ACC_STAT) AS ERR_MSG /*에러메시지 */
         ,  C2.POS_CD                                                                                       /*우편번호      */
         ,  ZB.CD_NM                                                                          AS GENDER_NM  /*성별          */
         ,  C2.SAFEKEY                                                                                      /*SAFEKEY       */
--         ,  D2.MON_AMT                                                                                      /*월렌탈료 [20190214_01] 이전     */
         ,  F2.SUM_MON_AMT                                                                    AS MON_AMT    /*월렌탈료 [20190214_01] 이전     */
      FROM  (        
                SELECT  A1.DELY_DAY                                                                         /*연체집계일자  */
                     ,  A1.ORD_NO                                                                           /*계약번호      */
                     ,  A1.CUST_NO                                                                          /*고객번호      */
                     ,  NVL(SUM(DECODE(A1.RECP_TP, '01', A1.APPR_AMT)),0)                      AS REGI_AMT  /*등록비        */
                     ,  NVL(SUM(DECODE(A1.RECP_TP, '11', A1.APPR_AMT)),0)                      AS RENT_AMT  /*렌탈료        */
                     ,  NVL(SUM(DECODE(A1.RECP_TP, '42', A1.APPR_AMT)),0)                      AS PNTY_AMT  /*위약금        */
                     ,  NVL(SUM(DECODE(A1.RECP_TP, '01', 0, '11', 0, '42', 0, A1.APPR_AMT)),0) AS ETC_AMT   /*기타          */
                     ,  MAX(A1.APPR_SCNT)                                                      AS APPR_SCNT /*연체회차      */
                     ,  NVL(SUM(A1.APPR_AMT),0)                                                AS APPR_AMT  /*연체금액합계  */
                  FROM  RTRE0100 A1
                 WHERE  A1.APPR_SCNT    BETWEEN v_Appr_Scnt_F AND v_Appr_Scnt_T
                   AND  A1.DELY_DAY = DECODE (v_Dely_Day, NULL, A1.DELY_DAY, v_Dely_Day)
                   AND  A1.ORD_NO   = DECODE (v_Ord_No  , NULL, A1.ORD_NO  , v_Ord_No  )
                   AND  A1.CUST_NO  = DECODE (v_Cust_No , NULL, A1.CUST_NO , v_Cust_No )
                 GROUP  BY A1.DELY_DAY, A1.ORD_NO, A1.CUST_NO
            ) A2
         ,  RTSD0108 B2
         ,  RTSD0100 C2
         ,  RTSD0106 D2
         ,  RTSD0005 E2
         ,  RTSD0104 F2
         ,  RTSD0007 G2
         ,  RTSD0113 H2      
         ,  RTCM0051 ZA
         ,  RTCM0051 ZB
     WHERE  A2.ORD_NO       = B2.ORD_NO
       AND  B2.CUST_NO      = C2.CUST_NO(+)
       AND  A2.ORD_NO       = D2.ORD_NO(+)
       AND  D2.SEQ(+)       = 1
       AND  D2.MAT_CD       = E2.MAT_CD(+)
       AND  A2.ORD_NO       = F2.ORD_NO
       AND  F2.AGENCY_CD    = G2.AGENCY_CD
       AND  F2.ORD_AGENT    = H2.ORD_AGENT(+)
       AND  B2.PAY_MTHD     = ZA.CD(+)   
       AND  ZA.CD_GRP_CD(+) = 'R004'
       AND  C2.GENDER_CD    = ZB.CD(+)   
       AND  ZB.CD_GRP_CD(+) = 'S026'
     ORDER  BY A2.ORD_NO
    ;

  END p_sRtre0100ArrearsListOrdSum;
  
  /*****************************************************************************
  -- 연체내역 정보 건별 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.4        2018-01-04  wjim             [20180104_01] 신규 개발
  *****************************************************************************/
  FUNCTION f_sRtre0100OrdNo(
      v_Ord_No       IN RTRE0100.ORD_NO%TYPE          /*계약번호              */
    , v_Dely_Day     IN RTRE0100.DELY_DAY%TYPE        /*연체기준일자          */
    , v_DIv_Day      IN VARCHAR2                      /*조회일자 기준 (A:해당월 최초 집계)           */
    , v_Div_Col      IN VARCHAR2                      /*조회항목 (APPR_SCNT:연체회차, PAY_DD:결제일) */
  ) RETURN VARCHAR IS

    ls_Appr_Scnt    RTRE0100.APPR_SCNT%TYPE;
    ls_Pay_Dd       RTRE0100.PAY_DD%TYPE;    
    
    v_Err_Msg  VARCHAR(150) DEFAULT NULL;

  BEGIN

    IF TRIM(v_Ord_No) IS NULL THEN
    
        v_Err_Msg := '';
    
    ELSIF TRIM(v_Dely_Day) IS NULL THEN
    
        v_Err_Msg := '';
    
    ELSIF v_DIv_Day NOT IN ('A') THEN

        v_Err_Msg := '';
        
    ELSIF v_Div_Col NOT IN ('PAY_DD', 'APPR_SCNT') THEN
    
        v_Err_Msg := '';       

    ELSE
        BEGIN
            
            SELECT  APPR_SCNT
                 ,  PAY_DD
              INTO  ls_Appr_Scnt
                 ,  ls_Pay_Dd
              FROM  (
                        SELECT  ROW_NUMBER() OVER (PARTITION BY A1.ORD_NO ORDER BY A1.DELY_DAY) AS ROW_NUM
                             ,  A1.*
                          FROM  RTRE0100 A1
                         WHERE  A1.ORD_NO      = v_Ord_No
                           AND  A1.DELY_DAY LIKE SUBSTR(v_Dely_Day, 1, 6)||'%'
                           AND  A1.RECP_TP     = '11'
                    ) A2
             WHERE  A2.ROW_NUM = 1                
            ;
            
            IF v_Div_Col = 'APPR_SCNT' THEN
                v_Err_Msg := ls_Appr_Scnt; 
            ELSE
                v_Err_Msg := ls_Pay_Dd;
            END IF;
        
        EXCEPTION
            WHEN OTHERS THEN
                v_Err_Msg := ''; 
                
        END;        

    END IF;

    RETURN v_Err_Msg;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0100OrdNo;

END Pkg_Rtre0100;