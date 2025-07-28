CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0108 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0108
   PURPOSE   장착 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
   1.0.1      2016-11-10  wjim             [20161110-01]
                                           - 차량번호 저장시 공백제거
   1.0.2      2017-04-05  wjim             [20170405_02]
                                           - 장착완료 시 SMS 발송 추가                                            
   1.0.3      2017-06-13  wjim             [20170613_01]
                                           - 장착완료 SMS 메시지 변경         
   1.1        2017-09-11  wjim             [20170906_01] 장착완료 SMS 메시지 변경
   1.2        2017-11-07  wjim             [20171107_01] 대리점실적조회 중복조회 보완
   1.3        2017-11-28  wjim             [20171128_01] 계약종료일자 기준변경
                                           - 기존 : 계약상품정보의 계약종료일자 = 장착예정일 기준 (오류로 확인)
                                           - 변경 : 장착일자 기준
   1.4        2017-12-15  wjim             [20171215_01] 장착완료 시 롯데카드 프로모션 안내 SMS 한시적 추가                                
   1.5        2018-03-02  wjim             [20180302_01] 장착완료 SMS 메시지 변경(선택형 서비스 도입)
   1.6        2018-03-28  wjim             [20180328_01] 장착완료 시 롯데카드 프로모션 안내 SMS 한시적 추가
   1.7        2019-02-28  wjim             [20190228_01] 대리점실적조회 조회항목 추가
   1.8        2019-03-07  wjim             [20190301_01] 대리점 실적조회 전체 조회권한 조정    
   1.9        2019-08-07  kstka            [20190807_01] 종료된 제품의 경우 내이용상품 조회 불가 해제
   1.10       2019-12-17  wjim             [2019-00359563] O2O 항목 추가
   1.11       2020-01-10  kstka            [2020-00008994] 쇼핑몰 렌탈 장착주소 컬럼 추가
   1.12       2020-01-13  kstka            [2020-00008994] 장착구분 컬럼 추가
   1.13       2022-05-10  kstka            [20220510_01] 장착완료시 SMS발송문구 변경
*******************************************************************************/

  /*****************************************************************************
  -- 장착 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0108Count(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*계약번호            */
    ) RETURN NUMBER IS

    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0108
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0108Count;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*계약번호            */
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
            A.BORD_NO,                   /*이전계약번호        */
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
            A.DEPT_YN,                   /*연체여부            */
            A.MFP_YN,                    /*중도완납여부        */
            A.TCAN_YN,                   /*임시해약여부        */
            A.OS_YN,                     /*소유권이전여부      */
            A.OS_DAY,                    /*종료일자(소유권이전)*/
            A.ORD_TP,                    /*계약구분2           */
            A.EQU_NO,                    /*설비번호            */
            A.REGI_AMT,                  /*렌탈등록비          */
            A.MON_AMT,                   /*월렌탈료            */
            A.FL_YN,                     /*장착위-앞,왼쪽      */
            A.FR_YN,                     /*장착위치-앞,오른쪽  */
            A.RL_YN,                     /*장착위치-뒤,왼쪽    */
            A.RR_YN,                     /*장착위치-뒤,오른쪽  */
            A.SV_SERT  ,                /*서비스만족도          */
            A.AG_SERT  ,                /*대리점만족도          */
            A.TD_YN    ,                /*기존타이어폐기위탁동의*/
            A.INPUT_DT ,                /*PAD입력일시           */
            A.FILE_PATH,                /*장착확인서 파일경로   */
            A.FILE_NAME,                /*장착확인서 파일명     */
            A.TCGRP_NO,                  /*통합청구번호        */
            A.VBELN,                     /*SO번호              */
            A.SEASON_CD,                 /*시즌구분              */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0108 A
    WHERE   A.ORD_NO        = DECODE(v_Ord_No       , NULL, A.ORD_NO       , v_Ord_No)
    AND     A.ORD_DAY       = DECODE(v_Ord_Day      , NULL, A.ORD_DAY      , v_Ord_Day)
    AND     A.ORD_ID        = DECODE(v_Ord_Id       , NULL, A.ORD_ID       , v_Ord_Id)
    AND     A.CHAN_CD       = DECODE(v_Chan_Cd      , NULL, A.CHAN_CD      , v_Chan_Cd)
    AND     A.SALE_ID       = DECODE(v_Sale_Id      , NULL, A.SALE_ID      , v_Sale_Id)
    AND     A.PERIOD_CD     = DECODE(v_Period_Cd    , NULL, A.PERIOD_CD    , v_Period_Cd)
    AND     A.CNT_CD        = DECODE(v_Cnt_Cd       , NULL, A.CNT_CD       , v_Cnt_Cd)
    AND     A.REGI_CD       = DECODE(v_Regi_Cd      , NULL, A.REGI_CD      , v_Regi_Cd)
    AND     A.CAMP_YN       = DECODE(v_Camp_Yn      , NULL, A.CAMP_YN      , v_Camp_Yn)
    AND     A.C_DCRATE      = DECODE(v_C_Dcrate     , NULL, A.C_DCRATE     , v_C_Dcrate)
    AND     A.C_DCAMT       = DECODE(v_C_Dcamt      , NULL, A.C_DCAMT      , v_C_Dcamt)
    AND     A.CUST_NO       = DECODE(v_Cust_No      , NULL, A.CUST_NO      , v_Cust_No)
    AND     A.CUST_TP       = DECODE(v_Cust_Tp      , NULL, A.CUST_TP      , v_Cust_Tp)
    AND     A.SAFEKEY       = DECODE(v_Safekey      , NULL, A.SAFEKEY      , v_Safekey)
    AND     A.GRP_YN        = DECODE(v_Grp_Yn       , NULL, A.GRP_YN       , v_Grp_Yn)
    AND     A.GRP_NO        = DECODE(v_Grp_No       , NULL, A.GRP_NO       , v_Grp_No)
    AND     A.G_DCRATE      = DECODE(v_G_Dcrate     , NULL, A.G_DCRATE     , v_G_Dcrate)
    AND     A.G_DCAMT       = DECODE(v_G_Dcamt      , NULL, A.G_DCAMT      , v_G_Dcamt)
    AND     A.L_DCRATE      = DECODE(v_L_Dcrate     , NULL, A.L_DCRATE     , v_L_Dcrate)
    AND     A.L_DCAMT       = DECODE(v_L_Dcamt      , NULL, A.L_DCAMT      , v_L_Dcamt)
    AND     A.F_DCRATE      = DECODE(v_F_Dcrate     , NULL, A.F_DCRATE     , v_F_Dcrate)
    AND     A.F_DCAMT       = DECODE(v_F_Dcamt      , NULL, A.F_DCAMT      , v_F_Dcamt)
    AND     A.BORD_NO       = DECODE(v_Bord_No      , NULL, A.BORD_NO      , v_Bord_No)
    AND     A.STAT_CD       = DECODE(v_Stat_Cd      , NULL, A.STAT_CD      , v_Stat_Cd)
    AND     A.PROC_DAY      = DECODE(v_Proc_Day     , NULL, A.PROC_DAY     , v_Proc_Day)
    AND     A.CANC_DAY      = DECODE(v_Canc_Day     , NULL, A.CANC_DAY     , v_Canc_Day)
    AND     A.AGENCY_CD     = DECODE(v_Agency_Cd    , NULL, A.AGENCY_CD    , v_Agency_Cd)
    AND     A.SALES_GROUP   = DECODE(v_Sales_Group  , NULL, A.SALES_GROUP  , v_Sales_Group)
    AND     A.SALES_OFFICE  = DECODE(v_Sales_Office , NULL, A.SALES_OFFICE , v_Sales_Office)
    AND     A.ENG_NM        = DECODE(v_Eng_Nm       , NULL, A.ENG_NM       , v_Eng_Nm)
    AND     A.AG_DESC       = DECODE(v_Ag_Desc      , NULL, A.AG_DESC      , v_Ag_Desc)
    AND     A.MAKER_CD      = DECODE(v_Maker_Cd     , NULL, A.MAKER_CD     , v_Maker_Cd)
    AND     A.MODEL_CD      = DECODE(v_Model_Cd     , NULL, A.MODEL_CD     , v_Model_Cd)
    AND     A.CONTENTS_CD   = DECODE(v_Contents_Cd  , NULL, A.CONTENTS_CD  , v_Contents_Cd)
    AND     A.FR_CD         = DECODE(v_Fr_Cd        , NULL, A.FR_CD        , v_Fr_Cd)
    AND     A.CAR_NO        = DECODE(v_Car_No       , NULL, A.CAR_NO       , v_Car_No)
    AND     A.CAR_OWNER     = DECODE(v_Car_Owner    , NULL, A.CAR_OWNER    , v_Car_Owner)
    AND     A.C_MILEAGE     = DECODE(v_C_Mileage    , NULL, A.C_MILEAGE    , v_C_Mileage)
    AND     A.REQ_TEXT      = DECODE(v_Req_Text     , NULL, A.REQ_TEXT     , v_Req_Text)
    AND     A.PAY_MTHD      = DECODE(v_Pay_Mthd     , NULL, A.PAY_MTHD     , v_Pay_Mthd)
    AND     A.PAY_DD        = DECODE(v_Pay_Dd       , NULL, A.PAY_DD       , v_Pay_Dd)
    AND     A.ACC_SEQ       = DECODE(v_Acc_Seq      , NULL, A.ACC_SEQ      , v_Acc_Seq)
    AND     A.CRD_SEQ       = DECODE(v_Crd_Seq      , NULL, A.CRD_SEQ      , v_Crd_Seq)
    AND     A.ACC_CHK       = DECODE(v_Acc_Chk      , NULL, A.ACC_CHK      , v_Acc_Chk)
    AND     A.ACC_STAT      = DECODE(v_Acc_Stat     , NULL, A.ACC_STAT     , v_Acc_Stat)
    AND     A.BKEY_CHK      = DECODE(v_Bkey_Chk     , NULL, A.BKEY_CHK     , v_Bkey_Chk)
    AND     A.BATCH_KEY     = DECODE(v_Batch_Key    , NULL, A.BATCH_KEY    , v_Batch_Key)
    AND     A.BILL_YN       = DECODE(v_Bill_Yn      , NULL, A.BILL_YN      , v_Bill_Yn)
    AND     A.CRDT_STAT     = DECODE(v_Crdt_Stat    , NULL, A.CRDT_STAT    , v_Crdt_Stat)
    AND     A.CERT_CD       = DECODE(v_Cert_Cd      , NULL, A.CERT_CD      , v_Cert_Cd)
    AND     A.CERT_STAT     = DECODE(v_Cert_Stat    , NULL, A.CERT_STAT    , v_Cert_Stat)
    AND     A.ORD_AGENT     = DECODE(v_Ord_Agent    , NULL, A.ORD_AGENT    , v_Ord_Agent)
    AND     A.ORG_CD        = DECODE(v_Org_Cd       , NULL, A.ORG_CD       , v_Org_Cd)
    AND     A.ORG_HQ        = DECODE(v_Org_Hq       , NULL, A.ORG_HQ       , v_Org_Hq)
    AND     A.ORG_L1        = DECODE(v_Org_L1       , NULL, A.ORG_L1       , v_Org_L1)
    AND     A.ORG_L2        = DECODE(v_Org_L2       , NULL, A.ORG_L2       , v_Org_L2)
    AND     A.ORG_L3        = DECODE(v_Org_L3       , NULL, A.ORG_L3       , v_Org_L3)
    AND     A.ORG_L4        = DECODE(v_Org_L4       , NULL, A.ORG_L4       , v_Org_L4)
    AND     A.INS_ORG       = DECODE(v_Ins_Org      , NULL, A.INS_ORG      , v_Ins_Org)
    AND     A.PS_CD         = DECODE(v_Ps_Cd        , NULL, A.PS_CD        , v_Ps_Cd)
    AND     A.DEPT_YN       = DECODE(v_Dept_Yn      , NULL, A.DEPT_YN      , v_Dept_Yn)
    AND     A.MFP_YN        = DECODE(v_Mfp_Yn       , NULL, A.MFP_YN       , v_Mfp_Yn)
    AND     A.TCAN_YN       = DECODE(v_Tcan_Yn      , NULL, A.TCAN_YN      , v_Tcan_Yn)
    AND     A.OS_YN         = DECODE(v_Os_Yn        , NULL, A.OS_YN        , v_Os_Yn)
    AND     A.ORD_TP        = DECODE(v_Ord_Tp       , NULL, A.ORD_TP       , v_Ord_Tp)
    AND     A.EQU_NO        = DECODE(v_Equ_No       , NULL, A.EQU_NO       , v_Equ_No)
    AND     A.REGI_AMT      = DECODE(v_Regi_Amt     , NULL, A.REGI_AMT     , v_Regi_Amt)
    AND     A.MON_AMT       = DECODE(v_Mon_Amt      , NULL, A.MON_AMT      , v_Mon_Amt)
    AND     A.FL_YN         = DECODE(v_Fl_Yn        , NULL, A.FL_YN        , v_Fl_Yn)
    AND     A.FR_YN         = DECODE(v_Fr_Yn        , NULL, A.FR_YN        , v_Fr_Yn)
    AND     A.RL_YN         = DECODE(v_Rl_Yn        , NULL, A.RL_YN        , v_Rl_Yn)
    AND     A.RR_YN         = DECODE(v_Rr_Yn        , NULL, A.RR_YN        , v_Rr_Yn)
    AND     A.REG_ID        = DECODE(v_Reg_Id       , NULL, A.REG_ID       , v_Reg_Id);

  END p_sRtsd0108;

  /*****************************************************************************
  -- 장착 정보 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0.1      2016-11-10  wjim             [20161110-01]
                                           - 차량번호 저장시 공백제거
   1.10       2019-12-17  wjim             [2019-00359563] O2O 항목 추가                                           
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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0108 (
            ORD_NO,
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
            DEPT_YN,
            MFP_YN,
            TCAN_YN,
            OS_YN,
            OS_DAY,
            ORD_TP,
            EQU_NO,
            REGI_AMT,
            MON_AMT,
            FL_YN,
            FR_YN,
            RL_YN,
            RR_YN,
            SV_SERT,
            AG_SERT,
            TD_YN,
            INPUT_DT,
            FILE_PATH,
            FILE_NAME,
            TCGRP_NO,
            VBELN,
            SEASON_CD,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            FORD_NO,
            INST_CD,
            INST_TM,
            INST1_POSCD,
            INST1_ADDR1,
            INST1_ADDR2,
            INST2_POSCD,
            INST2_ADDR1,
            INST2_ADDR2,
            ORD_RSN,
            USAGE
            )
    VALUES  (
            v_Ord_No,
            v_Ord_Day,
            v_Ord_Id,
            v_Chan_Cd,
            v_Sale_Id,
            v_Period_Cd,
            v_Cnt_Cd,
            v_Regi_Cd,
            v_Camp_Yn,
            v_C_Dcrate,
            v_C_Dcamt,
            v_Cust_No,
            v_Cust_Tp,
            v_Safekey,
            v_Grp_Yn,
            v_Grp_No,
            v_G_Dcrate,
            v_G_Dcamt,
            v_L_Dcrate,
            v_L_Dcamt,
            v_F_Dcrate,
            v_F_Dcamt,
            v_Bord_No,
            v_Stat_Cd,
            v_Proc_Day,
            v_Canc_Day,
            v_Agency_Cd,
            v_Sales_Group,
            v_Sales_Office,
            v_Eng_Nm,
            v_Ag_Desc,
            v_Maker_Cd,
            v_Model_Cd,
            v_Contents_Cd,
            v_Fr_Cd,
            TRIM(v_Car_No),
            v_Car_Owner,
            v_C_Mileage,
            v_Req_Text,
            v_Pay_Mthd,
            v_Pay_Dd,
            v_Acc_Seq,
            v_Crd_Seq,
            v_Acc_Chk,
            v_Acc_Stat,
            v_Bkey_Chk,
            v_Batch_Key,
            v_Bill_Yn,
            v_Crdt_Stat,
            v_Cert_Cd,
            v_Cert_Stat,
            v_Ord_Agent,
            v_Org_Cd,
            v_Org_Hq,
            v_Org_L1,
            v_Org_L2,
            v_Org_L3,
            v_Org_L4,
            v_Ins_Org,
            v_Ps_Cd,
            v_Dept_Yn,
            v_Mfp_Yn,
            v_Tcan_Yn,
            v_Os_Yn,
            v_Os_Day,
            v_Ord_Tp,
            v_Equ_No,
            v_Regi_Amt,
            v_Mon_Amt,
            v_Fl_Yn,
            v_Fr_Yn,
            v_Rl_Yn,
            v_Rr_Yn,
            v_Sv_Sert  ,
            v_Ag_Sert  ,
            v_Td_Yn    ,
            v_Input_Dt ,
            v_File_Path,
            v_File_Name,
            v_Tcgrp_No,
            v_Vbeln,
            v_Season_Cd,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Ford_No,
            v_Inst_Cd,    
            v_Inst_Tm,    
            v_Inst1_Poscd,
            v_Inst1_Addr1,
            v_Inst1_Addr2,
            v_Inst2_Poscd,
            v_Inst2_Addr1,
            v_Inst2_Addr2,
            v_Ord_Rsn,    
            v_Usage
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0108;

  /*****************************************************************************
  -- 장착 정보 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.10       2019-12-17  wjim             [2019-00359563] O2O 항목 추가
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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0108
    SET    ORD_DAY      = v_Ord_Day,
           ORD_ID       = v_Ord_Id,
           CHAN_CD      = v_Chan_Cd,
           SALE_ID      = v_Sale_Id,
           PERIOD_CD    = v_Period_Cd,
           CNT_CD       = v_Cnt_Cd,
           REGI_CD      = v_Regi_Cd,
           CAMP_YN      = v_Camp_Yn,
           C_DCRATE     = v_C_Dcrate,
           C_DCAMT      = v_C_Dcamt,
           CUST_NO      = v_Cust_No,
           CUST_TP      = v_Cust_Tp,
           SAFEKEY      = v_Safekey,
           GRP_YN       = v_Grp_Yn,
           GRP_NO       = v_Grp_No,
           G_DCRATE     = v_G_Dcrate,
           G_DCAMT      = v_G_Dcamt,
           L_DCRATE     = v_L_Dcrate,
           L_DCAMT      = v_L_Dcamt,
           F_DCRATE     = v_F_Dcrate,
           F_DCAMT      = v_F_Dcamt,
           BORD_NO      = v_Bord_No,
           STAT_CD      = v_Stat_Cd,
           PROC_DAY     = v_Proc_Day,
           CANC_DAY     = v_Canc_Day,
           AGENCY_CD    = v_Agency_Cd,
           SALES_GROUP  = v_Sales_Group,
           SALES_OFFICE = v_Sales_Office,
           ENG_NM       = v_Eng_Nm,
           AG_DESC      = v_Ag_Desc,
           MAKER_CD     = v_Maker_Cd,
           MODEL_CD     = v_Model_Cd,
           CONTENTS_CD  = v_Contents_Cd,
           FR_CD        = v_Fr_Cd,
           CAR_NO       = TRIM(v_Car_No),
           CAR_OWNER    = v_Car_Owner,
           C_MILEAGE    = v_C_Mileage,
           REQ_TEXT     = v_Req_Text,
           PAY_MTHD     = v_Pay_Mthd,
           PAY_DD       = v_Pay_Dd,
           ACC_SEQ      = v_Acc_Seq,
           CRD_SEQ      = v_Crd_Seq,
           ACC_CHK      = v_Acc_Chk,
           ACC_STAT     = v_Acc_Stat,
           BKEY_CHK     = v_Bkey_Chk,
           BATCH_KEY    = v_Batch_Key,
           BILL_YN      = v_Bill_Yn,
           CRDT_STAT    = v_Crdt_Stat,
           CERT_CD      = v_Cert_Cd,
           CERT_STAT    = v_Cert_Stat,
           ORD_AGENT    = v_Ord_Agent,
           ORG_CD       = v_Org_Cd,
           ORG_HQ       = v_Org_Hq,
           ORG_L1       = v_Org_L1,
           ORG_L2       = v_Org_L2,
           ORG_L3       = v_Org_L3,
           ORG_L4       = v_Org_L4,
           INS_ORG      = v_Ins_Org,
           PS_CD        = v_Ps_Cd,
           DEPT_YN      = v_Dept_Yn,
           MFP_YN       = v_Mfp_Yn,
           TCAN_YN      = v_Tcan_Yn,
           OS_YN        = v_Os_Yn,
           OS_DAY       = v_Os_Day,
           ORD_TP       = v_Ord_Tp,
           EQU_NO       = v_Equ_No,
           REGI_AMT     = v_Regi_Amt,
           MON_AMT      = v_Mon_Amt,
           FL_YN        = v_Fl_Yn,
           FR_YN        = v_Fr_Yn,
           RL_YN        = v_Rl_Yn,
           RR_YN        = v_Rr_Yn,
           SV_SERT      = v_Sv_Sert  ,
           AG_SERT      = v_Ag_Sert  ,
           TD_YN        = v_Td_Yn    ,
           INPUT_DT     = v_Input_Dt ,
           FILE_PATH    = v_File_Path,
           FILE_NAME    = v_File_Name,
           TCGRP_NO     = v_Tcgrp_No,
           VBELN        = v_Vbeln,
           SEASON_CD    = v_Season_Cd,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE,
           INST_CD      = v_Inst_Cd,
           INST_TM      = v_Inst_Tm,
           INST1_POSCD  = v_Inst1_Poscd,
           INST1_ADDR1  = v_Inst1_Addr1,
           INST1_ADDR2  = v_Inst1_Addr2,
           INST2_POSCD  = v_Inst2_Poscd,
           INST2_ADDR1  = v_Inst2_Addr1,
           INST2_ADDR2  = v_Inst2_Addr2,
           ORD_RSN      = v_Ord_Rsn,
           USAGE        = v_Usage   
    WHERE  ORD_NO       = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0108;

  /*****************************************************************************
  -- 장착 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0108 (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0108
    SET    STAT_CD = '06', -- 06 : 계약취소
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  ORD_NO  = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0108;


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
    ) IS

    v_Season_Cd RTSD0104.SEASON_CD%TYPE DEFAULT NULL; /*시즌구분              */
    e_Error EXCEPTION;

  BEGIN

    SELECT  SEASON_CD
    INTO    v_Season_Cd
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    IF( (TRIM(v_Season_Cd) = '02') AND (TO_CHAR(Pkg_Rtcs0203.f_sRtcs0203Count(v_Ord_No, 1)) = '0') ) THEN
        v_Return_Message := '겨울용 계약건에 대한 보관정보가 등록되지 않았습니다. 보관정보 입력 후 장착처리 가능합니다.';
        RAISE e_Error;
    ELSE
        p_InsertRtsd0108Integration (v_Ord_No, v_Proc_Day,  NULL,
                                 NULL, 'N', NULL,  NULL,
                                 NULL, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
    END IF;

    EXCEPTION
        WHEN e_Error THEN
          ROLLBACK;
          v_Success_Code := -1;
          v_Return_Message := v_Return_Message;
          v_Errortext := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_Errortext);
          Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0108.p_InsertRtsd0108(1)', v_Errortext, v_Return_Message);

        WHEN OTHERS THEN
          ROLLBACK;
          v_Success_code := -1;
          v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
          v_Errortext := SUBSTR(SQLERRM, 1, 200);
          Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0108.p_InsertRtsd0108(2)', v_Errortext, v_Return_Message);

  END p_InsertRtsd0108;



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
    ) IS
  BEGIN

    p_InsertRtsd0108Integration (v_Ord_No, v_Proc_Day, v_Sv_Sert, v_Ag_Sert,
                                 v_Td_Yn, v_Input_Dt, v_File_Path, v_File_Name,
                                 v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);



  END p_InsertRtsd0108Pad;

  /*****************************************************************************
  -- 장착 정보 관리(IUD) - 통합버젼
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.0.2      2017-04-05  wjim             [20170405_02]
                                           - 장착완료 시 SMS 발송 추가
   1.0.3      2017-06-13  wjim             [20170613_01]
                                           - 장착완료 SMS 메시지 변경
   1.1        2017-09-11  wjim             [20170906_01] 장착완료 SMS 메시지 변경  
   1.3        2017-11-28  wjim             [20171128_01] 계약종료일자 기준변경
                                           - 기존 : 계약상품정보의 계약종료일자 = 장착예정일 기준 (오류로 확인)
                                           - 변경 : 장착일자 기준 
   1.4        2017-12-15  wjim             [20171215_01] 롯데카드 프로모션 안내 SMS 한시적 추가
                                           - ~2018.01.20 장착완료 분까지 발송 
   1.5        2018-03-02  wjim             [20180302_01] 선택형 서비스 도입에 따른 장착완료 SMS 메시지 변경
   1.6        2018-03-28  wjim             [20180328_01] 장착완료 시 롯데카드 프로모션 안내 SMS 한시적 추가
   1.7        2019-09-30  kstka            [20190930_01] 장착완료 시 고객 클레임 문구 수정
   1.10       2019-12-17  wjim             [2019-00359563] O2O 항목 추가
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
    ) IS

    CURSOR Cur_OrderView IS
    SELECT  A.ORD_NO,                    /*계약번호            */
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
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM, /*고객명       */
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
            A.BORD_NO,                   /*이전계약번호        */
            '04' STAT_CD,                /*상태(계약상태)      */
            NULL CANC_DAY,               /*취소일자            */
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
            DECODE(A.CUST_TP, '02', 'Y', A.BILL_YN) BILL_YN, /*세금계산서발행여부  */
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
            'N' DEPT_YN,                 /*연체여부            */
            'N' MFP_YN,                  /*중도완납여부        */
            'N' TCAN_YN,                 /*임시해약여부        */
            'N' OS_YN,                   /*소유권이전여부      */
--            B.OS_DAY,                    /*소유권이전일자(예정)*/ --[20171128_01] 변경 전
            TO_CHAR(ADD_MONTHS(TO_DATE(v_Proc_Day,'yyyymmdd'),A.PERIOD_CD)-1,'YYYYMMDD') AS OS_DAY, /*소유권이전일자(예정)*/  --[20171128_01] 변경 후
            '01' ORD_TP,                 /*계약구분2           */
            A.REGI_AMT,                  /*렌탈등록비          */
--            B.MON_AMT,                   /*월렌탈료            */
            A.SUM_MON_AMT AS MON_AMT,     /* 월렌탈료   */
            B.FL_YN,                     /*장착위-앞,왼쪽      */
            B.FR_YN,                     /*장착위치-앞,오른쪽  */
            B.RL_YN,                     /*장착위치-뒤,왼쪽    */
            B.RR_YN,                     /*장착위치-뒤,오른쪽  */
            A.CMSAG_YN ,                 /*CMS출금이체동의     */
            A.CON_MTHD ,                 /*계약서 교부방법     */
            A.PCERT_YN ,                 /*신분증 첨부 필수여부*/
            Pkg_Rtsd0109.f_sRtsd0109Demddt(1, v_Proc_Day, A.PAY_DD) FC_DAY   ,    /*최초청구일자        */
            A.AG_DAY   ,                 /*개인정보제공 동의일 */
            A.AG_SEQ   ,                 /*개인정보제공동의순번*/
            A.INPUT_DT ,                 /*PAD입력일시         */
            A.FILE_PATH,                 /*계약서 파일경로     */
            A.FILE_NAME,                 /*계약서 파일명       */
            A.TCGRP_NO,                  /*통합청구번호        */
            A.VBELN,                     /*SO번호              */
            A.SEASON_CD,
            B.MAT_CD,                    /*상품코드            */
            Pkg_Rtsd0005.f_sRtsd0005MatName(B.MAT_CD) AS MAT_NM, /*상품명*/
            C.MOB_NO,                    /*휴대폰번호          */
            C.TEL_NO,                    /*전화번호            */
            C.BLD_MNG_NO,                /*고객주소-우편번호PK(*/
            C.POS_CD,                    /*고객주소-우편번호   */
            C.ADDR1,                     /*고객주소-주소       */
            C.ADDR2,                     /*고객주소-상세주소   */
            C.TEL_NO2,                   /*전화번호            */
            C.BLD_MNG_NO2,               /*고객주소-우편번호PK(*/
            C.POS_CD2,                   /*고객주소-우편번호   */
            C.ADDR1_2,                   /*고객주소-주소       */
            C.ADDR2_2,                   /*고객주소-상세주소   */
            'N' CLOSE_YN,                /*종료여부            */
            NULL CLOSE_DAY,              /*종료일자            */
            NULL POS_X,                  /*X좌표               */
            NULL POS_Y,                   /*Y좌표               */
            A.FORD_NO,                    /*이후 계약번호       */
            A.INST_CD,                   /*장착유형코드        */ --[2019-00359563]
            A.INST_TM,                   /*장착희망시간        */ --[2019-00359563]
            A.INST1_POSCD,               /*장착주소-우편번호   */ --[2019-00359563]
            A.INST1_ADDR1,               /*장착주소-주소       */ --[2019-00359563]
            A.INST1_ADDR2,               /*장착주소-상세주소   */ --[2019-00359563]
            A.INST2_POSCD,               /*배송주소-우편번호   */ --[2019-00359563]
            A.INST2_ADDR1,               /*배송주소-주소       */ --[2019-00359563]
            A.INST2_ADDR2                /*배송주소-상세주소   */ --[2019-00359563]
    FROM    RTSD0104 A, -- 계약정보
            RTSD0106 B, -- 계약상품정보
            RTSD0100 C  -- 고객정보
    WHERE   A.ORD_NO  = v_Ord_No
    AND     A.ORD_NO  = B.ORD_NO
    AND     A.CUST_NO = C.CUST_NO
    AND     ROWNUM = 1;

    e_Error EXCEPTION;
    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부

    v_Equ_No    RTSD0108.EQU_NO%TYPE DEFAULT NULL; /*설비번호  */
    v_Call_No   RTCS0100.CALL_NO%TYPE DEFAULT NULL;/*상담번호  */
    v_Rpc_Seq   RTRE0050.RPC_SEQ%TYPE DEFAULT NULL;/*결제변경요청순번 */
    v_Usage     RTSD0108.USAGE%TYPE DEFAULT NULL;  /*SAP Usage      */

    v_Afacust_Nm  RTRE0010.CUST_NM%TYPE DEFAULT NULL;  /*변경후 고객명        */
    v_Afacust_Tp  RTRE0010.CUST_TP%TYPE DEFAULT NULL;  /*변경후 고객유형      */
    v_Afaebir_Day RTRE0010.EBIR_DAY%TYPE DEFAULT NULL; /*변경후 법정생년월일  */
    v_Afabusl_No  RTRE0010.BUSL_NO%TYPE DEFAULT NULL;  /*변경후 사업자번호    */
    v_Afbank_No   RTRE0010.BANK_CD%TYPE DEFAULT NULL;  /*변경후 은행코드      */
    v_Afacct_No   RTRE0010.ACCT_NO%TYPE DEFAULT NULL;  /*변경후 계좌번호      */

    v_Afccust_Nm   RTRE0020.CUST_NM%TYPE DEFAULT NULL;   /*변경후 카드주명       */
    v_Afccust_Tp   RTRE0020.CUST_TP%TYPE DEFAULT NULL;   /*변경후카드고객유형    */
    v_Afcebir_Day  RTRE0020.EBIR_DAY%TYPE DEFAULT NULL;  /*변경후카드법정생년월일*/
    v_Afcbusl_No   RTRE0020.BUSL_NO%TYPE DEFAULT NULL;   /*변경후카드사업자번호  */
    v_Afcardcom_No RTRE0020.CARDCOM_CD%TYPE DEFAULT NULL;/*변경후카드사코드      */
    v_Afcard_No    RTRE0020.CARD_NO%TYPE DEFAULT NULL;   /*변경후 카드번호       */
    v_Afexpire_Ym  RTRE0020.EXPIRE_YM%TYPE DEFAULT NULL; /*변경후 유효기간       */

    v_Snd_Msg       RTSD0205.SND_MSG%TYPE DEFAULT NULL;               /*SMS메시지 [20170405_02] */
    v_Cnt_B00002    RTSD0013.SERV_CNT0%TYPE DEFAULT 0;
    v_Cnt_B00003    RTSD0013.SERV_CNT0%TYPE DEFAULT 0;
    v_Cnt_B00007    RTSD0013.SERV_CNT0%TYPE DEFAULT 0;
    v_Cnt_B00001    RTSD0013.SERV_CNT0%TYPE DEFAULT 0;
    v_Cnt_B00008    RTSD0013.SERV_CNT0%TYPE DEFAULT 0;

  BEGIN

    -- 필수값:계약번호, 장착일자,  등록자 ID
    IF 0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No) THEN
        v_Return_Message := '해당 오더번호(' || v_Ord_No ||')로 등록된 계약정보가 없으므로 처리가 불가합니다!.';
        RAISE e_Error;
    END IF;

    IF 0 != ISDATE(v_Proc_Day) THEN
        v_Return_Message := '장착일자('||v_Proc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    FOR CUR IN Cur_OrderView LOOP
        IF Cur_OrderView%NOTFOUND OR Cur_OrderView%ROWCOUNT != 1 THEN
            EXIT;
        END IF;
        v_exist := TRUE;
DBMS_OUTPUT.PUT_LINE('1');
        -- 5) 설비마스터 생성
        Pkg_Rtcs0001.p_IUDRtcs0001('I',            v_Equ_No,       CUR.Ord_No,     v_Proc_Day,
                                   CUR.Mat_Cd,     CUR.Mob_No,     CUR.Tel_No,     CUR.Bld_Mng_No,
                                   CUR.Pos_Cd,     CUR.Addr1,      CUR.Addr2,      CUR.Tel_No2,
                                   CUR.Bld_Mng_No2,CUR.Pos_Cd2,    CUR.Addr1_2,    CUR.Addr2_2,
                                   CUR.Car_No,     CUR.Car_Owner,  CUR.Close_Yn,   CUR.Close_Day,
                                   CUR.Fl_Yn,      CUR.Fr_Yn,      CUR.Rl_Yn,      CUR.Rr_Yn,
                                   CUR.Pos_X,      CUR.Pos_Y,      v_Reg_Id,       v_Success_Code,
                                   v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '설비마스터(RTCS0001) - 계약번호 기준 청구스케쥴 생성 실패!!!'||'-'||v_Return_Message;
            RAISE e_Error;
        END IF;
DBMS_OUTPUT.PUT_LINE('2');
        -- 장착유형에 따른 Usage 결정 [2019-00359563]
        IF CUR.INST_CD = '1010' THEN
            v_Usage := '06';
        ELSIF CUR.INST_CD = '1020' THEN
            v_Usage := '05';
        ELSE
            v_Usage := NULL;
        END IF;

        -- 1) 계약마스터(설치정보) 생성
        IF 0 != f_InsertRtsd0108(CUR.Ord_No,       CUR.Ord_Day,     CUR.Ord_Id,    CUR.Chan_Cd,
                                 CUR.Sale_Id,      CUR.Period_Cd,   CUR.Cnt_Cd,    CUR.Regi_Cd,
                                 CUR.Camp_Yn,      CUR.C_Dcrate,    CUR.C_Dcamt,   CUR.Cust_No,
                                 CUR.Cust_Tp,      CUR.Safekey,     CUR.Grp_Yn,    CUR.Grp_No,
                                 CUR.G_Dcrate,     CUR.G_Dcamt,     CUR.L_Dcrate,  CUR.L_Dcamt,
                                 CUR.F_Dcrate,     CUR.F_Dcamt,     CUR.Bord_No,   CUR.Stat_Cd,
                                 v_Proc_Day,       CUR.Canc_Day,    CUR.Agency_Cd, CUR.Sales_Group,
                                 CUR.Sales_Office, CUR.Eng_Nm,      CUR.Ag_Desc,   CUR.Maker_Cd,
                                 CUR.Model_Cd,     CUR.Contents_Cd, CUR.Fr_Cd,     CUR.Car_No,
                                 CUR.Car_Owner,    CUR.C_Mileage,   CUR.Req_Text,  CUR.Pay_Mthd,
                                 CUR.Pay_Dd,       CUR.Acc_Seq,     CUR.Crd_Seq,   CUR.Acc_Chk,
                                 CUR.Acc_Stat,     CUR.Bkey_Chk,    CUR.Batch_Key, CUR.Bill_Yn,
                                 CUR.Crdt_Stat,    CUR.Cert_Cd,     CUR.Cert_Stat, CUR.Ord_Agent,
                                 CUR.Org_Cd,       CUR.Org_Hq,      CUR.Org_L1,    CUR.Org_L2,
                                 CUR.Org_L3,       CUR.Org_L4,      CUR.Ins_Org,   CUR.Ps_Cd,
                                 CUR.Dept_Yn,      CUR.Mfp_Yn,      CUR.Tcan_Yn,   CUR.Os_Yn,
                                 CUR.Os_Day,       CUR.Ord_Tp,      v_Equ_No,      CUR.Regi_Amt,
                                 CUR.Mon_Amt,      CUR.Fl_Yn,       CUR.Fr_Yn,     CUR.Rl_Yn,
                                 CUR.Rr_Yn,        v_Sv_Sert,       v_Ag_Sert,     v_Td_Yn,
                                 v_Input_Dt,       v_File_Path,     v_File_Name,   CUR.Tcgrp_No,
                                 CUR.Vbeln,        CUR.Season_Cd,   CUR.Ford_No,   v_Reg_Id,
                                 CUR.INST_CD,      CUR.INST_TM,     
                                 CUR.INST1_POSCD,  CUR.INST1_ADDR1, CUR.INST1_ADDR2,
                                 CUR.INST2_POSCD,  CUR.INST2_ADDR1, CUR.INST2_ADDR2,
                                 NULL,             v_Usage,  
                                 v_ErrorText) THEN
            v_Return_Message := '장착 정보(RTSD0108) 생성  실패!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
DBMS_OUTPUT.PUT_LINE('3');
        --1-1) 계약 정보 Update - 장착에 따른 상태 변경
        IF 0 != Pkg_Rtsd0104.f_UpdateRtsd0104PrcStat(CUR.Ord_No, CUR.Stat_Cd, v_Proc_Day, v_Reg_Id, CUR.FC_DAY, v_ErrorText) THEN
            v_Return_Message := '계약 정보(RTSD0104) Update - 장착에 따른 상태 변경 실패!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
DBMS_OUTPUT.PUT_LINE('4');
        -- 1-2) 계약상품정보 업데이트 - - 장착에 따른 상태 변경 (순번은 우선1로 정의 - 현재는 하나의 상품만 존재.)
        IF 0 != Pkg_Rtsd0106.f_UpdateRtsd0106PrcStat(CUR.Ord_No, CUR.Stat_Cd, v_Proc_Day, 1, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계약 상품 정보(RTSD0106) Update - 장착에 따른 상태 변경 실패!!!'||'-'||v_ErrorText;
            RAISE e_Error;
        END IF;
DBMS_OUTPUT.PUT_LINE('5');
        -- 2) 대리점 반품오더 생성(I/F)


        -- 3-1) 결제방법(A:계좌, C: 카드)에 따른 부가정보 획득
        IF CUR.PAY_MTHD = 'A' THEN

            SELECT  CUST_NM,  /*변경후 고객명        */
                    CUST_TP,  /*변경후 고객유형      */
                    EBIR_DAY, /*변경후 법정생년월일  */
                    BUSL_NO,  /*변경후 사업자번호    */
                    BANK_CD,  /*변경후 은행코드      */
                    ACCT_NO   /*변경후 계좌번호      */
            INTO    v_Afacust_Nm, v_Afacust_Tp, v_Afaebir_Day, v_Afabusl_No, v_Afbank_No, v_Afacct_No
            FROM    RTRE0010               /*고객 계좌 정보 */
            WHERE   ACC_SEQ = CUR.Acc_Seq; /*계좌순번       */


        ELSIF CUR.PAY_MTHD = 'C' THEN

            SELECT  CUST_NM,   /*변경후 카드주명       */
                    CUST_TP,   /*변경후카드고객유형    */
                    EBIR_DAY,  /*변경후카드법정생년월일*/
                    BUSL_NO,   /*변경후카드사업자번호  */
                    CARDCOM_CD,/*변경후카드사코드      */
                    CARD_NO,   /*변경후 카드번호       */
                    EXPIRE_YM  /*변경후 유효기간       */
            INTO    v_Afccust_Nm, v_Afccust_Tp, v_Afcebir_Day, v_Afcbusl_No, v_Afcardcom_No, v_Afcard_No, v_Afexpire_Ym
            FROM    RTRE0020               /*고객 카드 정보 */
            WHERE   CRD_SEQ = CUR.Crd_Seq; /*카드순번       */
        
        ELSIF CUR.PAY_MTHD = 'Z' THEN
            v_Afccust_Nm := '';
        ELSE
            v_Return_Message := ' 결제방법(A:계좌, C: 카드)('||CUR.PAY_MTHD||') 값 오류로 계좌 신청정보 생성 실패!!!';
            RAISE e_Error;
        END IF;
DBMS_OUTPUT.PUT_LINE('6');

    
        -- 3-2) 계좌 신청정보 생성
        IF CUR.PAY_MTHD = 'C' OR CUR.PAY_MTHD = 'A' THEN
            Pkg_Rtre0050.p_IUDRtre0050('I', CUR.Ord_No, v_Proc_Day, CUR.ORD_AGENT,
                                       '01', '장착확정', NULL, NULL,
                                       NULL, NULL, NULL, NULL,
                                       NULL, NULL, NULL, NULL,
                                       NULL, NULL, NULL, NULL,
                                       NULL, NULL, NULL, NULL,
                                       NULL, NULL, NULL, NULL,
                                       NULL, NULL, CUR.Cust_No, CUR.TCGRP_NO,
                                       CUR.PAY_MTHD, CUR.PAY_DD, CUR.ACC_SEQ, v_Afacust_Nm,
                                       v_Afacust_Tp, v_Afaebir_Day, v_Afabusl_No, v_Afbank_No,
                                       v_Afacct_No, CUR.ACC_CHK, CUR.CRD_SEQ, CUR.BATCH_KEY,
                                       v_Afccust_Nm, v_Afccust_Tp, v_Afcebir_Day, v_Afcbusl_No,
                                       v_Afcardcom_No, v_Afcard_No, v_Afexpire_Ym, CUR.BKEY_CHK,
                                       v_Reg_Id, v_Rpc_Seq, v_Success_Code, v_Return_Message, v_ErrorText
                                       );
            IF 0 != v_Success_Code THEN
                v_Return_Message := '계좌 신청정보(RTRE0050) 생성 실패!!!'||'-'||v_Return_Message;
                RAISE e_Error;
            END IF;
            
        END IF;
DBMS_OUTPUT.PUT_LINE('7');

        -- 4) 청구스케줄 생성 - 계약번호 기준 청구스케쥴 생성
        Pkg_Rtsd0109.p_InsertRtsd0109ScheduleReal(CUR.Ord_No, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '청구스케줄(RTSD0109) 생성 - 계약번호 기준 청구스케쥴 생성 실패!!!'||'-'||v_Return_Message;
            RAISE e_Error;
        END IF;
DBMS_OUTPUT.PUT_LINE('8');
        -- 6-1) 해피콜 대상 생성
        Pkg_Rtcs0100.p_IUDRtcs0100('I', v_Call_No, 'H1', TO_CHAR(SYSDATE,'YYYYMMDD'),
                                   NULL, 'I', NULL, NULL,
                                   'N', '0', CUR.Ord_No, v_Proc_Day, CUR.AGENCY_CD,
                                   CUR.Mat_Cd, CUR.Mat_Nm, CUR.Cust_No, CUR.Cust_Nm,
                                   CUR.Mob_No, CUR.Tel_No, CUR.Car_No, CUR.Sales_Office,
                                   -- 2015.10.07 서비스 순번, 서비스 처리자 추가
                                   CUR.Sales_Group, NULL, NULL, NULL,
                                   v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

        IF 0 != v_Success_Code THEN
            v_Return_Message := '해피콜 대상(RTCS0100) 생성 - 계약번호 기준 해피콜 대상 생성 실패!!!'||'-'||v_Return_Message;
            RAISE e_Error;
        END IF;

DBMS_OUTPUT.PUT_LINE('9');
        -- 6-2) 해피콜 질의 답변 생성
        Pkg_Rtcs0101.p_IUDRtcs0101 ('I', v_Call_No,
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 1),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 2),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 3),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 4),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 5),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 6),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 7),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 8),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 9),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'O', 10),
                                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
                                    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'S', 1),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'S', 2),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'S', 3),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'S', 4),
                                    Pkg_Rtcs0111.f_sRtcs0111QuestionNo('H1', 'S', 5),
                                    NULL, NULL, NULL, NULL, NULL, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '해피콜 질의 답변(RTCS0101) 생성 - 계약번호 기준 해피콜 대상 생성 실패!!!'||'-'||v_Return_Message;
            RAISE e_Error;
        END IF;
 DBMS_OUTPUT.PUT_LINE('10');       
        -- 7) SMS발송 [20170405_02]
        -- - 대리점, 온라인, 방판, 오픈몰 계약의 경우에만 발송
        IF CUR.Chan_Cd IN ('01','02','03','04') THEN
        
            BEGIN 
            
                -- 서비스 횟수 확인
                SELECT  SUM(DECODE(PRS_DCD,'B00002',SERV_CNT0,0)) AS CNT_B00002 --위치교환
                     ,  SUM(DECODE(PRS_DCD,'B00003',SERV_CNT0,0)) AS CNT_B00003 --방문점검
                     ,  SUM(DECODE(PRS_DCD,'B00007',SERV_CNT0,0)) AS CNT_B00007 --걱정제로(타이어 무상제공)
                     ,  SUM(DECODE(PRS_DCD,'B00001',SERV_CNT0,0)) AS CNT_B00001 --엔진오일   [20180302_01]
                     ,  SUM(DECODE(PRS_DCD,'B00008',SERV_CNT0,0)) AS CNT_B00008 --얼라인먼트 [20180302_01]
                  INTO  v_Cnt_B00002
                     ,  v_Cnt_B00003
                     ,  v_Cnt_B00007
                     ,  v_Cnt_B00001
                     ,  v_Cnt_B00008
                  FROM  RTSD0013
                 WHERE  ORD_NO = CUR.Ord_No
                 GROUP  BY ORD_NO
                     ,  PS_CD   
                ;
                
                v_Snd_Msg := '';
                v_Snd_Msg := '[넥센타이어] '||CUR.CUST_NM||' 고객님 타이어렌탈서비스[NEXT LEVEL] 가입을 진심으로 감사드립니다. 고객님은 계약 기간동안 넥스트레벨만의 특별한 혜택을 제공받으실 수 있습니다.';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10); 
                v_Snd_Msg := v_Snd_Msg||'◆ 부가서비스는 계약서 또는 홈페이지에서 확인할 수 있습니다.';
                /*
                v_Snd_Msg := v_Snd_Msg||'◆ 부가 서비스 혜택(';
                
                -- 걱정제로
                IF v_Cnt_B00007 > 0 THEN
                    v_Snd_Msg := v_Snd_Msg||'타이어 무상교체 서비스 '||v_Cnt_B00007||'본, ';
                END IF;
                
                -- 엔진오일 [20180302_01]
                IF v_Cnt_B00001 > 0 THEN
                    v_Snd_Msg := v_Snd_Msg||'엔진오일 무상교체 서비스 '||v_Cnt_B00001||'회, ';
                END IF;
                
                -- 방문점검
                IF v_Cnt_B00003 > 0 THEN
                    v_Snd_Msg := v_Snd_Msg||'방문점검 서비스 3~6회, ';  --정책 변경이 가능하여 실제 방문점검 횟수와 관계없이 3~6회로 표기요청 by 박정석
                END IF;
                
                v_Snd_Msg := v_Snd_Msg||'무상점검 서비스, ';
                
                -- 위치교환
                IF v_Cnt_B00002 > 0 THEN
                    v_Snd_Msg := v_Snd_Msg||'위치교환 서비스 '||v_Cnt_B00002||'회, ';
                END IF;
                
                -- 얼라인먼트 서비스 [20180302_01]
                IF v_Cnt_B00008 > 0 THEN
                    v_Snd_Msg := v_Snd_Msg||'얼라인먼트 서비스 '||v_Cnt_B00008||'회';
                END IF;
                
                v_Snd_Msg := v_Snd_Msg||')';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'◆ 넥스트레벨 모바일 앱 : 안드로이드(플레이 스토어), 아이폰(앱마켓)에서 넥센타이어 넥스트레벨을 검색하시면 설치하실 수 있습니다.';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                */
                
                /* -- [20170906_01] 변경 전
    --            v_Snd_Msg := v_Snd_Msg||'◆ 제휴카드 할인 혜택 보기';
    --            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
    --            v_Snd_Msg := v_Snd_Msg||'(결재 금액에 따라 렌탈료 1만 ~ 최대 2만원까지 할인)';
    --            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
    --            v_Snd_Msg := v_Snd_Msg||'http://www.tirerental.co.kr/view/util/assCard.do?cardSp=K';
    --            v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                */
                v_Snd_Msg := v_Snd_Msg||'◆ 넥스트레벨 홈페이지 : Https://www.tirerental.co.kr';  -- [20170906_01] 변경 후
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'◆ 타이어 무상교체 서비스를 선택하신 고객께서는 등록비와 첫 렌탈료 결제 이후 신청가능합니다.';  -- [20180323] 변경 후 [20190930_01] [20210303_01] [20220510_01] kstka 문구 변경 요청
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'넥스트레벨과 함께 안전하고 즐거운 드라이빙 되세요';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'감사합니다.';

                -- 장착완료 SMS 발송
                -- - 서비스정책 변경으로 한시적으로 발송정지 (2018.03.02 10:00~11:50)            
                Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'I'                                   /*예약 전송여부    */
                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                    , CUR.MOB_NO                            /*받는 전화번호    */
                    , '18550100'                            /*보내는 전화번호  */
                    , v_Snd_Msg                             /*메시지내용       */
                    , 'S012'                                /*사용자지정 필드1 */
                    , CUR.Ord_No                            /*사용자지정 필드2 */
                    ,'2'
                    ,'RENTAL00000000000011'
                    , v_Reg_Id                              /*등록자 ID        */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
                
                IF v_Success_Code != 0 THEN
                    v_Return_Message := '장착완료 SMS발송 등록 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
            
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN 
                NULL; 
            END;



            
            -- 롯데카드 프로모션 안내 SMS 발송 [20171215_01]
            -- - 2018.01.20 장착분까지 한시적 적용
--            IF v_Proc_Day <= '20180120' AND TO_CHAR(SYSDATE, 'YYYYMMDD') <= '20180120' THEN
--                v_Snd_Msg := '[넥센타이어] 신개념 타이어 렌탈 서비스 넥스트레벨 가입을 진심으로 감사드립니다.';
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'넥센타이어 롯데 제휴카드 프로모션 안내 드립니다.';
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'[프로모션 내용] 프로모션 기간내 롯데카드 발급 후 넥센타이어 렌탈료 자동이체 연결시 30만원 구간 추가 2천원 할인';
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'30만원 이상 사용시 월 렌탈료가 13,000원 할인됩니다.';
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'자세한 사항은 넥스트레벨 홈페이지 공지사항을 참조해주세요.';
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'[프로모션 기간] 2017년 12월 1일 ~ 2018년 1월 30일까지 넥센타이어 롯데 제휴카드 발급 후 자동이체 연결 고객 전원';
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'※ 계약 기간 종료시까지 해당 할인혜택 지속 적용됩니다.';
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'▶ 롯데카드 신청 : 1522-2800';
--                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
--                v_Snd_Msg := v_Snd_Msg||'▶ 렌탈료 자동 이체 : 1855-0100';
--                
--                Pkg_Rtsd0205.p_Rtsd0205Interface (
--                      'I'                                   /*예약 전송여부    */
--                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
--                    , CUR.MOB_NO                            /*받는 전화번호    */
--                    , '18550100'                            /*보내는 전화번호  */
--                    , v_Snd_Msg                             /*메시지내용       */
--                    , 'S033'                                /*사용자지정 필드1 */
--                    , CUR.Ord_No                            /*사용자지정 필드2 */
--                    , v_Reg_Id                              /*등록자 ID        */
--                    , v_Success_Code
--                    , v_Return_Message
--                    , v_ErrorText
--                );
--                
--                IF v_Success_Code != 0 THEN
--                    v_Return_Message := '롯데카드 프로모션 SMS발송 등록 실패!!!'||'-'||v_ErrorText;
--                    v_ErrorText := v_ErrorText;
--                    RAISE e_Error;
--                END IF;
--            END IF;
            
            -- 롯데카드 프로모션 안내 SMS 발송 [20180328_01]
            -- - 2018-04-01~2018.04.26 장착분까지 한시적 적용
            IF (v_Proc_Day >= '20180401' AND TO_CHAR(SYSDATE, 'YYYYMMDD') >= '20180401') AND (v_Proc_Day <= '20180426' AND TO_CHAR(SYSDATE, 'YYYYMMDD') <= '20180426') THEN
                v_Snd_Msg := '[넥센타이어] 안녕하세요. 넥스트레벨 고객분들을 위한 제휴카드 프로모션 안내드립니다.';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'대상 : 프리미엄 렌탈 DC 넥센타이어 롯데카드 발급 고객(2018년 4월 1일 ~ 4월 30일까지)';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'[혜택1] 렌탈료 자동 이체시 1일~말일까지 30만원 이상 사용시 타이어 렌탈료 13,000원 청구 할인';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'[혜택2] 프로모션 기간내 롯데 제휴카드 발급시 5월(1만원), 6월(1만원), 7월(1만원), 총 3만원 모바일 롯데상품권카드 교환권 증정';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10)||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'자세한 내용은 홈페이지(http://www.tirerental.co.kr)의 공지사항을 참조해주세요.';
                v_Snd_Msg := v_Snd_Msg||CHR(13)||CHR(10);
                v_Snd_Msg := v_Snd_Msg||'감사합니다.';
                
                Pkg_Rtsd0205.p_Rtsd0205Interface (
                      'I'                                   /*예약 전송여부    */
                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                    , CUR.MOB_NO                            /*받는 전화번호    */
                    , '18550100'                            /*보내는 전화번호  */
                    , v_Snd_Msg                             /*메시지내용       */
                    , 'S035'                                /*사용자지정 필드1 */
                    , CUR.Ord_No                            /*사용자지정 필드2 */
                    , v_Reg_Id                              /*등록자 ID        */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
                
                IF v_Success_Code != 0 THEN
                    v_Return_Message := '롯데카드 프로모션 SMS발송 등록 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
            END IF;
            
            --[20210205_01] kstka 마모파손보증 SMS발송
            PKG_RTCS0207.p_warrantySendSms(v_Ord_No, v_Reg_Id, v_Success_Code, v_Return_Message, v_Errortext);
            IF 0 != v_Success_Code THEN
                v_Return_Message := '마모파손보증 SMS 발송을 실패하였습니다.!!!'||'-'||v_Return_Message;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        
        END IF;
        
        


    END LOOP;

    IF v_exist = FALSE THEN
      v_Return_Message := '해당 오더번호(' || v_Ord_No ||')로 등록된 계약정보를 획득할 수 없어 처리가 불가합니다!.';
      RAISE e_Error;
    END IF;

    IF Cur_OrderView%ISOPEN THEN
        CLOSE Cur_OrderView;
    END IF;

    IF v_Success_code = 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 등록되었습니다';
        v_ErrorText := '';
    END IF;
        
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0108.p_InsertRtsd0108(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0108.p_InsertRtsd0108(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtsd0108Integration;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
       B.USER_ID,
       B.RENTAL_GROUP,
       B.RENTAL_OFFICE,
       Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
       Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A.ORD_NO,                    /*계약번호            */
            A.STAT_CD,                   /*상태(계약상태)      */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S032', A.STAT_CD) STAT_NM,     /*계약상태     */
            A.PROC_DAY,                  /*장착일자            */
            Pkg_Rtsd0005.f_sRtsd0005MatName(Pkg_Rtsd0106.f_sRtsd0106MatCd(A.ORD_NO)) AS MAT_NM, /*상품명*/
            A.CNT_CD,                    /*타이어본수          */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', A.CNT_CD) CNT_NM,       /*타이어본수   */
            A.PERIOD_CD,                 /*기간코드            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', A.PERIOD_CD) PERIOD_NM, /*기간         */
            A.REGI_AMT,                  /*렌탈등록비          */
            A.MON_AMT,                   /*월렌탈료            */
            A.CUST_NO,                   /*고객번호            */
            Pkg_Rtsd0100.f_sRtsd0100CustName(A.CUST_NO) CUST_NM,             /*고객명       */
            A.MODEL_CD,                  /*차종                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) MODEL_NM,   /*차종         */
            A.CAR_NO,                   /*차량번호            */
            A.AGENCY_CD
            
            /***********************************부가정보*************************************/
--            A.ORD_DAY,                   /*접수일자            */
--            A.ORD_ID,                    /*주문구분            */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S029', A.ORD_ID) ORD_NM,       /*주문구분     */
--            A.CHAN_CD,                   /*채널구분            */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S030', A.CHAN_CD) CHAN_NM,     /*채널구분     */
--            A.SALE_ID,                   /*계약유형            */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S031', A.SALE_ID) SALE_NM,     /*계약유형     */
--            A.REGI_CD,                   /*등록비코드          */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S023', A.REGI_CD) REGI_NM,     /*등록비       */
--            A.CAMP_YN,                   /*캠페인적용여부      */
--            A.C_DCRATE,                  /*캠페인할인율        */
--            A.C_DCAMT,                   /*캠페인할인금액      */
--            A.CUST_TP,                   /*고객유형            */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S024', A.CUST_TP) CUST_TP_NM,  /*고객유형     */
--            A.SAFEKEY,                   /*인증번호            */
--            A.GRP_YN,                    /*고객결합여부        */
--            A.GRP_NO,                    /*고객결합번호        */
--            A.G_DCRATE,                  /*결합할인율          */
--            A.G_DCAMT,                   /*결합할인액          */
--            A.L_DCRATE,                  /*제한할인율          */
--            A.L_DCAMT,                   /*제한할인액          */
--            A.F_DCRATE,                  /*최종할인율          */
--            A.F_DCAMT,                   /*최종할인액          */
--            A.BORD_NO,                   /*이전계약번호        */
--            A.CANC_DAY,                  /*취소일자            */
--            A.AGENCY_CD,                 /*장착 대리점         */
--            A.SALES_GROUP,               /*지사                */
--            A.SALES_OFFICE,              /*지점                */
--            A.ENG_NM,                    /*장착기사            */
--            A.AG_DESC,                   /*특이사항(장착점)    */
--            A.MAKER_CD,                  /*카메이커            */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001', A.MAKER_CD) MAKER_NM,      /*카메이커     */
--            A.CONTENTS_CD,               /*사양                */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) CONTENTS_NM,/*사양         */
--            A.FR_CD,                     /*전후 구분           */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S004', A.FR_CD) FR_NM,            /*전후 구분    */
--            A.CAR_OWNER,                 /*차량소유자          */
--            A.C_MILEAGE,                 /*현재주행거리        */
--            A.REQ_TEXT,                  /*비고(기타정보)      */
--            A.PAY_MTHD,                  /*결제구분            */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('R004', A.PAY_MTHD) PAY_MTHD_NM,   /*결제구분     */
--            A.PAY_DD,                    /*이체일              */
--            A.ACC_SEQ,                   /*계좌순번            */
--            A.CRD_SEQ,                   /*카드순번            */
--            A.ACC_CHK,                   /*계좌확인상태        */
--            A.ACC_STAT,                  /*계좌신청상태        */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('R008', A.ACC_STAT) ACC_STAT_NM,   /*계좌신청상태 */
--            A.BKEY_CHK,                  /*배치키생성여부(카드)*/
--            A.BATCH_KEY,                 /*BATCH KEY           */
--            A.BILL_YN,                   /*세금계산서발행여부  */
--            A.CRDT_STAT,                 /*신용조회상태        */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S033', A.CRDT_STAT) CRDT_STAT_NM, /*신용조회상태 */
--            A.CERT_CD,                   /*본인인증방법        */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S034', A.CERT_CD) CERT_NM,        /*본인인증방법 */
--            A.CERT_STAT,                 /*본인인증상태        */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S035', A.CERT_STAT) CERT_STAT_NM, /*본인인증상태 */
--            A.ORD_AGENT,                 /*판매인번호          */
--            A.ORG_CD,                    /*판매조직            */
--            A.ORG_HQ,                    /*판매본부            */
--            A.ORG_L1,                    /*판매조직-1LV        */
--            A.ORG_L2,                    /*판매조직-2LV        */
--            A.ORG_L3,                    /*판매조직-3LV        */
--            A.ORG_L4,                    /*판매조직-4LV        */
--            A.INS_ORG,                   /*입력조직            */
--            A.PS_CD,                     /*프리미엄서비스코드  */
--            A.DEPT_YN,                   /*연체여부            */
--            A.MFP_YN,                    /*중도완납여부        */
--            A.TCAN_YN,                   /*임시해약여부        */
--            A.OS_YN,                     /*소유권이전여부      */
--            A.OS_DAY,                    /*종료일자(소유권이전)*/
--            A.ORD_TP,                    /*계약구분2           */
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S037', A.ORD_TP) ORD_TP_NM,       /*계약구분2   */
--            A.EQU_NO,                    /*설비번호            */
--            A.FL_YN,                     /*장착위-앞,왼쪽      */
--            A.FR_YN,                     /*장착위치-앞,오른쪽  */
--            A.RL_YN,                     /*장착위치-뒤,왼쪽    */
--            A.RR_YN,                     /*장착위치-뒤,오른쪽  */
--            A.SV_SERT  ,                 /*서비스만족도          */
--            A.AG_SERT  ,                 /*대리점만족도          */
--            A.TD_YN    ,                 /*기존타이어폐기위탁동의*/
--            A.INPUT_DT ,                 /*PAD입력일시           */
--            A.FILE_PATH,                 /*장착확인서 파일경로   */
--            A.FILE_NAME,                 /*장착확인서 파일명     */
--            A.REG_ID,                    /*등록자 ID           */
--            A.REG_DT,                    /*등록일              */
--            A.CHG_ID,                    /*변경자 ID           */
--            A.CHG_DT                     /*변경일              */
    FROM    RTSD0108 A
    WHERE   A.PROC_DAY      BETWEEN v_Proc_Fday AND v_Proc_Tday                             /*장착일자FROM~TO       */
    AND     A.SALES_OFFICE  = DECODE(v_Sales_Office, NULL, A.SALES_OFFICE, v_Sales_Office)  /*지점                  */
    AND     A.SALES_GROUP   = DECODE(v_Sales_Group , NULL, A.SALES_GROUP , v_Sales_Group)   /*지사                  */
    AND     A.AGENCY_CD     = DECODE(v_Agency_Cd   , NULL, A.AGENCY_CD   , v_Agency_Cd)     /*장착 대리점           */
    AND     A.ORD_NO        = DECODE(v_Ord_No      , NULL, A.ORD_NO      , v_Ord_No)        /*계약번호              */
    AND     A.CUST_NO       = DECODE(v_Cust_No     , NULL, A.CUST_NO     , v_Cust_No)       /*고객번호              */
    AND     A.ORD_DAY       BETWEEN NVL(v_Ord_Fday,A.ORD_DAY) AND NVL(v_Ord_Tday,A.ORD_DAY) /*접수일자FROM~TO       */
    AND     A.STAT_CD       = DECODE(v_Stat_Cd     , NULL, A.STAT_CD     , v_Stat_Cd)      /*상태                  */
        ) A
            LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
 ) A
    WHERE 1=1
      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1

    ;
            
  END p_sRtsd0108Status;

  /*****************************************************************************
  -- 장착 정보 - 계약번호로 고객번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108CustNo(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*계약번호            */
    ) RETURN VARCHAR IS
    v_Cust_No   RTSD0108.CUST_NO%TYPE DEFAULT NULL;   /*고객번호              */
  BEGIN

    SELECT  CUST_NO
    INTO    v_Cust_No
    FROM    RTSD0108
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Cust_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0108CustNo;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0108
    SET    PAY_MTHD   = v_Pay_Mthd,
           PAY_DD     = v_Pay_Dd,
           ACC_SEQ    = v_Acc_Seq,
           CRD_SEQ    = v_Crd_Seq,
           ACC_CHK    = v_Acc_Chk,
           ACC_STAT   = v_Acc_Stat,
           BKEY_CHK   = v_Bkey_Chk,
           BATCH_KEY  = v_Batch_Key,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  ORD_NO     = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0108RpcInfoChange;



  /*****************************************************************************
  -- 장착 정보 Count -  결제저보변경(Pkg_Rtre0050) - 장착정보의 데이터와 비교해서 다르면 에러 처리용
  *****************************************************************************/
  FUNCTION f_sRtsd0108CheckCount(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Tcgrp_No       IN RTSD0108.TCGRP_NO%TYPE        /*통합청구번호          */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0108
    WHERE   ORD_NO    = v_Ord_No
    AND     CUST_NO   = v_Cust_No
    AND     NVL(TCGRP_NO, ' ')  = NVL( v_Tcgrp_No, ' ');

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0108CheckCount;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0108
    SET    SV_SERT   = v_Sv_Sert  ,
           AG_SERT   = v_Ag_Sert  ,
           TD_YN     = v_Td_Yn    ,
           INPUT_DT  = v_Input_Dt ,
           FILE_PATH = v_File_Path,
           FILE_NAME = v_File_Name,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ORD_NO    = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0108PadSign;

  /*****************************************************************************
  -- 장착 정보 Update - 계좌신청상태 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108AccStat (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Acc_Stat       IN RTSD0108.ACC_STAT%TYPE,       /*계좌신청상태          */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0108
    SET    ACC_STAT  = v_Acc_Stat,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ORD_NO    = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0108AccStat;


  /*****************************************************************************
  -- 장착 정보 - 계약번호로 설비번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108EquNo(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR IS
    v_Equ_No RTSD0108.EQU_NO%TYPE DEFAULT NULL;       /*설비번호              */
  BEGIN

    SELECT  EQU_NO
    INTO    v_Equ_No
    FROM    RTSD0108
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Equ_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0108EquNo;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0108
    SET    CANC_DAY = v_Canc_Day,
           MFP_YN   = v_Mfp_Yn,
           END_TP   = v_End_Tp,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ORD_NO   = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0108Cancel;


  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 상태 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108StatCd(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR IS
    v_Stat_Cd RTSD0108.STAT_CD%TYPE DEFAULT NULL;       /*상태                */
  BEGIN

    SELECT  STAT_CD
    INTO    v_Stat_Cd
    FROM    RTSD0108
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Stat_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0108StatCd;


  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 상태 획득
  *****************************************************************************/
  FUNCTION f_SelectRtsd0108SaleCdCount(
    v_Car_No        IN RTSD0104.CAR_NO%TYPE          /*고객번호              */
    ) RETURN NUMBER IS
    v_cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_cnt
    FROM    RTSD0108
    WHERE   CAR_NO   = v_Car_No
    AND     STAT_CD != '06'
    AND     ( OS_YN  = 'N' AND OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD') )
    AND     MFP_YN   = 'N';

    RETURN v_cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_SelectRtsd0108SaleCdCount;

  /*****************************************************************************
  -- 수수료 기초내역조회 Select

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.X        2016-07-12  이영근           대리점코드/채널대분류/채널중분류 추가
   1.2        2017-11-07  wjim             [20171107_01] 대리점실적조회 중복조회 보완
                                           - 설비정보 2건 이상발생 고려 (ex.O17000121561)
   1.7        2019-02-28  wjim             [20190228_01] 서비스횟수 추가
   1.8        2019-03-07  wjim             [20190301_01] 콜센터 사용자그룹에 전체 조회권한 부여
  *****************************************************************************/
  PROCEDURE p_sRtsd0108AgencyResult (
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
    v_LOGIN_GRP      IN VARCHAR2                     /* 로그인 그룹 */
    --v_Chan_Cd        IN RTSD0108.CHAN_CD%TYPE,        /*채널구분              */
    --v_Chan_Cd_Rest   IN RTSD0108.CHAN_CD%TYPE         /*채널구분 01:대리점 외 */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)            AS AGENCY_NM       , /*장착 대리점       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018', A.SALES_GROUP)  AS SALES_GROUP_NM  , /*지사              */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019', A.SALES_OFFICE) AS SALES_OFFICE_NM , /*지점              */
            A.ORD_NO                                                                    , /*계약번호          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S013', C.PG_CD)        AS PG_NM           , /*Pricing Group Code*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S012', C.PETTERN_CD)   AS PETTERN_NM      , /*패턴코드          */
            C.SECTION_WIDTH                                                             , /*단면폭            */
            C.ASPECT_RATIO                                                              , /*편평비            */
            C.WHEEL_INCHES                                                              , /*인치              */
            C.PLY_RATING                                                                , /*PR(강도)          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022', A.CNT_CD)       AS CNT_NM          , /*타이어본수        */
            A.PROC_DAY                                                                  , /*장착일자          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)    AS PERIOD_NM       , /*계약기간          */
            D.CUST_NM                                                                   , /*고객명            */
            --Pkg_Rtcm0051.f_sRtcm0051Codename('S023', A.REGI_CD)      AS REGI_NM         , /*등록비코드        */
            A.REGI_AMT AS REGI_NM,
            A.MON_AMT                                                                   , /*월렌탈료          */
            E.ORG_AGNM                                               AS ORG_AGNM        , /*판매인명          */
            A.SEASON_CD                                                                 , /*계절구분코드      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)    AS SEASON_NM       , /*계절구분          */
            B.MAT_CD                                                                    , /*상품코드          */
            A.ORD_AGENT,                                                                  /*판매인코드        */
            A.AGENCY_CD,
            DECODE(A.CHAN_CD,'03',E.CHAN_LCLS_CD,G.CHAN_LCLS_CD) AS CHAN_LCLS_CD,
            DECODE(A.CHAN_CD,'03',E.CHAN_MCLS_CD,G.CHAN_MCLS_CD) AS CHAN_MCLS_CD,            
            Pkg_Rtcm0051.f_sRtcm0051Codename('S090',DECODE(A.CHAN_CD,'03',E.CHAN_LCLS_CD,G.CHAN_LCLS_CD)) AS CHAN_LCLS_NM,
            Pkg_Rtcm0051.f_sRtcm0051Codename('S091',DECODE(A.CHAN_CD,'03',E.CHAN_MCLS_CD,G.CHAN_MCLS_CD)) AS CHAN_MCLS_NM,
            NVL(H.CNT_B00007, 0) AS CNT_B00007,            
            NVL(H.CNT_B00001, 0) AS CNT_B00001,
            NVL(H.CNT_B00002, 0) AS CNT_B00002,
            NVL(H.CNT_B00008, 0) AS CNT_B00008,
            NVL(H.CNT_B00003, 0) AS CNT_B00003            
    FROM    RTSD0108 A,
            RTCS0001 B,
            RTSD0005 C,
            RTSD0100 D,
            RTSD0113 E,
            RTSD0007 G,
            (
                SELECT  X.ORD_NO
                     ,  SUM(DECODE(X.PRS_DCD, 'B00007', X.SERV_CNT0, 0)) AS CNT_B00007
                     ,  SUM(DECODE(X.PRS_DCD, 'B00001', X.SERV_CNT0, 0)) AS CNT_B00001
                     ,  SUM(DECODE(X.PRS_DCD, 'B00002', X.SERV_CNT0, 0)) AS CNT_B00002
                     ,  SUM(DECODE(X.PRS_DCD, 'B00008', X.SERV_CNT0, 0)) AS CNT_B00008
                     ,  SUM(DECODE(X.PRS_DCD, 'B00003', X.SERV_CNT0, 0)) AS CNT_B00003
                  FROM  RTSD0013 X
                 WHERE  1=1
                 GROUP  BY X.ORD_NO  
        ) H
    WHERE   (v_Agency_Cd      IS NULL OR A.AGENCY_CD = v_Agency_Cd)
    AND     (v_Sales_Group    IS NULL OR A.SALES_GROUP = v_Sales_Group)
    AND     (v_Sales_Office   IS NULL OR A.SALES_OFFICE = v_Sales_Office)
    AND     (v_Proc_Day_S     IS NULL OR A.PROC_DAY BETWEEN v_Proc_Day_S AND v_Proc_Day_E)
    --AND     (v_Chan_Cd        IS NULL OR A.CHAN_CD = v_Chan_Cd)
    --AND     (v_Chan_Cd_Rest   IS NULL OR A.CHAN_CD != v_Chan_Cd_Rest)
    AND     ((v_Chan_Gbn = '01'  AND A.CHAN_CD IN ('01','05'))
    OR       (v_Chan_Gbn = '02'  AND A.CHAN_CD NOT IN ('01','05'))
    OR       (v_Chan_Gbn = 'ALL' AND A.CHAN_CD IS NOT NULL ))
    AND     A.ORD_NO = B.ORD_NO
    AND     A.EQU_NO = B.EQU_NO --[20171107_01]
    AND     B.MAT_CD = C.MAT_CD
    AND     A.CUST_NO = D.CUST_NO
    AND     A.ORD_AGENT = E.ORD_AGENT(+)
    AND     A.AGENCY_CD = G.AGENCY_CD(+)
    AND     A.ORD_NO    = H.ORD_NO(+)
    ORDER   BY SALES_GROUP_NM, SALES_OFFICE_NM, PROC_DAY, ORD_NO ASC
        ) A
        LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.AGENCY_CD = B.USER_ID
   ) A
    WHERE 1=1
      AND ((v_RENTAL_GROUP IS NULL) OR (v_RENTAL_GROUP IS NOT NULL AND A.RENTAL_GROUP = v_RENTAL_GROUP ))
      AND ((v_RENTAL_OFFICE IS NULL) OR (v_RENTAL_OFFICE IS NOT NULL AND A.RENTAL_OFFICE = v_RENTAL_OFFICE ))
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1 --[20190301_01]
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1 --[20190301_01]
                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
            ELSE 0 END
      ) = 1
    ;



  END p_sRtsd0108AgencyResult;


  /*****************************************************************************
  -- 장착 정보 Update - 서비스 확인서 서명완료 등록
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108CMileage (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_C_Mileage      IN RTSD0108.C_MILEAGE%TYPE,      /*현재주행거리          */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0108
    SET    C_MILEAGE    = v_C_Mileage,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  ORD_NO       = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0108CMileage;


  /*****************************************************************************
  -- 장착 정보 Update - 결합고객 할인처리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0108Discount (
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*계약번호              */
    v_Grp_Yn         IN RTSD0108.GRP_YN%TYPE,         /*고객결합여부          */
    v_Grp_No         IN RTSD0108.GRP_NO%TYPE,         /*고객결합번호          */
    v_Reg_Id         IN RTSD0108.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0108
    SET    GRP_YN    = v_Grp_Yn,
           GRP_NO    = v_Grp_No,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ORD_NO    = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0108Discount;


  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 종료일자 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108Os_Day(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR IS

    v_Os_Day    RTSD0108.OS_DAY%TYPE DEFAULT NULL;      /*종료일자            */

  BEGIN

    SELECT  OS_DAY
    INTO    v_Os_Day
    FROM    RTSD0108
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Os_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0108Os_Day;

  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 타이어개수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0108Cnt_Cd(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR IS

    v_Cnt_Cd    RTSD0108.CNT_CD%TYPE DEFAULT NULL;      /*계약타이어개수      */

  BEGIN

    SELECT  CNT_CD
    INTO    v_Cnt_Cd
    FROM    RTSD0108
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Cnt_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0108Cnt_Cd;

  /*****************************************************************************
  -- 고객으로 장착계약 찾기 Select (온라인몰 사용)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.10       2019-12-17  wjim             [2019-00359563] O2O 항목 추가
                                           - 장착점코드
   1.11       2020-01-10  kstka            [2020-00008994] 쇼핑몰 렌탈 장착주소 컬럼 추
   1.12       2020-01-13  kstka            [2020-00008994] 장착구분 컬럼 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0108CustOrdInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*SAFEKEY               */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE        /*사업자번호            */
    ) IS

  BEGIN
  
   

    OPEN Ref_Cursor FOR
/****** 장착완료 ****************************************************************************************/
/*  장착완료 - 개인 */
    SELECT
           /* 주문자정보 ------------------------------------------------------------------------------ */
           Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)              CUST_NM,       /*고객명             */
           A.MOB_NO,                                                               /*휴대폰번호         */
           A.TEL_NO,                                                               /*전화번호           */
           A.EMAIL_ADDR,                                                           /*이메일             */
           A.POS_CD,                                                               /*우편번호           */
           A.ADDR1 || ' ' || A.ADDR2                                ADDR,          /*주소               */
           TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)) || ' ' ||
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
           || ' ' || B.CAR_NO                                       CAR_INFO,      /*차량정보           */
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
                                                carModelNm,      /*차량이름           */
           SUBSTR(B.OS_DAY,1,4)||'-'||SUBSTR(B.OS_DAY,5,2)||'-'||SUBSTR(B.OS_DAY,7,2)
                                                                    OS_DAY,        /*소유권도래일       */
           A.SAFEKEY,                                                              /*SAFEKEY            */
           A.CUST_TP,                                                              /*고객유형           */
           A.BUSL_NO,                                                              /*사업자번호         */
           /* 주문정보 -------------------------------------------------------------------------------- */
           SUBSTR(B.ORD_DAY,1,4)||'-'||SUBSTR(B.ORD_DAY,5,2)||'-'||SUBSTR(B.ORD_DAY,7,2)
                                                                    ORD_DAY,       /*주문일자           */
           B.ORD_NO,                                                               /*주문번호           */
           D.PETTERN_CD,                                                           /*패턴타입(명)       */
           C.MAT_CD,                                                               /*자재코드(상품코드) */
           D.MAT_NM,                                                               /*자재명(상품명)     */
           D.SECTION_WIDTH || ' / ' || D.ASPECT_RATIO || 'R '
                           || D.WHEEL_INCHES                        TIRE_SIZE,     /*사이즈             */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S043', B.PS_CD)        PS_NM,         /*프리미엄서비스     */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD)       CNT_NM,        /*수량               */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S021', B.PERIOD_CD)    PERIOD_NM,     /*렌탈기간           */
           B.MON_AMT,                                                              /*렌탈료             */
           B.REGI_AMT,                                                             /*렌탈등록비         */
           '장착완료'                                               STAT_NM,       /*상태               */
           /* 배송지정보 ------------------------------------------------------------------------------ */
           SUBSTR(B.PROC_DAY,1,4)||'-'||SUBSTR(B.PROC_DAY,5,2)||'-'||SUBSTR(B.PROC_DAY,7,2)
                                                                    PROC_DAY,      /*장착일자           */
           E.AGENCY_NM,                                                            /*장착점명           */
           '(' || E.POS_CD | | ') ' || E.CITY || ' ' || E.STREET    AGENCY_ADDR,   /*장착점주소         */
           '(' || B.INST1_POSCD | | ') ' || B.INST1_ADDR1 || ' ' || B.INST1_ADDR2    VISIT_ADDR,   /* [2020-00008994] 방문장착주소         */
           '(' || B.INST2_POSCD | | ') ' || B.INST2_ADDR1 || ' ' || B.INST2_ADDR2    PICK_ADDR,    /* [2020-00008994] 픽업앤딜리버리주소   */
           /* 렌탈정보 -------------------------------------------------------------------------------- */
           B.REGI_AMT                                               ORD_AMT,       /*주문금액           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R004', B.PAY_MTHD)     PAY_MTHD_NM,   /*결제수단           */
           (SELECT SUM(NVL(RECP_AMT,0)) FROM RTSD0109
             WHERE ORD_NO = B.ORD_NO AND RECP_TP = '01')            REGI_RECP_AMT, /*등록비 결제금액    */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R001', F.BANK_CD)      BANK_NM,       /*은행이름           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R002', G.CARDCOM_CD)   CARDCOM_NM,    /*카드사이름         */
           F.ACCT_NO                                                ACCT_NO,       /*계좌번호           */
           G.CARD_NO                                                CARD_NO,       /*카드번호           */
           F.CUST_NM                                                BANK_OWNER,    /*예금주             */
           G.CUST_NM                                                CARD_OWNER,    /*카드소유주         */
           DECODE(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),NULL,NULL,
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),1,4)||'-'||
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),5,2)||'-'||
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),7,2))
                                                                    REQ_DAY,       /*청구일자           */
           Pkg_Rtsd0109.f_sRtsd0109ApplYmSaleAmt(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))
                                                                    REG_AMT,       /*청구금액           */
           DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM,       /*온라인,오프라인    */
           B.STAT_CD                                                STAT_CD,       /*상태코드           */
           SUBSTR(B2.PLAN_DAY,1,4)||'-'||SUBSTR(B2.PLAN_DAY,5,2)||'-'||SUBSTR(B2.PLAN_DAY,7,2)
                                                                    PROC_DAY0,     /*장착요청일         */
           CASE WHEN B.STAT_CD IN ('01','03') THEN 'Y' ELSE 'N' END CANCEL_YN,     /*취소가능여부       */
           CASE WHEN B.STAT_CD = '01' THEN
             CASE WHEN B.ORD_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'STSC'
                  WHEN B.ORD_DAY = TO_CHAR(SYSDATE-1, 'YYYYMMDD') THEN
                       CASE WHEN TO_CHAR(SYSDATE, 'HH24MISS')
                              < '170000' THEN 'STSC' END
                       ELSE 'STPC' END
                  ELSE 'NO' END                                     CANCEL_TYPE,   /*취소타입           */
           A.CUST_NO,                                                              /*고객번호           */
           B.PAY_DD,                                                                /*결제일자           */
           (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B2.SALE_CD AND ROWNUM = 1) AS SALE_CD, /* 판매상품코드 */
           (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B2.SALE_CD AND ROWNUM = 1) AS SALE_NM, /* 판매상품코드 */
           REGEXP_REPLACE(REGEXP_REPLACE (E.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3') AS AGENCY_TEL_NO,  /* 장착점 전화번호 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S014', D.SEASON_CD)    AS SEASON_NM,                                                                                               /* 계절명 */
           H.CLASS_CD,                                                                                                                                                          /* 승용차|SUV 구분 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S015', H.CLASS_CD)    AS CLASS_NM,                                                                                                 /* 승용차|SUV 구분명 */
           H.OE_YN,                                                                                                                                                             /* 순정|호환 구분코드 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S098', H.OE_YN)    AS OE_YN_NM,        /* 순정|호환 구분명 */
           B.AGENCY_CD,                                                              /* 장착점코드       */ --[2019-00359563]
           B.INST_CD,    --[2020-00008994] 장착구분코드 추가
           B.INST_TM    --[20200318] 장착시간
    FROM   RTSD0100 A,
           RTSD0108 B,
           RTSD0106 B2,
           RTCS0001 C,
           RTSD0005 D,
           RTSD0007 E,
           RTRE0010 F,
           RTRE0020 G,
           RTSD0004 H
    WHERE  A.USE_YN         = 'Y'
    AND    A.CUST_TP        = '01'
    AND    A.SAFEKEY        = v_Safekey
    AND    v_Safekey  IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    AND    B.ORD_NO         = B2.ORD_NO
    AND    B.ORD_NO         = C.ORD_NO
    AND    C.MAT_CD         = D.MAT_CD(+)
    AND    B.AGENCY_CD      = E.AGENCY_CD
    AND    B.ACC_SEQ        = F.ACC_SEQ(+)
    AND    B.CRD_SEQ        = G.CRD_SEQ(+)
    AND    B.MODEL_CD       = H.MODEL_CD
    AND    B.CONTENTS_CD    = H.CONTENTS_CD
    AND    B2.FR_CD         = H.FR_CD
    AND    D.SECTION_WIDTH  = H.SECTION_WIDTH
    AND    D.ASPECT_RATIO   = H.ASPECT_RATIO
    AND    D.WHEEL_INCHES   = H.WHEEL_INCHES 
    AND    D.PLY_RATING     = H.PLY_RATING     
    AND    D.USE_YN         = 'Y'
    AND    H.USE_YN         = 'Y'   
    AND    Pkg_Rtsd0108.f_sRtsd0108Count(B.ORD_NO) > 0                             /*장착완료건만 조회  */
    UNION ALL
/*  장착완료 - 사업자 */
    SELECT
           /* 주문자정보 ------------------------------------------------------------------------------ */
           Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)              CUST_NM,       /*고객명             */
           A.MOB_NO,                                                               /*휴대폰번호         */
           A.TEL_NO,                                                               /*전화번호           */
           A.EMAIL_ADDR,                                                           /*이메일             */
           A.POS_CD,                                                               /*우편번호           */
           A.ADDR1 || ' ' || A.ADDR2                                ADDR,          /*주소               */
           TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)) || ' ' ||
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
           || ' ' || B.CAR_NO                                       CAR_INFO,      /*차량정보           */
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
                                                carModelNm,      /*차량이름           */
           SUBSTR(B.OS_DAY,1,4)||'-'||SUBSTR(B.OS_DAY,5,2)||'-'||SUBSTR(B.OS_DAY,7,2)
                                                                    OS_DAY,        /*소유권도래일       */
           A.SAFEKEY,                                                              /*SAFEKEY            */
           A.CUST_TP,                                                              /*고객유형           */
           A.BUSL_NO,                                                              /*사업자번호         */
           /* 주문정보 -------------------------------------------------------------------------------- */
           SUBSTR(B.ORD_DAY,1,4)||'-'||SUBSTR(B.ORD_DAY,5,2)||'-'||SUBSTR(B.ORD_DAY,7,2)
                                                                    ORD_DAY,       /*주문일자           */
           B.ORD_NO,                                                               /*주문번호           */
           D.PETTERN_CD,                                                           /*패턴타입(명)       */
           C.MAT_CD,                                                               /*자재코드(상품코드) */
           D.MAT_NM,                                                               /*자재명(상품명)     */
           D.SECTION_WIDTH || ' / ' || D.ASPECT_RATIO || 'R '
                           || D.WHEEL_INCHES                        TIRE_SIZE,     /*사이즈             */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S043', B.PS_CD)        PS_NM,         /*프리미엄서비스     */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD)       CNT_NM,        /*수량               */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S021', B.PERIOD_CD)    PERIOD_NM,     /*렌탈기간           */
           B.MON_AMT,                                                              /*렌탈료             */
           B.REGI_AMT,                                                             /*렌탈등록비         */
           '장착완료'                                               STAT_NM,       /*상태               */
           /* 배송지정보 ------------------------------------------------------------------------------ */
           SUBSTR(B.PROC_DAY,1,4)||'-'||SUBSTR(B.PROC_DAY,5,2)||'-'||SUBSTR(B.PROC_DAY,7,2)
                                                                    PROC_DAY,      /*장착일자           */
           E.AGENCY_NM,                                                            /*장착점명           */
           '(' || E.POS_CD | | ') ' || E.CITY || ' ' || E.STREET    AGENCY_ADDR,   /*장착점주소         */
           '(' || B.INST1_POSCD | | ') ' || B.INST1_ADDR1 || ' ' || B.INST1_ADDR2    VISIT_ADDR,   /* [2020-00008994] 방문장착주소         */
           '(' || B.INST2_POSCD | | ') ' || B.INST2_ADDR1 || ' ' || B.INST2_ADDR2    PICK_ADDR,    /*  [2020-00008994] 픽업앤딜리버리주소   */
           /* 렌탈정보 -------------------------------------------------------------------------------- */
           B.REGI_AMT                                               ORD_AMT,       /*주문금액           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R004', B.PAY_MTHD)     PAY_MTHD_NM,   /*결제수단           */
           (SELECT SUM(NVL(RECP_AMT,0)) FROM RTSD0109
             WHERE ORD_NO = B.ORD_NO AND RECP_TP = '01')            REGI_RECP_AMT, /*등록비 결제금액    */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R001', F.BANK_CD)      BANK_NM,       /*은행이름           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R002', G.CARDCOM_CD)   CARDCOM_NM,    /*카드사이름         */
           F.ACCT_NO                                                ACCT_NO,       /*계좌번호           */
           G.CARD_NO                                                CARD_NO,       /*카드번호           */
           F.CUST_NM                                                BANK_OWNER,    /*예금주             */
           G.CUST_NM                                                CARD_OWNER,    /*카드소유주         */
           DECODE(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),NULL,NULL,
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),1,4)||'-'||
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),5,2)||'-'||
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),7,2))
                                                                    REQ_DAY,       /*청구일자           */
           Pkg_Rtsd0109.f_sRtsd0109ApplYmSaleAmt(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))
                                                                    REG_AMT,       /*청구금액           */
           DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM,       /*온라인,오프라인    */
           B.STAT_CD                                                STAT_CD,       /*상태코드           */
           SUBSTR(B2.PLAN_DAY,1,4)||'-'||SUBSTR(B2.PLAN_DAY,5,2)||'-'||SUBSTR(B2.PLAN_DAY,7,2)
                                                                    PROC_DAY0,     /*장착요청일         */
           CASE WHEN B.STAT_CD IN ('01','03') THEN 'Y' ELSE 'N' END CANCEL_YN,     /*취소가능여부       */
           CASE WHEN B.STAT_CD = '01' THEN
             CASE WHEN B.ORD_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'STSC'
                  WHEN B.ORD_DAY = TO_CHAR(SYSDATE-1, 'YYYYMMDD') THEN
                       CASE WHEN TO_CHAR(SYSDATE, 'HH24MISS')
                              < '170000' THEN 'STSC' END
                       ELSE 'STPC' END
                  ELSE 'NO' END                                     CANCEL_TYPE,   /*취소타입           */
           A.CUST_NO,                                                              /*고객번호           */
           B.PAY_DD,                                                                /*결제일자           */
           (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B2.SALE_CD AND ROWNUM = 1) AS SALE_CD, /* 판매상품코드 */
           (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B2.SALE_CD AND ROWNUM = 1) AS SALE_NM, /* 판매상품코드 */
           REGEXP_REPLACE(REGEXP_REPLACE (E.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3') AS AGENCY_TEL_NO,  /* 장착점 전화번호 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S014', D.SEASON_CD)    AS SEASON_NM,                                                                                               /* 계절명 */
           H.CLASS_CD,                                                                                                                                                          /* 승용차|SUV 구분 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S015', H.CLASS_CD)    AS CLASS_NM,                                                                                                 /* 승용차|SUV 구분명 */
           H.OE_YN,                                                                                                                                                             /* 순정|호환 구분코드 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S098', H.OE_YN)    AS OE_YN_NM,                                                                                                     /* 순정|호환 구분명 */
           B.AGENCY_CD,                                                              /* 장착점코드       */ --[2019-00359563]
           B.INST_CD,    --[2020-00008994] 장착구분코드 추가   
           B.INST_TM    --[20200318] 장착시간
    FROM   RTSD0100 A,
           RTSD0108 B,
           RTSD0106 B2,
           RTCS0001 C,
           RTSD0005 D,
           RTSD0007 E,
           RTRE0010 F,
           RTRE0020 G,
           RTSD0004 H
    WHERE  A.USE_YN         = 'Y'
    AND    A.CUST_TP        = '02'
    AND    A.BUSL_NO        = REPLACE(v_Busl_No,'-','')
    AND    v_Busl_No  IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    AND    B.ORD_NO         = B2.ORD_NO
    AND    B.ORD_NO         = C.ORD_NO
    AND    C.MAT_CD         = D.MAT_CD
    AND    B.AGENCY_CD      = E.AGENCY_CD
    AND    B.ACC_SEQ        = F.ACC_SEQ(+)
    AND    B.CRD_SEQ        = G.CRD_SEQ(+)
    AND    B.MODEL_CD       = H.MODEL_CD
    AND    B.CONTENTS_CD    = H.CONTENTS_CD
    AND    B2.FR_CD         = H.FR_CD
    AND    D.SECTION_WIDTH  = H.SECTION_WIDTH
    AND    D.ASPECT_RATIO   = H.ASPECT_RATIO
    AND    D.WHEEL_INCHES   = H.WHEEL_INCHES 
    AND    D.PLY_RATING     = H.PLY_RATING   
    AND    D.USE_YN         = 'Y'
    AND    H.USE_YN         = 'Y'   
    AND    Pkg_Rtsd0108.f_sRtsd0108Count(B.ORD_NO) > 0                             /*장착완료건만 조회  */
    UNION ALL
/***** 장착안됨(온라인) *********************************************************************************/
/*  장착안된 건(온라인) - 개인 */
    SELECT
           /* 주문자정보 ------------------------------------------------------------------------------ */
           Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)              CUST_NM,       /*고객명             */
           A.MOB_NO,                                                               /*휴대폰번호         */
           A.TEL_NO,                                                               /*전화번호           */
           A.EMAIL_ADDR,                                                           /*이메일             */
           A.POS_CD,                                                               /*우편번호           */
           A.ADDR1 || ' ' || A.ADDR2                                ADDR,          /*주소               */
           TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)) || ' ' ||
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
           || ' ' || B.CAR_NO                                       CAR_INFO,      /*차량정보           */
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
                                                carModelNm,      /*차량이름           */
           SUBSTR(C.OS_DAY,1,4)||'-'||SUBSTR(C.OS_DAY,5,2)||'-'||SUBSTR(C.OS_DAY,7,2)
                                                                    OS_DAY,        /*소유권도래일       */
           A.SAFEKEY,                                                              /*SAFEKEY            */
           A.CUST_TP,                                                              /*고객유형           */
           A.BUSL_NO,                                                              /*사업자번호         */
           /* 주문정보 -------------------------------------------------------------------------------- */
           SUBSTR(B.ORD_DAY,1,4)||'-'||SUBSTR(B.ORD_DAY,5,2)||'-'||SUBSTR(B.ORD_DAY,7,2) ORD_DAY,       /*주문일자           */
           B.ORD_NO,                                                               /*주문번호           */
           D.PETTERN_CD,                                                           /*패턴타입(명)       */
           C.MAT_CD,                                                               /*자재코드(상품코드) */
           D.MAT_NM,                                                               /*자재명(상품명)     */
           D.SECTION_WIDTH || ' / ' || D.ASPECT_RATIO || 'R '
                           || D.WHEEL_INCHES                        TIRE_SIZE,     /*사이즈             */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S043', B.PS_CD)        PS_NM,         /*프리미엄서비스     */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD)       CNT_NM,        /*수량               */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S021', B.PERIOD_CD)    PERIOD_NM,     /*렌탈기간           */
           B.SUM_MON_AMT AS MON_AMT,                                               /*렌탈료             */
           B.REGI_AMT,                                                             /*렌탈등록비         */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD)      STAT_NM,       /*상태               */
           /* 배송지정보 ------------------------------------------------------------------------------ */
           CASE WHEN Pkg_Exif0004.f_sExif0004O2OAgency(B.AGENCY_CD) = 'Y'  THEN Pkg_Exif0004.f_sExif0004O2OAgencyProcDay(B.ORD_NO) 
                             ELSE SUBSTR(B.PROC_DAY,1,4)||'-'||SUBSTR(B.PROC_DAY,5,2)||'-'||SUBSTR(B.PROC_DAY,7,2) END PROC_DAY,      /*장착일자           */
           E.AGENCY_NM,                                                            /*장착점명           */
           '(' || E.POS_CD | | ') ' || E.CITY || ' ' || E.STREET    AGENCY_ADDR,   /*장착점주소         */
           '(' || B.INST1_POSCD | | ') ' || B.INST1_ADDR1 || ' ' || B.INST1_ADDR2    VISIT_ADDR,   /*  [2020-00008994] 방문장착주소         */
           '(' || B.INST2_POSCD | | ') ' || B.INST2_ADDR1 || ' ' || B.INST2_ADDR2    PICK_ADDR,    /*  [2020-00008994] 픽업앤딜리버리주소   */
           /* 렌탈정보 -------------------------------------------------------------------------------- */
           C.REGI_AMT                                               ORD_AMT,       /*주문금액           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R004', B.PAY_MTHD)     PAY_MTHD_NM,   /*결제수단           */
           (SELECT SUM(NVL(RECP_AMT,0)) FROM RTRE0030
             WHERE ORD_NO = B.ORD_NO AND RECP_TP = '90')            REGI_RECP_AMT, /*등록비 결제금액    */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R001', F.BANK_CD)      BANK_NM,       /*은행이름           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R002', G.CARDCOM_CD)   CARDCOM_NM,    /*카드사이름         */
           F.ACCT_NO                                                ACCT_NO,       /*계좌번호           */
           G.CARD_NO                                                CARD_NO,       /*카드번호           */
           F.CUST_NM                                                BANK_OWNER,    /*예금주             */
           G.CUST_NM                                                CARD_OWNER,    /*카드소유주         */
           DECODE(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),NULL,NULL,
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),1,4)||'-'||
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),5,2)||'-'||
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),7,2))
                                                                    REQ_DAY,       /*청구일자           */
           DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),C.MON_AMT,0)
                                                                    REQ_AMT,       /*청구금액           */
           DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM,       /*온라인,오프라인    */
           B.STAT_CD                                                STAT_CD,       /*상태코드           */
           CASE WHEN Pkg_Exif0004.f_sExif0004O2OAgency(B.AGENCY_CD) = 'Y'  THEN Pkg_Exif0004.f_sExif0004O2OAgencyProcDay(B.ORD_NO) 
                             ELSE SUBSTR(C.PLAN_DAY,1,4)||'-'||SUBSTR(C.PLAN_DAY,5,2)||'-'||SUBSTR(C.PLAN_DAY,7,2) END PROC_DAY0,     /*장착요청일         */           
           CASE WHEN B.STAT_CD IN ('01','03') THEN 'Y' ELSE 'N' END CANCEL_YN,     /*취소가능여부       */
           CASE WHEN B.STAT_CD = '01' THEN
             CASE WHEN TO_CHAR(B.REG_DT, 'YYYYMMDD')
                     = TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'STSC'
                  WHEN TO_CHAR(B.REG_DT, 'YYYYMMDD')
                     = TO_CHAR(SYSDATE-1, 'YYYYMMDD') THEN
                       CASE WHEN TO_CHAR(SYSDATE, 'HH24MISS')
                              < '170000' THEN 'STSC' END
                       ELSE 'STPC' END
                  ELSE 'NO' END                                     CANCEL_TYPE,   /*취소타입           */
           A.CUST_NO,                                                              /*고객번호           */
           B.PAY_DD,                                                               /*결제일자           */
           (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_CD, /* 판매상품코드 */
           (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_NM, /* 판매상품코드 */
           REGEXP_REPLACE(REGEXP_REPLACE (E.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3') AS AGENCY_TEL_NO,  /* 장착점 전화번호 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S014', D.SEASON_CD)    AS SEASON_NM,                                                                                               /* 계절명 */
           H.CLASS_CD,                                                                                                                                                          /* 승용차|SUV 구분 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S015', H.CLASS_CD)    AS CLASS_NM,                                                                                                 /* 승용차|SUV 구분명 */
           H.OE_YN,                                                                                                                                                             /* 순정|호환 구분코드 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S098', H.OE_YN)    AS OE_YN_NM,                                                                                                     /* 순정|호환 구분명 */
           B.AGENCY_CD,                                                              /* 장착점코드       */ --[2019-00359563]
           B.INST_CD,    --[2020-00008994] 장착구분코드 추가
           B.INST_TM    --[20200318] 장착시간   
    FROM   RTSD0100 A,
           RTSD0104 B,
           RTSD0106 C,
           RTSD0005 D,
           RTSD0007 E,
           RTRE0010 F,
           RTRE0020 G,
           RTSD0004 H
    WHERE  A.USE_YN         = 'Y'
    AND    A.CUST_TP        = '01'
    AND    A.SAFEKEY        = v_Safekey
    AND    v_Safekey  IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    AND    B.ORD_NO         = C.ORD_NO
    AND    C.MAT_CD         = D.MAT_CD(+)
    AND    B.AGENCY_CD      = E.AGENCY_CD
    AND    B.ACC_SEQ        = F.ACC_SEQ(+)
    AND    B.CRD_SEQ        = G.CRD_SEQ(+)
    AND    B.MODEL_CD       = H.MODEL_CD
    AND    B.CONTENTS_CD    = H.CONTENTS_CD
    AND    C.FR_CD          = H.FR_CD
    AND    D.SECTION_WIDTH  = H.SECTION_WIDTH
    AND    D.ASPECT_RATIO   = H.ASPECT_RATIO
    AND    D.WHEEL_INCHES   = H.WHEEL_INCHES 
    AND    D.PLY_RATING     = H.PLY_RATING     
    AND    Pkg_Rtsd0108.f_sRtsd0108Count(B.ORD_NO) = 0                             /*장착안된 건만 조회 */
    AND    D.USE_YN         = 'Y'
    AND    H.USE_YN         = 'Y'   
    AND    B.ORD_NO LIKE 'O%'                                                      /*온라인몰           */
    UNION ALL
/*  장착안된 건(온라인) - 사업자 */
    SELECT
           /* 주문자정보 ------------------------------------------------------------------------------ */
           Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)              CUST_NM,       /*고객명             */
           A.MOB_NO,                                                               /*휴대폰번호         */
           A.TEL_NO,                                                               /*전화번호           */
           A.EMAIL_ADDR,                                                           /*이메일             */
           A.POS_CD,                                                               /*우편번호           */
           A.ADDR1 || ' ' || A.ADDR2                                ADDR,          /*주소               */
           TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)) || ' ' ||
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
           || ' ' || B.CAR_NO                                       CAR_INFO,      /*차량정보           */
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
                                                carModelNm,      /*차량이름           */
           SUBSTR(C.OS_DAY,1,4)||'-'||SUBSTR(C.OS_DAY,5,2)||'-'||SUBSTR(C.OS_DAY,7,2)
                                                                    OS_DAY,        /*소유권도래일       */
           A.SAFEKEY,                                                              /*SAFEKEY            */
           A.CUST_TP,                                                              /*고객유형           */
           A.BUSL_NO,                                                              /*사업자번호         */
           /* 주문정보 -------------------------------------------------------------------------------- */
           SUBSTR(B.ORD_DAY,1,4)||'-'||SUBSTR(B.ORD_DAY,5,2)||'-'||SUBSTR(B.ORD_DAY,7,2)
                                                                    ORD_DAY,       /*주문일자           */
           B.ORD_NO,                                                               /*주문번호           */
           D.PETTERN_CD,                                                           /*패턴타입(명)       */
           C.MAT_CD,                                                               /*자재코드(상품코드) */
           D.MAT_NM,                                                               /*자재명(상품명)     */
           D.SECTION_WIDTH || ' / ' || D.ASPECT_RATIO || 'R '
                           || D.WHEEL_INCHES                        TIRE_SIZE,     /*사이즈             */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S043', B.PS_CD)        PS_NM,         /*프리미엄서비스     */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD)       CNT_NM,        /*수량               */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S021', B.PERIOD_CD)    PERIOD_NM,     /*렌탈기간           */
           B.SUM_MON_AMT AS MON_AMT,                                                              /*렌탈료             */
           B.REGI_AMT,                                                             /*렌탈등록비         */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD)      STAT_NM,       /*상태               */
           /* 배송지정보 ------------------------------------------------------------------------------ */
           CASE WHEN Pkg_Exif0004.f_sExif0004O2OAgency(B.AGENCY_CD) = 'Y'  THEN Pkg_Exif0004.f_sExif0004O2OAgencyProcDay(B.ORD_NO) -- 20200318 kstka 거점인 경우 배정스케쥴 정보 조회
                             ELSE SUBSTR(B.PROC_DAY,1,4)||'-'||SUBSTR(B.PROC_DAY,5,2)||'-'||SUBSTR(B.PROC_DAY,7,2) END PROC_DAY,      /*장착일자           */
           E.AGENCY_NM,                                                            /*장착점명           */
           '(' || E.POS_CD | | ') ' || E.CITY || ' ' || E.STREET    AGENCY_ADDR,   /*장착점주소         */
           '(' || B.INST1_POSCD | | ') ' || B.INST1_ADDR1 || ' ' || B.INST1_ADDR2    VISIT_ADDR,   /* [2020-00008994] 방문장착주소         */
           '(' || B.INST2_POSCD | | ') ' || B.INST2_ADDR1 || ' ' || B.INST2_ADDR2    PICK_ADDR,    /* [2020-00008994] 픽업앤딜리버리주소   */
           /* 렌탈정보 -------------------------------------------------------------------------------- */
           C.REGI_AMT                                               ORD_AMT,       /*주문금액           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R004', B.PAY_MTHD)     PAY_MTHD_NM,   /*결제수단           */
           (SELECT SUM(NVL(RECP_AMT,0)) FROM RTRE0030
             WHERE ORD_NO = B.ORD_NO AND RECP_TP = '90')            REGI_RECP_AMT, /*등록비 결제금액    */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R001', F.BANK_CD)      BANK_NM,       /*은행이름           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R002', G.CARDCOM_CD)   CARDCOM_NM,    /*카드사이름         */
           F.ACCT_NO                                                ACCT_NO,       /*계좌번호           */
           G.CARD_NO                                                CARD_NO,       /*카드번호           */
           F.CUST_NM                                                BANK_OWNER,    /*예금주             */
           G.CUST_NM                                                CARD_OWNER,    /*카드소유주         */
           DECODE(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),NULL,NULL,
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),1,4)||'-'||
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),5,2)||'-'||
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),7,2))
                                                                    REQ_DAY,       /*청구일자           */
           DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),C.MON_AMT,0)
                                                                    REQ_AMT,       /*청구금액           */
           DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM,       /*온라인,오프라인    */
           B.STAT_CD                                                STAT_CD,       /*상태코드           */
           CASE WHEN Pkg_Exif0004.f_sExif0004O2OAgency(B.AGENCY_CD) = 'Y'  THEN Pkg_Exif0004.f_sExif0004O2OAgencyProcDay(B.ORD_NO) 
                             ELSE SUBSTR(C.PLAN_DAY,1,4)||'-'||SUBSTR(C.PLAN_DAY,5,2)||'-'||SUBSTR(C.PLAN_DAY,7,2) END PROC_DAY0,     /*장착요청일         */  
           CASE WHEN B.STAT_CD IN ('01','03') THEN 'Y' ELSE 'N' END CANCEL_YN,     /*취소가능여부       */
           CASE WHEN B.STAT_CD = '01' THEN
             CASE WHEN TO_CHAR(B.REG_DT, 'YYYYMMDD')
                     = TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'STSC'
                  WHEN TO_CHAR(B.REG_DT, 'YYYYMMDD')
                     = TO_CHAR(SYSDATE-1, 'YYYYMMDD') THEN
                       CASE WHEN TO_CHAR(SYSDATE, 'HH24MISS')
                              < '170000' THEN 'STSC' END
                       ELSE 'STPC' END
                  ELSE 'NO' END                                     CANCEL_TYPE,   /*취소타입           */
           A.CUST_NO,                                                              /*고객번호           */
           B.PAY_DD,                                                               /*결제일자           */
           (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_CD, /* 판매상품코드 */
           (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_NM, /* 판매상품코드 */
           REGEXP_REPLACE(REGEXP_REPLACE (E.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3') AS AGENCY_TEL_NO,  /* 장착점 전화번호 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S014', D.SEASON_CD)    AS SEASON_NM,                                                                                               /* 계절명 */
           H.CLASS_CD,                                                                                                                                                          /* 승용차|SUV 구분 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S015', H.CLASS_CD)    AS CLASS_NM,                                                                                                 /* 승용차|SUV 구분명 */
           H.OE_YN,                                                                                                                                                             /* 순정|호환 구분코드 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S098', H.OE_YN)    AS OE_YN_NM,                                                                                                    /* 순정|호환 구분명 */
           B.AGENCY_CD,                                                              /* 장착점코드       */ --[2019-00359563]
           B.INST_CD,    --[2020-00008994] 장착구분코드 추가
           B.INST_TM    --[20200318] 장착시간   
    FROM   RTSD0100 A,
           RTSD0104 B,
           RTSD0106 C,
           RTSD0005 D,
           RTSD0007 E,
           RTRE0010 F,
           RTRE0020 G,
           RTSD0004 H
    WHERE  A.USE_YN         = 'Y'
    AND    A.CUST_TP        = '02'
    AND    A.BUSL_NO        = REPLACE(v_Busl_No,'-','')
    AND    v_Busl_No  IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    AND    B.ORD_NO         = C.ORD_NO
    AND    C.MAT_CD         = D.MAT_CD
    AND    B.AGENCY_CD      = E.AGENCY_CD
    AND    B.ACC_SEQ        = F.ACC_SEQ(+)
    AND    B.CRD_SEQ        = G.CRD_SEQ(+)
    AND    B.MODEL_CD       = H.MODEL_CD
    AND    B.CONTENTS_CD    = H.CONTENTS_CD
    AND    C.FR_CD          = H.FR_CD
    AND    D.SECTION_WIDTH  = H.SECTION_WIDTH
    AND    D.ASPECT_RATIO   = H.ASPECT_RATIO
    AND    D.WHEEL_INCHES   = H.WHEEL_INCHES 
    AND    D.PLY_RATING     = H.PLY_RATING     
    AND    Pkg_Rtsd0108.f_sRtsd0108Count(B.ORD_NO) = 0                             /*장착안된 건만 조회 */
    AND    D.USE_YN         = 'Y'
    AND    H.USE_YN         = 'Y'   
    AND    B.ORD_NO LIKE 'O%'                                                      /*온라인몰           */
    ORDER BY 12 DESC,13;

  END p_sRtsd0108CustOrdInfo;
  
  
  /*****************************************************************************
  -- 고객으로 장착계약 찾기 Select (온라인몰 사용, O2O연계)
  *****************************************************************************/
  PROCEDURE p_sRtsd0108CustOrdInfoNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Safekey        IN RTSD0100.SAFEKEY%TYPE,        /*SAFEKEY               */
    v_Busl_No        IN RTSD0100.BUSL_NO%TYPE        /*사업자번호            */
    ) IS

  BEGIN
  
   

    OPEN Ref_Cursor FOR
/****** 장착완료 ****************************************************************************************/
/*  장착완료 - 개인 */
    SELECT
           /* 주문자정보 ------------------------------------------------------------------------------ */
           Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)              CUST_NM,       /*고객명             */
           A.MOB_NO,                                                               /*휴대폰번호         */
           A.TEL_NO,                                                               /*전화번호           */
           A.EMAIL_ADDR,                                                           /*이메일             */
           A.POS_CD,                                                               /*우편번호           */
           A.ADDR1 || ' ' || A.ADDR2                                ADDR,          /*주소               */
           TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)) || ' / ' ||
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
           || ' / ' || B.CAR_NO                                       CAR_INFO,      /*차량정보           */
           SUBSTR(B.OS_DAY,1,4)||'-'||SUBSTR(B.OS_DAY,5,2)||'-'||SUBSTR(B.OS_DAY,7,2)
                                                                    OS_DAY,        /*소유권도래일       */
           A.SAFEKEY,                                                              /*SAFEKEY            */
           A.CUST_TP,                                                              /*고객유형           */
           A.BUSL_NO,                                                              /*사업자번호         */
           /* 주문정보 -------------------------------------------------------------------------------- */
           SUBSTR(B.ORD_DAY,1,4)||'-'||SUBSTR(B.ORD_DAY,5,2)||'-'||SUBSTR(B.ORD_DAY,7,2)
                                                                    ORD_DAY,       /*주문일자           */
           B.ORD_NO,                                                               /*주문번호           */
           D.PETTERN_CD,                                                           /*패턴타입(명)       */
           C.MAT_CD,                                                               /*자재코드(상품코드) */
           D.MAT_NM,                                                               /*자재명(상품명)     */
           D.SECTION_WIDTH || ' / ' || D.ASPECT_RATIO || 'R '
                           || D.WHEEL_INCHES || D.PLY_RATING        TIRE_SIZE,     /*사이즈             */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S043', B.PS_CD)        PS_NM,         /*프리미엄서비스     */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD)       CNT_NM,        /*수량               */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S021', B.PERIOD_CD)    PERIOD_NM,     /*렌탈기간           */
           B.MON_AMT,                                                              /*렌탈료             */
           B.REGI_AMT,                                                             /*렌탈등록비         */
           '장착완료'                                               STAT_NM,       /*상태               */
           /* 배송지정보 ------------------------------------------------------------------------------ */
           SUBSTR(B.PROC_DAY,1,4)||'-'||SUBSTR(B.PROC_DAY,5,2)||'-'||SUBSTR(B.PROC_DAY,7,2)
                                                                    PROC_DAY,      /*장착일자           */
           E.AGENCY_NM,                                                            /*장착점명           */
           '(' || E.POS_CD | | ') ' || E.CITY || ' ' || E.STREET    AGENCY_ADDR,   /*장착점주소         */
           /* 렌탈정보 -------------------------------------------------------------------------------- */
           B.REGI_AMT                                               ORD_AMT,       /*주문금액           */
           B.PAY_MTHD,                                                             /*결제수단코드       */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R004', B.PAY_MTHD)     PAY_MTHD_NM,   /*결제수단           */
           (SELECT SUM(NVL(RECP_AMT,0)) FROM RTSD0109
             WHERE ORD_NO = B.ORD_NO AND RECP_TP = '01')            REGI_RECP_AMT, /*등록비 결제금액    */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R001', F.BANK_CD)      BANK_NM,       /*은행이름           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R002', G.CARDCOM_CD)   CARDCOM_NM,    /*카드사이름         */
           F.ACCT_NO                                                ACCT_NO,       /*계좌번호           */
           G.CARD_NO                                                CARD_NO,       /*카드번호           */
           F.CUST_NM                                                BANK_OWNER,    /*예금주             */
           G.CUST_NM                                                CARD_OWNER,    /*카드소유주         */
           DECODE(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),NULL,NULL,
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),1,4)||'-'||
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),5,2)||'-'||
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),7,2))
                                                                    REQ_DAY,       /*청구일자           */
           Pkg_Rtsd0109.f_sRtsd0109ApplYmSaleAmt(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))
                                                                    REG_AMT,       /*청구금액           */
           DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM,       /*온라인,오프라인    */
           B.STAT_CD                                                STAT_CD,       /*상태코드           */
           SUBSTR(B2.PLAN_DAY,1,4)||'-'||SUBSTR(B2.PLAN_DAY,5,2)||'-'||SUBSTR(B2.PLAN_DAY,7,2)
                                                                    PROC_DAY0,     /*장착요청일         */
           CASE WHEN B.STAT_CD IN ('01','03') THEN 'Y' ELSE 'N' END CANCEL_YN,     /*취소가능여부       */
           CASE WHEN B.STAT_CD = '01' THEN
             CASE WHEN B.ORD_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'STSC'
                  WHEN B.ORD_DAY = TO_CHAR(SYSDATE-1, 'YYYYMMDD') THEN
                       CASE WHEN TO_CHAR(SYSDATE, 'HH24MISS')
                              < '170000' THEN 'STSC' END
                       ELSE 'STPC' END
                  ELSE 'NO' END                                     CANCEL_TYPE,   /*취소타입           */
           A.CUST_NO,                                                              /*고객번호           */
           B.PAY_DD,                                                                /*결제일자           */
           (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B2.SALE_CD AND ROWNUM = 1) AS SALE_CD, /* 판매상품코드 */
           (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B2.SALE_CD AND ROWNUM = 1) AS SALE_NM, /* 판매상품코드 */
           REGEXP_REPLACE(REGEXP_REPLACE (E.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3') AS AGENCY_TEL_NO,  /* 장착점 전화번호 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S014', D.SEASON_CD)    AS SEASON_NM,                                                                                               /* 계절명 */
           H.CLASS_CD,                                                                                                                                                          /* 승용차|SUV 구분 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S015', H.CLASS_CD)    AS CLASS_NM,                                                                                                 /* 승용차|SUV 구분명 */
           H.OE_YN,                                                                                                                                                             /* 순정|호환 구분코드 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S098', H.OE_YN)    AS OE_YN_NM, /* 순정|호환 구분명 */
           CASE WHEN B.OS_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'Y' ELSE 'N' END OS_YN,     /*계약종료여부*/ 
           NVL((SELECT  MAX(COUNT(*))
                     FROM    RTSD0109 X
                    WHERE   X.ORD_NO = B.ORD_NO
                      AND    X.ARRE_AMT > 0
                      AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                      AND    X.SCD_STAT = 'S'
                    GROUP   BY X.RECP_TP), 0) ARRE_CNT,     /*연체개월*/ 
           G.EXPIRE_YM, /*유효기간*/
           (SELECT LISTAGG(Pkg_Rtcm0051.f_sRtcm0051CodeName('S044',T.PRS_DCD)||'||'||T.SERV_CNT0,',') WITHIN GROUP(ORDER BY T.PRS_DCD) FROM RTSD0013 T WHERE T.ORD_NO = B.ORD_NO) AS PRIMIUM_SVC,  /* 부가서비스 (서비스명, 수량) */
           Pkg_Rtcm0051.f_sRtcm0051Codename('C023', B.INST_CD) AS INST_NM                                                                                                  
    FROM   RTSD0100 A,
           RTSD0108 B,
           RTSD0106 B2,
           RTCS0001 C,
           RTSD0005 D,
           RTSD0007 E,
           RTRE0010 F,
           RTRE0020 G,
           RTSD0004 H
    WHERE  A.USE_YN         = 'Y'
    AND    A.CUST_TP        = '01'
    AND    A.SAFEKEY        = v_Safekey
    AND    v_Safekey  IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    AND    B.ORD_NO         = B2.ORD_NO
    AND    B.ORD_NO         = C.ORD_NO
    AND    C.MAT_CD         = D.MAT_CD(+)
    AND    B.AGENCY_CD      = E.AGENCY_CD
    AND    B.ACC_SEQ        = F.ACC_SEQ(+)
    AND    B.CRD_SEQ        = G.CRD_SEQ(+)
    AND    B.MODEL_CD       = H.MODEL_CD
    AND    B.CONTENTS_CD    = H.CONTENTS_CD
    AND    B2.FR_CD         = H.FR_CD
    AND    D.SECTION_WIDTH  = H.SECTION_WIDTH
    AND    D.ASPECT_RATIO   = H.ASPECT_RATIO
    AND    D.WHEEL_INCHES   = H.WHEEL_INCHES 
    AND    D.PLY_RATING     = H.PLY_RATING     
--    AND    D.USE_YN         = 'Y'
--    AND    H.USE_YN         = 'Y'   
    AND    Pkg_Rtsd0108.f_sRtsd0108Count(B.ORD_NO) > 0                             /*장착완료건만 조회  */
    UNION ALL
/*  장착완료 - 사업자 */
    SELECT
           /* 주문자정보 ------------------------------------------------------------------------------ */
           Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)              CUST_NM,       /*고객명             */
           A.MOB_NO,                                                               /*휴대폰번호         */
           A.TEL_NO,                                                               /*전화번호           */
           A.EMAIL_ADDR,                                                           /*이메일             */
           A.POS_CD,                                                               /*우편번호           */
           A.ADDR1 || ' ' || A.ADDR2                                ADDR,          /*주소               */
           TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)) || ' / ' ||
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
           || ' / ' || B.CAR_NO                                       CAR_INFO,      /*차량정보           */
           SUBSTR(B.OS_DAY,1,4)||'-'||SUBSTR(B.OS_DAY,5,2)||'-'||SUBSTR(B.OS_DAY,7,2)
                                                                    OS_DAY,        /*소유권도래일       */
           A.SAFEKEY,                                                              /*SAFEKEY            */
           A.CUST_TP,                                                              /*고객유형           */
           A.BUSL_NO,                                                              /*사업자번호         */
           /* 주문정보 -------------------------------------------------------------------------------- */
           SUBSTR(B.ORD_DAY,1,4)||'-'||SUBSTR(B.ORD_DAY,5,2)||'-'||SUBSTR(B.ORD_DAY,7,2)
                                                                    ORD_DAY,       /*주문일자           */
           B.ORD_NO,                                                               /*주문번호           */
           D.PETTERN_CD,                                                           /*패턴타입(명)       */
           C.MAT_CD,                                                               /*자재코드(상품코드) */
           D.MAT_NM,                                                               /*자재명(상품명)     */
           D.SECTION_WIDTH || ' / ' || D.ASPECT_RATIO || 'R '
                           || D.WHEEL_INCHES || D.PLY_RATING       TIRE_SIZE,     /*사이즈             */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S043', B.PS_CD)        PS_NM,         /*프리미엄서비스     */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD)       CNT_NM,        /*수량               */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S021', B.PERIOD_CD)    PERIOD_NM,     /*렌탈기간           */
           B.MON_AMT,                                                              /*렌탈료             */
           B.REGI_AMT,                                                             /*렌탈등록비         */
           '장착완료'                                               STAT_NM,       /*상태               */
           /* 배송지정보 ------------------------------------------------------------------------------ */
           SUBSTR(B.PROC_DAY,1,4)||'-'||SUBSTR(B.PROC_DAY,5,2)||'-'||SUBSTR(B.PROC_DAY,7,2)
                                                                    PROC_DAY,      /*장착일자           */
           E.AGENCY_NM,                                                            /*장착점명           */
           '(' || E.POS_CD | | ') ' || E.CITY || ' ' || E.STREET    AGENCY_ADDR,   /*장착점주소         */
           /* 렌탈정보 -------------------------------------------------------------------------------- */
           B.REGI_AMT                                               ORD_AMT,       /*주문금액           */
           B.PAY_MTHD,                                                             /*결제수단코드       */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R004', B.PAY_MTHD)     PAY_MTHD_NM,   /*결제수단           */
           (SELECT SUM(NVL(RECP_AMT,0)) FROM RTSD0109
             WHERE ORD_NO = B.ORD_NO AND RECP_TP = '01')            REGI_RECP_AMT, /*등록비 결제금액    */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R001', F.BANK_CD)      BANK_NM,       /*은행이름           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R002', G.CARDCOM_CD)   CARDCOM_NM,    /*카드사이름         */
           F.ACCT_NO                                                ACCT_NO,       /*계좌번호           */
           G.CARD_NO                                                CARD_NO,       /*카드번호           */
           F.CUST_NM                                                BANK_OWNER,    /*예금주             */
           G.CUST_NM                                                CARD_OWNER,    /*카드소유주         */
           DECODE(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),NULL,NULL,
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),1,4)||'-'||
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),5,2)||'-'||
                  SUBSTR(TO_CHAR(Pkg_Rtsd0109.f_sRtsd0109ApplYmZfbDay(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))),7,2))
                                                                    REQ_DAY,       /*청구일자           */
           Pkg_Rtsd0109.f_sRtsd0109ApplYmSaleAmt(B.ORD_NO,TO_CHAR(SYSDATE,'YYYYMM'))
                                                                    REG_AMT,       /*청구금액           */
           DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM,       /*온라인,오프라인    */
           B.STAT_CD                                                STAT_CD,       /*상태코드           */
           SUBSTR(B2.PLAN_DAY,1,4)||'-'||SUBSTR(B2.PLAN_DAY,5,2)||'-'||SUBSTR(B2.PLAN_DAY,7,2)
                                                                    PROC_DAY0,     /*장착요청일         */
           CASE WHEN B.STAT_CD IN ('01','03') THEN 'Y' ELSE 'N' END CANCEL_YN,     /*취소가능여부       */
           CASE WHEN B.STAT_CD = '01' THEN
             CASE WHEN B.ORD_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'STSC'
                  WHEN B.ORD_DAY = TO_CHAR(SYSDATE-1, 'YYYYMMDD') THEN
                       CASE WHEN TO_CHAR(SYSDATE, 'HH24MISS')
                              < '170000' THEN 'STSC' END
                       ELSE 'STPC' END
                  ELSE 'NO' END                                     CANCEL_TYPE,   /*취소타입           */
           A.CUST_NO,                                                              /*고객번호           */
           B.PAY_DD,                                                                /*결제일자           */
           (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B2.SALE_CD AND ROWNUM = 1) AS SALE_CD, /* 판매상품코드 */
           (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B2.SALE_CD AND ROWNUM = 1) AS SALE_NM, /* 판매상품코드 */
           REGEXP_REPLACE(REGEXP_REPLACE (E.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3') AS AGENCY_TEL_NO,  /* 장착점 전화번호 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S014', D.SEASON_CD)    AS SEASON_NM,                                                                                               /* 계절명 */
           H.CLASS_CD,                                                                                                                                                          /* 승용차|SUV 구분 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S015', H.CLASS_CD)    AS CLASS_NM,                                                                                                 /* 승용차|SUV 구분명 */
           H.OE_YN,                                                                                                                                                             /* 순정|호환 구분코드 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S098', H.OE_YN)    AS OE_YN_NM, /* 순정|호환 구분명 */
           CASE WHEN B.OS_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'Y' ELSE 'N' END OS_YN,     /*계약종료여부*/ 
           NVL((SELECT  MAX(COUNT(*))
                     FROM    RTSD0109 X
                    WHERE   X.ORD_NO = B.ORD_NO
                      AND    X.ARRE_AMT > 0
                      AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                      AND    X.SCD_STAT = 'S'
                    GROUP   BY X.RECP_TP), 0) ARRE_CNT,     /*연체개월*/                                                                                                     
           G.EXPIRE_YM, /*유효기간*/
           (SELECT LISTAGG(Pkg_Rtcm0051.f_sRtcm0051CodeName('S044',T.PRS_DCD)||'||'||T.SERV_CNT0,',') WITHIN GROUP(ORDER BY T.PRS_DCD) FROM RTSD0013 T WHERE T.ORD_NO = B.ORD_NO) AS PRIMIUM_SVC,  /* 부가서비스 (서비스명, 수량) */
           Pkg_Rtcm0051.f_sRtcm0051Codename('C023', B.INST_CD) AS INST_NM
    FROM   RTSD0100 A,
           RTSD0108 B,
           RTSD0106 B2,
           RTCS0001 C,
           RTSD0005 D,
           RTSD0007 E,
           RTRE0010 F,
           RTRE0020 G,
           RTSD0004 H
    WHERE  A.USE_YN         = 'Y'
    AND    A.CUST_TP        = '02'
    AND    A.BUSL_NO        = REPLACE(v_Busl_No,'-','')
    AND    v_Busl_No  IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    AND    B.ORD_NO         = B2.ORD_NO
    AND    B.ORD_NO         = C.ORD_NO
    AND    C.MAT_CD         = D.MAT_CD
    AND    B.AGENCY_CD      = E.AGENCY_CD
    AND    B.ACC_SEQ        = F.ACC_SEQ(+)
    AND    B.CRD_SEQ        = G.CRD_SEQ(+)
    AND    B.MODEL_CD       = H.MODEL_CD
    AND    B.CONTENTS_CD    = H.CONTENTS_CD
    AND    B2.FR_CD         = H.FR_CD
    AND    D.SECTION_WIDTH  = H.SECTION_WIDTH
    AND    D.ASPECT_RATIO   = H.ASPECT_RATIO
    AND    D.WHEEL_INCHES   = H.WHEEL_INCHES 
    AND    D.PLY_RATING     = H.PLY_RATING   
--    AND    D.USE_YN         = 'Y'
--    AND    H.USE_YN         = 'Y'   
    AND    Pkg_Rtsd0108.f_sRtsd0108Count(B.ORD_NO) > 0                             /*장착완료건만 조회  */
    UNION ALL
/***** 장착안됨(온라인) *********************************************************************************/
/*  장착안된 건(온라인) - 개인 */
    SELECT
           /* 주문자정보 ------------------------------------------------------------------------------ */
           Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)              CUST_NM,       /*고객명             */
           A.MOB_NO,                                                               /*휴대폰번호         */
           A.TEL_NO,                                                               /*전화번호           */
           A.EMAIL_ADDR,                                                           /*이메일             */
           A.POS_CD,                                                               /*우편번호           */
           A.ADDR1 || ' ' || A.ADDR2                                ADDR,          /*주소               */
           TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)) || ' / ' ||
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
           || ' / ' || B.CAR_NO                                       CAR_INFO,      /*차량정보           */
           SUBSTR(C.OS_DAY,1,4)||'-'||SUBSTR(C.OS_DAY,5,2)||'-'||SUBSTR(C.OS_DAY,7,2)
                                                                    OS_DAY,        /*소유권도래일       */
           A.SAFEKEY,                                                              /*SAFEKEY            */
           A.CUST_TP,                                                              /*고객유형           */
           A.BUSL_NO,                                                              /*사업자번호         */
           /* 주문정보 -------------------------------------------------------------------------------- */
           SUBSTR(B.ORD_DAY,1,4)||'-'||SUBSTR(B.ORD_DAY,5,2)||'-'||SUBSTR(B.ORD_DAY,7,2)
                                                                    ORD_DAY,       /*주문일자           */
           B.ORD_NO,                                                               /*주문번호           */
           D.PETTERN_CD,                                                           /*패턴타입(명)       */
           C.MAT_CD,                                                               /*자재코드(상품코드) */
           D.MAT_NM,                                                               /*자재명(상품명)     */
           D.SECTION_WIDTH || ' / ' || D.ASPECT_RATIO || 'R '
                           || D.WHEEL_INCHES || D.PLY_RATING        TIRE_SIZE,     /*사이즈             */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S043', B.PS_CD)        PS_NM,         /*프리미엄서비스     */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD)       CNT_NM,        /*수량               */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S021', B.PERIOD_CD)    PERIOD_NM,     /*렌탈기간           */
           B.SUM_MON_AMT AS MON_AMT,                                               /*렌탈료             */
           B.REGI_AMT,                                                             /*렌탈등록비         */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD)      STAT_NM,       /*상태               */
           /* 배송지정보 ------------------------------------------------------------------------------ */
           CASE WHEN Pkg_Exif0004.f_sExif0004O2OAgency(B.AGENCY_CD) = 'Y'  THEN Pkg_Exif0004.f_sExif0004O2OAgencyProcDay(B.ORD_NO) 
                             ELSE SUBSTR(B.PROC_DAY,1,4)||'-'||SUBSTR(B.PROC_DAY,5,2)||'-'||SUBSTR(B.PROC_DAY,7,2) END PROC_DAY,      /*장착일자           */
           E.AGENCY_NM,                                                            /*장착점명           */
           '(' || E.POS_CD | | ') ' || E.CITY || ' ' || E.STREET    AGENCY_ADDR,   /*장착점주소         */
           /* 렌탈정보 -------------------------------------------------------------------------------- */
           C.REGI_AMT                                               ORD_AMT,       /*주문금액           */
           B.PAY_MTHD,                                                             /*결제수단코드       */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R004', B.PAY_MTHD)     PAY_MTHD_NM,   /*결제수단           */
           (SELECT SUM(NVL(RECP_AMT,0)) FROM RTRE0030
             WHERE ORD_NO = B.ORD_NO AND RECP_TP = '90')            REGI_RECP_AMT, /*등록비 결제금액    */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R001', F.BANK_CD)      BANK_NM,       /*은행이름           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R002', G.CARDCOM_CD)   CARDCOM_NM,    /*카드사이름         */
           F.ACCT_NO                                                ACCT_NO,       /*계좌번호           */
           G.CARD_NO                                                CARD_NO,       /*카드번호           */
           F.CUST_NM                                                BANK_OWNER,    /*예금주             */
           G.CUST_NM                                                CARD_OWNER,    /*카드소유주         */
           DECODE(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),NULL,NULL,
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),1,4)||'-'||
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),5,2)||'-'||
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),7,2))
                                                                    REQ_DAY,       /*청구일자           */
           DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),C.MON_AMT,0)
                                                                    REQ_AMT,       /*청구금액           */
           DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM,       /*온라인,오프라인    */
           B.STAT_CD                                                STAT_CD,       /*상태코드           */
           SUBSTR(C.PLAN_DAY,1,4)||'-'||SUBSTR(C.PLAN_DAY,5,2)||'-'||SUBSTR(C.PLAN_DAY,7,2)
                                                                    PROC_DAY0,     /*장착요청일         */
           CASE WHEN B.STAT_CD IN ('01','03') THEN 'Y' ELSE 'N' END CANCEL_YN,     /*취소가능여부       */
           CASE WHEN B.STAT_CD = '01' THEN
             CASE WHEN TO_CHAR(B.REG_DT, 'YYYYMMDD')
                     = TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'STSC'
                  WHEN TO_CHAR(B.REG_DT, 'YYYYMMDD')
                     = TO_CHAR(SYSDATE-1, 'YYYYMMDD') THEN
                       CASE WHEN TO_CHAR(SYSDATE, 'HH24MISS')
                              < '170000' THEN 'STSC' END
                       ELSE 'STPC' END
                  ELSE 'NO' END                                     CANCEL_TYPE,   /*취소타입           */
           A.CUST_NO,                                                              /*고객번호           */
           B.PAY_DD,                                                               /*결제일자           */
           (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_CD, /* 판매상품코드 */
           (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_NM, /* 판매상품코드 */
           REGEXP_REPLACE(REGEXP_REPLACE (E.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3') AS AGENCY_TEL_NO,  /* 장착점 전화번호 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S014', D.SEASON_CD)    AS SEASON_NM,                                                                                               /* 계절명 */
           H.CLASS_CD,                                                                                                                                                          /* 승용차|SUV 구분 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S015', H.CLASS_CD)    AS CLASS_NM,                                                                                                 /* 승용차|SUV 구분명 */
           H.OE_YN,                                                                                                                                                             /* 순정|호환 구분코드 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S098', H.OE_YN)    AS OE_YN_NM,    /* 순정|호환 구분명 */
           CASE WHEN C.OS_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'Y' ELSE 'N' END OS_YN,     /*계약종료여부*/ 
           NVL((SELECT  MAX(COUNT(*))
                     FROM    RTSD0109 X
                    WHERE   X.ORD_NO = B.ORD_NO
                      AND    X.ARRE_AMT > 0
                      AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                      AND    X.SCD_STAT = 'S'
                    GROUP   BY X.RECP_TP), 0) ARRE_CNT,     /*연체개월*/                                                                                                     
           G.EXPIRE_YM, /*유효기간*/
           (SELECT LISTAGG(Pkg_Rtcm0051.f_sRtcm0051CodeName('S044',T.PRS_DCD)||'||'||T.SERV_CNT0,',') WITHIN GROUP(ORDER BY T.PRS_DCD) FROM RTSD0013 T WHERE T.ORD_NO = B.ORD_NO) AS PRIMIUM_SVC,  /* 부가서비스 (서비스명, 수량) */
           Pkg_Rtcm0051.f_sRtcm0051Codename('C023', B.INST_CD) AS INST_NM         
    FROM   RTSD0100 A,
           RTSD0104 B,
           RTSD0106 C,
           RTSD0005 D,
           RTSD0007 E,
           RTRE0010 F,
           RTRE0020 G,
           RTSD0004 H
    WHERE  A.USE_YN         = 'Y'
    AND    A.CUST_TP        = '01'
    AND    A.SAFEKEY        = v_Safekey
    AND    v_Safekey  IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    AND    B.ORD_NO         = C.ORD_NO
    AND    C.MAT_CD         = D.MAT_CD(+)
    AND    B.AGENCY_CD      = E.AGENCY_CD
    AND    B.ACC_SEQ        = F.ACC_SEQ(+)
    AND    B.CRD_SEQ        = G.CRD_SEQ(+)
    AND    B.MODEL_CD       = H.MODEL_CD
    AND    B.CONTENTS_CD    = H.CONTENTS_CD
    AND    C.FR_CD          = H.FR_CD
    AND    D.SECTION_WIDTH  = H.SECTION_WIDTH
    AND    D.ASPECT_RATIO   = H.ASPECT_RATIO
    AND    D.WHEEL_INCHES   = H.WHEEL_INCHES 
    AND    D.PLY_RATING     = H.PLY_RATING     
    AND    Pkg_Rtsd0108.f_sRtsd0108Count(B.ORD_NO) = 0                             /*장착안된 건만 조회 */
--    AND    D.USE_YN         = 'Y'
--    AND    H.USE_YN         = 'Y'   
    AND    B.ORD_NO LIKE 'O%'                                                      /*온라인몰           */
    UNION ALL
/*  장착안된 건(온라인) - 사업자 */
    SELECT
           /* 주문자정보 ------------------------------------------------------------------------------ */
           Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)              CUST_NM,       /*고객명             */
           A.MOB_NO,                                                               /*휴대폰번호         */
           A.TEL_NO,                                                               /*전화번호           */
           A.EMAIL_ADDR,                                                           /*이메일             */
           A.POS_CD,                                                               /*우편번호           */
           A.ADDR1 || ' ' || A.ADDR2                                ADDR,          /*주소               */
           TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)) || ' / ' ||
           DECODE(B.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)),
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)) ||' '||
                                       TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)))
           || ' / ' || B.CAR_NO                                       CAR_INFO,      /*차량정보           */
           SUBSTR(C.OS_DAY,1,4)||'-'||SUBSTR(C.OS_DAY,5,2)||'-'||SUBSTR(C.OS_DAY,7,2)
                                                                    OS_DAY,        /*소유권도래일       */
           A.SAFEKEY,                                                              /*SAFEKEY            */
           A.CUST_TP,                                                              /*고객유형           */
           A.BUSL_NO,                                                              /*사업자번호         */
           /* 주문정보 -------------------------------------------------------------------------------- */
           SUBSTR(B.ORD_DAY,1,4)||'-'||SUBSTR(B.ORD_DAY,5,2)||'-'||SUBSTR(B.ORD_DAY,7,2)
                                                                    ORD_DAY,       /*주문일자           */
           B.ORD_NO,                                                               /*주문번호           */
           D.PETTERN_CD,                                                           /*패턴타입(명)       */
           C.MAT_CD,                                                               /*자재코드(상품코드) */
           D.MAT_NM,                                                               /*자재명(상품명)     */
           D.SECTION_WIDTH || ' / ' || D.ASPECT_RATIO || 'R '
                           || D.WHEEL_INCHES || D.PLY_RATING        TIRE_SIZE,     /*사이즈             */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S043', B.PS_CD)        PS_NM,         /*프리미엄서비스     */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD)       CNT_NM,        /*수량               */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S021', B.PERIOD_CD)    PERIOD_NM,     /*렌탈기간           */
           B.SUM_MON_AMT AS MON_AMT,                                                              /*렌탈료             */
           B.REGI_AMT,                                                             /*렌탈등록비         */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD)      STAT_NM,       /*상태               */
           /* 배송지정보 ------------------------------------------------------------------------------ */
           CASE WHEN Pkg_Exif0004.f_sExif0004O2OAgency(B.AGENCY_CD) = 'Y'  THEN Pkg_Exif0004.f_sExif0004O2OAgencyProcDay(B.ORD_NO) 
                             ELSE SUBSTR(B.PROC_DAY,1,4)||'-'||SUBSTR(B.PROC_DAY,5,2)||'-'||SUBSTR(B.PROC_DAY,7,2) END PROC_DAY,      /*장착일자           */
           E.AGENCY_NM,                                                            /*장착점명           */
           '(' || E.POS_CD | | ') ' || E.CITY || ' ' || E.STREET    AGENCY_ADDR,   /*장착점주소         */
           /* 렌탈정보 -------------------------------------------------------------------------------- */
           C.REGI_AMT                                               ORD_AMT,       /*주문금액           */
           B.PAY_MTHD,                                                             /*결제수단코드       */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R004', B.PAY_MTHD)     PAY_MTHD_NM,   /*결제수단           */
           (SELECT SUM(NVL(RECP_AMT,0)) FROM RTRE0030
             WHERE ORD_NO = B.ORD_NO AND RECP_TP = '90')            REGI_RECP_AMT, /*등록비 결제금액    */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R001', F.BANK_CD)      BANK_NM,       /*은행이름           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('R002', G.CARDCOM_CD)   CARDCOM_NM,    /*카드사이름         */
           F.ACCT_NO                                                ACCT_NO,       /*계좌번호           */
           G.CARD_NO                                                CARD_NO,       /*카드번호           */
           F.CUST_NM                                                BANK_OWNER,    /*예금주             */
           G.CUST_NM                                                CARD_OWNER,    /*카드소유주         */
           DECODE(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),NULL,NULL,
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),1,4)||'-'||
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),5,2)||'-'||
                  SUBSTR(TO_CHAR(DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),B.FC_DAY,NULL)),7,2))
                                                                    REQ_DAY,       /*청구일자           */
           DECODE(SUBSTR(B.FC_DAY,1,6),SUBSTR(TO_CHAR(SYSDATE,'YYYYMMDD'),1,6),C.MON_AMT,0)
                                                                    REQ_AMT,       /*청구금액           */
           DECODE(SUBSTR(B.ORD_NO,1,1),'O','온라인','오프라인')     CHAN_NM,       /*온라인,오프라인    */
           B.STAT_CD                                                STAT_CD,       /*상태코드           */
           SUBSTR(C.PLAN_DAY,1,4)||'-'||SUBSTR(C.PLAN_DAY,5,2)||'-'||SUBSTR(C.PLAN_DAY,7,2)
                                                                    PROC_DAY0,     /*장착요청일         */
           CASE WHEN B.STAT_CD IN ('01','03') THEN 'Y' ELSE 'N' END CANCEL_YN,     /*취소가능여부       */
           CASE WHEN B.STAT_CD = '01' THEN
             CASE WHEN TO_CHAR(B.REG_DT, 'YYYYMMDD')
                     = TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'STSC'
                  WHEN TO_CHAR(B.REG_DT, 'YYYYMMDD')
                     = TO_CHAR(SYSDATE-1, 'YYYYMMDD') THEN
                       CASE WHEN TO_CHAR(SYSDATE, 'HH24MISS')
                              < '170000' THEN 'STSC' END
                       ELSE 'STPC' END
                  ELSE 'NO' END                                     CANCEL_TYPE,   /*취소타입           */
           A.CUST_NO,                                                              /*고객번호           */
           B.PAY_DD,                                                               /*결제일자           */
           (SELECT T.SALE_CD FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_CD, /* 판매상품코드 */
           (SELECT T.SALE_NM FROM RTSD0020 T WHERE T.SALE_CD = B.SALE_CD) AS SALE_NM, /* 판매상품코드 */
           REGEXP_REPLACE(REGEXP_REPLACE (E.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3') AS AGENCY_TEL_NO,  /* 장착점 전화번호 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S014', D.SEASON_CD)    AS SEASON_NM,                                                                                               /* 계절명 */
           H.CLASS_CD,                                                                                                                                                          /* 승용차|SUV 구분 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S015', H.CLASS_CD)    AS CLASS_NM,                                                                                                 /* 승용차|SUV 구분명 */
           H.OE_YN,                                                                                                                                                             /* 순정|호환 구분코드 */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S098', H.OE_YN)    AS OE_YN_NM,  /* 순정|호환 구분명 */
           CASE WHEN C.OS_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'Y' ELSE 'N' END OS_YN,     /*계약종료여부*/ 
           NVL((SELECT  MAX(COUNT(*))
                     FROM    RTSD0109 X
                    WHERE   X.ORD_NO = B.ORD_NO
                      AND    X.ARRE_AMT > 0
                      AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                      AND    X.SCD_STAT = 'S'
                    GROUP   BY X.RECP_TP), 0) ARRE_CNT,     /*연체개월*/                                                                                                     
           G.EXPIRE_YM, /*유효기간*/
           (SELECT LISTAGG(Pkg_Rtcm0051.f_sRtcm0051CodeName('S044',T.PRS_DCD)||'||'||T.SERV_CNT0,',') WITHIN GROUP(ORDER BY T.PRS_DCD) FROM RTSD0013 T WHERE T.ORD_NO = B.ORD_NO) AS PRIMIUM_SVC,  /* 부가서비스 (서비스명, 수량) */
           Pkg_Rtcm0051.f_sRtcm0051Codename('C023', B.INST_CD) AS INST_NM
    FROM   RTSD0100 A,
           RTSD0104 B,
           RTSD0106 C,
           RTSD0005 D,
           RTSD0007 E,
           RTRE0010 F,
           RTRE0020 G,
           RTSD0004 H
    WHERE  A.USE_YN         = 'Y'
    AND    A.CUST_TP        = '02'
    AND    A.BUSL_NO        = REPLACE(v_Busl_No,'-','')
    AND    v_Busl_No  IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    AND    B.ORD_NO         = C.ORD_NO
    AND    C.MAT_CD         = D.MAT_CD
    AND    B.AGENCY_CD      = E.AGENCY_CD
    AND    B.ACC_SEQ        = F.ACC_SEQ(+)
    AND    B.CRD_SEQ        = G.CRD_SEQ(+)
    AND    B.MODEL_CD       = H.MODEL_CD
    AND    B.CONTENTS_CD    = H.CONTENTS_CD
    AND    C.FR_CD          = H.FR_CD
    AND    D.SECTION_WIDTH  = H.SECTION_WIDTH
    AND    D.ASPECT_RATIO   = H.ASPECT_RATIO
    AND    D.WHEEL_INCHES   = H.WHEEL_INCHES 
    AND    D.PLY_RATING     = H.PLY_RATING     
    AND    Pkg_Rtsd0108.f_sRtsd0108Count(B.ORD_NO) = 0                             /*장착안된 건만 조회 */
--    AND    D.USE_YN         = 'Y'
--    AND    H.USE_YN         = 'Y'   
    AND    B.ORD_NO LIKE 'O%'                                                      /*온라인몰           */
    ORDER BY 12 DESC,13;

  END p_sRtsd0108CustOrdInfoNew;
  

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
    ) IS
    
    v_Org_Main_Yn  RTSD0113.ORG_MAIN_YN%TYPE := 'N';
    v_Org_Com_Cd   RTSD0113.ORG_COM_CD%TYPE;
    
    v_User_Grp     RTCM0001.USER_GRP%TYPE;
  BEGIN

    --[20210309_01] kstka 판매인 그룹별로 조회
    IF v_Ord_Agent IS NOT NULL THEN
    
        SELECT USER_GRP 
        INTO v_User_Grp
        FROM RTCM0001
        WHERE USER_ID = v_LOGIN_ID;
        
        --Mr.Roadian인 경우
        IF v_User_Grp = '08' THEN
        
            SELECT NVL(ORG_MAIN_YN, 'N'), ORG_COM_CD 
            INTO v_Org_Main_Yn, v_Org_Com_Cd
            FROM RTSD0113
            WHERE ORD_AGENT = (SELECT ORD_AGENT FROM RTCS0002 WHERE CARMASTER_NU = v_LOGIN_ID);
            
        ELSIF v_User_Grp IN ('03', '09') THEN
        
            SELECT NVL(ORG_MAIN_YN, 'N'), ORG_COM_CD 
            INTO v_Org_Main_Yn, v_Org_Com_Cd
            FROM RTSD0113
            WHERE ORD_AGENT = v_LOGIN_ID;
        
        END IF;
        
    END IF;
    
    OPEN Ref_Cursor FOR
SELECT A.*
  FROM (
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD)            AS AGENCY_NM       , /*장착 대리점       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018', A.SALES_GROUP)  AS SALES_GROUP_NM  , /*지사              */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019', A.SALES_OFFICE) AS SALES_OFFICE_NM , /*지점              */
            A.ORD_NO                                                                    , /*계약번호          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S013', C.PG_CD)        AS PG_NM           , /*Pricing Group Code*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S012', C.PETTERN_CD)   AS PETTERN_NM      , /*패턴코드          */
            C.SECTION_WIDTH                                                             , /*단면폭            */
            C.ASPECT_RATIO                                                              , /*편평비            */
            C.WHEEL_INCHES                                                              , /*인치              */
            C.PLY_RATING                                                                , /*PR(강도)          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022', A.CNT_CD)       AS CNT_NM          , /*타이어본수        */
            A.PROC_DAY                                                                  , /*장착일자          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)    AS PERIOD_NM       , /*계약기간          */
            D.CUST_NM                                                                   , /*고객명            */
            --Pkg_Rtcm0051.f_sRtcm0051Codename('S023', A.REGI_CD)      AS REGI_NM         , /*등록비코드        */
            A.REGI_AMT AS REGI_NM,
            A.MON_AMT                                                                   , /*월렌탈료          */
            E.ORG_AGNM                                               AS ORG_AGNM        , /*판매인명          */
            A.SEASON_CD                                                                 , /*계절구분코드      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)    AS SEASON_NM       , /*계절구분          */
            B.MAT_CD                                                                    , /*상품코드          */
            A.ORD_AGENT,                                                                  /*판매인코드        */
            A.AGENCY_CD
    FROM    RTSD0108 A,
            RTCS0001 B,
            RTSD0005 C,
            RTSD0100 D,
            RTSD0113 E
    WHERE   1=1
--    AND    A.ORD_AGENT   = DECODE(v_Ord_Agent, NULL, A.ORD_AGENT, v_Ord_Agent)
    AND   (  
                    (v_Org_Main_Yn = 'Y' AND A.ORD_AGENT IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd))
            OR      (v_Org_Main_Yn = 'N' AND A.ORD_AGENT   = DECODE( v_Ord_Agent, NULL, A.ORD_AGENT, v_Ord_Agent ))
          )   --[20210309_01] kstka 판매인 그룹별로 조회    
    AND     (v_Proc_Day_S IS NULL OR A.PROC_DAY BETWEEN v_Proc_Day_S AND v_Proc_Day_E)
    AND     A.ORD_NO      = B.ORD_NO
    AND     B.MAT_CD      = C.MAT_CD
    AND     A.CUST_NO     = D.CUST_NO
    AND     A.ORD_AGENT   = E.ORD_AGENT(+)
    ORDER   BY A.ORD_AGENT, A.PROC_DAY, A.ORD_NO ASC
           ) A
           LEFT OUTER JOIN (
            SELECT ORD_AGENT USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0113
            UNION
            SELECT AGENCY_CD USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTSD0007
            UNION
            SELECT CARMASTER_NU USER_ID,
                   RENTAL_GROUP,
                   RENTAL_OFFICE
              FROM RTCS0002
        ) B ON
            A.ORD_AGENT = B.USER_ID
     ) A
    WHERE 1=1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
--                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
                 WHEN ((v_Org_Main_Yn = 'Y' AND A.USER_ID IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd)) OR
                      (v_Org_Main_Yn = 'N' AND v_LOGIN_ID = A.USER_ID)) THEN 1
            ELSE 0 END
      ) = 1
      AND (
            CASE WHEN v_LOGIN_GRP = 'RM' AND A.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_LOGIN_ID) THEN 1
                 WHEN v_LOGIN_GRP IN ('01', '02') THEN 1   -- 사용자그룹 01, 02는 모두 조회 가능
--                 WHEN v_LOGIN_ID = A.USER_ID THEN 1
                 WHEN ((v_Org_Main_Yn = 'Y' AND A.USER_ID IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd)) OR
                      (v_Org_Main_Yn = 'N' AND v_LOGIN_ID = A.USER_ID)) THEN 1
            ELSE 0 END
      ) = 1

    ;

  END p_sRtsd0108AgencyResult2;


  /*****************************************************************************
  -- 장착 정보 조회 - 세금계산서 발행여부 수정 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0108BillSelect (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE,        /*고객번호              */
    v_Bill_Yn        IN RTSD0108.BILL_YN%TYPE         /*세금계산서 발행여부   */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO                                                                    , /*계약번호          */
            B.CUST_NM                                                                   , /*법인명            */
            B.BUSL_NO                                                                   , /*사업자번호        */
            B.CUST_NO                                                                   , /*고객번호          */
            B.REP_NM                                                                    , /*대표자명          */
            B.BUSI_TYPE                                                                 , /*업종              */
            B.BUSI_COND                                                                 , /*업태              */
            B.EMAIL_ADDR                                                                , /*E-Mail            */
            B.MOB_NO                                                                    , /*핸드폰            */
            B.TEL_NO                                                                    , /*전화번호          */
            '('||B.POS_CD||') '||B.ADDR1||' '||B.ADDR2                         CUST_ADDR, /*주소              */
            C_CUSTNM                                                                    , /*담당자명          */
            C_TELNO                                                                     , /*담당자전화        */
            A.ORD_DAY                                                                   , /*계약일자          */
            A.PROC_DAY                                                                  , /*장착일자          */
            DECODE(A.CONTENTS_CD,'0001',TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002',A.MODEL_CD)),
                  TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S002',A.MODEL_CD)) ||' '||
                  TRIM(Pkg_Rtcm0051.f_sRtcm0051Codename('S003',A.CONTENTS_CD))) CLASS_NM, /*차종              */
            A.CAR_NO                                                                    , /*차량번호          */
            C.MAT_CD                                                                    , /*상품코드          */
            Pkg_Rtsd0005.f_sRtsd0005MatName(C.MAT_CD)                             MAT_NM, /*상품명            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)              PERIOD_NM, /*계약기간          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022', A.CNT_CD)                    CNT_NM, /*본수              */
            A.REGI_AMT                                                                  , /*등록비            */
            A.MON_AMT                                                                   , /*렌탈료            */
            A.BILL_YN                                                                     /*세금계산서발행여부*/
    FROM    RTSD0108 A,
            RTSD0100 B,
            RTCS0001 C
    WHERE   (v_Ord_No  IS NULL OR A.ORD_NO  = v_Ord_No)
    AND     (v_Cust_No IS NULL OR A.CUST_NO = v_Cust_No)
    AND     A.BILL_YN  LIKE v_Bill_Yn||'%'
    AND     A.CUST_NO  = B.CUST_NO
    AND     A.ORD_NO   = C.ORD_NO
    AND     B.CUST_TP  = '02'
    ORDER   BY B.CUST_NM, A.PROC_DAY, A.ORD_NO;

  END p_sRtsd0108BillSelect;


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
    ) IS

    e_Error   EXCEPTION;
  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Bill_Yn) IS NULL) OR (v_Bill_Yn NOT IN ('Y','N')) THEN
        v_Return_Message := '세금계산서 발행여부('||v_Bill_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    UPDATE RTSD0108
    SET    BILL_YN = v_Bill_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  ORD_NO  = v_Ord_No;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0108.p_UpdateRtsd0108BillYn(1)', v_ErrorText, v_Return_Message);
      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!. - '||SUBSTR(SQLERRM, 1, 200));
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0108.p_UpdateRtsd0108BillYn(2)', v_ErrorText, v_Return_Message);


  END p_UpdateRtsd0108BillYn;

  /*****************************************************************************
  -- 장착 정보 Select - 고객현황 -  차량정보 획득
  *****************************************************************************/
  PROCEDURE p_sRtsd0108CustAnalysis02 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE         /*고객번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD) MAKER_CD_NM,          /*카메이커      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD) MC_NM,      /*차종          */
            A.CAR_NO                                                                   /*차량번호      */
    FROM    (
            SELECT  A.CAR_NO, A.MAKER_CD, A.MODEL_CD, A.CONTENTS_CD
            FROM    RTSD0108 A
            WHERE   A.CUST_NO   = v_Cust_No
            GROUP   BY A.CAR_NO, A.MAKER_CD, A.MODEL_CD, A.CONTENTS_CD
            ) A;

  END p_sRtsd0108CustAnalysis02;


  /*****************************************************************************
  -- 렌탈분석현황 : 계정 현황
  *****************************************************************************/
  PROCEDURE p_sRtsd0108RentalAnalysisAcc  (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_FDay           IN RTSD0108.PROC_DAY%TYPE,       /*기간FROM              */
    v_EDay           IN RTSD0108.PROC_DAY%TYPE        /*기간TO                */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.YM, A.JOIN_CNT, A.LEAVE_CNT, A.DIFF_CNT,
            -- 누적계정수 = (전월)누적계정수 + (당월)가입계정수 - (당월)이탈계정수
            SUM(A.DIFF_CNT) OVER(ORDER BY 1 ROWS UNBOUNDED PRECEDING ) AS ACCRUE_CNT
    FROM    (
            SELECT  A.YM, NVL(B.JOIN_CNT,0) AS JOIN_CNT, NVL(C.LEAVE_CNT,0) AS LEAVE_CNT,
                    NVL(B.JOIN_CNT,0) - NVL(C.LEAVE_CNT,0) AS DIFF_CNT
            FROM    (
                    -- 선택 기간에 따른 개월수 획득
                    SELECT TO_CHAR(ADD_MONTHS(SDT, LEVEL-1),'YYYYMM') YM
                    FROM   (
                            SELECT TO_DATE(SUBSTR(v_FDay,1,6), 'YYYYMM') SDT,
                                   TO_DATE(SUBSTR(v_EDay,1,6), 'YYYYMM') EDT,
                                   TRUNC(MONTHS_BETWEEN(TO_DATE(v_EDay, 'YYYYMMDD'),TO_DATE(v_FDay, 'YYYYMMDD'))) + 1 CNT
                            FROM DUAL
                            )
                    CONNECT BY LEVEL <= CNT
                    ) A,
                    (-- 가입계정수
                    SELECT  SUBSTR(A.PROC_DAY,1,6) AS YM,COUNT(*) AS JOIN_CNT
                    FROM    RTSD0108 A
                    WHERE   A.PROC_DAY BETWEEN v_FDay AND v_EDay
                    GROUP   BY SUBSTR(A.PROC_DAY,1,6)
                    ORDER   BY SUBSTR(A.PROC_DAY,1,6)
                    ) B,
                    (-- 이탈계정수
                    SELECT  YM, COUNT(*) AS LEAVE_CNT
                    FROM    (
                            SELECT  SUBSTR(CANC_DAY,1,6) AS YM,ORD_NO
                            FROM    RTSD0108
                            WHERE   MFP_YN = 'Y'
                            AND     CANC_DAY BETWEEN v_FDay AND v_EDay
                            UNION   ALL
                            SELECT  SUBSTR(OS_DAY,1,6) AS YM, ORD_NO
                            FROM    RTSD0108
                            WHERE   OS_DAY BETWEEN v_FDay AND v_EDay
                            AND     MFP_YN = 'N'
                            )
                    GROUP   BY YM
                    ) C
            WHERE   A.YM = B.YM(+)
            AND     A.YM = C.YM(+)
            ) A
    ORDER   BY A.YM;

  END p_sRtsd0108RentalAnalysisAcc;

  /*****************************************************************************
  -- 2+1 전륜/후륜 분리 계약 조회
  *****************************************************************************/
  FUNCTION f_sRtsd0108Zero2Plus1 (
    v_OrdNo        IN RTSD0108.ORD_NO%TYPE         /*계약번호              */
    ) RETURN VARCHAR2 IS

    v_OrdDay    RTSD0108.ORD_DAY%TYPE;
    v_CarNo     RTSD0108.CAR_NO%TYPE;
    v_CustNo    RTSD0108.CUST_NO%TYPE;
    v_OrdNo2    RTSD0108.ORD_NO%TYPE;
    v_ServCnt0  RTSD0013.SERV_CNT0%TYPE;
    v_MatCd     RTSD0106.MAT_CD%TYPE;
  BEGIN

    --계약정보 조회
    SELECT B.CAR_NO, B.CUST_NO, B.ORD_DAY, A.MAT_CD 
        INTO v_CarNo, v_CustNo, v_OrdDay, v_MatCd 
        FROM RTSD0106 A, RTSD0108 B 
    WHERE B.ORD_NO = v_OrdNo
    AND A.ORD_NO = B.ORD_NO 
    AND B.CNT_CD = '02';
    
    --전륜/후륜 동일차량 기준
    --1.차량번호 동일
    --2.같은월 주문
    --3.2본계약
    --4.전륜/후륜 다른상품 
    SELECT B.ORD_NO 
        INTO v_OrdNo2 
        FROM RTSD0106 A, RTSD0108 B 
    WHERE B.CUST_NO = v_CustNo 
    AND A.ORD_NO = B.ORD_NO
    AND B.CAR_NO = v_CarNo 
    AND B.CNT_CD = '02'
    AND SUBSTR(B.ORD_DAY, 0, 6) = SUBSTR(v_OrdDay, 0, 6) 
    AND B.ORD_NO NOT IN (v_OrdNo)
    AND A.MAT_CD NOT IN (v_MatCd);
    
    --서비스할당내역 존재하면
    SELECT SERV_CNT0 
        INTO v_ServCnt0 
        FROM RTSD0013 
    WHERE ORD_NO = v_OrdNo 
    AND PRS_DCD = 'B00003';
    
    IF v_ServCnt0 <= 0 THEN
        v_OrdNo2 := NULL;
    END IF;

    RETURN v_OrdNo2;
  
  EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
          
  END f_sRtsd0108Zero2Plus1; 
 
  /*****************************************************************************
  -- 장착주문리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0108OrdList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0108.CUST_NO%TYPE         /*고객번호              */
    ) IS
  BEGIN

    OPEN Ref_Cursor FOR
    SELECT ROW_NUMBER() OVER(PARTITION BY CUST_NO ORDER BY ORD_NO) NUM
           , A.CUST_NO
           , A.ORD_NO
           , B.CD_NM || ' ' || C.CD_NM || ' ' || E.CD_NM || '/' || A.CAR_NO || '/' || A.ORD_DAY || '/' || A.CNT_CD || '/' || D.CD_NM CD_TEXT
    FROM RTSD0108 A, RTCM0051 B, RTCM0051 C, RTCM0051 D, RTCM0051 E 
    WHERE A.MAKER_CD = B.CD AND B.CD_GRP_CD = 'S001'
    AND A.MODEL_CD = C.CD AND C.CD_GRP_CD = 'S002'
    AND A.CONTENTS_CD = E.CD AND E.CD_GRP_CD = 'S003'
    AND A.PS_CD = D.CD AND D.CD_GRP_CD = 'S043'
    AND A.CUST_NO = DECODE(v_Cust_No, NULL, A.CUST_NO, v_Cust_No);

  END p_sRtsd0108OrdList;

  /*****************************************************************************
  -- 장착 정보 - 해당 계약번호의 중도완납여부 확인
  *****************************************************************************/
  FUNCTION f_sRtsd0108Mfp_Yn(
    v_Ord_No         IN RTSD0108.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR IS

    v_Mfp_Yn    RTSD0108.MFP_YN%TYPE DEFAULT NULL;      /*계약타이어개수      */

  BEGIN

    SELECT CASE WHEN MFP_YN = 'Y' THEN 'Y'
                WHEN OS_DAY <= TO_CHAR(SYSDATE, 'YYYYMMDD') THEN 'Y'
           ELSE 'N' END AS  MFP_YN
    INTO    v_Mfp_Yn
    FROM    RTSD0108
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Mfp_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0108Mfp_Yn;
  
END Pkg_Rtsd0108;