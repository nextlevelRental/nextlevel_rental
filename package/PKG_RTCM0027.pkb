CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcm0027 AS
/*******************************************************************************
   NAME:       Rtcm0027
   PURPOSE:    ���α׷�-���ѱ׷� �����̷� ����

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2021-10-29                   1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���α׷�-���ѱ׷� �����̷� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtcm0027 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Prgm_Cd        IN RTCM0027.PRGM_CD%TYPE         /*���α׷��ڵ�          */
    , v_Auth_Grp_Cd    IN RTCM0027.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
  ) IS

  BEGIN
          
    OPEN Ref_Cursor FOR 
    SELECT  A1.PRGM_CD       /* ���α׷��ڵ�     */
         ,  C1.PRGM_NM       /* ���α׷���       */
         ,  A1.AUTH_GRP_CD   /* ���ѱ׷��ڵ�     */
         ,  B1.AUTH_GRP_NM   /* ���ѱ׷��       */
         ,  A1.USEQ          /* �̷¼���         */
         ,  A1.READ_AUTH_YN  /* �б���ѿ���     */
         ,  A1.SAVE_AUTH_YN  /* ������ѿ���     */
         ,  A1.DEL_AUTH_YN   /* �������ѿ���     */
         ,  A1.PRNT_AUTH_YN  /* �μ���ѿ���     */
         ,  A1.EXPT_AUTH_YN  /* ����������ѿ��� */
         ,  A1.CHG_AUTH_YN   /* �����������ѿ��� */
         ,  A1.ETC1_AUTH_YN  /* ��Ÿ ����1       */
         ,  A1.ETC2_AUTH_YN  /* ��Ÿ ����2       */
         ,  A1.ETC3_AUTH_YN  /* ��Ÿ ����3       */
         ,  A1.REG_ID        /* ����� ID        */
         ,  A1.REG_DT        /* �����           */
         ,  A1.CHG_ID        /* ������ ID        */
         ,  A1.CHG_DT        /* ������           */
         ,  A1.COMM_DVSN     /* ó������         */
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
  -- ���α׷�-���ѱ׷� �����̷� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcm0027(
      v_Prgm_Cd        IN RTCM0027.PRGM_CD%TYPE         /*���α׷��ڵ�          */
    , v_Auth_Grp_Cd    IN RTCM0027.AUTH_GRP_CD%TYPE     /*���ѱ׷��ڵ�          */
    , v_Comm_Dvsn      IN RTCM0027.COMM_DVSN%TYPE       /*ó������(I,U,D)       */
    , v_Reg_Id         IN RTCM0027.REG_ID%TYPE          /*����� ID             */
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