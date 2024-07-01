CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0027 AS
/*******************************************************************************
   NAME:       Rtcm0027
   PURPOSE:    프로그램-권한그룹 연동이력 관리

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2021-10-29                   1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 프로그램-권한그룹 연동이력 조회
  *****************************************************************************/
  PROCEDURE p_sRtcm0027 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Prgm_Cd        IN RTCM0027.PRGM_CD%TYPE         /*프로그램코드          */
    , v_Auth_Grp_Cd    IN RTCM0027.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
  ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR 
    SELECT  A1.PRGM_CD       /* 프로그램코드     */
         ,  C1.PRGM_NM       /* 프로그램명       */
         ,  A1.AUTH_GRP_CD   /* 권한그룹코드     */
         ,  B1.AUTH_GRP_NM   /* 권한그룹명       */
         ,  A1.USEQ          /* 이력순번         */
         ,  A1.READ_AUTH_YN  /* 읽기원한여부     */
         ,  A1.SAVE_AUTH_YN  /* 저장권한여부     */
         ,  A1.DEL_AUTH_YN   /* 삭제권한여부     */
         ,  A1.PRNT_AUTH_YN  /* 인쇄권한여부     */
         ,  A1.EXPT_AUTH_YN  /* 엑셀저장권한여부 */
         ,  A1.CHG_AUTH_YN   /* 조직수정권한여부 */
         ,  A1.ETC1_AUTH_YN  /* 기타 권한1       */
         ,  A1.ETC2_AUTH_YN  /* 기타 권한2       */
         ,  A1.ETC3_AUTH_YN  /* 기타 권한3       */
         ,  A1.REG_ID        /* 등록자 ID        */
         ,  A1.REG_DT        /* 등록일           */
         ,  A1.CHG_ID        /* 변경자 ID        */
         ,  A1.CHG_DT        /* 변경일           */
         ,  A1.COMM_DVSN     /* 처리구분         */
      FROM  RTCM0027 A1
         ,  RTCM0021 B1
         ,  RTCM0011 C1
     WHERE  A1.PRGM_CD     = v_Prgm_Cd
       AND  A1.AUTH_GRP_CD = v_Auth_Grp_Cd
       AND  A1.AUTH_GRP_CD = B1.AUTH_GRP_CD(+)
       AND  A1.PRGM_CD     = C1.PRGM_CD(+)
    ;    
    
  END p_sRtcm0027;

  /*****************************************************************************
  -- 프로그램-권한그룹 연동이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0027(
      v_Prgm_Cd        IN RTCM0027.PRGM_CD%TYPE         /*프로그램코드          */
    , v_Auth_Grp_Cd    IN RTCM0027.AUTH_GRP_CD%TYPE     /*권한그룹코드          */
    , v_Comm_Dvsn      IN RTCM0027.COMM_DVSN%TYPE       /*처리구분(I,U,D)       */
    , v_Reg_Id         IN RTCM0027.REG_ID%TYPE          /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
    
  BEGIN
  
    IF v_Comm_Dvsn = 'D' THEN
        INSERT INTO RTCM0027 VALUES (
              v_Prgm_Cd     --PRGM_CD  
            , v_Auth_Grp_Cd --AUTH_GRP_CD
            , NVL((SELECT MAX(Z.USEQ)+1 FROM RTCM0027 Z WHERE Z.PRGM_CD = v_Prgm_Cd AND Z.AUTH_GRP_CD = v_Auth_Grp_Cd), 1) --USEQ
            , NULL          --READ_AUTH_YN
            , NULL          --SAVE_AUTH_YN
            , NULL          --DEL_AUTH_YN
            , NULL          --PRNT_AUTH_YN
            , NULL          --EXPT_AUTH_YN
            , NULL          --CHG_AUTH_YN
            , NULL          --ETC1_AUTH_YN
            , NULL          --ETC2_AUTH_YN
            , NULL          --ETC3_AUTH_YN
            , v_Reg_Id      --REG_ID
            , SYSDATE       --REG_DT
            , v_Reg_Id      --CHG_ID
            , SYSDATE       --CHG_DT
            , v_Comm_Dvsn   --COMM_DVSN
        );
    
    ELSE
        INSERT INTO RTCM0027 (
              PRGM_CD      
            , AUTH_GRP_CD
            , USEQ
            , READ_AUTH_YN
            , SAVE_AUTH_YN
            , DEL_AUTH_YN
            , PRNT_AUTH_YN
            , EXPT_AUTH_YN
            , CHG_AUTH_YN
            , ETC1_AUTH_YN
            , ETC2_AUTH_YN
            , ETC3_AUTH_YN
            , REG_ID
            , REG_DT
            , CHG_ID
            , CHG_DT
            , COMM_DVSN
        )
        SELECT  A1.PRGM_CD      
             ,  A1.AUTH_GRP_CD
             ,  NVL((SELECT MAX(Z.USEQ)+1 FROM RTCM0027 Z WHERE Z.PRGM_CD = A1.PRGM_CD AND Z.AUTH_GRP_CD = A1.AUTH_GRP_CD), 1)
             ,  A1.READ_AUTH_YN
             ,  A1.SAVE_AUTH_YN
             ,  A1.DEL_AUTH_YN
             ,  A1.PRNT_AUTH_YN
             ,  A1.EXPT_AUTH_YN
             ,  A1.CHG_AUTH_YN
             ,  A1.ETC1_AUTH_YN
             ,  A1.ETC2_AUTH_YN
             ,  A1.ETC3_AUTH_YN
             ,  A1.REG_ID
             ,  A1.REG_DT
             ,  A1.CHG_ID
             ,  A1.CHG_DT
             ,  v_Comm_Dvsn
          FROM  RTCM0024 A1  
         WHERE  A1.PRGM_CD     = v_Prgm_Cd
           AND  A1.AUTH_GRP_CD = v_Auth_Grp_Cd
        ;             
    
    END IF;      
                
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcm0027;



END Pkg_Rtcm0027;
/