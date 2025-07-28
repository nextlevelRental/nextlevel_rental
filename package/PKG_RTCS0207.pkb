CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0207 AS 
/*******************************************************************************
   NAME      Pkg_Rtcs0207
   PURPOSE   미모파손 부여/신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-10-05  kstka            1. Created this package body.
   1.1        2021-11-12  kstka            [20211112-0001] 자동가입프로세스 적용
   1.2        2024-07-30  10243054         [20240730_01] 발송 메시지 수정 SR2407-01540
   1.3        2024-10-07  10243054         [20241007_01] 발송 메시지 수정 SR2410-00238
   1.4        2024-09-27  백인천             구분값 추가하기 어려워 추가 생성함(마모파손서비스 첨부이미지 삭제)
   1.5        2025-05-19  10243054         p_sRtcs0207SelectList MFP_YN 추가 [20250519_01]
*******************************************************************************/
  
  /*****************************************************************************
  -- 마모파손보증 신청 내역
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-05  kstka           Created. [20201005_01]
  *****************************************************************************/
  FUNCTION f_sRtcs0207Count(
    v_Ord_No        IN RTCS0207.ORD_NO%TYPE,          /*배송신청일자        */
    v_Serv_Cd       IN RTCS0207.SERV_CD%TYPE          /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0207
    WHERE   ORD_NO = v_Ord_No
    AND     SERV_CD = v_Serv_Cd
    AND     DLV_STAT NOT IN ('06');

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0207Count;
  
  /*****************************************************************************
  -- 마모파손보증 부여 내역
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-05  kstka           Created. [20201005_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0207SelectList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTCS0207.CUST_NO%TYPE,        /*고객코드              */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_Nm        IN RTCS0207.CUST_NM%TYPE,        /*고객명/법인명         */
    v_Car_No         IN RTCS0207.CAR_NO%TYPE,         /*차량번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Dlvr_Day_F     IN RTCS0207.DLVR_DAY%TYPE,       /*신청일자 From         */
    v_Dlvr_Day_T     IN RTCS0207.DLVR_DAY%TYPE,       /*신청일자 To           */
    v_Proc_Day_F     IN RTSD0108.PROC_DAY%TYPE,       /*장착일자 From         */
    v_Proc_Day_T     IN RTSD0108.PROC_DAY%TYPE,       /*장착일자 To           */
    v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널코드              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*신청상태              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE          /*사용자아이디           */
    ) IS

  BEGIN
/*
01 신청
04 신청완료
06 요청취소
*/  
    
    OPEN Ref_Cursor FOR
    SELECT  ROWNUM,
            NVL(D.DLVR_DAY, TO_CHAR(SYSDATE, 'YYYYMMDD')) AS DLVR_DAY,
            NVL(D.SERV_CD, Pkg_Rtcs0207.f_sGetService(A.ORD_NO)) AS SERV_CD,
            'A' AS DLVR_TYPE,
            NVL(D.DLVR_SEQ, 0) AS DLVR_SEQ,
            A.ORD_NO,                                                          /*계약번호          */
            B.CUST_NO,                                                         /*고객코드          */
            B.CUST_NM,                                                         /*고객명            */
            C.MAT_CD AS MAT_CD,/*상품코드          */
            Pkg_Rtsd0005.f_sRtsd0005MatName(C.MAT_CD) || ' (외 ' || (SELECT COUNT(1)-1 FROM RTSD0106 WHERE ORD_NO = A.ORD_NO) ||'건)'  AS MAT_NM,    /*상품명            */
            A.CNT_CD,                                                          /*수량              */
            A.PERIOD_CD,                                                       /*계약기간          */
            A.MAKER_CD,                                                        /*카메이커          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',A.MAKER_CD)  AS MAKER_NM,  /*카메이커명        */
            A.MODEL_CD,                                                        /*차종              */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)  AS MODEL_NM,  /*차종명            */
            A.CAR_NO,                                                          /*차량번호          */
            A.CAR_OWNER,                                                       /*차량소유자        */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00007') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00007') AS B00007_USE_CNT, /*걱정제로 사용횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00011') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00011') AS B00011_USE_CNT, /*마모보증 사용횟수 */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00012') - Pkg_Rtsd0013.f_sRtsd0013ServCntr(A.ORD_NO, 'B00012') AS B00012_USE_CNT, /*파손보증 사용횟수 */
            A.ORD_DAY,                                                         /*계약일자          */
            A.PROC_DAY,                                                        /*장착점          */
            A.AGENCY_CD,                                                        /*장착일자          */
            B.MOB_NO,                                                          /*핸드폰번호        */
            D.DLVR_DAY,                                                        /*교체신청일자      */
            D.DLVR_SEQ,                                                        /*교체신청순번      */        
            D.DLV_TEL,                                                         /*핸드폰번호        */                                                       /*배송요청사항      */
            D.DLV_STAT,                                                        /*배송요청상태      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('C034',D.DLV_STAT)  AS DLVSTAT_NM,/*배송요청상태명    */
            Pkg_Rtcs0207.f_sRtcs0207DlvrYn(A.ORD_NO, D.DLVR_SEQ) DLVR_YN,
            NVL(D.KWMENG, A.CNT_CD - Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00007')) AS CNT_CD1,                                                /*걱정제로 타이어 본수      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S089',D.KWMENG)  AS CNT_NM, /*걱정제로 타이어 본수명    */
            Pkg_Rtsd0013.f_sRtsd0013ServCnt0(A.ORD_NO, 'B00007') AS B00007_INIT_CNT,                                                 /*걱정제로 최초부여횟수 */ --[20180426_01]
            Pkg_Rtcs0207.f_sRtcs0207ReqNo(A.ORD_NO, D.DLVR_TYPE, D.DLVR_DAY, D.DLVR_SEQ) AS REQ_NO,  /*걱정제로 신청회차     */ --[20180426_01]
            D.C_MILEAGE AS C_MILEAGE,
            D.DLV_DESC,
            A.MFP_YN
    FROM    RTSD0108 A
            INNER JOIN RTSD0100 B ON A.CUST_NO  = B.CUST_NO
            INNER JOIN RTSD0106 C ON A.ORD_NO   = C.ORD_NO AND C.SEQ = 1
            LEFT OUTER JOIN RTCS0207 D ON A.ORD_NO   = D.ORD_NO AND     (D.DLV_STAT IN ( '01', '04' ) )
            LEFT OUTER JOIN RTSD0013 F ON A.ORD_NO   = F.ORD_NO AND     F.PRS_DCD IN ('B00011')
            LEFT OUTER JOIN RTSD0013 G ON A.ORD_NO   = G.ORD_NO AND     G.PRS_DCD IN ('B00012')
            --INNER JOIN RTCS0207 H ON A.ORD_NO   = H.ORD_NO AND     H.SERV_CD NOT IN ( NVL(D.SERV_CD, Pkg_Rtcs0207.f_sGetService(A.ORD_NO)))
    WHERE   1=1
    AND     A.ORD_NO   = DECODE( TRIM( v_Ord_No ), NULL, A.ORD_NO, v_Ord_No )
    AND     A.CAR_NO   = DECODE( TRIM( v_Car_No ), NULL, A.CAR_NO, v_Car_No )
    AND     B.CUST_NO  = DECODE( TRIM( v_Cust_No ), NULL, B.CUST_NO, v_Cust_No )
    AND     B.CUST_NM  LIKE '%' || TRIM( v_Cust_Nm ) || '%'
    AND     B.MOB_NO   = DECODE( TRIM( v_Mob_No ), NULL, B.MOB_NO, v_Mob_No )
    AND     (v_Dlvr_Day_F IS NULL OR D.DLVR_DAY BETWEEN v_Dlvr_Day_F AND v_Dlvr_Day_T)
    AND     (v_Proc_Day_F IS NULL OR A.PROC_DAY BETWEEN v_Proc_Day_F AND v_Proc_Day_T)
    AND     A.CHAN_CD   = DECODE( TRIM( v_Chan_Cd ), NULL, A.CHAN_CD, v_Chan_Cd )
    AND     (v_Dlv_Stat IS NULL OR D.DLV_STAT   = DECODE( TRIM( v_Dlv_Stat ), NULL, D.DLV_STAT, v_Dlv_Stat ))
    --AND  NOT EXISTS (SELECT 1 FROM RTCS0207 WHERE ORD_NO = v_Ord_No AND SERV_CD = NVL(D.SERV_CD, Pkg_Rtcs0207.f_sGetService(A.ORD_NO)) AND DLV_STAT IN ('04')) --신청건에 한해 완료된건도 조회가능하게 변경
    ;


  END p_sRtcs0207SelectList;  
  
  /*****************************************************************************
  -- 마모파손보증서비스 부여회차 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-05  kstka             [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0207ReqNo (
      v_Ord_No      IN RTCS0207.ORD_NO%TYPE     /* 계약번호 */
    , v_Dlvr_Type   IN RTCS0207.DLVR_TYPE%TYPE  /* 서비스유형 */ 
    , v_Dlvr_Day    IN RTCS0207.DLVR_DAY%TYPE   /* 배송신청일자 */  
    , v_Dlvr_Seq    IN RTCS0207.DLVR_SEQ%TYPE   /* 배송신청순번 */
  ) RETURN NUMBER IS
    v_Req_No  NUMBER;
    
  BEGIN
  
    SELECT  NVL(SUM(ROW_NUM), 0)
          INTO  v_Req_No
          FROM  (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.ORD_NO ORDER BY X.DLVR_DAY, DLVR_SEQ) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0207 X
                     WHERE  X.DLV_STAT NOT IN ('06')
                       AND  X.ORD_NO = v_Ord_No
                ) Y
         WHERE  Y.DLVR_TYPE = v_Dlvr_Type
           AND  Y.DLVR_DAY = v_Dlvr_Day
           AND  Y.DLVR_SEQ = v_Dlvr_Seq;

    RETURN v_Req_No;

   EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0207ReqNo;
  
  /*****************************************************************************
  -- 마모파손보증서비스 부여순번 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-05  kstka             [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0207DlvrSeq(
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE          /*배송신청일자        */
    ) RETURN NUMBER IS
    v_Dlvr_Seq RTCS0207.DLVR_SEQ%TYPE;                  /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(DLVR_SEQ)
                 FROM    RTCS0207
                 WHERE   DLVR_DAY = v_Dlvr_Day)+ 1, 1) AS DLVR_SEQ
    INTO    v_Dlvr_Seq
    FROM    DUAL;

    RETURN v_Dlvr_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0207DlvrSeq;  
  
  /*****************************************************************************
  -- 마모파손보증서비스내역 수정여부 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-23  kstka             [20201023_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0207DlvrYn(
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,          /*계약번호              */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE          /*계약번호              */
    ) RETURN VARCHAR2 IS
    v_Dlvr_Yn   VARCHAR2(1);                          /*교체신청여부          */
  BEGIN
/*01 요청접수
02 배송요청
03 배송중
04 서비스 완료
06 요청취소

07 선처리
08 선처리_배송요청
09 선처리_배송중(완료)
*/
    SELECT  DECODE( COUNT(*), 0, 'N', 'Y')
    INTO    v_Dlvr_Yn
    FROM    RTCS0207
    WHERE   ORD_NO = v_Ord_No
    AND     DLVR_SEQ = v_Dlvr_Seq
    AND     DLV_STAT IN ( '01', '02','03','07','08');
  --  AND     DLV_STAT IN ( '01', '02');

    RETURN v_Dlvr_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0207DlvrYn;
  
  /*****************************************************************************
  -- 마모파손보증서비스내역 수정여부 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-23  kstka             [20201023_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0207ServAdSeq(
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,               /*계약번호              */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,            /*계약번호              */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE               /*계약번호              */
    ) RETURN VARCHAR2 IS
    v_Dlvr_Seq   RTCS0208.DLVR_SEQ%TYPE;                                /*교체신청여부          */
  BEGIN
/*01 요청접수
02 배송요청
03 배송중
04 서비스 완료
06 요청취소

07 선처리
08 선처리_배송요청
09 선처리_배송중(완료)
*/
    SELECT  NVL(MAX(DLVR_SEQ), '0')
    INTO    v_Dlvr_Seq
    FROM    RTCS0207
    WHERE   ORD_NO = v_Ord_No
    AND     DLVR_TYPE = v_Dlvr_Type
    AND     SERV_CD   = v_Serv_Cd
    AND     DLV_STAT  = '04';

    RETURN v_Dlvr_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0207ServAdSeq;
  
  /*****************************************************************************
  -- 마모파손보증 부여내역 INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_InsertRtcs0207 (
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*서비스코드            */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE,       /*서비스순번            */
    v_Cust_No        IN RTCS0207.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0207.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0207.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0207.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0207.KWMENG%TYPE,         /*타이어본수             */
    v_Req_Day        IN RTCS0207.REQ_DAY%TYPE,        /*신청일자              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0207.DLV_DESC%TYPE,       /*요청사항             */
    v_Car_No         IN RTCS0207.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0207.DLV_TEL%TYPE,        /*연락처               */
    v_C_Mileage      IN RTCS0207.C_MILEAGE%TYPE,      /*주행거리               */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*등록자              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0207 (
            DLVR_DAY,
            ORD_NO,
            DLVR_TYPE,
            SERV_CD,
            DLVR_SEQ,
            CUST_NO,
            CUST_NM,
            AGENCY_CD,
            MATNR,
            KWMENG,
            REQ_DAY,
            DLV_STAT,
            DLV_DESC,
            CAR_NO,
            DLV_TEL,
            C_MILEAGE,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Dlvr_Day,
            v_Ord_No,
            v_Dlvr_Type,
            v_Serv_Cd,
            v_Dlvr_Seq,
            v_Cust_No,
            v_Cust_Nm,
            v_Agency_Cd,
            v_Matnr,
            v_Kwmeng,
            v_Req_Day,
            v_Dlv_Stat,
            v_Dlv_Desc,
            v_Car_No,
            v_Dlv_Tel,
            v_C_Mileage,
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

  END f_InsertRtcs0207;

  /*****************************************************************************
  -- 마모파손보증 부여내역 UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0207 (
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*계약번호              */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE,       /*고객코드              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*상태코드              */
    v_C_Mileage      IN RTCS0207.C_MILEAGE%TYPE,      /*주행거리              */
    v_Dlv_Desc       IN RTCS0207.DLV_DESC%TYPE,       /*요청사항              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0207
    SET    DLV_STAT         = v_Dlv_Stat,
           C_MILEAGE        = v_C_Mileage,
           DLV_DESC         = v_Dlv_Desc,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  DLVR_DAY         = v_Dlvr_Day
    AND    ORD_NO           = v_Ord_No
    AND    DLVR_TYPE        = v_Dlvr_Type
    AND    SERV_CD          = v_Serv_Cd
    AND    DLVR_SEQ         = v_Dlvr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0207;

  /*****************************************************************************
  -- 마모파손보증 부여내역 DELETE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0207 (
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*계약번호              */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE,       /*고객코드              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0207
    SET    DLV_STAT         = '06'
         , CHG_ID           = v_Reg_Id
         , CHG_DT           = SYSDATE
    WHERE  DLVR_DAY         = v_Dlvr_Day
    AND    ORD_NO           = v_Ord_No
    AND    DLVR_TYPE        = v_Dlvr_Type
    AND    SERV_CD          = v_Serv_Cd
    AND    DLVR_SEQ         = v_Dlvr_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0207;
  
  /*****************************************************************************
  -- 마모파손서비스 부여내역 관리(IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2020-10-14  wjim             [20201014-0001]
  1.1        2021-11-12  kstka            [20211112-0001] 자동가입프로세스 적용                                                                                
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0207 (
    v_Comm_Dvsn      IN CHAR,                         /*1 처리구분(I,U,D)       */
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Dlvr_Seq       IN OUT RTCS0207.DLVR_SEQ%TYPE,   /*서비스순번            */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*서비스코드            */
    v_Cust_No        IN RTCS0207.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0207.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0207.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0207.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0207.KWMENG%TYPE,         /*타이어본수             */
    v_Req_Day        IN RTCS0207.REQ_DAY%TYPE,        /*신청일자              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0207.DLV_DESC%TYPE,       /*요청사항             */
    v_Car_No         IN RTCS0207.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0207.DLV_TEL%TYPE,        /*연락처               */
    v_C_Mileage      IN RTCS0207.C_MILEAGE%TYPE,      /*주행거리              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*등록자               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error         EXCEPTION;
    
    lr_Sd0100       RTSD0100%ROWTYPE;             /*고객정보                  */
    
    v_Serv_Cnt0     RTSD0013.SERV_CNT0%TYPE;
    v_Kwmeng_0      RTCS0207.KWMENG%TYPE;
    
    v_Ord_NoB       RTCS0207.ORD_NO%TYPE;         /*계약번호              */
    v_Cust_NoB      RTCS0207.CUST_NO%TYPE;        /*고객코드              */
    v_Dlv_StatB     RTCS0207.DLV_STAT%TYPE;       /*상태                  */    
    v_Dlv_TelB      RTCS0207.DLV_TEL%TYPE;        /*연락처                */    
    v_Cnt_CdB       RTSD0104.CNT_CD%TYPE;
    
  BEGIN  

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 < f_sRtcs0207Count(v_Ord_No, v_Serv_Cd) THEN
            v_Return_Message := '주문번호-서비스('||v_Ord_No||'-'||v_Serv_Cd||')로 이미등록된 데이터가 존재하므로 신규등록처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        
--        IF f_sGetService(v_Ord_No) <> v_Serv_Cd THEN
--            v_Return_Message := '서비스 유형이 잘못 부여되었습니다.!';
--            RAISE e_Error;
--        END IF;
        
        -- 서비스 적용 가능여부 체크
--        IF 0 = Pkg_Rtsd0013.f_sRtsd0013ServCntr( v_Ord_No, v_Serv_Cd) THEN
--            v_Return_Message := '계약번호 기준 프리미엄서비스(RTSD0013) 잔여횟수(0)으로 처리가 불가 합니다!';
--            RAISE e_Error;
--        END IF;
        
--        -- [20180408_01]
--        -- 걱정제로 총 부여횟수
--        SELECT  SERV_CNT0
--          INTO  v_Serv_Cnt0
--          FROM  RTSD0013
--         WHERE  ORD_NO  = v_Ord_No
--           AND  PRS_DCD = 'B00007';
--        
--        -- 현재까지 신청/진행/완료된 걱정제로 본 수   
--        SELECT  NVL(SUM(KWMENG), 0)
--          INTO  v_Kwmeng_0
--          FROM  RTCS0010
--         WHERE  ORD_NO = v_Ord_No
--           AND  DLV_STAT NOT IN ('06');
--        
--        -- 현재까지 신청/진행/완료된 걱정제로 본 수를 감안하여 신청본수 검증   
--        IF v_Serv_Cnt0 < v_Kwmeng_0 + TRIM(v_Kwmeng) THEN
--            v_Return_Message := '신청가능 서비스수량 : 신청가능 서비스 수량('||v_Serv_Cnt0-v_Kwmeng_0||')보다 신청수량('||TRIM(v_Kwmeng)||')이 많아 신청이 불가 합니다!';
--            RAISE e_Error;
--        END IF;           
        
        -- 순번 획득
        v_Dlvr_Seq := f_sRtcs0207DlvrSeq(v_Dlvr_Day);

    
        IF 0 != f_InsertRtcs0207(v_Dlvr_Day ,v_Ord_No ,v_Dlvr_Type, v_Serv_Cd , v_Dlvr_Seq,
                                 v_Cust_No, v_Cust_Nm ,v_Agency_Cd ,v_Matnr ,v_Kwmeng ,
                                 v_Req_Day ,v_Dlv_Stat , v_Dlv_Desc, v_Car_No, v_Dlv_Tel, v_C_Mileage, v_Reg_Id,
                                 v_ErrorText) THEN
            v_Return_Message := '마모파손서비스 부여 내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
        -- [20211112_01] kstka 자동가입 프로세스 적용
        IF v_Dlvr_Day >= '20211130' AND v_Dlv_Stat = '04' THEN
            
            BEGIN
            
                SELECT  A.ORD_NO, A.CUST_NO, A.CNT_CD
                INTO    v_Ord_NoB, v_Cust_NoB, v_Cnt_CdB
                FROM    RTSD0104 A 
                WHERE   1=1
                AND A.ORD_NO = v_Ord_No;

                EXCEPTION
                  WHEN OTHERS THEN
                    v_Return_Message := '마모파손 부여 내역(RTCS0207) 획득 실패!.';
                    RAISE e_Error;
            END;
        
            Pkg_Rtsd0013.P_IUDRtsd0013('I', v_Ord_No, '999999', v_Serv_Cd, v_Cnt_CdB, v_Kwmeng, v_Kwmeng, '0', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
            IF v_Success_Code != 0 THEN
                v_Return_Message := v_Return_Message || '마모파손서비스 부여 실패(RTSD0013)!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            p_regiSendSms(v_Ord_No, v_Dlvr_Day, v_Dlvr_Seq, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
    
            IF v_Success_Code != 0 THEN
                v_Return_Message := '마모파손서비스 SMS발송 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        
        END IF; 
                    
    ELSIF v_Comm_Dvsn IN ('U','D') THEN

        IF 0 = f_sRtcs0207Count(v_Ord_No, v_Serv_Cd) THEN
            v_Return_Message := '주문번호-서비스('||v_Ord_No||'-'||v_Serv_Cd||')로 등록된 데이터가 존재하지 않음므로 수정처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        BEGIN
            
            SELECT  A.ORD_NO, A.CUST_NO, A.CNT_CD, B.DLV_STAT
            INTO    v_Ord_NoB, v_Cust_NoB, v_Cnt_CdB, v_Dlv_StatB
            FROM    RTSD0104 A 
                    LEFT OUTER JOIN RTCS0207 B 
                    ON A.ORD_NO = B.ORD_NO 
                    AND DLVR_DAY  = v_Dlvr_Day
                    AND DLVR_SEQ  = v_Dlvr_Seq
            WHERE   1=1
            AND A.ORD_NO = v_Ord_No;

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '마모파손 부여 내역(RTCS0207) 획득 실패!.';
                RAISE e_Error;
        END;

        -- 계약번호, 고객번호 동일여부 체크
        IF v_Ord_No <> v_Ord_NoB THEN
            v_Return_Message := '계약번호('||v_Ord_No||'='||v_Ord_NoB||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (v_Cust_No <> v_Cust_NoB) THEN
            v_Return_Message := '고객번호('||v_Cust_No||'='||v_Cust_NoB||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
        

        IF v_Comm_Dvsn = 'U' THEN        
            
            IF v_Dlv_Stat = '04' THEN
            
                Pkg_Rtsd0013.P_IUDRtsd0013('I', v_Ord_No, '999999', v_Serv_Cd, v_Cnt_CdB, v_Kwmeng, v_Kwmeng, '0', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
                IF v_Success_Code != 0 THEN
                    v_Return_Message := '마모파손서비스 부여 실패(RTSD0013)!!!'||'-'||v_Errortext;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
                
            END IF;
            
            IF 0 != f_UpdateRtcs0207(v_Dlvr_Day ,v_Ord_No , v_Dlvr_Type ,v_Serv_Cd ,
                                     v_Dlvr_Seq ,v_Dlv_Stat , v_C_Mileage, v_Dlv_Desc, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '마모파손서비스 부여 내역 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;     
            
            p_regiSendSms(v_Ord_No, v_Dlvr_Day, v_Dlvr_Seq, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        
            IF v_Success_Code != 0 THEN
                v_Return_Message := '마모파손서비스 SMS발송 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        
        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0207(v_Dlvr_Day ,v_Ord_No , v_Dlvr_Type ,v_Serv_Cd ,
                                     v_Dlvr_Seq ,v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '마모파손서비스 부여 내역 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;    

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);

    END p_IUDRtcs0207;
  
  /*****************************************************************************
  -- 마모파손서비스 부여내역 초기화
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.4        2024-09-27  백인천             구분값 추가하기 어려워 추가 생성함(마모파손서비스 첨부이미지 삭제)
  *****************************************************************************/
  PROCEDURE p_RESETRtcs0207 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(R)       */
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*배송신청일자          */
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호             */
    v_Dlvr_Type      IN RTCS0207.DLVR_TYPE%TYPE,      /*부여:A, 신청:B       */
    v_Dlvr_Seq       IN OUT RTCS0207.DLVR_SEQ%TYPE,   /*서비스순번            */
    v_Serv_Cd        IN RTCS0207.SERV_CD%TYPE,        /*서비스코드            */
    v_Cust_No        IN RTCS0207.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Nm        IN RTCS0207.CUST_NM%TYPE,        /*고객명                */
    v_Agency_Cd      IN RTCS0207.AGENCY_CD%TYPE,      /*대리점코드             */
    v_Matnr          IN RTCS0207.MATNR%TYPE,          /*제품코드              */
    v_Kwmeng         IN RTCS0207.KWMENG%TYPE,         /*타이어본수             */
    v_Req_Day        IN RTCS0207.REQ_DAY%TYPE,        /*신청일자              */
    v_Dlv_Stat       IN RTCS0207.DLV_STAT%TYPE,       /*상태                 */
    v_Dlv_Desc       IN RTCS0207.DLV_DESC%TYPE,       /*요청사항             */
    v_Car_No         IN RTCS0207.CAR_NO%TYPE,         /*차량번호                */
    v_Dlv_Tel        IN RTCS0207.DLV_TEL%TYPE,        /*연락처               */
    v_C_Mileage      IN RTCS0207.C_MILEAGE%TYPE,      /*주행거리              */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*등록자               */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error         EXCEPTION;
    
    lr_Sd0100       RTSD0100%ROWTYPE;             /*고객정보                  */
    
    v_Serv_Cnt0     RTSD0013.SERV_CNT0%TYPE;
    v_Kwmeng_0      RTCS0207.KWMENG%TYPE;
    
    v_Ord_NoB       RTCS0207.ORD_NO%TYPE;         /*계약번호              */
    v_Cust_NoB      RTCS0207.CUST_NO%TYPE;        /*고객코드              */
    v_Dlv_StatB     RTCS0207.DLV_STAT%TYPE;       /*상태                  */    
    v_Dlv_TelB      RTCS0207.DLV_TEL%TYPE;        /*연락처                */    
    v_Cnt_CdB       RTSD0104.CNT_CD%TYPE;
   
   	v_Check_Ps		NUMBER;
    
  BEGIN  


    IF 0 = f_sRtcs0207Count(v_Ord_No, v_Serv_Cd) THEN
        v_Return_Message := '주문번호-서비스('||v_Ord_No||'-'||v_Serv_Cd||')로 등록된 데이터가 존재하지 않음므로 수정처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    BEGIN
        
        SELECT  A.ORD_NO, A.CUST_NO, A.CNT_CD, B.DLV_STAT
        INTO    v_Ord_NoB, v_Cust_NoB, v_Cnt_CdB, v_Dlv_StatB
        FROM    RTSD0104 A 
                LEFT OUTER JOIN RTCS0207 B 
                ON A.ORD_NO = B.ORD_NO 
                AND DLVR_DAY  = v_Dlvr_Day
                AND DLVR_SEQ  = v_Dlvr_Seq
        WHERE   1 = 1
        AND A.ORD_NO = v_Ord_No;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '마모파손 부여 내역(RTCS0207) 획득 실패!.';
            RAISE e_Error;
    END;

    -- 계약번호, 고객번호 동일여부 체크
    IF v_Ord_No <> v_Ord_NoB THEN
        v_Return_Message := '계약번호('||v_Ord_No||'='||v_Ord_NoB||')가 일치하지 않음으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (v_Cust_No <> v_Cust_NoB) THEN
        v_Return_Message := '고객번호('||v_Cust_No||'='||v_Cust_NoB||')가 일치하지 않음으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 != f_UpdateRtcs0207(v_Dlvr_Day ,v_Ord_No , v_Dlvr_Type ,v_Serv_Cd ,
                             v_Dlvr_Seq ,v_Dlv_Stat , v_C_Mileage, v_Dlv_Desc, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '마모파손서비스 신청 내역 초기화 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
    
    IF 0 != Pkg_Rtcs0208.f_DeleteRtcs0208(v_Dlvr_Day ,v_Ord_No , v_Dlvr_Type ,v_Serv_Cd ,
                             v_Dlvr_Seq ,v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '마모파손서비스 부여 내역 삭제 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
   
    IF 0 != Pkg_Rtcs0209.f_DeleteAllRtcs0209(v_Ord_No, v_Dlvr_Day ,v_Dlvr_Type, v_Serv_Cd , v_Dlvr_Seq,
                             v_Reg_Id ,v_ErrorText) THEN
        v_Return_Message := '마모파손서비스 첨부이미지 삭제 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
   
    -- 프리미엄서비스 중 해당 항목 삭제(마모보증서비스, 파손보증서비스)
   	v_Check_Ps := Pkg_Rtsd0013.f_DeleteEachRtsd0013(v_Ord_No, 'B00011');
    
   	v_Check_Ps := Pkg_Rtsd0013.f_DeleteEachRtsd0013(v_Ord_No, 'B00012');
   
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);

    END p_RESETRtcs0207;
  
   
    /*****************************************************************************
  -- 쇼핑몰 마모파손서비스 가입/신청가능여부 정보획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-11-09  kstka             [20201109_01] 신규 생성
  *****************************************************************************/
  PROCEDURE p_sGetInitInfo(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE               /*계약번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT 
        CASE WHEN (E.SERVICE_CD IS NOT NULL AND B.PRS_DCD IS NOT NULL)
                  OR (SELECT COUNT(*) FROM RTSD0108 X
                                                        INNER JOIN RTSD0013 Y 
                                                        ON X.ORD_NO = Y.ORD_NO 
                                                        AND Y.PRS_DCD = 'B00008' 
                                                        AND Y.SERV_CNT0 > Y.SERV_CNTR
                                                        INNER JOIN RTCS0008 Z
                                                        ON X.ORD_NO = Z.ORD_NO
                                                        AND Z.SERVICE_CD = 'B00008'
                                                        AND X.PROC_DAY = TO_CHAR(Z.REG_DT, 'YYYYMMDD')
                                        WHERE X.CAR_NO = A.CAR_NO
                                        AND X.PROC_DAY = A.PROC_DAY
                                        AND X.ORD_NO <> A.ORD_NO
                                        AND X.CNT_CD = '02'
                                        AND X.CNT_CD = A.CNT_CD
                                        AND X.CUST_NO = A.CUST_NO
                                        ) > 0
             THEN 'B00011' ELSE 'B00012' END AS SERV_CD, --얼라인먼트서비스 사용했으면 조기마모파손
        NVL(C.SERV_CNTR, '-1') AS B00011_USE_CNT, -- -1이면 가입대상, 0이상이면 신청대상
        NVL(D.SERV_CNTR, '-1') AS B00012_USE_CNT,  -- -1이면 가입대상, 0이상이면 신청대상
        (SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END FROM RTCS0207 WHERE ORD_NO = A.ORD_NO AND DLV_STAT = '01') AS REGIST_ING_YN,
        (SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END FROM RTCS0208 WHERE ORD_NO = A.ORD_NO AND DLV_STAT IN ('00', '01', '02', '03')) AS APPLY_ING_YN
    FROM RTSD0108 A 
         LEFT OUTER JOIN RTSD0013 B
                         ON A.ORD_NO = B.ORD_NO
                         AND B.PRS_DCD = 'B00008'
                         AND B.SERV_CNT0 > B.SERV_CNTR
         LEFT OUTER JOIN RTSD0013 C
                         ON A.ORD_NO = C.ORD_NO
                         AND C.PRS_DCD = 'B00011'
         LEFT OUTER JOIN RTSD0013 D
                         ON A.ORD_NO = D.ORD_NO
                         AND D.PRS_DCD = 'B00012'
         LEFT OUTER JOIN RTCS0008 E
                         ON A.ORD_NO = E.ORD_NO
                         AND A.PROC_DAY = TO_CHAR(E.REG_DT, 'YYYYMMDD')
                         AND E.SERVICE_CD = 'B00008'
    WHERE A.ORD_NO = v_Ord_No
    ; 

  END p_sGetInitInfo;
  
  /*****************************************************************************
  -- 쇼핑몰 마모파손서비스 가입/신청가능여부 정보획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-11-09  kstka             [20201109_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sGetService(
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE               /*계약번호              */
    ) RETURN VARCHAR IS

    v_Serv_Cd RTCS0207.SERV_CD%TYPE;
  BEGIN

    -- 당일 장착 + 얼라인먼트 서비스 확인서작성 : B00011
    -- 당일 장착만 OR 당일장착 + 서비스만 부여 : B00012
    SELECT CASE WHEN (C.SERVICE_CD IS NOT NULL AND B.PRS_DCD IS NOT NULL)
                  OR (SELECT COUNT(*) FROM RTSD0108 X
                                                        INNER JOIN RTSD0013 Y 
                                                        ON X.ORD_NO = Y.ORD_NO 
                                                        AND Y.PRS_DCD = 'B00008' 
                                                        AND Y.SERV_CNT0 > Y.SERV_CNTR
                                                        INNER JOIN RTCS0008 Z
                                                        ON X.ORD_NO = Z.ORD_NO
                                                        AND Z.SERVICE_CD = 'B00008'
                                                        AND X.PROC_DAY = TO_CHAR(Z.REG_DT, 'YYYYMMDD')
                                        WHERE X.CAR_NO = A.CAR_NO
                                        AND X.PROC_DAY = A.PROC_DAY
                                        AND X.ORD_NO <> A.ORD_NO
                                        AND X.CNT_CD = '02'
                                        AND X.CNT_CD = A.CNT_CD
                                        AND X.CUST_NO = A.CUST_NO
                                        ) > 0
             THEN 'B00011' ELSE 'B00012' END AS SERV_CD --얼라인먼트서비스 사용했으면 조기마모파손
             INTO v_Serv_Cd
    FROM RTSD0108 A 
         LEFT OUTER JOIN RTSD0013 B
                         ON A.ORD_NO = B.ORD_NO
                         AND B.PRS_DCD = 'B00008'
                         AND B.SERV_CNT0 > B.SERV_CNTR
         LEFT OUTER JOIN RTCS0008 C
                         ON A.ORD_NO = C.ORD_NO
                         AND A.PROC_DAY = TO_CHAR(C.REG_DT, 'YYYYMMDD')
                         AND C.SERVICE_CD = 'B00008'
    WHERE A.ORD_NO = v_Ord_No
    ; 

    RETURN 'B00012';
    
  END f_sGetService;
  
  /*****************************************************************************
  -- SMS 발송
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2024-10-07  10243054         [20241007_01] 발송 메시지 수정 SR2410-00238
  *****************************************************************************/
 PROCEDURE p_regiSendSms (
    v_Ord_No         IN RTCS0207.ORD_NO%TYPE,         /*주문번호              */
    v_Dlvr_Day       IN RTCS0207.DLVR_DAY%TYPE,       /*주문일자              */
    v_Dlvr_Seq       IN RTCS0207.DLVR_SEQ%TYPE,       /*순번                 */
    v_Reg_Id         IN RTCS0207.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';
    
    v_StatCd        VARCHAR2(10);    --상태코드
    v_Cust_Nm       VARCHAR2(100);   --고객명
    v_Mat_Nm        VARCHAR2(100);  --계약상품
    v_Ord_Qty       VARCHAR2(100);  --계약수량
    v_Period_Nm     VARCHAR2(10);  --계약기간
    v_Regi_Nm       VARCHAR2(50);  --최초등록비
    v_Summon_Amt    NUMBER;  --월렌탈료
    v_Agency_Nm     VARCHAR2(100);  --장착점상호명
    v_Agency_Addr   VARCHAR2(500);  --장착점주소
    v_Agency_TelNo  VARCHAR2(20);  --장착점전화번호
    v_Prc_Day       VARCHAR2(20);  --장착예정일
    v_Customer_Mobno  VARCHAR2(20);--받는사람핸드폰번호
    
    v_Kmweng        VARCHAR2(20);  --신청본수
    v_Dlv_Stat      VARCHAR2(20);  --신청상태
    v_Serv_Cd       VARCHAR2(20);  --서비스종류
    
   BEGIN
   
    IF v_Ord_No IS NOT NULL THEN
    
        SELECT KWMENG, DLV_STAT, SERV_CD 
        INTO v_Kmweng, v_Dlv_Stat, v_Serv_Cd
        FROM RTCS0207
        WHERE ORD_NO = v_Ord_No
        AND DLVR_DAY = v_Dlvr_Day
        AND DLVR_SEQ = v_Dlvr_Seq;
        
        BEGIN
            SELECT
              (SELECT A.CUST_NM FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS CUST_NM
              ,(SELECT B.MAT_NM FROM RTSD0106 A, RTSD0005 B WHERE A.ORD_NO = T.ORD_NO AND A.MAT_CD = B.MAT_CD) AS MAT_NM
              ,(SELECT A.ORD_QTY FROM RTSD0106 A WHERE A.ORD_NO = T.ORD_NO) AS ORD_QRY
              ,T.PERIOD_CD
              ,T.REGI_AMT
              ,T.SUM_MON_AMT
              ,(SELECT A.AGENCY_NM  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_NM
              ,(SELECT A.CITY||' '||A.STREET  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_ADDR
              ,(SELECT REGEXP_REPLACE(REGEXP_REPLACE (A.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3')  
                FROM RTSD0007 A 
                WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_TEL_NO
              ,TO_CHAR(TO_DATE(T.PROC_DAY,'YYYYMMDD'),'YYYY.MM.DD') AS PROC_DAY
              ,(SELECT A.MOB_NO FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS MOB_NO
            INTO v_Cust_Nm          --고객명
                 ,v_Mat_Nm          --계약상품
                 ,v_Ord_Qty         --계약수량
                 ,v_Period_Nm       --계약기간
                 ,v_Regi_Nm         --최초등록비
                 ,v_Summon_Amt      --월렌탈료
                 ,v_Agency_Nm       --장착점상호명
                 ,v_Agency_Addr     --장착점주소
                 ,v_Agency_TelNo    --장착점전화번호
                 ,v_Prc_Day        --장착예정일
                 ,v_Customer_Mobno  --받는사람핸드폰번호
            FROM RTSD0104 T
            WHERE T.ORD_NO = v_Ord_No;
            
            --가입시 SMS발송
            IF v_Dlv_Stat IN ('04') THEN
            
--                IF v_Serv_Cd = 'B00011' THEN
--                
--                    v_Sms_Msg := '안녕하세요. 넥스트레벨 타이어렌탈 서비스입니다.';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'고객님의 무상파손/조기마모 보증 서비스 가입이 완료되었습니다.';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'이제부터 계약기간 내 렌탈타이어 파손/조기마모시, 타이어를 무상으로 교체받을수 있으며 아래와 같이 신청방법에 대해 안내드립니다.';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'[보증서비스 신청 방법안내]';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'1.넥스트레벨 고객센터 ☎1855-0100';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'1)본인확인 -> 2)파손사진첨부 -> 3)타이어교체';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'2.넥스트레벨 홈페이지';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'1) https://www.nexen-nextlevel.com 접속 → 2) 나의 렌탈 관리(파손 사진 첨부 후 신청) → 3) 타이어 교체';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'※회사에서 무상제공하는 모든타이어는 렌탈타이어 본 품 수량에 한합니다.';
--                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                    v_Sms_Msg := v_Sms_Msg||'※회사사정에 따라 무상제공되는 타이어가 변경될 수 있습니다.';
--                    
--                ELSIF v_Serv_Cd = 'B00012' THEN
                
                    v_Sms_Msg := '안녕하세요. 넥스트레벨 타이어렌탈 서비스입니다.';
                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                    v_Sms_Msg := v_Sms_Msg||'고객님의 무상 파손 보증 서비스 가입이 완료되었습니다.';
                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                    v_Sms_Msg := v_Sms_Msg||'이제부터 계약기간 내 렌탈타이어 파손시, 타이어를 무상으로 교체받을수 있으며 아래와 같이 신청방법에 대해 안내드립니다.';
                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                    v_Sms_Msg := v_Sms_Msg||'[보증서비스 신청 방법안내]';
                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                    v_Sms_Msg := v_Sms_Msg||'넥스트레벨 고객센터 ☎1855-0100';
                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                    v_Sms_Msg := v_Sms_Msg||'1)본인확인 -> 2)파손사진 첨부 -> 3)파손사진 첨부 후 고객센터 통화 -> 4)타이어교체';
                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                    v_Sms_Msg := v_Sms_Msg||'※회사에서 무상 제공하는 모든타이어는 렌탈타이어 본 품 수량에 한합니다.';
                    v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                    v_Sms_Msg := v_Sms_Msg||'※회사사정에 따라 무상제공되는 타이어가 변경될 수 있습니다.';
                    
--                END IF;
                --주문접수완료 SMS 발송
                Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'I'                                   /*예약 전송여부    */
                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                    , v_Customer_Mobno                      /*받는 전화번호    */
                    , '18550100'                            /*보내는 전화번호  */
                    , v_Sms_Msg                             /*메시지내용       */
                    , 'S003'                                /*사용자지정 필드1 */
                    , v_Ord_No                              /*사용자지정 필드2 */
                    ,'2'
                    ,'RENTAL00000000000003'
                    , v_Reg_Id                              /*등록자 ID        */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
            
            END IF;
            
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN 
            Null; 
        END;
            
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0207.p_regiAmtPay(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0207.p_regiAmtPay(2)', v_ErrorText, v_Return_Message);
  END p_regiSendSms;
  
  /*****************************************************************************
  -- 주문 등록시 보증서비스 SMS 발송
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.2        2024-07-30  10243054         [20240730_01] 발송 메시지 수정 SR2407-01540
  *****************************************************************************/
 PROCEDURE p_warrantySendSms (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';
    
    v_Mob_No        VARCHAR2(100);   --고객명
    v_Serv_Cd       VARCHAR2(100);  --계약상품
    v_Season_Cd     VARCHAR2(100);  --계약수량
    
   BEGIN
   
    IF v_Ord_No IS NOT NULL THEN
    
    
        BEGIN
        
            
            WITH TMP AS (
                SELECT 'A' AS GUBUN, A.MOB_NO, ORD_NO, Pkg_Rtcs0207.f_sGetService(ORD_NO) AS SERV_CD, B.MODEL_CD, B.CONTENTS_CD, B.FR_CD, B.CNT_CD, B.CAR_NO
                FROM RTSD0100 A, RTSD0108 B 
                WHERE 1=1
                AND A.CUST_NO = B.CUST_NO
                AND STAT_CD IN ('04')
            )
            SELECT A.MOB_NO, A.SERV_CD, C.SEASON_CD
            INTO v_Mob_No, v_Serv_Cd, v_Season_Cd
            FROM TMP A, RTSD0106 B, RTSD0005 C, RTSD0004 D
            WHERE A.ORD_NO = B.ORD_NO
            AND A.ORD_NO = v_Ord_No
            AND B.MAT_CD = C.MAT_CD
            AND C.SEASON_CD = '01'  --사계절용
            AND A.MODEL_CD = D.MODEL_CD
            AND A.CONTENTS_CD = D.CONTENTS_CD
            AND C.SECTION_WIDTH = D.SECTION_WIDTH
            AND C.ASPECT_RATIO = D.ASPECT_RATIO
            AND C.WHEEL_INCHES = D.WHEEL_INCHES
            AND C.PLY_RATING = D.PLY_RATING
            AND A.FR_CD = D.FR_CD
            AND D.CLASS_CD IN ('P1', 'S1') --승용차,SUV
            AND A.CNT_CD NOT IN ('01') --[20210106_01] kstka 1본 계약고객은 제외
            AND REGEXP_LIKE(REPLACE(A.CAR_NO, ' ', ''),'\d{2}[^하|허|호|아|바|사|자\x20]\d{4}') --렌터카(하, 허, 호) 및 영업용(아, 바, 사, 자) 차량 제외 
            AND NOT EXISTS (SELECT 1 FROM RTCS0207 X WHERE X.ORD_NO = A.ORD_NO AND X.DLV_STAT IN ('01', '04', '06'));
            
            
        
            v_Sms_Msg := '고객님, 넥스트레벨 타이어렌탈 서비스를 이용해 주시어 진심으로 감사드립니다.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
            v_Sms_Msg := v_Sms_Msg||'보증서비스를 가입하셔야만, 계약기간 내 렌탈타이어가 파손되어도 타이어를 무상으로 교체 받으실 수 있습니다. 넥센타이어가 제공하는 획기적인 서비스를 누려보세요.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg||'무상 파손 보증 서비스 가입을 위해 장착완료일을 기준으로 한달 내, 아래 URL을 눌러 사진을 첨부해주세요.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
            v_Sms_Msg := v_Sms_Msg||'(URL주소: https://m.nexen-nextlevel.com/mypage/newFreeDamageSrvJoin?ordNo=' || v_Ord_No  || ')';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
            v_Sms_Msg := v_Sms_Msg||'※ 보증서비스는 장착 완료 후 한달 이내 가입해야합니다.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
            v_Sms_Msg := v_Sms_Msg||'※ 앞/뒤 타이어가 다른 렌탈고객은 수신된 2건의 보증서비스 가입 문자를 모두 클릭하시어 사진 등록을 해야 합니다.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
            v_Sms_Msg := v_Sms_Msg||'※ 보증서비스는 사계절용 타이어/승용차/SUV차량에 한하여 제공되며 영업용, 임대용 차량은 서비스가 제한됩니다. 회사에서 제공하는 자세한 보증범위는 넥스트레벨 홈페이지에서 확인할 수 있습니다.';
            v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
            v_Sms_Msg := v_Sms_Msg||'https://www.nexen-nextlevel.com/contents/guaranteeSystem';
        
            --주문접수완료 SMS 발송
            Pkg_Rtsd0205.p_Rtsd0205InterfaceNew_RealTmp (
                  'I'                                   /*예약 전송여부    */
                , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                , v_Mob_No                              /*받는 전화번호    */
                , '18550100'                            /*보내는 전화번호  */
                , v_Sms_Msg                             /*메시지내용       */
                , 'S051'                                /*사용자지정 필드1 */
                , v_Ord_No                              /*사용자지정 필드2 */
                ,'7'
                ,''
                , 'BATCH'                               /*등록자 ID        */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN 
            Null; 
        END;

    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0104.p_warrantySendSms(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0104.p_warrantySendSms(2)', v_ErrorText, v_Return_Message);
  END p_warrantySendSms;
  
  /*****************************************************************************
  -- SMS 발송 (batch)
  *****************************************************************************/
 PROCEDURE p_batchSms (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';

    BEGIN
        
        FOR CUR IN (WITH TMP AS (
--                        SELECT 'A' AS GUBUN, A.MOB_NO, ORD_NO, Pkg_Rtcs0207.f_sGetService(ORD_NO) AS SERV_CD, B.MODEL_CD, B.CONTENTS_CD, B.FR_CD, B.CNT_CD
--                        FROM RTSD0100 A, RTSD0108 B 
--                        WHERE 1=1
--                        AND A.CUST_NO = B.CUST_NO
--                        AND PROC_DAY = TO_CHAR(TO_DATE(SYSDATE) - 1, 'YYYYMMDD')
--                        AND ORD_DAY >= '20201201'
--                        AND STAT_CD IN ('04')
--                        UNION ALL
                        SELECT 'B' AS GUBUN, A.MOB_NO, ORD_NO, Pkg_Rtcs0207.f_sGetService(ORD_NO) AS SERV_CD, B.MODEL_CD, B.CONTENTS_CD, B.FR_CD, B.CNT_CD, B.CAR_NO, B.MFP_YN
                        FROM RTSD0100 A, RTSD0108 B 
                        WHERE 1=1
                        AND A.CUST_NO = B.CUST_NO
                        AND (PROC_DAY = TO_CHAR(TO_DATE(SYSDATE) - 5, 'YYYYMMDD')
                             AND PROC_DAY >= '20201201')
                        AND ORD_DAY >= '20201201'
                        AND STAT_CD IN ('04')
                        UNION ALL
                        SELECT 'B' AS GUBUN, A.MOB_NO, ORD_NO, Pkg_Rtcs0207.f_sGetService(ORD_NO) AS SERV_CD, B.MODEL_CD, B.CONTENTS_CD, B.FR_CD, B.CNT_CD, B.CAR_NO, B.MFP_YN
                        FROM RTSD0100 A, RTSD0108 B 
                        WHERE 1=1
                        AND A.CUST_NO = B.CUST_NO
                        AND (PROC_DAY = TO_CHAR(TO_DATE(SYSDATE) - 10, 'YYYYMMDD')
                             AND PROC_DAY >= '20201201')
                        AND ORD_DAY >= '20201201'
                        AND STAT_CD IN ('04')
                        UNION ALL
                        SELECT 'B' AS GUBUN, A.MOB_NO, ORD_NO, Pkg_Rtcs0207.f_sGetService(ORD_NO) AS SERV_CD, B.MODEL_CD, B.CONTENTS_CD, B.FR_CD, B.CNT_CD, B.CAR_NO, B.MFP_YN
                        FROM RTSD0100 A, RTSD0108 B 
                        WHERE 1=1
                        AND A.CUST_NO = B.CUST_NO
                        AND (PROC_DAY = TO_CHAR(TO_DATE(SYSDATE) - 15, 'YYYYMMDD')
                             AND PROC_DAY >= '20201201')
                        AND ORD_DAY >= '20201201'
                        AND STAT_CD IN ('04')
                        UNION ALL
                        SELECT 'C' AS GUBUN, A.MOB_NO, ORD_NO, Pkg_Rtcs0207.f_sGetService(ORD_NO) AS SERV_CD, B.MODEL_CD, B.CONTENTS_CD, B.FR_CD, B.CNT_CD, B.CAR_NO, B.MFP_YN
                        FROM RTSD0100 A, RTSD0108 B 
                        WHERE 1=1
                        AND A.CUST_NO = B.CUST_NO
                        AND (PROC_DAY = TO_CHAR(TO_DATE(SYSDATE) - 20, 'YYYYMMDD')
                             AND PROC_DAY >= '20201201')
                        AND ORD_DAY >= '20201201'
                        AND STAT_CD IN ('04')
                        UNION ALL
                        SELECT 'C' AS GUBUN, A.MOB_NO, ORD_NO, Pkg_Rtcs0207.f_sGetService(ORD_NO) AS SERV_CD, B.MODEL_CD, B.CONTENTS_CD, B.FR_CD, B.CNT_CD, B.CAR_NO, B.MFP_YN
                        FROM RTSD0100 A, RTSD0108 B 
                        WHERE 1=1
                        AND A.CUST_NO = B.CUST_NO
                        AND (PROC_DAY = TO_CHAR(TO_DATE(SYSDATE) - 25, 'YYYYMMDD')
                             AND PROC_DAY >= '20201201')
                        AND ORD_DAY >= '20201201'
                        AND STAT_CD IN ('04')
                    )
                    SELECT A.GUBUN, A.MOB_NO, A.ORD_NO, A.SERV_CD, A.CAR_NO, C.SEASON_CD
                    FROM TMP A, RTSD0106 B, RTSD0005 C, RTSD0004 D
                    WHERE A.ORD_NO = B.ORD_NO
                    AND B.MAT_CD = C.MAT_CD
                    AND C.SEASON_CD = '01'  --사계절용
                    AND A.MODEL_CD = D.MODEL_CD
                    AND A.CONTENTS_CD = D.CONTENTS_CD
                    AND C.SECTION_WIDTH = D.SECTION_WIDTH
                    AND C.ASPECT_RATIO = D.ASPECT_RATIO
                    AND C.WHEEL_INCHES = D.WHEEL_INCHES
                    AND C.PLY_RATING = D.PLY_RATING
                    AND A.FR_CD = D.FR_CD
                    AND A.MFP_YN = 'N'
                    AND D.CLASS_CD IN ('P1', 'S1') --승용차,SUV
                    AND A.CNT_CD NOT IN ('01') --[20210106_01] kstka 1본 계약고객은 제외
--                    AND REGEXP_LIKE(REPLACE(A.CAR_NO, ' ', ''),'\d{2}[^하|허|호|아|바|사|자\x20]\d{4}') --렌터카(하, 허, 호) 및 영업용(아, 바, 사, 자) 차량 제외 
                    AND REGEXP_LIKE(REPLACE(A.CAR_NO, ' ', ''),'\d{2}[^아|바|사|자\x20]\d{4}') --렌터카(하, 허, 호) 및 영업용(아, 바, 사, 자) 차량 제외 
                    AND NOT EXISTS (SELECT 1 FROM RTCS0207 X WHERE X.ORD_NO = A.ORD_NO AND X.DLV_STAT IN ('01', '04', '06'))
                    ) LOOP
             
            v_Sms_Msg := '';
            
            --가입시 SMS발송                
--            IF CUR.SERV_CD = 'B00011' THEN --조기마모파손보증
--            
--                v_Sms_Msg := '고객님, 넥스트레벨 타이어렌탈 서비스를 이용해 주시어 진심으로 감사드립니다.';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'타이어렌탈 서비스 이용시, 계약기간 내 렌탈 타이어가 파손/조기마모 되어도 타이어를 무상으로 교체 받으실수 있습니다. 넥센타이어가 제공하는 획기적인 서비스를 누려보세요.';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
--                v_Sms_Msg := v_Sms_Msg||'무상 파손/조기마모 보증 서비스 가입을 위해 장착완료일을 기준으로 한달내, 아래 URL을 눌러 사진을 첨부해주세요.';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'(URL주소: https://m.nexen-nextlevel.com/mypage/earlyAbrasionSrvJoin?ordNo=' || CUR.ORD_NO || ')';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'※앞/뒤 타이어가 다른 렌탈고객은 수신된 2건의 보증서비스 가입 문자를 모두 클릭하시어 사진 등록을 해야 합니다.';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'※보증서비스는 사계절용 타이어/승용차/SUV차량에 한하여 제공되며 영업용, 임대용 차량은 서비스가 제한됩니다. 회사에서 제공하는 자세한 보증범위는 넥스트레벨 홈페이지에서 확인할 수 있습니다.';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'https://www.nexen-nextlevel.com/contents/guaranteeSystem';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'※ 보증서비스는 넥스트레벨 홈페이지를 통해서도 가입 가능합니다. (마이페이지 → 나의 렌탈관리 → 상세페이지 → 보증서비스 가입)';
--                
--            ELSIF CUR.SERV_CD = 'B00012' THEN
            
                v_Sms_Msg := '고객님, 넥스트레벨 타이어렌탈 서비스를 이용해 주시어 진심으로 감사드립니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'타이어렌탈 서비스 이용시, 계약기간 내 렌탈 타이어가 파손 되어도 타이어를 무상으로 교체 받으실수 있습니다. 넥센타이어가 제공하는 획기적인 서비스를 누려보세요.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                v_Sms_Msg := v_Sms_Msg||'무상 파손 보증 서비스 가입을 위해 장착완료일을 기준으로 한달내, 아래 URL을 눌러 사진을 첨부해주세요.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'(URL주소: https://m.nexen-nextlevel.com/mypage/newFreeDamageSrvJoin?ordNo=' || CUR.ORD_NO  || ')';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'※앞/뒤 타이어가 다른 렌탈고객은 수신된 2건의 보증서비스 가입 문자를 모두 클릭하시어 사진 등록을 해야 합니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'※보증서비스는 사계절용 타이어/승용차/SUV차량에 한하여 제공되며 영업용, 임대용 차량은 서비스가 제한됩니다. 회사에서 제공하는 자세한 보증범위는 넥스트레벨 홈페이지에서 확인할 수 있습니다.';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||'https://www.nexen-nextlevel.com/contents/guaranteeSystem';
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10);
                v_Sms_Msg := v_Sms_Msg||'※ 보증서비스는 넥스트레벨 홈페이지를 통해서도 가입 가능합니다. (마이페이지 → 나의 렌탈관리 → 상세페이지 → 보증서비스 가입)';
                
--            END IF;
            
            --주문접수완료 SMS 발송
            Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                  'R'                                   /*예약 전송여부    */
                , TO_CHAR(SYSDATE + 12/24,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                , CUR.MOB_NO                            /*받는 전화번호    */
                , '18550100'                            /*보내는 전화번호  */
                , v_Sms_Msg                             /*메시지내용       */
                , 'S051'                                /*사용자지정 필드1 */
                , CUR.ORD_NO                            /*사용자지정 필드2 */
                ,'7'
                ,''
                , 'BATCH'                               /*등록자 ID        */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
        
        END LOOP;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0208.p_batchSms(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0208.p_batchSms(2)', v_ErrorText, v_Return_Message);
  END p_batchSms;
  
  
END Pkg_Rtcs0207;