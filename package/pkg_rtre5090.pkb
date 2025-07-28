CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_RTRE5090 AS
/*******************************************************************************
    NAME        PKG_RTRE5090
    PURPOSE     방문점검수수료 기초집계 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            [20170519_01] 신규작성
*******************************************************************************/

  /*****************************************************************************
  -- 방문점검수수료 기초집계 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
  *****************************************************************************/
  PROCEDURE p_sRtre5090 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*마감년월            */    
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.SLCM_YM
         ,  A1.ORD_NO
         ,  A1.EQU_NO
         ,  A1.SERV_SEQ
         ,  A1.SERV_DSEQ
         ,  A1.STD_YM         
         ,  A1.JOB_SEQ
         ,  A1.R_MRCD       AS PROC_MR_CD
         ,  B1.CARMASTER_NM AS PROC_MR_NM
         ,  A1.PROC_DAY
         ,  A1.PROC_TM
         ,  A1.JOB_DSEQ
         ,  A1.BLD_MNG_NO
         ,  A1.ADDR1
         ,  A1.ADDR2
         ,  A1.AMT_COMM
         ,  A1.CHG_JOB_SEQ
         ,  A1.REG_ID
         ,  A1.REG_DT
         ,  A1.CHG_ID
         ,  A1.CHG_DT     
      FROM  RTRE5090 A1
         ,  RTCS0002 B1
     WHERE  A1.SLCM_YM = v_Slcm_Ym
       AND  A1.R_MRCD  = B1.CARMASTER_NU(+)
    ;

  END p_sRtre5090; 
  
  /*****************************************************************************
   -- 방문점검수수료 기초 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
   *****************************************************************************/
  PROCEDURE p_CreateRtre5090RegularchkComm(  v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE  /* 마감년월 */
                                           , v_Amt_Comm       IN RTRE5090.AMT_COMM%TYPE /*기본수수료 */
                                           , v_Reg_Id         IN RTRE5090.REG_ID%TYPE   /* 작업자 ID */
                                           , v_Success_Code   OUT NUMBER
                                           , v_Return_Message OUT VARCHAR2
                                           , v_ErrorText      OUT VARCHAR2
                                          )
  IS
    -- 변수 선언
    ln_chk  NUMBER DEFAULT 0;
    
    -- 예외 선언
    e_Error EXCEPTION;
  
  BEGIN
  
    /*
     * 입력값 유효성 검증
     */
    -- 기본수수료  
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '기본수수료(' || v_Amt_Comm || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 등록자  
    IF(TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID(' || v_Reg_Id || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 당월 서비스수수료 집계 진행여부 확인
     */
    SELECT COUNT(*)
    INTO   ln_chk
    FROM   RTRE5060
    WHERE  SLCM_YM = v_Slcm_Ym;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월(' || v_Slcm_Ym || ') 서비스수수료 기초집계작업이 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 기존 집계데이터 삭제
     */
    DELETE RTRE5090
    WHERE  SLCM_YM = v_Slcm_Ym;
    
    /*
     * 집계
     */
    INSERT INTO RTRE5090
    SELECT  v_Slcm_Ym    
          , A1.ORD_NO
          , A1.EQU_NO
          , A1.SERV_SEQ
          , B1.SEQ
          , C1.STD_YM
          , C1.JOB_SEQ
          , C1.R_MRCD
          , A1.PROC_DAY
          , A1.PROC_TM
          , D1.SEQ
          , D1.BLD_MNG_NO
          , D1.ADDR1
          , D1.ADDR2
          , v_Amt_Comm
          , NULL
          , v_Reg_Id
          , SYSDATE
          , v_Reg_Id
          , SYSDATE
    FROM    RTCS0007 A1
          , (SELECT  ROW_NUMBER() OVER(PARTITION BY X.ORD_NO, X.EQU_NO, X.SERV_SEQ ORDER BY X.SEQ DESC) AS ROW_NUM
                   , X.*
             FROM    RTCS0008 X
             WHERE   X.SERVICE_CD IN('B00003')
            )        B1
          , RTCS0005 C1
          , (SELECT  ROW_NUMBER() OVER(PARTITION BY X.STD_YM, X.ORD_NO, X.EQU_NO, X.JOB_SEQ ORDER BY X.SEQ DESC) AS ROW_NUM
                   , X.*
             FROM    RTCS0006 X
            )        D1
          , RTCS0002 E1
    WHERE   A1.PROC_DAY BETWEEN v_Slcm_Ym || '01'
                        AND     TO_CHAR(LAST_DAY(TO_DATE(v_Slcm_Ym, 'YYYYMM')), 'YYYYMMDD')
    AND     A1.ORD_NO         = B1.ORD_NO
    AND     A1.EQU_NO         = B1.EQU_NO
    AND     A1.SERV_SEQ       = B1.SERV_SEQ
    AND     B1.ROW_NUM        = 1
    AND     A1.ORD_NO         = C1.ORD_NO
    AND     A1.EQU_NO         = C1.EQU_NO
    AND     A1.SERV_SEQ       = C1.SERV_SEQ
    AND     C1.STD_YM         = D1.STD_YM
    AND     C1.ORD_NO         = D1.ORD_NO
    AND     C1.EQU_NO         = D1.EQU_NO
    AND     C1.JOB_SEQ        = D1.JOB_SEQ
    AND     D1.ROW_NUM        = 1
    AND     C1.R_MRCD         = E1.CARMASTER_NU
    AND     E1.ORD_AGENT     IS NOT NULL;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';
    
    EXCEPTION
        WHEN e_Error THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := v_Return_Message;
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200) || ':' || TRIM(v_ErrorText);
            --Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5090.p_CreateRtre5090RegularchkComm(1)', v_ErrorText, v_Return_Message);
        
        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code   := -1;
            v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::' || SUBSTR(SQLERRM, 1, 200));
            v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
            --Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5090.p_CreateRtre5090RegularchkComm(2)', v_ErrorText, v_Return_Message);
  
  END p_CreateRtre5090RegularchkComm;
  
  /*****************************************************************************
  -- 방문점검수수료 변경
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
  *****************************************************************************/
  FUNCTION f_UpdateRtre5090Commamt (
      v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*마감년월            */
    , v_Std_Ym         IN RTRE5090.STD_YM%TYPE          /*배정기준년월        */
    , v_Ord_No         IN RTRE5090.ORD_NO%TYPE          /*계약번호            */
    , v_Amt_Comm       IN RTRE5090.AMT_COMM%TYPE        /*변경수수료          */
    , v_Chg_Job_Seq    IN RTRE5090.CHG_JOB_SEQ%TYPE     /*변경작업회차        */    
    , v_Reg_Id         IN RTRE5090.REG_ID%TYPE          /*작업자 ID           */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  BEGIN

    UPDATE  RTRE5090
       SET  AMT_COMM    = v_Amt_Comm
         ,  CHG_JOB_SEQ = v_Chg_Job_Seq
         ,  CHG_ID      = v_Reg_Id
         ,  CHG_DT      = SYSDATE
     WHERE  SLCM_YM     = v_Slcm_Ym
       AND  STD_YM      = v_Std_Ym
       AND  ORD_NO      = v_Ord_No;       

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre5090Commamt;
  
/*****************************************************************************
  -- NEW 방문점검수수료 기초 집계
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2017-05-24  wjim            신규작성
  *****************************************************************************/
  PROCEDURE p_CreateRtre5090RegularchkNew (
      v_Slcm_Ym        IN RTRE5090.SLCM_YM%TYPE         /*마감년월            */
    , v_Reg_Id         IN RTRE5090.REG_ID%TYPE          /*작업자 ID           */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
    -- 변수 선언  
    ln_chk  NUMBER DEFAULT 0;
    
    -- 예외 선언
    e_Error EXCEPTION;
    
  BEGIN

    /*
     * 입력값 유효성 검증
     */
    -- 등록자  
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 당월 서비스수수료 집계 진행여부 확인
     */
    SELECT  COUNT(*)
      INTO  ln_chk
      FROM  RTRE5060
     WHERE  SLCM_YM = v_Slcm_Ym;
    
    IF ln_chk > 0 THEN
        v_Return_Message := '해당월('||v_Slcm_Ym||') 서비스수수료 기초집계작업이 완료되어 처리가 불가합니다!';
        RAISE e_Error;
    END IF;
    
    /*
     * 기존 집계데이터 삭제
     */
    DELETE  RTRE5090
     WHERE  SLCM_YM = v_Slcm_Ym;          
    
    /*
     * 집계
     */
    INSERT  INTO RTRE5090 (
        SLCM_YM,    ORD_NO,     EQU_NO,
        SERV_SEQ,   SERV_DSEQ,  STD_YM,
        JOB_SEQ,    R_MRCD,     PROC_DAY,
        PROC_TM,    JOB_DSEQ,   BLD_MNG_NO,
        ADDR1,      ADDR2,      AMT_COMM,
        CHG_JOB_SEQ,REG_ID,     REG_DT,
        CHG_ID,     CHG_DT
    )
    SELECT    v_Slcm_Ym
            ,  A.ORD_NO
            ,  A.EQU_NO
            ,  A.SERV_SEQ
            ,  A.RTCS0008_SEQ
            ,  A.STD_YM
            ,  A.JOB_SEQ
            ,  A.R_MRCD
            ,  A.PROC_DAY
            ,  A.PROC_TM
            ,  A.RTCS0006_SEQ
            ,  A.BLD_MNG_NO
            ,  A.ADDR1
            ,  A.ADDR2
            ,  NVL(C.APL_AMT, 0) APL_AMT
            ,  NULL
            ,  A.REG_ID
            ,  A.REG_DT
            ,  A.CHG_ID
            ,  A.CHG_DT
      FROM (
            SELECT  A.ORD_NO
                 ,  A.EQU_NO
                 ,  A.SERV_SEQ
                 ,  B.SEQ RTCS0008_SEQ
                 ,  C.STD_YM
                 ,  C.JOB_SEQ
                 ,  C.R_MRCD
                 ,  SUM(1) OVER(PARTITION BY C.R_MRCD) VISIT_CNT
                 ,  NVL(E.SALES_CNT, 0) SALES_CNT
                 ,  NVL(E.CNT_CD, 0) CNT_CD
                 ,  A.PROC_DAY
                 ,  A.PROC_TM
                 ,  D.SEQ RTCS0006_SEQ
                 ,  D.BLD_MNG_NO
                 ,  D.ADDR1
                 ,  D.ADDR2
                 ,  NVL(E.CARMASTER_NU, C.R_MRCD) CARMASTER_NU
                 ,  E.ORD_AGENT
                 ,  NULL
                 ,  v_Reg_Id   REG_ID
                 ,  SYSDATE     REG_DT
                 ,  v_Reg_Id   CHG_ID
                 ,  SYSDATE     CHG_DT
            FROM RTCS0007 A
                INNER JOIN (
                    SELECT ROW_NUMBER() OVER (PARTITION BY X.ORD_NO, X.EQU_NO, X.SERV_SEQ ORDER BY X.SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0008 X
                     WHERE  X.SERVICE_CD IN ('B00003')
                ) B ON
                        A.ORD_NO = B.ORD_NO
                    AND A.EQU_NO = B.EQU_NO
                    AND A.SERV_SEQ = B.SERV_SEQ
                    AND B.ROW_NUM = 1
                INNER JOIN RTCS0005 C ON
                        A.ORD_NO = C.ORD_NO
                    AND A.EQU_NO = C.EQU_NO
                    AND A.SERV_SEQ = C.SERV_SEQ
                INNER JOIN (
                    SELECT  ROW_NUMBER() OVER (PARTITION BY X.STD_YM, X.ORD_NO, X.EQU_NO, X.JOB_SEQ ORDER BY X.SEQ DESC) AS ROW_NUM
                         ,  X.*
                      FROM  RTCS0006 X
                ) D ON
                        C.STD_YM = D.STD_YM
                    AND C.ORD_NO = D.ORD_NO
                    AND C.EQU_NO = D.EQU_NO
                    AND C.JOB_SEQ = D.JOB_SEQ
                    AND D.ROW_NUM = 1
                INNER JOIN (
                    SELECT A.CARMASTER_NU,
                           A.ORD_AGENT,
                           COUNT(B.ORD_AGENT) SALES_CNT,
                           SUM(B.CNT_CD) CNT_CD
                      FROM RTCS0002 A
                            LEFT OUTER JOIN RTSD0108 B ON
                                A.ORD_AGENT = B.ORD_AGENT
                            AND B.PROC_DAY LIKE v_Slcm_Ym || '%'
                      GROUP BY
                            A.CARMASTER_NU,
                            A.ORD_AGENT 
                ) E ON 
                    C.R_MRCD = E.CARMASTER_NU
           WHERE 1=1
             AND A.PROC_DAY  BETWEEN v_Slcm_Ym||'01' AND TO_CHAR(LAST_DAY(TO_DATE(v_Slcm_Ym,'YYYYMM')),'YYYYMMDD')               
          ) A
            LEFT OUTER JOIN (
                SELECT *
                  FROM RTRE5000
                 WHERE 1=1
                   AND SLS_CD = 'R'
                   AND BNS_CD = 'F'
                   AND PYM_CD = 'FEE'
            ) C ON
                     A.VISIT_CNT BETWEEN CASE WHEN C.PRF_MIN = -1 THEN A.VISIT_CNT ELSE C.PRF_MIN END
                                     AND CASE WHEN C.PRF_MAX = -1 THEN A.VISIT_CNT ELSE C.PRF_MAX END
                 AND A.CNT_CD BETWEEN CASE WHEN C.SALE_MIN = -1 THEN A.CNT_CD ELSE C.SALE_MIN END
                                     AND CASE WHEN C.SALE_MAX = -1 THEN A.CNT_CD ELSE C.SALE_MAX END
      WHERE 1=1;
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5090.p_CreateRtre5090RegularchkCommNew(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '에러!::'||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTRE5090.p_CreateRtre5090RegularchkCommNew(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre5090RegularchkNew;

  
END PKG_RTRE5090;