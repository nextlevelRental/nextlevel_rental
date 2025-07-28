CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0402 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0402
    PURPOSE     방문장착 이력정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-02  wjim            [20181122_01] Created this package body.
*******************************************************************************/
  
  /*****************************************************************************
  -- 방문장착 이력정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-02  wjim            [20181122_01] Created this package body.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0402 (
      v_Ord_No         IN RTSD0402.ORD_NO%TYPE        /*계약번호              */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTSD0402 (
          ORD_NO
        , SEQ
        , AGENCY_CD
        , REQ_DAY
        , PROC_DAY
        , PROC_TM
        , MOB_NO
        , BLD_MNG_NO
        , POSCD
        , ADDR1
        , ADDR2
        , STAT_CD
        , STAT_DTL_CD
        , MEMO
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT            
    )
    SELECT  ORD_NO
         ,  NVL((
                SELECT  MAX(B0.SEQ)
                  FROM  RTSD0402 B0
                 WHERE  B0.ORD_NO    = A1.ORD_NO
                   AND  B0.AGENCY_CD = A1.AGENCY_CD
            )+ 1, 1) AS SEQ
         ,  AGENCY_CD
         ,  REQ_DAY
         ,  PROC_DAY
         ,  PROC_TM
         ,  MOB_NO
         ,  BLD_MNG_NO
         ,  POSCD
         ,  ADDR1
         ,  ADDR2
         ,  STAT_CD
         ,  STAT_DTL_CD
         ,  MEMO
         ,  REG_ID
         ,  REG_DT
         ,  CHG_ID
         ,  CHG_DT
      FROM  RTSD0401 A1
     WHERE  ORD_NO = v_Ord_No
    ;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0402;
  
  /*****************************************************************************
  -- 방문장착 이력정보 목록 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-02  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0402 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTSD0402.ORD_NO%TYPE        /*계약번호             */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.ORD_NO
         ,  A1.SEQ
         ,  A1.AGENCY_CD
         ,  B1.AGENCY_NM
         ,  A1.REQ_DAY
         ,  A1.PROC_DAY
         ,  A1.PROC_TM
         ,  A1.MOB_NO
         ,  A1.BLD_MNG_NO
         ,  A1.POSCD
         ,  A1.ADDR1
         ,  A1.ADDR2
         ,  A1.STAT_CD
         ,  ZA.CD_NM       AS STAT_NM
         ,  A1.STAT_DTL_CD
         ,  ZB.CD_NM       AS STAT_DTL_NM
         ,  A1.MEMO
         ,  A1.REG_ID
         ,  to_char(A1.REG_DT,'YYYYMMDDHH24MISS') AS REG_DT
         ,  A1.CHG_ID
         ,  to_char(A1.CHG_DT,'YYYYMMDDHH24MISS') AS CHG_DT
      FROM  RTSD0402 A1
         ,  RTSD0007 B1
         ,  RTCM0051 ZA
         ,  RTCM0051 ZB
     WHERE  1=1
       AND  A1.ORD_NO       = DECODE(v_Ord_No, NULL, A1.ORD_NO, v_Ord_No)
       AND  A1.AGENCY_CD    = B1.AGENCY_CD(+)
       AND  A1.STAT_CD      = ZA.CD(+)
       AND  ZA.CD_GRP_CD(+) = 'S105'
       AND  A1.STAT_DTL_CD  = ZB.CD(+)
       AND  ZB.CD_GRP_CD(+) = 'S106'
     ORDER  BY A1.ORD_NO
         ,  A1.SEQ DESC
    ; 

  END p_sRTSD0402; 
        
END Pkg_Rtsd0402;