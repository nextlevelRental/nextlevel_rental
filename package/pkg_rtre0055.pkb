CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0055 AS
/*******************************************************************************
   NAME      Pkg_Rtre0055
   PURPOSE   출금스케쥴 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2019-06-21  wjim             [20190620_01] 신규생성
*******************************************************************************/

  /*****************************************************************************
  -- 출금스케쥴 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0055 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , ps_Std_Ym        IN VARCHAR2                      /*기준월              */
    , ps_Req_Div       IN RTRE0055.REQ_DIV%TYPE         /*출금구분(R066)      */
    , ps_Use_Yn        IN RTRE0055.USE_YN%TYPE          /*사용여부            */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.REQ_DAY
         ,  A1.REQ_DIV
         ,  B1.CD_NM   AS REQ_DIV_NM
         ,  A1.USE_YN
         ,  A1.REG_ID
         ,  A1.REG_DT
         ,  A1.CHG_ID
         ,  A1.CHG_DT
      FROM  RTRE0055 A1
         ,  RTCM0051 B1
     WHERE  A1.REQ_DAY BETWEEN ps_Std_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(ps_Std_Ym, 'YYYYMM')), 'YYYYMMDD')
       AND  A1.REQ_DIV = DECODE(ps_Req_Div, NULL, A1.REQ_DIV, ps_Req_Div)
       AND  A1.USE_YN  = DECODE(ps_Use_Yn, NULL, A1.USE_YN , ps_Use_Yn)
       AND  A1.REQ_DIV = B1.CD(+)
       AND  B1.CD_GRP_CD(+) = 'R066'
      ORDER BY A1.REQ_DAY
    ;

  END p_sRtre0055;
  
  
  /*****************************************************************************
  -- 출금스케쥴 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0055 (
      ps_Req_Day         IN RTRE0055.REQ_DAY%TYPE       /*출금일자            */
    , ps_Req_Div         IN RTRE0055.REQ_DIV%TYPE       /*출금구분(R066)      */
    , ps_Use_Yn          IN RTRE0055.USE_YN%TYPE        /*사용여부            */
    , ps_Reg_Id          IN RTRE0055.REG_ID%TYPE        /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTRE0055 (
          REQ_DAY
        , REQ_DIV
        , USE_YN
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    ) VALUES (
          ps_Req_Day
        , ps_Req_Div
        , ps_Use_Yn
        , ps_Reg_Id
        , SYSDATE
        , ps_Reg_Id
        , SYSDATE  
    );
    
    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        rs_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0055;
  
  
  /*****************************************************************************
  -- 출금스케쥴 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0055 (
      ps_Req_Day         IN RTRE0055.REQ_DAY%TYPE       /*출금일자            */
    , ps_Req_Div         IN RTRE0055.REQ_DIV%TYPE       /*출금구분(R066)      */
    , ps_Use_Yn          IN RTRE0055.USE_YN%TYPE        /*사용여부            */
    , ps_Reg_Id          IN RTRE0055.REG_ID%TYPE        /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0055
       SET  REQ_DIV = ps_Req_Div
         ,  USE_YN  = ps_Use_Yn
         ,  CHG_ID  = ps_Reg_Id
         ,  CHG_DT  = SYSDATE
     WHERE  REQ_DAY = ps_Req_Day;

    RETURN SQLCODE;

  EXCEPTION
      WHEN OTHERS THEN
        rs_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0055;

  /*****************************************************************************
  -- 출금스케쥴 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0055 (
      ps_Req_Day         IN RTRE0055.REQ_DAY%TYPE       /*출금일자            */
    , ps_Reg_Id          IN RTRE0055.REG_ID%TYPE        /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0055
     WHERE  REQ_DAY = ps_Req_Day;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0055.f_DeleteRtre0055(1)', 'ps_Req_Day', ps_Req_Day);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0055.f_DeleteRtre0055(1)', 'ps_Reg_Id' , ps_Reg_Id );

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        rs_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0055;
  
  
  /*****************************************************************************
  -- 출금스케쥴 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0055 (
      ps_Comm_Dvsn       IN CHAR                        /*처리구분(I,U,D)     */
    , ps_Req_Day         IN RTRE0055.REQ_DAY%TYPE       /*출금일자            */
    , ps_Req_Div         IN RTRE0055.REQ_DIV%TYPE       /*출금구분(R066)      */
    , ps_Use_Yn          IN RTRE0055.USE_YN%TYPE        /*사용여부            */
    , ps_Reg_Id          IN RTRE0055.REG_ID%TYPE        /*등록자ID            */
    , rn_Success_Code   OUT NUMBER
    , rs_Return_Message OUT VARCHAR2
    , rs_ErrorText      OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
    
  BEGIN

    IF TRIM(ps_Req_Day) IS NULL THEN
        rs_Return_Message := '출금일자('||ps_Req_Day||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(ps_Req_Div) IS NULL THEN
        rs_Return_Message := '출금구분('||ps_Req_Div||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(ps_Use_Yn) IS NULL THEN
        rs_Return_Message := '사용여부('||ps_Use_Yn||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(ps_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(ps_Reg_Id)) THEN
        rs_Return_Message := '등록자 ID('||ps_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    

    IF ps_Comm_Dvsn = 'I' THEN

        IF 0 != f_InsertRtre0055(
              ps_Req_Day
            , ps_Req_Div
            , ps_Use_Yn
            , ps_Reg_Id
            , rs_ErrorText
        ) THEN
            rs_Return_Message := '출금스케쥴 등록 실패!!!'||'-'||rs_ErrorText;
            rs_ErrorText      := rs_ErrorText;
            RAISE e_Error;

        END IF;

    ELSE

        IF ps_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0055(
                  ps_Req_Day
                , ps_Req_Div
                , ps_Use_Yn
                , ps_Reg_Id
                , rs_ErrorText
            ) THEN
                rs_Return_Message := '출금스케쥴 수정 실패!!!'||'-'||rs_ErrorText;
                rs_ErrorText      := rs_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF ps_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0055(
                  ps_Req_Day
                , ps_Reg_Id
                , rs_ErrorText
            ) THEN
                rs_Return_Message := '출금스케쥴 삭제 실패!!!'||'-'||rs_ErrorText;
                rs_ErrorText      := rs_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            rs_Return_Message := '처리구분(I,U,D)값 오류!!!['||ps_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    rn_Success_Code := 0;
    rs_Return_Message := '정상적으로 등록되었습니다';
    rs_ErrorText := '';

  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        rn_Success_Code   := -1;
        rs_Return_Message := rs_Return_Message;
        rs_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(rs_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0055.p_IUDRtre0055(1)', rs_ErrorText, rs_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        rn_Success_Code   := -1;
        rs_Return_Message := NVL(TRIM(rs_Return_Message), '시스템관리자에게 문의바랍니다!.');
        rs_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0055.p_IUDRtre0055(2)', rs_ErrorText, rs_Return_Message);

  END p_IUDRtre0055;
  
  
  /*****************************************************************************
  -- 출금요청일 여부 확인
     - 기준일자가 출금요청일인지 확인
     > rs_Return_Cd : A(정기출금), B(수시출금), Z(출금요청일 아님)
     > rs_Req_Ymd : 출금일자
  *****************************************************************************/
  PROCEDURE p_chkRtre0055ReqDay (
      ps_Std_Ymd         IN RTRE0055.REQ_DAY%TYPE        /*기준일자            */
    , ps_Com_Div         IN RTRE0057.COM_DIV%TYPE        /*기관구분(R067)      */
    , rs_Return_Cd      OUT VARCHAR2
    , rs_Req_Ymd        OUT VARCHAR2
  ) IS
  
    ld_Ymd          DATE;
    ln_Chk          NUMBER := 0;
    ln_Gap          NUMBER;                 --출금일-출금요청일 (1인 경우 출금일 1영업일 이전에 출금요청)
    ls_Day          VARCHAR2(1);            --기준일자의 요일(1=일요일~7=토요일)
    ls_WorkDay      VARCHAR2(8);            --기준일자로부터 가장 가까운 영업일자 (ln_Gap 고려) 
    
    ls_NearReqDay   RTRE0055.REQ_DAY%TYPE;  --기준일자 기준 가장 가까운 출금일
    ls_Req_Div      RTRE0055.REQ_DIV%TYPE;
  
  BEGIN
    ld_Ymd := TO_DATE(ps_Std_Ymd, 'YYYYMMDD');
    
    -- 기관구분에 따라 출금요청일 결정
    IF ps_Com_Div = 'A' THEN
        ln_Gap := 1;            --금융결제원의 경우 1영업일전 요청
    ELSIF ps_Com_Div = 'C' THEN
        ln_Gap := 0;            --KCP의 경우 출금일 당일 요청
    ELSE
        rs_Return_Cd := 'Z';
        rs_Req_Ymd   := '';
        RETURN;
    END IF;
    
    -- 기준일자가 휴일인지 확인
    SELECT  COUNT(*), TO_CHAR(ld_Ymd, 'd')
      INTO  ln_Chk  , ls_Day
      FROM  RTRE0057
     WHERE  HOLI_DAY = ps_Std_Ymd
       AND  COM_DIV IN ('Z', ps_Com_Div)
       AND  USE_YN   = 'Y'
    ;
    
    -- 기준일자가 휴일인 경우 요청일 아님
    IF ln_Chk > 0 OR ls_Day IN ('1','7') THEN
        rs_Return_Cd := 'Z';
        rs_Req_Ymd   := '';
        
    ELSE
        
        BEGIN
            -- 기준일자로 부터 가장 가까운 출금일 조회
            SELECT  REQ_DAY      , REQ_DIV
              INTO  ls_NearReqDay, ls_Req_Div
              FROM  RTRE0055
             WHERE  REQ_DAY = (
                        SELECT  MIN(REQ_DAY)
                          FROM  RTRE0055
                         WHERE  REQ_DAY >= TO_CHAR(ld_Ymd + ln_Gap, 'YYYYMMDD')
                           AND  USE_YN   = 'Y'
                    )                     
            ;
    
        EXCEPTION
            -- 청구스케쥴이 등록되지 않은 경우, SMS미발송
            WHEN NO_DATA_FOUND THEN
                rs_Return_Cd := 'Z';
                rs_Req_Ymd   := '';
                
        END;
        
        
        -- 기준일자로 부터 가까운 영업일 조회
        -- - 이 쿼리는 기준일자가 휴일인 경우 원하는 결과가 나오지 않음
        -- - 기준일자가 휴일인 경우 첫 영업일의 RN 값이 1이 아닌 0으로 표기됨
        BEGIN
        
            SELECT  A2.DAY
              INTO  ls_WorkDay
              FROM  (
                    SELECT  A1.DAY
                         ,  ROWNUM-1 AS RN
                      FROM  (
                                SELECT  TO_CHAR(SDT + LEVEL -1, 'd')            AS D
                                     ,  TO_CHAR(SDT + LEVEL -1, 'YYYYMMDD')     AS DAY
                                     ,  EDT - SDT
                                  FROM  (
                                        SELECT  ld_Ymd                          AS SDT
                                             ,  TO_DATE(ls_NearReqDay, 'YYYYMMDD')+1 AS EDT
                                          FROM  DUAL
                                        )
                                CONNECT BY LEVEL <= EDT - SDT
                            ) A1
                         ,  (
                                SELECT  B.HOLI_DAY
                                FROM    RTRE0057 B
                                WHERE   B.HOLI_DAY BETWEEN ld_Ymd AND TO_DATE(ls_NearReqDay, 'YYYYMMDD')+1
                                AND     B.USE_YN = 'Y'
                            ) B1
                     WHERE  A1.DAY       = B1.HOLI_DAY(+)
                       AND  A1.D    NOT IN ('1','7')
                       AND  B1.HOLI_DAY IS NULL
                    ) A2
            WHERE A2.RN = ln_Gap;
        
        EXCEPTION
            -- 청구스케쥴이 등록되지 않은 경우, SMS미발송
            WHEN NO_DATA_FOUND THEN
                rs_Return_Cd := 'Z';
                rs_Req_Ymd   := '';
                
        END;
        
        -- 기준일자로 부터 가장 가까운 출금일과 영업일이 동일하면 출금요청일자임
        IF ls_NearReqDay = ls_WorkDay THEN
            rs_Return_Cd := ls_Req_Div;
            rs_Req_Ymd   := ls_NearReqDay; 
        ELSE
            rs_Return_Cd := 'Z';
            rs_Req_Ymd   := '';        
        END IF;
    
    END IF;        
    
  END p_chkRtre0055ReqDay;
  
  /*****************************************************************************
  -- 출금요청일인 경우 담당자에게 SMS로 알림
  *****************************************************************************/
  PROCEDURE p_notiRtre0055ReqDay (
      rn_Success_Code   OUT NUMBER
    , rs_Return_Message OUT VARCHAR2
    , rs_ErrorText      OUT VARCHAR2
  ) IS
  
    ls_Return_Cd        VARCHAR(20);
    ls_Req_Ymd          VARCHAR(8);
    ls_Snd_Msg          RTSD0205.SND_MSG%TYPE;
    
    e_Error             EXCEPTION;
  
  BEGIN
  
    FOR cur_01 IN (
        SELECT  CD
          FROM  RTCM0051
         WHERE  CD_GRP_CD = 'R067'
           AND  CD NOT IN ('Z')
           AND  USE_YN    = 'Y'
    ) LOOP
    
        -- 오늘이 출금요청일인지 확인
        p_chkRtre0055ReqDay(TO_CHAR(SYSDATE, 'YYYYMMDD'), cur_01.CD, ls_Return_Cd, ls_Req_Ymd);
        
        -- 출금요청일인 경우 SMS발송
        IF ls_Return_Cd IN ('A','B') THEN
        
            ls_Snd_Msg := '[넥센타이어] 오늘은 '||TO_CHAR(TO_DATE(ls_Req_Ymd, 'YYYYMMDD'),'YYYY-MM-DD')||'자 ';
            ls_Snd_Msg := ls_Snd_Msg || Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', cur_01.CD)||' ';
            ls_Snd_Msg := ls_Snd_Msg || Pkg_Rtcm0051.f_sRtcm0051CodeName('R066', ls_Return_Cd)||' 요청일입니다.';

            -- 담당자 모두에게 SMS 반복 발송
            FOR cur_02 IN (
                SELECT  CD
                  FROM  RTCM0051
                 WHERE  CD_GRP_CD = 'R068'
                   AND  USE_YN    = 'Y'
            ) LOOP
                
                NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'I'               /*예약 전송여부         */
                    , '00000000000000'  /*예약 전송시간         */
                    , cur_02.CD         /*받는 전화번호         */
                    , '18550100'        /*보내는 전화번호       */
                    , ls_Snd_Msg        /*메시지내용            */
                    , 'R001'            /*사용자지정 필드1      */
                    , NULL              /*사용자지정 필드2      */
                    , '7'               /*사용자지정 필드3      */
                    , NULL              /*사용자지정 필드4      */
                    , 'BATCHJOB'        /*등록자 ID             */
                    , rn_Success_Code
                    , rs_Return_Message
                    , rs_ErrorText
                );
                
                IF 0 != rn_Success_Code THEN
                    rs_Return_Message := 'SMS발송실패'||'-'||rs_Return_Message;
                    RAISE e_Error;
                END IF;
                
            END LOOP;
            
        END IF;
    
    END LOOP;
    
    rn_Success_Code   := 0;
    rs_Return_Message := '정상적으로 처리되었습니다';
    rs_ErrorText      := '';
    
  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        rn_Success_Code   := -1;
        rs_Return_Message := rs_Return_Message;
        rs_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(rs_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0055.p_notiRtre0055ReqDay(1)', rs_ErrorText, rs_Return_Message);
        
    WHEN OTHERS THEN
        ROLLBACK;
        rn_Success_Code   := -1;
        rs_Return_Message := NVL(TRIM(rs_Return_Message), '시스템관리자에게 문의바랍니다!.');
        rs_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0055.p_notiRtre0055ReqDay(2)', rs_ErrorText, rs_Return_Message);    
  
  END p_notiRtre0055ReqDay;
  
  /*****************************************************************************
  -- 출금요청일인데 파일다운로드 되지 않은 경우 담당자에게 SMS로 알림
  *****************************************************************************/
  PROCEDURE p_notiRtre0055Filedown (
      rn_Success_Code   OUT NUMBER
    , rs_Return_Message OUT VARCHAR2
    , rs_ErrorText      OUT VARCHAR2
  ) IS

    ln_chk              NUMBER := 0; 
    ls_Return_Cd        VARCHAR(20);
    ls_Req_Ymd          VARCHAR(8);
    ls_Snd_Msg          RTSD0205.SND_MSG%TYPE;
    ls_File_Tp          RTRE0099.FILE_TP%TYPE;
    
    e_Error             EXCEPTION;
  
  BEGIN
  
    FOR cur_01 IN (
        SELECT  CD
          FROM  RTCM0051
         WHERE  CD_GRP_CD = 'R067'
           AND  CD NOT IN ('Z')
           AND  USE_YN    = 'Y'
    ) LOOP
    
        -- 오늘이 출금요청일인지 확인
        p_chkRtre0055ReqDay(TO_CHAR(SYSDATE, 'YYYYMMDD'), cur_01.CD, ls_Return_Cd, ls_Req_Ymd);
        
        -- 출금요청일인 경우 
        IF ls_Return_Cd IN ('A','B') THEN
        
            IF cur_01.CD = 'A' THEN
                ls_File_Tp := 'EB21';
            ELSE
                ls_File_Tp := 'BC02_INX';
            END IF;
            
            -- 출금요청 파일이 다운로드 되었는지 확인
            SELECT  COUNT(*)
              INTO  ln_chk
              FROM  RTRE0099
             WHERE  FILE_TP  = ls_File_Tp
               AND  RQST_DAY = ls_Req_Ymd
               AND  FCRET_YN = 'Y'   
            ;
            
            -- 출금요청 파일이 다운로드 되었지 않으면 담당자에게 SMS 발송
            IF ln_chk = 0THEN
            
                ls_Snd_Msg := '[넥센타이어] '||TO_CHAR(TO_DATE(ls_Req_Ymd, 'YYYYMMDD'),'YYYY-MM-DD')||'자 ';
                ls_Snd_Msg := ls_Snd_Msg || Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', cur_01.CD)||' ';
                ls_Snd_Msg := ls_Snd_Msg || Pkg_Rtcm0051.f_sRtcm0051CodeName('R066', ls_Return_Cd)||' 파일이 다운로드 되지 않았습니다. 확인 부탁 드립니다.';

                -- 담당자 모두에게 SMS 반복 발송
                FOR cur_02 IN (
                    SELECT  CD
                      FROM  RTCM0051
                     WHERE  CD_GRP_CD = 'R068'
                       AND  USE_YN    = 'Y'
                ) LOOP
                    
                    NXRADMIN.Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                          'I'               /*예약 전송여부         */
                        , '00000000000000'  /*예약 전송시간         */
                        , cur_02.CD         /*받는 전화번호         */
                        , '18550100'        /*보내는 전화번호       */
                        , ls_Snd_Msg        /*메시지내용            */
                        , 'R002'            /*사용자지정 필드1      */
                        , NULL              /*사용자지정 필드2      */
                        , '7'               /*사용자지정 필드3      */
                        , NULL              /*사용자지정 필드4      */
                        , 'BATCHJOB'        /*등록자 ID             */
                        , rn_Success_Code
                        , rs_Return_Message
                        , rs_ErrorText
                    );
                    
                    IF 0 != rn_Success_Code THEN
                        rs_Return_Message := 'SMS발송실패'||'-'||rs_Return_Message;
                        RAISE e_Error;
                    END IF;
                    
                END LOOP;
            
            END IF;
            
        END IF;
    
    END LOOP;
    
    rn_Success_Code   := 0;
    rs_Return_Message := '정상적으로 처리되었습니다';
    rs_ErrorText      := '';
    
  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        rn_Success_Code   := -1;
        rs_Return_Message := rs_Return_Message;
        rs_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(rs_ErrorText);
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0055.p_notiRtre0055Filedown(1)', rs_ErrorText, rs_Return_Message);
        
    WHEN OTHERS THEN
        ROLLBACK;
        rn_Success_Code   := -1;
        rs_Return_Message := NVL(TRIM(rs_Return_Message), '시스템관리자에게 문의바랍니다!.');
        rs_ErrorText      := SUBSTR(SQLERRM, 1, 200);
--        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0055.p_notiRtre0055Filedown(2)', rs_ErrorText, rs_Return_Message);    
  
  END p_notiRtre0055Filedown;
    
END Pkg_Rtre0055;