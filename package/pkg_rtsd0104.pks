CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0104 AS 
/*******************************************************************************
   NAME:      Pkg_Rtsd0104
   PURPOSE   계약 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-09  jemcarry         1. Created this package body.
   1.6        2017-12-19  wjim             [20171219_01] 수금내역조회 조회조건 추가  
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가   
*******************************************************************************/

  /*****************************************************************************
  -- 계약 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104Count(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0104 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    );

  /*****************************************************************************
  -- 계약 정보 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가  
  *****************************************************************************/
  FUNCTION f_InsertRtsd0104 (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_Id         IN RTSD0104.ORD_ID%TYPE,         /*주문구분              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE,        /*채널구분              */
    v_Sale_Id        IN RTSD0104.SALE_ID%TYPE,        /*계약유형              */
    v_Period_Cd      IN RTSD0104.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0104.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0104.REGI_CD%TYPE,        /*등록비코드            */
    v_Camp_Yn        IN RTSD0104.CAMP_YN%TYPE,        /*캠페인적용여부        */
    v_C_Dcrate       IN RTSD0104.C_DCRATE%TYPE,       /*캠페인할인율          */
    v_C_Dcamt        IN RTSD0104.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0104.CUST_TP%TYPE,        /*고객유형              */
    v_Safekey        IN RTSD0104.SAFEKEY%TYPE,        /*인증번호              */
    v_Grp_Yn         IN RTSD0104.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,         /*고객결합번호          */
    v_G_Dcrate       IN RTSD0104.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0104.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0104.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0104.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcrate       IN RTSD0104.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0104.F_DCAMT%TYPE,        /*최종할인액            */
    v_Bord_No        IN RTSD0104.BORD_NO%TYPE,        /*이전주문번호          */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*장착일자              */
    v_Canc_Day       IN RTSD0104.CANC_DAY%TYPE,       /*취소일자              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Eng_Nm         IN RTSD0104.ENG_NM%TYPE,         /*장착기사              */
    v_Ag_Desc        IN RTSD0104.AG_DESC%TYPE,        /*특이사항(장착점)      */
    v_Maker_Cd       IN RTSD0104.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0104.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0104.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0104.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0104.CAR_OWNER%TYPE,      /*차량소유자            */
    v_C_Mileage      IN RTSD0104.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Req_Text       IN RTSD0104.REQ_TEXT%TYPE,       /*비고(기타정보)        */
    v_Pay_Mthd       IN RTSD0104.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0104.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0104.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0104.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0104.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0104.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0104.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0104.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Bill_Yn        IN RTSD0104.BILL_YN%TYPE,        /*세금계산서발행여부    */
    v_Crdt_Stat      IN RTSD0104.CRDT_STAT%TYPE,      /*신용조회상태          */
    v_Cert_Cd        IN RTSD0104.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Stat      IN RTSD0104.CERT_STAT%TYPE,      /*본인인증상태          */
    v_Ord_Agent      IN RTSD0104.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Cd         IN RTSD0104.ORG_CD%TYPE,         /*판매조직              */
    v_Org_Hq         IN RTSD0104.ORG_HQ%TYPE,         /*판매본부              */
    v_Org_L1         IN RTSD0104.ORG_L1%TYPE,         /*판매조직-1LV          */
    v_Org_L2         IN RTSD0104.ORG_L2%TYPE,         /*판매조직-2LV          */
    v_Org_L3         IN RTSD0104.ORG_L3%TYPE,         /*판매조직-3LV          */
    v_Org_L4         IN RTSD0104.ORG_L4%TYPE,         /*판매조직-4LV          */
    v_Ins_Org        IN RTSD0104.INS_ORG%TYPE,        /*입력조직              */
    v_Ps_Cd          IN RTSD0104.PS_CD%TYPE,          /*프리미엄서비스코드    */
    v_Cmsag_Yn       IN RTSD0104.CMSAG_YN%TYPE,       /*CMS출금이체동의       */
    v_Con_Mthd       IN RTSD0104.CON_MTHD%TYPE,       /*계약서 교부방법       */
    v_Pcert_Yn       IN RTSD0104.PCERT_YN%TYPE,       /*신분증 첨부 필수여부  */
    v_Fc_Day         IN RTSD0104.FC_DAY%TYPE,         /*최초청구일자          */
    v_Ag_Day         IN RTSD0104.AG_DAY%TYPE,         /*개인정보제공 동의일   */
    v_Ag_Seq         IN RTSD0104.AG_SEQ%TYPE,         /*개인정보제공 동의순번 */
    v_Input_Dt       IN RTSD0104.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0104.FILE_PATH%TYPE,      /*계약서 파일경로       */
    v_File_Name      IN RTSD0104.FILE_NAME%TYPE,      /*계약서 파일명         */
    v_Tcgrp_No       IN RTSD0104.TCGRP_NO%TYPE,       /*통합청구번호          */
    v_Vbeln          IN RTSD0104.VBELN%TYPE,          /*SO번호                */
    v_Season_Cd      IN RTSD0104.SEASON_CD%TYPE,      /*시즌구분              */
    v_Regi_Amt       IN RTSD0104.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Sum_Mon_Amt    IN RTSD0104.SUM_MON_AMT%TYPE,    /*합계월렌탈료          */
    v_Mon_Amt        IN RTSD0104.MON_AMT%TYPE,        /*월렌탈료              */
    v_Sale_Cd        IN RTSD0104.SALE_CD%TYPE,        /*판매상품코드          */
    v_Pay_Gb         IN RTSD0104.PAY_GB%TYPE,         /*납부구분              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTSD0104.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTSD0104.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst1_Poscd    IN RTSD0104.INST1_POSCD%TYPE,    /*장착주소-우편번호     */ --[2019-00359563]
    v_Inst1_Addr1    IN RTSD0104.INST1_ADDR1%TYPE,    /*장착주소-주소         */ --[2019-00359563]
    v_Inst1_Addr2    IN RTSD0104.INST1_ADDR2%TYPE,    /*장착주소-상세주소     */ --[2019-00359563]
    v_Inst2_Poscd    IN RTSD0104.INST2_POSCD%TYPE,    /*배송주소-우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTSD0104.INST2_ADDR1%TYPE,    /*배송주소-주소         */ --[2019-00359563]
    v_Inst2_Addr2    IN RTSD0104.INST2_ADDR2%TYPE,    /*배송주소-상세주소     */ --[2019-00359563]
    v_Tms_OrderId    IN RTSD0104.TMS_ORDERID%TYPE,    /*TMS orderId     */ --[20200316]
    v_Oms_OrderNo    IN RTSD0104.OMS_ORDERNO%TYPE,    /*OMS 주문번호     */ --[20220406_01]
    v_Out_Stock_Yn   IN RTSD0104.OUT_STOCK_YN%TYPE,   /*자사재고 사용여부     */ --[22210727_01] [20221107_1]
    v_Out_Stock_Type IN RTSD0104.OUT_STOCK_TYPE%TYPE, /*자사재고 미사용사유     */ --[20221107_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 정보 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104 (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_Id         IN RTSD0104.ORD_ID%TYPE,         /*주문구분              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE,        /*채널구분              */
    v_Sale_Id        IN RTSD0104.SALE_ID%TYPE,        /*계약유형              */
    v_Period_Cd      IN RTSD0104.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0104.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0104.REGI_CD%TYPE,        /*등록비코드            */
    v_Camp_Yn        IN RTSD0104.CAMP_YN%TYPE,        /*캠페인적용여부        */
    v_C_Dcrate       IN RTSD0104.C_DCRATE%TYPE,       /*캠페인할인율          */
    v_C_Dcamt        IN RTSD0104.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0104.CUST_TP%TYPE,        /*고객유형              */
    v_Safekey        IN RTSD0104.SAFEKEY%TYPE,        /*인증번호              */
    v_Grp_Yn         IN RTSD0104.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,         /*고객결합번호          */
    v_G_Dcrate       IN RTSD0104.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0104.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0104.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0104.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcrate       IN RTSD0104.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0104.F_DCAMT%TYPE,        /*최종할인액            */
    v_Bord_No        IN RTSD0104.BORD_NO%TYPE,        /*이전주문번호          */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*장착일자              */
    v_Canc_Day       IN RTSD0104.CANC_DAY%TYPE,       /*취소일자              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Eng_Nm         IN RTSD0104.ENG_NM%TYPE,         /*장착기사              */
    v_Ag_Desc        IN RTSD0104.AG_DESC%TYPE,        /*특이사항(장착점)      */
    v_Maker_Cd       IN RTSD0104.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0104.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0104.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0104.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0104.CAR_OWNER%TYPE,      /*차량소유자            */
    v_C_Mileage      IN RTSD0104.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Req_Text       IN RTSD0104.REQ_TEXT%TYPE,       /*비고(기타정보)        */
    v_Pay_Mthd       IN RTSD0104.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0104.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0104.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0104.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0104.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0104.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0104.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0104.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Bill_Yn        IN RTSD0104.BILL_YN%TYPE,        /*세금계산서발행여부    */
    v_Crdt_Stat      IN RTSD0104.CRDT_STAT%TYPE,      /*신용조회상태          */
    v_Cert_Cd        IN RTSD0104.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Stat      IN RTSD0104.CERT_STAT%TYPE,      /*본인인증상태          */
    v_Ord_Agent      IN RTSD0104.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Cd         IN RTSD0104.ORG_CD%TYPE,         /*판매조직              */
    v_Org_Hq         IN RTSD0104.ORG_HQ%TYPE,         /*판매본부              */
    v_Org_L1         IN RTSD0104.ORG_L1%TYPE,         /*판매조직-1LV          */
    v_Org_L2         IN RTSD0104.ORG_L2%TYPE,         /*판매조직-2LV          */
    v_Org_L3         IN RTSD0104.ORG_L3%TYPE,         /*판매조직-3LV          */
    v_Org_L4         IN RTSD0104.ORG_L4%TYPE,         /*판매조직-4LV          */
    v_Ins_Org        IN RTSD0104.INS_ORG%TYPE,        /*입력조직              */
    v_Ps_Cd          IN RTSD0104.PS_CD%TYPE,          /*프리미엄서비스코드    */
    v_Cmsag_Yn       IN RTSD0104.CMSAG_YN%TYPE,       /*CMS출금이체동의       */
    v_Con_Mthd       IN RTSD0104.CON_MTHD%TYPE,       /*계약서 교부방법       */
    v_Pcert_Yn       IN RTSD0104.PCERT_YN%TYPE,       /*신분증 첨부 필수여부  */
    v_Fc_Day         IN RTSD0104.FC_DAY%TYPE,         /*최초청구일자          */
    v_Ag_Day         IN RTSD0104.AG_DAY%TYPE,         /*개인정보제공 동의일   */
    v_Ag_Seq         IN RTSD0104.AG_SEQ%TYPE,         /*개인정보제공 동의순번 */
    v_Input_Dt       IN RTSD0104.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0104.FILE_PATH%TYPE,      /*계약서 파일경로       */
    v_File_Name      IN RTSD0104.FILE_NAME%TYPE,      /*계약서 파일명         */
    v_Tcgrp_No       IN RTSD0104.TCGRP_NO%TYPE,       /*통합청구번호          */
    v_Vbeln          IN RTSD0104.VBELN%TYPE,          /*SO번호                */
    v_Season_Cd      IN RTSD0104.SEASON_CD%TYPE,      /*시즌구분              */
    v_Regi_Amt       IN RTSD0104.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Sum_Mon_Amt    IN RTSD0104.SUM_MON_AMT%TYPE,    /*합계월렌탈료          */
    v_Mon_Amt        IN RTSD0104.MON_AMT%TYPE,        /*월렌탈료              */
    v_Sale_Cd        IN RTSD0104.SALE_CD%TYPE,        /*판매상품코드          */
    v_Pay_Gb         IN RTSD0104.PAY_GB%TYPE,         /*납부구분              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTSD0104.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTSD0104.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst1_Poscd    IN RTSD0104.INST1_POSCD%TYPE,    /*장착주소-우편번호     */ --[2019-00359563]
    v_Inst1_Addr1    IN RTSD0104.INST1_ADDR1%TYPE,    /*장착주소-주소         */ --[2019-00359563]
    v_Inst1_Addr2    IN RTSD0104.INST1_ADDR2%TYPE,    /*장착주소-상세주소     */ --[2019-00359563]
    v_Inst2_Poscd    IN RTSD0104.INST2_POSCD%TYPE,    /*배송주소-우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTSD0104.INST2_ADDR1%TYPE,    /*배송주소-주소         */ --[2019-00359563]
    v_Inst2_Addr2    IN RTSD0104.INST2_ADDR2%TYPE,    /*배송주소-상세주소     */ --[2019-00359563]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0104 (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 정보 관리(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0104 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN OUT RTSD0104.ORD_NO%TYPE,     /*주문번호              */
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_Id         IN RTSD0104.ORD_ID%TYPE,         /*주문구분              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE,        /*채널구분              */
    v_Sale_Id        IN RTSD0104.SALE_ID%TYPE,        /*계약유형              */
    v_Period_Cd      IN RTSD0104.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0104.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0104.REGI_CD%TYPE,        /*등록비코드            */
    v_Camp_Yn        IN RTSD0104.CAMP_YN%TYPE,        /*캠페인적용여부        */
    v_C_Dcrate       IN RTSD0104.C_DCRATE%TYPE,       /*캠페인할인율          */
    v_C_Dcamt        IN RTSD0104.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0104.CUST_TP%TYPE,        /*고객유형              */
    v_Safekey        IN RTSD0104.SAFEKEY%TYPE,        /*인증번호              */
    v_Grp_Yn         IN RTSD0104.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,         /*고객결합번호          */
    v_G_Dcrate       IN RTSD0104.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0104.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0104.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0104.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcrate       IN RTSD0104.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0104.F_DCAMT%TYPE,        /*최종할인액            */
    v_Bord_No        IN RTSD0104.BORD_NO%TYPE,        /*이전주문번호          */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*장착일자              */
    v_Canc_Day       IN RTSD0104.CANC_DAY%TYPE,       /*취소일자              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Eng_Nm         IN RTSD0104.ENG_NM%TYPE,         /*장착기사              */
    v_Ag_Desc        IN RTSD0104.AG_DESC%TYPE,        /*특이사항(장착점)      */
    v_Maker_Cd       IN RTSD0104.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0104.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0104.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0104.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0104.CAR_OWNER%TYPE,      /*차량소유자            */
    v_C_Mileage      IN RTSD0104.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Req_Text       IN OUT RTSD0104.REQ_TEXT%TYPE,       /*비고(기타정보)        */
    v_Pay_Mthd       IN RTSD0104.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0104.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0104.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0104.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0104.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0104.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0104.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0104.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Bill_Yn        IN RTSD0104.BILL_YN%TYPE,        /*세금계산서발행여부    */
    v_Crdt_Stat      IN RTSD0104.CRDT_STAT%TYPE,      /*신용조회상태          */
    v_Cert_Cd        IN RTSD0104.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Stat      IN RTSD0104.CERT_STAT%TYPE,      /*본인인증상태          */
    v_Ord_Agent      IN RTSD0104.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Cd         IN RTSD0104.ORG_CD%TYPE,         /*판매조직              */
    v_Org_Hq         IN RTSD0104.ORG_HQ%TYPE,         /*판매본부              */
    v_Org_L1         IN RTSD0104.ORG_L1%TYPE,         /*판매조직-1LV          */
    v_Org_L2         IN RTSD0104.ORG_L2%TYPE,         /*판매조직-2LV          */
    v_Org_L3         IN RTSD0104.ORG_L3%TYPE,         /*판매조직-3LV          */
    v_Org_L4         IN RTSD0104.ORG_L4%TYPE,         /*판매조직-4LV          */
    v_Ins_Org        IN RTSD0104.INS_ORG%TYPE,        /*입력조직              */
    v_Ps_Cd          IN RTSD0104.PS_CD%TYPE,          /*프리미엄서비스코드    */
    v_Cmsag_Yn       IN RTSD0104.CMSAG_YN%TYPE,       /*CMS출금이체동의       */
    v_Con_Mthd       IN RTSD0104.CON_MTHD%TYPE,       /*계약서 교부방법       */
    v_Pcert_Yn       IN RTSD0104.PCERT_YN%TYPE,       /*신분증 첨부 필수여부  */
    v_Fc_Day         IN OUT RTSD0104.FC_DAY%TYPE,         /*최초청구일자          */
    v_Ag_Day         IN RTSD0104.AG_DAY%TYPE,         /*개인정보제공 동의일   */
    v_Ag_Seq         IN RTSD0104.AG_SEQ%TYPE,         /*개인정보제공 동의순번 */
    v_Input_Dt       IN RTSD0104.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0104.FILE_PATH%TYPE,      /*계약서 파일경로       */
    v_File_Name      IN RTSD0104.FILE_NAME%TYPE,      /*계약서 파일명         */
    v_Tcgrp_No       IN RTSD0104.TCGRP_NO%TYPE,       /*통합청구번호          */
    v_Vbeln          IN RTSD0104.VBELN%TYPE,          /*SO번호                */
    v_Season_Cd      IN RTSD0104.SEASON_CD%TYPE,      /*시즌구분              */
    v_Regi_Amt       IN RTSD0104.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Sum_Mon_Amt    IN RTSD0104.SUM_MON_AMT%TYPE,    /*합계월렌탈료          */
    v_Mon_Amt        IN RTSD0104.MON_AMT%TYPE,        /*월렌탈료              */
    v_Sale_Cd        IN RTSD0104.SALE_CD%TYPE,        /*판매상품코드          */
    v_Pay_Gb         IN RTSD0104.PAY_GB%TYPE,         /*납부구분              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTSD0104.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTSD0104.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst1_Poscd    IN RTSD0104.INST1_POSCD%TYPE,    /*장착주소-우편번호     */ --[2019-00359563]
    v_Inst1_Addr1    IN RTSD0104.INST1_ADDR1%TYPE,    /*장착주소-주소         */ --[2019-00359563]
    v_Inst1_Addr2    IN RTSD0104.INST1_ADDR2%TYPE,    /*장착주소-상세주소     */ --[2019-00359563]
    v_Inst2_Poscd    IN RTSD0104.INST2_POSCD%TYPE,    /*배송주소-우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTSD0104.INST2_ADDR1%TYPE,    /*배송주소-주소         */ --[2019-00359563]
    v_Inst2_Addr2    IN RTSD0104.INST2_ADDR2%TYPE,    /*배송주소-상세주소     */ --[2019-00359563]
    v_Tms_OrderId    IN RTSD0104.TMS_ORDERID%TYPE,    /*TMS orderId     */ --[20200316]
    v_Out_Stock_Yn   IN RTSD0104.OUT_STOCK_YN%TYPE,   /*자사재고 사용여부     */ --[22210727_01] [20221107_1]
    v_Out_Stock_Type IN RTSD0104.OUT_STOCK_TYPE%TYPE, /*자사재고 미사용사유     */ --[20221107_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약 정보 Select - 주문현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104Status (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Fday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자FROM          */
    v_Ord_Tday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자TO            */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Proc_Fday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0104.PROC_DAY%TYPE,        /*장착일자TO            */
    v_Mob_No      IN RTSD0100.MOB_NO%TYPE,        /*핸드폰번호            */
    v_RENTAL_GROUP  IN VARCHAR2,
    v_RENTAL_OFFICE IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                    /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP     IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );


  /*****************************************************************************
  -- 계약 정보 - 주문번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104OrdNo (
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE         /*채널구분              */
  ) RETURN VARCHAR2;

 /*****************************************************************************
  -- 계약 번호조회 팝업 - 계약현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104_ordNoListPoPup (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_custTp     IN RTSD0100.CUST_TP%TYPE,                /*고객유형          */
    v_statCd     IN RTSD0104.STAT_CD%TYPE,                /*계약상태          */
    v_chanCd     IN RTSD0104.CHAN_CD%TYPE,                /*채널구분          */
    v_Birthday   IN RTSD0100.BIRTH_DAY%TYPE,              /*법정생년월일      */
    v_mobNo      IN RTSD0100.MOB_NO%TYPE,                 /*핸드폰            */
    v_carNo      IN RTSD0104.CAR_NO%TYPE,                 /*차량번호          */
    v_custNm     IN RTSD0100.CUST_NM%TYPE,                /*고객명/법인명     */
    v_telNo      IN RTSD0100.TEL_NO%TYPE,                 /*전화번호          */
    v_telNo2     IN RTSD0100.TEL_NO2%TYPE,                /*전화번호2         */
    v_gender     IN RTSD0100.GENDER_CD%TYPE,              /*성별              */
    v_lf         IN RTSD0100.LF_CD%TYPE,                  /*내외국인          */
    v_buslNo     IN RTSD0100.BUSL_NO%TYPE,                /*사업자번호        */
    v_Ord_No     IN RTSD0104.ORD_NO%TYPE,                  /*주문번호          */
    v_Grp_No     IN RTSD0104.GRP_NO%TYPE,                  /*주문번호          */
    v_Ord_Id     IN RTSD0104.ORD_ID%TYPE,                  /*주문ID          */
    v_groNoYn    IN VARCHAR2                               /*GRP_NO구분       */
    );
    
  /*****************************************************************************
  -- 단체계약주문 계약조회 - 계약현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104_ordNoList (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Grp_No     IN RTSD0104.GRP_NO%TYPE                  /*주문번호          */
    );   

  /*****************************************************************************
  -- 계약 정보 Select - 장착등록.장착대상 계약 정보조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0104ProcTargetList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Proc_Fday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자TO            */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE         /*고객번호              */
    );


  /*****************************************************************************
  -- 계약 정보 Update - 장착에 따른 상태 변경
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104PrcStat (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*장착일자              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Fc_Day         IN RTSD0104.FC_DAY%TYPE,         /*최초청구일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 정보 - 계약번호로 고객번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104CustNo(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- 계약 정보 - 해당 계약번호의 상태 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104StatCd(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 계약 정보 Update - 전사서명 정보 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104Sing (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Cmsag_Yn       IN RTSD0104.CMSAG_YN%TYPE,       /*CMS출금이체동의       */
    v_Con_Mthd       IN RTSD0104.CON_MTHD%TYPE,       /*계약서 교부방법       */
    v_Input_Dt       IN RTSD0104.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0104.FILE_PATH%TYPE,      /*계약서 파일경로       */
    v_File_Name      IN RTSD0104.FILE_NAME%TYPE,      /*계약서 파일명         */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;


 /*****************************************************************************
  -- 계약 현황 조회
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    );

 /*****************************************************************************
  -- 계약 현황 조회 NEW
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatusNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    );
    
  /*****************************************************************************
  -- 계약 현황 조회 - 설치정보
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_install (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    );


  /*****************************************************************************
  -- 계약 현황 조회 - 결제정보
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_pay (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    );


 /*****************************************************************************
 -- 계약 현황 조회- 할인정보
 *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_discount (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    );


  /*****************************************************************************
  -- 계약 현황 조회- 동의,인증
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_agree (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    );


  /*****************************************************************************
  -- 계약 현황 조회 - 판매인정보
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_seller (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */

    );


  /*****************************************************************************
  -- 계약 정보 저장전 설정한 차량수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetCarCount(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE          /*차량번호              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 정보 저장전 설정한 타이어본수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetTireNbCount(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,         /*고객번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE         /*고객번호              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 정보 저장전 설정한 타이어본수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetOlimitCnt(
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE       /*장착 대리점           */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 정보 수정전 설정한 차량수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetCarCountUp(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE          /*차량번호              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 정보 수정전 설정한 타이어본수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetTireNbCountUp(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 정보 수정전 설정한 타이어본수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetOlimitCntUp(
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE       /*장착 대리점           */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 계약 정보 Update - 장착에 따른 상태 변경
  *****************************************************************************/
  FUNCTION f_Rtsd0104OnlineUpdatePsCd (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약 현황 조회 - 판매원정보
  *****************************************************************************/
  FUNCTION f_sRtsd0104AgentInfo(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_division       IN RTSD0104.CHAN_CD%TYPE         /*구분                  */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- SAP 주문 인터페이스 현황
  *****************************************************************************/
  PROCEDURE p_sRtsd0104SapInterfaceList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_OrddayF        IN RTSD0104.ORD_DAY%TYPE,    /*주문일From                */
    v_OrddayT        IN RTSD0104.ORD_DAY%TYPE,    /*주문일To                  */
    v_Condition      IN CHAR                      /* 1: 전송대상, 2: 전송결과 */

    );

  /*****************************************************************************
  -- 계약 정보 Update - 온라인주문취소
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104OnlineCancel (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 온라인주문취소
  *****************************************************************************/
 PROCEDURE p_Rtsd0104onlinestatupdate (
    v_Ord_No         IN OUT RTSD0104.ORD_NO%TYPE,     /*주문번호              */
    v_Canamt         IN NUMBER,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) ;

  /*****************************************************************************
  -- 주문취소
  *****************************************************************************/
 PROCEDURE p_Rtsd0104statupdate (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Canc_Cd        IN RTSD0430.CANC_CD%TYPE,        /*취소코드              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) ;

  /*****************************************************************************
  -- 계약 정보 저장전 - 온라인몰 동일계약 존재여부 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0104GetExistContract(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE         /*채널구분              */
    ) RETURN VARCHAR2;

  /*****************************************************************************
  -- 계약 정보 Update - 장착대리점 Data UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104AgencyUpdate (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착대리점 코드       */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 장착대리점 변경 - 상태체크 후 Data Update
  *****************************************************************************/
 PROCEDURE p_Rtsd0104AgencyUpdate (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착대리점코드        */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) ;

  /*****************************************************************************
  -- 계약 정보 - 계약번호로 차량번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104CarNo (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
  ) RETURN VARCHAR;

  /*****************************************************************************
  -- 계약 정보 - 해당 계약번호의 타이어개수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104Cnt_Cd(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호            */
    ) RETURN VARCHAR;

  /*****************************************************************************
  -- 계약 정보 Select - 주문리스트(판매인)
  *****************************************************************************/
  PROCEDURE p_sRtsd0104StatusAgent (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Fday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자FROM          */
    v_Ord_Tday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자TO            */
    v_Ord_Agent      IN RTSD0104.AGENCY_CD%TYPE,      /*판매인번호            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Proc_Fday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0104.PROC_DAY%TYPE,      /*장착일자TO            */
    v_EmpNo_Yn       IN VARCHAR2                      /*임직원상품여부            */
    );

  PROCEDURE p_sRtsd0104StatusAgentNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Fday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자FROM          */
    v_Ord_Tday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자TO            */
    v_Ord_Agent      IN RTSD0104.AGENCY_CD%TYPE,      /*판매인번호            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Proc_Fday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자TO            */
    v_RENTAL_GROUP   IN VARCHAR2,
    v_RENTAL_OFFICE  IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                     /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP      IN VARCHAR2                      /* 로그인 사용자 그룹 */
    );

  /*****************************************************************************
  -- 계약 현황 조회 - 전자서명
  *****************************************************************************/
  PROCEDURE p_sRtsd0104Status_sign (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE   ,      /*주문번호              */
    v_Sheet_Id       IN VARCHAR2               ,      /*양식ID                */
    v_File_Name      IN RTSD0104.FILE_NAME%TYPE       /*파일명                */
    );

  /*****************************************************************************
  -- 계약 정보 - 채널구분 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104ChanCd (
    v_In_Path      IN CHAR,                    /*유입경로('R':렌탈,'O':온라인)*/
    v_Ord_Agent    IN RTSD0104.ORD_AGENT%TYPE, /*판매인번호                   */
    v_Agency_Cd    IN RTSD0104.AGENCY_CD%TYPE  /*장착대리점코드               */
  ) RETURN VARCHAR2;


 /*****************************************************************************
  -- 랜탈 계약 현황 분석 레포트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104OrderAnalysis (
    Ref_Cursor01  IN OUT SYS_REFCURSOR,       /*연령                           */
    Ref_Cursor02  IN OUT SYS_REFCURSOR,       /*성별                           */
    Ref_Cursor03  IN OUT SYS_REFCURSOR,       /*대리점 지역별                  */
    Ref_Cursor04  IN OUT SYS_REFCURSOR,       /*계약기간별                     */
    Ref_Cursor05  IN OUT SYS_REFCURSOR,       /*on/off별                       */
    Ref_Cursor06  IN OUT SYS_REFCURSOR,       /*채널별                         */
    Ref_Cursor07  IN OUT SYS_REFCURSOR,       /*패턴별                         */
    Ref_Cursor08  IN OUT SYS_REFCURSOR,       /*인치별                         */
    Ref_Cursor09  IN OUT SYS_REFCURSOR,       /*교체유입 제조사                */
    v_FDay        IN RTSD0104.ORD_DAY%TYPE,   /*조회시작일                     */
    v_EDay        IN RTSD0104.ORD_DAY%TYPE,   /*조회종료일                     */
    v_Dis_Gb      IN VARCHAR2,                /*조회구분(1:장착기준,2:주문기준)*/
    v_Val_Gb      IN VARCHAR2                 /*지표구분(1:계약건수,2:상품건수)*/
    );



 /*****************************************************************************
  -- 월간 계약 현황 분석 레포트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104OrderMonthAnalysis (
    Ref_Cursor    IN OUT SYS_REFCURSOR,
    v_FDay        IN RTSD0104.ORD_DAY%TYPE, /*조회시작일                       */
    v_EDay        IN RTSD0104.ORD_DAY%TYPE, /*조회종료일                       */
    v_Dis_Gb      IN VARCHAR2,              /*조회구분(1:장착기준,2:주문기준)  */
    v_Val_Gb      IN VARCHAR2,              /*지표구분(1:계약건수,2:상품건수)  */
    v_Tim_Gb      IN VARCHAR2,              /*시간단위(1:1시간,2:2시간,3:3시간)*/
    v_Chan_Cd     IN VARCHAR2               /*채널구분                         */
    );

  /*****************************************************************************
  -- 수금내역 조회 - 조회조건에 맞는 계약정보를 조회한다.
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.6        2017-12-19  wjim             [20171219_01] '계약상태' 조회조건 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0104ResultCashApp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,        /*고객명                */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,         /*전화번호              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE         /*계약상태              */--[20171219_01]
    );

 /*****************************************************************************
  -- 계약 정보 - 차량정보 업데이트
  *****************************************************************************/
 PROCEDURE p_Rtsd0104CarInfoUpdate (
    v_Ord_no         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Maker_Cd       IN RTSD0104.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0104.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0104.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0104.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0104.CAR_OWNER%TYPE,      /*차량소유주            */
    v_C_Mileage      IN RTSD0104.C_MILEAGE%TYPE,      /*현재 주행거리         */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 계약 정보 Select - 고객현황 - 주문현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104CustAnalysis03 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE         /*고객번호              */
    );

  /*****************************************************************************
  -- 방판오더(B,O,M) SAP인터페이스 유무
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
  *****************************************************************************/
  FUNCTION f_sRtsd0104ToRtsd0115Count(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,           /*주문번호            */
    v_Ord_Type       IN VARCHAR2                        /*오더타입            */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 계약 정보 Update - 재렌탈 정보 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104ReRental (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Add_No         IN RTSD0104.ORD_NO%TYPE,         /*상태                  */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 계약상품 납부정보
  *****************************************************************************/
  PROCEDURE p_sRtsd0104CntPrdPymInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    );
 
 /*****************************************************************************
  -- 계약 번호조회 팝업 - 계약현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104_ordNoList2PoPup (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_custTp     IN RTSD0100.CUST_TP%TYPE,                /*고객유형          */
    v_statCd     IN RTSD0104.STAT_CD%TYPE,                /*계약상태          */
    v_chanCd     IN RTSD0104.CHAN_CD%TYPE,                /*채널구분          */
    v_Birthday   IN RTSD0100.BIRTH_DAY%TYPE,              /*법정생년월일      */
    v_mobNo      IN RTSD0100.MOB_NO%TYPE,                 /*핸드폰            */
    v_carNo      IN RTSD0104.CAR_NO%TYPE,                 /*차량번호          */
    v_custNm     IN RTSD0100.CUST_NM%TYPE,                /*고객명/법인명     */
    v_telNo      IN RTSD0100.TEL_NO%TYPE,                 /*전화번호          */
    v_telNo2     IN RTSD0100.TEL_NO2%TYPE,                /*전화번호2         */
    v_gender     IN RTSD0100.GENDER_CD%TYPE,              /*성별              */
    v_lf         IN RTSD0100.LF_CD%TYPE,                  /*내외국인          */
    v_buslNo     IN RTSD0100.BUSL_NO%TYPE,                /*사업자번호        */
    v_Ord_No     IN RTSD0104.ORD_NO%TYPE,                  /*주문번호          */
    v_Grp_No     IN RTSD0104.GRP_NO%TYPE                  /*주문번호          */
    );
/*****************************************************************************
  -- 계약 번호조회 팝업 - 계약현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104_ordNoList3PoPup (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_custTp     IN RTSD0100.CUST_TP%TYPE,                /*고객유형          */
    v_orderCd     IN RTSD0104.ORD_ID%TYPE,                /*주문유형          */
    v_Birthday   IN RTSD0100.BIRTH_DAY%TYPE,              /*법정생년월일      */
    v_mobNo      IN RTSD0100.MOB_NO%TYPE,                 /*핸드폰            */
    v_custNm     IN RTSD0100.CUST_NM%TYPE,                /*고객명/법인명     */
    v_buslNo     IN RTSD0100.BUSL_NO%TYPE                /*사업자번호        */
    );

/*****************************************************************************
  -- 배송현황조회 팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0104_ordNoList4PoPup (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Ord_No     IN RTSD0104.ORD_NO%TYPE,                /*주문번호          */
    v_Order_Type IN VARCHAR2,                            /*주문유형          */
    v_Req_Num    IN NUMBER
    );
    
  /*****************************************************************************
  -- 계약 정보 관리(IUD)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.   
   1.5        2017-11-14  wjim             [20171114_01] 고객별 장착제한개수 판단기준 보완
                                           - 겨울용타이어 신규 주문 시도 시 판단 Skip
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가                                           
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0104DirectOrder ( 
     v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN OUT RTSD0104.ORD_NO%TYPE,     /*주문번호              */
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_Id         IN RTSD0104.ORD_ID%TYPE,         /*주문구분              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE,        /*채널구분              */
    v_Sale_Id        IN RTSD0104.SALE_ID%TYPE,        /*계약유형              */
    v_Period_Cd      IN RTSD0104.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0104.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0104.REGI_CD%TYPE,        /*등록비코드            */
    v_Camp_Yn        IN RTSD0104.CAMP_YN%TYPE,        /*캠페인적용여부        */
    v_C_Dcrate       IN RTSD0104.C_DCRATE%TYPE,       /*캠페인할인율          */
    v_C_Dcamt        IN RTSD0104.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0104.CUST_TP%TYPE,        /*고객유형              */
    v_Safekey        IN RTSD0104.SAFEKEY%TYPE,        /*인증번호              */
    v_Grp_Yn         IN RTSD0104.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,         /*고객결합번호          */
    v_G_Dcrate       IN RTSD0104.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0104.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0104.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0104.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcrate       IN RTSD0104.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0104.F_DCAMT%TYPE,        /*최종할인액            */
    v_Bord_No        IN RTSD0104.BORD_NO%TYPE,        /*이전주문번호          */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*장착일자              */
    v_Canc_Day       IN RTSD0104.CANC_DAY%TYPE,       /*취소일자              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Eng_Nm         IN RTSD0104.ENG_NM%TYPE,         /*장착기사              */
    v_Ag_Desc        IN RTSD0104.AG_DESC%TYPE,        /*특이사항(장착점)      */
    v_Maker_Cd       IN RTSD0104.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0104.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0104.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0104.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0104.CAR_OWNER%TYPE,      /*차량소유자            */
    v_C_Mileage      IN RTSD0104.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Req_Text       IN OUT RTSD0104.REQ_TEXT%TYPE,       /*비고(기타정보)        */
    v_Pay_Mthd       IN RTSD0104.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0104.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0104.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0104.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0104.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0104.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0104.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0104.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Bill_Yn        IN RTSD0104.BILL_YN%TYPE,        /*세금계산서발행여부    */
    v_Crdt_Stat      IN RTSD0104.CRDT_STAT%TYPE,      /*신용조회상태          */
    v_Cert_Cd        IN RTSD0104.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Stat      IN RTSD0104.CERT_STAT%TYPE,      /*본인인증상태          */
    v_Ord_Agent      IN RTSD0104.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Cd         IN RTSD0104.ORG_CD%TYPE,         /*판매조직              */
    v_Org_Hq         IN RTSD0104.ORG_HQ%TYPE,         /*판매본부              */
    v_Org_L1         IN RTSD0104.ORG_L1%TYPE,         /*판매조직-1LV          */
    v_Org_L2         IN RTSD0104.ORG_L2%TYPE,         /*판매조직-2LV          */
    v_Org_L3         IN RTSD0104.ORG_L3%TYPE,         /*판매조직-3LV          */
    v_Org_L4         IN RTSD0104.ORG_L4%TYPE,         /*판매조직-4LV          */
    v_Ins_Org        IN RTSD0104.INS_ORG%TYPE,        /*입력조직              */
    v_Ps_Cd          IN RTSD0104.PS_CD%TYPE,          /*프리미엄서비스코드    */
    v_Cmsag_Yn       IN RTSD0104.CMSAG_YN%TYPE,       /*CMS출금이체동의       */
    v_Con_Mthd       IN RTSD0104.CON_MTHD%TYPE,       /*계약서 교부방법       */
    v_Pcert_Yn       IN RTSD0104.PCERT_YN%TYPE,       /*신분증 첨부 필수여부  */
    v_Fc_Day         IN OUT RTSD0104.FC_DAY%TYPE,         /*최초청구일자          */
    v_Ag_Day         IN RTSD0104.AG_DAY%TYPE,         /*개인정보제공 동의일   */
    v_Ag_Seq         IN RTSD0104.AG_SEQ%TYPE,         /*개인정보제공 동의순번 */
    v_Input_Dt       IN RTSD0104.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0104.FILE_PATH%TYPE,      /*계약서 파일경로       */
    v_File_Name      IN RTSD0104.FILE_NAME%TYPE,      /*계약서 파일명         */
    v_Tcgrp_No       IN RTSD0104.TCGRP_NO%TYPE,       /*통합청구번호          */
    v_Vbeln          IN RTSD0104.VBELN%TYPE,          /*SO번호                */
    v_Season_Cd      IN RTSD0104.SEASON_CD%TYPE,      /*시즌구분              */
    v_Regi_Amt       IN RTSD0104.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Sum_Mon_Amt    IN RTSD0104.SUM_MON_AMT%TYPE,    /*합계월렌탈료          */
    v_Mon_Amt        IN RTSD0104.MON_AMT%TYPE,        /*월렌탈료              */
    v_Sale_Cd        IN RTSD0104.SALE_CD%TYPE,        /*판매상품코드          */
    v_Pay_Gb         IN RTSD0104.PAY_GB%TYPE,         /*납부구분              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTSD0104.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTSD0104.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst1_Poscd    IN RTSD0104.INST1_POSCD%TYPE,    /*장착주소-우편번호     */ --[2019-00359563]
    v_Inst1_Addr1    IN RTSD0104.INST1_ADDR1%TYPE,    /*장착주소-주소         */ --[2019-00359563]
    v_Inst1_Addr2    IN RTSD0104.INST1_ADDR2%TYPE,    /*장착주소-상세주소     */ --[2019-00359563]
    v_Inst2_Poscd    IN RTSD0104.INST2_POSCD%TYPE,    /*배송주소-우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTSD0104.INST2_ADDR1%TYPE,    /*배송주소-주소         */ --[2019-00359563]
    v_Inst2_Addr2    IN RTSD0104.INST2_ADDR2%TYPE,    /*배송주소-상세주소     */ --[2019-00359563]
    v_Tms_OrderId    IN RTSD0104.TMS_ORDERID%TYPE,    /*TMS orderId     */ --[20200316]
    v_Out_Stock_Yn   IN RTSD0104.OUT_STOCK_YN%TYPE,   /*자사재고 사용여부     */ --[22210727_01] [20221107_1]
    v_Out_Stock_Type IN RTSD0104.OUT_STOCK_TYPE%TYPE, /*자사재고 미사용사유     */ --[20221107_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
    /*****************************************************************************
  -- 계약 정보 Select - 고객현황 - 주문현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104CustAnalysis03New (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE         /*고객번호              */
    );

  /*****************************************************************************
  -- 계약 정보 관리(IUD)
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.   
   1.5        2017-11-14  wjim             [20171114_01] 고객별 장착제한개수 판단기준 보완
                                           - 겨울용타이어 신규 주문 시도 시 판단 Skip
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가                                           
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0104MemberOrder ( 
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Ord_No         IN OUT RTSD0104.ORD_NO%TYPE,     /*주문번호              */
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_Id         IN RTSD0104.ORD_ID%TYPE,         /*주문구분              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE,        /*채널구분              */
    v_Sale_Id        IN RTSD0104.SALE_ID%TYPE,        /*계약유형              */
    v_Period_Cd      IN RTSD0104.PERIOD_CD%TYPE,      /*기간코드              */
    v_Cnt_Cd         IN RTSD0104.CNT_CD%TYPE,         /*타이어본수            */
    v_Regi_Cd        IN RTSD0104.REGI_CD%TYPE,        /*등록비코드            */
    v_Camp_Yn        IN RTSD0104.CAMP_YN%TYPE,        /*캠페인적용여부        */
    v_C_Dcrate       IN RTSD0104.C_DCRATE%TYPE,       /*캠페인할인율          */
    v_C_Dcamt        IN RTSD0104.C_DCAMT%TYPE,        /*캠페인할인금액        */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Cust_Tp        IN RTSD0104.CUST_TP%TYPE,        /*고객유형              */
    v_Safekey        IN RTSD0104.SAFEKEY%TYPE,        /*인증번호              */
    v_Grp_Yn         IN RTSD0104.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0104.GRP_NO%TYPE,         /*고객결합번호          */
    v_G_Dcrate       IN RTSD0104.G_DCRATE%TYPE,       /*결합할인율            */
    v_G_Dcamt        IN RTSD0104.G_DCAMT%TYPE,        /*결합할인액            */
    v_L_Dcrate       IN RTSD0104.L_DCRATE%TYPE,       /*제한할인율            */
    v_L_Dcamt        IN RTSD0104.L_DCAMT%TYPE,        /*제한할인액            */
    v_F_Dcrate       IN RTSD0104.F_DCRATE%TYPE,       /*최종할인율            */
    v_F_Dcamt        IN RTSD0104.F_DCAMT%TYPE,        /*최종할인액            */
    v_Bord_No        IN RTSD0104.BORD_NO%TYPE,        /*이전주문번호          */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Proc_Day       IN RTSD0104.PROC_DAY%TYPE,       /*장착일자              */
    v_Canc_Day       IN RTSD0104.CANC_DAY%TYPE,       /*취소일자              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Eng_Nm         IN RTSD0104.ENG_NM%TYPE,         /*장착기사              */
    v_Ag_Desc        IN RTSD0104.AG_DESC%TYPE,        /*특이사항(장착점)      */
    v_Maker_Cd       IN RTSD0104.MAKER_CD%TYPE,       /*카메이커              */
    v_Model_Cd       IN RTSD0104.MODEL_CD%TYPE,       /*차종                  */
    v_Contents_Cd    IN RTSD0104.CONTENTS_CD%TYPE,    /*사양                  */
    v_Fr_Cd          IN RTSD0104.FR_CD%TYPE,          /*전후 구분             */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTSD0104.CAR_OWNER%TYPE,      /*차량소유자            */
    v_C_Mileage      IN RTSD0104.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Req_Text       IN OUT RTSD0104.REQ_TEXT%TYPE,       /*비고(기타정보)        */
    v_Pay_Mthd       IN RTSD0104.PAY_MTHD%TYPE,       /*결제구분              */
    v_Pay_Dd         IN RTSD0104.PAY_DD%TYPE,         /*이체일                */
    v_Acc_Seq        IN RTSD0104.ACC_SEQ%TYPE,        /*계좌순번              */
    v_Crd_Seq        IN RTSD0104.CRD_SEQ%TYPE,        /*카드순번              */
    v_Acc_Chk        IN RTSD0104.ACC_CHK%TYPE,        /*계좌확인상태          */
    v_Acc_Stat       IN RTSD0104.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Bkey_Chk       IN RTSD0104.BKEY_CHK%TYPE,       /*배치키생성여부(카드)  */
    v_Batch_Key      IN RTSD0104.BATCH_KEY%TYPE,      /*BATCH KEY             */
    v_Bill_Yn        IN RTSD0104.BILL_YN%TYPE,        /*세금계산서발행여부    */
    v_Crdt_Stat      IN RTSD0104.CRDT_STAT%TYPE,      /*신용조회상태          */
    v_Cert_Cd        IN RTSD0104.CERT_CD%TYPE,        /*본인인증방법          */
    v_Cert_Stat      IN RTSD0104.CERT_STAT%TYPE,      /*본인인증상태          */
    v_Ord_Agent      IN RTSD0104.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Org_Cd         IN RTSD0104.ORG_CD%TYPE,         /*판매조직              */
    v_Org_Hq         IN RTSD0104.ORG_HQ%TYPE,         /*판매본부              */
    v_Org_L1         IN RTSD0104.ORG_L1%TYPE,         /*판매조직-1LV          */
    v_Org_L2         IN RTSD0104.ORG_L2%TYPE,         /*판매조직-2LV          */
    v_Org_L3         IN RTSD0104.ORG_L3%TYPE,         /*판매조직-3LV          */
    v_Org_L4         IN RTSD0104.ORG_L4%TYPE,         /*판매조직-4LV          */
    v_Ins_Org        IN RTSD0104.INS_ORG%TYPE,        /*입력조직              */
    v_Ps_Cd          IN RTSD0104.PS_CD%TYPE,          /*프리미엄서비스코드    */
    v_Cmsag_Yn       IN RTSD0104.CMSAG_YN%TYPE,       /*CMS출금이체동의       */
    v_Con_Mthd       IN RTSD0104.CON_MTHD%TYPE,       /*계약서 교부방법       */
    v_Pcert_Yn       IN RTSD0104.PCERT_YN%TYPE,       /*신분증 첨부 필수여부  */
    v_Fc_Day         IN OUT RTSD0104.FC_DAY%TYPE,         /*최초청구일자          */
    v_Ag_Day         IN RTSD0104.AG_DAY%TYPE,         /*개인정보제공 동의일   */
    v_Ag_Seq         IN RTSD0104.AG_SEQ%TYPE,         /*개인정보제공 동의순번 */
    v_Input_Dt       IN RTSD0104.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_File_Path      IN RTSD0104.FILE_PATH%TYPE,      /*계약서 파일경로       */
    v_File_Name      IN RTSD0104.FILE_NAME%TYPE,      /*계약서 파일명         */
    v_Tcgrp_No       IN RTSD0104.TCGRP_NO%TYPE,       /*통합청구번호          */
    v_Vbeln          IN RTSD0104.VBELN%TYPE,          /*SO번호                */
    v_Season_Cd      IN RTSD0104.SEASON_CD%TYPE,      /*시즌구분              */
    v_Regi_Amt       IN RTSD0104.REGI_AMT%TYPE,       /*렌탈등록비            */
    v_Sum_Mon_Amt    IN RTSD0104.SUM_MON_AMT%TYPE,    /*합계월렌탈료          */
    v_Mon_Amt        IN RTSD0104.MON_AMT%TYPE,        /*월렌탈료              */
    v_Sale_Cd        IN RTSD0104.SALE_CD%TYPE,        /*판매상품코드          */
    v_Pay_Gb         IN RTSD0104.PAY_GB%TYPE,         /*납부구분              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Inst_Cd        IN RTSD0104.INST_CD%TYPE,        /*장착유형코드          */ --[2019-00359563]
    v_Inst_Tm        IN RTSD0104.INST_TM%TYPE,        /*장착희망시간          */ --[2019-00359563]
    v_Inst1_Poscd    IN RTSD0104.INST1_POSCD%TYPE,    /*장착주소-우편번호     */ --[2019-00359563]
    v_Inst1_Addr1    IN RTSD0104.INST1_ADDR1%TYPE,    /*장착주소-주소         */ --[2019-00359563]
    v_Inst1_Addr2    IN RTSD0104.INST1_ADDR2%TYPE,    /*장착주소-상세주소     */ --[2019-00359563]
    v_Inst2_Poscd    IN RTSD0104.INST2_POSCD%TYPE,    /*배송주소-우편번호     */ --[2019-00359563]
    v_Inst2_Addr1    IN RTSD0104.INST2_ADDR1%TYPE,    /*배송주소-주소         */ --[2019-00359563]
    v_Inst2_Addr2    IN RTSD0104.INST2_ADDR2%TYPE,    /*배송주소-상세주소     */ --[2019-00359563]
    v_Tms_OrderId    IN RTSD0104.TMS_ORDERID%TYPE,    /*TMS orderId     */ --[20200316]
    v_Out_Stock_Yn   IN RTSD0104.OUT_STOCK_YN%TYPE,   /*자사재고 사용여부     */ --[22210727_01] [20221107_1]
    v_Out_Stock_Type IN RTSD0104.OUT_STOCK_TYPE%TYPE, /*자사재고 미사용사유     */ --[20221107_01]
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
 
  /*****************************************************************************
  -- 등록급 및 일시불 납부
  *****************************************************************************/
  PROCEDURE p_regiAmtPay ( 
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  );
  
 /*****************************************************************************
  -- 계약 번호조회 팝업 - 계약현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104_ordNoListPackage (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_custTp     IN RTSD0100.CUST_TP%TYPE,                /*고객유형          */
    v_statCd     IN RTSD0104.STAT_CD%TYPE,                /*계약상태          */
    v_chanCd     IN RTSD0104.CHAN_CD%TYPE,                /*채널구분          */
    v_Birthday   IN RTSD0100.BIRTH_DAY%TYPE,              /*법정생년월일      */
    v_mobNo      IN RTSD0100.MOB_NO%TYPE,                 /*핸드폰            */
    v_carNo      IN RTSD0104.CAR_NO%TYPE,                 /*차량번호          */
    v_custNm     IN RTSD0100.CUST_NM%TYPE,                /*고객명/법인명     */
    v_telNo      IN RTSD0100.TEL_NO%TYPE,                 /*전화번호          */
    v_telNo2     IN RTSD0100.TEL_NO2%TYPE,                /*전화번호2         */
    v_gender     IN RTSD0100.GENDER_CD%TYPE,              /*성별              */
    v_lf         IN RTSD0100.LF_CD%TYPE,                  /*내외국인          */
    v_buslNo     IN RTSD0100.BUSL_NO%TYPE,                /*사업자번호        */
    v_Ord_No     IN RTSD0104.ORD_NO%TYPE,                  /*주문번호          */
    v_Grp_No     IN RTSD0104.GRP_NO%TYPE                    /* 단체번호 */
    );
    
 /*****************************************************************************
  -- 랜탈 계약 현황 분석 레포트 New
  *****************************************************************************/
  PROCEDURE p_sRtsd0104OrderAnalysisNew (
    Ref_Cursor01  IN OUT SYS_REFCURSOR,       /*연령                           */
    Ref_Cursor02  IN OUT SYS_REFCURSOR,       /*성별                           */
    Ref_Cursor03  IN OUT SYS_REFCURSOR,       /*대리점 지역별                  */
    Ref_Cursor04  IN OUT SYS_REFCURSOR,       /*계약기간별                     */
    Ref_Cursor05  IN OUT SYS_REFCURSOR,       /*on/off별                       */
    Ref_Cursor06  IN OUT SYS_REFCURSOR,       /*채널별                         */
    Ref_Cursor07  IN OUT SYS_REFCURSOR,       /*패턴별                         */
    Ref_Cursor08  IN OUT SYS_REFCURSOR,       /*인치별                         */
    Ref_Cursor09  IN OUT SYS_REFCURSOR,       /*교체유입 제조사                */
    v_FDay        IN RTSD0104.ORD_DAY%TYPE,   /*조회시작일                     */
    v_EDay        IN RTSD0104.ORD_DAY%TYPE,   /*조회종료일                     */
    v_Dis_Gb      IN VARCHAR2,                /*조회구분(1:장착기준,2:주문기준)*/
    v_Val_Gb      IN VARCHAR2                 /*지표구분(1:계약건수,2:상품건수)*/
    );
        
  /*****************************************************************************
  -- 월간 계약 현황 분석 레포트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104OrdMonthAnalysisNew (
    Ref_Cursor    IN OUT SYS_REFCURSOR,
    v_FDay        IN RTSD0104.ORD_DAY%TYPE, /*조회시작일                       */
    v_EDay        IN RTSD0104.ORD_DAY%TYPE, /*조회종료일                       */
    v_Dis_Gb      IN VARCHAR2,              /*조회구분(1:장착기준,2:주문기준)  */
    v_Val_Gb      IN VARCHAR2,              /*지표구분(1:계약건수,2:상품건수)  */
    v_Tim_Gb      IN VARCHAR2,              /*시간단위(1:1시간,2:2시간,3:3시간)*/
    v_Chan_Cd     IN VARCHAR2               /*채널구분                         */
    );
    
    
 /*****************************************************************************
  -- 계약 현황 조회 상담 NEW
  -- - 재렌탈가능일 기준은 Pkg_Comm.p_sReRentalInfo 와 동일해야 함

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-12-20  김창률             최초작성
  *****************************************************************************/
  PROCEDURE p_sRtsdAdviceStatusNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,          /*주문번호              */
    v_Cust_No         IN RTSD0104.CUST_NO%TYPE          /*주문번호              */
  );    

 /*****************************************************************************
  -- 상담통합관리 계약 현황 조회 - 설치정보
  *****************************************************************************/
  PROCEDURE p_sRtsdStatus_Adviceinstall (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE                        /*주문번호*/
    );
    
  /*****************************************************************************
  -- 단체여부 확인 
  *****************************************************************************/
  FUNCTION f_sRtsd0104GrpYnD (
    v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체할인율 적용대상 여부확인 
  *****************************************************************************/
  FUNCTION f_sRtsd0104GrpYnCnt (
    v_Grp_No            IN RTSD0104.GRP_NO%TYPE         /* 단체번호           */
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체, 계약시 채널 및 단체 할인 Insert
  *****************************************************************************/
  FUNCTION f_sRtsd0104SaleIns (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_DC_GB              IN CHAR,
    v_ErrorText          OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 단체, 계약시 채널 및 단체 할인 이력 Insert
  *****************************************************************************/
  FUNCTION f_sRtsd0104SaleTempIns (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_DC_GB              IN CHAR,
    v_ErrorText          OUT VARCHAR2
    ) RETURN NUMBER;  

/*****************************************************************************
  -- 계약 현황 조회 상담 NEW
  -- - 재렌탈가능일 기준은 Pkg_Comm.p_sReRentalInfo 와 동일해야 함

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-12-20  김창률             최초작성
  *****************************************************************************/
  PROCEDURE p_sRtsdAdviceStatusContract (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
  );
  
  /*****************************************************************************
  -- 계약별 계약 상태여부
  *****************************************************************************/
  FUNCTION f_sRtsd0104OrderSt (
    v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호            */
  ) RETURN VARCHAR2;
  /*****************************************************************************
  -- 계약 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104CheckOrdNo(
    v_Cust_No         IN RTSD0104.CUST_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR2;    
  

  /*****************************************************************************
  -- 계약 정보 Select - 주문현황리스트
 
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.01       2016-07-12  이영근           대리점코드/채널대분류/채널중분류 컬럼 추가   
   1.7        2018-03-01  wjim             [20180301_03] 프리미엄 서비스 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0104StatusBizApp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Fday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자FROM          */
    v_Ord_Tday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자TO            */
    v_Sales_Office   IN RTSD0104.SALES_OFFICE%TYPE,   /*지점                  */
    v_Sales_Group    IN RTSD0104.SALES_GROUP%TYPE,    /*지사                  */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착 대리점           */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Proc_Fday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0104.PROC_DAY%TYPE,        /*장착일자TO            */
    v_Mob_No      IN RTSD0100.MOB_NO%TYPE,        /*핸드폰번호  20160407추가 한승훈     */
    v_Reg_Id      IN RTSD0100.REG_ID%TYPE        /*조회자ID  20181031추가 김선태     */
    );
      
  /*****************************************************************************
  -- 주문등록시 값 비교하기 위한 FUNCTION
  *****************************************************************************/
  FUNCTION f_sRtsd0104SumMonAtm (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*계약번호              */
    ) RETURN NUMBER;  
 
  /*****************************************************************************
  -- 계약금액 체크 
  *****************************************************************************/
  PROCEDURE p_sRtsd0104ChkSumMonAtm (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- USAGE 구분 (Pkg_Exif0002, Pkg_Exif0003)
  *****************************************************************************/
  FUNCTION f_sRtsdGetUsage (
    v_Ord_Day         IN RTSD0104.ORD_DAY%TYPE,           /*주문일자              */
    v_Proc_Day        IN RTSD0104.PROC_DAY%TYPE,         /*장착일자              */
    v_Chan_Cd         IN RTSD0104.CHAN_CD%TYPE           /*채널코드              */
    ) RETURN VARCHAR2;
  
  /*****************************************************************************
  -- 계약서 우편발송대상 추출
 
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0       2020-07-10  kstka              
  *****************************************************************************/
   PROCEDURE p_sSendContractList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Send_Fday       IN RTSD0104.ORD_DAY%TYPE,        /*장착일자FROM          */
    v_Send_Tday       IN RTSD0104.ORD_DAY%TYPE        /*장착일자TO            */
    ); 
    
  /*****************************************************************************
  -- 계약만료대상 추출
 
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0       2020-10-05  kstka              
  *****************************************************************************/
  PROCEDURE p_sEndContractList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_End_Fday       IN RTSD0104.ORD_DAY%TYPE,        /*장착일자FROM          */
    v_End_Tday       IN RTSD0104.ORD_DAY%TYPE        /*장착일자TO            */
    );
  
  /*****************************************************************************
  -- 계약 정보 Update - 임직원 상품의 경우 임직원 정보 업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0104EmpNo (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Emp_No         IN RTSD0104.EMP_NO%TYPE,         /*상태                  */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*상태                  */
    v_Success_Code      OUT NUMBER
    );
    
  /*****************************************************************************
  -- 계약취소여부 확인 (1달이내)
  *****************************************************************************/
  FUNCTION f_sRtsdCheckCancelOrder (
    v_Cust_No  IN RTSD0100.CUST_NO%TYPE,
    v_Chan_Cd  IN RTSD0104.CHAN_CD%TYPE
  ) RETURN VARCHAR; 
  
  /*****************************************************************************
  -- SAP인터페이스 오더 정보 조회
 
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0       2023-09-14   kstka              
  *****************************************************************************/
  PROCEDURE p_sNoMadeOrderList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Mode           IN CHAR,                          /*조회모드              */
    v_Ord_Fday       IN RTSD0104.ORD_DAY%TYPE,         /*주문일자FROM          */
    v_Ord_Tday       IN RTSD0104.ORD_DAY%TYPE,         /*주문일자TO            */
    v_Proc_Fday      IN RTSD0104.PROC_DAY%TYPE,        /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0104.PROC_DAY%TYPE,        /*장착일자TO            */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,       /*대리점코드            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,          /*주문번호              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE,         /*채널코드              */
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,          /*휴대폰번호            */
    v_Out_Stock_Type IN RTSD0104.OUT_STOCK_TYPE%TYPE,  /*재고유형              */
    v_Rental_Goup    IN VARCHAR2,                      /*렌탈지사              */
    v_Rental_Office  IN VARCHAR2,                      /*렌탈지점              */
    v_Login_Grp      IN VARCHAR2,                      /*로그인그룹            */
    v_Login_Id       IN VARCHAR2                       /*로그인아이디           */
    );
    
  /*****************************************************************************
  -- 계약 정보 Update - 주문유형 Data UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104OrderType (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Order_Type     IN RTSD0104.AG_DESC%TYPE,        /*주문유형              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
END Pkg_Rtsd0104;