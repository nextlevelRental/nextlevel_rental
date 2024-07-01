CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0045 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0045
   PURPOSE:   판매채널등록
    
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-11-20  sePark         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 판매채널등록 [추가] Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0045 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0045.SALE_CD%TYPE         /* 판매코드            */
  ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT LPAD('', 2*(LEVEL-1)) || ORG_NM AS CD_NM
         , LEVEL
         , 0 CHK         
         , A.CHAN_CD
         , A.P_CHAN_CD
         , A.ORG_CD         
         , A.ORG_NM
      FROM ( 
            SELECT CHAN_CD,
                  P_CHAN_CD,
                  ORG_CD,                  
                  CD_NM AS ORG_NM 
             FROM (     
                   SELECT CD AS CHAN_CD,
                          NULL AS P_CHAN_CD,
                          '' AS ORG_CD,                          
                          CD_NM
                     FROM RTCM0051  
                    WHERE CD_GRP_CD = 'S090'
                      AND USE_YN = 'Y'
                   UNION ALL
                   SELECT CD AS CHAN_CD,
                          SUBSTR(CD, 0, 2) AS P_CHAN_CD,
                          '' AS ORG_CD,
                          CD_NM
                     FROM RTCM0051  
                    WHERE CD_GRP_CD = 'S091'
                      AND USE_YN = 'Y' )
            UNION ALL 
            SELECT ORG_CD AS CHAN_CD,
                   NVL(P_CHAN_CD, CHAN_CD||'00') P_CHAN_CD,
                   ORG_CD,
                   ORG_NM AS ORG_NM          
             FROM (           
                   SELECT CHAN_CD,
                          CHAN_MCLS_CD AS P_CHAN_CD,
                          ORD_AGENT AS ORG_CD,
                          ORG_AGNM AS ORG_NM
                     FROM RTSD0113
                    WHERE USE_YN = 'Y'  
                   /*UNION ALL
                   SELECT CHAN_MCLS_CD AS CHAN_CD,
                          CHAN_MCLS_CD AS P_CHAN_CD,
                          AGENCY_CD AS ORG_CD,
                          AGENCY_NM AS ORG_NM
                     FROM RTSD0007
                    WHERE USE_YN = 'Y'*/)
         ) A 
    WHERE 1=1 
      AND A.P_CHAN_CD IS NULL
    START WITH A.P_CHAN_CD IS NULL
  CONNECT BY PRIOR A.CHAN_CD = A.P_CHAN_CD;
  END p_sRtsd0045;

  /*****************************************************************************
  -- 기존정보만 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0045select (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0045.SALE_CD%TYPE     /* 판매상품코드            */
  ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT *
      FROM
     (    
        SELECT CHAN_CD
             , P_CHAN_CD
             , ORG_CD
             , ORG_NM
             , 1 AS CHK
             ,
               CASE WHEN LENGTH(CHAN_CD)=2 THEN '1'
                    WHEN LENGTH(CHAN_CD)=4 THEN '2'
                    ELSE '3'
               END LEVEL2
             , ORG_NM AS CD_NM
          FROM RTSD0045 
         WHERE 1=1
           AND SALE_CD = v_Sale_Cd
    )
    START WITH LEVEL2 = '1'
    CONNECT BY NOCYCLE PRIOR CHAN_CD = P_CHAN_CD           
;
  END p_sRtsd0045select;

  /*****************************************************************************
  -- 기존정보를 제외한 코드만 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0045selectAdd (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0045.SALE_CD%TYPE,     /* 판매상품코드            */
    v_P_CHAN_CD     IN RTSD0045.P_CHAN_CD%TYPE      /* 부모코드              */
  ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT LPAD('', 2*(LEVEL-1)) || ORG_NM AS CD_NM
         , LEVEL
         , 0 CHK         
         , A.CHAN_CD
         , A.P_CHAN_CD
         , A.ORG_CD                  
         , A.ORG_NM
      FROM ( 
            SELECT CHAN_CD,
                  P_CHAN_CD,
                  ORG_CD,
                  CD_NM AS ORG_NM 
             FROM (     
                   SELECT CD AS CHAN_CD,
                          NULL AS P_CHAN_CD,
                          '' AS ORG_CD,
                          CD_NM
                     FROM RTCM0051  
                    WHERE CD_GRP_CD = 'S090'
                      AND USE_YN = 'Y'
                   UNION ALL
                   SELECT CD AS CHAN_CD,
                          SUBSTR(CD, 0, 2) AS P_CHAN_CD,
                          '' AS ORG_CD,                          
                          CD_NM
                     FROM RTCM0051  
                    WHERE CD_GRP_CD = 'S091'
                      AND USE_YN = 'Y' )
            UNION ALL 
            SELECT ORG_CD AS CHAN_CD,
                   NVL(P_CHAN_CD, CHAN_CD||'00') P_CHAN_CD,
                   ORG_CD,                          
                   ORG_NM AS ORG_NM          
             FROM (           
                   SELECT CHAN_CD,
                          CHAN_MCLS_CD AS P_CHAN_CD,
                          ORD_AGENT AS ORG_CD,
                          ORG_AGNM AS ORG_NM
                     FROM RTSD0113
                    WHERE USE_YN = 'Y'  
                   /*UNION ALL
                   SELECT CHAN_MCLS_CD AS CHAN_CD,
                          CHAN_MCLS_CD AS P_CHAN_CD,
                          AGENCY_CD AS ORG_CD,
                          AGENCY_NM AS ORG_NM
                     FROM RTSD0007
                    WHERE USE_YN = 'Y'*/)
         ) A   
    WHERE 1=1
      AND A.P_CHAN_CD = v_P_CHAN_CD
      AND A.CHAN_CD NOT IN 
          (SELECT AR.CHAN_CD FROM RTSD0045 AR 
           WHERE AR.SALE_CD = v_Sale_Cd
             AND AR.P_CHAN_CD = v_P_CHAN_CD)
    START WITH A.P_CHAN_CD IS NULL
    CONNECT BY PRIOR A.CHAN_CD = A.P_CHAN_CD
;  
  END p_sRtsd0045selectAdd;

  /*****************************************************************************
  -- 판매채널등록 [추가] 이벤트(2-3레벨)
  *****************************************************************************/
  PROCEDURE p_sRtsd0045_detail (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE      /* 부모코드              */
  ) IS
  BEGIN
    OPEN Ref_Cursor FOR
    SELECT LPAD('', 2*(LEVEL-1)) || ORG_NM AS CD_NM
         , LEVEL
         , 0 CHK
         , A.CHAN_CD
         , A.P_CHAN_CD
         , A.ORG_CD                  
         , A.ORG_NM
      FROM ( 
            SELECT CHAN_CD,
                  P_CHAN_CD,
                  ORG_CD,                                    
                  CD_NM AS ORG_NM 
             FROM (     
                   SELECT CD AS CHAN_CD,
                          NULL AS P_CHAN_CD,
                          '' AS ORG_CD,                                                    
                          CD_NM
                     FROM RTCM0051  
                    WHERE CD_GRP_CD = 'S090'
                      AND USE_YN = 'Y' 
                   UNION ALL
                   SELECT CD AS CHAN_CD,
                          SUBSTR(CD, 0, 2) AS P_CHAN_CD,
                          '' AS ORG_CD,                                                    
                          CD_NM
                     FROM RTCM0051  
                    WHERE CD_GRP_CD = 'S091'
                      AND USE_YN = 'Y' )
            UNION ALL 
            SELECT ORG_CD AS CHAN_CD,
                   NVL(P_CHAN_CD, CHAN_CD||'00') P_CHAN_CD,
                   ORG_CD,
                   ORG_NM AS ORG_NM          
             FROM (           
                   SELECT CHAN_CD,
                          CHAN_MCLS_CD AS P_CHAN_CD,
                          ORD_AGENT AS ORG_CD,
                          ORG_AGNM AS ORG_NM
                     FROM RTSD0113
                    WHERE USE_YN = 'Y'  
                   /*UNION ALL
                   SELECT CHAN_MCLS_CD AS CHAN_CD,
                          CHAN_MCLS_CD AS P_CHAN_CD,
                          AGENCY_CD AS ORG_CD,
                          AGENCY_NM AS ORG_NM
                     FROM RTSD0007
                    WHERE USE_YN = 'Y'*/)
         ) A 
    WHERE 1=1 
      AND A.P_CHAN_CD = v_P_CHAN_CD
    START WITH A.P_CHAN_CD IS NULL
    CONNECT BY PRIOR A.CHAN_CD = A.P_CHAN_CD
;  
  END p_sRtsd0045_detail;

  /*****************************************************************************
  -- 채널구분 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0045 (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D)       */
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* 판매코드              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE,        /* 채널구분(대분류)       */
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE,      /* 부모코드              */
    v_ORG_CD         IN RTSD0045.ORG_CD%TYPE,         /* 판매인코드            */    
    v_ORG_NM         IN RTSD0045.ORG_NM%TYPE,         /* 판매인명              */
    v_Reg_Id         IN RTSD0045.REG_ID%TYPE,         /* 등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN
    IF 0 != f_InsertRtsd0045(v_SALE_CD, v_CHAN_CD, v_P_CHAN_CD, v_ORG_CD, v_ORG_NM, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '판매코드 저장 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;
  
    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0045.p_IUDRtsd0045(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0045.p_IUDRtsd0045(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0045;

  /*****************************************************************************
  -- 판매코드 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0045Count(
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* 판매코드              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE        /* 채널구분(대분류)       */
    ) RETURN NUMBER IS
    v_curr_count   NUMBER DEFAULT 0;
  BEGIN

   SELECT  COUNT(*)
     INTO   v_curr_count
     FROM   RTSD0045
    WHERE   SALE_CD      = v_SALE_CD
      AND   CHAN_CD      = v_CHAN_CD
    ;

    RETURN v_curr_count;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0045Count;

  /*****************************************************************************
  -- Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0045 (
    v_SALE_CD         IN RTSD0045.SALE_CD%TYPE        /* 판매코드              */
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0045
    WHERE  SALE_CD = v_SALE_CD;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0045.f_DeleteRtsd0045(1)', '판매코드', v_SALE_CD);

    RETURN SQLCODE;
  END f_DeleteRtsd0045;

  /*****************************************************************************
  -- Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0045 (
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* 판매코드              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE,        /* 채널구분(대분류)       */
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE,      /* 부모코드              */
    v_ORG_CD         IN RTSD0045.ORG_CD%TYPE,         /* 판매인코드            */    
    v_ORG_NM         IN RTSD0045.ORG_NM%TYPE,         /* 판매인명              */ 
    v_Reg_Id         IN RTSD0045.REG_ID%TYPE,         /* 등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    INSERT  INTO RTSD0045 (
            SALE_CD,
            CHAN_CD,
            P_CHAN_CD,
            ORG_CD,
            ORG_NM,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_SALE_CD,
            v_CHAN_CD,
            v_P_CHAN_CD,
            v_ORG_CD,
            v_ORG_NM,
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

  END f_InsertRtsd0045;    

  /*****************************************************************************
  -- 필터 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0045filter (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Org_Nm        IN     RTSD0045.ORG_NM%TYPE     /* 판매인명                */
  ) IS  
BEGIN
    OPEN Ref_Cursor FOR
    SELECT LPAD('', 2*(LEVEL-1)) || ORG_NM AS CD_NM
         , LEVEL
         , 0 CHK
         , A.CHAN_CD
         , A.P_CHAN_CD
         , A.ORG_CD
         , A.ORG_NM
      FROM ( 
            SELECT CHAN_CD,
                  P_CHAN_CD,
                  ORG_CD,
                  CD_NM AS ORG_NM 
             FROM (     
                   SELECT CD AS CHAN_CD,
                          NULL AS P_CHAN_CD,
                          '' AS ORG_CD,
                          CD_NM
                     FROM RTCM0051  
                    WHERE CD_GRP_CD = 'S090'
                      AND USE_YN = 'Y' 
                   UNION ALL
                   SELECT CD AS CHAN_CD,
                          SUBSTR(CD, 0, 2) AS P_CHAN_CD,
                          '' AS ORG_CD,
                          CD_NM
                     FROM RTCM0051  
                    WHERE CD_GRP_CD = 'S091'
                      AND USE_YN = 'Y' )
            UNION ALL 
            SELECT ORG_CD AS CHAN_CD,
                   NVL(P_CHAN_CD, CHAN_CD||'00') P_CHAN_CD,
                   ORG_CD,
                   ORG_NM AS ORG_NM          
             FROM (           
                   SELECT CHAN_CD,
                          CHAN_MCLS_CD AS P_CHAN_CD,
                          ORD_AGENT AS ORG_CD,
                          ORG_AGNM AS ORG_NM
                     FROM RTSD0113
                    WHERE USE_YN = 'Y'  
                   /*UNION ALL
                   SELECT CHAN_MCLS_CD AS CHAN_CD,
                          CHAN_MCLS_CD AS P_CHAN_CD,
                          AGENCY_CD AS ORG_CD,
                          AGENCY_NM AS ORG_NM
                     FROM RTSD0007
                    WHERE USE_YN = 'Y'*/)
         ) A 
     WHERE A.ORG_NM LIKE v_Org_Nm || '%' 
    START WITH A.P_CHAN_CD IS NULL
    CONNECT BY PRIOR A.CHAN_CD = A.P_CHAN_CD
;  
  END p_sRtsd0045filter; 
  
  /*****************************************************************************
  -- 상품판매구분 별 사용채널 목록
  *****************************************************************************/ 
  PROCEDURE p_userChanCdList (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_SALE_CD       IN RTSD0045.SALE_CD%TYPE           /* 판매코드             */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
     
    SELECT AA.CHAN_CD 
      FROM (
            SELECT LPAD(' ', 2*(LEVEL-1)) || ORG_NM , LEVEL, A.*, CONNECT_BY_ISLEAF AS ISLEAF
              FROM ( 
                    SELECT CHAN_CD,
                          P_CHAN_CD,
                          CD_NM AS ORG_NM 
                     FROM (     
                           SELECT CD AS CHAN_CD,
                                  NULL AS P_CHAN_CD,
                                  CD_NM
                             FROM RTCM0051  
                            WHERE CD_GRP_CD = 'S090'
                              AND USE_YN = 'Y' 
                           UNION ALL
                           SELECT CD AS CHAN_CD,
                                  SUBSTR(CD, 0, 2) AS P_CHAN_CD,
                                  CD_NM
                             FROM RTCM0051  
                            WHERE CD_GRP_CD = 'S091'
                              AND USE_YN = 'Y' )
                    UNION ALL 
                    SELECT ORG_CD AS CHAN_CD,
                           NVL(P_CHAN_CD, CHAN_CD||'00') P_CHAN_CD,
                           ORG_NM AS ORG_NM          
                     FROM (           
                           SELECT CHAN_CD,
                                  CHAN_MCLS_CD AS P_CHAN_CD,
                                  ORD_AGENT AS ORG_CD,
                                  ORG_AGNM AS ORG_NM
                             FROM RTSD0113
                            WHERE USE_YN = 'Y'  
                          )
                 ) A 
            START WITH A.CHAN_CD IN (SELECT CHAN_CD
                                       FROM RTSD0045
                                      WHERE CHAN_CD NOT IN (SELECT P_CHAN_CD FROM RTSD0045 WHERE SALE_CD = v_SALE_CD AND P_CHAN_CD IS NOT NULL)
                                        AND SALE_CD = v_SALE_CD)
            CONNECT BY PRIOR A.CHAN_CD = A.P_CHAN_CD ) AA
      WHERE AA.ISLEAF > 0;
  
  END p_userChanCdList; 

END Pkg_Rtsd0045;
/
