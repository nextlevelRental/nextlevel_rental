CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0302 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0302
   PURPOSE   [SD] NexenCheck 서비스 관련

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-09-09  kstka            1. Created this package body.
*******************************************************************************/
     
  /*****************************************************************************
  -- 발송이력저장
  -- 2020.09.09 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IRtsd0302 (
    v_Ord_No        RTSD0302.ORD_NO%TYPE,
    v_Proc_Day      RTSD0302.PROC_DAY%TYPE,
    v_Std_Day       RTSD0302.STD_DAY%TYPE,
    v_Cnt_Cd        RTSD0302.CNT_CD%TYPE,
    v_Period_Cd     RTSD0302.PERIOD_CD%TYPE,
    v_Reg_Id        RTSD0302.REG_ID%TYPE
  ) IS
      
  e_Error    EXCEPTION;
  
  BEGIN
    
    BEGIN
        
        INSERT INTO RTSD0302 (ORD_NO, SEQ, PROC_DAY, STD_DAY, CNT_CD, PERIOD_CD, REG_ID, REG_DT)
            VALUES (
            v_Ord_No, (SELECT NVL(MAX(SEQ), 0) + 1 FROM RTSD0302 WHERE ORD_NO = v_Ord_No), v_Proc_Day, v_Std_Day, v_Cnt_Cd, v_Period_Cd, v_Reg_Id, SYSDATE);
   
    END;
    
  END p_IRtsd0302;
  
  /*****************************************************************************
  -- 2개월마다 발송처리
  -- 2020.09.09 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_Rtsd0302Aggregate (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
  ) IS
      
  e_Error    EXCEPTION;
  
  v_stdDay VARCHAR2(8);
  v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';
  
  BEGIN
    
    BEGIN
        
--        SELECT TO_CHAR(ADD_MONTHS(SYSDATE, LEVEL * -2), 'YYYYMMDD') STD_YM
--        INTO v_stdDay 
--        FROM DUAL
--        CONNECT BY LEVEL <= '20200101'
--        AND ROWNUM = 1
--        ; 
    
        FOR CUR_TMP IN (SELECT * FROM RTSD0108 A, RTSD0013 B WHERE PROC_DAY = TO_CHAR(SYSDATE - 1, 'YYYYMMDD') AND A.ORD_NO = B.ORD_NO AND B.PRS_DCD = 'B00010') LOOP
        
            INSERT INTO RTSD0302
            SELECT  A.ORD_NO
                  , LEVEL SEQ
                  , A.PROC_DAY
                  , TO_CHAR(ADD_MONTHS(TO_DATE(A.PROC_DAY) + 1,(2*(LEVEL - 1))), 'YYYYMMDD') STD_DAY
                  , A.CNT_CD
                  , A.PERIOD_CD    
                  , 'BATCHJOB'
                  , SYSDATE                                  
            FROM    (
                    SELECT B.ORD_NO
                       , B.PROC_DAY
                       , B.CNT_CD
                       , B.PERIOD_CD
                        FROM RTSD0100 A
                           , RTSD0108 B 
                      WHERE 1=1
                      AND A.CUST_NO = B.CUST_NO
                      AND B.ORD_NO = CUR_TMP.ORD_NO
                      AND B.MFP_YN = 'N'
                    ) A
             CONNECT BY LEVEL <= A.PERIOD_CD / 2
             ;
         
         END LOOP;
         
                 
--        FOR CUR IN (SELECT C.CUST_NM, C.MOB_NO, A.ORD_NO, A.PERIOD_CD, A.CNT_CD, B.SEQ, TO_CHAR(SYSDATE, 'YYYYMMDD') AS STD_DAY, A.PROC_DAY 
--                    FROM RTSD0100 C, RTSD0108 A, (SELECT ROW_NUMBER() OVER(PARTITION BY ORD_NO ORDER BY SEQ DESC) NUM, ORD_NO, SEQ, STD_DAY FROM RTSD0302) B 
--                    WHERE C.CUST_NO = A.CUST_NO
--                    AND A.ORD_NO = B.ORD_NO(+)
--                    AND ADD_MONTHS(NVL(B.STD_DAY, A.PROC_DAY), 2) = TO_CHAR(SYSDATE, 'YYYYMMDD') --장착일 or 마지막 안내문자 발송일 + 2개월
--                    AND A.ORD_DAY >= '20201101'
--                    AND B.NUM(+) = 1) LOOP

          FOR CUR IN (SELECT DISTINCT A.CUST_NM
                            , A.MOB_NO
                            , B.ORD_NO
                            , B.PERIOD_CD
                            , B.CNT_CD
                            , B.PROC_DAY 
                            FROM RTSD0100 A
                            , RTSD0108 B
                            , RTSD0302 C
                            , RTSD0013 D  
                            WHERE 1=1
                            AND (C.STD_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD') 
                                 OR Pkg_Rtsd0302.f_sRtsd0302PlanDay(B.ORD_NO) = TO_CHAR(SYSDATE, 'YYYYMMDD')
                                )
                            AND A.CUST_NO = B.CUST_NO
                            AND B.ORD_NO = C.ORD_NO
                            AND B.MFP_YN = 'N'
                            AND B.ORD_NO = D.ORD_NO
                            AND D.PRS_DCD = 'B00010'
                            ) LOOP    --[20211012_01] kstka  중도완납/해지 대상은 제외처리
        
            -- Message 생성 [20210107_01]
            v_Sms_Msg := '';
            v_Sms_Msg := v_Sms_Msg || '안녕하세요. 넥스트레벨 타이어렌탈 서비스입니다.' || CHR(13) || CHR(10);
            v_Sms_Msg := v_Sms_Msg || CUR.CUST_NM || ' 고객님의 NEXT LEVEL CHECK 서비스에 대한 안내드립니다.' || CHR(13) || CHR(10);
            v_Sms_Msg := v_Sms_Msg || CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg || 'NEXT LEVEL CHECK 서비스란?' || CHR(13) || CHR(10);
            v_Sms_Msg := v_Sms_Msg || '▶ 렌탈전문점에 방문하여 무상으로 타이어 또는 기타경정비를 점검 받을 수 있는 서비스 입니다.' || CHR(13) || CHR(10);
            v_Sms_Msg := v_Sms_Msg || CHR(13)||CHR(10);
            v_Sms_Msg := v_Sms_Msg || '※ NEXT LEVEL CHECK 서비스 방법 안내' || CHR(13) || CHR(10);
            v_Sms_Msg := v_Sms_Msg || '1) 아래 링크를 클릭하여 NEXT LEVEL CHECK 서비스 가능 렌탈전문점 찾기' || CHR(13) || CHR(10);
            v_Sms_Msg := v_Sms_Msg || 'https://m.nexen-nextlevel.com/bbs/specialDealerList' || CHR(13) || CHR(10);
            v_Sms_Msg := v_Sms_Msg || '2) 목록 → 시/도 선택 → 시/군/구 선택 → 전문점 찾기 클릭' || CHR(13) || CHR(10);
            v_Sms_Msg := v_Sms_Msg || '3) 가까운 매장 위치 확인 후, 방문하여 무상점검 받으면 끝!(상황에 따라 매장이 혼잡할 수 있으니 사전 연락 후 방문 부탁드립니다.)' || CHR(13) || CHR(10);
            
            -- sms발송
            Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                  'R'                                   /*예약 전송여부    */
                , TO_CHAR(SYSDATE + 12/24,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                , CUR.MOB_NO                      /*받는 전화번호    */
                , '18550100'                            /*보내는 전화번호  */
                , v_Sms_Msg                             /*메시지내용       */
                , 'S052'                                /*사용자지정 필드1 */
                , CUR.ORD_NO                              /*사용자지정 필드2 */
                ,'7'
                ,''
                , 'BATCHJOB'                              /*등록자 ID        */
                , v_Success_Code
                , v_Return_Message
                , v_ErrorText
            );
            
            --p_IRtsd0302(CUR.ORD_NO, CUR.PROC_DAY, CUR.STD_DAY, CUR.CNT_CD, CUR.PERIOD_CD, 'BATCHJOB');
        END LOOP;   
   
    END;
    
  END p_Rtsd0302Aggregate;
  
  /*****************************************************************************
  -- 발송예정일 계산
  *****************************************************************************/
  FUNCTION f_sRtsd0302PlanDay(
    v_Ord_No    IN  RTSD0302.ORD_NO%TYPE            /*주문번호        */
    ) RETURN VARCHAR IS

    v_Std_Day      RTSD0302.STD_DAY%TYPE; /*PLAN DAY      */
  BEGIN

           SELECT STD_DAY
           INTO v_Std_Day 
           FROM ( 
                 SELECT  TO_CHAR(ADD_MONTHS(TO_DATE(A.PROC_DAY) + 1,(2*(LEVEL - 1))), 'YYYYMMDD') STD_DAY                                 
                 FROM    (
                        SELECT B.ORD_NO
                           , B.PROC_DAY
                           , B.CNT_CD
                           , B.PERIOD_CD
                            FROM RTSD0108 B 
                          WHERE 1=1
                          AND B.ORD_NO = v_Ord_No
                        ) A
                 CONNECT BY LEVEL <= A.PERIOD_CD / 2
                 ) WHERE STD_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD');
         
    RETURN v_Std_Day;

    EXCEPTION
      WHEN OTHERS THEN
           RETURN '';

  END f_sRtsd0302PlanDay;  
  
END Pkg_Rtsd0302;
/
