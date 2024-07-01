CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0206 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0206
   PURPOSE   [CS] 로디안 지역 변경 작업

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-07-01  K.S.T.           1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- [CS] 로디안 지역변경 업로드
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0206 (
    v_Comm_Dvsn      IN CHAR,                                   /*처리구분(I,U,D)   */
    v_Std_Ym           IN RTCS0206.STD_YM%TYPE,          /*처리년월              */
    v_Ord_No           IN RTCS0206.ORD_NO%TYPE,         /*계약번호              */
    v_Mr_Cd_Org       IN RTCS0206.MR_CD_ORG%TYPE,    /*구_로디안            */
    v_Mr_Cd_New       IN RTCS0206.MR_CD_NEW%TYPE,   /*신_로디안            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    
    BEGIN
    
    IF v_Comm_Dvsn IN ('I','U') THEN

        IF v_Comm_Dvsn = 'I' THEN 
                   
            INSERT INTO RTCS0206 (STD_YM, ORD_NO, MR_CD_ORG, MR_CD_NEW, RES_YN)
            VALUES (v_Std_Ym, v_Ord_No, v_Mr_Cd_Org, v_Mr_Cd_New, 'N');

        ELSE

            UPDATE RTCS0206 SET RES_YN = 'Y'
            WHERE ORD_NO = v_Ord_No;

        END IF;

    ELSIF v_Comm_Dvsn = 'D' THEN

        DELETE FROM RTCS0206 WHERE ORD_NO = v_Ord_No;

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
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        v_Return_Message := v_Return_Message || '-' || v_ErrorText;        
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0206.p_IUDRtcs0206(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.') || '-' || v_ErrorText;
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0206.p_IUDRtcs0206(2)', v_ErrorText, v_Return_Message);   
             
    END P_IUDRtcs0206;
    
   /*****************************************************************************
  -- [CS] 로디안 지역변경 반영
  *****************************************************************************/
  PROCEDURE p_ProcessRtcs0005 (
    v_Reg_Id            IN VARCHAR2,   /*사용자 ID            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    ) IS

    v_Chk VARCHAR(2);
    v_EquNo VARCHAR2(15);
    v_JobSeq NUMBER; 
    v_Seq NUMBER; 
    v_MobNo VARCHAR2(12); 
    v_TelNo VARCHAR2(12); 
    v_BldMngNo VARCHAR2(25); 
    v_PosCd VARCHAR2(6); 
    v_Addr1 VARCHAR2(150); 
    v_Addr2 VARCHAR2(240); 
    v_PlanDay VARCHAR2(8); 
    v_PlanTm VARCHAR2(6); 
    v_PosX VARCHAR2(20);
    v_PosY VARCHAR2(20);
    
    v_Ret NUMBER;
    v_Cnt NUMBER;
    
    e_Error EXCEPTION;
        
    BEGIN
    
        FOR CUR IN (SELECT STD_YM, ORD_NO, MR_CD_ORG, MR_CD_NEW FROM RTCS0206 WHERE RES_YN = 'N') LOOP
        
            SELECT COUNT(*) INTO v_Cnt FROM RTCS0005 WHERE ORD_NO = CUR.ORD_NO AND STD_YM = CUR.STD_YM;
        
            IF v_Cnt > 0 THEN
            
                SELECT CHK_STAT INTO v_Chk FROM RTCS0005 WHERE ORD_NO = CUR.ORD_NO AND STD_YM = CUR.STD_YM;

                IF v_Chk NOT IN ('04') THEN
                    
                    UPDATE RTCS0005 SET MR_CD = CUR.MR_CD_NEW, CHG_ID = v_Reg_Id, CHG_DT = SYSDATE WHERE ORD_NO = CUR.ORD_NO AND STD_YM = CUR.STD_YM AND CHK_STAT NOT IN ('04');
                        
                    SELECT MAX(SEQ) INTO v_Seq FROM RTCS0006 WHERE ORD_NO = CUR.ORD_NO AND STD_YM = CUR.STD_YM;
                        
                    SELECT EQU_NO, JOB_SEQ, MOB_NO, TEL_NO, BLD_MNG_NO, POSCD, ADDR1, ADDR2, PLAN_DAY, PLAN_TM, POS_X, POS_Y INTO
                        v_EquNo, v_JobSeq, v_MobNo, v_TelNo, v_BldMngNo, v_PosCd, v_Addr1, v_Addr2, v_PlanDay, v_PlanTm, v_PosX, v_PosY
                    FROM RTCS0006 WHERE ORD_NO = CUR.ORD_NO AND STD_YM = CUR.STD_YM AND SEQ = v_Seq;
                        
                    v_Ret := PKG_RTCS0006.f_InsertRtcs0006( CUR.STD_YM,         /*기준년월              */
                            CUR.ORD_NO,         /*계약번호              */
                            v_EquNo,         /*설비번호              */
                            v_JobSeq,        /*작업순번              */
                            v_Seq + 1,        /*순번                  */
                            v_MobNo,         /*핸드폰                */
                            v_TelNo,         /*전화번호              */
                            v_BldMngNo,     /*빌딩번호              */
                            v_PosCd,          /*우편번호              */
                            v_Addr1,          /*주소                  */
                            v_Addr2,          /*상세주소              */
                            v_PlanDay,       /*점검예정일자          */
                            v_PlanTm,        /*점검예정시간          */
                            CUR.MR_CD_NEW,
                            v_PosX,          /*지도 X좌표            */
                            v_PosY,          /*지도 Y좌표            */
                            v_Reg_Id,         /*등록자 ID             */
                            v_ErrorText);
                            
                     Pkg_Rtcs0206.p_IUDRtcs0206('U', NULL, CUR.ORD_NO, NULL, NULL, v_Success_code, v_Return_Message, v_ErrorText);
                            
                END IF;

            END IF;
        
        END LOOP;
  
  
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0206.p_IUDRtcs0206(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0206.p_IUDRtcs0206(2)', v_ErrorText, v_Return_Message);   
             
    END p_ProcessRtcs0005;
  
END Pkg_Rtcs0206;
/