CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0105 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0105
   PURPOSE   계약 정보 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
   1.1        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
*******************************************************************************/

  /*****************************************************************************
  -- 계약 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Count(
    v_Ord_No         IN RTSD0105.ORD_NO%TYPE,           /*주문번호            */
    v_Seq            IN RTSD0105.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0105
    WHERE   ORD_NO = v_Ord_No
    AND     SEQ    = v_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0105Count;

  /*****************************************************************************
  -- 계약 정보 이력 Select
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.1        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0105 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0105.ORD_NO%TYPE          /*주문번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*주문번호            */
            A.SEQ,                       /*순번                */
            A.ORD_DAY,                   /*접수일자            */
            A.ORD_ID,                    /*주문구분            */
            A.CHAN_CD,                   /*채널구분            */
            A.SALE_ID,                   /*계약유형            */
            A.PERIOD_CD,                 /*기간코드            */
            A.CNT_CD,                    /*타이어본수          */
            A.REGI_CD,                   /*등록비코드          */
            A.CAMP_YN,                   /*캠페인적용여부      */
            A.C_DCRATE,                  /*캠페인할인율        */
            A.C_DCAMT,                   /*캠페인할인금액      */
            A.CUST_NO,                   /*고객번호            */
            A.CUST_TP,                   /*고객유형            */
            A.SAFEKEY,                   /*인증번호            */
            A.GRP_YN,                    /*고객결합여부        */
            A.GRP_NO,                    /*고객결합번호        */
            A.G_DCRATE,                  /*결합할인율          */
            A.G_DCAMT,                   /*결합할인액          */
            A.L_DCRATE,                  /*제한할인율          */
            A.L_DCAMT,                   /*제한할인액          */
            A.F_DCRATE,                  /*최종할인율          */
            A.F_DCAMT,                   /*최종할인액          */
            A.BORD_NO,                   /*이전주문번호        */
            A.STAT_CD,                   /*상태                */
            A.PROC_DAY,                  /*장착일자            */
            A.CANC_DAY,                  /*취소일자            */
            A.AGENCY_CD,                 /*장착 대리점         */
            A.SALES_GROUP,               /*지사                */
            A.SALES_OFFICE,              /*지점                */
            A.ENG_NM,                    /*장착기사            */
            A.AG_DESC,                   /*특이사항(장착점)    */
            A.MAKER_CD,                  /*카메이커            */
            A.MODEL_CD,                  /*차종                */
            A.CONTENTS_CD,               /*사양                */
            A.FR_CD,                     /*전후 구분           */
            A.CAR_NO,                    /*차량번호            */
            A.CAR_OWNER,                 /*차량소유자          */
            A.C_MILEAGE,                 /*현재주행거리        */
            A.REQ_TEXT,                  /*비고(기타정보)      */
            A.PAY_MTHD,                  /*결제구분            */
            A.PAY_DD,                    /*이체일              */
            A.ACC_SEQ,                   /*계좌순번            */
            A.CRD_SEQ,                   /*카드순번            */
            A.ACC_CHK,                   /*계좌확인상태        */
            A.ACC_STAT,                  /*계좌신청상태        */
            A.BKEY_CHK,                  /*배치키생성여부(카드)*/
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.BILL_YN,                   /*세금계산서발행여부  */
            A.CRDT_STAT,                 /*신용조회상태        */
            A.CERT_CD,                   /*본인인증방법        */
            A.CERT_STAT,                 /*본인인증상태        */
            A.ORD_AGENT,                 /*판매인번호          */
            A.ORG_CD,                    /*판매조직            */
            A.ORG_HQ,                    /*판매본부            */
            A.ORG_L1,                    /*판매조직-1LV        */
            A.ORG_L2,                    /*판매조직-2LV        */
            A.ORG_L3,                    /*판매조직-3LV        */
            A.ORG_L4,                    /*판매조직-4LV        */
            A.INS_ORG,                   /*입력조직            */
            A.PS_CD,                     /*프리미엄서비스코드  */          
            A.CMSAG_YN ,                 /*CMS출금이체동의     */
            A.CON_MTHD ,                 /*계약서 교부방법     */
            A.PCERT_YN ,                 /*신분증 첨부 필수여부*/
            A.FC_DAY   ,                 /*최초청구일자        */
            A.AG_DAY   ,                 /*개인정보제공 동의일 */
            A.AG_SEQ   ,                 /*개인정보제공동의순번*/
            A.INPUT_DT ,                 /*PAD입력일시         */
            A.FILE_PATH,                 /*계약서 파일경로     */
            A.FILE_NAME,                 /*계약서 파일명       */    
            A.TCGRP_NO,                  /*통합청구번호        */
            A.VBELN,                     /*SO번호              */
            A.SEASON_CD,                 /*ㅅ즌구분            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            A.INST_CD,                   /*장착유형코드        */ --[2019-00359563]
            A.INST_TM,                   /*장착희망시간        */ --[2019-00359563]
            A.INST1_POSCD,               /*장착주소-우편번호   */ --[2019-00359563]
            A.INST1_ADDR1,               /*장착주소-주소       */ --[2019-00359563]
            A.INST1_ADDR2,               /*장착주소-상세주소   */ --[2019-00359563]
            A.INST2_POSCD,               /*배송주소-우편번호   */ --[2019-00359563]
            A.INST2_ADDR1,               /*배송주소-주소       */ --[2019-00359563]
            A.INST2_ADDR2                /*배송주소-상세주소   */ --[2019-00359563]
    FROM    RTSD0105 A
    WHERE   A.ORD_NO = v_Ord_No;

  END p_sRtsd0105;

  /*****************************************************************************
  -- 계약 정보 이력 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.1        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  FUNCTION f_InsertRtsd0105 (
    v_Ord_No         IN RTSD0105.ORD_NO%TYPE,         /*계약번호              */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    
  BEGIN

       INSERT  INTO RTSD0105 (
            ORD_NO,
            SEQ,
            ORD_DAY,
            ORD_ID,
            CHAN_CD,
            SALE_ID,
            PERIOD_CD,
            CNT_CD,
            REGI_CD,
            CAMP_YN,
            C_DCRATE,
            C_DCAMT,
            CUST_NO,
            CUST_TP,
            SAFEKEY,
            GRP_YN,
            GRP_NO,
            G_DCRATE,
            G_DCAMT,
            L_DCRATE,
            L_DCAMT,
            F_DCRATE,
            F_DCAMT,
            BORD_NO,
            STAT_CD,
            PROC_DAY,
            CANC_DAY,
            AGENCY_CD,
            SALES_GROUP,
            SALES_OFFICE,
            ENG_NM,
            AG_DESC,
            MAKER_CD,
            MODEL_CD,
            CONTENTS_CD,
            FR_CD,
            CAR_NO,
            CAR_OWNER,
            C_MILEAGE,
            REQ_TEXT,
            PAY_MTHD,
            PAY_DD,
            ACC_SEQ,
            CRD_SEQ,
            ACC_CHK,
            ACC_STAT,
            BKEY_CHK,
            BATCH_KEY,
            BILL_YN,
            CRDT_STAT,
            CERT_CD,
            CERT_STAT,
            ORD_AGENT,
            ORG_CD,
            ORG_HQ,
            ORG_L1,
            ORG_L2,
            ORG_L3,
            ORG_L4,
            INS_ORG,
            PS_CD,          
            CMSAG_YN,
            CON_MTHD,
            PCERT_YN,
            FC_DAY,
            AG_DAY,
            AG_SEQ,
            INPUT_DT,
            FILE_PATH,
            FILE_NAME,    
            TCGRP_NO,
            VBELN,
            SEASON_CD,
            PRDT_GRP,
            PAY_GB,
            SALE_CD,
            EMP_NO,
            REGI_AMT,
            SUM_MON_AMT,
            MON_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            INST_CD,
            INST_TM,
            INST1_POSCD,
            INST1_ADDR1,
            INST1_ADDR2,
            INST2_POSCD,
            INST2_ADDR1,
            INST2_ADDR2,
            TMS_ORDERID,
            OUT_STOCK_YN,
            OUT_STOCK_TYPE
            )
    SELECT  A.ORD_NO,
            NVL((SELECT  MAX(B.SEQ)
                 FROM    RTSD0105 B
                 WHERE   B.ORD_NO = A.ORD_NO)+ 1, 1)  AS SEQ,
            A.ORD_DAY,
            A.ORD_ID,
            A.CHAN_CD,
            A.SALE_ID,
            A.PERIOD_CD,
            A.CNT_CD,
            A.REGI_CD,
            A.CAMP_YN,
            A.C_DCRATE,
            A.C_DCAMT,
            A.CUST_NO,
            A.CUST_TP,
            A.SAFEKEY,
            A.GRP_YN,
            A.GRP_NO,
            A.G_DCRATE,
            A.G_DCAMT,
            A.L_DCRATE,
            A.L_DCAMT,
            A.F_DCRATE,
            A.F_DCAMT,
            A.BORD_NO,
            A.STAT_CD,
            A.PROC_DAY,
            A.CANC_DAY,
            A.AGENCY_CD,
            A.SALES_GROUP,
            A.SALES_OFFICE,
            A.ENG_NM,
            A.AG_DESC,
            A.MAKER_CD,
            A.MODEL_CD,
            A.CONTENTS_CD,
            A.FR_CD,
            A.CAR_NO,
            A.CAR_OWNER,
            A.C_MILEAGE,
            A.REQ_TEXT,
            A.PAY_MTHD,
            A.PAY_DD,
            A.ACC_SEQ,
            A.CRD_SEQ,
            A.ACC_CHK,
            A.ACC_STAT,
            A.BKEY_CHK,
            A.BATCH_KEY,
            A.BILL_YN,
            A.CRDT_STAT,
            A.CERT_CD,
            A.CERT_STAT,
            A.ORD_AGENT,
            A.ORG_CD,
            A.ORG_HQ,
            A.ORG_L1,
            A.ORG_L2,
            A.ORG_L3,
            A.ORG_L4,
            A.INS_ORG,
            A.PS_CD,          
            A.CMSAG_YN,
            A.CON_MTHD,
            A.PCERT_YN,
            A.FC_DAY,
            A.AG_DAY,
            A.AG_SEQ,
            A.INPUT_DT,
            A.FILE_PATH,
            A.FILE_NAME,    
            A.TCGRP_NO,
            A.VBELN,
            A.SEASON_CD,
            A.PRDT_GRP,
            A.PAY_GB,
            A.SALE_CD,
            A.EMP_NO,
            A.REGI_AMT,
            A.SUM_MON_AMT,
            A.MON_AMT,
            A.REG_ID,
            A.REG_DT,
            A.CHG_ID,
            A.CHG_DT,
            A.INST_CD,
            A.INST_TM,
            A.INST1_POSCD,
            A.INST1_ADDR1,
            A.INST1_ADDR2,
            A.INST2_POSCD,
            A.INST2_ADDR1,
            A.INST2_ADDR2,
            A.TMS_ORDERID,
            A.OUT_STOCK_YN,
            A.OUT_STOCK_TYPE
    FROM    RTSD0104 A
    WHERE   A.ORD_NO = v_Ord_No;
    
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0105;
  
  
  /*****************************************************************************
  -- 패키지 묶음 저장
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.1        2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
   PROCEDURE p_InsertRtsd0105SaveOrder(
    v_Grp_No            IN OUT RTSD0031.GRP_NO%TYPE,
    v_Ord_No            IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id            IN RTSD0031.REG_ID%TYPE,    
    v_dc_Gubun          IN RTSD0031.GRP_ST%TYPE,
    v_dc_Cd             IN RTSD0040.DC_CD%TYPE,
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2 
    ) IS
    i_res_cnt   NUMBER DEFAULT 0; /* 잔여계약 */
    rest_cnt    NUMBER DEFAULT 0; /* 잔여계약 */
    dc_rate     NUMBER DEFAULT 0; /* 할인율 */
    dc_amt      NUMBER DEFAULT 0; /* 할인금액 */
    mon_amt     NUMBER DEFAULT 0; /* 월렌탈료 */
    i_dc_cd   NUMBER DEFAULT 0; /* 할인코드 체크 */
         
  e_Error EXCEPTION;
  
  BEGIN
  
     SELECT COUNT(1) CNT
       INTO i_dc_cd
       FROM RTSD0047
      WHERE ORD_NO = v_Ord_No
        AND DC_CD = v_dc_Cd;

    INSERT  INTO RTSD0105 (
            ORD_NO,
            SEQ,
            ORD_DAY,
            ORD_ID,
            CHAN_CD,
            SALE_ID,
            PERIOD_CD,
            CNT_CD,
            REGI_CD,
            CAMP_YN,
            C_DCRATE,
            C_DCAMT,
            CUST_NO,
            CUST_TP,
            SAFEKEY,
            GRP_YN,
            GRP_NO,
            G_DCRATE,
            G_DCAMT,
            L_DCRATE,
            L_DCAMT,
            F_DCRATE,
            F_DCAMT,
            BORD_NO,
            STAT_CD,
            PROC_DAY,
            CANC_DAY,
            AGENCY_CD,
            SALES_GROUP,
            SALES_OFFICE,
            ENG_NM,
            AG_DESC,
            MAKER_CD,
            MODEL_CD,
            CONTENTS_CD,
            FR_CD,
            CAR_NO,
            CAR_OWNER,
            C_MILEAGE,
            REQ_TEXT,
            PAY_MTHD,
            PAY_DD,
            ACC_SEQ,
            CRD_SEQ,
            ACC_CHK,
            ACC_STAT,
            BKEY_CHK,
            BATCH_KEY,
            BILL_YN,
            CRDT_STAT,
            CERT_CD,
            CERT_STAT,
            ORD_AGENT,
            ORG_CD,
            ORG_HQ,
            ORG_L1,
            ORG_L2,
            ORG_L3,
            ORG_L4,
            INS_ORG,
            PS_CD,          
            CMSAG_YN,
            CON_MTHD,
            PCERT_YN,
            FC_DAY,
            AG_DAY,
            AG_SEQ,
            INPUT_DT,
            FILE_PATH,
            FILE_NAME,    
            TCGRP_NO,
            VBELN,
            SEASON_CD,
            PRDT_GRP,
            PAY_GB,
            SALE_CD,
            EMP_NO,
            REGI_AMT,
            SUM_MON_AMT,
            MON_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            INST_CD,
            INST_TM,
            INST1_POSCD,
            INST1_ADDR1,
            INST1_ADDR2,
            INST2_POSCD,
            INST2_ADDR1,
            INST2_ADDR2
            )
    SELECT  A.ORD_NO,
            NVL((SELECT  MAX(B.SEQ)
                 FROM    RTSD0105 B
                 WHERE   B.ORD_NO = A.ORD_NO)+ 1, 1)  AS SEQ,
            A.ORD_DAY,
            A.ORD_ID,
            A.CHAN_CD,
            A.SALE_ID,
            A.PERIOD_CD,
            A.CNT_CD,
            A.REGI_CD,
            A.CAMP_YN,
            A.C_DCRATE,
            A.C_DCAMT,
            A.CUST_NO,
            A.CUST_TP,
            A.SAFEKEY,
            A.GRP_YN,
            A.GRP_NO,
            A.G_DCRATE,
            A.G_DCAMT,
            A.L_DCRATE,
            A.L_DCAMT,
            A.F_DCRATE,
            A.F_DCAMT,
            A.BORD_NO,
            A.STAT_CD,
            A.PROC_DAY,
            A.CANC_DAY,
            A.AGENCY_CD,
            A.SALES_GROUP,
            A.SALES_OFFICE,
            A.ENG_NM,
            A.AG_DESC,
            A.MAKER_CD,
            A.MODEL_CD,
            A.CONTENTS_CD,
            A.FR_CD,
            A.CAR_NO,
            A.CAR_OWNER,
            A.C_MILEAGE,
            A.REQ_TEXT,
            A.PAY_MTHD,
            A.PAY_DD,
            A.ACC_SEQ,
            A.CRD_SEQ,
            A.ACC_CHK,
            A.ACC_STAT,
            A.BKEY_CHK,
            A.BATCH_KEY,
            A.BILL_YN,
            A.CRDT_STAT,
            A.CERT_CD,
            A.CERT_STAT,
            A.ORD_AGENT,
            A.ORG_CD,
            A.ORG_HQ,
            A.ORG_L1,
            A.ORG_L2,
            A.ORG_L3,
            A.ORG_L4,
            A.INS_ORG,
            A.PS_CD,          
            A.CMSAG_YN,
            A.CON_MTHD,
            A.PCERT_YN,
            A.FC_DAY,
            A.AG_DAY,
            A.AG_SEQ,
            A.INPUT_DT,
            A.FILE_PATH,
            A.FILE_NAME,    
            A.TCGRP_NO,
            A.VBELN,
            A.SEASON_CD,
            A.PRDT_GRP,
            A.PAY_GB,
            A.SALE_CD,
            A.EMP_NO,
            A.REGI_AMT,
            A.SUM_MON_AMT,
            A.MON_AMT,
            A.REG_ID,
            A.REG_DT,
            A.CHG_ID,
            A.CHG_DT,
            A.INST_CD,
            A.INST_TM,
            A.INST1_POSCD,
            A.INST1_ADDR1,
            A.INST1_ADDR2,
            A.INST2_POSCD,
            A.INST2_ADDR1,
            A.INST2_ADDR2
    FROM    RTSD0104 A
    WHERE   A.ORD_NO = v_Ord_No;
    
    
       
    -- 기존 패기지가 존재할때
    IF 0 != f_sRtsd0105Count2(v_Grp_No) THEN                              
        UPDATE RTSD0104 SET GRP_NO = v_Grp_No,GRP_YN='Y' WHERE ORD_NO = v_Ord_No;    
    
        -- 패키지 계약정보 삭제
        IF 0 != f_sRtsd0032Count(v_Ord_No, v_Grp_No) THEN
            DELETE FROM RTSD0032 WHERE GRP_NO=v_Grp_No AND ORD_NO=v_Ord_No;
        END IF;
        
        -- 패키지 정보 입력
        INSERT INTO RTSD0032 (GRP_NO,ORD_NO,GRP_MK_DT,REG_ID,REG_DT,CHG_ID,CHG_DT) VALUES (v_Grp_No,v_Ord_No,TO_CHAR(SYSDATE,'YYYYMMDD'),v_Reg_Id,SYSDATE,v_Reg_Id,SYSDATE);
    
        -- 계약별 할인율 삭제
        DELETE FROM RTSD0047 WHERE ORD_NO = v_Ord_No;
  
        -- 계약별 할인율 등록
        IF 0 != f_InsertRTSD0047Contractdc(v_Ord_No, v_Grp_No, v_REG_ID, v_dc_Cd, v_ErrorText) THEN
            v_Return_Message := '계약별 할인 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        -- 계약별 할인율 이력 등록     
        IF 0 = i_dc_cd THEN            
            IF 0 != f_InsertRTSD0040Contractdc(v_Ord_No, v_Grp_No, v_REG_ID, v_dc_Cd, v_ErrorText) THEN
                v_Return_Message := '계약별 할인이력 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
            PKG_RTSD0109.p_InsertRtsd0109SchGrpYnSet(v_Ord_No, v_Reg_Id, 'Y', '0',  v_Success_Code, v_Return_Message, v_Errortext);
            IF 0 != v_Success_Code THEN
               v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
               v_Errortext := v_Errortext;
               RAISE e_Error;
            END IF;
              
        END IF;    
    
    -- 신규
    ELSE          
        -- 104 패키지 정보 입력
        UPDATE RTSD0104 SET GRP_NO = v_Grp_No, GRP_YN='Y' WHERE ORD_NO = v_Ord_No;
        
        -- 패키지 계약정보 입력 
        INSERT INTO RTSD0032 (GRP_NO,ORD_NO,GRP_MK_DT,REG_ID,REG_DT,CHG_ID,CHG_DT) VALUES (v_Grp_No,v_Ord_No,TO_CHAR(SYSDATE,'YYYYMMDD'),v_Reg_Id,SYSDATE,v_Reg_Id,SYSDATE);

        dc_rate := f_sRtsd0105Rate2(v_Grp_No,v_dc_Cd);      -- 할인율
        dc_amt  := f_sRtsd0105Amt(v_Grp_No,v_dc_Cd);        -- 할인금액
    
        -- 패키지 정보 입력 
        INSERT INTO RTSD0031 (GRP_NO,GRP_ST,GRP_DC_RATE,GRP_DC_AMT, REG_ID,REG_DT,CHG_ID,CHG_DT,GRP_TYPE) VALUES (v_Grp_No,'N',dc_rate,dc_amt,v_Reg_Id,SYSDATE,v_Reg_Id,SYSDATE,'F');
    
        -- 계약별 할인율 삭제
        DELETE FROM RTSD0047 WHERE ORD_NO = v_Ord_No;   

        -- 계약별 할인율 등록
        IF 0 != f_InsertRTSD0047Contractdc(v_Ord_No, v_Grp_No, v_REG_ID, v_dc_Cd, v_ErrorText) THEN
            v_Return_Message := '계약별 할인 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
        -- 계약별 할인율 이력 등록
        IF 0 = i_dc_cd THEN   
            IF 0 != f_InsertRTSD0040Contractdc(v_Ord_No, v_Grp_No, v_REG_ID, v_dc_Cd, v_ErrorText) THEN
                v_Return_Message := '계약별 할인이력 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
            PKG_RTSD0109.p_InsertRtsd0109SchGrpYnSet(v_Ord_No, v_Reg_Id, 'Y', '0',  v_Success_Code, v_Return_Message, v_Errortext);
            IF 0 != v_Success_Code THEN
               v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
               v_Errortext := v_Errortext;
               RAISE e_Error;
            END IF;
        END IF;  
        
    END IF;
                         
    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
   
  EXCEPTION
    WHEN e_Error THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
      --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0105.p_InsertRtsd0105SaveOrder(1)', v_ErrorText, v_Return_Message);
  
    WHEN OTHERS THEN
      ROLLBACK;
      v_Success_code := -1;
      v_Return_Message := v_Return_Message;
      v_ErrorText := SUBSTR(SQLERRM, 1, 200);
      --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0105.p_InsertRtsd0105SaveOrder(2)', v_ErrorText, v_Return_Message);
      
   
  END p_InsertRtsd0105SaveOrder;
  
  /*****************************************************************************
  -- 계약 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Count2(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE           /*주문번호            */
   
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0104
    WHERE   GRP_NO = v_Grp_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;  

  END f_sRtsd0105Count2;
  
  /*****************************************************************************
  -- 계약 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0105TopSearch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,           /*주문번호            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE           /*계약번호            */
    ) IS
    i_Ord_No Varchar(20);

  BEGIN
  
   IF 0 = f_sRtsd0105Count4(v_Ord_No) THEN      
        OPEN Ref_Cursor FOR
       
    SELECT A.DC_GB,
       PKG_RTCM0051.F_SRTCM0051CODENAME('S207', A.DC_GB) GRP_STD_NM,
       A.DC_RATE,
       A.DC_AMT,
       B.GRP_NO,
       B.GRP_CNT,
       A.DC_CD
    
    FROM (SELECT GRP_NO,
               COUNT(GRP_NO) AS GRP_CNT
          FROM RTSD0104
         WHERE GRP_NO=v_Grp_No
         GROUP BY GRP_NO) B,
       (SELECT A.DC_GB, /* 할인구분코드  */
          PKG_RTCM0051.F_SRTCM0051CODENAME('S207', A.DC_GB) GRP_STD_NM, /* 할인구분명    */
          TO_CHAR(TO_DATE(A.STD_STR_DAY), 'YYYY-MM-DD') AS STD_STR_DAY, /* 할인시작일    */
          A.DC_CD,                                                  /* 할인코드      */
          A.DC_RATE,                                                /* 할인율        */
          A.DC_AMT,                                                  /* 할인금액      */
          A.MIN_CNT,                                                    /* 최소건        */
          A.MAX_CNT                                                     /* 최대건        */
          FROM RTSD0025 A
         WHERE DC_GB='C')A
   WHERE A.MIN_CNT<=B.GRP_CNT
   AND A.MAX_CNT>=B.GRP_CNT; 
    
   ELSE
   
   i_Ord_No := f_sRtsd0105SearchGrp(v_Ord_No);
       OPEN Ref_Cursor FOR
       
          
    SELECT A.DC_GB,
       PKG_RTCM0051.F_SRTCM0051CODENAME('S207', A.DC_GB) GRP_STD_NM,
       A.DC_RATE ,
       A.DC_AMT,
       B.GRP_NO,
       B.GRP_CNT,
       A.DC_CD
    
    FROM (SELECT GRP_NO,
               COUNT(GRP_NO) AS GRP_CNT
          FROM RTSD0104
         WHERE GRP_NO=i_Ord_No
         GROUP BY GRP_NO) B,
       (SELECT A.DC_GB, /* 할인구분코드  */
          PKG_RTCM0051.F_SRTCM0051CODENAME('S207', A.DC_GB) GRP_STD_NM, /* 할인구분명    */
          TO_CHAR(TO_DATE(A.STD_STR_DAY), 'YYYY-MM-DD') AS STD_STR_DAY, /* 할인시작일    */
          A.DC_CD,                                                  /* 할인코드      */
          A.DC_RATE, /* 할인율        */
          A.DC_AMT,                                                  /* 할인금액      */
          A.MIN_CNT,                                                    /* 최소건        */
          A.MAX_CNT                                                     /* 최대건        */
          FROM RTSD0025 A
         WHERE DC_GB='C')A
   WHERE A.MIN_CNT<=B.GRP_CNT
   AND A.MAX_CNT>=B.GRP_CNT;  
               

   
   END IF;    
  
  END p_sRtsd0105TopSearch;
  
  
  
    /*****************************************************************************
  -- 할인율
  *****************************************************************************/
  FUNCTION f_sRtsd0105Rate2(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,           /*주문번호            */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE             /*할인코드            */     
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT 
           A.DC_RATE 
    INTO    v_curr_cunt
    FROM (SELECT GRP_NO,
               COUNT(GRP_NO) AS GRP_CNT
          FROM RTSD0104
         WHERE GRP_NO = v_Grp_No
         GROUP BY GRP_NO) B,
       (SELECT A.DC_GB, /* 할인구분코드  */
          PKG_RTCM0051.F_SRTCM0051CODENAME('S207', A.DC_GB) GRP_STD_NM, /* 할인구분명    */
          TO_CHAR(TO_DATE(A.STD_STR_DAY), 'YYYY-MM-DD') AS STD_STR_DAY, /* 할인시작일    */
          A.DC_CD,                                                  /* 할인코드      */
          RTRIM(TO_CHAR(A.DC_RATE, 'FM9990D99'), '.') AS DC_RATE, /* 할인율        */
          A.DC_AMT,                                                  /* 할인금액      */
          A.MIN_CNT,                                                    /* 최소건        */
          A.MAX_CNT                                                     /* 최대건        */
          FROM RTSD0025 A
         WHERE DC_GB='C')A

    WHERE A.DC_CD =v_dc_Cd ;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;  

  END f_sRtsd0105Rate2;
  
  
  /*****************************************************************************
  -- 할인금액
  *****************************************************************************/
  FUNCTION f_sRtsd0105Amt(
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,           /*주문번호            */
    v_dc_Cd          IN RTSD0040.DC_CD%TYPE             /*할인코드            */   
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

     SELECT 
            TRUNC(NVL(A.DC_AMT,0),-1) AS DC_AMT  
    INTO    v_curr_cunt
    FROM (SELECT GRP_NO,
               COUNT(GRP_NO) AS GRP_CNT
          FROM RTSD0104
         WHERE GRP_NO = v_Grp_No
         GROUP BY GRP_NO) B,
       (SELECT A.DC_GB, /* 할인구분코드  */
          PKG_RTCM0051.F_SRTCM0051CODENAME('S207', A.DC_GB) GRP_STD_NM, /* 할인구분명    */
          TO_CHAR(TO_DATE(A.STD_STR_DAY), 'YYYY-MM-DD') AS STD_STR_DAY, /* 할인시작일    */
          A.DC_CD,                                                  /* 할인코드      */
          RTRIM(TO_CHAR(A.DC_RATE, 'FM9990D99'), '.')||'%' AS DC_RATE, /* 할인율        */
          A.DC_AMT,                                                  /* 할인금액      */
          A.MIN_CNT,                                                    /* 최소건        */
          A.MAX_CNT                                                     /* 최대건        */
          FROM RTSD0025 A
         WHERE DC_GB='C')A

    WHERE A.DC_CD = v_dc_Cd;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;  

  END f_sRtsd0105Amt;
  
  
    /*****************************************************************************
  -- 합계월렌탈료
  *****************************************************************************/
  FUNCTION f_sRtsd0105SumAmt(
   v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL(SUM_MON_AMT,0) AS SUM_MON_AMT
    INTO    v_curr_cunt
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;  

  END f_sRtsd0105SumAmt;
  
  /*****************************************************************************
  -- 월렌탈료
  *****************************************************************************/
  FUNCTION f_sRtsd0105MonAmt(
   v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
   ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  NVL(MON_AMT,0) AS MON_AMT
    INTO    v_curr_cunt
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;  

  END f_sRtsd0105MonAmt;
  
  
  /*****************************************************************************
  -- 할인 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Count3(
   v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0040
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;  

  END f_sRtsd0105Count3;
  
  
  
  /*****************************************************************************
  -- 할인 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Seq2(
   v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  MAX(SEQ)+1
    INTO    v_curr_cunt
    FROM    RTSD0040
    WHERE ORD_NO=v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;  

  END f_sRtsd0105Seq2;
  
  
  /*****************************************************************************
  -- 단체번호 찾기
  *****************************************************************************/
  FUNCTION f_sRtsd0105SearchGrp(
    v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    ) RETURN VARCHAR2 IS
    v_curr_cunt   VARCHAR(20);
  BEGIN

    SELECT  GRP_NO
    INTO    v_curr_cunt
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;  

  END f_sRtsd0105SearchGrp;
  
  
  
/*****************************************************************************
  -- 계약 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0105Count4(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER IS
    v_Curr_Cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(GRP_NO)
    INTO    v_Curr_Cunt
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Curr_Cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0105Count4;
  
  
  
  /*****************************************************************************
  -- 단체정보 Seq채번
  *****************************************************************************/
 PROCEDURE p_sRTSD0031NextSeq3 (
    Ref_Cursor       IN OUT SYS_REFCURSOR, 
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) IS
       
  BEGIN

    OPEN Ref_Cursor FOR
    
     SELECT 'F' || LPAD(SEQ_RTSD0031GRP_NO.NEXTVAL, 9, 0) AS SEQ
     
      FROM DUAL;    
    
   END p_sRTSD0031NextSeq3;   




  /*****************************************************************************
  -- 단체정보 Seq채번
  *****************************************************************************/
 PROCEDURE p_sRtsd0105_restCnt (
    Ref_Cursor       IN OUT SYS_REFCURSOR
    ) IS
       
  BEGIN

    OPEN Ref_Cursor FOR
    
    SELECT    
        PKG_RTCM0051.F_SRTCM0051CODENAME('S207', A.DC_GB) GRP_STD_NM, /* 할인구분명    */
        A.DC_CD,                                                  /* 할인코드      */
        RTRIM(TO_CHAR(A.DC_RATE, 'FM9990D99'), '.')||'%' AS DC_RATE, /* 할인율        */
        A.DC_AMT,                                                  /* 할인금액      */
        A.MIN_CNT,                                                    /* 최소건        */
        A.MAX_CNT                                                     /* 최대건        */
    FROM RTSD0025 A
    WHERE DC_GB='C';   
    
   END p_sRtsd0105_restCnt;
   
   
  /*****************************************************************************
  -- 패키지 계약별 할인 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0047Contractdc (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Cd              IN RTSD0047.DC_CD%TYPE,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER IS
    
  iSumMonAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
  iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
  iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */
  BEGIN
  
    iSumMonAmt := f_sRtsd0105SumAmt(v_Ord_No);
    iDcAmt := f_sRtsd0105Amt(V_GRP_NO,v_dc_Cd);
    IF iDcAmt = 0 THEN            /*할인율*/
        iDcAmt := f_sRtsd0105Rate2(V_GRP_NO,v_dc_Cd);             
        --        iDcAmt := iSumMonAmt - (iSumMonAmt * iDcAmt);
        iDcAmt := iSumMonAmt * (0.01*iDcAmt);
        iMonAmt := iSumMonAmt - iDcAmt;     
    ELSE          /*할인금액*/
        iMonAmt := iSumMonAmt - iDcAmt;
    END IF;  
        
    INSERT INTO RTSD0047( 
              ORD_NO, 
              DC_GB, 
              DC_CD, 
              DC_AMT, 
              AMT, 
              L_AMT, 
              REG_ID, 
              REG_DT, 
              CHG_ID, 
              CHG_DT
    )VALUES(  
              v_ORD_NO,     /*계약번호*/
              'C',          /*할인구분*/
              v_dc_Cd,      /*할인코드*/
              GREATEST(iDcAmt, 0),      /*할인금액*/
              iSumMonAmt,   /*금액*/
              iMonAmt,      /*최종금액*/
              v_REG_ID,
              SYSDATE,
              v_REG_ID,
              SYSDATE );
        RETURN SQLCODE;
    

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRTSD0047Contractdc;   



  /*****************************************************************************
  -- 패키지 계약별 할인이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0040Contractdc (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Cd              IN RTSD0040.DC_CD%TYPE,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER IS
    
  iSumMonAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
  iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
  iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */

  
  BEGIN
  
    iSumMonAmt := f_sRtsd0105SumAmt(v_Ord_No);            
    iDcAmt := f_sRtsd0105Amt(V_GRP_NO,v_dc_Cd);
    IF iDcAmt = 0 THEN            /*할인율*/
        iDcAmt := f_sRtsd0105Rate2(V_GRP_NO,v_dc_Cd);             
--        iDcAmt := iSumMonAmt - (iSumMonAmt * iDcAmt);
        iDcAmt := iSumMonAmt * (0.01*iDcAmt); 
        iMonAmt := iSumMonAmt - iDcAmt;     
    ELSE          /*할인금액*/
        iMonAmt := iSumMonAmt - iDcAmt;
    END IF;  
     
    INSERT  INTO RTSD0040 (
            ORD_NO,
            SEQ,
            DC_GB,
            DC_CD,
            DC_AMT,
            AMT,
            L_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
    )VALUES(
            v_ORD_NO,                           /*계약번호*/
            NVL(f_sRtsd0105Seq2(v_Ord_No),1),
            'C',                                /*할인구분*/
            v_dc_Cd,                            /*할인코드*/   
            GREATEST(iDcAmt, 0),                /*할인금액*/
            iSumMonAmt,                         /*금액*/
            iMonAmt,                            /*최종금액*/
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;
    

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRTSD0040Contractdc;   

  /*****************************************************************************
  -- 계약 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0032Count(
    v_Ord_No         IN RTSD0032.ORD_NO%TYPE,           /*주문번호            */
    v_Grp_No         IN RTSD0032.GRP_NO%TYPE           /*주문번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0105
    WHERE   ORD_NO = v_Ord_No
    AND     GRP_NO    = v_Grp_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0032Count;


  /*****************************************************************************
  -- 계약 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0047DeletePackage(
    v_Ord_No         IN RTSD0032.ORD_NO%TYPE,           /*주문번호            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    DELETE  
    FROM    RTSD0047
    WHERE   ORD_NO = v_Ord_No; 

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0047DeletePackage;


  /*****************************************************************************
  -- 패키지 해지시 계약별 할인 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0047Contractdc2 (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Cd              IN RTSD0040.DC_CD%TYPE,    
    v_ErrorText          OUT VARCHAR2
    ) RETURN NUMBER IS
    
  iSumMonAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
  iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
  iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */
  BEGIN
      iSumMonAmt := f_sRtsd0105SumAmt(v_Ord_No);
      iMonAmt :=  f_sRtsd0105MonAmt(v_Ord_No);
      iDcAmt := iMonAmt - iSumMonAmt;
     
    INSERT  INTO RTSD0047 (
            ORD_NO,
            DC_GB,
            DC_CD,
            DC_AMT,
            AMT,
            L_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
    )VALUES(
            v_ORD_NO,                       /*계약번호*/
            'G',                            /*할인구분*/
            v_dc_Cd,               
            GREATEST(iDcAmt, 0),            /*할인금액*/
            iMonAmt,                        /*합계렌탈료*/
            iSumMonAmt,                     /*최종금액*/
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;
    

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRTSD0047Contractdc2;   



  /*****************************************************************************
  -- 패키지 해지시 계약별 할인이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRTSD0040Contractdc2 (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Cd              IN RTSD0040.DC_CD%TYPE,
    v_ErrorText          OUT VARCHAR2
    ) RETURN NUMBER IS
    
  iSumMonAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
  iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
  iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */
  BEGIN
  iSumMonAmt := f_sRtsd0105SumAmt(v_Ord_No);
  iMonAmt :=  f_sRtsd0105MonAmt(v_Ord_No);
  iDcAmt := iMonAmt - iSumMonAmt;
   
     
    INSERT  INTO RTSD0040 (
            ORD_NO,
            SEQ,
            DC_GB,
            DC_CD,
            DC_AMT,
            AMT,
            L_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
    )VALUES(
            v_ORD_NO,                               /*계약번호*/
            NVL(f_sRtsd0105Seq2(v_Ord_No),1),
            'G',                                    /*할인구분*/
            v_dc_Cd,   
            GREATEST(iDcAmt, 0),                    /*할인금액*/
            iMonAmt,                                /*합계렌탈료*/
            iSumMonAmt,                             /*최종금액*/
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;
    

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_InsertRTSD0040Contractdc2;



  /*****************************************************************************
  -- 단체 해지시 계약별 할인 Insert
  *****************************************************************************/
  FUNCTION f_sRtsd0047CancelGroup (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Gb          IN CHAR,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER IS
    
  iAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
  iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
  iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */
  BEGIN
     
      iMonAmt :=  f_sRtsd0105MonAmt(v_Ord_No);

     
    INSERT  INTO RTSD0047 (
            ORD_NO,
            DC_GB,
            DC_CD,
            DC_AMT,
            AMT,
            L_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
    )VALUES(
            v_ORD_NO,                              /*계약번호*/
            v_dc_Gb,                                   /*할인구분*/
            '',               
            iAmt,                                /*할인금액*/
            iMonAmt,                            /*금액*/
            iMonAmt,                               /*최종금액*/
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;
    

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_sRtsd0047CancelGroup;   



  /*****************************************************************************
  -- 단체 해지시 계약별 할인이력 Insert
  *****************************************************************************/
  FUNCTION f_sRtsd0040CancelGroup (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_Grp_No             IN RTSD0031.GRP_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_dc_Gb          IN CHAR,
    v_ErrorText     OUT VARCHAR2
    ) RETURN NUMBER IS
    
  iAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
  iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
  iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */
  BEGIN

  iMonAmt :=  f_sRtsd0105MonAmt(v_Ord_No);

   
     
    INSERT  INTO RTSD0040 (
            ORD_NO,
            SEQ,
            DC_GB,
            DC_CD,
            DC_AMT,
            AMT,
            L_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
    )VALUES(
            v_ORD_NO,                              /*계약번호*/
            NVL(f_sRtsd0105Seq2(v_Ord_No),1),
            v_dc_Gb,                               /*할인구분*/
            '',   
            iAmt,                                  /*할인금액*/
            iMonAmt,                               /*금액*/
            iMonAmt,                               /*최종금액*/
            v_REG_ID,
            SYSDATE,
            v_REG_ID,
            SYSDATE
            );
    RETURN SQLCODE;
    

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;
        
  END f_sRtsd0040CancelGroup;
   
END Pkg_Rtsd0105;
/
