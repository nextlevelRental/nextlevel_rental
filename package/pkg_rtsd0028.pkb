CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0028 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0028
   PURPOSE   프리미엄서비스 관리(세부서비스) 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-10-19  chul             [20181019_00] 프리미엄 서비스 팝업 도입
*******************************************************************************/
 
  /*****************************************************************************
  -- 쇼핑몰 자유렌탈 프리미엄 서비스 리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0028_shopCafePrsList (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Period_Cd          IN RTSD0012.PERIOD_CD%TYPE,    /* 기간코드         */
      v_Cnt_Cd             IN RTSD0012.CNT_CD%TYPE        /* 타이어본수       */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR    
         
    SELECT   SALE_CD    -- 판매상품 코드
            ,PRS_DCD    -- 프리미엄서비스 코드
            ,PRS_NM     -- 프리미엄서비스명
            ,SERV_CNT   -- 선택가능 서비스 횟수(999: 무제한)
            ,SERV_CNT_AMT   -- 서비스 금액
    FROM   (SELECT   PRSINF.SALE_CD                                                         
                    ,PRSINF.PRS_DCD                                                                             
                    ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', PRSAMT.PRS_DCD) AS PRS_NM
                    ,PRSAMT.SERV_CNT                                                       
                    ,PRSAMT.SERV_AMT AS SERV_CNT_AMT  
            FROM    RTSD0028 PRSINF
                    INNER JOIN
                    RTSD0043 PRSAMT
                    ON (PRSINF.PRS_DCD = PRSAMT.PRS_DCD
                    AND PRSINF.SEQ = PRSAMT.SEQ) --[20191001_01] SEQ컬럼 추가
                    INNER JOIN
                    (SELECT PS_CD,
                            PRS_DCD,
                            PERIOD_CD,         
                            CNT_CD,
                            MAX(SERV_CNT) SERV_CNT
                     FROM   RTSD0012
                     WHERE  1=1
                     AND    SERV_CNT != 0 
                     AND    USE_YN = 'Y' 
                     GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) PRSDET
                    ON (PRSINF.PRS_DCD = PRSDET.PRS_DCD)
                    INNER JOIN
                    RTSD0020 GRPCD
                    ON (PRSINF.SALE_CD = GRPCD.SALE_CD
                        AND PRDT_GRP     = '01'       --판매유형 Lv1 
                        AND PRDT_GRP_DTL = '04'       --판매유형 Lv2
                        AND GRPCD.USE_YN = 'Y'
                       )   
                    INNER JOIN
                    RTSD0045 CHANCD
                    ON (GRPCD.SALE_CD = CHANCD.SALE_CD
                        AND CHANCD.CHAN_CD     = '02')   -- 채널유형 02(온라인)
            WHERE   1=1
            AND    PRSDET.PERIOD_CD     = v_Period_Cd  
            AND    PRSDET.PERIOD_CD     = PRSAMT.PERIOD_CD
            AND    PRSDET.CNT_CD        = v_Cnt_Cd
            AND    PRSINF.SALE_CD       = PRSDET.PS_CD
            AND    PRSINF.PRS_DCD       <> 'B00007'
--            AND    PRSDET.SERV_CNT >= PRSAMT.SERV_CNT
            UNION ALL
            SELECT   PRSINF.SALE_CD                                                         
                    ,PRSINF.PRS_DCD                                                                             
                    ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', PRSAMT.PRS_DCD) AS PRS_NM
                    ,PRSAMT.SERV_CNT                                                       
                    ,PRSAMT.SERV_AMT AS SERV_CNT_AMT  
            FROM    RTSD0028 PRSINF
                    INNER JOIN
                    RTSD0043 PRSAMT
                    ON (PRSINF.PRS_DCD = PRSAMT.PRS_DCD
                    AND PRSINF.SEQ = PRSAMT.SEQ)    --[20191001_01] SEQ컬럼 추가
                    INNER JOIN
                    (SELECT PS_CD,
                            PRS_DCD,
                            PERIOD_CD,         
                            CNT_CD,
                            MAX(SERV_CNT) SERV_CNT
                     FROM   RTSD0012
                     WHERE  1=1
                     AND    SERV_CNT != 0 
                     AND    USE_YN = 'Y' 
                     GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) PRSDET
                    ON (PRSINF.PRS_DCD = PRSDET.PRS_DCD)
                    INNER JOIN
                    RTSD0020 GRPCD
                    ON (PRSINF.SALE_CD = GRPCD.SALE_CD
                        AND PRDT_GRP     = '01'       --판매유형 Lv1 
                        AND PRDT_GRP_DTL = '04'       --판매유형 Lv2
                        AND GRPCD.USE_YN = 'Y'
                       )   
                    INNER JOIN
                    RTSD0045 CHANCD
                    ON (GRPCD.SALE_CD = CHANCD.SALE_CD
                        AND CHANCD.CHAN_CD     = '02')   -- 채널유형 02(온라인)
            WHERE   1=1
            AND    PRSDET.PERIOD_CD     = v_Period_Cd  
            AND    PRSDET.PERIOD_CD     = PRSAMT.PERIOD_CD
            AND    PRSDET.CNT_CD        = v_Cnt_Cd
            AND    PRSINF.SALE_CD       = PRSDET.PS_CD
            AND    PRSINF.PRS_DCD       = 'B00007'
            AND    PRSAMT.SERV_CNT <= DECODE(SUBSTR(PRSDET.CNT_CD,2), '1', '0', '2', '1', '3', '1', '4', '2')
            UNION ALL
            SELECT   PRSINF.SALE_CD
                    ,PRSINF.PRS_DCD 
                    ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', PRSINF.PRS_DCD) AS PRS_NM 
                    ,999 AS SERV_CNT
                    ,MAX(PRSAMT.SERV_INF_AMT) AS SERV_CNT_AMT                      
            FROM    RTSD0028 PRSINF
                    INNER JOIN
                    RTSD0043 PRSAMT
                    ON (PRSINF.PRS_DCD = PRSAMT.PRS_DCD
                    AND PRSINF.SEQ = PRSAMT.SEQ)    --[20191001_01] SEQ컬럼 추가
                    INNER JOIN
                    (SELECT PS_CD,
                            PRS_DCD,
                            PERIOD_CD,         
                            CNT_CD,
                            MAX(SERV_CNT) SERV_CNT
                     FROM   RTSD0012
                     WHERE  1=1
                     AND    SERV_CNT != 0 
                     AND    USE_YN = 'Y' 
                     GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) PRSDET
                    ON (PRSINF.PRS_DCD = PRSDET.PRS_DCD)
                    INNER JOIN
                    RTSD0020 GRPCD
                    ON (PRSINF.SALE_CD = GRPCD.SALE_CD
                        AND PRDT_GRP     = '01'       --판매유형 Lv1 
                        AND PRDT_GRP_DTL = '04'       --판매유형 Lv2
                        AND GRPCD.USE_YN = 'Y'
                       )   
                    INNER JOIN
                    RTSD0045 CHANCD
                    ON (GRPCD.SALE_CD = CHANCD.SALE_CD
                        AND CHANCD.CHAN_CD     = '02')   -- 채널유형 02(온라인)
            WHERE   PRSINF.SERV_INF_YN = 'Y'
            AND    PRSDET.PERIOD_CD = v_Period_Cd
            AND    PRSDET.PERIOD_CD  = PRSAMT.PERIOD_CD
            AND    PRSDET.CNT_CD = v_Cnt_Cd
            AND    PRSINF.SALE_CD = PRSDET.PS_CD
            GROUP BY  PRSINF.SALE_CD,PRSINF.PRS_DCD )
    ORDER BY PRS_DCD, SERV_CNT, SERV_CNT_AMT;    
    
    /*
    SELECT   SALE_CD    -- 판매상품 코드
            ,PRS_DCD    -- 프리미엄서비스 코드
            ,PRS_NM     -- 프리미엄서비스명
            ,SERV_CNT   -- 선택가능 서비스 횟수(999: 무제한)
            ,SERV_CNT_AMT   -- 서비스 금액
    FROM   (SELECT   PRSINF.SALE_CD                                                         
                    ,PRSINF.PRS_DCD                                                                             
                    ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', PRSINF.PRS_DCD) AS PRS_NM
                    ,PRSDET.SERV_CNT                                                        
                    ,(PRSDET.SERV_CNT * PRSAMT.SERV_AMT) AS SERV_CNT_AMT                    
            FROM    RTSD0028 PRSINF
                    INNER JOIN
                    RTSD0043 PRSAMT
                    ON (PRSINF.PRS_DCD = PRSAMT.PRS_DCD)
                    INNER JOIN
                    (SELECT PRS_DCD,
                            PERIOD_CD,         
                            CNT_CD,
                            MAX(SERV_CNT) SERV_CNT
                     FROM   RTSD0012
                     WHERE  PERIOD_CD != 'ZZ'
                     AND    SERV_CNT != 0 
                     AND    USE_YN = 'Y' 
                     GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) PRSDET
                    ON (PRSINF.PRS_DCD = PRSDET.PRS_DCD)
                    INNER JOIN
                    RTCM0051 GRPCD
                    ON (PRSINF.SALE_CD = GRPCD.CD_NM
                        AND GRPCD.CD_GRP_CD = 'S220' 
                        AND GRPCD.CD = 'S06')   -- 자유렌탈상품코드
            WHERE   PRSDET.PERIOD_CD = v_Period_Cd
            AND     PRSDET.CNT_CD = v_Cnt_Cd
            UNION ALL
            SELECT   PRSINF.SALE_CD
                    ,PRSINF.PRS_DCD 
                    ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', PRSINF.PRS_DCD) AS PRS_NM 
                    ,999 AS SERV_CNT
                    ,PRSAMT.SERV_INF_AMT AS SERV_CNT_AMT                      
            FROM    RTSD0028 PRSINF
                    INNER JOIN
                    RTSD0043 PRSAMT
                    ON (PRSINF.PRS_DCD = PRSAMT.PRS_DCD)
                    INNER JOIN
                    (SELECT PRS_DCD,
                            PERIOD_CD,         
                            CNT_CD,
                            MAX(SERV_CNT) SERV_CNT
                     FROM   RTSD0012
                     WHERE  PERIOD_CD != 'ZZ'
                     AND    SERV_CNT != 0 
                     AND    USE_YN = 'Y' 
                     GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) PRSDET
                    ON (PRSINF.PRS_DCD = PRSDET.PRS_DCD)
                    INNER JOIN
                    RTCM0051 GRPCD
                    ON (PRSINF.SALE_CD = GRPCD.CD_NM
                        AND GRPCD.CD_GRP_CD = 'S220' 
                        AND GRPCD.CD = 'S06')
            WHERE   PRSINF.SERV_INF_YN = 'Y'
            AND     PRSDET.PERIOD_CD = v_Period_Cd
            AND     PRSDET.CNT_CD = v_Cnt_Cd)
    ORDER BY PRS_DCD, SERV_CNT;
   */
  END p_sRtsd0028_shopCafePrsList;
  
  /*****************************************************************************
  -- 프리미엄 서비스 등록팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0028_srvcOrdPopup (
      Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Sale_Cd            IN RTSD0020.SALE_CD%TYPE,      /* 판매코드         */
      v_Period_Cd          IN RTSD0012.PERIOD_CD%TYPE,    /* 기간코드         */
      v_Cnt_Cd             IN RTSD0012.CNT_CD%TYPE        /* 타이어본수       */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR   
    SELECT CC.SALE_CD, 
           CC.PRS_DCD,
           CC.PRS_NM,
           CC.PERIOD_CD,   
           CC.PERIOD_NM, 
           CC.CNT_CD,
           CC.CNT_NM, 
           CC.SERV_CNT,
           CC.SERV_AMT_1, 
           CC.SERV_AMT_2, 
           CC.SERV_AMT_3, 
           CC.SERV_AMT_4, 
           CC.SERV_AMT_5, 
           CC.SERV_AMT_6, 
           CC.SERV_AMT_7, 
           CC.SERV_AMT_8, 
           CC.SERV_AMT_9, 
           CC.SERV_AMT_10, 
           CC.SERV_AMT_12,
           CC.SERV_AMT_18,
           CC.SERV_AMT_24,
           CC.SERV_INF_AMT,
           CC.SERV_INF_YN,
           CASE WHEN CC.PRS_DCD = 'B00010' THEN '0' ELSE TO_CHAR(CC.SERV_CNT_AMT) END SERV_CNT_AMT,
           CC.DC_RATE,
           CASE WHEN CC.DC_RATE = 0 THEN 0
           ELSE TRUNC(CC.SERV_CNT_AMT * CC.DC_RATE/100 )
           END AS SALE_AMT
    FROM (
            SELECT AA.SALE_CD, 
                   AA.PRS_DCD,
                   Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM,
                   BB.PERIOD_CD,   
                   Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', BB.PERIOD_CD) AS PERIOD_NM, 
                   BB.CNT_CD,
                   Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', BB.CNT_CD) AS CNT_NM, 
                   CASE WHEN AA.PRS_DCD = 'B00010' THEN BB.PERIOD_CD / 2 ELSE BB.SERV_CNT END SERV_CNT, --[20200909_01] kstka Nexen Check서비스는 횟수 계산
                   AA.SERV_AMT_1, 
                   AA.SERV_AMT_2, 
                   AA.SERV_AMT_3, 
                   AA.SERV_AMT_4, 
                   AA.SERV_AMT_5, 
                   AA.SERV_AMT_6, 
                   AA.SERV_AMT_7, 
                   AA.SERV_AMT_8, 
                   AA.SERV_AMT_9, 
                   AA.SERV_AMT_10, 
                   AA.SERV_AMT_12,
                   AA.SERV_AMT_18,
                   AA.SERV_AMT_24,
                   AA.SERV_INF_AMT,
                   AA.SERV_INF_YN,
                   (SELECT DC_RATE FROM RTSD0020 WHERE SALE_CD = v_Sale_Cd) AS DC_RATE,
                   DECODE(BB.SERV_CNT, 1, AA.SERV_AMT_1,
                                       2, AA.SERV_AMT_2,
                                       3, AA.SERV_AMT_3,
                                       4, AA.SERV_AMT_4,
                                       5, AA.SERV_AMT_5,
                                       6, AA.SERV_AMT_6,
                                       7, AA.SERV_AMT_7,
                                       8, AA.SERV_AMT_8,
                                       9, AA.SERV_AMT_9,
                                       10, AA.SERV_AMT_10,
                                       12, AA.SERV_AMT_12,
                                       18, AA.SERV_AMT_18,
                                       24, AA.SERV_AMT_24) AS SERV_CNT_AMT                               

             FROM 
                  (SELECT A.SALE_CD, 
                          A.PRS_DCD, 
                          A.SERV_INF_YN,
                          B.SERV_AMT_1, 
                          B.SERV_AMT_2, 
                          B.SERV_AMT_3, 
                          B.SERV_AMT_4, 
                          B.SERV_AMT_5, 
                          B.SERV_AMT_6, 
                          B.SERV_AMT_7, 
                          B.SERV_AMT_8, 
                          B.SERV_AMT_9, 
                          B.SERV_AMT_10,
                          B.SERV_AMT_12,
                          B.SERV_AMT_18,
                          B.SERV_AMT_24, 
                          B.SERV_INF_AMT                        
                     FROM RTSD0028 A, 
                          (
                          SELECT
                              T.PRS_DCD 
                              ,T.PERIOD_CD
                              ,T.SEQ    --[20191001_01] SEQ컬럼추가
                              ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                              ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                              ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                              ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                              ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                              ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                              ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                              ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                              ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                              ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                              ,MAX(DECODE(T.SERV_CNT, 12, T.SERV_AMT)) AS SERV_AMT_12
                              ,MAX(DECODE(T.SERV_CNT, 18, T.SERV_AMT)) AS SERV_AMT_18
                              ,MAX(DECODE(T.SERV_CNT, 24, T.SERV_AMT)) AS SERV_AMT_24
                              ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                          FROM RTSD0043 T
                          WHERE 1=1
                          AND T.PERIOD_CD = DECODE(v_Period_Cd, NULL, T.PERIOD_CD, v_Period_Cd)
                          GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼추가
                          ) B
                    WHERE A.PRS_DCD = B.PRS_DCD
                    AND A.SEQ = B.SEQ) AA,   --[20191001_01] SEQ컬럼추가
                  (SELECT PS_CD,
                          PRS_DCD,
                          PERIOD_CD,         
                          CNT_CD,
                          MAX(SERV_CNT) SERV_CNT
                     FROM RTSD0012
                    WHERE 1=1
                      AND SERV_CNT != 0 
                      AND USE_YN = 'Y' 
                    GROUP BY PS_CD, PRS_DCD, PERIOD_CD, CNT_CD) BB
             WHERE AA.PRS_DCD           = BB.PRS_DCD
               AND AA.SALE_CD           = DECODE(v_Sale_Cd, NULL, AA.SALE_CD, v_Sale_Cd)
               AND AA.SALE_CD           = BB.PS_CD
               AND BB.PERIOD_CD         = DECODE(v_Period_Cd, NULL, BB.PERIOD_CD, v_Period_Cd)
               AND TO_NUMBER(BB.CNT_CD) = TO_NUMBER(DECODE(v_Cnt_Cd, NULL, BB.CNT_CD, v_Cnt_Cd)) 
         ) CC;
  
  END p_sRtsd0028_srvcOrdPopup;  
  
  /*****************************************************************************
  -- 주문별 프리미엄 서비스 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0028_srvcOrdList (
    Ref_Cursor           IN OUT SYS_REFCURSOR,
      v_Ord_No           IN RTSD0106.ORD_NO%TYPE          /*계약번호          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR    
    SELECT DD.SALE_CD,
           DD.PRS_DCD,
           DD.PRS_NM, 
           DD.SERV_INF_AMT,
           DD.SERV_INF_YN,
           DD.PERIOD_CD,   
           DD.PERIOD_NM, 
           DD.CNT_CD,
           DD.CNT_NM, 
           DD.SERV_CNT,
           DD.SERV_AMT_1, 
           DD.SERV_AMT_2, 
           DD.SERV_AMT_3, 
           DD.SERV_AMT_4, 
           DD.SERV_AMT_5, 
           DD.SERV_AMT_6, 
           DD.SERV_AMT_7, 
           DD.SERV_AMT_8, 
           DD.SERV_AMT_9, 
           DD.SERV_AMT_10,
           DD.SERV_AMT_12,
           DD.SERV_AMT_18,
           DD.SERV_AMT_24,    
           DD.ORD_NO,
           DD.SERV_CNT_AMT,
           FF.SERV_CNT_ORG,
           DD.DC_RATE,
           CASE WHEN DD.DC_RATE = 0 THEN 0
           ELSE TRUNC(DD.SERV_CNT_AMT * DD.DC_RATE/100 )
           END AS SALE_AMT
     FROM (   
            SELECT AA.SALE_CD,
                   AA.PRS_DCD,
                   Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM, 
                   AA.SERV_INF_AMT,
                   AA.SERV_INF_YN,   
                   CC.PERIOD_CD,   
                   Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', CC.PERIOD_CD) AS PERIOD_NM, 
                   BB.CNT_CD,
                   Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', BB.CNT_CD) AS CNT_NM, 
                   BB.SERV_CNTR AS SERV_CNT,
                   AA.SERV_AMT_1, 
                   AA.SERV_AMT_2, 
                   AA.SERV_AMT_3, 
                   AA.SERV_AMT_4, 
                   AA.SERV_AMT_5, 
                   AA.SERV_AMT_6, 
                   AA.SERV_AMT_7, 
                   AA.SERV_AMT_8, 
                   AA.SERV_AMT_9, 
                   AA.SERV_AMT_10, 
                   AA.SERV_AMT_12, 
                   AA.SERV_AMT_18, 
                   AA.SERV_AMT_24,                
                   CC.ORD_NO,
                   BB.SERV_AMT AS SERV_CNT_AMT,
                   CASE WHEN DD.PRDT_GRP_DTL = '03' THEN 
                        CASE WHEN DD.DC_RATE = 0 THEN DD.DC_AMT
                             ELSE TRUNC(AA.SERV_AMT_1 * DD.DC_RATE/100 )
                        END
                   END GROUP_SALE_1,     /* 단체할인 */
                   CASE WHEN DD.PRDT_GRP_DTL IS NULL OR  DD.PRDT_GRP_DTL !='03' THEN 
                       CASE WHEN DD.DC_RATE = 0 THEN DD.DC_AMT
                            ELSE TRUNC(AA.SERV_AMT_1 * DD.DC_RATE/100 ) 
                       END
                   END CHNL_SALE_1,       /* 판매채널할인 */
                   DD.DC_RATE,
                   DD.DC_AMT
            FROM (SELECT A.SALE_CD, 
                           A.PRS_DCD, 
                           B.PERIOD_CD,
                           B.SERV_AMT_1, 
                           B.SERV_AMT_2, 
                           B.SERV_AMT_3, 
                           B.SERV_AMT_4, 
                           B.SERV_AMT_5, 
                           B.SERV_AMT_6, 
                           B.SERV_AMT_7, 
                           B.SERV_AMT_8, 
                           B.SERV_AMT_9, 
                           B.SERV_AMT_10, 
                           B.SERV_AMT_12,
                           B.SERV_AMT_18,
                           B.SERV_AMT_24,
                           B.SERV_INF_AMT,  
                           A.SERV_INF_YN
                  FROM RTSD0028 A, 
                      (
                          SELECT
                              T.PRS_DCD 
                              ,T.PERIOD_CD
                              ,T.SEQ    --[20191001_01] SEQ컬럼추가
                              ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                              ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                              ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                              ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                              ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                              ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                              ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                              ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                              ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                              ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                              ,MAX(DECODE(T.SERV_CNT, 12, T.SERV_AMT)) AS SERV_AMT_12
                              ,MAX(DECODE(T.SERV_CNT, 18, T.SERV_AMT)) AS SERV_AMT_18
                              ,MAX(DECODE(T.SERV_CNT, 24, T.SERV_AMT)) AS SERV_AMT_24
                              ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                          FROM RTSD0043 T
                          WHERE 1=1
                          GROUP BY T.PRS_DCD,T.PERIOD_CD, T.SEQ --[20191001_01] SEQ컬럼추가 
                          ) B
                  WHERE A.PRS_DCD = B.PRS_DCD
                  AND A.SEQ = B.SEQ --[20191001_01] SEQ컬럼추가
                  ) AA
                  , RTSD0013 BB
                  , RTSD0104 CC   
                  , RTSD0020 DD       
             WHERE AA.PRS_DCD = BB.PRS_DCD
               AND CC.PERIOD_CD = AA.PERIOD_CD
               AND AA.SALE_CD = CC.SALE_CD
               AND AA.SALE_CD = DD.SALE_CD
               AND CC.ORD_NO  = BB.ORD_NO 
               AND CC.ORD_NO  = DECODE(v_Ord_No, NULL, CC.ORD_NO, v_Ord_No)
           ) DD,           
           (SELECT PRS_DCD,
                  PERIOD_CD,         
                  CNT_CD,
                  MAX(SERV_CNT) SERV_CNT_ORG
             FROM RTSD0012
            WHERE 1=1
              AND SERV_CNT != 0 
              AND USE_YN = 'Y'  
            GROUP BY PRS_DCD, PERIOD_CD, CNT_CD) FF
   WHERE  DD.PRS_DCD = FF.PRS_DCD      
     AND  DD.PERIOD_CD = FF.PERIOD_CD
     AND  DD.CNT_CD = FF.CNT_CD;      
/*
    SELECT AA.SALE_CD,
           AA.PRS_DCD,
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM, 
           AA.SERV_INF_AMT,
           AA.SERV_INF_YN,   
           CC.PERIOD_CD,   
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', CC.PERIOD_CD) AS PERIOD_NM, 
           BB.CNT_CD,
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', BB.CNT_CD) AS CNT_NM, 
           BB.SERV_CNTR AS SERV_CNT,
           AA.SERV_AMT_1, 
           AA.SERV_AMT_2, 
           AA.SERV_AMT_3, 
           AA.SERV_AMT_4, 
           AA.SERV_AMT_5, 
           AA.SERV_AMT_6, 
           AA.SERV_AMT_7, 
           AA.SERV_AMT_8, 
           AA.SERV_AMT_9, 
           AA.SERV_AMT_10, 
           AA.SERV_INF_AMT,
           AA.SERV_INF_YN,         
           CC.ORD_NO,
           BB.SERV_AMT AS SERV_CNT_AMT
    FROM (SELECT A.SALE_CD, 
                   A.PRS_DCD, 
                   B.PERIOD_CD,
                   B.SERV_AMT_1, 
                   B.SERV_AMT_2, 
                   B.SERV_AMT_3, 
                   B.SERV_AMT_4, 
                   B.SERV_AMT_5, 
                   B.SERV_AMT_6, 
                   B.SERV_AMT_7, 
                   B.SERV_AMT_8, 
                   B.SERV_AMT_9, 
                   B.SERV_AMT_10, 
                   B.SERV_INF_AMT,  
                   A.SERV_INF_YN
          FROM RTSD0028 A, 
              (
                  SELECT
                      T.PRS_DCD 
                      ,T.PERIOD_CD
                      ,MAX(DECODE(T.SERV_CNT, 1, T.SERV_AMT)) AS SERV_AMT_1
                      ,MAX(DECODE(T.SERV_CNT, 2, T.SERV_AMT)) AS SERV_AMT_2
                      ,MAX(DECODE(T.SERV_CNT, 3, T.SERV_AMT)) AS SERV_AMT_3
                      ,MAX(DECODE(T.SERV_CNT, 4, T.SERV_AMT)) AS SERV_AMT_4
                      ,MAX(DECODE(T.SERV_CNT, 5, T.SERV_AMT)) AS SERV_AMT_5
                      ,MAX(DECODE(T.SERV_CNT, 6, T.SERV_AMT)) AS SERV_AMT_6
                      ,MAX(DECODE(T.SERV_CNT, 7, T.SERV_AMT)) AS SERV_AMT_7
                      ,MAX(DECODE(T.SERV_CNT, 8, T.SERV_AMT)) AS SERV_AMT_8
                      ,MAX(DECODE(T.SERV_CNT, 9, T.SERV_AMT)) AS SERV_AMT_9
                      ,MAX(DECODE(T.SERV_CNT, 10, T.SERV_AMT)) AS SERV_AMT_10
                      ,MAX(T.SERV_INF_AMT) AS SERV_INF_AMT
                  FROM RTSD0043 T
                  WHERE 1=1
                  GROUP BY T.PRS_DCD,T.PERIOD_CD
                  ) B
          WHERE A.PRS_DCD = B.PRS_DCD
          ) AA
          , RTSD0013 BB
          , RTSD0104 CC
    WHERE AA.PRS_DCD = BB.PRS_DCD
       AND CC.PERIOD_CD = AA.PERIOD_CD
       AND AA.SALE_CD = CC.SALE_CD
       AND CC.ORD_NO = BB.ORD_NO 
       AND CC.ORD_NO = DECODE(v_Ord_No, NULL, CC.ORD_NO, v_Ord_No);
   */ 
    /*
    SELECT AA.SALE_CD,
           AA.PRS_DCD,
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM, 
           AA.SERV_AMT, 
           AA.SERV_INF_AMT,
           AA.SERV_INF_YN,   
           CC.PERIOD_CD,   
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', CC.PERIOD_CD) AS PERIOD_NM, 
           BB.CNT_CD,
           Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', BB.CNT_CD) AS CNT_NM, 
           BB.SERV_CNTR AS SERV_CNT,
          (BB.SERV_CNTR * AA.SERV_AMT) AS SERV_AMT_SUM,     
           CC.ORD_NO
      FROM (SELECT A.SALE_CD, 
                   A.PRS_DCD, 
                   B.SERV_AMT, 
                   B.SERV_INF_AMT,
                   A.SERV_INF_YN
              FROM RTSD0028 A, RTSD0043 B
             WHERE A.PRS_DCD = B.PRS_DCD) AA, RTSD0013 BB, RTSD0104 CC
     WHERE AA.PRS_DCD = BB.PRS_DCD
       AND AA.SALE_CD = CC.SALE_CD
       AND CC.ORD_NO = BB.ORD_NO 
       AND CC.ORD_NO = DECODE(v_Ord_No, NULL, CC.ORD_NO, v_Ord_No);
    */
  END p_sRtsd0028_srvcOrdList;  

  /*****************************************************************************
  -- 판매프리미엄정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0028.SALE_CD%TYPE         /* 판매코드  */
  ) IS

  BEGIN
  
    OPEN Ref_Cursor FOR
    SELECT 
        A.*
    FROM (
        SELECT
         T.SALE_CD,                                                             /* 판매코드      */   
         T.PRS_DCD,                                                             /* 상세서비스    */
         Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', T.PRS_DCD) AS PRS_NM,         /* 상세서비스명  */ 
         T.REG_ID,                                                              /* 등록자 ID     */
         T.REG_DT,                                                              /* 등록일        */
         T.CHG_ID,                                                              /* 변경자 ID     */
         T.CHG_DT,                                                              /* 변경일        */
         T.SERV_INF_YN,                                                         /* 상세서비스    */
         T.SEQ                                                                  /* 시퀀스        */
        FROM RTSD0028 T
        WHERE T.SALE_CD = DECODE(v_Sale_Cd, NULL, T.SALE_CD, v_Sale_Cd)
    ) A
    ORDER BY A.SALE_CD;
  END p_sRtsd0028;

  
  /*****************************************************************************
  -판매프리미엄정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0028 (
    v_Sale_Cd           IN RTSD0028.SALE_CD%TYPE,           /* 판매코드         */
    v_Prs_Dcd           IN RTSD0028.PRS_DCD%TYPE,           /* 상세서비스       */
    v_Serv_Inf_Yn       IN RTSD0028.SERV_INF_YN%TYPE,           /* 상세서비스       */
    v_Seq               IN RTSD0028.SEQ%TYPE,               /* 시퀀스          */
    v_Reg_Id            IN RTSD0028.REG_ID%TYPE,            /* 등록자 ID        */
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    
    INSERT  INTO RTSD0028 (
            SALE_CD,
            PRS_DCD,
            SERV_INF_YN,
            SEQ,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Sale_Cd,
            v_Prs_Dcd,
            v_Serv_Inf_Yn,
            v_Seq,
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

  END f_InsertRtsd0028;


  /*****************************************************************************
  -판매프리미엄정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0028 (
    v_Sale_Cd           IN RTSD0028.SALE_CD%TYPE          /* 판매코드         */
    ) RETURN NUMBER IS
  BEGIN

    DELETE FROM RTSD0028
    WHERE  SALE_CD      = v_Sale_Cd;
    Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0028.f_DeleteRtsd0028', '판매코드에러', v_Sale_Cd);

    RETURN SQLCODE;

  END f_DeleteRtsd0028;

  
  /*****************************************************************************
  --판매프리미엄정보 (IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0028 (
    v_Comm_Dvsn         IN CHAR,                            /* 처리구분(I,U,D)  */
    v_Sale_Cd           IN RTSD0028.SALE_CD%TYPE,           /* 판매코드         */
    v_Prs_Dcd           IN RTSD0028.PRS_DCD%TYPE,           /* 상세서비스       */
    v_Serv_Inf_Yn       IN RTSD0028.SERV_INF_YN%TYPE,           /* 상세서비스       */
    v_Seq               IN RTSD0028.SEQ%TYPE,               /* 시퀀스          */
    v_Reg_Id            IN RTSD0028.REG_ID%TYPE,            /* 등록자 ID        */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ) IS

  e_Error EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN

--        IF 0 != f_InsertRtsd0028(v_Sale_Cd, v_Prs_Dcd,v_Serv_Inf_Yn, v_Reg_Id, v_ErrorText) THEN
        IF 0 != f_InsertRtsd0028(v_Sale_Cd, v_Prs_Dcd,v_Serv_Inf_Yn, v_Seq, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '판매프리엄미정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;    
       
        
    ELSE
        IF v_Comm_Dvsn = 'U' THEN
            v_Success_code := 0;
        ELSIF v_Comm_Dvsn = 'D' THEN
            v_Success_code := 0;
        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0028.p_IUDRtsd0028(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0028.p_IUDRtsd0028(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0028;   

END Pkg_Rtsd0028;