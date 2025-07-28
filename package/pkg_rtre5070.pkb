CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre5070 AS
/*******************************************************************************
   NAME      Pkg_Rtre5070
   PURPOSE   판매원 수수료 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-09-23  choidh           1. Created this package body.
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가      
   1.1.1      2017-01-24  wjim             [20170124_01] 개별 수수료 실시간 내역 조회 수정
   1.2        2017-05-31  wjim             [20170531_02] 윈터교체수수료 누락 수정
                                           - 실제 전표는 ERP에서 수수료 각 항목의 합으로 생성하므로 실제 지급급액 누락은 없었음 
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.4        2017-10-26  wjim             [20171026_02] 개별 수수료 내역조회 기준 변경
   1.5        2017-12-01  wjim             [20171201_01] 동일일자 2회 이상 윈터교체 수수료 발생건 조회 누락 보완
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.7        2019-02-28  wjim             [20180228_01] 서비스 판매수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료(=인센티브) 분리
   1.9        2025-04-29  10244015         [20250429_01] 판매인 직접주문 추가 판매수수료 부여
   2.0        2025-06-19  10244015         [20250619_01] 프리미엄퍼플점 추가 장착수수료 부여
   2.1        2025-06-20  10244015         [20250620_01] 프리미엄퍼플점 추가 서비스수수료 부여
*******************************************************************************/

  /*****************************************************************************
  -- 판매원 수수료 내역 Count
  *****************************************************************************/
  FUNCTION f_sRtre5070Count(
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,          /*마감년월            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE         /*렌탈전문점          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE5070
    WHERE   SLCM_YM        = v_Slcm_Ym
    AND     AGENCY_CD      = v_Agency_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre5070Count;

  /*****************************************************************************
  -- 판매원 수수료 내역 Select
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  PROCEDURE p_sRtre5070 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Rtslc_Amt      IN RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료      */
    v_Ntslc_Amt      IN RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료        */
    v_Opslc_Amt      IN RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료      */
    v_Tbslc_Amt      IN RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료  */
    v_Procc_Amt      IN RTRE5070.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Lcchc_Amt      IN RTRE5070.LCCHC_AMT%TYPE,      /*위치교환수수료        */
    v_Egolc_Amt      IN RTRE5070.EGOLC_AMT%TYPE,      /*엔진오일교환수수료    */
    v_Wchgc_Amt      IN RTRE5070.WCHGC_AMT%TYPE,      /*교환서비스수수료      */
    v_Rgchk_Amt      IN RTRE5070.RGCHK_AMT%TYPE,      /*방문점검수수료        */
    v_Align_Amt      IN RTRE5070.ALIGN_AMT%TYPE,      /*얼라인먼트수수료      */
    v_Zero_Amt       IN RTRE5070.ZERO_AMT%TYPE,       /*걱정제로장착수수료    */
    v_Apfds_Amt      IN RTRE5070.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Btapfd_Amt     IN RTRE5070.BTAPFD_AMT%TYPE,     /*이전충당금액          */
    v_Mfapfd_Amt     IN RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액    */
    v_Tcomm_Amt      IN RTRE5070.TCOMM_AMT%TYPE,      /*총 수수료액           */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.SLCM_YM,                   /*마감년월            */
            A.AGENCY_CD,                 /*렌탈전문점          */
            A.RTSLC_AMT,                 /*대리점판매수수료    */
            A.NTSLC_AMT,                 /*방문판매수수료      */
            A.OPSLC_AMT,                 /*오픈몰판매수수료    */
            A.TBSLC_AMT,                 /*타이어뱅크판매수수료*/
            A.SVSLC_AMT,                 /*서비스판매수수료    */            
            A.RTSLC_BONUS,               /*대리점판매인센티브  */
            A.NTSLC_BONUS,               /*방문판매인센티브    */
            A.RODIAN_BONUS,              /*로디안판매인센티브  */
            A.PROCC_AMT,                 /*장착수수료          */
            A.LCCHC_AMT,                 /*위치교환수수료      */
            A.EGOLC_AMT,                 /*엔진오일교환수수료  */
            A.WCHGC_AMT,                 /*교환서비스수수료    */
            A.RGCHK_AMT,                 /*방문점검수수료      */
            A.ALIGN_AMT,                 /*얼라인먼트수수료    */
            A.ZERO_AMT,                  /*걱정제로장착수수료  */
            A.APFDS_AMT,                 /*충당설정가능금액    */
            A.BTAPFD_AMT,                /*이전충당금액        */
            A.MFAPFD_AMT,                /*당월충당금설정금액  */
            A.TCOMM_AMT,                 /*총 수수료액         */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTRE5070 A
    WHERE   A.SLCM_YM          = DECODE(v_Slcm_Ym        , NULL, A.SLCM_YM         , v_Slcm_Ym)
    AND     A.AGENCY_CD        = DECODE(v_Agency_Cd      , NULL, A.AGENCY_CD       , v_Agency_Cd)
    AND     A.RTSLC_AMT        = DECODE(v_Rtslc_Amt      , NULL, A.RTSLC_AMT       , v_Rtslc_Amt)
    AND     A.NTSLC_AMT        = DECODE(v_Ntslc_Amt      , NULL, A.NTSLC_AMT       , v_Ntslc_Amt)
    AND     A.OPSLC_AMT        = DECODE(v_Opslc_Amt      , NULL, A.OPSLC_AMT       , v_Opslc_Amt)
    AND     A.TBSLC_AMT        = DECODE(v_Tbslc_Amt      , NULL, A.TBSLC_AMT       , v_Tbslc_Amt)
    AND     A.PROCC_AMT        = DECODE(v_Procc_Amt      , NULL, A.PROCC_AMT       , v_Procc_Amt)
    AND     A.LCCHC_AMT        = DECODE(v_Lcchc_Amt      , NULL, A.LCCHC_AMT       , v_Lcchc_Amt)
    AND     A.EGOLC_AMT        = DECODE(v_Egolc_Amt      , NULL, A.EGOLC_AMT       , v_Egolc_Amt)
    AND     A.WCHGC_AMT        = DECODE(v_Wchgc_Amt      , NULL, A.WCHGC_AMT       , v_Wchgc_Amt)
    AND     A.RGCHK_AMT        = DECODE(v_Rgchk_Amt      , NULL, A.RGCHK_AMT       , v_Rgchk_Amt)
    AND     A.ALIGN_AMT        = DECODE(v_Align_Amt      , NULL, A.ALIGN_AMT       , v_Align_Amt)
    AND     A.ZERO_AMT         = DECODE(v_Zero_Amt       , NULL, A.ZERO_AMT        , v_Zero_Amt)
    AND     A.APFDS_AMT        = DECODE(v_Apfds_Amt      , NULL, A.APFDS_AMT       , v_Apfds_Amt)
    AND     A.BTAPFD_AMT       = DECODE(v_Btapfd_Amt     , NULL, A.BTAPFD_AMT      , v_Btapfd_Amt)
    AND     A.MFAPFD_AMT       = DECODE(v_Mfapfd_Amt     , NULL, A.MFAPFD_AMT      , v_Mfapfd_Amt)
    AND     A.TCOMM_AMT        = DECODE(v_Tcomm_Amt      , NULL, A.TCOMM_AMT       , v_Tcomm_Amt)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtre5070;

  /*****************************************************************************
  -- 판매원 수수료 내역 Insert
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  FUNCTION f_InsertRtre5070 (
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Rtslc_Amt      IN RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료      */
    v_Ntslc_Amt      IN RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료        */
    v_Opslc_Amt      IN RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료      */
    v_Tbslc_Amt      IN RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료  */
    v_Svslc_Amt      IN RTRE5070.SVSLC_AMT%TYPE,      /*서비스판매수수료      */ --[20190611_01]
    v_Rtbns_Amt      IN RTRE5070.RTSLC_BONUS%TYPE,    /*대리점판매인센티브    */ --[20190611_01]
    v_Ntbns_Amt      IN RTRE5070.NTSLC_BONUS%TYPE,    /*방문판매인센티브      */ --[20190611_01]
    v_Rdbns_Amt      IN RTRE5070.RODIAN_BONUS%TYPE,   /*로디안판매인센티브    */ --[20190611_01]
    v_Bonus_Amt      IN RTRE5070.SLC_BONUS%TYPE,      /*판매장려수수료        */ --[20190611_01]
    v_Procc_Amt      IN RTRE5070.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Lcchc_Amt      IN RTRE5070.LCCHC_AMT%TYPE,      /*위치교환수수료        */
    v_Egolc_Amt      IN RTRE5070.EGOLC_AMT%TYPE,      /*엔진오일교환수수료    */
    v_Wchgc_Amt      IN RTRE5070.WCHGC_AMT%TYPE,      /*교환서비스수수료      */
    v_Rgchk_Amt      IN RTRE5070.RGCHK_AMT%TYPE,      /*방문점검수수료        */
    v_Align_Amt      IN RTRE5070.ALIGN_AMT%TYPE,      /*얼라인먼트수수료      */
    v_Zero_Amt       IN RTRE5070.ZERO_AMT%TYPE,       /*걱정제로장착수수료    */
    v_Pick_Amt       IN RTRE5070.PICK_AMT%TYPE,      /*PickUp And Delivery수수료           */
    v_vProcc_Amt      IN RTRE5070.VPROCC_AMT%TYPE,      /*방문장착수수료           */
    v_Fr_Align_Amt     IN RTRE5070.FR_ALIGN_AMT%TYPE,   /*무상얼라인먼트수수료           */
    v_Func_Amt       IN RTRE5070.FUNC_AMT%TYPE,         /*파손보증수수료           */
    v_Erase_Amt      IN RTRE5070.ERASE_AMT%TYPE,        /*조기마모파손보증수수료           */
    v_Apfds_Amt      IN RTRE5070.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Btapfd_Amt     IN RTRE5070.BTAPFD_AMT%TYPE,     /*이전충당금액          */
    v_Mfapfd_Amt     IN RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액    */
    v_Tcomm_Amt      IN RTRE5070.TCOMM_AMT%TYPE,      /*총 수수료액           */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE5070 (
            SLCM_YM,
            AGENCY_CD,
            RTSLC_AMT,
            NTSLC_AMT,
            OPSLC_AMT,
            TBSLC_AMT,
            SVSLC_AMT,    --[20190611_01]
            RTSLC_BONUS,  --[20190611_01]
            NTSLC_BONUS,  --[20190611_01]
            RODIAN_BONUS, --[20190611_01]
            PROCC_AMT,
            LCCHC_AMT,
            EGOLC_AMT,
            WCHGC_AMT,
            RGCHK_AMT,
            ALIGN_AMT,
            ZERO_AMT,
            APFDS_AMT,
            BTAPFD_AMT,
            MFAPFD_AMT,
            TCOMM_AMT,
            AGENCY_NM,   
            SALES_GROUP, 
            SALES_OFFICE,
            TEL_NO,      
            CHAN_CD,     
            LIFNR,       
            TAX_RQCD,    
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            VPROCC_AMT,
            PICK_AMT,
            FR_ALIGN_AMT,
            FUNC_AMT,
            ERASE_AMT
            )
    SELECT  v_Slcm_Ym,
            v_Agency_Cd,
            v_Rtslc_Amt,
            v_Ntslc_Amt,
            v_Opslc_Amt,
            v_Tbslc_Amt,            
            v_Svslc_Amt, --[20190611_01]
            v_Rtbns_Amt, --[20190611_01]
            v_Ntbns_Amt, --[20190611_01]
            v_Rdbns_Amt, --[20190611_01]
            v_Procc_Amt,
            v_Lcchc_Amt,
            v_Egolc_Amt,
            v_Wchgc_Amt,
            v_Rgchk_Amt,
            v_Align_Amt,
            v_Zero_Amt,
            v_Apfds_Amt,
            v_Btapfd_Amt,
            v_Mfapfd_Amt,
            v_Tcomm_Amt,            
            AGENCY_NM,   
            SALES_GROUP, 
            SALES_OFFICE,
            TEL_NO,      
            CHAN_CD,     
            LIFNR,       
            TAX_RQCD,    
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Vprocc_Amt,
            v_Pick_Amt,
            v_Fr_Align_Amt,
            v_Func_Amt,
            v_Erase_Amt
    FROM    RTVIEW02 
    WHERE   AGENCY_CD = v_Agency_Cd;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre5070;

  /*****************************************************************************
  -- 판매원 수수료 내역 Update
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtre5070 (
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Rtslc_Amt      IN RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료      */
    v_Ntslc_Amt      IN RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료        */
    v_Opslc_Amt      IN RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료      */
    v_Tbslc_Amt      IN RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료  */
    v_Svslc_Amt      IN RTRE5070.SVSLC_AMT%TYPE,      /*서비스판매수수료      */ --[20190611_01]
    v_Rtbns_Amt      IN RTRE5070.RTSLC_BONUS%TYPE,    /*대리점판매인센티브    */ --[20190611_01]
    v_Ntbns_Amt      IN RTRE5070.NTSLC_BONUS%TYPE,    /*방문판매인센티브      */ --[20190611_01]
    v_Rdbns_Amt      IN RTRE5070.RODIAN_BONUS%TYPE,   /*로디안판매인센티브    */ --[20190611_01]
    v_Bonus_Amt      IN RTRE5070.SLC_BONUS%TYPE,      /*판매장려수수료        */ --[20190611_01]
    v_Procc_Amt      IN RTRE5070.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Lcchc_Amt      IN RTRE5070.LCCHC_AMT%TYPE,      /*위치교환수수료        */
    v_Egolc_Amt      IN RTRE5070.EGOLC_AMT%TYPE,      /*엔진오일교환수수료    */
    v_Wchgc_Amt      IN RTRE5070.WCHGC_AMT%TYPE,      /*교환서비스수수료      */
    v_Rgchk_Amt      IN RTRE5070.RGCHK_AMT%TYPE,      /*방문점검수수료        */
    v_Align_Amt      IN RTRE5070.ALIGN_AMT%TYPE,      /*얼라인먼트수수료      */
    v_Zero_Amt       IN RTRE5070.ZERO_AMT%TYPE,       /*걱정제로장착수수료    */
    v_Pick_Amt       IN RTRE5070.PICK_AMT%TYPE,      /*PickUp And Delivery수수료           */
    v_vProcc_Amt      IN RTRE5070.VPROCC_AMT%TYPE,      /*방문장착수수료           */
    v_Fr_Align_Amt      IN RTRE5070.FR_ALIGN_AMT%TYPE,      /*무상얼라인먼트수수료           */
    v_Func_Amt       IN RTRE5070.FUNC_AMT%TYPE,       /*파손보증수수료           */
    v_Erase_Amt      IN RTRE5070.ERASE_AMT%TYPE,      /*조기마모파손보증수수료           */
    v_Apfds_Amt      IN RTRE5070.APFDS_AMT%TYPE,      /*충당설정가능금액      */
    v_Btapfd_Amt     IN RTRE5070.BTAPFD_AMT%TYPE,     /*이전충당금액          */
    v_Mfapfd_Amt     IN RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액    */
    v_Tcomm_Amt      IN RTRE5070.TCOMM_AMT%TYPE,      /*총 수수료액           */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE5070
    SET    RTSLC_AMT    = v_Rtslc_Amt,
           NTSLC_AMT    = v_Ntslc_Amt,
           OPSLC_AMT    = v_Opslc_Amt,
           TBSLC_AMT    = v_Tbslc_Amt,           
           SVSLC_AMT    = v_Svslc_Amt,
           RTSLC_BONUS  = v_Rtbns_Amt,
           NTSLC_BONUS  = v_Ntbns_Amt,
           RODIAN_BONUS = v_Rdbns_Amt,           
           PROCC_AMT    = v_Procc_Amt,
           LCCHC_AMT    = v_Lcchc_Amt,
           EGOLC_AMT    = v_Egolc_Amt,
           WCHGC_AMT    = v_Wchgc_Amt,
           RGCHK_AMT    = v_Rgchk_Amt,
           ALIGN_AMT    = v_Align_Amt,
           ZERO_AMT     = v_Zero_Amt,
           PICK_AMT     = v_Pick_Amt,
           VPROCC_AMT   = v_VProcc_Amt,
           FR_ALIGN_AMT = v_Fr_Align_Amt,
           FUNC_AMT     = v_Func_Amt,
           ERASE_AMT    = v_Erase_Amt,
           APFDS_AMT    = v_Apfds_Amt,
           BTAPFD_AMT   = v_Btapfd_Amt,
           MFAPFD_AMT   = v_Mfapfd_Amt,
           TCOMM_AMT    = v_Tcomm_Amt,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE 
    WHERE  SLCM_YM      = v_Slcm_Ym
    AND    AGENCY_CD    = v_Agency_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5070;

  /*****************************************************************************
  -- 판매원 수수료 내역 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre5070 (
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE
    FROM   RTRE5070
    WHERE  SLCM_YM          = v_Slcm_Ym
    AND    AGENCY_CD        = v_Agency_Cd;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '마감년월', v_Slcm_Ym);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '렌탈전문점', v_Agency_Cd);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5010.f_DeleteRtre5010(2)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre5070;

  /*****************************************************************************
  -- 판매원 수수료 내역 관리(IUD)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtre5070 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Slcm_Ym        IN RTRE5070.SLCM_YM%TYPE,        /*마감년월              */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Rtslc_Amt      IN RTRE5070.RTSLC_AMT%TYPE,      /*대리점판매수수료      */
    v_Ntslc_Amt      IN RTRE5070.NTSLC_AMT%TYPE,      /*방문판매수수료        */
    v_Opslc_Amt      IN RTRE5070.OPSLC_AMT%TYPE,      /*오픈몰판매수수료      */
    v_Tbslc_Amt      IN RTRE5070.TBSLC_AMT%TYPE,      /*타이어뱅크판매수수료  */
    v_Svslc_Amt      IN RTRE5070.SVSLC_AMT%TYPE,      /*서비스판매수수료      */ --[20190611_01]
    v_Rtbns_Amt      IN RTRE5070.RTSLC_BONUS%TYPE,    /*대리점판매인센티브    */ --[20190611_01]
    v_Ntbns_Amt      IN RTRE5070.NTSLC_BONUS%TYPE,    /*방문판매인센티브      */ --[20190611_01]
    v_Rdbns_Amt      IN RTRE5070.RODIAN_BONUS%TYPE,   /*로디안판매인센티브    */ --[20190611_01]
    v_Bonus_Amt      IN RTRE5070.SLC_BONUS%TYPE,      /*판매장려수수료        */ --[20190611_01]
    v_Procc_Amt      IN RTRE5070.PROCC_AMT%TYPE,      /*장착수수료            */
    v_Lcchc_Amt      IN RTRE5070.LCCHC_AMT%TYPE,      /*위치교환수수료        */
    v_Egolc_Amt      IN RTRE5070.EGOLC_AMT%TYPE,      /*엔진오일교환수수료    */
    v_Wchgc_Amt      IN RTRE5070.WCHGC_AMT%TYPE,      /*교환서비스수수료      */
    v_Rgchk_Amt      IN RTRE5070.RGCHK_AMT%TYPE,      /*방문점검수수료        */
    v_Align_Amt      IN RTRE5070.ALIGN_AMT%TYPE,      /*얼라인먼트수수료      */
    v_Zero_Amt       IN RTRE5070.ZERO_AMT%TYPE,       /*걱정제로장착수수료    */
    v_Pick_Amt       IN RTRE5070.PICK_AMT%TYPE,      /*PickUp And Delivery수수료           */
    v_vProcc_Amt      IN RTRE5070.VPROCC_AMT%TYPE,      /*방문장착수수료           */
    v_Fr_Align_Amt      IN RTRE5070.FR_ALIGN_AMT%TYPE,      /*무상얼라인먼트수수료           */
    v_Func_Amt       IN RTRE5070.FUNC_AMT%TYPE,         /*파손보증수수료           */
    v_Erase_Amt      IN RTRE5070.ERASE_AMT%TYPE,        /*조기마모파손보증수수료           */
    v_Apfds_Amt      IN RTRE5070.APFDS_AMT%TYPE,      /*충당설정가능금액      */    
    v_Btapfd_Amt     IN RTRE5070.BTAPFD_AMT%TYPE,     /*이전충당금액          */
    v_Mfapfd_Amt     IN RTRE5070.MFAPFD_AMT%TYPE,     /*당월충당금설정금액    */
    v_Tcomm_Amt      IN RTRE5070.TCOMM_AMT%TYPE,      /*총 수수료액           */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 마감년월, 계약번호, 등록자 ID
    IF (TRIM(v_Slcm_Ym) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Slcm_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Agency_Cd) IS NULL) THEN
        v_Return_Message := '렌탈전문점('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF v_Comm_Dvsn IN ('I','U') THEN

        IF (TRIM(v_Rtslc_Amt) IS NULL) THEN
            v_Return_Message := '대리점판매수수료('||v_Rtslc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Ntslc_Amt) IS NULL) THEN
            v_Return_Message := '방문판매수수료('||v_Ntslc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Opslc_Amt) IS NULL) THEN
            v_Return_Message := '오픈몰판매수수료('||v_Opslc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Tbslc_Amt) IS NULL) THEN
            v_Return_Message := '타이어뱅크판매수수료('||v_Tbslc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Procc_Amt) IS NULL) THEN
            v_Return_Message := '장착수수료('||v_Procc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Lcchc_Amt) IS NULL) THEN
            v_Return_Message := '위치교환수수료('||v_Lcchc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Egolc_Amt) IS NULL) THEN
            v_Return_Message := '엔진오일교환수수료('||v_Egolc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Wchgc_Amt) IS NULL) THEN
            v_Return_Message := '교환서비스수수료('||v_Egolc_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    
        IF (TRIM(v_Apfds_Amt) IS NULL) THEN
            v_Return_Message := '충당설정가능금액('||v_Apfds_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Btapfd_Amt) IS NULL) THEN
            v_Return_Message := '이전충당금액('||v_Btapfd_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Mfapfd_Amt) IS NULL) THEN
            v_Return_Message := '당월충당금설정금액('||v_Mfapfd_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF (TRIM(v_Tcomm_Amt) IS NULL) THEN
            v_Return_Message := '총 수수료액('||v_Tcomm_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        -- [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
        IF v_Comm_Dvsn = 'I' THEN
            IF 0 != f_InsertRtre5070( v_Slcm_Ym,    v_Agency_Cd, 
                                      v_Rtslc_Amt,  v_Ntslc_Amt,  v_Opslc_Amt,  v_Tbslc_Amt, 
                                      v_Svslc_Amt,  v_Rtbns_Amt,  v_Ntbns_Amt,  v_Rdbns_Amt, v_Bonus_Amt,
                                      v_Procc_Amt,  v_Lcchc_Amt,  v_Egolc_Amt,  v_Wchgc_Amt, v_Rgchk_Amt, v_Align_Amt, v_Zero_Amt,
                                      v_Pick_Amt, v_vProcc_Amt, v_Fr_Align_Amt, v_Func_Amt, v_Erase_Amt,
                                      v_Apfds_Amt,  v_Btapfd_Amt, v_Mfapfd_Amt, v_Tcomm_Amt, 
                                      v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매인별 수수료 내역 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_UpdateRtre5070( v_Slcm_Ym,    v_Agency_Cd, 
                                      v_Rtslc_Amt,  v_Ntslc_Amt,  v_Opslc_Amt,  v_Tbslc_Amt, 
                                      v_Svslc_Amt,  v_Rtbns_Amt,  v_Ntbns_Amt,  v_Rdbns_Amt, v_Bonus_Amt, 
                                      v_Procc_Amt,  v_Lcchc_Amt,  v_Egolc_Amt,  v_Wchgc_Amt, v_Rgchk_Amt, v_Align_Amt, v_Zero_Amt,
                                      v_Pick_Amt, v_vProcc_Amt, v_Fr_Align_Amt, v_Func_Amt, v_Erase_Amt,
                                      v_Apfds_Amt,  v_Btapfd_Amt, v_Mfapfd_Amt, v_Tcomm_Amt, 
                                      v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매인별 수수료 내역 집계 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        IF 0 != f_DeleteRtre5070( v_Slcm_Ym,  v_Agency_Cd, 
                                  v_Reg_Id,   v_ErrorText
                                 ) THEN
            v_Return_Message := '판매인별 수수료 내역 집계 삭제 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_IUDRtre5070(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_IUDRtre5070(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtre5070;


  /*****************************************************************************
  -- 판매인별 수수료 내역 집계
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.2        2017-05-31  wjim             [20170531_02] 윈터교체수수료 누락 수정
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  PROCEDURE p_CreateRtre5070AgentComm (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre5070 IS
    SELECT  T.AGENCY_CD                 AGENCY_CD,      /*판매원번호           */
            SUM( T.RTSLC_AMT )          RTSLC_AMT,      /*대리점 판매수수료    */ 
            SUM( T.NTSLC_AMT )          NTSLC_AMT,      /*방판 판매수수료      */ 
            SUM( T.OPSLC_AMT )          OPSLC_AMT,      /*오픈몰 판매수수료    */ 
            SUM( T.TBSLC_AMT)           TBSLC_AMT,      /*타어어뱅크 판매수수료*/            
            SUM( T.SVSLC_AMT)           SVSLC_AMT,      /*서비스 판매수수료    */ --[20190611_01]
            SUM( T.SLC_BONUS)           SLC_BONUS,      /*판매장려수수료       */ --[20190611_01]             
            SUM( T.APFDS_AMT )          APFDS_AMT,      /*충당금설정가능금액   */
            SUM( T.PROCC_AMT )          PROCC_AMT,      /*장착수수료           */
            SUM( T.VPROCC_AMT )        VPROCC_AMT,      /*방문장착수수료           */
            SUM( T.LCCHC_AMT )          LCCHC_AMT,      /*위치교환 수수료      */ 
            SUM( T.EGOLC_AMT )          EGOLC_AMT,      /*엔진오일 교환 수수료 */
            SUM( T.WCHGC_AMT )          WCHGC_AMT,      /*교환서비스수수료     */
            SUM( T.RGCHK_AMT )          RGCHK_AMT,      /*방문점검수수료       */
            SUM( T.ALIGN_AMT )          ALIGN_AMT,      /*얼라인먼트수수료     */
            SUM( T.ZERO_AMT  )          ZERO_AMT,       /*걱정제로장착수수료   */
            SUM( T.PICK_AMT  )           PICK_AMT,       /*PickUp And Delivery수수료   */
            SUM( T.FR_ALIGN_AMT  )           FR_ALIGN_AMT,       /*무상얼라인먼트수수료   */
            SUM( T.FUNC_AMT  )           FUNC_AMT,       /*파손보증수수료   */
            SUM( T.ERASE_AMT  )          ERASE_AMT,       /*조기마모파손보증수수료   */
            SUM( T.BTAPFD_AMT )         BTAPFD_AMT      /*이전충담금액         */
    FROM (
            SELECT  A.ORD_AGENT                 AGENCY_CD,      /*판매원번호           */
                    SUM( DECODE( A.COMM_TP, 'A1', A.SSLCM_AMT, 0 ))  RTSLC_AMT,       
                                                                /*대리점 판매수수료    */ 
                    SUM( DECODE( A.COMM_TP, 'A2', A.SSLCM_AMT, 0 ))  NTSLC_AMT,       
                                                                /*방판 판매수수료      */ 
                    SUM( DECODE( A.COMM_TP, 'A3', A.SSLCM_AMT, 0 ))  OPSLC_AMT,       
                                                                /*오픈몰 판매수수료    */ 
                    SUM( DECODE( A.COMM_TP, 'A4', A.SSLCM_AMT, 0 ))  TBSLC_AMT,       
                                                                /*타어어뱅크 판매수수료*/
                    SUM( DECODE( A.COMM_TP, 'A5', A.SSLCM_AMT, 0 ))  SVSLC_AMT,       
                                                                /*서비스 판매수수료    */ 
                    SUM( DECODE( A.COMM_TP, 'A6', A.SSLCM_AMT, 0 ))  SLC_BONUS,       
                                                                /*판매장려수수료       */                                                                   
                    SUM( A.SAPFDS_AMT )         APFDS_AMT,      /*충당금설정가능금액   */
                    0                           PROCC_AMT,      /*장착수수료           */
                    0                           VPROCC_AMT,      /*방문장착수수료           */
                    0                           LCCHC_AMT,      /*위치교환 수수료      */ 
                    0                           EGOLC_AMT,      /*엔진오일 교환 수수료 */
                    0                           WCHGC_AMT,      /*교환서비스수수료     */
                    0                           RGCHK_AMT,      /*방문점검수수료       */
                    0                           ALIGN_AMT,      /*얼라인먼트수수료     */
                    0                           ZERO_AMT,       /*걱정제로장착수수료   */
                    0                           PICK_AMT,        /*PickUp And Delivery수수료   */
                    0                           FR_ALIGN_AMT,  /*무상얼라인먼트수수료   */
                    0                           FUNC_AMT,       /*파손보증수수료   */
                    0                           ERASE_AMT,      /*조기마모파손보증수수료   */
                    0                           BTAPFD_AMT      /*이전충담금액         */
            FROM    RTRE5040 A
            WHERE   A.SLCM_YM = v_Period
            GROUP   BY A.ORD_AGENT
            UNION   ALL    
            SELECT  B.AGENCY_CD                 AGENCY_CD,      /*판매원번호           */
                    0                           RTSLC_AMT,      /*대리점 판매수수료    */ 
                    0                           NTSLC_AMT,      /*방판 판매수수료      */ 
                    0                           OPSLC_AMT,      /*오픈몰 판매수수료    */ 
                    0                           TBSLC_AMT,      /*타어어뱅크 판매수수료*/ 
                    0                           SVSLC_AMT,      /*서비스 판매수수료    */
                    0                           SLC_BONUS,      /*판매장려수수료       */
                    0                           APFDS_AMT,      /*충당금설정가능금액   */
                    SUM( DECODE( B.COMM_TP, 'B1', B.PROCC_AMT, 0 ))  PROCC_AMT,
                    SUM( DECODE( B.COMM_TP, 'B2', B.PROCC_AMT, 0 ))  VPROCC_AMT,
                    0                           LCCHC_AMT,      /*위치교환 수수료      */ 
                    0                           EGOLC_AMT,      /*엔진오일 교환 수수료 */
                    0                           WCHGC_AMT,      /*교환서비스수수료     */
                    0                           RGCHK_AMT,      /*방문점검수수료       */
                    0                           ALIGN_AMT,      /*얼라인먼트수수료     */
                    0                           ZERO_AMT,       /*걱정제로장착수수료   */
                    0                           PICK_AMT,        /*PickUp And Delivery수수료   */
                    0                           FR_ALIGN_AMT,  /*무상얼라인먼트수수료   */
                    0                           FUNC_AMT,       /*파손보증수수료   */
                    0                           ERASE_AMT,      /*조기마모파손보증수수료   */
                    0                           BTAPFD_AMT      /*이전충담금액         */
            FROM    RTRE5050 B
            WHERE   B.SLCM_YM = v_Period
            GROUP   BY B.AGENCY_CD
            UNION   ALL    
            SELECT  C.AGENCY_CD                 AGENCY_CD,      /*판매원번호           */
                    0                           RTSLC_AMT,      /*대리점 판매수수료    */ 
                    0                           NTSLC_AMT,      /*방판 판매수수료      */ 
                    0                           OPSLC_AMT,      /*오픈몰 판매수수료    */ 
                    0                           TBSLC_AMT,      /*타어어뱅크 판매수수료*/ 
                    0                           SVSLC_AMT,      /*서비스 판매수수료    */
                    0                           SLC_BONUS,      /*판매장려수수료       */
                    0                           APFDS_AMT,      /*충당금설정가능금액   */
                    0                           PROCC_AMT,      /*장착수수료           */
                    0                           VPROCC_AMT,    /*방문장착수수료           */
                    SUM( DECODE( C.COMM_TP, 'C1', C.SVCC_AMT, 0 ))  EGOLC_AMT,       
                                                                /*위치교환 수수료 -> 엔진오일 수수료     */ 
                    SUM( DECODE( C.COMM_TP, 'C2', C.SVCC_AMT, 0 ))  LCCHC_AMT,       
                                                                /*엔진오일 교환 수수료 -> 위치교환 수수료 */
                    SUM( DECODE( C.COMM_TP, 'C6', C.SVCC_AMT, 0 ))  WCHGC_AMT,      
                                                                /*교환서비스수수료     */
                    SUM( DECODE( C.COMM_TP, 'C3', C.SVCC_AMT, 0 ))  RGCHK_AMT,      
                                                                /*방문점검수수료       */
                    SUM( DECODE( C.COMM_TP, 'C4', C.SVCC_AMT, 0 ))  ALIGN_AMT,      
                                                                /*얼라인먼트수수료     */
                    SUM( DECODE( C.COMM_TP, 'C5', C.SVCC_AMT, 0 ))  ZERO_AMT,      
                                                                /*걱정제로장착수수료   */ 
                    SUM( DECODE( C.COMM_TP, 'C7', C.SVCC_AMT, 0 ))  PICK_AMT,    
                                                                /*PickUp And Delivery 수수료   */ 
                    SUM( DECODE( C.COMM_TP, 'C8', C.SVCC_AMT, 0 )) FR_ALIGN_AMT,  
                                                               /*무상얼라인먼트수수료   */
                    SUM( DECODE( C.COMM_TP, 'C9', C.SVCC_AMT, 0 )) FUNC_AMT,  
                                                               /*파손보증수수료   */  
                    SUM( DECODE( C.COMM_TP, 'C10', C.SVCC_AMT, 0 )) ERASE_AMT,  
                                                               /*조기마모파손보증수수료   */                                                                                                                                                              
                    0                           BTAPFD_AMT      /*이전충담금액         */
            FROM    RTRE5060 C
            WHERE   C.SLCM_YM = v_Period
            GROUP   BY C.AGENCY_CD 
            UNION   ALL    
            SELECT  D.AGENCY_CD                 AGENCY_CD,      /*판매원번호           */
                    0                           RTSLC_AMT,      /*대리점 판매수수료    */ 
                    0                           NTSLC_AMT,      /*방판 판매수수료      */ 
                    0                           OPSLC_AMT,      /*오픈몰 판매수수료    */ 
                    0                           TBSLC_AMT,      /*타어어뱅크 판매수수료*/ 
                    0                           SVSLC_AMT,      /*서비스 판매수수료    */
                    0                           SLC_BONUS,      /*판매장려수수료       */
                    0                           APFDS_AMT,      /*충당금설정가능금액   */
                    0                           PROCC_AMT,      /*장착수수료           */
                    0                           VPROCC_AMT,      /*방문장착수수료           */
                    0                           LCCHC_AMT,      /*위치교환 수수료      */ 
                    0                           EGOLC_AMT,      /*엔진오일 교환 수수료 */
                    0                           WCHGC_AMT,      /*교환서비스수수료     */
                    0                           RGCHK_AMT,      /*방문점검수수료       */
                    0                           ALIGN_AMT,      /*얼라인먼트수수료     */
                    0                           ZERO_AMT,       /*걱정제로장착수수료   */
                    0                           PICK_AMT,        /*PickUp And Delivery수수료   */
                    0                           FR_ALIGN_AMT,  /*무상얼라인먼트수수료   */
                    0                           FUNC_AMT,       /*파손보증수수료   */
                    0                           ERASE_AMT,      /*조기마모파손보증수수료   */
                    SUM( D.APFD_PAMT ) - SUM( D.APFD_MAMT )     BTAPFD_AMT
                                                                /*이전충담금액         */
            FROM    RTRE5080 D
            GROUP   BY D.AGENCY_CD
            ) T
    WHERE   1=1
--    AND   AGENCY_CD = '110487'           
    GROUP   BY AGENCY_CD;  
    
    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Tcomm_Amt     RTRE5070.TCOMM_AMT%TYPE;
    v_Rtslc_Amt     RTRE5070.RTSLC_AMT%TYPE;      /*대리점판매수수료    */
    v_Ntslc_Amt     RTRE5070.NTSLC_AMT%TYPE;      /*방문판매수수료      */
    v_Opslc_Amt     RTRE5070.OPSLC_AMT%TYPE;      /*오픈몰판매수수료    */
    v_Tbslc_Amt     RTRE5070.TBSLC_AMT%TYPE;      /*타이어뱅크판매수수료*/
    v_Mfapfd_Amt    RTRE5070.MFAPFD_AMT%TYPE;     /*당월충당금설정금액  */
    
  BEGIN


    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) OR (0 <> ISDATE(v_Period)) OR (6 <> LENGTH(TRIM(v_Period))) THEN
        v_Return_Message := '마감월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 이미처리되었는지 확인
    v_curr_cunt := 0;
    BEGIN
    
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5080
        WHERE   APFD_DAY BETWEEN v_Period||'01'
                             AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
        AND     APFD_PAMT > 0
        AND     ROWNUM =  1;
        
        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;
    
    IF v_curr_cunt > 0 THEN
        v_Return_Message := '마감월('||v_Period||') : 충당금 처리된 내역이 존재하여 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    -- 기존자료 삭제
    BEGIN
    
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5070
        WHERE   SLCM_YM = v_Period
        AND     ROWNUM =  1;
        
        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;
    
    IF  v_curr_cunt > 0 THEN
    
        BEGIN
        
            DELETE
            FROM    RTRE5070
            WHERE   SLCM_YM = v_Period;
                
            EXCEPTION
            WHEN OTHERS THEN
                v_curr_cunt := 0;
        END;
        
    END IF;
    
    
    -- 판매인별 수수료 내역 집계 생성
    v_curr_cunt := 0;
    FOR CUR_5070 IN Cur_Rtre5070 LOOP
        EXIT WHEN Cur_Rtre5070%NOTFOUND;

        -- 처리 대상
        v_Tcomm_Amt := CUR_5070.RTSLC_AMT + CUR_5070.NTSLC_AMT   + CUR_5070.OPSLC_AMT   + CUR_5070.TBSLC_AMT
                     + CUR_5070.SVSLC_AMT + CUR_5070.SLC_BONUS
                     + CUR_5070.PROCC_AMT + CUR_5070.LCCHC_AMT
                     + CUR_5070.EGOLC_AMT + CUR_5070.WCHGC_AMT   + CUR_5070.RGCHK_AMT   + CUR_5070.ALIGN_AMT + CUR_5070.ZERO_AMT
                     + CUR_5070.PICK_AMT    + CUR_5070.FR_ALIGN_AMT + CUR_5070.VPROCC_AMT
                     + CUR_5070.FUNC_AMT  + CUR_5070.ERASE_AMT; --[20170531_02][20180326_01][20190611_01] [20200810_01] [20201117_01]
                     
        -- 수수료가 발생한 경우만 저장             
        IF  v_Tcomm_Amt > 0 THEN
        
            v_curr_cunt  := v_curr_cunt + 1;
                        
            /*
            v_Mfapfd_Amt := CUR_5070.BTAPFD_AMT + CUR_5070.APFDS_AMT;
            
            IF v_Mfapfd_Amt > 3000000 THEN
                v_Mfapfd_Amt := 3000000 - CUR_5070.BTAPFD_AMT;
            ELSE
                v_Mfapfd_Amt := CUR_5070.APFDS_AMT;
            END IF;
            
           
            IF 0 != f_InsertRtre5070( v_Period,    CUR_5070.AGENCY_CD, 
                                      CUR_5070.RTSLC_AMT,  CUR_5070.NTSLC_AMT,  CUR_5070.OPSLC_AMT, CUR_5070.TBSLC_AMT,
                                      CUR_5070.PROCC_AMT,  CUR_5070.LCCHC_AMT,  CUR_5070.EGOLC_AMT, CUR_5070.APFDS_AMT,
                                      CUR_5070.BTAPFD_AMT, v_Mfapfd_Amt, v_Tcomm_Amt, 
                                      v_Reg_Id, v_ErrorText
                                     ) THEN

                v_Return_Message := '판매인별 수수료 내역 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
           */ 
           
            -- 충당금 확정처리 - 판매인별 수수료 집계시 계약번호별 충당금 금액을 확정하여 조정
            Pkg_Rtre5040.p_UpdateRtre5040AgentAppFix(v_Period, CUR_5070.AGENCY_CD, CUR_5070.BTAPFD_AMT, v_Reg_Id,
                                                     v_Rtslc_Amt, v_Ntslc_Amt, v_Opslc_Amt, v_Tbslc_Amt,
                                                     v_Mfapfd_Amt, v_Success_Code, v_Return_Message, v_ErrorText);   
                
            IF 0 <> v_Success_Code THEN
                v_Return_Message := '판매인별 수수료 집계시 계약번호별 충당금 금액을 확정하여 조정 실패!!!'||'-'||v_Return_Message;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            v_Tcomm_Amt := v_Rtslc_Amt        + v_Ntslc_Amt          + v_Opslc_Amt          + v_Tbslc_Amt
                         + CUR_5070.SVSLC_AMT + CUR_5070.SLC_BONUS
                         + CUR_5070.PROCC_AMT + CUR_5070.LCCHC_AMT
                         + CUR_5070.EGOLC_AMT + CUR_5070.WCHGC_AMT   + CUR_5070.RGCHK_AMT   + CUR_5070.ALIGN_AMT    + CUR_5070.ZERO_AMT
                         + CUR_5070.PICK_AMT    + CUR_5070.VPROCC_AMT + CUR_5070.FR_ALIGN_AMT
                         + CUR_5070.FUNC_AMT  + CUR_5070.ERASE_AMT; --[20170531_02][20180326_01][20190611_01][20200810_01] [20201117_01]
            dbms_output.put_line(CUR_5070.AGENCY_CD);
            IF 0 != f_InsertRtre5070( v_Period, CUR_5070.AGENCY_CD, v_Rtslc_Amt,  v_Ntslc_Amt,  
                                      v_Opslc_Amt, v_Tbslc_Amt, 
                                      CUR_5070.SVSLC_AMT, NULL, NULL, NULL, CUR_5070.SLC_BONUS,  
                                      CUR_5070.PROCC_AMT, CUR_5070.LCCHC_AMT,
                                      CUR_5070.EGOLC_AMT, CUR_5070.WCHGC_AMT, CUR_5070.RGCHK_AMT, CUR_5070.ALIGN_AMT, CUR_5070.ZERO_AMT,
                                      CUR_5070.PICK_AMT, CUR_5070.VPROCC_AMT, CUR_5070.FR_ALIGN_AMT, CUR_5070.FUNC_AMT, CUR_5070.ERASE_AMT,
                                      CUR_5070.APFDS_AMT, CUR_5070.BTAPFD_AMT, 
                                      v_Mfapfd_Amt, v_Tcomm_Amt, v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매인별 수수료 내역 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
        END IF;         
            
    END LOOP;    
    
    IF Cur_Rtre5070%ISOPEN THEN
        CLOSE Cur_Rtre5070;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre5070%ISOPEN THEN
            CLOSE Cur_Rtre5070;
        END IF;    

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_CreateRtre5070AgentComm(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre5070%ISOPEN THEN
            CLOSE Cur_Rtre5070;
        END IF;    

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_CreateRtre5070AgentComm(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5070AgentComm;


  /*****************************************************************************
  -- 사용자 그룹에 따른 조회 범위 권한 체크 
  *****************************************************************************/
  FUNCTION f_sRtre5070UserInputValueCheck(
    v_Procedure_Nm   IN VARCHAR,                      /*프로시져명            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE          /*등록자 ID             */
    ) RETURN NUMBER IS

    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;
    v_User_Grp   RTCM0001.USER_GRP%TYPE DEFAULT NULL; /*사용자 그룹           */
  BEGIN

    -- 사용자아이디 기준 사용자 그룹 조회
    -- v_User_Grp : 영업관리자(01), 콜센터(02), 지사(03), 지점(04), 대리점(05), 서울사무소(06), 타이어뱅크(07), Mr.Roadian(08), 방문판매(09)
    v_User_Grp := NVL(Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id), ' ');
    
    -- 프로시져명 필수   
    IF  TRIM(v_Procedure_Nm) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '프로시져명('||v_Procedure_Nm||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite(v_Procedure_Nm, v_Reg_Id, v_User_Grp, v_ErrorText);
    END IF;    

    -- 지사 :  지사(03), 지점(04), 대리점(05,07) 사용자인 경우 필수   
    /*
    IF  (v_User_Grp IN ('03','04','05','07')) AND (TRIM(v_Sales_Group) IS NULL) THEN
        v_Serch_Flag := -1;
        v_ErrorText := '지사코드('||v_Sales_Group||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite(v_Procedure_Nm, v_Reg_Id, v_User_Grp, v_ErrorText);
    END IF;
    */
    -- 지점 :  지점(04), 대리점(05,07) 사용자인 경우 필수
    /*    
    IF  (v_User_Grp IN ('04','05','07')) AND (TRIM(v_Sales_Office) IS NULL) THEN
        v_Serch_Flag := -1;
        v_ErrorText := '지점코드('||v_Sales_Office||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite(v_Procedure_Nm, v_Reg_Id, v_User_Grp, v_ErrorText);
    END IF;
    */
    -- 대리점 : 대리점(05,07) 사용자인 경우 필수    
    IF  (v_User_Grp IN ('05','07')) AND (TRIM(v_Agency_Cd) IS NULL) THEN
        v_Serch_Flag := -1;
        v_ErrorText := '렌탈전문점('||v_Agency_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite(v_Procedure_Nm, v_Reg_Id, v_User_Grp, v_ErrorText);
    END IF;

    RETURN v_Serch_Flag;

    EXCEPTION
      WHEN OTHERS THEN
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.f_sRtre5070UserInputValueCheck'||SUBSTR(SQLERRM, 1, 200), v_Agency_Cd, v_Sales_Group, v_Sales_Office, v_Reg_Id);
        RETURN -1;

  END f_sRtre5070UserInputValueCheck;
 
  /*****************************************************************************
  -- 판매인별 수수료 현황 - 판매인별 기간별 수수료 금액을 조회하는 기능
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.3        2017-05-31  wjim             [20170519_01] 방문점검수수료 추가
   1.6        2018-03-26  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
  *****************************************************************************/
  PROCEDURE p_sRtre5070AgentList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Slcm_Fr        IN RTRE5070.SLCM_YM%TYPE,        /*조회일자From          */
    v_Slcm_To        IN RTRE5070.SLCM_YM%TYPE,        /*조회일자To            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;
  BEGIN
              
  
    OPEN Ref_Cursor FOR
SELECT *
  FROM (
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A.SLCM_YM                                                AS SLCM_YM        , /*마감년월       */
            A.SALES_GROUP                                            AS SALES_GROUP    , /*지사           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', A.SALES_GROUP)  AS SALES_GROUP_NM , /*지사명         */
            A.SALES_OFFICE                                           AS SALES_OFFICE   , /*지점           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) AS SALES_OFFICE_NM, /*지점명         */
            A.AGENCY_CD                                              AS AGENCY_CD      , /*판매처코드     */
            A.AGENCY_NM                                              AS AGENCY_NM      , /*판매처명       */
            A.LIFNR                                                  AS LIFNR          , /*벤더코드       */
            A.RTSLC_AMT + A.NTSLC_AMT + A.OPSLC_AMT + A.TBSLC_AMT    AS SALEC_AMT      , /*판매수수료     */
            A.PROCC_AMT                                              AS PROCC_AMT      , /*장착수수료     */
            NVL(A.LCCHC_AMT,0) + NVL(A.EGOLC_AMT,0) + NVL(A.WCHGC_AMT,0) + NVL(A.RGCHK_AMT,0) + NVL(A.ALIGN_AMT,0) + NVL(A.ZERO_AMT,0)    
                                                                     AS SVCC_AMT       , /*서비스수수료   */ --[20170519_01][20180326_01
            A.TCOMM_AMT+NVL(A.RTSLC_BONUS,0)+NVL(A.NTSLC_BONUS,0)+NVL(A.QT_NTSLC_BONUS,0)+NVL(A.RODIAN_BONUS,0) AS TCOMM_AMT      , /*총수수료       */
            A.MFAPFD_AMT                                             AS MFAPFD_AMT     , /*충당금설정금액 */
            A.TAX_RQCD                                               AS TAX_RQCD       , /*계산서발행방법 */
            NVL(A.RTSLC_BONUS,0)                                     AS RTSLC_BONUS    ,
            NVL(A.NTSLC_BONUS,0)                                     AS NTSLC_BONUS    ,
            NVL(A.QT_NTSLC_BONUS,0)                                  AS QT_NTSLC_BONUS ,
            NVL(A.RODIAN_BONUS,0)                                    AS RODIAN_BONUS   ,
            NVL(A.SVSLC_AMT,0)                                       AS SVSLC_AMT      , /*서비스판매수수료*/ --[20190611_01]
            NVL(A.SLC_BONUS,0)                                       AS SLC_BONUS        /*판매장려수수료  */ --[20190611_01]
    FROM    RTRE5070 A
    WHERE   A.SLCM_YM BETWEEN v_Slcm_Fr AND v_Slcm_To        
    AND     A.AGENCY_CD     = DECODE( v_Agency_Cd, NULL, A.AGENCY_CD, v_Agency_Cd )          
    ORDER   BY A.SLCM_YM, A.AGENCY_CD
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
 ) A
    WHERE 1=1
      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1

    ;  
            
            
  END p_sRtre5070AgentList;
  

  /*****************************************************************************
  -- 개별 수수료 내역 조회 - 수수료 항목별 상세 내역을 조회한다.
      
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2016-04-21  이영근           채널 대/중분류 항목 추가
   1.5        2017-12-01  wjim             [20171201_01] 동일일자 2회 이상 윈터교체 수수료 발생건 조회 누락 보완
  *****************************************************************************/
  PROCEDURE p_sRtre5070ChargeList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_DayF      IN RTRE5040.PROC_DAY%TYPE,       /*조회일자From          */
    v_Proc_DayT      IN RTRE5040.PROC_DAY%TYPE,       /*조회일자To            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*사용자 ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    ) IS
    
    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;
    
    v_Org_Main_Yn    RTSD0113.ORG_MAIN_YN%TYPE := 'N';
    v_Org_Com_Cd     RTSD0113.ORG_COM_CD%TYPE;
    
    v_User_Grp       RTCM0001.USER_GRP%TYPE;

  BEGIN
    
    IF TRIM(v_Proc_DayF) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '조회일자From('||v_Proc_DayF||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_sRtre5070ChargeList(1)', v_ErrorText);
    END IF;
        
    IF TRIM(v_Proc_DayT) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '조회일자To('||v_Proc_DayT||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_sRtre5070ChargeList(1)', v_ErrorText);
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '사용자 ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_sRtre5070ChargeList(1)', v_ErrorText);
    END IF;
        

    -- 사용자 그룹에 따른 조회 범위 권한 체크 
    v_Serch_Flag := f_sRtre5070UserInputValueCheck('Pkg_Rtre5070.p_sRtre5070ChargeList',v_Agency_Cd, v_Sales_Group, v_Sales_Office, v_Reg_Id);
  
     
    --[20210309_01] kstka 판매인 그룹별로 조회
    IF v_Agency_Cd IS NOT NULL THEN
    
        SELECT USER_GRP 
        INTO v_User_Grp
        FROM RTCM0001
        WHERE USER_ID = v_Reg_Id;
        
        --Mr.Roadian인 경우
        IF v_User_Grp = '08' THEN
        
            SELECT NVL(ORG_MAIN_YN, 'N'), ORG_COM_CD 
            INTO v_Org_Main_Yn, v_Org_Com_Cd
            FROM RTSD0113
            WHERE ORD_AGENT = (SELECT ORD_AGENT FROM RTCS0002 WHERE CARMASTER_NU = v_Reg_Id);
            
        ELSIF v_User_Grp IN ('03', '09') THEN
        
            SELECT NVL(ORG_MAIN_YN, 'N'), ORG_COM_CD 
            INTO v_Org_Main_Yn, v_Org_Com_Cd
            FROM RTSD0113
            WHERE ORD_AGENT = v_Reg_Id;
        
        END IF;
        
    END IF;  
    
    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  B.SALES_GROUP                                             AS SALES_GROUP,     /* 지사           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S018', B.SALES_GROUP ) AS SALES_GROUP_NM,  /* 지사명         */
            B.SALES_OFFICE                                            AS SALES_OFFICE,    /* 지점           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S019', B.SALES_OFFICE) AS SALES_OFFICE_NM, /* 지점명         */
            A.AGENCY_CD                                               AS AGENCY_CD,       /* 판매처코드     */
            B.AGENCY_NM                                               AS AGENCY_NM,       /* 판매처명       */
            B.LIFNR                                                   AS LIFNR,           /* 벤더코드       */            
            B.TAX_RQCD                                                AS TAX_RQCD,        /*세금계산서발행법*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S079', B.TAX_RQCD)     AS TAX_RQCD_NM,     /*세금계산서발행법*/
            A.CHAN_CD                                                 AS CHAN_CD,         /* 채널코드       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S030', A.CHAN_CD )     AS CHAN_NM,         /* 채널명         */
            A.ORD_NO                                                  AS ORD_NO,          /* 계약번호       */
            A.CUST_NO                                                 AS CUST_NO,         /* 고객번호       */
            Pkg_Rtsd0100.f_sRtsd0100CustName( A.CUST_NO )             AS CUST_NM,         /* 고객명         */
            A.COMM_TP                                                 AS COMM_TP,         /* 수수료항목코드 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R042', A.COMM_TP )     AS COMM_NM,         /* 수수료항목명   */
            A.COMM_AMT                                                AS COMM_AMT,        /* 수수료금액     */
            A.COMM_DAY                                                AS COMM_DAY,        /* 수수료기준일자 */
            A.MAT_CD                                                  AS MAT_CD,          /* 상품코드       */
            Pkg_Rtsd0005.f_sRtsd0005MatName( A.MAT_CD )               AS MAT_NM,          /* 상품명         */
            A.CNT_CD                                                  AS CNT_CD,          /* 타이어본수     */
            B.CHAN_LCLS_CD                                            AS CHAN_LCLS_CD,    /*채널 대분류 코드 */
            B.CHAN_MCLS_CD                                            AS CHAN_MCLS_CD,    /*채널 중분류 코드 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S090', B.CHAN_LCLS_CD ) AS CHAN_LCLS_NM,   /*채널 대분류명   */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S091', B.CHAN_MCLS_CD ) AS CHAN_MCLS_NM    /*채널 중분류명   */            
    FROM    (        
            SELECT  ORD_AGENT AGENCY_CD,        
                    CHAN_CD,        
                    ORD_NO,        
                    CUST_NO,        
                    COMM_TP,        
                    SLCM_AMT COMM_AMT,        
                    PROC_DAY COMM_DAY,        
                    MAT_CD,        
                    CNT_CD        
            FROM    RTRE5040        
            WHERE   v_Serch_Flag = 0
            AND     PROC_DAY BETWEEN v_Proc_DayF AND v_Proc_DayT  
            AND   (  
                    (v_Org_Main_Yn = 'Y' AND ORD_AGENT IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd))
            OR      (v_Org_Main_Yn = 'N' AND ORD_AGENT   = DECODE( v_Agency_Cd, NULL, ORD_AGENT, v_Agency_Cd ))
                  )  --[20210309_01] kstka 판매인 그룹별로 조회    
--            AND     ORD_AGENT   = DECODE( v_Agency_Cd, NULL, ORD_AGENT, v_Agency_Cd )      
            AND     CHAN_CD     = DECODE( v_Chan_Cd, NULL, CHAN_CD, v_Chan_Cd )        
            AND     COMM_TP     = DECODE( v_Comm_Tp, NULL, COMM_TP, v_Comm_Tp )        
            UNION   ALL                                                         -- [20171201_01] 에 의해 UNION > UNION ALL 로 변경      
            SELECT  AGENCY_CD,        
                    CHAN_CD,        
                    ORD_NO,        
                    CUST_NO,        
                    COMM_TP,        
                    PROCC_AMT COMM_AMT,        
                    PROC_DAY COMM_DAY,        
                    MAT_CD,        
                    CNT_CD        
            FROM    RTRE5050        
            WHERE   v_Serch_Flag = 0
            AND     PROC_DAY BETWEEN v_Proc_DayF AND v_Proc_DayT   
            AND   (  
                    (v_Org_Main_Yn = 'Y' AND AGENCY_CD IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd))
            OR      (v_Org_Main_Yn = 'N' AND AGENCY_CD   = DECODE( v_Agency_Cd, NULL, AGENCY_CD, v_Agency_Cd ))
                  )     --[20210309_01] kstka 판매인 그룹별로 조회   
--            AND     AGENCY_CD   = DECODE( v_Agency_Cd, NULL, AGENCY_CD, v_Agency_Cd )        
            AND     CHAN_CD     = DECODE( v_Chan_Cd, NULL, CHAN_CD, v_Chan_Cd )        
            AND     COMM_TP     = DECODE( v_Comm_Tp, NULL, COMM_TP, v_Comm_Tp )        
            UNION   ALL                                                         -- [20171201_01] 에 의해 UNION > UNION ALL 로 변경
            SELECT  AGENCY_CD,        
                    CHAN_CD,        
                    ORD_NO,        
                    CUST_NO,        
                    COMM_TP,             
                    SVCC_AMT COMM_AMT,        
                    SVCP_DAY COMM_DAY,        
                    MAT_CD,        
                    CNT_CD        
            FROM    RTRE5060        
            WHERE   v_Serch_Flag = 0
            AND     SVCP_DAY BETWEEN v_Proc_DayF AND v_Proc_DayT 
            AND   (  
                    (v_Org_Main_Yn = 'Y' AND AGENCY_CD IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd))
            OR      (v_Org_Main_Yn = 'N' AND AGENCY_CD   = DECODE( v_Agency_Cd, NULL, AGENCY_CD, v_Agency_Cd ))
                  )   --[20210309_01] kstka 판매인 그룹별로 조회     
--            AND     AGENCY_CD   = DECODE( v_Agency_Cd, NULL, AGENCY_CD, v_Agency_Cd )        
            AND     CHAN_CD     = DECODE( v_Chan_Cd, NULL, CHAN_CD, v_Chan_Cd )        
            AND     COMM_TP     = DECODE( v_Comm_Tp, NULL, COMM_TP, v_Comm_Tp )        
            ) A, 
            RTVIEW03 B    -- 2016-06-03 이영근, VIEW테이블 변경    
    WHERE   A.AGENCY_CD     = B.AGENCY_CD  
    /* Group 및 Office가 Null인 경우 조회가 안됨20160415 한승훈       
    AND     B.SALES_GROUP   = DECODE( v_Sales_Group,  NULL, B.SALES_GROUP,  v_Sales_Group  )        
    AND     B.SALES_OFFICE  = DECODE( v_Sales_Office, NULL, B.SALES_OFFICE, v_Sales_Office );  */
    AND     (v_Sales_Group IS NULL OR (v_Org_Main_Yn = 'N' AND v_Sales_Group IS NOT NULL AND B.SALES_GROUP = v_Sales_Group))   /*20160415 변경 한승훈        */
    AND     (v_Sales_Office IS NULL OR (v_Org_Main_Yn = 'N' AND v_Sales_Office IS NOT NULL AND B.SALES_OFFICE = v_Sales_Office))   /*20160415 변경 한승훈        */
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
     ) A
    WHERE 1=1
      AND (
            (v_Org_Main_Yn = 'Y' AND 1=1) OR
            (v_Org_Main_Yn = 'N' AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP )))
          )
      AND (
            (v_Org_Main_Yn = 'Y' AND 1=1) OR
            (v_Org_Main_Yn = 'N' AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE )))
          )
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
--                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
                 WHEN ((v_Org_Main_Yn = 'Y' AND A.USER_ID IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd)) OR
                      (v_Org_Main_Yn = 'N' AND v_LOGIN_ID = A.USER_ID)) THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
--                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
                 WHEN ((v_Org_Main_Yn = 'Y' AND A.USER_ID IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd)) OR
                      (v_Org_Main_Yn = 'N' AND v_LOGIN_ID = A.USER_ID)) THEN 1
            ELSE 0 END
      ) = 1

    ;
    
  END p_sRtre5070ChargeList;
  

  /*****************************************************************************
  -- 개별 수수료 실시간 내역 조회 - 수수료 항목별 상세 내역을 조회한다.
  -- - 실제 월마감 시 집계기준과 동일해야 함

  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0.1      2016-04-29  이영근           채널대/중분류별 데이터 가져오도록 수정
   1.0.2      2016-05-02  이영근           서비스수수료 가져오는 로직 수정
   1.0.3      2016-07-08  이영근           채널 대/중분류 컬럼 추가  
   1.0.4      2017-01-10  kstka            윈터교체 서비스 수수료 * 본수
   1.1.1      2017-01-24  wjim             [20170124_01] 서비스수수료 조회기준 변경
   1.4        2017-10-26  wjim             [20171026_02] 개별 수수료 내역조회 기준 변경
                                           - 당월 중도완납 및 해지 지급대상에 포함
   1.6        2018-03-29  wjim             [20180326_01] 얼라인먼트 수수료, 걱정제로 장착 수수료 추가
   1.7        2019-02-28  wjim             [20180228_01] 서비스 판매수수료 추가
   1.9        2025-04-29  10244015         [20250429_01] 판매인 직접주문 추가 판매수수료 부여
   2.0        2025-06-19  10244015         [20250619_01] 프리미엄퍼플점 추가 장착수수료 부여
   2.1        2025-06-20  10244015         [20250620_01] 프리미엄퍼플점 추가 서비스수수료 부여
  *****************************************************************************/
  PROCEDURE p_sRtre5070ChargeRealList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_DayF      IN RTRE5040.PROC_DAY%TYPE,       /*조회일자From          */
    v_Proc_DayT      IN RTRE5040.PROC_DAY%TYPE,       /*조회일자To            */
    v_Agency_Cd      IN RTRE5070.AGENCY_CD%TYPE,      /*렌탈전문점            */
    v_Sales_Group    IN RTSD0007.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTSD0007.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Chan_Cd        IN RTRE5040.CHAN_CD%TYPE,        /*채널구분              */
    v_Comm_Tp        IN RTRE5040.COMM_TP%TYPE,        /*수수료항목            */
    v_Reg_Id         IN RTRE5040.REG_ID%TYPE,         /*사용자 ID             */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    ) IS

    v_Serch_Flag NUMBER DEFAULT 0;
    v_ErrorText  VARCHAR2(2000) DEFAULT NULL;

    v_Org_Main_Yn  RTSD0113.ORG_MAIN_YN%TYPE := 'N';
    v_Org_Com_Cd   RTSD0113.ORG_COM_CD%TYPE;
    
    v_User_Grp     RTCM0001.USER_GRP%TYPE;
    
  BEGIN
    
    IF TRIM(v_Proc_DayF) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '조회일자From('||v_Proc_DayF||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_sRtre5070ChargeRealList(1)', v_ErrorText);
    END IF;
        
    IF TRIM(v_Proc_DayT) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '조회일자To('||v_Proc_DayT||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_sRtre5070ChargeRealList(1)', v_ErrorText);
    END IF;
    
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Serch_Flag := -1;
        v_ErrorText := '사용자 ID('||v_Reg_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_sRtre5070ChargeRealList(1)', v_ErrorText);
    END IF;
        
    -- 사용자 그룹에 따른 조회 범위 권한 체크 
    v_Serch_Flag := f_sRtre5070UserInputValueCheck('Pkg_Rtre5070.p_sRtre5070ChargeRealList',v_Agency_Cd, v_Sales_Group, v_Sales_Office, v_Reg_Id);
    
    --[20210309_01] kstka 판매인 그룹별로 조회
    IF v_Agency_Cd IS NOT NULL THEN
    
        SELECT USER_GRP 
        INTO v_User_Grp
        FROM RTCM0001
        WHERE USER_ID = v_Reg_Id;
        
        --Mr.Roadian인 경우
        IF v_User_Grp = '08' THEN
        
            SELECT NVL(ORG_MAIN_YN, 'N'), ORG_COM_CD 
            INTO v_Org_Main_Yn, v_Org_Com_Cd
            FROM RTSD0113
            WHERE ORD_AGENT = (SELECT ORD_AGENT FROM RTCS0002 WHERE CARMASTER_NU = v_Reg_Id);
            
        ELSIF v_User_Grp IN ('03', '09') THEN
        
            SELECT NVL(ORG_MAIN_YN, 'N'), ORG_COM_CD 
            INTO v_Org_Main_Yn, v_Org_Com_Cd
            FROM RTSD0113
            WHERE ORD_AGENT = v_Reg_Id;
        
        END IF;
        
    END IF;  
    
    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (    
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  B.SALES_GROUP                                             AS SALES_GROUP,     /* 지사           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S018', B.SALES_GROUP ) AS SALES_GROUP_NM,  /* 지사명         */
            B.SALES_OFFICE                                            AS SALES_OFFICE,    /* 지점           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S019', B.SALES_OFFICE) AS SALES_OFFICE_NM, /* 지점명         */
            A.AGENCY_CD                                               AS AGENCY_CD,       /* 판매처코드     */
            B.AGENCY_NM                                               AS AGENCY_NM,       /* 판매처명       */
            B.LIFNR                                                   AS LIFNR,           /* 벤더코드       */           
            B.TAX_RQCD                                                AS TAX_RQCD,        /*세금계산서발행법*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S079', B.TAX_RQCD)     AS TAX_RQCD_NM,     /*세금계산서발행법*/
            A.CHAN_CD                                                 AS CHAN_CD,         /* 채널코드       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S030', A.CHAN_CD )     AS CHAN_NM,         /* 채널명         */
            A.ORD_NO                                                  AS ORD_NO,          /* 계약번호       */
            A.CUST_NO                                                 AS CUST_NO,         /* 고객번호       */
            Pkg_Rtsd0100.f_sRtsd0100CustName( A.CUST_NO )             AS CUST_NM,         /* 고객명         */
            A.COMM_TP                                                 AS COMM_TP,         /* 수수료항목코드 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R042', A.COMM_TP )     AS COMM_NM,         /* 수수료항목명   */
            A.COMM_AMT                                                AS COMM_AMT,        /* 수수료금액     */
            A.COMM_DAY                                                AS COMM_DAY,        /* 수수료기준일자 */
            A.MAT_CD                                                  AS MAT_CD,          /* 상품코드       */
            Pkg_Rtsd0005.f_sRtsd0005MatName( A.MAT_CD )               AS MAT_NM,          /* 상품명         */
            A.CNT_CD                                                  AS CNT_CD,          /* 타이어본수     */
            B.CHAN_LCLS_CD                                            AS CHAN_LCLS_CD,    /*채널 대분류 코드 */
            B.CHAN_MCLS_CD                                            AS CHAN_MCLS_CD,    /*채널 중분류 코드 */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S090', B.CHAN_LCLS_CD ) AS CHAN_LCLS_NM,   /*채널 대분류명   */
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S091', B.CHAN_MCLS_CD ) AS CHAN_MCLS_NM    /*채널 중분류명   */
    FROM    (    
            SELECT  DECODE( A.CHAN_CD, '01', A.AGENCY_CD, '05', A.AGENCY_CD, A.ORD_AGENT) AGENCY_CD,
                    A.CHAN_CD,
                    A.ORD_NO,
                    A.CUST_NO,
                    CASE WHEN A.CHAN_CD = '01' THEN 'A1'
                    WHEN A.CHAN_CD = '03' THEN 'A2'
                    WHEN A.CHAN_CD = '04' THEN 'A3'
                    WHEN A.CHAN_CD = '05' THEN 'A4'
                    END COMM_TP,
                    CASE WHEN A.ORD_AGENT = G.REG_ID AND A.ORD_AGENT = H.CD THEN (C.SLCM_AMT * TO_NUMBER( A.CNT_CD )) + (TO_NUMBER(H.CD_DESC) * TO_NUMBER( A.CNT_CD ))
					ELSE  C.SLCM_AMT * TO_NUMBER( A.CNT_CD )
					END COMM_AMT, 				  --[20250429_01] 판매인 직접주문 추가 판매수수료 부여
                    A.PROC_DAY COMM_DAY,
                    B.MAT_CD,
                    A.CNT_CD
            FROM    RTSD0108 A, -- 장착 정보
                    RTCS0001 B, -- 설비 정보
                    RTRE5010 C, -- 판매수수료 조견표
                    RTSD0007 E, 
                    RTSD0113 F,
                    RTSD0104 G,
                   	RTCM0051 H
            WHERE   v_Serch_Flag = 0
            AND     A.PROC_DAY   BETWEEN v_Proc_DayF AND v_Proc_DayT
            AND     A.CHAN_CD    = DECODE( v_Chan_Cd, NULL, A.CHAN_CD, v_Chan_Cd )
--            AND     A.MFP_YN    <> 'Y'          --[20171026_02]에 의해 주석처리
--            AND     NVL(A.END_TP,'N') <> 'C'    --[20171026_02]에 의해 주석처리
            AND     A.ORD_NO     = B.ORD_NO
            AND     A.CHAN_CD   IN ( '01', '03', '05' )
            AND     C.CHAN_CD    = A.CHAN_CD
            AND     C.MAT_CD     = B.MAT_CD
            AND     C.STR_DAY   <= A.PROC_DAY
            AND     C.END_DAY   >= A.PROC_DAY
            AND     C.USE_YN     = 'Y'
            AND     A.AGENCY_CD  = E.AGENCY_CD(+)
            AND     A.ORD_AGENT  = F.ORD_AGENT(+)            
            AND     DECODE(A.CHAN_CD,'03',F.CHAN_LCLS_CD,E.CHAN_LCLS_CD) = C.CHAN_LCLS_CD     
            AND     DECODE(A.CHAN_CD,'03',F.CHAN_MCLS_CD,E.CHAN_MCLS_CD) = C.CHAN_MCLS_CD
            AND		A.ORD_NO = G.ORD_NO
            AND 	H.CD_GRP_CD(+) = 'R083'
		    AND 	DECODE(A.CHAN_CD,'03',A.ORD_AGENT, NULL) = H.CD(+)
            UNION   ALL
            SELECT  A.ORD_AGENT AGENCY_CD,
                    A.CHAN_CD,
                    A.ORD_NO,
                    A.CUST_NO,
                    'A3' COMM_TP,
                    C.SLCM_AMT COMM_AMT,
                    A.PROC_DAY COMM_DAY,
                    B.MAT_CD,
                    A.CNT_CD
            FROM    RTSD0108 A, -- 장착 정보
                    RTCS0001 B, -- 설비 정보
                    RTRE5011 C  -- 오픈몰 판매수수료 조견표
            WHERE   v_Serch_Flag = 0
            AND     A.PROC_DAY   BETWEEN v_Proc_DayF AND v_Proc_DayT
            AND     A.CHAN_CD    = DECODE( v_Chan_Cd, NULL, CHAN_CD, v_Chan_Cd )
--            AND     A.MFP_YN    <> 'Y'          --[20171026_02]에 의해 주석처리
--            AND     NVL(A.END_TP,'N') <> 'C'    --[20171026_02]에 의해 주석처리
            AND     A.ORD_NO     = B.ORD_NO
            AND     A.CHAN_CD    = '04'
            AND     C.ORD_AGENT  = A.ORD_AGENT
            AND     C.STR_DAY   <= A.PROC_DAY
            AND     C.END_DAY   >= A.PROC_DAY
            AND     C.USE_YN     = 'Y'
            UNION   ALL
            -- 서비스 판매수수료 [20180228_01]
            SELECT  A2.AGENCY_CD
                 ,  A2.CHAN_CD
                 ,  A2.ORD_NO
                 ,  A2.CUST_NO
                 ,  'A5'           AS COMM_TP
                 ,  A2.SUM_PER_AMT AS COMM_AMT
                 ,  A2.PROC_DAY    AS COMM_DAY
                 ,  B2.MAT_CD
                 ,  A2.CNT_CD
              FROM  (
                        SELECT  A1.CUST_NO
                             ,  A1.ORD_NO                 
                             ,  A1.CHAN_CD
                             ,  A1.AGENCY_CD
                             ,  A1.PROC_DAY
                             ,  A1.CNT_CD
                             ,  SUM(PER_AMT) AS SUM_PER_AMT
                          FROM  RTSD0108 A1
                             ,  RTSD0013 B1
                             ,  RTRE5110 C1
                         WHERE  0 = 0
                           AND  A1.PROC_DAY  BETWEEN v_Proc_DayF AND v_Proc_DayT
                           AND  A1.PS_CD     = '999999'       --렌탈고도화(2019.02.07) 이후만 적용
                           AND  A1.CHAN_CD   IN ('01')        --적용채널 : 대리점에만 적용
                           AND  A1.ORD_NO    = B1.ORD_NO
                           AND  B1.PRS_DCD   = C1.SERVICE_CD
                           AND  B1.SERV_CNT0 = C1.SERVICE_CNT   
                           AND  C1.USE_YN    = 'Y'
                           AND  C1.STR_DAY  <= A1.PROC_DAY
                           AND  C1.END_DAY  >= A1.PROC_DAY
                         GROUP  BY A1.CUST_NO
                             ,  A1.ORD_NO                 
                             ,  A1.CHAN_CD
                             ,  A1.AGENCY_CD
                             ,  A1.PROC_DAY
                             ,  A1.CNT_CD
                    ) A2
                 ,  RTCS0001 B2
             WHERE  1=1
               AND  A2.ORD_NO = B2.ORD_NO   
            UNION   ALL            
            SELECT  A.AGENCY_CD,
                    A.CHAN_CD,
                    A.ORD_NO,
                    A.CUST_NO,
                    'B1' COMM_TP,
                    --C.PRCM_AMT * TO_NUMBER( A.CNT_CD ) COMM_AMT,	--[20250619_01]에 의해 주석처리
                    CASE WHEN D.PREM_PRPL_YN = 'Y' THEN C.PRCM_AMT * TO_NUMBER( A.CNT_CD ) + TO_NUMBER((SELECT DECODE(MAX(G.CD_DESC), NULL, '0', MAX(G.CD_DESC))
																										  FROM RTCM0051 G
																										 WHERE G.CD_GRP_CD = 'R084'
																								           AND E.TOT_EVAL_POINT >= G.CD)) * TO_NUMBER( A.CNT_CD )
					     ELSE C.PRCM_AMT * TO_NUMBER( A.CNT_CD )
                    END COMM_AMT,		--[20250619_01] 프리미엄퍼플점 추가 장착수수료 부여
                    A.PROC_DAY COMM_DAY,
                    B.MAT_CD,
                    A.CNT_CD
            FROM    RTSD0108 A, -- 장착 정보
                    RTCS0001 B, -- 설비 정보
                    RTRE5020 C, -- 장착수수료 조견표
                    RTSD0007 D,
                    (SELECT AGENCY_CD
						  , ROUND(AVG(TOT_EVAL_POINT),1) AS TOT_EVAL_POINT
					   FROM RTCS0130														--[20250619_01] 프리미엄퍼플점을 위한 만족도조사 평점
					  WHERE 1=1
						AND DP_YN = 'Y'
						AND TO_CHAR(SUBT_DAY,'YYYYMM') BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-3),'YYYYMM') AND TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM')
					  GROUP BY AGENCY_CD
				    ) E
            WHERE   v_Serch_Flag   = 0
            AND     A.PROC_DAY     BETWEEN v_Proc_DayF AND v_Proc_DayT
            AND     A.CHAN_CD      = DECODE( v_Chan_Cd, NULL, CHAN_CD, v_Chan_Cd )
--            AND     A.MFP_YN      <> 'Y'          --[20171026_02]에 의해 주석처리
--            AND     NVL(A.END_TP,'N') <> 'C'      --[20171026_02]에 의해 주석처리
            AND     A.ORD_NO       = B.ORD_NO
            AND     A.CHAN_CD NOT IN ( '01', '05' )
            AND     C.MAT_CD       = B.MAT_CD
            AND     C.STR_DAY     <= A.PROC_DAY
            AND     C.END_DAY     >= A.PROC_DAY
            AND     C.USE_YN       = 'Y'  
            AND     A.AGENCY_CD    = D.AGENCY_CD    
            AND     C.CHAN_LCLS_CD = D.CHAN_LCLS_CD
            AND     C.CHAN_MCLS_CD = D.CHAN_MCLS_CD
            AND		A.AGENCY_CD    = E.AGENCY_CD(+)
            UNION   ALL
            SELECT  H.AGENCY_CD,
                    C.CHAN_CD,
                    A.ORD_NO,
                    C.CUST_NO,
--                    DECODE(B.SERVICE_CD,'B00001','C1','B00002','C2','B00006','C6') COMM_TP, --[20180326_01]
                    DECODE(B.SERVICE_CD,'B00001','C1','B00002','C2','B00006','C6','B00008','C4','B00007','C5','B00009','C8', 'B00011', 'C9', 'B00012', 'C10') COMM_TP,
                    (SELECT CASE
	                    	  WHEN SERVICE_CD = 'B00002' AND H.PREM_PRPL_YN = 'Y' THEN G.SVCM_AMT + TO_NUMBER((SELECT DECODE(MAX(G.CD_DESC), NULL, '0', MAX(G.CD_DESC)) 
																											     FROM RTCM0051 G
																											    WHERE G.CD_GRP_CD = 'R085'
																											      AND K.TOT_EVAL_POINT >= G.CD))  --[20250620_01] 프리미엄퍼플점 추가 서비스수수료 부여
                              WHEN SERVICE_CD = 'B00006' THEN G.SVCM_AMT * C.CNT_CD 
                              WHEN SERVICE_CD = 'B00007' THEN G.SVCM_AMT * I.KWMENG
                              WHEN SERVICE_CD = 'B00011' THEN G.SVCM_AMT * J.KWMENG
                              WHEN SERVICE_CD = 'B00012' THEN G.SVCM_AMT * J.KWMENG
                              ELSE G.SVCM_AMT 
                            END 
                       FROM RTRE5030 G 
                      WHERE G.SERVICE_CD = B.SERVICE_CD 
                        AND G.USE_YN = 'Y'
                        AND A.PROC_DAY BETWEEN G.STR_DAY AND G.END_DAY 
                        AND G.CHAN_LCLS_CD      = DECODE(B.SERVICE_CD, 'B00001', H.CHAN_LCLS_CD, G.CHAN_LCLS_CD)
                        AND G.CHAN_MCLS_CD      = DECODE(B.SERVICE_CD, 'B00001', H.CHAN_MCLS_CD, G.CHAN_MCLS_CD)
                        AND NVL(G.CLASS_CD,' ') = DECODE(B.SERVICE_CD, 'B00001', E.CLASS_CD    , ' ')
                        AND NVL(G.MAT_CD  ,' ') = DECODE(B.SERVICE_CD, 'B00006', F.MAT_CD, 'B00007', F.MAT_CD      , 'B00011', F.MAT_CD, 'B00012', F.MAT_CD, ' ')  
                        AND NVL(G.PS_CD   ,' ') = DECODE(B.SERVICE_CD, 'B00001', C.PS_CD       , ' ') --[20180326_01]
                        AND NVL(G.CAR_TYPE   ,' ') = DECODE(B.SERVICE_CD, 'B00008', SUBSTR(C.MAKER_CD, 0, 1)       , 'B00009', SUBSTR(C.MAKER_CD, 0, 1)       , ' ') --[20200811_01]
                    ) AS COMM_AMT,                   
                    A.PROC_DAY COMM_DAY,
                    D.MAT_CD,
                    C.CNT_CD
            FROM    RTCS0007 A, -- 서비스 처리내역
                    RTCS0008 B, -- 서비스 처리내역 상세
                    RTSD0108 C, -- 장착 정보
                    RTCS0001 D, -- 설비 정보
                    RTSD0004 E, -- 차종_장착가능 규격 관리
                    RTSD0005 F, -- 상품 마스터
                    RTSD0007 H,
                    RTCS0010 I,
                    RTCS0208 J,
                    (SELECT AGENCY_CD
						  , ROUND(AVG(TOT_EVAL_POINT),1) AS TOT_EVAL_POINT
					   FROM RTCS0130														--[20250620_01] 프리미엄퍼플점을 위한 만족도조사 평점
					  WHERE 1=1
						AND DP_YN = 'Y'
						AND TO_CHAR(SUBT_DAY,'YYYYMM') BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-3),'YYYYMM') AND TO_CHAR(ADD_MONTHS(SYSDATE,-1),'YYYYMM')
					  GROUP BY AGENCY_CD
				    ) K
            WHERE   v_Serch_Flag = 0
--            AND     B.SERVICE_CD  IN ('B00001','B00002','B00006') --[20180326_01]
            AND     B.SERVICE_CD  IN ('B00001','B00002','B00006','B00007','B00008','B00009', 'B00011', 'B00012')
            AND     A.PROC_DAY    BETWEEN v_Proc_DayF AND v_Proc_DayT
            AND     A.ORD_NO      = B.ORD_NO
            AND     A.EQU_NO      = B.EQU_NO
            AND     A.SERV_SEQ    = B.SERV_SEQ
            AND     A.ORD_NO      = C.ORD_NO
            AND     A.ORD_NO      = D.ORD_NO
            AND     C.MODEL_CD    = E.MODEL_CD
            AND     C.CONTENTS_CD = E.CONTENTS_CD
            AND     C.FR_CD       = E.FR_CD
            AND     D.MAT_CD      = F.MAT_CD
--            AND     E.USE_YN      = 'Y' --[20170124_01] 주석처리
            AND     E.SECTION_WIDTH = F.SECTION_WIDTH
            AND     E.ASPECT_RATIO  = F.ASPECT_RATIO
            AND     E.WHEEL_INCHES  = F.WHEEL_INCHES
            AND     E.PLY_RATING    = F.PLY_RATING
            --AND     F.USE_YN        = 'Y' 
            --AND     A.PROC_IN_CD    = H.AGENCY_CD  
            AND     DECODE(B.SERVICE_CD,'B00001',(SELECT I.AGENCY_CD FROM RTCS0009 I WHERE I.ORD_NO = A.ORD_NO AND A.SERV_SEQ = I.SERV_SEQ),A.PROC_IN_CD) = H.AGENCY_CD   
            AND     B.DLVR_DAY      = I.DLVR_DAY(+)
            AND     B.DLVR_SEQ      = I.DLVR_SEQ(+)  
            AND     B.DLVR_DAY      = J.DLVR_DAY(+)
            AND     B.DLVR_SEQ      = J.DLVR_SEQ(+)
            AND		H.AGENCY_CD     = K.AGENCY_CD(+)
            ) A, 
            RTVIEW03 B     -- 2016-06-03 이영근, VIEW테이블 변경 
    WHERE   A.AGENCY_CD    = B.AGENCY_CD
--    AND     A.AGENCY_CD    = DECODE( v_Agency_Cd,    NULL, A.AGENCY_CD,    v_Agency_Cd    )
    AND   (  
                    (v_Org_Main_Yn = 'Y' AND A.AGENCY_CD IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd))
            OR      (v_Org_Main_Yn = 'N' AND A.AGENCY_CD   = DECODE( v_Agency_Cd, NULL, A.AGENCY_CD, v_Agency_Cd ))
          )   --[20210309_01] kstka 판매인 그룹별로 조회    
    /* Group 및 Office가 Null인 경우 조회가 안됨20160415 한승훈 
    AND     B.SALES_GROUP  = DECODE( v_Sales_Group,  NULL, B.SALES_GROUP,  v_Sales_Group  )
    AND     B.SALES_OFFICE = DECODE( v_Sales_Office, NULL, B.SALES_OFFICE, v_Sales_Office )*/
    AND     (v_Sales_Group IS NULL OR (v_Sales_Group IS NOT NULL AND B.SALES_GROUP = v_Sales_Group))   /*20160415 변경 한승훈        */
    AND     (v_Sales_Office IS NULL OR (v_Sales_Office IS NOT NULL AND B.SALES_OFFICE = v_Sales_Office))   /*20160415 변경 한승훈        */
    AND     A.COMM_TP      = DECODE( v_Comm_Tp,      NULL, A.COMM_TP,      v_Comm_Tp      )
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
     ) A
    WHERE 1=1
--      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
--      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            (v_Org_Main_Yn = 'Y' AND 1=1) OR
            (v_Org_Main_Yn = 'N' AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP )))
          )
      AND (
            (v_Org_Main_Yn = 'Y' AND 1=1) OR
            (v_Org_Main_Yn = 'N' AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE )))
          )
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
--                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
                 WHEN ((v_Org_Main_Yn = 'Y' AND A.USER_ID IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd)) OR
                      (v_Org_Main_Yn = 'N' AND v_LOGIN_ID = A.USER_ID)) THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
--                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
                 WHEN ((v_Org_Main_Yn = 'Y' AND A.USER_ID IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd)) OR
                      (v_Org_Main_Yn = 'N' AND v_LOGIN_ID = A.USER_ID)) THEN 1
            ELSE 0 END
      ) = 1
    ;
    
  END p_sRtre5070ChargeRealList;  
  
  PROCEDURE p_CreateRtre5070AgentComm_Org (
    v_Period         IN CHAR,                           /*마감월              */
    v_Reg_Id         IN RTRE5070.REG_ID%TYPE,           /*등록자 ID           */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre5070 IS
    SELECT  T.AGENCY_CD                 AGENCY_CD,      /*판매원번호           */
            SUM( T.RTSLC_AMT )          RTSLC_AMT,      /*대리점 판매수수료    */ 
            SUM( T.NTSLC_AMT )          NTSLC_AMT,      /*방판 판매수수료      */ 
            SUM( T.OPSLC_AMT )          OPSLC_AMT,      /*오픈몰 판매수수료    */ 
            SUM( T.TBSLC_AMT)           TBSLC_AMT,      /*타어어뱅크 판매수수료*/            
            SUM( T.SVSLC_AMT)           SVSLC_AMT,      /*서비스 판매수수료    */ --[20190611_01]
            SUM( T.SLC_BONUS)           SLC_BONUS,      /*판매장려수수료       */ --[20190611_01]             
            SUM( T.APFDS_AMT )          APFDS_AMT,      /*충당금설정가능금액   */
            SUM( T.PROCC_AMT )          PROCC_AMT,      /*장착수수료           */
            SUM( T.LCCHC_AMT )          LCCHC_AMT,      /*위치교환 수수료      */ 
            SUM( T.EGOLC_AMT )          EGOLC_AMT,      /*엔진오일 교환 수수료 */
            SUM( T.WCHGC_AMT )          WCHGC_AMT,      /*교환서비스수수료     */
            SUM( T.RGCHK_AMT )          RGCHK_AMT,      /*방문점검수수료       */
            SUM( T.ALIGN_AMT )          ALIGN_AMT,      /*얼라인먼트수수료     */
            SUM( T.ZERO_AMT  )          ZERO_AMT,       /*걱정제로장착수수료   */
            SUM( T.BTAPFD_AMT )         BTAPFD_AMT      /*이전충담금액         */
    FROM (
            SELECT  A.ORD_AGENT                 AGENCY_CD,      /*판매원번호           */
                    SUM( DECODE( A.COMM_TP, 'A1', A.SSLCM_AMT, 0 ))  RTSLC_AMT,       
                                                                /*대리점 판매수수료    */ 
                    SUM( DECODE( A.COMM_TP, 'A2', A.SSLCM_AMT, 0 ))  NTSLC_AMT,       
                                                                /*방판 판매수수료      */ 
                    SUM( DECODE( A.COMM_TP, 'A3', A.SSLCM_AMT, 0 ))  OPSLC_AMT,       
                                                                /*오픈몰 판매수수료    */ 
                    SUM( DECODE( A.COMM_TP, 'A4', A.SSLCM_AMT, 0 ))  TBSLC_AMT,       
                                                                /*타어어뱅크 판매수수료*/
                    SUM( DECODE( A.COMM_TP, 'A5', A.SSLCM_AMT, 0 ))  SVSLC_AMT,       
                                                                /*서비스 판매수수료    */ 
                    SUM( DECODE( A.COMM_TP, 'A6', A.SSLCM_AMT, 0 ))  SLC_BONUS,       
                                                                /*판매장려수수료       */                                                                   
                    SUM( A.SAPFDS_AMT )         APFDS_AMT,      /*충당금설정가능금액   */
                    0                           PROCC_AMT,      /*장착수수료           */
                    0                           LCCHC_AMT,      /*위치교환 수수료      */ 
                    0                           EGOLC_AMT,      /*엔진오일 교환 수수료 */
                    0                           WCHGC_AMT,      /*교환서비스수수료     */
                    0                           RGCHK_AMT,      /*방문점검수수료       */
                    0                           ALIGN_AMT,      /*얼라인먼트수수료     */
                    0                           ZERO_AMT,       /*걱정제로장착수수료   */
                    0                           BTAPFD_AMT      /*이전충담금액         */
            FROM    RTRE5040 A
            WHERE   A.SLCM_YM = v_Period
            GROUP   BY A.ORD_AGENT
            UNION   ALL    
            SELECT  B.AGENCY_CD                 AGENCY_CD,      /*판매원번호           */
                    0                           RTSLC_AMT,      /*대리점 판매수수료    */ 
                    0                           NTSLC_AMT,      /*방판 판매수수료      */ 
                    0                           OPSLC_AMT,      /*오픈몰 판매수수료    */ 
                    0                           TBSLC_AMT,      /*타어어뱅크 판매수수료*/ 
                    0                           SVSLC_AMT,      /*서비스 판매수수료    */
                    0                           SLC_BONUS,      /*판매장려수수료       */
                    0                           APFDS_AMT,      /*충당금설정가능금액   */
                    SUM( B.PROCC_AMT )          PROCC_AMT,      /*장착수수료           */
                    0                           LCCHC_AMT,      /*위치교환 수수료      */ 
                    0                           EGOLC_AMT,      /*엔진오일 교환 수수료 */
                    0                           WCHGC_AMT,      /*교환서비스수수료     */
                    0                           RGCHK_AMT,      /*방문점검수수료       */
                    0                           ALIGN_AMT,      /*얼라인먼트수수료     */
                    0                           ZERO_AMT,       /*걱정제로장착수수료   */
                    0                           BTAPFD_AMT      /*이전충담금액         */
            FROM    RTRE5050 B
            WHERE   B.SLCM_YM = v_Period
            GROUP   BY B.AGENCY_CD
            UNION   ALL    
            SELECT  C.AGENCY_CD                 AGENCY_CD,      /*판매원번호           */
                    0                           RTSLC_AMT,      /*대리점 판매수수료    */ 
                    0                           NTSLC_AMT,      /*방판 판매수수료      */ 
                    0                           OPSLC_AMT,      /*오픈몰 판매수수료    */ 
                    0                           TBSLC_AMT,      /*타어어뱅크 판매수수료*/ 
                    0                           SVSLC_AMT,      /*서비스 판매수수료    */
                    0                           SLC_BONUS,      /*판매장려수수료       */
                    0                           APFDS_AMT,      /*충당금설정가능금액   */
                    0                           PROCC_AMT,      /*장착수수료           */
                    SUM( DECODE( C.COMM_TP, 'C1', C.SVCC_AMT, 0 ))  LCCHC_AMT,       
                                                                /*위치교환 수수료      */ 
                    SUM( DECODE( C.COMM_TP, 'C2', C.SVCC_AMT, 0 ))  EGOLC_AMT,       
                                                                /*엔진오일 교환 수수료 */
                    SUM( DECODE( C.COMM_TP, 'C6', C.SVCC_AMT, 0 ))  WCHGC_AMT,      
                                                                /*교환서비스수수료     */
                    SUM( DECODE( C.COMM_TP, 'C3', C.SVCC_AMT, 0 ))  RGCHK_AMT,      
                                                                /*방문점검수수료       */
                    SUM( DECODE( C.COMM_TP, 'C4', C.SVCC_AMT, 0 ))  ALIGN_AMT,      
                                                                /*얼라인먼트수수료     */
                    SUM( DECODE( C.COMM_TP, 'C5', C.SVCC_AMT, 0 ))  ZERO_AMT,      
                                                                /*걱정제로장착수수료   */                                            
                    0                           BTAPFD_AMT      /*이전충담금액         */
            FROM    RTRE5060 C
            WHERE   C.SLCM_YM = v_Period
            GROUP   BY C.AGENCY_CD 
            UNION   ALL    
            SELECT  D.AGENCY_CD                 AGENCY_CD,      /*판매원번호           */
                    0                           RTSLC_AMT,      /*대리점 판매수수료    */ 
                    0                           NTSLC_AMT,      /*방판 판매수수료      */ 
                    0                           OPSLC_AMT,      /*오픈몰 판매수수료    */ 
                    0                           TBSLC_AMT,      /*타어어뱅크 판매수수료*/ 
                    0                           SVSLC_AMT,      /*서비스 판매수수료    */
                    0                           SLC_BONUS,      /*판매장려수수료       */
                    0                           APFDS_AMT,      /*충당금설정가능금액   */
                    0                           PROCC_AMT,      /*장착수수료           */
                    0                           LCCHC_AMT,      /*위치교환 수수료      */ 
                    0                           EGOLC_AMT,      /*엔진오일 교환 수수료 */
                    0                           WCHGC_AMT,      /*교환서비스수수료     */
                    0                           RGCHK_AMT,      /*방문점검수수료       */
                    0                           ALIGN_AMT,      /*얼라인먼트수수료     */
                    0                           ZERO_AMT,       /*걱정제로장착수수료   */
                    SUM( D.APFD_PAMT ) - SUM( D.APFD_MAMT )     BTAPFD_AMT
                                                                /*이전충담금액         */
            FROM    RTRE5080 D
            GROUP   BY D.AGENCY_CD
            ) T
    WHERE   1=1
--      AND   AGENCY_CD = '108526'            
    GROUP   BY AGENCY_CD;  
    
    e_Error         EXCEPTION;
    v_curr_cunt     NUMBER DEFAULT 0;

    v_Tcomm_Amt     RTRE5070.TCOMM_AMT%TYPE;
    v_Rtslc_Amt     RTRE5070.RTSLC_AMT%TYPE;      /*대리점판매수수료    */
    v_Ntslc_Amt     RTRE5070.NTSLC_AMT%TYPE;      /*방문판매수수료      */
    v_Opslc_Amt     RTRE5070.OPSLC_AMT%TYPE;      /*오픈몰판매수수료    */
    v_Tbslc_Amt     RTRE5070.TBSLC_AMT%TYPE;      /*타이어뱅크판매수수료*/
    v_Mfapfd_Amt    RTRE5070.MFAPFD_AMT%TYPE;     /*당월충당금설정금액  */
    
  BEGIN


    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) OR (0 <> ISDATE(v_Period)) OR (6 <> LENGTH(TRIM(v_Period))) THEN
        v_Return_Message := '마감월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    -- 이미처리되었는지 확인
    v_curr_cunt := 0;
    BEGIN
    
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5080
        WHERE   APFD_DAY BETWEEN v_Period||'01'
                             AND TO_CHAR(LAST_DAY(TO_DATE(v_Period||'01', 'YYYYMMDD')), 'YYYYMMDD')
        AND     APFD_PAMT > 0
        AND     ROWNUM =  1;
        
        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;
    
    IF v_curr_cunt > 0 THEN
        v_Return_Message := '마감월('||v_Period||') : 충당금 처리된 내역이 존재하여 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    
    -- 기존자료 삭제
    BEGIN
    
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE5070
        WHERE   SLCM_YM = v_Period
        AND     ROWNUM =  1;
        
        EXCEPTION
        WHEN OTHERS THEN
            v_curr_cunt := 0;
    END;
    
    IF  v_curr_cunt > 0 THEN
    
        BEGIN
        
            DELETE
            FROM    RTRE5070
            WHERE   SLCM_YM = v_Period;
                
            EXCEPTION
            WHEN OTHERS THEN
                v_curr_cunt := 0;
        END;
        
    END IF;
    
    
    -- 판매인별 수수료 내역 집계 생성
    v_curr_cunt := 0;
    FOR CUR_5070 IN Cur_Rtre5070 LOOP
        EXIT WHEN Cur_Rtre5070%NOTFOUND;

        -- 처리 대상
        v_Tcomm_Amt := CUR_5070.RTSLC_AMT + CUR_5070.NTSLC_AMT   + CUR_5070.OPSLC_AMT   + CUR_5070.TBSLC_AMT
                     + CUR_5070.SVSLC_AMT + CUR_5070.SLC_BONUS
                     + CUR_5070.PROCC_AMT + CUR_5070.LCCHC_AMT
                     + CUR_5070.EGOLC_AMT + CUR_5070.WCHGC_AMT   + CUR_5070.RGCHK_AMT   + CUR_5070.ALIGN_AMT + CUR_5070.ZERO_AMT; --[20170531_02][20180326_01][20190611_01]
                     
        -- 수수료가 발생한 경우만 저장             
        IF  v_Tcomm_Amt > 0 THEN
        
            v_curr_cunt  := v_curr_cunt + 1;
                        
            /*
            v_Mfapfd_Amt := CUR_5070.BTAPFD_AMT + CUR_5070.APFDS_AMT;
            
            IF v_Mfapfd_Amt > 3000000 THEN
                v_Mfapfd_Amt := 3000000 - CUR_5070.BTAPFD_AMT;
            ELSE
                v_Mfapfd_Amt := CUR_5070.APFDS_AMT;
            END IF;
            
           
            IF 0 != f_InsertRtre5070( v_Period,    CUR_5070.AGENCY_CD, 
                                      CUR_5070.RTSLC_AMT,  CUR_5070.NTSLC_AMT,  CUR_5070.OPSLC_AMT, CUR_5070.TBSLC_AMT,
                                      CUR_5070.PROCC_AMT,  CUR_5070.LCCHC_AMT,  CUR_5070.EGOLC_AMT, CUR_5070.APFDS_AMT,
                                      CUR_5070.BTAPFD_AMT, v_Mfapfd_Amt, v_Tcomm_Amt, 
                                      v_Reg_Id, v_ErrorText
                                     ) THEN

                v_Return_Message := '판매인별 수수료 내역 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
           */ 
           
            -- 충당금 확정처리 - 판매인별 수수료 집계시 계약번호별 충당금 금액을 확정하여 조정
            Pkg_Rtre5040.p_UpdateRtre5040AgentAppFix(v_Period, CUR_5070.AGENCY_CD, CUR_5070.BTAPFD_AMT, v_Reg_Id,
                                                     v_Rtslc_Amt, v_Ntslc_Amt, v_Opslc_Amt, v_Tbslc_Amt,
                                                     v_Mfapfd_Amt, v_Success_Code, v_Return_Message, v_ErrorText);   
                
            IF 0 <> v_Success_Code THEN
                v_Return_Message := '판매인별 수수료 집계시 계약번호별 충당금 금액을 확정하여 조정 실패!!!'||'-'||v_Return_Message;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            v_Tcomm_Amt := v_Rtslc_Amt        + v_Ntslc_Amt          + v_Opslc_Amt          + v_Tbslc_Amt
                         + CUR_5070.SVSLC_AMT + CUR_5070.SLC_BONUS
                         + CUR_5070.PROCC_AMT + CUR_5070.LCCHC_AMT
                         + CUR_5070.EGOLC_AMT + CUR_5070.WCHGC_AMT   + CUR_5070.RGCHK_AMT   + CUR_5070.ALIGN_AMT    + CUR_5070.ZERO_AMT; --[20170531_02][20180326_01][20190611_01]
            
            IF 0 != f_InsertRtre5070( v_Period, CUR_5070.AGENCY_CD, v_Rtslc_Amt,  v_Ntslc_Amt,  
                                      v_Opslc_Amt, v_Tbslc_Amt, 
                                      CUR_5070.SVSLC_AMT, NULL, NULL, NULL, CUR_5070.SLC_BONUS,  
                                      CUR_5070.PROCC_AMT, CUR_5070.LCCHC_AMT,
                                      CUR_5070.EGOLC_AMT, CUR_5070.WCHGC_AMT, CUR_5070.RGCHK_AMT, CUR_5070.ALIGN_AMT, CUR_5070.ZERO_AMT,
                                      0, 0, 0, 0, 0,
                                      CUR_5070.APFDS_AMT, CUR_5070.BTAPFD_AMT, 
                                      v_Mfapfd_Amt, v_Tcomm_Amt, v_Reg_Id, v_ErrorText
                                     ) THEN
                v_Return_Message := '판매인별 수수료 내역 집계 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
        END IF;         
            
    END LOOP;    
    
    IF Cur_Rtre5070%ISOPEN THEN
        CLOSE Cur_Rtre5070;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감월('||v_Period||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre5070%ISOPEN THEN
            CLOSE Cur_Rtre5070;
        END IF;    

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_CreateRtre5070AgentComm(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre5070%ISOPEN THEN
            CLOSE Cur_Rtre5070;
        END IF;    

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre5070.p_CreateRtre5070AgentComm(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5070AgentComm_Org;
   
END Pkg_Rtre5070;