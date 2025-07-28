CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0108 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0108
   PURPOSE   장착 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
   1.9        2019-12-17  wjim             [2019-00359563] O2O 항목 추가
*******************************************************************************/

  /*****************************************************************************
  -- 장착 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0108Count(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0108 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Ord_Day        IN RTSD0108.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_Id         IN RTSD0108.ORD_ID%TYPE,         /*주문구분              */
    v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널구분              */
    v_Sale_Id        IN RTSD0108.SALE_ID%TYPE,        /*계약유형              */
    v_Period_Cd      IN RTSD0108.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0108.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0108.REGI_CD%TYPE,        /*등록비코드            */
    v_Camp_Yn        IN RTSD0108.CAMP_YN%TYPE,        /*캠페인적용여부        */
    v_C_Dcrate       IN RTSD0108.C_DCRATE%TYPE,       /*캠페인할인율          */
    v_C_Dcamt        IN RTSD0108.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0108.CUST_TP%TYPE,        /*고객유형              */
    v_Safekey        IN RTSD0108.SAFEKEY%TYPE,        /*인증번호              */
    v_Grp_Yn         IN RTSD0108.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0108.GRP_NO%TYPE,         /*고객결합번호          */
    v_G_Dcrate       IN RTSD0108.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0108.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0108.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0108.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcrate       IN RTSD0108.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0108.F_DCAMT%TYPE,        /*최종할인액            */
    v_Bord_No        IN RTSD0108.BORD_NO%TYPE,        /*이전계약번호          */
    v_Stat_Cd        IN RTSD0108.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Canc_Day       IN RTSD0108.CANC_DAY%TYPE,       /*취소일자              */
    v_Agency_Cd      IN RTSD0108.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0108.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0108.SALES_OFFICE%TYPE,   /*지점                  */
    v_Eng_Nm         IN RTSD0108.ENG_NM%TYPE,         /*장착기사              */
    v_Ag_Desc        IN RTSD0108.AG_DESC%TYPE,        /*특이사항(장착점)      */
    v_Maker_Cd       IN RTSD0108.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0108.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0108.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0108.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0108.CAR_OWNER%TYPE,      /*차량소유자            */
    v_C_Mileage      IN RTSD0108.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Req_Text       IN RTSD0108.REQ_TEXT%TYPE,       /*비고(기타정보)        */
    v_Pay_Mthd       IN RTSD0108.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0108.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0108.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0108.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0108.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0108.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0108.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0108.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Bill_Yn        IN RTSD0108.BILL_YN%TYPE,        /*세금계산서발행여부    */
    v_Crdt_Stat      IN RTSD0108.CRDT_STAT%TYPE,      /*신용조회상태          */
    v_Cert_Cd        IN RTSD0108.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Stat      IN RTSD0108.CERT_STAT%TYPE,      /*본인인증상태          */
    v_Ord_Agent      IN RTSD0108.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Cd         IN RTSD0108.ORG_CD%TYPE,         /*판매조직              */
    v_Org_Hq         IN RTSD0108.ORG_HQ%TYPE,         /*판매본부              */
    v_Org_L1         IN RTSD0108.ORG_L1%TYPE,         /*판매조직-1LV          */
    v_Org_L2         IN RTSD0108.ORG_L2%TYPE,         /*판매조직-2LV          */
    v_Org_L3         IN RTSD0108.ORG_L3%TYPE,         /*판매조직-3LV          */
    v_Org_L4         IN RTSD0108.ORG_L4%TYPE,         /*판매조직-4LV          */
    v_Ins_Org        IN RTSD0108.INS_ORG%TYPE,        /*입력조직              */
    v_Ps_Cd          IN RTSD0108.PS_CD%TYPE,          /*프리미엄서비스코드    */
    v_Dept_Yn        IN RTSD0108.DEPT_YN%TYPE,        /*연체여부              */
    v_Mfp_Yn         IN RTSD0108.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTSD0108.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTSD0108.OS_YN%TYPE,          /*소유권이전여부        */
    v_Os_Day         IN RTSD0108.OS_DAY%TYPE,         /*종료일자(소유권이전)  */
    v_Ord_Tp         IN RTSD0108.ORD_TP%TYPE,         /*계약구분2             */
    v_Equ_No         IN RTSD0108.EQU_NO%TYPE,         /*설비번호              */
    v_Regi_Amt       IN RTSD0108.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Mon_Amt        IN RTSD0108.MON_AMT%TYPE,        /*월렌탈료              */
    v_Fl_Yn          IN RTSD0108.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0108.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0108.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0108.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Sv_Sert        IN RTSD0108.SV_SERT%TYPE,        /*서비스만족도          */
    v_Ag_Sert        IN RTSD0108.AG_SERT%TYPE,        /*대리점만족도          */
    v_Td_Yn          IN RTSD0108.TD_YN%TYPE,          /*기존타이어폐기위탁동의*/
    v_Input_Dt       IN RTSD0108.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0108.FILE_PATH%TYPE,      /*장착확인서 파일경로   */
    v_File_Name      IN RTSD0108.FILE_NAME%TYPE,      /*장착확인서 파일명     */
    v_Tcgrp_No       IN RTSD0108.TCGRP_NO%TYPE,       /*통합청구번호          */
    v_Vbeln          IN RTSD0108.VBELN%TYPE,          /*SO번호                */
    v_Season_Cd      IN RTSD0104.SEASON_CD%TYPE,      /*시즌구분              */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 장착 정보 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.9        2019-12-17  wjim             [2019-00359563] O2O 항목 추가
  *****************************************************************************/
  FUNCTION f_InsertRtsd0108 (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Ord_Day        IN RTSD0108.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_Id         IN RTSD0108.ORD_ID%TYPE,         /*주문구분              */
    v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널구분              */
    v_Sale_Id        IN RTSD0108.SALE_ID%TYPE,        /*계약유형              */
    v_Period_Cd      IN RTSD0108.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0108.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0108.REGI_CD%TYPE,        /*등록비코드            */
    v_Camp_Yn        IN RTSD0108.CAMP_YN%TYPE,        /*캠페인적용여부        */
    v_C_Dcrate       IN RTSD0108.C_DCRATE%TYPE,       /*캠페인할인율          */
    v_C_Dcamt        IN RTSD0108.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0108.CUST_TP%TYPE,        /*고객유형              */
    v_Safekey        IN RTSD0108.SAFEKEY%TYPE,        /*인증번호              */
    v_Grp_Yn         IN RTSD0108.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0108.GRP_NO%TYPE,         /*고객결합번호          */
    v_G_Dcrate       IN RTSD0108.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0108.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0108.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0108.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcrate       IN RTSD0108.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0108.F_DCAMT%TYPE,        /*최종할인액            */
    v_Bord_No        IN RTSD0108.BORD_NO%TYPE,        /*이전계약번호          */
    v_Stat_Cd        IN RTSD0108.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Canc_Day       IN RTSD0108.CANC_DAY%TYPE,       /*취소일자              */
    v_Agency_Cd      IN RTSD0108.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0108.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0108.SALES_OFFICE%TYPE,   /*지점                  */
    v_Eng_Nm         IN RTSD0108.ENG_NM%TYPE,         /*장착기사              */
    v_Ag_Desc        IN RTSD0108.AG_DESC%TYPE,        /*특이사항(장착점)      */
    v_Maker_Cd       IN RTSD0108.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0108.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0108.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0108.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0108.CAR_OWNER%TYPE,      /*차량소유자            */
    v_C_Mileage      IN RTSD0108.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Req_Text       IN RTSD0108.REQ_TEXT%TYPE,       /*비고(기타정보)        */
    v_Pay_Mthd       IN RTSD0108.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0108.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0108.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0108.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0108.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0108.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0108.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0108.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Bill_Yn        IN RTSD0108.BILL_YN%TYPE,        /*세금계산서발행여부    */
    v_Crdt_Stat      IN RTSD0108.CRDT_STAT%TYPE,      /*신용조회상태          */
    v_Cert_Cd        IN RTSD0108.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Stat      IN RTSD0108.CERT_STAT%TYPE,      /*본인인증상태          */
    v_Ord_Agent      IN RTSD0108.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Cd         IN RTSD0108.ORG_CD%TYPE,         /*판매조직              */
    v_Org_Hq         IN RTSD0108.ORG_HQ%TYPE,         /*판매본부              */
    v_Org_L1         IN RTSD0108.ORG_L1%TYPE,         /*판매조직-1LV          */
    v_Org_L2         IN RTSD0108.ORG_L2%TYPE,         /*판매조직-2LV          */
    v_Org_L3         IN RTSD0108.ORG_L3%TYPE,         /*판매조직-3LV          */
    v_Org_L4         IN RTSD0108.ORG_L4%TYPE,         /*판매조직-4LV          */
    v_Ins_Org        IN RTSD0108.INS_ORG%TYPE,        /*입력조직              */
    v_Ps_Cd          IN RTSD0108.PS_CD%TYPE,          /*프리미엄서비스코드    */
    v_Dept_Yn        IN RTSD0108.DEPT_YN%TYPE,        /*연체여부              */
    v_Mfp_Yn         IN RTSD0108.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTSD0108.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTSD0108.OS_YN%TYPE,          /*소유권이전여부        */
    v_Os_Day         IN RTSD0108.OS_DAY%TYPE,         /*종료일자(소유권이전)  */
    v_Ord_Tp         IN RTSD0108.ORD_TP%TYPE,         /*계약구분2             */
    v_Equ_No         IN RTSD0108.EQU_NO%TYPE,         /*설비번호              */
    v_Regi_Amt       IN RTSD0108.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Mon_Amt        IN RTSD0108.MON_AMT%TYPE,        /*월렌탈료              */
    v_Fl_Yn          IN RTSD0108.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0108.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0108.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0108.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Sv_Sert        IN RTSD0108.SV_SERT%TYPE,        /*서비스만족도          */
    v_Ag_Sert        IN RTSD0108.AG_SERT%TYPE,        /*대리점만족도          */
    v_Td_Yn          IN RTSD0108.TD_YN%TYPE,          /*기존타이어폐기위탁동의*/
    v_Input_Dt       IN RTSD0108.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0108.FILE_PATH%TYPE,      /*장착확인서 파일경로   */
    v_File_Name      IN RTSD0108.FILE_NAME%TYPE,      /*장착확인서 파일명     */
    v_Tcgrp_No       IN RTSD0108.TCGRP_NO%TYPE,       /*통합청구번호          */
    v_Vbeln          IN RTSD0108.VBELN%TYPE,          /*SO번호                */
    v_Season_Cd      IN RTSD0104.SEASON_CD%TYPE,      /*시즌구분              */
    v_Ford_No        IN RTSD0104.FORD_NO%TYPE,        /* 이후 계약번호        */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTSD0108.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTSD0108.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst1_Poscd    IN RTSD0108.INST1_POSCD%TYPE,    /*장착주소-우편번호     */ --[2019-00359563]
    v_Inst1_Addr1    IN RTSD0108.INST1_ADDR1%TYPE,    /*장착주소-주소         */ --[2019-00359563]
    v_Inst1_Addr2    IN RTSD0108.INST1_ADDR2%TYPE,    /*장착주소-상세주소     */ --[2019-00359563]
    v_Inst2_Poscd    IN RTSD0108.INST2_POSCD%TYPE,    /*배송주소-우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTSD0108.INST2_ADDR1%TYPE,    /*배송주소-주소         */ --[2019-00359563]
    v_Inst2_Addr2    IN RTSD0108.INST2_ADDR2%TYPE,    /*배송주소-상세주소     */ --[2019-00359563]
    v_Ord_Rsn        IN RTSD0108.ORD_RSN%TYPE,        /*SAP Order Raason      */ --[2019-00359563]
    v_Usage          IN RTSD0108.USAGE%TYPE,          /*SAP Usage             */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 정보 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.9        2019-12-17  wjim             [2019-00359563] O2O 항목 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108 (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Ord_Day        IN RTSD0108.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_Id         IN RTSD0108.ORD_ID%TYPE,         /*주문구분              */
    v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널구분              */
    v_Sale_Id        IN RTSD0108.SALE_ID%TYPE,        /*계약유형              */
    v_Period_Cd      IN RTSD0108.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0108.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0108.REGI_CD%TYPE,        /*등록비코드            */
    v_Camp_Yn        IN RTSD0108.CAMP_YN%TYPE,        /*캠페인적용여부        */
    v_C_Dcrate       IN RTSD0108.C_DCRATE%TYPE,       /*캠페인할인율          */
    v_C_Dcamt        IN RTSD0108.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0108.CUST_TP%TYPE,        /*고객유형              */
    v_Safekey        IN RTSD0108.SAFEKEY%TYPE,        /*인증번호              */
    v_Grp_Yn         IN RTSD0108.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0108.GRP_NO%TYPE,         /*고객결합번호          */
    v_G_Dcrate       IN RTSD0108.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0108.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0108.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0108.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcrate       IN RTSD0108.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0108.F_DCAMT%TYPE,        /*최종할인액            */
    v_Bord_No        IN RTSD0108.BORD_NO%TYPE,        /*이전계약번호          */
    v_Stat_Cd        IN RTSD0108.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Canc_Day       IN RTSD0108.CANC_DAY%TYPE,       /*취소일자              */
    v_Agency_Cd      IN RTSD0108.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0108.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0108.SALES_OFFICE%TYPE,   /*지점                  */
    v_Eng_Nm         IN RTSD0108.ENG_NM%TYPE,         /*장착기사              */
    v_Ag_Desc        IN RTSD0108.AG_DESC%TYPE,        /*특이사항(장착점)      */
    v_Maker_Cd       IN RTSD0108.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0108.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0108.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0108.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0108.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0108.CAR_OWNER%TYPE,      /*차량소유자            */
    v_C_Mileage      IN RTSD0108.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Req_Text       IN RTSD0108.REQ_TEXT%TYPE,       /*비고(기타정보)        */
    v_Pay_Mthd       IN RTSD0108.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0108.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0108.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0108.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0108.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0108.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0108.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0108.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Bill_Yn        IN RTSD0108.BILL_YN%TYPE,        /*세금계산서발행여부    */
    v_Crdt_Stat      IN RTSD0108.CRDT_STAT%TYPE,      /*신용조회상태          */
    v_Cert_Cd        IN RTSD0108.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Stat      IN RTSD0108.CERT_STAT%TYPE,      /*본인인증상태          */
    v_Ord_Agent      IN RTSD0108.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Cd         IN RTSD0108.ORG_CD%TYPE,         /*판매조직              */
    v_Org_Hq         IN RTSD0108.ORG_HQ%TYPE,         /*판매본부              */
    v_Org_L1         IN RTSD0108.ORG_L1%TYPE,         /*판매조직-1LV          */
    v_Org_L2         IN RTSD0108.ORG_L2%TYPE,         /*판매조직-2LV          */
    v_Org_L3         IN RTSD0108.ORG_L3%TYPE,         /*판매조직-3LV          */
    v_Org_L4         IN RTSD0108.ORG_L4%TYPE,         /*판매조직-4LV          */
    v_Ins_Org        IN RTSD0108.INS_ORG%TYPE,        /*입력조직              */
    v_Ps_Cd          IN RTSD0108.PS_CD%TYPE,          /*프리미엄서비스코드    */
    v_Dept_Yn        IN RTSD0108.DEPT_YN%TYPE,        /*연체여부              */
    v_Mfp_Yn         IN RTSD0108.MFP_YN%TYPE,         /*중도완납여부          */
    v_Tcan_Yn        IN RTSD0108.TCAN_YN%TYPE,        /*임시해약여부          */
    v_Os_Yn          IN RTSD0108.OS_YN%TYPE,          /*소유권이전여부        */
    v_Os_Day         IN RTSD0108.OS_DAY%TYPE,         /*종료일자(소유권이전)  */
    v_Ord_Tp         IN RTSD0108.ORD_TP%TYPE,         /*계약구분2             */
    v_Equ_No         IN RTSD0108.EQU_NO%TYPE,         /*설비번호              */
    v_Regi_Amt       IN RTSD0108.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Mon_Amt        IN RTSD0108.MON_AMT%TYPE,        /*월렌탈료              */
    v_Fl_Yn          IN RTSD0108.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTSD0108.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTSD0108.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTSD0108.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Sv_Sert        IN RTSD0108.SV_SERT%TYPE,        /*서비스만족도          */
    v_Ag_Sert        IN RTSD0108.AG_SERT%TYPE,        /*대리점만족도          */
    v_Td_Yn          IN RTSD0108.TD_YN%TYPE,          /*기존타이어폐기위탁동의*/
    v_Input_Dt       IN RTSD0108.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0108.FILE_PATH%TYPE,      /*장착확인서 파일경로   */
    v_File_Name      IN RTSD0108.FILE_NAME%TYPE,      /*장착확인서 파일명     */
    v_Tcgrp_No       IN RTSD0108.TCGRP_NO%TYPE,       /*통합청구번호          */
    v_Vbeln          IN RTSD0108.VBELN%TYPE,          /*SO번호                */
    v_Season_Cd      IN RTSD0104.SEASON_CD%TYPE,      /*시즌구분              */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTSD0108.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTSD0108.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst1_Poscd    IN RTSD0108.INST1_POSCD%TYPE,    /*장착주소-우편번호     */ --[2019-00359563]
    v_Inst1_Addr1    IN RTSD0108.INST1_ADDR1%TYPE,    /*장착주소-주소         */ --[2019-00359563]
    v_Inst1_Addr2    IN RTSD0108.INST1_ADDR2%TYPE,    /*장착주소-상세주소     */ --[2019-00359563]
    v_Inst2_Poscd    IN RTSD0108.INST2_POSCD%TYPE,    /*배송주소-우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTSD0108.INST2_ADDR1%TYPE,    /*배송주소-주소         */ --[2019-00359563]
    v_Inst2_Addr2    IN RTSD0108.INST2_ADDR2%TYPE,    /*배송주소-상세주소     */ --[2019-00359563]
    v_Ord_Rsn        IN RTSD0108.ORD_RSN%TYPE,        /*SAP Order Raason      */ --[2019-00359563]
    v_Usage          IN RTSD0108.USAGE%TYPE,          /*SAP Usage             */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0108 (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 정보 관리(IUD) - 영업 웹시스템에서 호출시 사용
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0108 (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 장착 정보 관리(IUD) - 전자서명(PAD)시스템에서 호출시 사용
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0108Pad (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Sv_Sert        IN RTSD0108.SV_SERT%TYPE,        /*서비스만족도          */
    v_Ag_Sert        IN RTSD0108.AG_SERT%TYPE,        /*대리점만족도          */
    v_Td_Yn          IN RTSD0108.TD_YN%TYPE,          /*기존타이어폐기위탁동의*/
    v_Input_Dt       IN RTSD0108.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0108.FILE_PATH%TYPE,      /*장착확인서 파일경로   */
    v_File_Name      IN RTSD0108.FILE_NAME%TYPE,      /*장착확인서 파일명     */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 장착 정보 관리(IUD) - 통합버젼
  *****************************************************************************/
  PROCEDURE p_InsertRtsd0108Integration (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Sv_Sert        IN RTSD0108.SV_SERT%TYPE,        /*서비스만족도          */
    v_Ag_Sert        IN RTSD0108.AG_SERT%TYPE,        /*대리점만족도          */
    v_Td_Yn          IN RTSD0108.TD_YN%TYPE,          /*기존타이어폐기위탁동의*/
    v_Input_Dt       IN RTSD0108.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0108.FILE_PATH%TYPE,      /*장착확인서 파일경로   */
    v_File_Name      IN RTSD0108.FILE_NAME%TYPE,      /*장착확인서 파일명     */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
  /*****************************************************************************
  -- 장착 정보 Select - 청구스케쥴조회(계약별) - 메인 LIST
  *****************************************************************************/
  PROCEDURE p_sRtsd0108Status (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Proc_Fday      IN RTSD0108.PROC_DAY%TYPE,       /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0108.PROC_DAY%TYPE,       /*장착일자TO            */
    v_Sales_Office   IN RTSD0108.SALES_OFFICE%TYPE,   /*지점                  */
    v_Sales_Group    IN RTSD0108.SALES_GROUP%TYPE,    /*지사                  */
    v_Agency_Cd      IN RTSD0108.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_Fday       IN RTSD0108.ORD_DAY%TYPE,        /*접수일자FROM          */
    v_Ord_Tday       IN RTSD0108.ORD_DAY%TYPE,        /*접수일자TO            */
    v_Stat_Cd        IN RTSD0108.STAT_CD%TYPE,        /*상태                  */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );


  /*****************************************************************************
  -- 장착 정보 - 계약번호로 고객번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108CustNo(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*계약번호            */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 장착 정보 Update - 결제정보 변경이력 생성에 따른 변경(Pkg_Rtre0050.p_IUDRtre0050)
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108RpcInfoChange (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Pay_Mthd       IN RTSD0108.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0108.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0108.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0108.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0108.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0108.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0108.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0108.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착 정보 Count -  결제저보변경(Pkg_Rtre0050) - 장착정보의 데이터와 비교해서 다르면 에러 처리용
  *****************************************************************************/
  FUNCTION f_sRtsd0108CheckCount(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Tcgrp_No       IN RTSD0108.TCGRP_NO%TYPE        /*통합청구번호          */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 장착 정보 Update - PDA 전자서명 장착 서비스만족도 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108PadSign (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Sv_Sert        IN RTSD0108.SV_SERT%TYPE,        /*서비스만족도          */
    v_Ag_Sert        IN RTSD0108.AG_SERT%TYPE,        /*대리점만족도          */
    v_Td_Yn          IN RTSD0108.TD_YN%TYPE,          /*기존타이어폐기위탁동의*/
    v_Input_Dt       IN RTSD0108.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0108.FILE_PATH%TYPE,      /*장착확인서 파일경로   */
    v_File_Name      IN RTSD0108.FILE_NAME%TYPE,      /*장착확인서 파일명     */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 장착 정보 Update - 계좌신청상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108AccStat (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Acc_Stat       IN RTSD0108.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 장착 정보 - 계약번호로 설비번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108EquNo(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 장착 정보 Update - 중도완납
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108Cancel (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Canc_Day       IN RTSD0108.CANC_DAY%TYPE,       /*취소일자              */
    v_Mfp_Yn         IN RTSD0108.MFP_YN%TYPE,         /*중도완납여부          */
    v_End_Tp         IN RTSD0108.END_TP%TYPE,         /*종료유형(S070:E,C)    */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER ;


  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 상태 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108StatCd(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 계약 등록 전  일반 or 재렌탈 Count
  *****************************************************************************/
  FUNCTION f_SelectRtsd0108SaleCdCount(
    v_Car_No        IN RTSD0104.CAR_NO%TYPE          /*고객번호              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 수수료 기초내역조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0108AgencyResult(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0108.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0108.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0108.SALES_OFFICE%TYPE,   /*지점                  */
    v_Proc_Day_S     IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Proc_Day_E     IN RTSD0108.PROC_DAY%TYPE,        /*장착일자              */
    v_Chan_Gbn       IN VARCHAR2,                     /*채널분류(WEB_LISTBOX) */
    v_RENTAL_GROUP  IN VARCHAR2,
    v_RENTAL_OFFICE IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                    /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP     IN VARCHAR2                      /* 로그인 그룹 */
    --v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널구분              */
    --v_Chan_Cd_Rest   IN RTSD0108.CHAN_CD%TYPE         /*채널구분 01:대리점 외 */
    );


  /*****************************************************************************
  -- 장착 정보 Update - 서비스 확인서 서명완료 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108CMileage (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_C_Mileage      IN RTSD0108.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 장착 정보 Update - 결합고객 할인처리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108Discount (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Grp_Yn         IN RTSD0108.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0108.GRP_NO%TYPE,         /*고객결합번호          */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 종료일자 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108Os_Day(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 타이어개수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108Cnt_Cd(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 고객으로 장착계약 찾기 Select (온라인몰 사용) 
  *****************************************************************************/
  PROCEDURE p_sRtsd0108CustOrdInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*SAFEKEY               */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE         /*사업자번호            */
    );
    
  /*****************************************************************************
  -- 고객으로 장착계약 찾기 Select (온라인몰 사용, O2O연계) 
  *****************************************************************************/
  PROCEDURE p_sRtsd0108CustOrdInfoNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*SAFEKEY               */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE        /*사업자번호            */
    );

  /*****************************************************************************
  -- 판매인 실적조회 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0108AgencyResult2(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Agent      IN RTSD0108.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Proc_Day_S     IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_Proc_Day_E     IN RTSD0108.PROC_DAY%TYPE,       /*장착일자              */
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );


  /*****************************************************************************
  -- 세금계산서 발행여부 수정 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0108BillSelect (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Bill_Yn        IN RTSD0108.BILL_YN%TYPE         /*세금계산서 발행여부   */
    );


  /*****************************************************************************
  -- 장착 정보 Update - 세금계산서 발행여부 수정
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0108BillYn (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Bill_Yn        IN RTSD0108.BILL_YN%TYPE,        /*세금계산서 발행여부   */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
     
  /*****************************************************************************
  -- 장착 정보 Select - 고객현황 -  차량정보 획득
  *****************************************************************************/
  PROCEDURE p_sRtsd0108CustAnalysis02 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE         /*고객번호              */
    );
    
  /*****************************************************************************
  -- 렌탈분석현황 : 계정 현황
  *****************************************************************************/
  PROCEDURE p_sRtsd0108RentalAnalysisAcc  (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_FDay           IN RTSD0108.PROC_DAY%TYPE,       /*기간FROM              */
    v_EDay           IN RTSD0108.PROC_DAY%TYPE        /*기간TO                */
    );
  
  /*****************************************************************************
  -- 2+1 전륜/후륜 분리 계약 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0108Zero2Plus1 (
    v_OrdNo        IN RTSD0108.ORD_NO%TYPE         /*계약번호              */
    ) RETURN VARCHAR2;
 
  /*****************************************************************************
  -- 장착주문리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0108OrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE         /*고객번호              */
  );    
  
  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 중도완납여부 확인
  *****************************************************************************/
  FUNCTION f_sRtsd0108Mfp_Yn(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*주문번호            */
    )  RETURN VARCHAR;  
  
END Pkg_Rtsd0108;