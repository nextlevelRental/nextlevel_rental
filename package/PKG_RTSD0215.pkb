CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0215 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0215
   PURPOSE   [SD] OMS reassign 변경 log내역

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2022-01-20  kstka            1. Created this package body.
*******************************************************************************/
      
  /*****************************************************************************
  -- 변경이력내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-01-20  kstka            [20220120_01] Created this package spec.
    1.1     2022-01-20  kstka            [20220429_01] 서비스내역 생성로직 추가
  *****************************************************************************/
  PROCEDURE p_sRTSD0215 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Input_Day_F     IN RTSD0215.INPUT_DAY%TYPE               /*이력발생일자         */
    , v_Input_Day_T     IN RTSD0215.INPUT_DAY%TYPE               /*이력발생일자         */
    , v_Agency_Diff_Yn  IN RTSD0215.AGENCY_DIFF_YN%TYPE          /*대리점코드 변경여부   */
  ) IS 

  BEGIN

    OPEN Ref_Cursor FOR
        SELECT  A.INPUT_DAY
              , A.ORD_NO
              , A.SEQ
              , A.AGENCY_CD_BF
              , Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD_BF) AS AGENCY_NM_BF
              , A.AGENCY_CD_AF
              , Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD_AF) AS AGENCY_NM_AF
              , A.INST_DAY
              , A.INST_TM
              , A.OMS_ORDERNO
              , A.TMS_ORDERID
              , A.AGENCY_DIFF_YN
              , A.ORD_NO_NEW
              , A.REG_ID
              , A.REG_DT
          FROM  RTSD0215 A
         WHERE  1=1
           AND  A.INPUT_DAY BETWEEN DECODE(v_Input_Day_F, NULL, A.INPUT_DAY, v_Input_Day_F) AND DECODE(v_Input_Day_T, NULL, A.INPUT_DAY, v_Input_Day_T)
           AND  A.AGENCY_DIFF_YN = DECODE(v_Agency_Diff_Yn, NULL, A.AGENCY_DIFF_YN, v_Agency_Diff_Yn)
        ; 

  END p_sRTSD0215; 
  
  /*****************************************************************************
  -- 변경이력저장
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_ReCreateRental (
      v_Ord_No        RTSD0215.ORD_NO%TYPE
    , v_Agency_Cd_Bf  RTSD0215.AGENCY_CD_BF%TYPE
    , v_Agency_Cd_Af  RTSD0215.AGENCY_CD_AF%TYPE
    , v_Oms_Orderno   RTSD0215.OMS_ORDERNO%TYPE    
    , v_Tms_Orderid   RTSD0215.TMS_ORDERID%TYPE
    , v_Reg_Id        RTSD0215.REG_ID%TYPE
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
      
  e_Error    EXCEPTION;
  
  v_Ord_No_New RTSD0215.ORD_NO%TYPE;
  v_Seq RTSD0215.SEQ%TYPE;
  
  BEGIN
    
    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';
    
    Pkg_Rtsd0215.p_IRtsd0215('I', v_Ord_No, '', v_Seq, TO_CHAR(TO_NUMBER(v_Agency_Cd_Bf)), TO_CHAR(TO_NUMBER(v_Agency_Cd_Af)), '', '', v_Oms_Orderno, v_Tms_Orderid, 'admin', v_Success_Code, v_Return_Message, v_ErrorText);
    IF v_Success_Code < 0 THEN
        v_Return_Message := '변경 이력 정보 등록 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
--        RAISE e_Error;
    END IF;

    --거점재고 사용주문중 거점이 변경된 내역만 주문 재생성
    IF v_Agency_Cd_Bf <> v_Agency_Cd_Af THEN
        Pkg_Rtsd0215.p_Rtsd0215CancRegister(v_Ord_No, v_Ord_No_New, v_Seq, TO_CHAR(TO_NUMBER(v_Agency_Cd_Af)), 'admin', v_Success_Code, v_Return_Message, v_ErrorText);
        IF v_Success_Code < 0 THEN
            v_Return_Message := '렌탈 주문 재생성 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
--            RAISE e_Error;
        END IF;
    END IF;
    
    IF 0 != Pkg_Rtsd0215.f_UpdateRtsd0215(v_Ord_No, v_Seq, v_Ord_No_New, 'Y', 'admin', v_ErrorText) THEN
        v_Return_Message := '변경 이력 정보 업데이트 실패!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
--        RAISE e_Error;
    END IF;        
    

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    
  END p_ReCreateRental;
  
  /*****************************************************************************
  -- 변경이력저장
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IRtsd0215 (
      v_Comm_Dvsn     CHAR
    , v_Ord_No        RTSD0215.ORD_NO%TYPE
    , v_Ord_No_New    RTSD0215.ORD_NO%TYPE
    , v_Seq           OUT NUMBER
    , v_Agency_Cd_Bf  RTSD0215.AGENCY_CD_BF%TYPE
    , v_Agency_Cd_Af  RTSD0215.AGENCY_CD_AF%TYPE
    , v_Inst_Day      RTSD0215.INST_DAY%TYPE
    , v_Inst_Tm       RTSD0215.INST_TM%TYPE
    , v_Oms_Orderno   RTSD0215.OMS_ORDERNO%TYPE    
    , v_Tms_Orderid   RTSD0215.TMS_ORDERID%TYPE
    , v_Reg_Id        RTSD0215.REG_ID%TYPE
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  ) IS
      
  e_Error    EXCEPTION;
  
  BEGIN
    
    IF v_Comm_Dvsn = 'I' THEN

        v_Seq := f_sRtcs0215Seq(v_Ord_No);
        
        IF 0 != f_InsertRtsd0215(
              v_Ord_No
            , v_Seq   
            , v_Agency_Cd_Bf
            , v_Agency_Cd_Af 
            , v_Inst_Day
            , v_Inst_Tm
            , v_Oms_Orderno   
            , v_Tms_Orderid  
            , v_Reg_Id   
            , v_ErrorText
        ) THEN
            v_Return_Message := '변경 이력 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    
    ELSIF v_Comm_Dvsn = 'U' THEN
   
        IF 0 != Pkg_Rtsd0215.f_UpdateRtsd0215(v_Ord_No, v_Seq, v_Ord_No_New, 'Y', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '변경 이력 정보 업데이트 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;

    v_Success_code   := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText      := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
    
  END p_IRtsd0215;
  
  /*****************************************************************************
  -- 변경이력 부여순번 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2022-03-08  kstka             [20220308_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0215Seq(
    v_Ord_No       IN RTSD0215.ORD_NO%TYPE          /*주문번호        */
    ) RETURN NUMBER IS
    v_Seq RTSD0215.SEQ%TYPE;                        /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(B0.SEQ)
                  FROM  RTSD0215 B0
                 WHERE  B0.ORD_NO    = v_Ord_No) + 1, 1) AS SEQ
    INTO    v_Seq
    FROM    DUAL;

    RETURN v_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0215Seq;
  
  /*****************************************************************************
  -- 변경이력정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-01-20  kstka            [20220120_01] Created this package body.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0215 (
      v_Ord_No        RTSD0215.ORD_NO%TYPE
    , v_Seq           RTSD0215.SEQ%TYPE
    , v_Agency_Cd_Bf  RTSD0215.AGENCY_CD_BF%TYPE
    , v_Agency_Cd_Af  RTSD0215.AGENCY_CD_AF%TYPE
    , v_Inst_Day      RTSD0215.INST_DAY%TYPE
    , v_Inst_Tm       RTSD0215.INST_TM%TYPE
    , v_Oms_Orderno   RTSD0215.OMS_ORDERNO%TYPE    
    , v_Tms_Orderid   RTSD0215.TMS_ORDERID%TYPE
    , v_Reg_Id        RTSD0215.REG_ID%TYPE
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTSD0215 (
          ORD_NO
        , SEQ
        , AGENCY_CD_BF
        , AGENCY_CD_AF
        , INST_DAY
        , INST_TM
        , OMS_ORDERNO
        , TMS_ORDERID
        , AGENCY_DIFF_YN
        , INPUT_DAY
        , REG_ID
        , REG_DT       
    )
    VALUES (
            v_Ord_No
         ,  v_Seq
         ,  v_Agency_Cd_Bf
         ,  v_Agency_Cd_Af
         ,  v_Inst_Day
         ,  v_Inst_Tm
         ,  v_Oms_Orderno
         ,  v_Tms_Orderid
         ,  CASE WHEN v_Agency_Cd_Bf <> v_Agency_Cd_Af THEN 'Y' ELSE 'N' END
         ,  TO_CHAR(SYSDATE, 'YYYYMMDD')
         ,  v_Reg_Id
         ,  SYSDATE
         )
    ;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0215;
  
  /*****************************************************************************
  -- 변경이력정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2022-01-20  kstka            [20220120_01] Created this package body.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0215 (
      v_Ord_No        RTSD0215.ORD_NO%TYPE
    , v_Seq           RTSD0215.SEQ%TYPE
    , v_Ord_No_New    RTSD0215.ORD_NO_NEW%TYPE
    , v_Conf_Yn       RTSD0215.CONF_YN%TYPE
    , v_Reg_Id        RTSD0215.REG_ID%TYPE
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

        UPDATE RTSD0215 
        SET ORD_NO_NEW = v_Ord_No_New
          , CONF_YN = 'Y'
          , CHG_ID = v_Reg_Id
          , CHG_DT = SYSDATE 
        WHERE ORD_NO = v_Ord_No 
        AND SEQ = v_Seq;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0215;
  
  /*****************************************************************************
  -- 취소후 재등록 프로세스 batch
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_Rtsd0215ReassignBatch (
    v_Day_F          VARCHAR2,
    v_Day_T          VARCHAR2,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
  ) IS
  
  e_Error    EXCEPTION;
  
  v_Ord_No_New RTSD0104.ORD_NO%TYPE;
  BEGIN
  
    FOR CUR IN (SELECT ORD_NO, SEQ, AGENCY_CD_AF 
                FROM RTSD0215 
                WHERE 1=1
                AND INPUT_DAY BETWEEN v_Day_F AND v_Day_T 
                AND CONF_YN = 'N') LOOP
    
        Pkg_Rtsd0215.p_Rtsd0215CancRegister(CUR.ORD_NO, v_Ord_No_New, CUR.SEQ, CUR.AGENCY_CD_AF, 'batch', v_Success_Code, v_Return_Message, v_ErrorText);
        IF v_Success_Code < 0 THEN
            v_Return_Message := '[reassign batch]' || v_Return_Message || '||' || v_ErrorText;
            RAISE e_Error;
        END IF;
        
    END LOOP;
  
  END p_Rtsd0215ReassignBatch;
  
  /*****************************************************************************
  -- 취소후 재등록 프로세스
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_Rtsd0104CancRegister1 (
    v_Ord_No_Old     IN RTSD0104.ORD_NO%TYPE,
    v_Seq            IN RTSD0215.SEQ%TYPE,
    v_Agency_Cd_New  IN RTSD0215.AGENCY_CD_AF%TYPE,
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
  ) IS
      
    e_Error    EXCEPTION;
  
    v_Ord_No_New    RTSD0104.ORD_NO%TYPE := '';
    
    v_ordDay	    RTSD0104.ORD_DAY%TYPE;
    v_ordId	        RTSD0104.ORD_ID%TYPE;
    v_chanCd	    RTSD0104.CHAN_CD%TYPE;
    v_saleId	    RTSD0104.SALE_ID%TYPE;
    v_periodCd	    RTSD0104.PERIOD_CD%TYPE;
    v_cntCd	        RTSD0104.CNT_CD%TYPE;
    v_regiCd	    RTSD0104.REGI_CD%TYPE;
    v_campYn	    RTSD0104.CAMP_YN%TYPE;
    v_cDcrate	    RTSD0104.C_DCRATE%TYPE;
    v_cDcamt	    RTSD0104.C_DCAMT%TYPE;
    v_custNo	    RTSD0104.CUST_NO%TYPE;
    v_custTp	    RTSD0104.CUST_TP%TYPE;
    v_safekey	    RTSD0104.SAFEKEY%TYPE;
    v_grpYn	        RTSD0104.GRP_YN%TYPE;
    v_grpNo	        RTSD0104.GRP_NO%TYPE;
    v_gDcrate	    RTSD0104.G_DCRATE%TYPE;
    v_gDcamt	    RTSD0104.G_DCAMT%TYPE;
    v_lDcrate	    RTSD0104.L_DCRATE%TYPE;
    v_lDcamt	    RTSD0104.L_DCAMT%TYPE;
    v_fDcrate	    RTSD0104.F_DCRATE%TYPE;
    v_fDcamt	    RTSD0104.F_DCAMT%TYPE;
    v_bordNo	    RTSD0104.BORD_NO%TYPE;
    v_statCd	    RTSD0104.STAT_CD%TYPE;
    v_procDay	    RTSD0104.PROC_DAY%TYPE;
    v_cancDay	    RTSD0104.CANC_DAY%TYPE;
    v_agencyCd	    RTSD0104.AGENCY_CD%TYPE;
    v_salesGroup	RTSD0104.SALES_GROUP%TYPE;
    v_salesOffice	RTSD0104.SALES_OFFICE%TYPE;
    v_engNm	        RTSD0104.ENG_NM%TYPE;
    v_agDesc	    RTSD0104.AG_DESC%TYPE;
    v_makerCd	    RTSD0104.MAKER_CD%TYPE;
    v_modelCd	    RTSD0104.MODEL_CD%TYPE;
    v_contentsCd	RTSD0104.CONTENTS_CD%TYPE;
    v_frCd	        RTSD0104.FR_CD%TYPE;
    v_carNo	        RTSD0104.CAR_NO%TYPE;
    v_carOwner	    RTSD0104.CAR_OWNER%TYPE;
    v_cMileage	    RTSD0104.C_MILEAGE%TYPE;
    v_reqText	    RTSD0104.REQ_TEXT%TYPE;
    v_payMthd	    RTSD0104.PAY_MTHD%TYPE;
    v_payDd	        RTSD0104.PAY_DD%TYPE;
    v_accSeq	    RTSD0104.ACC_SEQ%TYPE;
    v_crdSeq	    RTSD0104.CRD_SEQ%TYPE;
    v_accChk	    RTSD0104.ACC_CHK%TYPE;
    v_accStat	    RTSD0104.ACC_STAT%TYPE;
    v_bkeyChk	    RTSD0104.BKEY_CHK%TYPE;
    v_batchKey	    RTSD0104.BATCH_KEY%TYPE;
    v_billYn	    RTSD0104.BILL_YN%TYPE;
    v_crdtStat	    RTSD0104.CRDT_STAT%TYPE;
    v_certCd	    RTSD0104.CERT_CD%TYPE;
    v_certStat	    RTSD0104.CERT_STAT%TYPE;
    v_ordAgent	    RTSD0104.ORD_AGENT%TYPE;
    v_orgCd	        RTSD0104.ORG_CD%TYPE;
    v_orgHq	        RTSD0104.ORG_HQ%TYPE;
    v_orgL1	        RTSD0104.ORG_L1%TYPE;
    v_orgL2	        RTSD0104.ORG_L2%TYPE;
    v_orgL3	        RTSD0104.ORG_L3%TYPE;
    v_orgL4	        RTSD0104.ORG_L4%TYPE;
    v_insOrg	    RTSD0104.INS_ORG%TYPE;
    v_psCd	        RTSD0104.PS_CD%TYPE;
    v_cmsagYn	    RTSD0104.CMSAG_YN%TYPE;
    v_conMthd	    RTSD0104.CON_MTHD%TYPE;
    v_pcertYn	    RTSD0104.PCERT_YN%TYPE;
    v_fcDay	        RTSD0104.FC_DAY%TYPE;
    v_agDay	        RTSD0104.AG_DAY%TYPE;
    v_agSeq	        RTSD0104.AG_SEQ%TYPE;
    v_inputDt	    RTSD0104.INPUT_DT%TYPE;
    v_filePath	    RTSD0104.FILE_PATH%TYPE;
    v_fileName	    RTSD0104.FILE_NAME%TYPE;
    v_tcgrpNo	    RTSD0104.TCGRP_NO%TYPE;
    v_vbeln	        RTSD0104.VBELN%TYPE;
    v_seasonCd	    RTSD0104.SEASON_CD%TYPE;
    v_regId	        RTSD0104.REG_ID%TYPE;
    v_regDt	        RTSD0104.REG_DT%TYPE;
    v_chgId	        RTSD0104.CHG_ID%TYPE;
    v_chgDt	        RTSD0104.CHG_DT%TYPE;
    v_prdtGrp	    RTSD0104.PRDT_GRP%TYPE;
    v_saleCd	    RTSD0104.SALE_CD%TYPE;
    v_payGb	        RTSD0104.PAY_GB%TYPE;
    v_empNo	        RTSD0104.EMP_NO%TYPE;
    v_regiAmt	    RTSD0104.REGI_AMT%TYPE;
    v_sumMonAmt	    RTSD0104.SUM_MON_AMT%TYPE;
    v_monAmt	    RTSD0104.MON_AMT%TYPE;
    v_cRealMobNo	RTSD0104.C_REAL_MOB_NO%TYPE;
    v_fordNo	    RTSD0104.FORD_NO%TYPE;
    v_instCd	    RTSD0104.INST_CD%TYPE;
    v_instTm	    RTSD0104.INST_TM%TYPE;
    v_inst1Poscd	RTSD0104.INST1_POSCD%TYPE;
    v_inst1Addr1	RTSD0104.INST1_ADDR1%TYPE;
    v_inst1Addr2	RTSD0104.INST1_ADDR2%TYPE;
    v_inst2Poscd	RTSD0104.INST2_POSCD%TYPE;
    v_inst2Addr1	RTSD0104.INST2_ADDR1%TYPE;
    v_inst2Addr2	RTSD0104.INST2_ADDR2%TYPE;
    v_tmsOrderid	RTSD0104.TMS_ORDERID%TYPE;
    v_instDay	    RTSD0104.INST_DAY%TYPE;
    v_omsOrderno	RTSD0104.OMS_ORDERNO%TYPE;
    v_outStockYn	RTSD0104.OUT_STOCK_YN%TYPE;
    v_outStockType	RTSD0104.OUT_STOCK_TYPE%TYPE;

  BEGIN
    
        
    BEGIN
        
        --주문취소
        Pkg_Rtsd0104.p_Rtsd0104statupdate(v_Ord_No_Old, '01', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        IF v_Success_Code < 0 THEN
            v_Return_Message := '[주문취소실패]' || v_Return_Message || '||' || v_ErrorText;
            RAISE e_Error;
        END IF;
        
        SELECT  
                A.ORD_DAY, A.ORD_ID,  A.CHAN_CD, A.SALE_ID, A.PERIOD_CD,
                A.CNT_CD, A.REGI_CD, A.CAMP_YN, A.C_DCRATE, A.C_DCAMT,
                A.CUST_NO, A.CUST_TP, A.SAFEKEY, A.GRP_YN, A.GRP_NO,
                A.G_DCRATE, A.G_DCAMT, A.L_DCRATE, A.L_DCAMT, A.F_DCRATE,
                A.F_DCAMT, A.BORD_NO, A.STAT_CD, A.PROC_DAY, A.CANC_DAY,
                A.AGENCY_CD, A.SALES_GROUP, A.SALES_OFFICE, A.ENG_NM, A.AG_DESC,
                A.MAKER_CD, A.MODEL_CD, A.CONTENTS_CD, A.FR_CD, A.CAR_NO,
                A.CAR_OWNER, A.C_MILEAGE, A.REQ_TEXT, A.PAY_MTHD, A.PAY_DD,
                A.ACC_SEQ, A.CRD_SEQ,  A.ACC_CHK, A.ACC_STAT, A.BKEY_CHK,
                A.BATCH_KEY, A.BILL_YN,  A.CRDT_STAT, A.CERT_CD, A.CERT_STAT,
                A.ORD_AGENT, A.ORG_CD, A.ORG_HQ, A.ORG_L1, A.ORG_L2, 
                A.ORG_L3, A.ORG_L4, A.INS_ORG, A.PS_CD, A.CMSAG_YN,
                A.CON_MTHD, A.PCERT_YN, A.FC_DAY, A.AG_DAY, A.AG_SEQ,
                A.INPUT_DT, A.FILE_PATH, A.FILE_NAME, A.TCGRP_NO, A.VBELN,
                A.SEASON_CD, A.PRDT_GRP, A.PAY_GB, A.SALE_CD, A.EMP_NO,
                A.REGI_AMT, A.SUM_MON_AMT, A.MON_AMT,  A.REG_ID, A.REG_DT,
                A.CHG_ID, A.CHG_DT, A.INST_CD,  A.INST_TM,  A.INST1_POSCD,
                A.INST1_ADDR1, A.INST1_ADDR2,  A.INST2_POSCD, A.INST2_ADDR1, A.INST2_ADDR2,
                A.TMS_ORDERID, A.INST_DAY, A.OMS_ORDERNO, A.OUT_STOCK_YN, A.OUT_STOCK_TYPE
                INTO v_OrdDay, v_OrdId, v_ChanCd, v_SaleId, v_PeriodCd,
                v_CntCd, v_RegiCd, v_CampYn, v_CDcrate, v_CDcamt,
                v_CustNo, v_CustTp, v_Safekey, v_GrpYn, v_GrpNo,
                v_GDcrate, v_GDcamt, v_LDcrate, v_LDcamt, v_FDcrate,
                v_FDcamt, v_BordNo, v_StatCd, v_ProcDay, v_CancDay,
                v_AgencyCd, v_SalesGroup, v_SalesOffice, v_EngNm, v_AgDesc,
                v_MakerCd, v_ModelCd, v_ContentsCd, v_FrCd, v_CarNo,
                v_CarOwner, v_CMileage, v_ReqText, v_PayMthd, v_PayDd,
                v_AccSeq, v_CrdSeq, v_AccChk, v_AccStat, v_BkeyChk,
                v_BatchKey, v_BillYn, v_CrdtStat, v_CertCd, v_CertStat,
                v_OrdAgent, v_OrgCd, v_OrgHq, v_OrgL1, v_OrgL2,
                v_OrgL3, v_OrgL4, v_InsOrg, v_PsCd, v_CmsagYn,          
                v_ConMthd, v_PcertYn, v_FcDay, v_AgDay, v_AgSeq,
                v_InputDt, v_FilePath, v_FileName,  v_TcgrpNo, v_Vbeln,
                v_SeasonCd, v_PrdtGrp, v_PayGb, v_SaleCd, v_EmpNo,
                v_RegiAmt, v_SumMonAmt, v_MonAmt, v_RegId, v_RegDt, 
                v_ChgId, v_ChgDt, v_InstCd, v_InstTm, v_Inst1Poscd,
                v_Inst1Addr1, v_Inst1Addr2, v_Inst2Poscd, v_Inst2Addr1, v_Inst2Addr2,
                v_TmsOrderid, v_InstDay, v_OmsOrderno, v_OutStockYn, v_OutStockType
            FROM    RTSD0104 A
            WHERE   A.ORD_NO = v_Ord_No_Old;
        
        -- 취소된 계약정보 기준으로 신규 주문 생성
        Pkg_Rtsd0104.p_IUDRtsd0104('I', v_Ord_No_New, v_OrdDay, v_OrdId, v_ChanCd, 
                                   v_SaleId, v_PeriodCd, v_CntCd, v_RegiCd, v_CampYn, 
                                   v_CDcrate, v_CDcamt, v_CustNo, v_CustTp, v_Safekey, 
                                   v_GrpYn, v_GrpNo, v_GDcrate, v_GDcamt, v_LDcrate, 
                                   v_LDcamt, v_FDcrate, v_FDcamt, v_BordNo, '01', 
                                   v_ProcDay, v_CancDay, v_Agency_Cd_New, v_SalesGroup, 
                                   v_SalesOffice, v_EngNm, v_AgDesc, v_MakerCd, v_ModelCd, 
                                   v_ContentsCd, v_FrCd, v_CarNo, v_CarOwner, v_CMileage, 
                                   v_ReqText, v_PayMthd, v_PayDd, v_AccSeq, v_CrdSeq, 
                                   v_AccChk, v_AccStat, v_BkeyChk, v_BatchKey, v_BillYn, 
                                   v_CrdtStat, v_CertCd, v_CertStat, v_OrdAgent, v_OrgCd, 
                                   v_OrgHq, v_OrgL1, v_OrgL2, v_OrgL3, v_OrgL4, 
                                   v_InsOrg, v_PsCd, v_CmsAgYn, v_ConMthd, v_PcertYn, 
                                   v_FcDay, v_AgDay, v_AgSeq, v_InputDt, v_FilePath, 
                                   v_FileName, v_TcgrpNo, v_Vbeln, v_SeasonCd, v_RegiAmt, 
                                   v_SumMonAmt, v_MonAmt, v_SaleCd, v_PayGb, v_RegId, 
                                   v_InstCd, v_InstTm, v_Inst1Poscd, v_Inst1Addr1, v_Inst1Addr2, 
                                   v_Inst2Poscd, v_Inst2Addr1, v_Inst2Addr2, v_TmsOrderId, v_OutStockYn,
                                   v_OutStockType, 
                                   v_Success_Code, v_Return_Message, v_ErrorText);
    
        IF v_Success_Code < 0 THEN
            v_Return_Message := '[주문재등록실패]' || v_Return_Message || '||' || v_ErrorText;
            RAISE e_Error;
        END IF;
        
        --처리완료여부
        UPDATE RTSD0215 SET CONF_YN = 'Y', CHG_ID = v_Reg_Id, CHG_DT = SYSDATE WHERE ORD_NO = v_Ord_No_Old AND SEQ = v_Seq;
    END;
    
    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Errortext := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_Errortext := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Errortext);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        
  END p_Rtsd0104CancRegister1;
  
  /*****************************************************************************
  -- 취소후 재등록 프로세스1
  -- 2022.01.20 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_Rtsd0215CancRegister (
    v_Ord_No_Old     IN RTSD0104.ORD_NO%TYPE,
    v_Ord_No_New     OUT RTSD0104.ORD_NO%TYPE,
    v_Seq            IN RTSD0215.SEQ%TYPE,
    v_Agency_Cd_New  IN RTSD0215.AGENCY_CD_AF%TYPE,
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2 
  ) IS
      
    e_Error    EXCEPTION;
    
    v_ordDay	    RTSD0104.ORD_DAY%TYPE;
    v_ordId	        RTSD0104.ORD_ID%TYPE;
    v_chanCd	    RTSD0104.CHAN_CD%TYPE;
    v_saleId	    RTSD0104.SALE_ID%TYPE;
    v_periodCd	    RTSD0104.PERIOD_CD%TYPE;
    v_cntCd	        RTSD0104.CNT_CD%TYPE;
    v_regiCd	    RTSD0104.REGI_CD%TYPE;
    v_campYn	    RTSD0104.CAMP_YN%TYPE;
    v_cDcrate	    RTSD0104.C_DCRATE%TYPE;
    v_cDcamt	    RTSD0104.C_DCAMT%TYPE;
    v_custNo	    RTSD0104.CUST_NO%TYPE;
    v_custTp	    RTSD0104.CUST_TP%TYPE;
    v_safekey	    RTSD0104.SAFEKEY%TYPE;
    v_grpYn	        RTSD0104.GRP_YN%TYPE;
    v_grpNo	        RTSD0104.GRP_NO%TYPE;
    v_gDcrate	    RTSD0104.G_DCRATE%TYPE;
    v_gDcamt	    RTSD0104.G_DCAMT%TYPE;
    v_lDcrate	    RTSD0104.L_DCRATE%TYPE;
    v_lDcamt	    RTSD0104.L_DCAMT%TYPE;
    v_fDcrate	    RTSD0104.F_DCRATE%TYPE;
    v_fDcamt	    RTSD0104.F_DCAMT%TYPE;
    v_bordNo	    RTSD0104.BORD_NO%TYPE;
    v_statCd	    RTSD0104.STAT_CD%TYPE;
    v_procDay	    RTSD0104.PROC_DAY%TYPE;
    v_cancDay	    RTSD0104.CANC_DAY%TYPE;
    v_agencyCd	    RTSD0104.AGENCY_CD%TYPE;
    v_salesGroup	RTSD0104.SALES_GROUP%TYPE;
    v_salesOffice	RTSD0104.SALES_OFFICE%TYPE;
    v_engNm	        RTSD0104.ENG_NM%TYPE;
    v_agDesc	    RTSD0104.AG_DESC%TYPE;
    v_makerCd	    RTSD0104.MAKER_CD%TYPE;
    v_modelCd	    RTSD0104.MODEL_CD%TYPE;
    v_contentsCd	RTSD0104.CONTENTS_CD%TYPE;
    v_frCd	        RTSD0104.FR_CD%TYPE;
    v_carNo	        RTSD0104.CAR_NO%TYPE;
    v_carOwner	    RTSD0104.CAR_OWNER%TYPE;
    v_cMileage	    RTSD0104.C_MILEAGE%TYPE;
    v_reqText	    RTSD0104.REQ_TEXT%TYPE;
    v_payMthd	    RTSD0104.PAY_MTHD%TYPE;
    v_payDd	        RTSD0104.PAY_DD%TYPE;
    v_accSeq	    RTSD0104.ACC_SEQ%TYPE;
    v_crdSeq	    RTSD0104.CRD_SEQ%TYPE;
    v_accChk	    RTSD0104.ACC_CHK%TYPE;
    v_accStat	    RTSD0104.ACC_STAT%TYPE;
    v_bkeyChk	    RTSD0104.BKEY_CHK%TYPE;
    v_batchKey	    RTSD0104.BATCH_KEY%TYPE;
    v_billYn	    RTSD0104.BILL_YN%TYPE;
    v_crdtStat	    RTSD0104.CRDT_STAT%TYPE;
    v_certCd	    RTSD0104.CERT_CD%TYPE;
    v_certStat	    RTSD0104.CERT_STAT%TYPE;
    v_ordAgent	    RTSD0104.ORD_AGENT%TYPE;
    v_orgCd	        RTSD0104.ORG_CD%TYPE;
    v_orgHq	        RTSD0104.ORG_HQ%TYPE;
    v_orgL1	        RTSD0104.ORG_L1%TYPE;
    v_orgL2	        RTSD0104.ORG_L2%TYPE;
    v_orgL3	        RTSD0104.ORG_L3%TYPE;
    v_orgL4	        RTSD0104.ORG_L4%TYPE;
    v_insOrg	    RTSD0104.INS_ORG%TYPE;
    v_psCd	        RTSD0104.PS_CD%TYPE;
    v_cmsagYn	    RTSD0104.CMSAG_YN%TYPE;
    v_conMthd	    RTSD0104.CON_MTHD%TYPE;
    v_pcertYn	    RTSD0104.PCERT_YN%TYPE;
    v_fcDay	        RTSD0104.FC_DAY%TYPE;
    v_agDay	        RTSD0104.AG_DAY%TYPE;
    v_agSeq	        RTSD0104.AG_SEQ%TYPE;
    v_inputDt	    RTSD0104.INPUT_DT%TYPE;
    v_filePath	    RTSD0104.FILE_PATH%TYPE;
    v_fileName	    RTSD0104.FILE_NAME%TYPE;
    v_tcgrpNo	    RTSD0104.TCGRP_NO%TYPE;
    v_vbeln	        RTSD0104.VBELN%TYPE;
    v_seasonCd	    RTSD0104.SEASON_CD%TYPE;
    v_regId	        RTSD0104.REG_ID%TYPE;
    v_regDt	        RTSD0104.REG_DT%TYPE;
    v_chgId	        RTSD0104.CHG_ID%TYPE;
    v_chgDt	        RTSD0104.CHG_DT%TYPE;
    v_prdtGrp	    RTSD0104.PRDT_GRP%TYPE;
    v_saleCd	    RTSD0104.SALE_CD%TYPE;
    v_payGb	        RTSD0104.PAY_GB%TYPE;
    v_empNo	        RTSD0104.EMP_NO%TYPE;
    v_regiAmt	    RTSD0104.REGI_AMT%TYPE;
    v_sumMonAmt	    RTSD0104.SUM_MON_AMT%TYPE;
    v_monAmt	    RTSD0104.MON_AMT%TYPE;
    v_cRealMobNo	RTSD0104.C_REAL_MOB_NO%TYPE;
    v_fordNo	    RTSD0104.FORD_NO%TYPE;
    v_instCd	    RTSD0104.INST_CD%TYPE;
    v_instTm	    RTSD0104.INST_TM%TYPE;
    v_inst1Poscd	RTSD0104.INST1_POSCD%TYPE;
    v_inst1Addr1	RTSD0104.INST1_ADDR1%TYPE;
    v_inst1Addr2	RTSD0104.INST1_ADDR2%TYPE;
    v_inst2Poscd	RTSD0104.INST2_POSCD%TYPE;
    v_inst2Addr1	RTSD0104.INST2_ADDR1%TYPE;
    v_inst2Addr2	RTSD0104.INST2_ADDR2%TYPE;
    v_tmsOrderid	RTSD0104.TMS_ORDERID%TYPE;
    v_instDay	    RTSD0104.INST_DAY%TYPE;
    v_omsOrderno	RTSD0104.OMS_ORDERNO%TYPE;
    v_outStockYn	RTSD0104.OUT_STOCK_YN%TYPE;
    v_outStockType	RTSD0104.OUT_STOCK_TYPE%TYPE;

    v_Rtsd0106Seq   RTSD0106.SEQ%TYPE;
    v_LrCd          RTSD0106.LR_CD%TYPE;
    v_MatCd         RTSD0106.MAT_CD%TYPE;
    v_OrdQty        RTSD0106.ORD_QTY%TYPE;
    v_RentAmt       RTSD0106.RENT_AMT%TYPE;
    v_RentpAmt      RTSD0106.RENTP_AMT%TYPE;
    v_MonDcamt      RTSD0106.MON_DCAMT%TYPE;
    v_PlanDay       RTSD0106.PLAN_DAY%TYPE;
    v_PlanTm        RTSD0106.PLAN_TM%TYPE;
    v_InstYn        RTSD0106.INST_YN%TYPE;
    v_ValYn         RTSD0106.VAL_YN%TYPE;
    v_EquNo         RTSD0106.EQU_NO%TYPE;
    v_OsId          RTSD0106.OS_ID%TYPE;
    v_OsDay         RTSD0106.OS_DAY%TYPE;
    v_FrYn          RTSD0106.FR_YN%TYPE;
    v_FlYn          RTSD0106.FL_YN%TYPE;
    v_RlYn          RTSD0106.RL_YN%TYPE;
    v_RrYn          RTSD0106.RR_YN%TYPE;
    v_MatDesc       RTSD0106.MAT_DESC%TYPE;
    v_GdsGb         RTSD0106.GDS_GB%TYPE;
    v_GdsGrp        RTSD0106.GDS_GRP%TYPE;
    v_MatCdS        RTSD0106.MAT_CD_S%TYPE;
    
  BEGIN 
    
        
    BEGIN
        
        --주문취소
        Pkg_Rtsd0104.p_Rtsd0104statupdate(v_Ord_No_Old, '01', v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        IF v_Success_Code < 0 THEN
            v_Return_Message := '[주문취소실패]' || v_Return_Message || '||' || v_ErrorText;
            RAISE e_Error;
        END IF;
        
        SELECT  
                A.ORD_DAY, A.ORD_ID,  A.CHAN_CD, A.SALE_ID, A.PERIOD_CD,
                A.CNT_CD, A.REGI_CD, A.CAMP_YN, A.C_DCRATE, A.C_DCAMT,
                A.CUST_NO, A.CUST_TP, A.SAFEKEY, A.GRP_YN, A.GRP_NO,
                A.G_DCRATE, A.G_DCAMT, A.L_DCRATE, A.L_DCAMT, A.F_DCRATE,
                A.F_DCAMT, A.BORD_NO, A.STAT_CD, A.PROC_DAY, A.CANC_DAY,
                A.AGENCY_CD, A.SALES_GROUP, A.SALES_OFFICE, A.ENG_NM, A.AG_DESC,
                A.MAKER_CD, A.MODEL_CD, A.CONTENTS_CD, A.FR_CD, A.CAR_NO,
                A.CAR_OWNER, A.C_MILEAGE, A.REQ_TEXT, A.PAY_MTHD, A.PAY_DD,
                A.ACC_SEQ, A.CRD_SEQ,  A.ACC_CHK, A.ACC_STAT, A.BKEY_CHK,
                A.BATCH_KEY, A.BILL_YN,  A.CRDT_STAT, A.CERT_CD, A.CERT_STAT,
                A.ORD_AGENT, A.ORG_CD, A.ORG_HQ, A.ORG_L1, A.ORG_L2, 
                A.ORG_L3, A.ORG_L4, A.INS_ORG, A.PS_CD, A.CMSAG_YN,
                A.CON_MTHD, A.PCERT_YN, A.FC_DAY, A.AG_DAY, A.AG_SEQ,
                A.INPUT_DT, A.FILE_PATH, A.FILE_NAME, A.TCGRP_NO, A.VBELN,
                A.SEASON_CD, A.PRDT_GRP, A.PAY_GB, A.SALE_CD, A.EMP_NO,
                A.REGI_AMT, A.SUM_MON_AMT, A.MON_AMT,  A.REG_ID, A.REG_DT,
                A.CHG_ID, A.CHG_DT, A.INST_CD,  A.INST_TM,  A.INST1_POSCD,
                A.INST1_ADDR1, A.INST1_ADDR2,  A.INST2_POSCD, A.INST2_ADDR1, A.INST2_ADDR2,
                A.TMS_ORDERID, A.INST_DAY, A.OMS_ORDERNO, A.OUT_STOCK_YN, A.OUT_STOCK_TYPE
                INTO v_OrdDay, v_OrdId, v_ChanCd, v_SaleId, v_PeriodCd,
                v_CntCd, v_RegiCd, v_CampYn, v_CDcrate, v_CDcamt,
                v_CustNo, v_CustTp, v_Safekey, v_GrpYn, v_GrpNo,
                v_GDcrate, v_GDcamt, v_LDcrate, v_LDcamt, v_FDcrate,
                v_FDcamt, v_BordNo, v_StatCd, v_ProcDay, v_CancDay,
                v_AgencyCd, v_SalesGroup, v_SalesOffice, v_EngNm, v_AgDesc,
                v_MakerCd, v_ModelCd, v_ContentsCd, v_FrCd, v_CarNo,
                v_CarOwner, v_CMileage, v_ReqText, v_PayMthd, v_PayDd,
                v_AccSeq, v_CrdSeq, v_AccChk, v_AccStat, v_BkeyChk,
                v_BatchKey, v_BillYn, v_CrdtStat, v_CertCd, v_CertStat,
                v_OrdAgent, v_OrgCd, v_OrgHq, v_OrgL1, v_OrgL2,
                v_OrgL3, v_OrgL4, v_InsOrg, v_PsCd, v_CmsagYn,          
                v_ConMthd, v_PcertYn, v_FcDay, v_AgDay, v_AgSeq,
                v_InputDt, v_FilePath, v_FileName,  v_TcgrpNo, v_Vbeln,
                v_SeasonCd, v_PrdtGrp, v_PayGb, v_SaleCd, v_EmpNo,
                v_RegiAmt, v_SumMonAmt, v_MonAmt, v_RegId, v_RegDt, 
                v_ChgId, v_ChgDt, v_InstCd, v_InstTm, v_Inst1Poscd,
                v_Inst1Addr1, v_Inst1Addr2, v_Inst2Poscd, v_Inst2Addr1, v_Inst2Addr2,
                v_TmsOrderid, v_InstDay, v_OmsOrderno, v_OutStockYn, v_OutStockType
            FROM    RTSD0104 A
            WHERE   A.ORD_NO = v_Ord_No_Old;
        
        --신규 주문번호 채번
        IF v_Ord_No_New IS NULL OR TRIM(v_Ord_No_New) = '' THEN
            v_Ord_No_New := Pkg_Rtsd0104.f_sRtsd0104Ordno(v_ChanCd);
        END IF;

        -- 취소된 계약정보 기준으로 신규 주문 생성
        IF 0 != Pkg_Rtsd0104.f_InsertRtsd0104(v_Ord_No_New, v_OrdDay, v_OrdId, v_ChanCd, 
                                   v_SaleId, v_PeriodCd, v_CntCd, v_RegiCd, v_CampYn, 
                                   v_CDcrate, v_CDcamt, v_CustNo, v_CustTp, v_Safekey, 
                                   v_GrpYn, v_GrpNo, v_GDcrate, v_GDcamt, v_LDcrate, 
                                   v_LDcamt, v_FDcrate, v_FDcamt, '', '01', 
                                   v_ProcDay, '', v_Agency_Cd_New, v_SalesGroup, 
                                   v_SalesOffice, v_EngNm, v_AgDesc, v_MakerCd, v_ModelCd, 
                                   v_ContentsCd, v_FrCd, TRIM(v_CarNo), v_CarOwner, v_CMileage, 
                                   v_ReqText, v_PayMthd, v_PayDd, v_AccSeq, v_CrdSeq, 
                                   v_AccChk, v_AccStat, v_BkeyChk, v_BatchKey, v_BillYn, 
                                   v_CrdtStat, v_CertCd, v_CertStat, v_OrdAgent, v_OrgCd, 
                                   v_OrgHq, v_OrgL1, v_OrgL2, v_OrgL3, v_OrgL4, 
                                   v_InsOrg, v_PsCd, v_CmsAgYn, v_ConMthd, v_PcertYn, 
                                   v_FcDay, v_AgDay, v_AgSeq, v_InputDt, v_FilePath, 
                                   v_FileName, v_TcgrpNo, v_Vbeln, v_SeasonCd, v_RegiAmt, 
                                   v_SumMonAmt, v_MonAmt, v_SaleCd, v_PayGb, v_RegId, 
                                   v_InstCd, v_InstTm, v_Inst1Poscd, v_Inst1Addr1, v_Inst1Addr2, 
                                   v_Inst2Poscd, v_Inst2Addr1, v_Inst2Addr2, v_TmsOrderId, v_OmsOrderno,
                                   NVL(v_OutStockYn, 'N'), v_OutStockType,  v_Errortext) THEN
            v_Return_Message := '계약 등록 실패!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;

        END IF;
        
        -- 변경 이력 생성
        IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No_New, v_Errortext) THEN
            v_Return_Message := '이력 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
    
        SELECT A.ORD_ID, A.PERIOD_CD, A.CNT_CD,
               A.REGI_CD, A.FR_CD, A.LR_CD, A.MAT_CD, A.ORD_QTY,
               A.REGI_AMT, A.RENT_AMT, A.RENTP_AMT, A.F_DCRATE, A.F_DCAMT,
               A.MON_DCAMT, A.MON_AMT, A.PLAN_DAY, A.PLAN_TM, A.INST_DAY,
               A.INST_TM, A.INST_YN, A.VAL_YN, A.EQU_NO, A.OS_ID,
               A.OS_DAY, A.STAT_CD, A.FR_YN, A.FL_YN, A.RL_YN, A.RR_YN, 
               A.MAT_DESC, A.SALE_CD, A.GDS_GB, A.GDS_GRP, A.REG_ID, A.MAT_CD_S
               INTO v_OrdId, v_PeriodCd, v_CntCd,
               v_RegiCd, v_FrCd, v_LrCd, v_MatCd, v_OrdQty,
               v_RegiAmt, v_RentAmt, v_RentpAmt, v_FDcrate, v_FDcamt,
               v_MonDcamt, v_MonAmt, v_PlanDay, v_PlanTm, v_InstDay,
               v_InstTm, v_InstYn, v_ValYn, v_EquNo, v_OsId,
               v_OsDay, v_StatCd, v_FrYn, v_FlYn, v_RlYn, v_RrYn,
               v_MatDesc, v_SaleCd, v_GdsGb, v_GdsGrp, v_RegId, v_MatCdS
               FROM RTSD0106 A               
               WHERE ORD_NO = v_Ord_No_Old;
        
        v_Rtsd0106Seq :=Pkg_Rtsd0106.f_sRtsd0106Seq(v_Ord_No_New);

        IF 0 != Pkg_Rtsd0106.f_InsertRtsd0106(v_Ord_No_New, v_Rtsd0106Seq, v_OrdId, v_PeriodCd, v_CntCd,
                                 v_RegiCd, v_FrCd, v_LrCd, v_MatCd,
                                 v_OrdQty, v_RegiAmt, v_RentAmt, v_RentpAmt, v_FDcrate,
                                 v_FDcamt, v_MonDcamt, v_MonAmt, v_PlanDay,
                                 v_PlanTm, v_InstDay, v_InstTm, v_InstYn,
                                 v_ValYn, v_EquNo,  v_OsId, v_OsDay,
                                 '01', v_FlYn, v_FrYn, v_RlYn,
                                 v_RrYn, v_MatDesc, v_SaleCd,
                                 v_GdsGb, v_GdsGrp, v_RegId, v_MatCdS,     --[20210713_02] kstka 대체규격컬럼추가
                                 v_ErrorText) THEN
            v_Return_Message := '계약 상품 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        -- 변경 이력 생성
        IF 0 != Pkg_Rtsd0107.f_InsertRtsd0107(v_Ord_No_New, v_Rtsd0106Seq, v_ErrorText) THEN
            v_Return_Message := '계약 상품 정보 변경 이력 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;       

        --[20220429_01] kstka 서비스내역 생성
        FOR SERV IN (
                SELECT PS_CD, PRS_DCD, CNT_CD, SERV_CNT0, SERV_CNTR, SERV_AMT
                FROM RTSD0013
                WHERE ORD_NO = v_Ord_No_Old) LOOP
            
            IF 0 != Pkg_Rtsd0013.f_InsertRtsd0013(v_Ord_No_New, SERV.PS_CD, SERV.PRS_DCD, SERV.CNT_CD, SERV.SERV_CNT0, SERV.SERV_CNTR, SERV.SERV_AMT, 'admin', v_ErrorText) THEN
                v_Return_Message := '서비스 이력 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
        END LOOP;
    END;
    
    v_Success_Code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_Errortext := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_Code := -1;
        v_Return_Message := v_Return_Message;
        v_Errortext := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Errortext);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        
  END p_Rtsd0215CancRegister;
  
END Pkg_Rtsd0215;
/
