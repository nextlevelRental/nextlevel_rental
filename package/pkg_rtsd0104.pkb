CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0104 AS 
/*******************************************************************************
   NAME      Pkg_Rtsd0104
   PURPOSE   계약 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
   1.1        2017-03-13  wjim             [20170313_01] B2B일시불 가격정책 추가에 따른 수정
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
   1.3        2017-09-28  wjim             [20170922_03] 판매인주문리스트 조회 항목 추가
   1.4        2017-10-27  wjim             [20171027_02] 주문현황조회 항목 추가
                                           - 가계약번호, 재렌탈가능일(from~to)
   1.5        2017-11-14  wjim             [20171114_01] 고객별 차량대수제한, 장착제한개수 보완
   1.6        2017-12-19  wjim             [20171219_01] 수금내역조회 조회조건 추가
   1.7        2018-03-01  wjim             [20180301_03] 주문현황리스트 조회항목 추가
   1.8        2019-03-01  wjim             [20190301_01] 주문현황리스트에 전체 조회권한 조정 
   1.9        2019-03-22  wjim             [20190321_01] 위메프 전용상품 등록비 0원 검증 추가(임시)
   1.10       2019-05-24  wjim             [20190524_01] 판매인주문리스트 조회항목 추가
   1.11       2019-11-06  kstka            [20191106_01] 블랙리스트 수기등록 (고객번호 및 차량번호)
   1.12       2019-11-06  kstka            [20191106_02] 온라인채널 주문등록횟수 제한
   1.13       2019-11-15  kstka            [20191115_01] SUM함수 -> COUNT함수로 변경
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가 
   1.15       2019-12-21  kstka            [2019-00359563] O2O연계 컬럼 추가
   1.16       2019-12-30  kstka            [2019-00367289] 자유렌탈 1본 계약 불가    
   1.17       2020-04-10  kstka            [2020-01] USAGE 구분 (Pkg_Exif0002, Pkg_Exif0003)
   1.18       2021-02-18  kstka            [20210218_01] 렌탈료 할인금액 검증시 렌탈료 할인률 계산 로직 변경
   1.19       2022-01-04  kstka            [20220104_01] 채권매각일자 컬럼 추가
   1.20       2022-01-17  kstka            [20220117_01] kstka 렌탈고객등록 불가 체크로직 추가
   1.21       2022-04-06  kstka            [20220406_01] TMS고도화 Reassign대응 
*******************************************************************************/

  /*****************************************************************************
  -- 계약 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104Count(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN NUMBER IS
    v_Curr_Cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_Curr_Cunt
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Curr_Cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104Count;


  /*****************************************************************************
  -- 계약 정보 Select
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
  *****************************************************************************/
  PROCEDURE p_sRtsd0104 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*주문번호            */
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
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S032', A.STAT_CD) AS STAT_NM,
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
            A.SEASON_CD,                 /*시즌구분            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            B.AGENCY_NM,                 /*대리점명            */
            A.SALE_CD,                   /*판매코드            */
            (SELECT S.SALE_NM FROM RTSD0020 S WHERE S.SALE_CD = A.SALE_CD) AS SALE_NM,   /* 판매상품명 */
            (SELECT S.PRDT_GRP FROM RTSD0020 S WHERE S.SALE_CD = A.SALE_CD) AS PRDT_GRP,           /* 판매유형Lv1 */
            (SELECT S.PRDT_GRP_DTL FROM RTSD0020 S WHERE S.SALE_CD = A.SALE_CD) AS PRDT_GRP_DTL,   /* 판매유형 Lv2 */
            --C.SALE_NM,                   /*판매상품명          */
            --Pkg_Rtsd0020.f_sRtcm0051Code('S205',C.PRDT_GRP) AS PRDT_GRP,                 /* 상품군코드(렌탈상품코드) */
            --Pkg_Rtsd0020.f_sRtcm0051CodeName('S205',C.PRDT_GRP) AS PRDT_GRP_NM,          /* 상품군명(렌탈상품명)    */
            --Pkg_Rtsd0020.f_sRtcm0051Code('S214',C.CHAN_CD) AS CHAN_CD,                   /* 채널구분코드            */
            --Pkg_Rtsd0020.f_sRtcm0051CodeName('S214',C.CHAN_CD) AS CHAN_NM,               /* 채널구분코드명          */
            --Pkg_Rtsd0020.f_sRtcm0051Code('S096',C.HSHOP_GB) AS HSHOP_GB,                 /* 홈쇼핑구분코드          */
            --Pkg_Rtsd0020.f_sRtcm0051CodeName('S096',C.HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명        */
            A.PAY_GB,
            TO_NUMBER(CASE WHEN A.SALE_CD IS NULL THEN Pkg_Rtcm0051.f_sRtcm0051CodeName('S023', A.REGI_CD)
            ELSE TO_CHAR(A.REGI_AMT)
            END) AS REGI_AMT,
            A.SUM_MON_AMT,
            A.MON_AMT,
            A.INST_CD,                                                          /*장착유형코드          */ --[2019-00359563]
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S304', A.INST_CD) AS INST_NM,     /*장착유형명            */ --[2019-00359563]
            A.INST_TM,                                                          /*장착희망시간          */ --[2019-00359563]
            A.INST1_POSCD,                                                      /*장착주소-우편번호     */ --[2019-00359563]
            A.INST1_ADDR1,                                                      /*장착주소-주소         */ --[2019-00359563]
            A.INST1_ADDR2,                                                      /*장착주소-상세주소     */ --[2019-00359563]
            A.INST2_POSCD,                                                      /*배송주소-우편번호     */ --[2019-00359563]
            A.INST2_ADDR1,                                                      /*배송주소-주소         */ --[2019-00359563]
            A.INST2_ADDR2                                                       /*배송주소-상세주소     */ --[2019-00359563]            
    FROM    RTSD0104 A,
            RTSD0007 B
            --RTSD0020 C
    WHERE   A.AGENCY_CD = B.AGENCY_CD(+)
    AND     A.ORD_NO    = v_Ord_No;
    --AND     A.SALE_CD   = C.SALE_CD;

  END p_sRtsd0104;

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
    v_Oms_Orderno    IN RTSD0104.OMS_ORDERNO%TYPE,    /*OMS 주문번호     */ --[20220406_01]
    v_Out_Stock_Yn   IN RTSD0104.OUT_STOCK_YN%TYPE,   /*자사재고 사용여부     */ --[22210727_01] [20221107_1]
    v_Out_Stock_Type IN RTSD0104.OUT_STOCK_TYPE%TYPE, /*자사재고 미사용사유     */ --[20221107_01]
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0104 (
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
            REGI_AMT,
            SUM_MON_AMT,
            MON_AMT,
            SALE_CD,
            PAY_GB,
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
            OMS_ORDERNO,
            INST_DAY,
            OUT_STOCK_YN,
            OUT_STOCK_TYPE
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
            v_Car_No,
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
            v_Cmsag_Yn ,
            v_Con_Mthd ,
            v_Pcert_Yn ,
            v_Fc_Day   ,
            v_Ag_Day   ,
            v_Ag_Seq   ,
            v_Input_Dt ,
            v_File_Path,
            v_File_Name,
            v_Tcgrp_No,
            v_Vbeln,
            v_Season_Cd,
            v_Regi_Amt,
            v_Sum_Mon_Amt,
            v_Mon_Amt,
            v_Sale_Cd,
            v_Pay_Gb,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Inst_Cd,    
            v_Inst_Tm,    
            v_Inst1_Poscd,
            v_Inst1_Addr1,
            v_Inst1_Addr2,
            v_Inst2_Poscd,
            v_Inst2_Addr1,
            v_Inst2_Addr2,
            v_Tms_OrderId,
            v_Oms_OrderNo,
            v_Proc_Day,
            v_Out_Stock_Yn,
            v_Out_Stock_Type
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0104;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0104
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
           CAR_NO       = v_Car_No,
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
           CMSAG_YN     = v_Cmsag_Yn ,
           CON_MTHD     = v_Con_Mthd ,
           PCERT_YN     = v_Pcert_Yn ,
           FC_DAY       = v_Fc_Day   ,
           AG_DAY       = v_Ag_Day   ,
           AG_SEQ       = v_Ag_Seq   ,
           INPUT_DT     = v_Input_Dt ,
           FILE_PATH    = v_File_Path,
           FILE_NAME    = v_File_Name,
           TCGRP_NO     = v_Tcgrp_No,
           VBELN        = v_Vbeln,
           SEASON_CD    = v_Season_Cd,
           REGI_AMT     = v_Regi_Amt,
           SUM_MON_AMT  = v_Sum_Mon_Amt,
           MON_AMT      = v_Mon_Amt,
           SALE_CD      = v_Sale_Cd,
           PAY_GB       = v_Pay_Gb,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE,
           INST_CD      = v_Inst_Cd,
           INST_TM      = v_Inst_Tm,
           INST1_POSCD  = v_Inst1_Poscd,
           INST1_ADDR1  = v_Inst1_Addr1,
           INST1_ADDR2  = v_Inst1_Addr2,
           INST2_POSCD  = v_Inst2_Poscd,
           INST2_ADDR1  = v_Inst2_Addr1,
           INST2_ADDR2  = v_Inst2_Addr2
    WHERE  ORD_NO       = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0104;

  /*****************************************************************************
  -- 계약 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0104 (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE,        /*상태                  */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

    v_Add_No VARCHAR2(20);
  BEGIN

    UPDATE RTSD0104
    SET    STAT_CD = v_Stat_Cd,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  ORD_NO  = v_Ord_No;

    SELECT ORD_NO INTO v_Add_No FROM RTSD0104 WHERE REQ_TEXT = v_Ord_No;

    BEGIN

        IF v_Add_No IS NOT NULL THEN

            UPDATE RTSD0104
            SET    REQ_TEXT = ''
            WHERE  ORD_NO  = v_Add_No;

            UPDATE RTSD0108
            SET    REQ_TEXT = ''
            WHERE  ORD_NO  = v_Add_No;

        END IF;

    END;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0104;

  /*****************************************************************************
  -- 계약 정보 관리(IUD)

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-14  jemcarry         1. Created this package body.
   1.5        2017-11-14  wjim             [20171114_01] 고객별 장착제한개수 판단기준 보완
                                           - 겨울용타이어 신규 주문 시도 시 판단 Skip
   1.9        2019-03-22  wjim             [20190321_01] 위메프 전용상품 등록비 0원 검증 추가(임시)
   1.11       2019-11-06  kstka            [20191106_01] 블랙리스트 수기등록 (고객번호 및 차량번호)
   1.12       2019-11-06  kstka            [20191106_02] 온라인채널 주문등록횟수 제한
   1.14       2019-12-03  wjim             [2019-00359563] O2O 관련 항목 추가
   1.16       2019-12-30  kstka            [2019-00367289] 자유렌탈 1본 계약 불가
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
    ) IS

    e_Error EXCEPTION;
    v_Sales_GroupB   RTSD0104.SALES_GROUP%TYPE;    /*지사                  */
    v_Sales_OfficeB  RTSD0104.SALES_OFFICE%TYPE;   /*지점                  */

    v_Add_OrdNo RTSD0104.ORD_NO%TYPE;
    v_User_Grp RTCM0001.USER_GRP%TYPE;
    
    v_Cnt NUMBER;
    
    v_Dely_Day RTRE0100.DELY_DAY%TYPE;
    
    v_Prdt_Grp_Dtl RTSD0020.PRDT_GRP_DTL%TYPE;
    
    v_Age   NUMBER;     --법정생년월일 기준 만나이 [20190903_02]
    v_Birth_Day VARCHAR2(8); --고객생년월일 [20220117_01]
  BEGIN

    v_User_Grp := Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id);
    --영업관리자이고 대리점주문인경우 BLOCK처리
    IF TO_CHAR(SYSDATE, 'YYYYMMDD') = '20211231' THEN
        IF v_User_Grp NOT IN ('01') THEN
            IF v_Chan_Cd IN ('01') THEN
                v_Return_Message := '당일은 주문 접숙가 불가합니다.';
                RAISE e_Error;
            END IF;
        END IF;
    END IF;
    
    --[20191106_01]블랙리스트 고객정보 수기등록 (고객번호 및 차량번호)
    IF v_Cust_No IN ('1000022919', '1000133604', '1000170614', '1000143653', '1000164638', '1000164640') THEN
        v_Return_Message := '해당고객은 주문이 불가합니다. 관리자에게 문의하세요.';
        RAISE e_Error;
    END IF;
    
    IF v_Car_No IN ('35소2400') THEN
        v_Return_Message := '해당차량번호는 주문이 불가합니다. 관리자에게 문의하세요.';
        RAISE e_Error;
    END IF;
    
    --[2019-00367289]자유렌탈상품의 경우 1본 계약 불가요청
    IF v_Sale_Cd IN ('S000000001') AND v_Cnt_Cd = '01' THEN
        v_Return_Message := '자유렌탈상품은 1본 계약이 불가합니다. 관리자에게 문의하세요.!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_Srtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Chan_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S030', v_Chan_Cd)) THEN
        v_Return_Message := '채널구분('||v_Chan_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Stat_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S032', v_Stat_Cd)) THEN
        v_Return_Message := '상태('||v_Stat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_Id) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S029', v_Ord_Id)) THEN
        v_Return_Message := '주문구분('||v_Ord_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Sale_Id) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S031', v_Sale_Id)) THEN
        v_Return_Message := '계약유형('||v_Sale_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Period_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S021', v_Period_Cd)) THEN
        v_Return_Message := '기간코드('||v_Period_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cnt_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S022', v_Cnt_Cd)) THEN
        v_Return_Message := '타이어본수('||v_Cnt_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /*
    IF (TRIM(v_Regi_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.F_Srtcm0051Count('S023', v_Regi_Cd)) THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    */
    IF TRIM(v_Regi_Cd) IS NULL THEN
        v_Return_Message := '등록비코드('||v_Regi_Cd||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_Tp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S024', v_Cust_Tp)) THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Grp_Yn ) IS NULL THEN
        v_Return_Message := '고객결합여부('||v_Grp_Yn ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Maker_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S001', v_Maker_Cd)) THEN
        v_Return_Message := '카메이커('||v_Maker_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Model_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S002', v_Model_Cd)) THEN
        v_Return_Message := '차종('||v_Model_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Contents_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S003', v_Contents_Cd)) THEN
        v_Return_Message := '사양('||v_Contents_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Fr_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S004', v_Fr_Cd)) THEN
        v_Return_Message := '전후 구분('||v_Fr_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Car_No) IS NULL THEN
        v_Return_Message := '차량번호('||v_Car_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Car_Owner) IS NULL THEN
        v_Return_Message := '차량소유자('||v_Car_Owner ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_c_Mileage) IS NULL THEN
        v_Return_Message := '현재주행거리('||v_c_Mileage ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /*IF TRIM(v_Camp_Yn ) IS NULL THEN
        v_Return_Message := '캠페인적용여부('||v_Camp_Yn ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;*/

    IF (TRIM(v_Pay_Mthd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('R004', v_Pay_Mthd)) THEN
        v_Return_Message := '결제구분('||v_Pay_Mthd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    /*계좌(A), 카드(C)*/
    IF TRIM(v_Pay_Mthd) = 'A' THEN
        IF TRIM(v_Acc_Chk) IS NULL THEN
            v_Return_Message := '계좌확인상태('||v_Acc_Chk ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Acc_Stat) IS NULL THEN
            v_Return_Message := '계좌신청상태('||v_Acc_Stat ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    ELSIF TRIM(v_Pay_Mthd) = 'C' THEN
        IF TRIM(V_BKEY_CHK ) IS NULL THEN
            v_Return_Message := '배치키생성여부(카드)('||V_BKEY_CHK ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Batch_Key) IS NULL THEN
            v_Return_Message := 'BATCH KEY('||v_Batch_Key ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;
    ELSE
        v_Return_Message := '결제구분('||v_Pay_Mthd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    IF TRIM(v_Pay_Dd) IS NULL THEN
        v_Return_Message := '이체일('||v_Pay_Dd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Bill_Yn) IS NULL THEN
        v_Return_Message := '세금계산서발행여부('||v_Bill_Yn ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Ord_Day) IS NULL THEN
        v_Return_Message := '접수일자('||v_Ord_Day ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Proc_Day) IS NULL THEN
        v_Return_Message := '장착일자('||v_Proc_Day ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- [20170316_01] B2B일시불(09) 추가
    IF (TRIM(v_Chan_Cd) = '01') OR (TRIM(v_Chan_Cd) = '05') OR (TRIM(v_Chan_Cd) = '06') OR (TRIM(v_Chan_Cd) = '09') THEN
        IF TRIM(v_Agency_Cd) IS NULL THEN
            v_Return_Message := '장착 대리점('||v_Agency_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Sales_Group) IS NULL THEN
            v_Return_Message := '지사('||v_Sales_Group ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF TRIM(v_Sales_Office) IS NULL THEN
            v_Return_Message := '지점('||v_Sales_Office ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF  ( TRIM(v_Reg_Id) != 'ONL_SYS' ) AND ((TRIM(v_Ps_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S043', v_Ps_Cd))) THEN
            v_Return_Message := '프리미엄서비스코드('||v_Ps_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF ( (TRIM(v_Season_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S014', v_Season_Cd)) ) THEN
            v_Return_Message := '계절구분('||v_Season_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF( (TRIM(v_Season_Cd) = '02') AND ('01' = PKG_RTSD0007.f_sRtsd0007GetSeasonGbn(TRIM(v_Agency_Cd))) ) THEN
            v_Return_Message := '겨울용타이어 장착가능한 렌탈전문점이 아닙니다. 계약저장 불가능합니다.';
            RAISE e_Error;
        END IF;

    END IF;

    IF (TRIM(v_Chan_Cd) = '03') OR (TRIM(v_Chan_Cd) = '04') THEN
        IF TRIM(v_Agency_Cd) IS NULL THEN
            v_Return_Message := '장착 대리점('||v_Agency_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        --IF TRIM(v_Sales_Group) IS NULL THEN
        --    v_Return_Message := '지사('||v_Sales_Group ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        --   RAISE e_Error;
        --END IF;

        --IF TRIM(v_Sales_Office) IS NULL THEN
        --    v_Return_Message := '지점('||v_Sales_Office ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        --    RAISE e_Error;
        --END IF;

        IF  ( TRIM(v_Reg_Id) != 'ONL_SYS' ) AND ((TRIM(v_Ps_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S043', v_Ps_Cd))) THEN
            v_Return_Message := '프리미엄서비스코드('||v_Ps_Cd ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF ( (TRIM(v_Season_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S014', v_Season_Cd)) ) THEN
            v_Return_Message := '계절구분('||v_Season_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        IF( (TRIM(v_Season_Cd) = '02') AND ('01' = PKG_RTSD0007.f_sRtsd0007GetSeasonGbn(TRIM(v_Agency_Cd))) ) THEN
            v_Return_Message := '겨울용타이어 장착가능한 렌탈전문점이 아닙니다. 계약저장 불가능합니다.';
            RAISE e_Error;
        END IF;

    END IF;
/* -- 2016-10-13 임욱재 윈터타이어 창고보관 가능여부 무시요청
    IF (TRIM(v_Season_Cd) = '02') AND (0 = Pkg_Rtcs0202.f_sRtcs0202UseCntCheck(TRIM(v_Agency_Cd))) THEN
        v_Return_Message := '보관할 창고가 없으므로 겨울용 타이어는 등록할 수가 없습니다.';
        RAISE e_Error;
    END IF;
*/
    --[20210531_01] 자가임대점인 경우 렌탈 주문 BLOCK처리    
    IF Pkg_Rtcm0051.f_sRtcm0051UseCount('S310', v_Agency_Cd) > 0 THEN
        v_Return_Message := '현재 자가임대점은 렌탈 주문이 불가합니다.!';
        RAISE e_Error;
    END IF;
    
    --[20210916_01] kstka 취소사유에 의한 주문 block처리, 추후 적용
--    IF 'Y' = Pkg_Rtsd0104.f_sRtsdOrdBlockYn(v_Ord_No) THEN
--        v_Return_Message := '취소사유가 존재해 주문이 BLOCK처리 되어 있습니다.!';
--        RAISE e_Error;
--    END IF;
    
    --[20210531_01] 온라인 주문 중 판매인이 있는경우 주문 BLOCK (임직원상품만)
    IF SUBSTR(v_Ord_No, 1, 1) = 'O' AND v_Ord_Agent IS NOT NULL THEN
        
        SELECT PRDT_GRP_DTL 
        INTO v_Prdt_Grp_Dtl 
        FROM RTSD0020 
        WHERE SALE_CD = v_Sale_Cd;
        
        IF v_Prdt_Grp_Dtl = '02' THEN
            v_Return_Message := '임직원 전용 상품은 판매인 선택이 불가합니다.';
            RAISE e_Error;
        END IF;
        
    END IF;
     
    SELECT MAX(DELY_DAY)
    INTO v_Dely_Day
    FROM RTRE0100;
    
    --kstka 연체대상주문 block처리
    IF Pkg_Rtre0100.f_sRtre0100BMonthDelyAmt(v_Cust_No, NULL, v_Dely_Day) > 0 THEN
        v_Return_Message := '해당고객은 연체가 존재하여 주문이 불가합니다.';
        RAISE e_Error;
    END IF;
    
-- 20200406 kstka 당일장착이 가능함에 따라 거점이 아닌 경우에만 날짜 유효성 체크
    IF (TRIM(v_Chan_Cd) = '04') OR (TRIM(v_Chan_Cd) = '06') OR (TRIM(v_Chan_Cd) = '03') THEN
        IF Pkg_Exif0004.f_sExif0004O2OAgency(v_Agency_Cd) = 'N' THEN
            IF Pkg_Rtcm0060.f_sRtcm0060AfterInDayByTerm(v_Ord_Day,v_Proc_Day, 2) = 0 THEN
                v_Return_Message := '장착일자('||v_Proc_Day||')는 휴일이거나 10일을 초과하였습니다.';
                RAISE e_Error;
            END IF;
        END IF;
    END IF;

    v_Fc_Day := Pkg_Rtsd0109.f_sRtsd0109Demddt(1, v_Proc_Day, v_Pay_Dd);

    -- 2015-12-04 온라인 계약의 경우 지점/지사가 누락된 경우 존재 - 대리점코드 기준으로 지점/지사 정보 생성되도록 - 정석춘
    IF (v_Sales_Group IS NULL) OR (v_Sales_Office IS NULL) THEN

        BEGIN

            SELECT SALES_GROUP, SALES_OFFICE
            INTO   v_Sales_GroupB, v_Sales_OfficeB
            FROM   RTSD0007
            WHERE  AGENCY_CD = v_Agency_Cd;

        EXCEPTION
          WHEN OTHERS THEN
            v_Return_Message := '대리점코드 기준으로 지점/지사 정보를 획득할 수 없음으로 등록할 수가 없습니다.';
            RAISE e_Error;
        END;

    ELSE
        v_Sales_GroupB  := v_Sales_Group;
        v_Sales_OfficeB := v_Sales_Office;
    END IF;

    --20200827 KSTKA 대리점, 방판, 타이어테크 주문인 경우 
    --온라인 주문이 취소된 내역이 있으면 주문 BLOCK 처리
    v_User_Grp := Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id);
    
    IF v_Chan_Cd IN ('01', '05') AND v_User_Grp NOT IN ('01') THEN
    
        SELECT COUNT(*) 
        INTO v_Cnt
        FROM RTSD0104
        WHERE CUST_NO = v_Cust_No
        AND CHAN_CD IN ('02', '03', '04')
        AND STAT_CD = '06'
        AND ADD_MONTHS(ORD_DAY, 1) >= TO_CHAR(SYSDATE, 'YYYYMMDD');
        
        IF v_Cnt > 0 THEN
            v_Return_Message := '1달내 취소된 온라인 주문이 존재 합니다.';
            RAISE e_Error;
        END IF;
    
    END IF;
    
    IF 0 = f_sRtsd0104Count(v_Ord_No) THEN
    
        -- [20220117_01] kstka 렌탈고객등록 불가 체크로직 위치 변경
        SELECT BIRTH_DAY INTO v_Birth_Day FROM RTSD0100 WHERE CUST_NO = v_Cust_No;
        
        IF TRIM(v_Birth_Day) IS NOT NULL THEN
            
            SELECT TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_DATE(v_Birth_Day,'YYYYMMDD')) / 12) INTO v_Age FROM  dual;
            
            IF v_Age < 19 THEN
                v_Return_Message := '만나이('||v_Age ||') : 19세 이상만 고객등록 가능합니다!';
                RAISE e_Error;
            END IF;
            
            -- [20211229_01] 만 75세 이상 고객등록 불가
            IF v_Age >= 75 THEN
                v_Return_Message := '렌탈 가입 가능 연령이 아니어서 렌탈이 불가능합니다!';
                RAISE e_Error;
            END IF;
        END IF;
        

        IF (TRIM(v_Chan_Cd) = '01') OR (TRIM(v_Chan_Cd) = '05') THEN
            IF Pkg_Rtcm0051.f_sRtcm0051Cd('S068') <= f_sRtsd0104SetCarCount(v_Cust_No,TRIM(v_Car_No)) THEN
                v_Return_Message := '저장 가능한 총 차량수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S068') ||')를 초과하였습니다.';
                RAISE e_Error;
            END IF;

            -- [20171114_01] 겨울용 타이어 주문 시에는 장착가능개수 판단 skip
            IF (v_Season_Cd <> '02') AND (Pkg_Rtcm0051.f_sRtcm0051Cd('S069') < f_sRtsd0104SetTireNbCount(v_Cust_No, TRIM(v_Car_No)) + TO_NUMBER(v_Cnt_Cd)) THEN
                v_Return_Message := '저장 가능한 총 타이어본수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S069') ||')를 초과하였습니다.';
                RAISE e_Error;
            END IF;

            IF Pkg_Rtsd0007.f_sRtsd0007SetOlimitCntCount(v_Agency_Cd) <= f_sRtsd0104SetOlimitCnt(v_Ord_Day, v_Agency_Cd) THEN
                v_Return_Message := '대리점 일일 계약가능한 건수를 초과하였습니다.';
                RAISE e_Error;
            END IF;
        END IF;

        --[20191106_02]온라인 채널 장착가능 수량 제한
        IF (TRIM(v_Chan_Cd) = '02') OR (TRIM(v_Chan_Cd) = '03') OR (TRIM(v_Chan_Cd) = '04') THEN
            IF Pkg_Rtcm0051.f_sRtcm0051Cd('S068') <= f_sRtsd0104SetCarCount(v_Cust_No,TRIM(v_Car_No)) THEN
                v_Return_Message := '저장 가능한 총 차량수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S068') ||')를 초과하였습니다.';
                RAISE e_Error;
            END IF;

            -- [20171114_01] 겨울용 타이어 주문 시에는 장착가능개수 판단 skip
            IF (v_Season_Cd <> '02') AND (Pkg_Rtcm0051.f_sRtcm0051Cd('S069') < f_sRtsd0104SetTireNbCount(v_Cust_No, TRIM(v_Car_No)) + TO_NUMBER(v_Cnt_Cd)) THEN
                v_Return_Message := '저장 가능한 총 타이어본수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S069') ||')를 초과하였습니다.';
                RAISE e_Error;
            END IF;

            --IF Pkg_Rtsd0007.f_sRtsd0007SetOlimitCntCount(v_Agency_Cd) <= f_sRtsd0104SetOlimitCnt(v_Ord_Day, v_Agency_Cd) THEN
            --    v_Return_Message := '대리점 일일 계약가능한 건수를 초과하였습니다.';
            --    RAISE e_Error;
            --END IF;
        END IF;
        
--        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0104.p_sRtsd0104ChkSumMonAtm(1)', 'v_Ord_No  ', v_Ord_No  );
--        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0104.p_sRtsd0104ChkSumMonAtm(1)', 'v_Sale_Cd ', v_Sale_Cd );
--        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0104.p_sRtsd0104ChkSumMonAtm(1)', 'v_Regi_Amt', v_Regi_Amt);
        
        -- [20190321_01] 위메프 전용상품 등록비 0원 검증(임시, 개발기와 운영기 코드가 다름에 주의!) 
        IF v_Sale_Cd = 'S000000041' AND v_Regi_Amt <> 0 THEN
            v_Return_Message := '위메프 스마트렌탈 상품('||v_Sale_Cd||') : 최초 결제등록비가 0원이어야 합니다';
            RAISE e_Error;
        END IF;

        IF v_Ord_No IS NULL OR TRIM(v_Ord_No) = '' THEN
            v_Ord_No := f_sRtsd0104Ordno(v_Chan_Cd);
        END IF;

        IF 0 != f_InsertRtsd0104(v_Ord_No, v_Ord_Day, v_Ord_Id, v_Chan_Cd,
                                 v_Sale_Id, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd,
                                 v_Camp_Yn, v_c_Dcrate, v_c_Dcamt, v_Cust_No,
                                 v_Cust_Tp, v_Safekey, v_Grp_Yn, v_Grp_No,
                                 v_g_Dcrate, v_G_Dcamt, v_L_Dcrate, v_L_Dcamt,
                                 v_F_Dcrate, v_F_Dcamt, '', v_Stat_Cd,
                                 v_Proc_Day, v_CANC_DAY, v_Agency_Cd, v_Sales_GroupB,
                                 v_Sales_OfficeB, v_Eng_Nm, v_Ag_Desc, v_Maker_Cd,
                                 v_Model_Cd, v_Contents_Cd, v_Fr_Cd, TRIM(v_Car_No),
                                 v_Car_Owner, v_c_Mileage, v_Req_Text, v_Pay_Mthd,
                                 v_Pay_Dd, v_Acc_Seq, v_CRD_SEQ, v_Acc_Chk,
                                 v_Acc_Stat, v_Bkey_Chk, v_Batch_Key, v_Bill_Yn,
                                 v_Crdt_Stat, v_Cert_Cd, v_Cert_Stat, v_Ord_Agent,
                                 v_Org_Cd, v_Org_Hq, v_Org_L1, v_Org_L2,
                                 v_Org_L3, v_Org_L4, v_Ins_Org, v_Ps_Cd,
                                 v_Cmsag_Yn, v_Con_Mthd, v_Pcert_Yn, v_Fc_Day,
                                 v_Ag_Day, v_Ag_Seq, v_Input_Dt, v_File_Path, v_File_Name,
                                 v_Tcgrp_No, v_Vbeln, v_Season_Cd, v_Regi_Amt, v_Sum_Mon_Amt,
                                 v_Mon_Amt, v_Sale_Cd, v_Pay_Gb, v_Reg_Id,
                                 v_Inst_Cd, v_Inst_Tm, v_Inst1_Poscd, v_Inst1_Addr1, v_Inst1_Addr2,
                                 v_Inst2_Poscd, v_Inst2_Addr1, v_Inst2_Addr2, v_Tms_OrderId, NULL,
                                 NVL(v_Out_Stock_Yn, 'N'), NVL(v_Out_Stock_Type, '00'), v_Errortext) THEN
            v_Return_Message := '계약 등록 실패!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;

        END IF;

        IF v_Sale_Id IN ('04') THEN
            --재렌탈인경우 재렌탈 대상 주문번호를 입력
            v_Add_OrdNo := PKG_COMM.f_sReRentalOrdNo(v_Cust_No, v_Safekey);
        END IF;

        IF 0 != f_UpdateRtsd0104ReRental(v_Ord_No, v_Add_OrdNo, v_Errortext) THEN

            v_Return_Message := '재렌탈 정보 등록 실패!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF (TRIM(v_Chan_Cd) = '01') OR (TRIM(v_Chan_Cd) = '05') THEN
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('S068') <= f_sRtsd0104SetCarCountUp(v_Cust_No, v_Ord_No, TRIM(v_Car_No)) THEN
                    v_Return_Message := '수정 가능한 총 차량수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S068') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;

                -- [20171114_01] 겨울용 타이어 주문 시에는 장착가능개수 판단 skip
                IF (v_Season_Cd <> '02') AND (Pkg_Rtcm0051.f_sRtcm0051Cd('S069') < f_sRtsd0104SetTireNbCountUp(v_Cust_No, v_Ord_No) + TO_NUMBER(v_Cnt_Cd)) THEN
                    v_Return_Message := '수정 가능한 총 타이어본수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S069') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;

                IF Pkg_Rtsd0007.f_sRtsd0007SetOlimitCntCount(v_Agency_Cd) <= f_sRtsd0104SetOlimitCntUp(v_Ord_Day, v_Ord_No, v_Agency_Cd) THEN
                    v_Return_Message := '대리점 일일 계약가능한 건수를 초과하였습니다.';
                    RAISE e_Error;
                END IF;
            END IF;

            IF (TRIM(v_Chan_Cd) = '03') OR (TRIM(v_Chan_Cd) = '04') THEN
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('S068') <= f_sRtsd0104SetCarCountUp(v_Cust_No, v_Ord_No, TRIM(v_Car_No)) THEN
                    v_Return_Message := '수정 가능한 총 차량수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S068') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;

                -- [20171114_01] 겨울용 타이어 주문 시에는 장착가능개수 판단 skip
                IF (v_Season_Cd <> '02') AND (Pkg_Rtcm0051.f_sRtcm0051Cd('S069') < f_sRtsd0104SetTireNbCountUp(v_Cust_No, v_Ord_No) + TO_NUMBER(v_Cnt_Cd)) THEN
                    v_Return_Message := '수정 가능한 총 타이어본수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S069') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;

                --IF Pkg_Rtsd0007.f_sRtsd0007SetOlimitCntCount(v_Agency_Cd) <= f_sRtsd0104SetOlimitCntUp(v_Ord_Day, v_Ord_No, v_Agency_Cd) THEN
                --    v_Return_Message := '대리점 일일 계약가능한 건수를 초과하였습니다.';
                --    RAISE e_Error;
                --END IF;
            END IF;

            IF 0 != f_Updatertsd0104(v_Ord_No, v_Ord_Day, v_Ord_Id, v_Chan_Cd,
                                     v_Sale_Id, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd,
                                     v_Camp_Yn, v_c_Dcrate, v_c_Dcamt, v_Cust_No,
                                     v_Cust_Tp, v_Safekey, v_Grp_Yn, v_Grp_No,
                                     v_g_Dcrate, v_G_Dcamt, v_L_Dcrate, v_L_Dcamt,
                                     v_F_Dcrate, v_F_Dcamt, v_Bord_No, v_Stat_Cd,
                                     v_Proc_Day, v_CANC_DAY, v_Agency_Cd, v_Sales_GroupB,
                                     v_Sales_OfficeB, v_Eng_Nm, v_Ag_Desc, v_Maker_Cd,
                                     v_Model_Cd, v_Contents_Cd, v_Fr_Cd, TRIM(v_Car_No),
                                     v_Car_Owner, v_c_Mileage, v_Req_Text, v_Pay_Mthd,
                                     v_Pay_Dd, v_Acc_Seq, v_Crd_Seq, v_Acc_Chk,
                                     v_Acc_Stat, v_Bkey_Chk, v_Batch_Key, v_Bill_Yn,
                                     v_Crdt_Stat, v_Cert_Cd, v_Cert_Stat, v_Ord_Agent,
                                     v_Org_Cd, v_Org_Hq, v_Org_L1, v_Org_L2,
                                     v_Org_L3, v_Org_L4, v_Ins_Org, v_Ps_Cd,
                                     v_Cmsag_Yn, v_Con_Mthd, v_Pcert_Yn, v_Fc_Day,
                                     v_Ag_Day, v_Ag_Seq, v_Input_Dt, v_File_Path, v_File_Name,
                                     v_Tcgrp_No, v_Vbeln, v_Season_Cd, v_Regi_Amt, v_Sum_Mon_Amt,
                                     v_Mon_Amt, v_Sale_Cd, v_Pay_Gb, v_Reg_Id, 
                                     v_Inst_Cd, v_Inst_Tm, v_Inst1_Poscd, v_Inst1_Addr1, v_Inst1_Addr2,
                                     v_Inst2_Poscd, v_Inst2_Addr1, v_Inst2_Addr2, v_Errortext) THEN
                v_Return_Message := '계약 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_Deletertsd0104(v_Ord_No, v_Stat_Cd, v_Reg_Id, v_Errortext) THEN
               v_Return_Message := '삭제 실패!!!'||'-'||v_Errortext;
               v_Errortext := v_Errortext;
               RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
        v_Return_Message := '이력 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
    
    --[20230210_1] kstka
    IF v_Comm_Dvsn = 'I' THEN
    
        PKG_RTSD0104.p_regiAmtPay(v_Ord_No, v_Reg_Id, v_Success_Code, v_Return_Message, v_Errortext);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '할인율 테이블정보등록 실패!!!'||'-'||v_Return_Message;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
    END IF;
    
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
        --Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_IUDRtsd0104(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_IUDRtsd0104(2)', v_Errortext, v_Return_Message);

  END P_IUDRTSD0104;

  /*****************************************************************************
  -- 계약 정보 Select - 주문현황리스트

  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.01       2016-07-12  이영근           대리점코드/채널대분류/채널중분류 컬럼 추가
   1.7        2018-03-01  wjim             [20180301_03] 프리미엄 서비스 추가
   1.8        2019-03-01  wjim             [20190301_01] '콜센터' 사용자 그룹에 전체 조회권한 부여
   1.9        2024-07-17  백인천             [20240717] '장착유형' 컬럼 추가
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
    v_Mob_No      IN RTSD0100.MOB_NO%TYPE,        /*핸드폰번호  20160407추가 한승훈     */
    v_RENTAL_GROUP  IN VARCHAR2,
    v_RENTAL_OFFICE IN VARCHAR2,
    v_LOGIN_ID       IN VARCHAR2,                    /* 로그인ID: 관련항목 범위 지정 */
    v_LOGIN_GRP     IN VARCHAR2                     /* 로그인 사용자 그룹 */
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
    SELECT  A.ORD_NO                                                AS ORD_NO,          /*주문번호       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM,         /*계약상태       */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S304', NVL(C.INST_CD,'1030'))     AS INST_NM,         /*장착유형*/
            A.ORD_DAY                                               AS ORD_DAY,         /*접수일자       */
            A.PROC_DAY                                              AS OPROC_DAY,       /*계약-장착일자  */
            TO_CHAR(A.REG_DT, 'HH24:MI:SS')                         AS REG_DT,          /*계약접수시간   */
            DECODE(A.CHAN_CD,
                    '01', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                    '05', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                    DECODE(A.STAT_CD,
                           '06', NULL,
                           A.PROC_DAY))                             AS PROC_DAY,        /*장착완료일자   */
            TO_CHAR(C.REG_DT, 'HH24:MI:SS')                         AS PROC_TM,         /*장착완료시간   */
            H.PETTERN_CD                                            AS PETTERN_CD,      /* 상품패턴      */        
            LISTAGG(B.MAT_CD, ',') WITHIN GROUP (ORDER BY B.MAT_CD) AS MAT_CD,           /*상품코드       */
            LISTAGG(Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD), ',     ') WITHIN GROUP (ORDER BY B.MAT_CD)          AS MAT_NM,          /*상품명         */
            (SELECT T1.SALE_NM FROM RTSD0020 T1 WHERE T1.SALE_CD = A.SALE_CD) AS SALE_NM, /* 판매상품명 */
            MAX(B.SEQ) AS ECH_CNT_NM,                                                   /*제품 SEQ MAX   */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022',LPAD(SUM(TO_NUMBER(B.CNT_CD)),2,'0'))  AS CNT_NM,          /*타이어본수     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021',A.PERIOD_CD)    AS PERIOD_NM,       /*계약기간       */
            A.REGI_AMT                                              AS REGI_AMT,        /*렌탈등록비     */
            A.SUM_MON_AMT                                           AS MON_AMT,         /*월렌탈료       */
            Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)             AS CUST_NM,         /*고객명         */
            Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)           AS AGENCY_NM    ,   /*장착대리점     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018',A.SALES_GROUP)  AS SALES_GROUP_NM  ,/*지사           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019',A.SALES_OFFICE) AS SALES_OFFICE_NM ,/*지점           */
            DECODE(A.CONTENTS_CD,
                     '0001', Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD),
                             Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)||
                             ' '||
                             Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)) AS MODEL_NM, /*차종+사양명 */
            A.CAR_NO                                                AS CAR_NO,          /*차량번호       */
            A.ORD_AGENT                                             AS ORD_AGENT,       /*판매인번호     */
            E.ORG_AGNM                                              AS ORG_AGNM,        /*판매인명       */
            DECODE(D.GENDER_CD,'1','남','2','여')                   AS GENDER_CD,       /*성별           */
            A.C_MILEAGE                                             AS C_MILEAGE,       /*현재주행거리   */
            (TO_CHAR(SYSDATE,'YYYY')-SUBSTR(D.BIRTH_DAY,1,4)+1)     AS AGE,             /*나이           */
            REPLACE(SUBSTR( D.ADDR1 ,1,REGEXP_INSTR(D.ADDR1,'\ ')),' ','') AS ADDR_AREA,/*지역           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,       /*계절구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S078', F.MF_CD)       AS MF_NM,           /*구매전 제조사  */
            A.CHAN_CD                                               AS CHAN_CD,         /*채널구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM,         /*채널구분       */
            D.MOB_NO,                                                                   /*휴대폰번호 20160408 추가 한승훈    */
            A.AGENCY_CD,
            DECODE(A.CHAN_CD,'03',E.CHAN_LCLS_CD,G.CHAN_LCLS_CD) AS CHAN_LCLS_CD,
            DECODE(A.CHAN_CD,'03',E.CHAN_MCLS_CD,G.CHAN_MCLS_CD) AS CHAN_MCLS_CD,
            Pkg_Rtcm0051.f_sRtcm0051Codename('S090',DECODE(A.CHAN_CD,'03',E.CHAN_LCLS_CD,G.CHAN_LCLS_CD)) AS CHAN_LCLS_NM,
            Pkg_Rtcm0051.f_sRtcm0051Codename('S091',DECODE(A.CHAN_CD,'03',E.CHAN_MCLS_CD,G.CHAN_MCLS_CD)) AS CHAN_MCLS_NM,
            '(' || D.POS_CD || ') ' || D.ADDR1 || ' ' || D.ADDR2 AS ADDR,
            A.PS_CD,                                                                   /*서비스코드     */ --[20180301_03]
            Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM,           /*서비스명       */ --[20180301_03]
            Pkg_Exif0004.f_sExif0004O2OStockYn(A.OMS_ORDERNO) AS O2O_STOCK_YN, /*O2O 재고 사용 여부       */ --[2020422_01]
            A.OUT_STOCK_YN,  --[20210806_01] kstka 직영도매재고사용여부 [20221107_1] 자사재고사용여부
            A.OUT_STOCK_TYPE, --[20221107_1] 자사재고 미사용 사유
            Pkg_Rtcm0051.f_sRtcm0051Codename('S313', A.OUT_STOCK_TYPE)     AS OUT_STOCK_TYPE_NM,
            Pkg_Rtsd0421.f_GetSendHist(A.ORD_NO, 1) AS FIRST_DAY        --[20211018_01] kstka 도착문자발송여부 (1회차)
    FROM    RTSD0104 A,
            RTSD0106 B,
            RTSD0108 C,
            RTSD0100 D,
            RTSD0113 E,
            RTCS0120 F,
            RTSD0007 G,
            RTSD0005 H
    WHERE   A.ORD_DAY       BETWEEN v_Ord_Fday AND v_Ord_Tday                               /*접수일자FROM~TO       */
    AND     A.SALES_OFFICE  = DECODE(v_Sales_Office, NULL, A.SALES_OFFICE, v_Sales_Office)  /*지점                  */
    AND     A.SALES_GROUP   = DECODE(v_Sales_Group , NULL, A.SALES_GROUP , v_Sales_Group)   /*지사                  */
    AND     A.AGENCY_CD     = DECODE(v_Agency_Cd   , NULL, A.AGENCY_CD   , v_Agency_Cd)     /*장착 대리점           */
    AND     A.ORD_NO        = DECODE(v_Ord_No      , NULL, A.ORD_NO      , v_Ord_No)        /*주문번호              */
    AND     A.CUST_NO       = DECODE(v_Cust_No     , NULL, A.CUST_NO     , v_Cust_No)       /*고객번호              */
    AND     (v_Proc_Fday IS NULL OR (v_Proc_Fday IS NOT NULL AND A.PROC_DAY BETWEEN v_Proc_Fday AND v_Proc_Tday))   /*장착일자FROM~TO       */
    AND     (v_Mob_No IS NULL OR (v_Mob_No IS NOT NULL AND D.MOB_NO LIKE '%'|| v_Mob_No ||'%'))   /*핸드폰번호 추가 20160408 한승훈        */
    AND     A.ORD_NO = B.ORD_NO
    AND     A.ORD_NO = C.ORD_NO (+)
    AND     A.CUST_NO = D.CUST_NO
    AND     A.ORD_AGENT = E.ORD_AGENT(+)
    AND     A.ORD_NO    = F.ORD_NO (+)
    AND     A.AGENCY_CD = G.AGENCY_CD(+)
    AND     B.MAT_CD    = H.MAT_CD(+)
    GROUP BY A.ORD_NO,A.STAT_CD,A.ORD_DAY,A.REG_DT,A.PROC_DAY,C.REG_DT,A.PERIOD_CD,A.CUST_NO,A.AGENCY_CD,A.SALES_GROUP,
             A.SALES_OFFICE,A.CONTENTS_CD,A.MODEL_CD,A.CAR_NO,A.ORD_AGENT,E.ORG_AGNM,D.GENDER_CD,A.C_MILEAGE,D.BIRTH_DAY,
             D.ADDR1,A.SEASON_CD,F.MF_CD,A.CHAN_CD,D.MOB_NO,E.CHAN_LCLS_CD,G.CHAN_LCLS_CD,E.CHAN_MCLS_CD,G.CHAN_MCLS_CD,
             D.POS_CD,D.ADDR1,D.ADDR2,A.PS_CD,A.REGI_AMT,A.SUM_MON_AMT,H.PETTERN_CD, A.SALE_CD, A.OMS_ORDERNO, A.OUT_STOCK_YN,
             A.OUT_STOCK_TYPE, C.INST_CD
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
    
  END p_sRtsd0104Status;


  /*****************************************************************************
  -- 계약 정보 - 주문번호 획득
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
  *****************************************************************************/
  FUNCTION f_sRtsd0104OrdNo (
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE         /*채널구분              */
  ) RETURN VARCHAR2 IS
    v_Ord_No RTSD0104.ORD_NO%TYPE DEFAULT NULL;       /*주문번호              */
  BEGIN

    --SELECT  DECODE(v_Chan_Cd, '01','D','02','O','04','M','E')||TO_CHAR(SYSDATE,'YY')||LPAD(SEQ_RTSD0104ORD_NO.NEXTVAL, 9,'0')
    --SELECT  DECODE(v_Chan_Cd, '01','D','02','O','03','S','04','M','05','B','E')||TO_CHAR(SYSDATE,'YY')||LPAD(SEQ_RTSD0104ORD_NO.NEXTVAL, 9,'0')
    SELECT  DECODE(v_Chan_Cd, '01','D','02','O','03','B','04','M','05','D','06','E','09','A','10','L','11','P','Z')||TO_CHAR(SYSDATE,'YY')||LPAD(SEQ_RTSD0104ORD_NO.NEXTVAL, 9,'0')
    INTO    v_Ord_No
    FROM    DUAL;

    RETURN v_Ord_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0104OrdNo;

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
    v_Grp_No     IN RTSD0104.GRP_NO%TYPE,                    /* 단체번호 */
    v_Ord_Id     IN RTSD0104.ORD_ID%TYPE,                  /*주문아이디          */
    v_groNoYn    IN VARCHAR2                               /*GRP_NO구분       */
    ) IS

  BEGIN
    IF v_groNoYn IS NOT NULL THEN

        OPEN Ref_Cursor FOR
        SELECT  B.ORD_DAY,                                                            /*계약일자      */
                B.ORD_NO,                                                             /*계약번호      */
                B.CUST_NO,                                                            /*고객코드      */
                A.BIRTH_DAY,                                                          /*법정생년월일  */
                A.BUSL_NO,                                                            /*사업자번호    */
                A.CUST_NM,                                                            /*고객명,법인명 */
                A.GENDER_CD,                                                          /*성별코드      */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,   /*성별명        */
                A.LF_CD,                                                              /*내외국인코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,           /*내외국인코드명*/
                A.MOB_NO,                                                             /*핸드폰        */
                A.TEL_NO,                                                             /*전화번호      */
                A.TEL_NO2,                                                            /*전화번호2     */
                '('||A.POS_CD||')'||' '||A.ADDR1||' '||A.ADDR2 AS ADDR,               /*주소          */
                B.CAR_NO,                                                             /*차량번호      */
                B.MAKER_CD,                                                           /*카메이커      */
                B.MODEL_CD,                                                           /*차종          */
                B.CONTENTS_CD,                                                        /*사양          */
                B.FR_CD,                                                              /*전후구분      */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)
                ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)
                ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)
                ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S004', B.FR_CD) CAR_KIND,    /*차종          */
                B.STAT_CD,                                                            /*계약상태코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD) AS STAT_NM,       /*계약상태명    */
                A.CUST_TP,
                --Pkg_Rtcm0051.f_sRtcm0051CodeName('S214',E.CHAN_CD) AS CHAN_NM,          /*채널판매구분*/
                --Pkg_Rtcm0051.f_sRtcm0051CodeName('S096',E.HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명 */
                B.SUM_MON_AMT MON_AMT,                                                             /* 월렌탈료 */
                B.GRP_NO,                                                             /* 단체번호  */
                B.CNT_CD,                                                               /* 타이어본수 */
                B.PROC_DAY,                                                            /*  장착일자 */
                B.AGENCY_CD,
                Pkg_Rtsd0007.f_sRtsd0007AgencyNm(B.AGENCY_CD)                    AS AGENCY_NM,      /* 장착점  */
                (SELECT T.MAT_NM FROM RTSD0005 T WHERE T.MAT_CD = 
                    (SELECT C.MAT_CD FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO AND ROWNUM = 1)) AS PETTERN_CD, /*패턴코드*/
                A.POS_CD,                                                              /*우편번호*/
                A.ADDR1,                                                               /*주소1*/
                A.ADDR2,
                (SELECT CASE WHEN MFP_YN = 'Y' THEN
                                CASE WHEN END_TP = 'E' THEN '중도완납' 
                                     ELSE CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = Y.ORD_NO) > 0 THEN '채권매각' ELSE '중도해지' END 
                                END
                             ELSE ''                                    
                             END
                        FROM RTSD0108 Y 
                        WHERE Y.ORD_NO = B.ORD_NO
                        AND ROWNUM = 1) AS MFP_YN,                                                                /*주소2*/
                (SELECT BOND_SEL_DAY FROM RTSD0108 X WHERE X.ORD_NO = B.ORD_NO) AS BOND_SEL_DAY, --[20220104_01] kstka 채권매각일자 
                B.CHAN_CD,
                Pkg_EXIF0004.f_sExif0004O2OAgency(B.AGENCY_CD) AS O2O_YN
        FROM    RTSD0100 A,
                RTSD0104 B--,
                ---RTSD0020 E
        WHERE   A.CUST_NO = B.CUST_NO
        --AND     B.SALE_CD = E.SALE_CD
        AND     A.CUST_TP = DECODE( v_custTp , NULL, A.CUST_TP , v_custTp)
        AND     B.CHAN_CD = DECODE( v_chanCd , NULL, B.CHAN_CD , v_chanCd)
        AND     (v_statCd   IS NULL OR B.STAT_CD   =  v_statCd)
        AND     (v_birthday IS NULL OR A.BIRTH_DAY =  v_birthday)
        AND     (v_mobNo    IS NULL OR A.MOB_NO    =  v_mobNo)
        AND     (v_carNo    IS NULL OR B.CAR_NO    =  v_carNo)
        AND     (v_custNm   IS NULL OR A.CUST_NM   =  v_custNm)
        AND     (v_telNo    IS NULL OR A.TEL_NO    =  v_telNo)
        AND     (v_telNo2   IS NULL OR A.TEL_NO2   =  v_telNo2)
        AND     (v_gender   IS NULL OR A.GENDER_CD =  v_gender)
        AND     (v_lf       IS NULL OR A.LF_CD     =  v_lf)
        AND     (v_buslNo   IS NULL OR A.BUSL_NO   =  v_buslNo)
        AND     (v_Ord_No   IS NULL OR B.ORD_NO   =  v_Ord_No)
        AND     (v_Grp_No   IS NULL OR B.GRP_NO   =  v_Grp_No)
        AND     (v_Ord_Id   IS NULL OR B.ORD_ID   =  v_Ord_Id)
        AND     (B.GRP_NO IS NULL OR SUBSTR(B.GRP_NO, 0 ,1) != v_groNoYn)
        
      
        ORDER BY ORD_NO DESC;
    ELSE
        OPEN Ref_Cursor FOR
        SELECT  B.ORD_DAY,                                                            /*계약일자      */
                B.ORD_NO,                                                             /*계약번호      */
                B.CUST_NO,                                                            /*고객코드      */
                A.BIRTH_DAY,                                                          /*법정생년월일  */
                A.BUSL_NO,                                                            /*사업자번호    */
                A.CUST_NM,                                                            /*고객명,법인명 */
                A.GENDER_CD,                                                          /*성별코드      */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,   /*성별명        */
                A.LF_CD,                                                              /*내외국인코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,           /*내외국인코드명*/
                A.MOB_NO,                                                             /*핸드폰        */
                A.TEL_NO,                                                             /*전화번호      */
                A.TEL_NO2,                                                            /*전화번호2     */
                '('||A.POS_CD||')'||' '||A.ADDR1||' '||A.ADDR2 AS ADDR,               /*주소          */
                B.CAR_NO,                                                             /*차량번호      */
                B.MAKER_CD,                                                           /*카메이커      */
                B.MODEL_CD,                                                           /*차종          */
                B.CONTENTS_CD,                                                        /*사양          */
                B.FR_CD,                                                              /*전후구분      */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)
                ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)
                ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)
                ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S004', B.FR_CD) CAR_KIND,    /*차종          */
                B.STAT_CD,                                                            /*계약상태코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD) AS STAT_NM,       /*계약상태명    */
                A.CUST_TP,
                --Pkg_Rtcm0051.f_sRtcm0051CodeName('S214',E.CHAN_CD) AS CHAN_NM,          /*채널판매구분*/
                --Pkg_Rtcm0051.f_sRtcm0051CodeName('S096',E.HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명 */
                B.SUM_MON_AMT MON_AMT,                                                             /* 월렌탈료 */
                B.GRP_NO,                                                             /* 단체번호  */
                B.CNT_CD,                                                               /* 타이어본수 */
                B.PROC_DAY,                                                            /*  장착일자 */
                B.AGENCY_CD,
                Pkg_Rtsd0007.f_sRtsd0007AgencyNm(B.AGENCY_CD)                    AS AGENCY_NM,      /* 장착점  */
                (SELECT T.MAT_NM FROM RTSD0005 T WHERE T.MAT_CD = 
                    (SELECT C.MAT_CD FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO AND ROWNUM = 1)) AS PETTERN_CD, /*패턴코드*/
                A.POS_CD,                                                              /*우편번호*/
                A.ADDR1,                                                               /*주소1*/
                A.ADDR2,
                (SELECT CASE WHEN MFP_YN = 'Y' THEN
                                CASE WHEN END_TP = 'E' THEN '중도완납' 
                                     ELSE CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = Y.ORD_NO) > 0 THEN '채권매각' ELSE '중도해지' END 
                                END
                             ELSE ''                                    
                             END
                        FROM RTSD0108 Y 
                        WHERE Y.ORD_NO = B.ORD_NO
                        AND ROWNUM = 1) AS MFP_YN,                                                               /*주소2*/
                (SELECT BOND_SEL_DAY FROM RTSD0108 X WHERE X.ORD_NO = B.ORD_NO) AS BOND_SEL_DAY, --[20220104_01] kstka 채권매각일자
                B.CHAN_CD,
                Pkg_EXIF0004.f_sExif0004O2OAgency(B.AGENCY_CD) AS O2O_YN  
        FROM    RTSD0100 A,
                RTSD0104 B--,
                ---RTSD0020 E
        WHERE   A.CUST_NO = B.CUST_NO
        --AND     B.SALE_CD = E.SALE_CD
        AND     A.CUST_TP = DECODE( v_custTp , NULL, A.CUST_TP , v_custTp)
        AND     B.CHAN_CD = DECODE( v_chanCd , NULL, B.CHAN_CD , v_chanCd)
        AND     (v_statCd   IS NULL OR B.STAT_CD   =  v_statCd)
        AND     (v_birthday IS NULL OR A.BIRTH_DAY =  v_birthday)
        AND     (v_mobNo    IS NULL OR A.MOB_NO    =  v_mobNo)
        AND     (v_carNo    IS NULL OR B.CAR_NO    =  v_carNo)
        AND     (v_custNm   IS NULL OR A.CUST_NM   =  v_custNm)
        AND     (v_telNo    IS NULL OR A.TEL_NO    =  v_telNo)
        AND     (v_telNo2   IS NULL OR A.TEL_NO2   =  v_telNo2)
        AND     (v_gender   IS NULL OR A.GENDER_CD =  v_gender)
        AND     (v_lf       IS NULL OR A.LF_CD     =  v_lf)
        AND     (v_buslNo   IS NULL OR A.BUSL_NO   =  v_buslNo)
        AND     (v_Ord_No   IS NULL OR B.ORD_NO   =  v_Ord_No)
        AND     (v_Grp_No   IS NULL OR B.GRP_NO   =  v_Grp_No)
        AND     (v_Ord_Id   IS NULL OR B.ORD_ID   =  v_Ord_Id)
        AND     (v_groNoYn IS NULL OR SUBSTR(B.GRP_NO, 0 ,1) != v_groNoYn
        )
        
      
        ORDER BY ORD_NO DESC;
    
    END IF;


  END p_sRtsd0104_ordNoListPoPup;
--  PROCEDURE p_sRtsd0104_ordNoListPoPup (
--    Ref_Cursor   IN OUT SYS_REFCURSOR,
--    v_custTp     IN RTSD0100.CUST_TP%TYPE,                /*고객유형          */
--    v_statCd     IN RTSD0104.STAT_CD%TYPE,                /*계약상태          */
--    v_chanCd     IN RTSD0104.CHAN_CD%TYPE,                /*채널구분          */
--    v_Birthday   IN RTSD0100.BIRTH_DAY%TYPE,              /*법정생년월일      */
--    v_mobNo      IN RTSD0100.MOB_NO%TYPE,                 /*핸드폰            */
--    v_carNo      IN RTSD0104.CAR_NO%TYPE,                 /*차량번호          */
--    v_custNm     IN RTSD0100.CUST_NM%TYPE,                /*고객명/법인명     */
--    v_telNo      IN RTSD0100.TEL_NO%TYPE,                 /*전화번호          */
--    v_telNo2     IN RTSD0100.TEL_NO2%TYPE,                /*전화번호2         */
--    v_gender     IN RTSD0100.GENDER_CD%TYPE,              /*성별              */
--    v_lf         IN RTSD0100.LF_CD%TYPE,                  /*내외국인          */
--    v_buslNo     IN RTSD0100.BUSL_NO%TYPE,                /*사업자번호        */
--    v_Ord_No     IN RTSD0104.ORD_NO%TYPE,                  /*주문번호          */
--    v_Grp_No     IN RTSD0104.GRP_NO%TYPE                    /* 단체번호 */
--    ) IS
--
--  BEGIN
--
--    OPEN Ref_Cursor FOR
--    SELECT  B.ORD_DAY,                                                            /*계약일자      */
--            B.ORD_NO,                                                             /*계약번호      */
--            B.CUST_NO,                                                            /*고객코드      */
--            A.BIRTH_DAY,                                                          /*법정생년월일  */
--            A.BUSL_NO,                                                            /*사업자번호    */
--            A.CUST_NM,                                                            /*고객명,법인명 */
--            A.GENDER_CD,                                                          /*성별코드      */
--            Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,   /*성별명        */
--            A.LF_CD,                                                              /*내외국인코드  */
--            Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,           /*내외국인코드명*/
--            A.MOB_NO,                                                             /*핸드폰        */
--            A.TEL_NO,                                                             /*전화번호      */
--            A.TEL_NO2,                                                            /*전화번호2     */
--            '('||A.POS_CD||')'||' '||A.ADDR1||' '||A.ADDR2 AS ADDR,               /*주소          */
--            B.CAR_NO,                                                             /*차량번호      */
--            B.MAKER_CD,                                                           /*카메이커      */
--            B.MODEL_CD,                                                           /*차종          */
--            B.CONTENTS_CD,                                                        /*사양          */
--            B.FR_CD,                                                              /*전후구분      */
--            Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)
--            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)
--            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)
--            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S004', B.FR_CD) CAR_KIND,    /*차종          */
--            B.STAT_CD,                                                            /*계약상태코드  */
--            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD) AS STAT_NM,       /*계약상태명    */
--            C.MAT_CD,                                                             /*상품코드      */
--            D.MAT_NM,                                                             /*상품명        */
--            C.PLAN_DAY,                                                           /*장착예정일    */
--            C.INST_DAY,                                                           /*장착일        */
--            E.SALE_NM,                                                          /*판매상품명*/
--            A.CUST_TP,
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S214',E.CHAN_CD) AS CHAN_NM,          /*채널판매구분*/
--            Pkg_Rtcm0051.f_sRtcm0051CodeName('S096',E.HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명 */
--            B.MON_AMT,                                                             /* 월렌탈료 */
--            B.GRP_NO,                                                             /* 단체번호  */
--            B.SEASON_CD,                                                          /*계절구분코드  */
--            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', B.SEASON_CD) SEASON_NM,       /*계절구분      */
--            B.CNT_CD                                                               /* 타이어본수 */
--    FROM    RTSD0100 A,
--            RTSD0104 B,
--            RTSD0106 C,
--            RTSD0005 D,
--            RTSD0020 E
--    WHERE   A.CUST_NO = B.CUST_NO
--    AND     B.ORD_NO  = C.ORD_NO(+)
--    AND     C.MAT_CD  = D.MAT_CD
--    AND     B.SALE_CD = E.SALE_CD
--    AND     A.CUST_TP = DECODE( v_custTp , NULL, A.CUST_TP , v_custTp)
--    AND     B.CHAN_CD = DECODE( v_chanCd , NULL, B.CHAN_CD , v_chanCd)
--    AND     (v_statCd   IS NULL OR B.STAT_CD   =  v_statCd)
--    AND     (v_birthday IS NULL OR A.BIRTH_DAY =  v_birthday)
--    AND     (v_mobNo    IS NULL OR A.MOB_NO    =  v_mobNo)
--    AND     (v_carNo    IS NULL OR B.CAR_NO    =  v_carNo)
--    AND     (v_custNm   IS NULL OR A.CUST_NM   =  v_custNm)
--    AND     (v_telNo    IS NULL OR A.TEL_NO    =  v_telNo)
--    AND     (v_telNo2   IS NULL OR A.TEL_NO2   =  v_telNo2)
--    AND     (v_gender   IS NULL OR A.GENDER_CD =  v_gender)
--    AND     (v_lf       IS NULL OR A.LF_CD     =  v_lf)
--    AND     (v_buslNo   IS NULL OR A.BUSL_NO   =  v_buslNo)
--    AND     (v_Ord_No   IS NULL OR B.ORD_NO   =  v_Ord_No)
--    AND     (v_Grp_No   IS NULL OR B.GRP_NO   =  v_Grp_No)
--
--    ORDER   BY ORD_NO DESC;
--
--
--  END p_sRtsd0104_ordNoListPoPup;


  /*****************************************************************************
  -- 단체계약주문 계약조회 - 계약현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104_ordNoList (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Grp_No     IN RTSD0104.GRP_NO%TYPE                    /* 단체번호 */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.ORD_DAY,                                                            /*계약일자      */
            B.ORD_NO,                                                             /*계약번호      */
            B.CUST_NO,                                                            /*고객코드      */
            A.BIRTH_DAY,                                                          /*법정생년월일  */
            A.BUSL_NO,                                                            /*사업자번호    */
            A.CUST_NM,                                                            /*고객명,법인명 */
            A.GENDER_CD,                                                          /*성별코드      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,   /*성별명        */
            A.LF_CD,                                                              /*내외국인코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,           /*내외국인코드명*/
            A.MOB_NO,                                                             /*핸드폰        */
            A.TEL_NO,                                                             /*전화번호      */
            A.TEL_NO2,                                                            /*전화번호2     */
            '('||A.POS_CD||')'||' '||A.ADDR1||' '||A.ADDR2 AS ADDR,               /*주소          */
            B.CAR_NO,                                                             /*차량번호      */
            B.MAKER_CD,                                                           /*카메이커      */
            B.MODEL_CD,                                                           /*차종          */
            B.CONTENTS_CD,                                                        /*사양          */
            B.FR_CD,                                                              /*전후구분      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S004', B.FR_CD) CAR_KIND,    /*차종          */
            B.STAT_CD,                                                            /*계약상태코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD) AS STAT_NM,       /*계약상태명    */
            E.SALE_NM,                                                          /*판매상품명*/
            A.CUST_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S214',E.CHAN_CD) AS CHAN_NM,          /*채널판매구분*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S096',E.HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명 */
            B.MON_AMT,                                                             /* 월렌탈료 */
            B.GRP_NO,                                                             /* 단체번호  */
            B.SEASON_CD,                                                          /*계절구분코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', B.SEASON_CD) SEASON_NM,       /*계절구분      */
            B.CNT_CD,                                                               /* 타이어본수 */
            B.PERIOD_CD,
            E.FPAY_YN,
            E.PRDT_GRP
    FROM    RTSD0100 A,
            RTSD0104 B,
            RTSD0020 E
    WHERE   A.CUST_NO = B.CUST_NO
    AND     B.SALE_CD = E.SALE_CD
    AND     (v_Grp_No   IS NULL OR B.GRP_NO   =  v_Grp_No)

    ORDER   BY ORD_NO DESC;


  END p_sRtsd0104_ordNoList;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.PLAN_DAY,                  /*장착예정일          */
            A.ORD_NO,                    /*주문번호            */
            Pkg_Rtsd0100.f_sRtsd0100Custname(A.CUST_NO) CUST_NM,             /*고객명       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD) MODEL_NM,   /*차종명       */
            A.CAR_NO,                    /*차량번호            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD) STAT_NM,     /*계약상태     */
            Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD) MAT_NM,                /*상품명       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD) CNT_NM,       /*타이어본수   */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD) PERIOD_NM, /*계약기간     */
            B.REGI_AMT,                  /*렌탈등록비          */
            B.MON_AMT,                   /*월렌탈료            */
            B.INST_DAY,                  /*장착일              */
            A.SEASON_CD,                                                     /*계절구분코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD) SEASON_NM  /*계절구분      */
    FROM    RTSD0104 A,
            RTSD0106 B
    WHERE   A.AGENCY_CD = v_Agency_Cd      /*장착 대리점           */
    AND     A.STAT_CD   = v_Stat_Cd        /*상태                  */
    AND     ((v_Stat_Cd = '03' AND B.PLAN_DAY BETWEEN V_PROC_FDAY AND V_PROC_TDAY) OR   /*장착일자FROM~TO       */
             (v_Stat_Cd = '04' AND B.INST_DAY BETWEEN V_PROC_FDAY AND V_PROC_TDAY))
    AND     A.ORD_NO    = DECODE(v_Ord_No , NULL, A.ORD_NO , v_Ord_No)  /*주문번호              */
    AND     A.CUST_NO   = DECODE(v_Cust_No, NULL, A.CUST_NO, v_Cust_No) /*고객번호              */
    AND     A.ORD_NO    = B.ORD_NO
    ORDER   BY B.PLAN_DAY ASC;

  END p_sRtsd0104ProcTargetList;


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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0104
    SET    STAT_CD  = v_Stat_Cd,
           PROC_DAY = v_Proc_Day,
           FC_DAY   = v_Fc_Day,
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ORD_NO   = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0104PrcStat;

  /*****************************************************************************
  -- 계약 정보 - 계약번호로 고객번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104CustNo(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR IS
    v_Cust_No   RTSD0104.CUST_NO%TYPE DEFAULT NULL;   /*고객번호              */
  BEGIN

    SELECT  CUST_NO
    INTO    v_Cust_No
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Cust_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0104CustNo;


  /*****************************************************************************
  -- 계약 정보 - 해당 계약번호의 상태 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104StatCd(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR IS
    v_Stat_Cd RTSD0104.STAT_CD%TYPE DEFAULT NULL;       /*상태                  */
  BEGIN

    SELECT  STAT_CD
    INTO    v_Stat_Cd
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Stat_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0104StatCd;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0104
    SET    STAT_CD   = v_Stat_Cd,
           CMSAG_YN  = v_Cmsag_Yn,
           CON_MTHD  = v_Con_Mthd,
           INPUT_DT  = v_Input_Dt,
           FILE_PATH = v_File_Path,
           FILE_NAME = v_File_Name,
           FC_DAY    = Pkg_Rtsd0109.f_sRtsd0109Demddt(1, TO_CHAR(SYSDATE, 'YYYYMMDD'), (SELECT PAY_DD FROM RTSD0104 WHERE ORD_NO = v_Ord_No)),
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE
    WHERE  ORD_NO    = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0104Sing;


 /*****************************************************************************
  -- 계약 현황 조회
  -- - 재렌탈가능일 기준은 Pkg_Comm.p_sReRentalInfo 와 동일해야 함

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.4        2017-10-27  wjim             [20171027_02] 주문현황조회 항목 추가
                                           - 가계약번호, 재렌탈가능일(from~to)
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
  ) IS

  BEGIN

    IF 0 != Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_NO                                                AS ORD_NO    ,   /*계약번호*/
                A.CUST_NO                                               AS CUST_NO   ,   /*고객번호*/
                PKG_RTSD0100.F_SRTSD0100CUSTNAME(A.CUST_NO)             AS CUST_NM   ,   /*고객명*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID)      AS ORD_NM    ,   /*주문구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM   ,   /*채널구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID)     AS SALE_NM   ,   /*계약유형*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM   ,   /*계약상태*/
                A.ORD_DAY                                               AS ORD_DAY   ,   /*접수일자*/
                B.PLAN_DAY                                              AS PLAN_DAY  ,   /*장착일예정일*/
                A.PROC_DAY                                              AS PROC_DAY  ,   /*장착일자*/
                A.CANC_DAY                                              AS CANC_DAY  ,   /*취소일자*/
                B.MAT_CD                                                AS MAT_CD    ,   /*상품코드*/
                Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD)               AS MAT_NM    ,   /*상품명*/
                TO_NUMBER(B.ORD_QTY)                                    AS ORD_QTY   ,   /*수량*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)   AS PERIOD_NM ,   /*총렌탈기간*/
                'N'                                                     AS OS_YN     ,   /*소유권이전여부*/
                'N'                                                     AS MFP_YN    ,   /*중도완납여부*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM     ,   /*프리미엄서비스*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD)    AS MAKER_NM  ,   /*카메이커*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD)       AS MC_NM     ,   /*차종*/
                A.CAR_NO                                                AS CAR_NO    ,   /*차량번호*/
                A.CAR_OWNER                                             AS CAR_OWNER ,   /*차량소유자*/
                A.C_MILEAGE                                             AS C_MILEAGE ,   /*현재주행거리*/
                '0'                                                     AS MA_MILEAGE,   /*월 평균주행거리*/
                A.REQ_TEXT                                              AS REQ_TEXT,     /*비고(기타정보)*/
                C.BIRTH_DAY,
                C.MOB_NO,
                D.VBELN,
                D.VBELN_D,
                A.CHAN_CD,
                A.STAT_CD,
                A.SEASON_CD,                                                             /*계절구분코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,    /*계절구분      */
                A.MAKER_CD,                                                              /*카메이커      */
                A.MODEL_CD,                                                              /*차종          */
                A.CONTENTS_CD,                                                           /*사양          */
                A.FR_CD,                                                                 /*전후 구분     */
                E.PROVSN_NO,                                                             /*가계약번호    */
                CASE
                    WHEN A.END_TP IN ('C') OR A.CNT_CD IN ('01') THEN
                        NULL
                    WHEN A.END_TP IN ('E') THEN
                        A.CANC_DAY
                    ELSE
                        TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(A.PROC_DAY, 'YYYYMMDD'), A.PERIOD_CD)), -3), 'YYYYMMDD')
                END AS RERENT_DAY_F,                                                     /*재렌탈가능일(from) */
                CASE
                    WHEN A.END_TP IN ('C') OR A.CNT_CD IN ('01') THEN
                        NULL
                    ELSE
                        TO_CHAR(ADD_MONTHS(TO_DATE(A.PROC_DAY, 'YYYYMMDD'), 60)-1, 'YYYYMMDD')
                END AS RERENT_DAY_T,                                                      /*재렌탈가능일(to)   */
                VBELN_R
        FROM    RTSD0108 A INNER JOIN RTSD0106 B ON A.ORD_NO = B.ORD_NO
                           INNER JOIN RTSD0100 C ON A.CUST_NO = C.CUST_NO
                           LEFT OUTER JOIN RTSD0115 D ON A.ORD_NO = D.ORD_NO AND D.TRANS_TP = 'N'
                           LEFT OUTER JOIN RTSD0121 E ON A.ORD_NO = E.ORD_NO
        WHERE   A.ORD_NO = v_Ord_No;

    ELSE

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_NO                                                AS ORD_NO   ,    /*계약번호*/
                A.CUST_NO                                               AS CUST_NO   ,   /*고객번호*/
                PKG_RTSD0100.F_SRTSD0100CUSTNAME(A.CUST_NO)             AS CUST_NM   ,   /*고객명*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID)      AS ORD_NM    ,   /*주문구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM   ,   /*채널구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID)     AS SALE_NM   ,   /*계약유형*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM   ,   /*계약상태*/
                A.ORD_DAY                                               AS ORD_DAY   ,   /*접수일자*/
                B.PLAN_DAY                                              AS PLAN_DAY  ,   /*장착일예정일*/
                A.PROC_DAY                                              AS PROC_DAY  ,   /*장착일자*/
                A.CANC_DAY                                              AS CANC_DAY  ,   /*취소일자*/
                B.MAT_CD                                                AS MAT_CD    ,   /*상품코드*/
                Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD)               AS MAT_NM    ,   /*상품명*/
                TO_NUMBER(B.ORD_QTY)                                    AS ORD_QTY   ,   /*수량*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)   AS PERIOD_NM ,   /*총렌탈기간*/
                'N'                                                     AS OS_YN     ,   /*소유권이전여부*/
                'N'                                                     AS MFP_YN    ,   /*중도완납여부*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM     ,   /*프리미엄서비스*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD)    AS MAKER_NM  ,   /*카메이커*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD)       AS MC_NM     ,   /*차종*/
                A.CAR_NO                                                AS CAR_NO    ,   /*차량번호*/
                A.CAR_OWNER                                             AS CAR_OWNER ,   /*차량소유자*/
                A.C_MILEAGE                                             AS C_MILEAGE ,   /*현재주행거리*/
                '0'                                                     AS MA_MILEAGE,   /*월 평균주행거리*/
                A.REQ_TEXT                                              AS REQ_TEXT,     /*비고(기타정보)*/
                C.BIRTH_DAY,
                C.MOB_NO,
                D.VBELN,
                D.VBELN_D,
                A.CHAN_CD,
                A.STAT_CD,
                A.SEASON_CD,                                                             /*계절구분코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,    /*계절구분      */
                A.MAKER_CD,                                                              /*카메이커      */
                A.MODEL_CD,                                                              /*차종          */
                A.CONTENTS_CD,                                                           /*사양          */
                A.FR_CD,                                                                 /*전후 구분     */
                E.PROVSN_NO,                                                             /*가계약번호    */
                NULL                                                    AS RERENT_DAY_F, /*재렌탈가능일(from) */
                NULL                                                    AS RERENT_DAY_T, /*재렌탈가능일(to)   */
                VBELN_R
        FROM    RTSD0104 A INNER JOIN RTSD0106 B ON A.ORD_NO = B.ORD_NO
                           INNER JOIN RTSD0100 C ON A.CUST_NO = C.CUST_NO
                           LEFT OUTER JOIN RTSD0115 D ON A.ORD_NO = D.ORD_NO AND D.TRANS_TP = 'N'
                           LEFT OUTER JOIN RTSD0121 E ON A.ORD_NO = E.ORD_NO
        WHERE   A.ORD_NO = v_Ord_No;

    END IF;

  END p_sRtsdContractStatus;


 /*****************************************************************************
  -- 계약 현황 조회 NEW
  -- - 재렌탈가능일 기준은 Pkg_Comm.p_sReRentalInfo 와 동일해야 함

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2018-12-03  박 철            최초작성
   1.15       2019-12-21  kstka            [20191221_01] O2O연계 컬럼 추가
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatusNew (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
  ) IS

  BEGIN

    IF 0 != Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_NO                                                AS ORD_NO    ,   /*계약번호*/
                A.CUST_NO                                               AS CUST_NO   ,   /*고객번호*/
                PKG_RTSD0100.F_SRTSD0100CUSTNAME(A.CUST_NO)             AS CUST_NM   ,   /*고객명*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID)      AS ORD_NM    ,   /*주문구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM   ,   /*채널구분*/
                CASE WHEN A.INST_CD IS NOT NULL THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID) || '(' || Pkg_Rtcm0051.f_sRtcm0051Codename('S304', A.INST_CD) || ')' 
                    ELSE Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID) END AS SALE_NM   ,   /*계약유형*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM   ,   /*계약상태*/
                A.ORD_DAY                                               AS ORD_DAY   ,   /*접수일자*/
                B.SALE_CD                                                            ,   /*판매코드*/
                A.MODEL_CD                                                           ,   /*카모델CD*/
                A.PROC_DAY                                              AS PROC_DAY  ,   /*장착일자*/
                A.CANC_DAY                                              AS CANC_DAY  ,   /*취소일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)   AS PERIOD_NM ,   /*총렌탈기간*/
                'N'                                                     AS OS_YN     ,   /*소유권이전여부*/
--                CASE WHEN G.COL_01 IS NULL THEN Pkg_Rtsd0108.f_sRtsd0108Mfp_Yn(A.ORD_NO)
--                     ELSE 'C' END                                       AS MFP_YN    ,   /*중도완납여부*/
                (CASE WHEN A.MFP_YN = 'Y' THEN
                                CASE WHEN A.END_TP = 'E' THEN '중도완납' 
                                     ELSE CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = A.ORD_NO) > 0 THEN '채권매각' ELSE '중도해지' END 
                                END
                             ELSE ''                                    
                             END) AS MFP_YN,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM     ,   /*프리미엄서비스*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD)    AS MAKER_NM  ,   /*카메이커*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD)       AS MC_NM     ,   /*차종*/
                A.CAR_NO                                                AS CAR_NO    ,   /*차량번호*/
                A.CAR_OWNER                                             AS CAR_OWNER ,   /*차량소유자*/
                A.C_MILEAGE                                             AS C_MILEAGE ,   /*현재주행거리*/
                '0'                                                     AS MA_MILEAGE,   /*월 평균주행거리*/
                A.REQ_TEXT                                              AS REQ_TEXT,     /*비고(기타정보)*/
                C.BIRTH_DAY,
                C.MOB_NO,
                D.VBELN,
                D.VBELN_D,
                A.CHAN_CD,
                A.STAT_CD,
                A.SEASON_CD,                                                             /*계절구분코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,    /*계절구분      */
                A.MAKER_CD,                                                              /*카메이커      */
                A.MODEL_CD,                                                              /*차종          */
                A.CONTENTS_CD,                                                           /*사양          */
                A.FR_CD,                                                                 /*전후 구분     */
                E.PROVSN_NO,                                                             /*가계약번호    */
                CASE
                    WHEN A.END_TP IN ('C') OR A.CNT_CD IN ('01') THEN
                        NULL
                    WHEN A.END_TP IN ('E') THEN
                        A.CANC_DAY
                    ELSE
                        TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(A.PROC_DAY, 'YYYYMMDD'), A.PERIOD_CD)), -3), 'YYYYMMDD')
                END AS RERENT_DAY_F,                                                     /*재렌탈가능일(from) */
                CASE
                    WHEN A.END_TP IN ('C') OR A.CNT_CD IN ('01') THEN
                        NULL
                    ELSE
                        TO_CHAR(ADD_MONTHS(TO_DATE(A.PROC_DAY, 'YYYYMMDD'), 60)-1, 'YYYYMMDD')
                END AS RERENT_DAY_T,                                                      /*재렌탈가능일(to)   */
                F.SALE_NM AS SALE_CD_NM,
                CASE
                    WHEN NVL(F.DC_RATE, '0') != '0'  THEN TO_CHAR(F.DC_RATE, 'FM9990D99') || '%'
                    ELSE TO_CHAR(F.DC_AMT)
                END SALE_CD_DC,
                A.CNT_CD,
                A.AGENCY_CD,
                H.POS_CD,
                H.CITY,
                H.STREET,
                TO_CHAR(SYSDATE, 'YYYYMMDD') AS TODAY,
                Pkg_Exif0003.f_sExif0003O2OAgency(A.AGENCY_CD) AS O2O_YN,
                B.TMS_ORDERID,
                B.OMS_ORDERNO,
                (SELECT CANC_CD FROM RTSD0430 WHERE ORD_NO = A.ORD_NO AND ROWNUM = 1) AS CANC_CD,
                Pkg_Rtsd0421.f_GetSendHist(A.ORD_NO, 1) AS FIRST_DAY,        --[20211018_01] kstka 도착문자발송여부 (1회차)
                A.BOND_SEL_DAY,      --[20220104_01] kstka 채권매각일자
                D.VBELN_R,           --[20230920_1] kstka 취소오더번호
                I.MAT_CD              --[20230920_1] kstka 제품코드
        FROM    RTSD0108 A INNER JOIN RTSD0104 B ON A.ORD_NO = B.ORD_NO
                           INNER JOIN RTSD0100 C ON A.CUST_NO = C.CUST_NO
                           LEFT OUTER JOIN RTSD0115 D ON A.ORD_NO = D.ORD_NO AND D.TRANS_TP = 'N'
                           LEFT OUTER JOIN RTSD0121 E ON A.ORD_NO = E.ORD_NO
                           LEFT OUTER JOIN RTSD0020 F ON B.SALE_CD = F.SALE_CD
                           LEFT OUTER JOIN RTTEMPIWJ_190429_01 G ON A.ORD_NO = G.COL_01
                           INNER JOIN RTSD0007 H ON A.AGENCY_CD = H.AGENCY_CD
                           INNER JOIN RTSD0106 I ON A.ORD_NO = I.ORD_NO
        WHERE   A.ORD_NO = v_Ord_No;

    ELSE

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_NO                                                AS ORD_NO   ,    /*계약번호*/
                A.CUST_NO                                               AS CUST_NO   ,   /*고객번호*/
                PKG_RTSD0100.F_SRTSD0100CUSTNAME(A.CUST_NO)             AS CUST_NM   ,   /*고객명*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID)      AS ORD_NM    ,   /*주문구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM   ,   /*채널구분*/
                CASE WHEN A.INST_CD IS NOT NULL THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID) || '(' || Pkg_Rtcm0051.f_sRtcm0051Codename('S304', A.INST_CD) || ')' 
                    ELSE Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID) END AS SALE_NM   ,   /*계약유형*/
                
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM   ,   /*계약상태*/
                A.ORD_DAY                                               AS ORD_DAY   ,   /*접수일자*/
                A.SALE_CD                                                            ,   /*판매코드*/
                A.MODEL_CD                                                           ,   /*카모델CD*/
                A.PROC_DAY                                              AS PROC_DAY  ,   /*장착일자*/
                A.CANC_DAY                                              AS CANC_DAY  ,   /*취소일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)   AS PERIOD_NM ,   /*총렌탈기간*/
                'N'                                                     AS OS_YN     ,   /*소유권이전여부*/
--                CASE WHEN G.COL_01 IS NULL THEN Pkg_Rtsd0108.f_sRtsd0108Mfp_Yn(A.ORD_NO)
--                     ELSE 'C' END                                       AS MFP_YN    ,   /*중도완납여부*/
                (SELECT CASE WHEN MFP_YN = 'Y' THEN
                                CASE WHEN END_TP = 'E' THEN '중도완납' 
                                     ELSE CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = Y.ORD_NO) > 0 THEN '채권매각' ELSE '중도해지' END 
                                END
                             ELSE ''                                    
                             END
                        FROM RTSD0108 Y 
                        WHERE Y.ORD_NO = A.ORD_NO
                        AND ROWNUM = 1) AS MFP_YN, 
                Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM     ,   /*프리미엄서비스*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD)    AS MAKER_NM  ,   /*카메이커*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD)       AS MC_NM     ,   /*차종*/
                A.CAR_NO                                                AS CAR_NO    ,   /*차량번호*/
                A.CAR_OWNER                                             AS CAR_OWNER ,   /*차량소유자*/
                A.C_MILEAGE                                             AS C_MILEAGE ,   /*현재주행거리*/
                '0'                                                     AS MA_MILEAGE,   /*월 평균주행거리*/
                A.REQ_TEXT                                              AS REQ_TEXT,     /*비고(기타정보)*/
                C.BIRTH_DAY,
                C.MOB_NO,
                D.VBELN,
                D.VBELN_D,
                A.CHAN_CD,
                A.STAT_CD,
                A.SEASON_CD,                                                             /*계절구분코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,    /*계절구분      */
                A.MAKER_CD,                                                              /*카메이커      */
                A.MODEL_CD,                                                              /*차종          */
                A.CONTENTS_CD,                                                           /*사양          */
                A.FR_CD,                                                                 /*전후 구분     */
                E.PROVSN_NO,                                                             /*가계약번호    */
                NULL                                                    AS RERENT_DAY_F, /*재렌탈가능일(from) */
                NULL                                                    AS RERENT_DAY_T,  /*재렌탈가능일(to)   */
                F.SALE_NM AS SALE_CD_NM,
                CASE
                    WHEN NVL(F.DC_RATE, '0') != '0'  THEN TO_CHAR(F.DC_RATE, 'FM9990D99') || '%'
                    ELSE TO_CHAR(F.DC_AMT)

                END SALE_CD_DC,
                A.CNT_CD,
                A.AGENCY_CD,
                H.POS_CD,
                H.CITY,
                H.STREET,
                TO_CHAR(SYSDATE, 'YYYYMMDD') AS TODAY,
                Pkg_Exif0003.f_sExif0003O2OAgency(A.AGENCY_CD) AS O2O_YN,
                A.TMS_ORDERID,
                A.OMS_ORDERNO,
                (SELECT CANC_CD FROM RTSD0430 WHERE ORD_NO = A.ORD_NO AND ROWNUM = 1) AS CANC_CD,
                Pkg_Rtsd0421.f_GetSendHist(A.ORD_NO, 1) AS FIRST_DAY,        --[20211018_01] kstka 도착문자발송여부 (1회차)
                ''          AS BOND_SEL_DAY,      --[20220104_01] kstka 채권매각일자
                D.VBELN_R,            --[20230920_1] kstka 취소오더번호
                I.MAT_CD              --[20230920_1] kstka 제품코드
        FROM    RTSD0104 A INNER JOIN RTSD0100 C ON A.CUST_NO = C.CUST_NO
                           LEFT OUTER JOIN RTSD0115 D ON A.ORD_NO = D.ORD_NO AND D.TRANS_TP = 'N'
                           LEFT OUTER JOIN RTSD0121 E ON A.ORD_NO = E.ORD_NO
                           LEFT OUTER JOIN RTSD0020 F ON A.SALE_CD = F.SALE_CD
                           LEFT OUTER JOIN RTTEMPIWJ_190429_01 G ON A.ORD_NO = G.COL_01
                           INNER JOIN RTSD0007 H ON A.AGENCY_CD = H.AGENCY_CD
                           INNER JOIN RTSD0106 I ON A.ORD_NO = I.ORD_NO
        WHERE   A.ORD_NO = v_Ord_No;

    END IF;

  END p_sRtsdContractStatusNew;

  /*****************************************************************************
  -- 계약 현황 조회 - 설치정보
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_install (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE                        /*주문번호*/
    ) IS

  BEGIN

    IF 0 != Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN

        OPEN Ref_Cursor FOR
        SELECT  Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)            AS AGENCY_NM    ,    /*장착대리점*/
                A.PROC_DAY                                               AS PROC_DAY     ,    /*장착일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S019', A.SALES_OFFICE) AS SALES_OFFICE ,    /*지점*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S018', A.SALES_GROUP)  AS SALES_GROUP  ,    /*지사*/
                A.ENG_NM                                                 AS ENG_NM       ,    /*장착기사*/
                C.EQU_NO                                                 AS EQU_NO       ,    /*설비번호*/
                B.INST_YN                                                AS INST_YN      ,    /*장착여부*/
                B.PLAN_DAY                                               AS PLAN_DAY     ,    /*장착예정일*/
                B.MAT_DESC                                               AS AG_DESC      ,    /*특이(장착)*/
                C.EQU_NO                                                 AS EQU_NO        ,    /*설비번호*/
                D.INST_CD                                                 AS INST_CD        ,   /*장착유형*/
                E.CD_NM                                                   AS INST_NM       , /*장착유형명*/
                D.INST_TM                                                 AS INST_TM        ,   /*장착시간*/
                D.INST1_POSCD                                           AS INST1_POSCD        ,   /*장착주소1 - 우편번호*/
                D.INST1_ADDR1                                           AS INST1_ADDR1        ,   /*장착주소1 - 주소*/
                D.INST1_ADDR2                                           AS INST1_ADDR2        ,   /*장착주소1 - 상세주소*/
                D.INST2_POSCD                                           AS INST2_POSCD        ,   /*장착주소2 - 우편번호*/
                D.INST2_ADDR1                                           AS INST2_ADDR1        ,   /*장착주소2 - 주소*/
                D.INST2_ADDR2                                           AS INST2_ADDR2        ,   /*장착주소2 - 상세주소*/
                D.INST_DAY                                                AS INST_DAY         ,      /*장착예정일자*/
                F.AGENCY_CD                                             AS AGENCY_CD          ,
                '(' || F.POS_CD || ') ' || F.CITY || ' ' || F.STREET    AS ADDR               ,
                F.MOB_NO                                                AS MOB_NO
        FROM    RTSD0108 A,
                RTSD0106 B,
                RTCS0001 C,
                RTSD0104 D,
                RTCM0051 E,
                RTSD0007 F
        WHERE   A.ORD_NO = v_Ord_No
        AND     A.ORD_NO = B.ORD_NO
        AND     A.ORD_NO = D.ORD_NO
        AND     A.ORD_NO = C.ORD_NO(+)
        AND     D.INST_CD = E.CD(+)
        AND     E.CD_GRP_CD(+) = 'S304'
        AND     A.AGENCY_CD = F.AGENCY_CD;

    ELSE

        OPEN Ref_Cursor FOR
        SELECT  Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)            AS AGENCY_NM    ,    /*장착대리점*/
                B.PLAN_DAY                                               AS PROC_DAY     ,    /*장착일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S019', A.SALES_OFFICE) AS SALES_OFFICE ,    /*지점*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S018', A.SALES_GROUP)  AS SALES_GROUP  ,    /*지사*/
                A.ENG_NM                                                 AS ENG_NM       ,    /*장착기사*/
                C.EQU_NO                                                 AS EQU_NO       ,    /*설비번호*/
                B.INST_YN                                                AS INST_YN      ,    /*장착여부*/
                B.PLAN_DAY                                               AS PLAN_DAY     ,    /*장착예정일*/
                B.MAT_DESC                                               AS AG_DESC      ,    /*특이(장착)*/
                C.EQU_NO                                                 AS EQU_NO        ,   /*설비번호*/
                A.INST_CD                                                 AS INST_CD        ,   /*장착유형*/
                D.CD_NM                                                   AS INST_NM        ,   /*장착유형명*/
                A.INST_TM                                                 AS INST_TM        ,   /*장착시간*/
                A.INST1_POSCD                                           AS INST1_POSCD        ,   /*장착주소1 - 우편번호*/
                A.INST1_ADDR1                                           AS INST1_ADDR1        ,   /*장착주소1 - 주소*/
                A.INST1_ADDR2                                           AS INST1_ADDR2        ,   /*장착주소1 - 상세주소*/
                A.INST2_POSCD                                           AS INST2_POSCD        ,   /*장착주소2 - 우편번호*/
                A.INST2_ADDR1                                           AS INST2_ADDR1        ,   /*장착주소2 - 주소*/
                A.INST2_ADDR2                                           AS INST2_ADDR2        ,   /*장착주소2 - 상세주소*/
                A.INST_DAY                                                AS INST_DAY         ,      /*장착예정일자*/
                E.AGENCY_CD                                             AS AGENCY_CD          ,
                '(' || E.POS_CD || ') ' || E.CITY || ' ' || E.STREET    AS ADDR               ,
                E.MOB_NO                                                AS MOB_NO
        FROM    RTSD0104 A,
                RTSD0106 B,
                RTCS0001 C,
                RTCM0051 D,
                RTSD0007 E
        WHERE   A.ORD_NO = v_Ord_No
        AND     A.ORD_NO = B.ORD_NO
        AND     A.ORD_NO = C.ORD_NO(+)
        AND     A.INST_CD = D.CD(+)
        AND     D.CD_GRP_CD(+) = 'S304'
        AND     A.AGENCY_CD = E.AGENCY_CD;

    END IF;

  END p_sRtsdContractStatus_install;

  /*****************************************************************************
  -- 계약 현황 조회 - 결제정보
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_pay (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE                        /*주문번호*/
    ) IS

  BEGIN
    IF 0 != Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN

        OPEN Ref_Cursor FOR
        SELECT  Pkg_Rtcm0051.f_sRtcm0051Codename('R004', A.PAY_MTHD)   AS PAY_MTHD  ,   /*결제구분*/
                A.PAY_DD                                               AS PAY_DD     ,  /*이체일*/
                A.ACC_SEQ                                              AS ACC_SEQ    ,  /*계좌순번*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('R001', B.BANK_CD)    AS BANK_NM    ,  /*은행*/
                B.ACCT_NO                                              AS ACCT_NO    ,  /*계좌번호*/
                A.CRD_SEQ                                              AS CRD_SEQ    ,  /*카드순번*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('R002', C.CARDCOM_CD) AS CARDCOM_NM ,  /*카드사*/
                C.CARD_NO                                              AS CARD_NO    ,  /*카드번호*/
                A.ACC_CHK                                              AS ACC_CHK    ,  /*계좌확인상태*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('R008', A.ACC_STAT)   AS ACC_STAT   ,  /*계좌신청상태*/
                A.BKEY_CHK                                             AS BKEY_CHK   ,  /*배치키생셩여부*/
                A.BATCH_KEY                                            AS BATCH_KEY  ,  /*BATCH KEY*/
                A.BILL_YN                                              AS BILL_YN,       /*세금계산서발행여부*/
                (SELECT SUM_MON_AMT FROM RTSD0104 WHERE ORD_NO = A.ORD_NO)  AS SUM_MON_AMT /*월렌탈료*/
        FROM    RTSD0108 A,
                RTRE0010 B,
                RTRE0020 C
        WHERE   A.ORD_NO  = v_Ord_No
        AND     A.ACC_SEQ = B.ACC_SEQ(+)
        AND     A.CRD_SEQ = C.CRD_SEQ(+);

    ELSE

        OPEN Ref_Cursor FOR
        SELECT  Pkg_Rtcm0051.f_sRtcm0051Codename('R004', A.PAY_MTHD)   AS PAY_MTHD  ,   /*결제구분*/
                A.PAY_DD                                               AS PAY_DD    ,   /*이체일*/
                A.ACC_SEQ                                              AS ACC_SEQ   ,   /*계좌순번*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('R001', B.BANK_CD)    AS BANK_NM   ,   /*은행*/
                B.ACCT_NO                                              AS ACCT_NO   ,   /*계좌번호*/
                A.CRD_SEQ                                              AS CRD_SEQ   ,   /*카드순번*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('R002', C.CARDCOM_CD) AS CARDCOM_NM,   /*카드사*/
                C.CARD_NO                                              AS CARD_NO   ,   /*카드번호*/
                A.ACC_CHK                                              AS ACC_CHK   ,   /*계좌확인상태*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('R008', A.ACC_STAT)   AS ACC_STAT  ,   /*계좌신청상태*/
                A.BKEY_CHK                                             AS BKEY_CHK  ,   /*배치키생셩여부*/
                A.BATCH_KEY                                            AS BATCH_KEY ,   /*BATCH KEY*/
                A.BILL_YN                                              AS BILL_YN,      /*세금계산서발행여부*/
                A.SUM_MON_AMT                                    AS SUM_MON_AMT /*월렌탈료*/
        FROM    RTSD0104 A,
                RTRE0010 B,
                RTRE0020 C
        WHERE   A.ORD_NO = v_Ord_No
        AND     A.ACC_SEQ = B.ACC_SEQ(+)
        AND     A.CRD_SEQ = C.CRD_SEQ(+);

    END IF;

  END p_sRtsdContractStatus_pay;

 /*****************************************************************************
 -- 계약 현황 조회- 할인정보
 *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_discount (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE         /*주문번호              */
    ) IS

  BEGIN
    IF 0 != Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN

        OPEN Ref_Cursor FOR
        SELECT  B.REGI_AMT   AS REGI_AMT ,    /*렌탈등록비*/
                B.MON_AMT    AS MON_AMT  ,    /*월렌탈료*/
                B.RENT_AMT   AS RENT_AMT ,    /*월렌탈료(조견표)*/
                B.MON_DCAMT  AS MON_DCAMT,    /*월렌탈료 할인*/
                C_DCAMT      AS C_DCAMT  ,    /*캠페인할인금액*/
                A.GRP_YN     AS GRP_YN   ,    /*고객결합여부*/
                A.GRP_NO     AS GRP_NO   ,    /*고객결합번호*/
                A.G_DCRATE   AS G_DCRATE ,    /*결합할인율*/
                A.G_DCAMT    AS G_DCAMT  ,    /*결합할인액*/
                A.L_DCRATE   AS L_DCRATE ,    /*제한할인율*/
                A.L_DCAMT    AS L_DCAMT  ,    /*제한할인액*/
                A.F_DCAMT    AS F_DCAMT      /*최종할인액*/
        FROM    RTSD0108 A,
                RTSD0106 B
        WHERE   A.ORD_NO = v_Ord_No
        AND     A.ORD_NO = B.ORD_NO;

    ELSE
        OPEN Ref_Cursor FOR
        SELECT  B.REGI_AMT   AS REGI_AMT ,    /*렌탈등록비*/
                B.MON_AMT    AS MON_AMT  ,    /*월렌탈료*/
                B.RENT_AMT   AS RENT_AMT ,    /*월렌탈료(조견표)*/
                B.MON_DCAMT  AS MON_DCAMT,    /*월렌탈료 할인*/
                C_DCAMT      AS C_DCAMT  ,    /*캠페인할인금액*/
                A.GRP_YN     AS GRP_YN   ,    /*고객결합여부*/
                A.GRP_NO     AS GRP_NO   ,    /*고객결합번호*/
                A.G_DCRATE   AS G_DCRATE ,    /*결합할인율*/
                A.G_DCAMT    AS G_DCAMT  ,    /*결합할인액*/
                A.L_DCRATE   AS L_DCRATE ,    /*제한할인율*/
                A.L_DCAMT    AS L_DCAMT  ,    /*제한할인액*/
                A.F_DCAMT    AS F_DCAMT      /*최종할인액*/
        FROM    RTSD0104 A,
                RTSD0106 B
        WHERE   A.ORD_NO = v_Ord_No
        AND     A.ORD_NO = B.ORD_NO;

    END IF;

  END p_sRtsdContractStatus_discount;


  /*****************************************************************************
  -- 계약 현황 조회- 동의,인증
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_agree (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE                                    /*주문번호*/
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  Pkg_Rtcm0051.f_sRtcm0051Codename('S034', B.CERT_CD)              AS CERT_NM    ,      /*본인인증방법*/
            B.CERT_YN                                                        AS CERT_YN    ,      /*본인인증상태*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S033', A.CRDT_STAT)            AS CRDT_STAT  ,      /*본인인증방법*/
            Pkg_Rtcm0051.f_sRtcm0051Codename('S071', C.NAG_YN)               AS NAG_YN     ,      /*정보제공동의*/
            DECODE(A.INPUT_DT,NULL,Pkg_Rtcm0051.f_sRtcm0051Codename('S072', 'N'),Pkg_Rtcm0051.f_sRtcm0051Codename('S072', 'Y')) AS STAT_CD_1, /*계약서*/
            DECODE(A.STAT_CD,'04',Pkg_Rtcm0051.f_sRtcm0051Codename('S073', 'Y'),Pkg_Rtcm0051.f_sRtcm0051Codename('S073', 'N')) AS STAT_CD_2  /*장착확인*/
     FROM   RTSD0104 A LEFT OUTER JOIN
                                      (
                                        SELECT  CERT_CD ,CERT_YN ,CUST_NO
                                        FROM    RTSD0110
                                        WHERE   SEQ =  (
                                                        SELECT  MAX(SEQ) AS SEQ
                                                        FROM    RTSD0110
                                                        WHERE   CUST_NO = (SELECT CUST_NO FROM RTSD0104 WHERE ORD_NO = v_Ord_No)
                                                        )
                                      ) B
                             ON A.CUST_NO = B.CUST_NO
                        LEFT OUTER JOIN RTSD0111 C
                             ON  A.CUST_NO = C.CUST_NO
                             AND A.AG_DAY = C.AG_DAY
                             AND A.AG_SEQ = C.SEQ
    WHERE   A.ORD_NO = v_Ord_No
    ;

  END p_sRtsdContractStatus_agree;


  /*****************************************************************************
  -- 계약 현황 조회 - 판매인정보
  *****************************************************************************/
  PROCEDURE p_sRtsdContractStatus_seller (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE                        /*주문번호*/
    ) IS

  BEGIN

    IF 0 != Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_AGENT  AS ORD_AGENT,    /*판매인번호*/
                B.ORG_AGNM   AS ORG_AGNM ,    /*판매인성명*/
                B.ORG_AGTEL  AS ORG_AGTEL,    /*판매인연락처*/
                ''           AS ORG_CD   ,    /*판매인조직*/
                ''           AS ORG_NM   ,    /*판매인조직명*/
                ''           AS ORG_TEL       /*연락처*/
        FROM    RTSD0108 A,
                RTSD0113 B
        WHERE   A.ORD_NO    = v_Ord_No
        AND     A.ORD_AGENT = B.ORD_AGENT;

    ELSE

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_AGENT  AS ORD_AGENT,    /*판매인번호*/
                B.ORG_AGNM   AS ORG_AGNM ,    /*판매인성명*/
                B.ORG_AGTEL  AS ORG_AGTEL,    /*판매인연락처*/
                ''           AS ORG_CD   ,    /*판매인조직*/
                ''           AS ORG_NM   ,    /*판매인조직명*/
                ''           AS ORG_TEL       /*연락처*/
        FROM    RTSD0104 A,
                RTSD0113 B
        WHERE   A.ORD_NO    = v_Ord_No
        AND     A.ORD_AGENT = B.ORD_AGENT;

    END IF;

  END p_sRtsdContractStatus_seller;


  /*****************************************************************************
  -- 계약 정보 저장전 설정한 차량수 Count

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.5        2017-11-14  wjim             [20171114_01] 기간만료, 중도완납(해지) 제외가 되지 않던 문제 보완
   1.13       2019-11-15  kstka            [20191115_01] SUM함수 -> COUNT함수로 변경
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetCarCount(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE          /*차량번호              */
    ) RETURN NUMBER IS

    v_Car_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(A3.CAR_NO) AS CNT
      INTO  v_Car_Cnt
      FROM  (
                SELECT  DISTINCT CAR_NO
                  FROM  (
                            SELECT  A1.ORD_NO
                                 ,  A1.CAR_NO
                                 ,  NVL(B1.OS_YN , 'N')                         AS OS_YN
                                 ,  NVL(B1.OS_DAY, TO_CHAR(SYSDATE,'YYYYMMDD')) AS OS_DAY
                                 ,  NVL(B1.MFP_YN, 'N')                         AS MFP_YN
                              FROM  RTSD0104 A1
                                 ,  RTSD0108 B1
                             WHERE  A1.CUST_NO = v_Cust_No
                               AND  A1.CAR_NO <> REPLACE(v_Car_No,' ','')
                               AND  A1.STAT_CD   NOT IN ('06')
                               AND  A1.SEASON_CD NOT IN ('02')
                               AND  A1.ORD_NO  = B1.ORD_NO(+)
                        ) A2
                 WHERE  A2.OS_YN  = 'N'
                   AND  A2.OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD')
                   AND  A2.MFP_YN = 'N'
            ) A3
    ;

    -- [20171114_01] 이전
    /*
    SELECT  COUNT(CAR_NO) AS CNT
    INTO    v_Car_Cnt
    FROM    (
            SELECT  CAR_NO AS CAR_NO
            FROM    RTSD0104
            WHERE   CUST_NO   = v_Cust_No
            AND     CAR_NO   != REPLACE(v_Car_No,' ','')
            AND     STAT_CD  != '06'
            AND     SEASON_CD != '02'
            GROUP   BY CAR_NO
            UNION
            SELECT  CAR_NO AS CAR_NO
            FROM    RTSD0108
            WHERE   CUST_NO   = v_Cust_No
            AND     CAR_NO   != REPLACE(v_Car_No,' ','')
            AND     STAT_CD  != '06'
            AND     SEASON_CD != '02'
            AND     OS_YN     = 'N'
            AND     MFP_YN    = 'N'
            GROUP   BY CAR_NO
            );
    */

    RETURN v_Car_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104SetCarCount;

  /*****************************************************************************
  -- 계약 정보 저장전 설정한 타이어본수 Count

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.5        2017-11-14  wjim             [20171114_01] 기간만료, 중도완납(해지) 제외가 되지 않던 문제 보완
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetTireNbCount(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,         /*고객번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE         /*고객번호              */
    ) RETURN NUMBER IS
    v_Tire_Cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  SUM(A2.CNT) AS CNT
      INTO  v_Tire_Cunt
      FROM  (
                SELECT  A1.ORD_NO
                     ,  TO_NUMBER(NVL(B1.CNT_CD, A1.CNT_CD))        AS CNT
                     ,  NVL(B1.OS_YN , 'N')                         AS OS_YN
                     ,  NVL(B1.OS_DAY, TO_CHAR(SYSDATE,'YYYYMMDD')) AS OS_DAY
                     ,  NVL(B1.MFP_YN, 'N')                         AS MFP_YN
                  FROM  RTSD0104 A1
                     ,  RTSD0108 B1
                 WHERE  A1.CUST_NO = v_Cust_No
                   AND  A1.CAR_NO = v_Car_No
                   AND  A1.STAT_CD   NOT IN ('06')
                   AND  A1.SEASON_CD NOT IN ('02')
                   AND  A1.ORD_NO  = B1.ORD_NO(+)
            ) A2
     WHERE  A2.OS_YN  = 'N'
       AND  A2.OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD')
       AND  A2.MFP_YN = 'N'
    ;

    -- [20171114_01] 이전
    /*
    SELECT  SUM(CNT) AS CNT
    INTO    v_Tire_Cunt
    FROM    (
            SELECT  ORD_NO AS ORD_NO,
                    TO_NUMBER(CNT_CD)  AS CNT
            FROM    RTSD0104
            WHERE   CUST_NO  = v_Cust_No
            AND     STAT_CD   != '06'
            AND     SEASON_CD != '02'
            UNION
            SELECT  ORD_NO AS ORD_NO,
                    TO_NUMBER(CNT_CD)  AS CNT
            FROM    RTSD0108
            WHERE   CUST_NO = v_Cust_No
            AND     STAT_CD   != '06'
            AND     SEASON_CD != '02'
            AND     ( OS_YN  = 'N' AND OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD') )
            AND     MFP_YN    = 'N'
            );
    */

    RETURN v_Tire_Cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104SetTireNbCount;


  /*****************************************************************************
  -- 계약 정보 저장전 설정한 타이어본수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetOlimitCnt(
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE       /*장착 대리점           */
    ) RETURN NUMBER IS

    v_SetOlimit_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(ORD_DAY)
    INTO    v_SetOlimit_Cnt
    FROM    RTSD0104
    WHERE   ORD_DAY   = v_Ord_Day
    AND     STAT_CD   != '06'
    AND     SEASON_CD != '02'
    AND     AGENCY_CD = v_Agency_Cd;

    RETURN v_SetOlimit_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104SetOlimitCnt;

    /*****************************************************************************
  -- 계약 정보 수정전 설정한 차량수 Count

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.5        2017-11-14  wjim             [20171114_01] 기간만료, 중도완납(해지) 제외가 되지 않던 문제 보완
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetCarCountUp(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE          /*차량번호              */
    ) RETURN NUMBER IS

    v_Car_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  SUM(A3.CAR_NO) AS CNT
      INTO  v_Car_Cnt
      FROM  (
                SELECT  DISTINCT CAR_NO
                  FROM  (
                            SELECT  A1.ORD_NO
                                 ,  A1.CAR_NO
                                 ,  NVL(B1.OS_YN , 'N')                         AS OS_YN
                                 ,  NVL(B1.OS_DAY, TO_CHAR(SYSDATE,'YYYYMMDD')) AS OS_DAY
                                 ,  NVL(B1.MFP_YN, 'N')                         AS MFP_YN
                              FROM  RTSD0104 A1
                                 ,  RTSD0108 B1
                             WHERE  A1.CUST_NO = v_Cust_No
                               AND  A1.ORD_NO <> v_Ord_No
                               AND  A1.CAR_NO <> REPLACE(v_Car_No,' ','')
                               AND  A1.STAT_CD   NOT IN ('06')
                               AND  A1.SEASON_CD NOT IN ('02')
                               AND  A1.ORD_NO  = B1.ORD_NO(+)
                        ) A2
                 WHERE  A2.OS_YN  = 'N'
                   AND  A2.OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD')
                   AND  A2.MFP_YN = 'N'
            ) A3
    ;

    -- [20171114_01] 이전
    /*
    SELECT  COUNT(CAR_NO) AS CNT
    INTO    v_Car_Cnt
    FROM    (
            SELECT  CAR_NO AS CAR_NO
            FROM    RTSD0104
            WHERE   CUST_NO = v_Cust_No
            AND     CAR_NO  != REPLACE(v_Car_No,' ','')
            AND     STAT_CD != '06'
            AND     SEASON_CD != '02'
            AND     ORD_NO  != v_Ord_No
            GROUP   BY CAR_NO
            UNION
            SELECT  CAR_NO AS CAR_NO
            FROM    RTSD0108
            WHERE   CUST_NO = v_Cust_No
            AND     CAR_NO  != REPLACE(v_Car_No,' ','')
            AND     STAT_CD != '06'
            AND     SEASON_CD != '02'
            AND     (OS_YN  = 'N' OR OS_DAY <= TO_CHAR(SYSDATE,'YYYYMMDD'))
            AND     MFP_YN  = 'N'
            AND     ORD_NO  != v_Ord_No
            GROUP   BY CAR_NO
            )
        ;
    */

    RETURN v_Car_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104SetCarCountUp;

  /*****************************************************************************
  -- 계약 정보 수정전 설정한 타이어본수 Count

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.5        2017-11-14  wjim             [20171114_01] 기간만료, 중도완납(해지) 제외가 되지 않던 문제 보완
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetTireNbCountUp(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    ) RETURN NUMBER IS
    v_Tire_Cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  SUM(A2.CNT) AS CNT
      INTO  v_Tire_Cunt
      FROM  (
                SELECT  A1.ORD_NO
                     ,  TO_NUMBER(NVL(B1.CNT_CD, A1.CNT_CD))        AS CNT
                     ,  NVL(B1.OS_YN , 'N')                         AS OS_YN
                     ,  NVL(B1.OS_DAY, TO_CHAR(SYSDATE,'YYYYMMDD')) AS OS_DAY
                     ,  NVL(B1.MFP_YN, 'N')                         AS MFP_YN
                  FROM  RTSD0104 A1
                     ,  RTSD0108 B1
                 WHERE  A1.CUST_NO = v_Cust_No
                   AND  A1.ORD_NO <> v_Ord_No
                   AND  A1.STAT_CD   NOT IN ('06')
                   AND  A1.SEASON_CD NOT IN ('02')
                   AND  A1.ORD_NO  = B1.ORD_NO(+)
            ) A2
     WHERE  A2.OS_YN  = 'N'
       AND  A2.OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD')
       AND  A2.MFP_YN = 'N'
    ;

    -- [20171114_01] 이전
    /*
    SELECT  SUM(CNT) AS CNT
    INTO    v_Tire_Cunt
    FROM    (
            SELECT  ORD_NO AS ORD_NO,
                    TO_NUMBER(CNT_CD)  AS CNT
            FROM    RTSD0104
            WHERE   CUST_NO  = v_Cust_No
            AND     STAT_CD  != '06'
            AND     SEASON_CD != '02'
            AND     ORD_NO   != v_Ord_No
            UNION
            SELECT  ORD_NO AS ORD_NO,
                    TO_NUMBER(CNT_CD)  AS CNT
            FROM    RTSD0108
            WHERE   CUST_NO = v_Cust_No
            AND     STAT_CD != '06'
            AND     SEASON_CD != '02'
            AND     ( OS_YN  = 'N' AND OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD') )
            AND     MFP_YN  = 'N'
            AND     ORD_NO  != v_Ord_No
            );
    */

    RETURN v_Tire_Cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104SetTireNbCountUp;


  /*****************************************************************************
  -- 계약 정보 수정전 설정한 타이어본수 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104SetOlimitCntUp(
    v_Ord_Day        IN RTSD0104.ORD_DAY%TYPE,        /*접수일자              */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE       /*장착 대리점           */
    ) RETURN NUMBER IS

    v_SetOlimit_Cnt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(ORD_DAY)
    INTO    v_SetOlimit_Cnt
    FROM    RTSD0104
    WHERE   ORD_DAY   = v_Ord_Day
    AND     STAT_CD   != '06'
    AND     SEASON_CD != '02'
    AND     AGENCY_CD = v_Agency_Cd
    AND     ORD_NO    != v_Ord_No
    ;

    RETURN v_SetOlimit_Cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104SetOlimitCntUp;

  /*****************************************************************************
  -- 계약 정보 Update - 장착에 따른 상태 변경
  *****************************************************************************/
  FUNCTION f_Rtsd0104OnlineUpdatePsCd (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTSD0104 A
    SET     A.PS_CD  = ( SELECT B.PS_CD
                         FROM   RTSD0013 B
                         WHERE  A.ORD_NO = B.ORD_NO
                         GROUP  BY B.PS_CD),
            A.CHG_ID = v_Reg_Id,
            A.CHG_DT = SYSDATE
    WHERE   A.ORD_NO = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_Rtsd0104OnlineUpdatePsCd;


  /*****************************************************************************
  -- 계약 현황 조회 - 판매원정보
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
  *****************************************************************************/
  FUNCTION f_sRtsd0104AgentInfo(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_division       IN RTSD0104.CHAN_CD%TYPE         /*구분 01:판매인코드 02:판매인명 03:판매인전화*/
    ) RETURN VARCHAR2 IS

    v_Return RTSD0113.ORG_AGNM%TYPE DEFAULT NULL;

  BEGIN

    SELECT
            CASE WHEN v_division = '01'
                 THEN
                      CASE WHEN A.CHAN_CD = '01' THEN A.AGENCY_CD
                          WHEN  A.CHAN_CD = '02' AND  A.ORD_AGENT IS NOT NULL THEN A.ORD_AGENT
                          WHEN  A.CHAN_CD = '02' AND  A.ORD_AGENT IS NULL     THEN 'O00001'
                          WHEN  A.CHAN_CD = '03' THEN A.ORD_AGENT
                          WHEN  A.CHAN_CD = '04' THEN A.ORD_AGENT
                          WHEN  A.CHAN_CD = '05' THEN A.AGENCY_CD
                          WHEN  A.CHAN_CD = '06' THEN A.ORD_AGENT
                          WHEN  A.CHAN_CD = '09' THEN A.ORD_AGENT -- [20170316_01] B2B일시불
                          ELSE NULL
                       END
                WHEN v_division = '02'
                THEN
                     CASE WHEN A.CHAN_CD = '01' THEN B.AGENCY_NM
                          WHEN A.CHAN_CD = '02' AND  A.ORD_AGENT IS NOT NULL THEN C.ORG_AGNM
                          WHEN A.CHAN_CD = '02' AND  A.ORD_AGENT IS NULL     THEN '온라인몰'
                          WHEN A.CHAN_CD = '03' THEN C.ORG_AGNM
                          WHEN A.CHAN_CD = '04' THEN C.ORG_AGNM
                          WHEN A.CHAN_CD = '05' THEN B.AGENCY_NM
                          WHEN A.CHAN_CD = '06' THEN C.ORG_AGNM
                          WHEN A.CHAN_CD = '09' THEN C.ORG_AGNM   -- [20170316_01] B2B일시불
                          ELSE NULL
                     END
                WHEN v_division = '03'
                THEN
                    CASE WHEN  A.CHAN_CD = '01' THEN B.TEL_NO
                          WHEN A.CHAN_CD = '02' AND  A.ORD_AGENT IS NOT NULL THEN C.ORG_AGTEL
                          WHEN A.CHAN_CD = '02' AND  A.ORD_AGENT IS NULL     THEN NULL
                          WHEN A.CHAN_CD = '03' THEN C.ORG_AGTEL
                          WHEN A.CHAN_CD = '04' THEN C.ORG_AGTEL
                          WHEN A.CHAN_CD = '05' THEN B.TEL_NO
                          WHEN A.CHAN_CD = '06' THEN C.ORG_AGTEL
                          WHEN A.CHAN_CD = '09' THEN C.ORG_AGTEL   -- [20170316_01] B2B일시불
                          ELSE NULL
                     END
                END O_INFO
    INTO    v_Return
    FROM    RTSD0104 A,
            RTSD0007 B,
            RTSD0113 C
    WHERE   A.ORD_NO    = v_Ord_No
    AND     A.AGENCY_CD = B.AGENCY_CD
    AND     A.ORD_AGENT = C.ORD_AGENT (+) ;

    RETURN v_Return;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104AgentInfo;

  /*****************************************************************************
  -- SAP 주문 인터페이스 현황
  *****************************************************************************/
  PROCEDURE p_sRtsd0104SapInterfaceList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_OrddayF        IN RTSD0104.ORD_DAY%TYPE,    /*주문일From                */
    v_OrddayT        IN RTSD0104.ORD_DAY%TYPE,    /*주문일To                  */
    v_Condition      IN CHAR                      /* 1: 전송대상, 2: 전송결과 */
    ) IS

  BEGIN

    IF v_Condition = '1' THEN

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_DAY,                                                          /*주문일*/
                A.ORD_NO,                                                           /*주문번호*/
                A.STAT_CD,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD) AS STAT_NM,     /*계약상태*/
                Pkg_Rtsd0106.f_sRtsd0106PlanDay(A.ORD_NO) PLAN_DAY,                 /*장착예정일*/
                A.PROC_DAY,                                                         /*장착일*/
                A.CANC_DAY,                                                         /*취소일*/
                'N'  AS TRANS_TP,                                                   /*전송구분일*/
                NULL AS SEND_DAY,                                                   /*송신일자일*/
                NULL AS TRANS_DAY,                                                  /*수신일자일*/
                NULL AS EAI_YN,                                                     /*EAI수신여부*/
                NULL AS SAP_YN,                                                     /*SAP결과수신여부*/
                NULL AS VBELN                                                       /*SAP주문번호*/
        FROM    RTSD0104 A
        WHERE   A.ORD_DAY BETWEEN v_OrddayF AND v_OrddayT
        AND     A.STAT_CD IN ('01','03','04') -- 접수(01),장착대기(03),장착완료(04)
        AND     NOT EXISTS (SELECT 'X'
                            FROM   RTSD0115 Z
                            WHERE  Z.ORD_NO = A.ORD_NO
                            AND    Z.TRANS_TP = 'N'
                            )
        UNION   ALL
        SELECT  A.ORD_DAY,                                                          /*주문일*/
                A.ORD_NO,                                                           /*주문번호*/
                A.STAT_CD,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD) AS STAT_NM,     /*계약상태*/
                Pkg_Rtsd0106.f_sRtsd0106PlanDay(A.ORD_NO) PLAN_DAY,                 /*장착예정일*/
                A.PROC_DAY,                                                         /*장착일*/
                A.CANC_DAY,                                                         /*취소일*/
                'R'  AS TRANS_TP,                                                   /*전송구분일*/
                NULL AS SEND_DAY,                                                   /*송신일자일*/
                NULL AS TRANS_DAY,                                                  /*수신일자일*/
                NULL AS EAI_YN,                                                     /*EAI수신여부*/
                NULL AS SAP_YN,                                                     /*SAP결과수신여부*/
                NULL AS VBELN                                                       /*SAP주문번호*/
        FROM    RTSD0104 A
        WHERE   A.ORD_DAY BETWEEN v_OrddayF AND v_OrddayT
        AND     A.STAT_CD IN ('04') -- 접수(01),장착대기(03),장착완료(04)
        AND     NOT EXISTS (SELECT 'X'
                            FROM   RTSD0115 Z
                            WHERE  Z.ORD_NO = A.ORD_NO
                            AND    Z.TRANS_TP = 'R'
                            )
        ORDER   BY ORD_DAY, STAT_CD;

    ELSE
        OPEN Ref_Cursor FOR
        SELECT  A.ORD_DAY,                                                          /*주문일*/
                A.ORD_NO,                                                           /*주문번호*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD) AS STAT_NM,     /*계약상태*/
                Pkg_Rtsd0106.f_sRtsd0106PlanDay(A.ORD_NO) PLAN_DAY,                 /*장착예정일*/
                A.PROC_DAY,                                                         /*장착일*/
                A.CANC_DAY,                                                         /*취소일*/
                C.TRANS_TP AS TRANS_TP,                                             /*전송구분일*/
                C.SEND_DAY AS SEND_DAY,                                             /*송신일자일*/
                C.TRANS_DAY AS TRANS_DAY,                                           /*수신일자일*/
                C.EAI_YN AS EAI_YN,                                                 /*EAI수신여부*/
                C.SAP_YN AS SAP_YN,                                                 /*SAP결과수신여부*/
                C.VBELN AS VBELN                                                    /*SAP주문번호*/
        FROM    RTSD0104 A,
                RTSD0115 C
        WHERE   A.ORD_DAY BETWEEN v_OrddayF AND v_OrddayT
--        AND     ((A.CHAN_CD = '01' AND STAT_CD = '04') OR (A.CHAN_CD = '02' AND A.STAT_CD = '01')) /*결과는 상태에 상관없이 조회*/
        AND     A.ORD_NO = C.ORD_NO
        ORDER   BY A.ORD_DAY, A.ORD_NO, C.TRANS_TP ASC;

    END IF;

  END p_sRtsd0104SapInterfaceList;

  /*****************************************************************************
  -- 계약 정보 Update - 온라인주문취소
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104OnlineCancel (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0104
    SET    STAT_CD  = '06',
           CANC_DAY = TO_CHAR(SYSDATE, 'YYYYMMDD'),
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  ORD_NO   = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0104OnlineCancel;


  /*****************************************************************************
  -- 온라인주문취소
  *****************************************************************************/
 PROCEDURE p_Rtsd0104onlinestatupdate (
    v_Ord_No         IN OUT RTSD0104.ORD_NO%TYPE,     /*주문번호              */
    v_Canamt         IN NUMBER,
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;

    v_Get_Statcd    CHAR(5);
    v_Maxschdseq    RTSD0109.SCHD_SEQ%TYPE;
    v_Custno        RTSD0104.CUST_NO%TYPE;
    v_Salesgroup    RTSD0104.SALES_GROUP%TYPE;
    v_Salesoffice   RTSD0104.SALES_OFFICE%TYPE;
    v_Agencycd      RTSD0104.AGENCY_CD%TYPE;
    v_Paymthd       RTSD0104.PAY_MTHD%TYPE;
    v_Paydd         RTSD0104.PAY_DD%TYPE;

    v_Add_No        RTSD0104.ORD_NO%TYPE;

    v_Reg_Id RTSD0104.REG_ID%TYPE DEFAULT 'ONL_SYS';   /*등록자 ID             */

--    CUST_NO, SALES_GROUP, SALES_OFFICE, AGENCY_CD, PAY_MTHD, PAY_DD


  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    SELECT  STAT_CD
    INTO    v_Get_Statcd
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    IF TRIM(v_Get_Statcd) <> '01' THEN
        v_Return_Message := '접수상태가 아님으로 취소 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF 0 != f_UpdateRtsd0104OnlineCancel(v_Ord_No, v_Reg_Id, v_Errortext) THEN
        v_Return_Message := '취소상태로  수정 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    ELSE

        IF 0 != PKG_RTSD0106.f_UpdateRtsd0106OnlineCancel(v_Ord_No, v_Reg_Id, v_Errortext) THEN
            v_Return_Message := '취소상태로  수정 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        ELSE

            IF v_Canamt > 0 THEN

                -- 중도완납 할인대상금액 청구스케줄(RTSD0109) 생성
                SELECT  DECODE(MAX(SCHD_SEQ),NULL,1,MAX(TO_NUMBER(SCHD_SEQ)) +1)
                INTO    v_Maxschdseq
                FROM    RTSD0109
                WHERE   ORD_NO = v_Ord_NO;

                SELECT  CUST_NO, SALES_GROUP, SALES_OFFICE, AGENCY_CD, PAY_MTHD, PAY_DD
                INTO    v_Custno, v_Salesgroup, v_Salesoffice, v_Agencycd, v_Paymthd, v_Paydd
                FROM    RTSD0104
                WHERE   ORD_NO = v_Ord_NO;

                Pkg_Rtsd0109.p_IUDRtsd0109 (
                        'I'               ,                     /*(v_Comm_Dvsn   )처리구분(I,U,D)       */
                        v_Ord_No          ,                     /*(v_Ord_No      )계약번호              */
                        v_Maxschdseq      ,                     /*(v_Schd_Seq    )청구순번              */
                        '41'              ,                     /*(v_Recp_Tp     )청구구분              */
                        0                 ,                     /*(v_Recp_Nu     )청구회차              */
                        'S'               ,                     /*(v_Scd_Stat    )스케줄상태코드        */
                        v_canamt          ,                     /*(v_Sale_Amt    )매출금액(VAT 포함)    */
                        ROUND(v_canamt / 1.1),                  /*(v_Sale_Namt   )원금                  */
                        v_canamt - ROUND(v_canamt / 1.1),       /*(v_Sale_Vamt   )부가세                */
                        0                 ,                     /*(v_Recp_Amt    )수납금액(VAT포함)     */
                        v_canamt          ,                     /*(v_Arre_Amt    )연체금액(VAT포함)     */
                        TO_CHAR(SYSDATE,'YYYYMMDD')       ,     /*(v_Demd_Dt     )청구일자              */
                        'N'   ,                                 /*(v_Zlspr       )청구보류              */
                        NULL              ,                     /*(v_Rc_Day      )수납일자              */
                        'N'               ,                     /*(v_Rc_Yn       )수납여부              */
                        TO_CHAR(SYSDATE,'YYYYMMDD')       ,     /*(v_Tax_Dt      )세금계산서발행일자(예 */
                        NULL              ,                     /*(v_Tax_No      )세금계산서번호        */
                        TO_CHAR(SYSDATE,'YYYYMMDD')       ,     /*(v_Zfb_Day     )만기계산기준일        */
                        TO_CHAR(SYSDATE,'YYYYMMDD')       ,     /*(v_Cancl_Day   )중도완납일            */
                        v_Custno ,                              /*(v_Cust_No     )고객번호              */
                        v_Salesgroup ,                          /*(v_Sales_Group )지사                  */
                        v_Salesoffice ,                         /*(v_Sales_Office)지점                  */
                        v_Agencycd ,                            /*(v_Agency_Cd   )장착 대리점           */
                        TO_CHAR(SYSDATE,'YYYYMMDD')       ,     /*(v_Beg_Day     )시작일                */
                        TO_CHAR(SYSDATE,'YYYYMMDD')       ,     /*(v_End_Day     )종료일                */
                        'N'               ,                     /*(v_Delay_Yn    )연체이자적용여부      */
                        0                 ,                     /*(v_Delay_Rate  )연체 이자율           */
                        v_Paymthd         ,                     /*(v_Pay_Mthd    )결제구분              */
                        v_Paydd           ,                     /*(v_Pay_Dd      )이체일                */
                        'Y'               ,                     /*(v_Use_Yn      )사용여부              */
                        v_Reg_Id          ,                     /*(v_Reg_Id      )등록자 ID             */
                        v_Success_Code    ,
                        v_Return_Message  ,
                        v_ErrorText
                        );

                IF 0 != v_Success_Code THEN
                    v_Return_Message := '중도완납 할인대상금액 청구스케줄(RTSD0109) 생성 실패!!!'||v_Return_Message;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            END IF;

        END IF;

    END IF;

    BEGIN

        SELECT ORD_NO
        INTO v_Add_No
        FROM RTSD0104
        WHERE FORD_NO = v_Ord_No;

        IF v_Add_No IS NOT NULL THEN

            IF 0 != f_UpdateRtsd0104ReRental('', v_Add_No, v_Errortext) THEN
                v_Return_Message := '재렌탈 취소상태로  수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        END IF;
        
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
        NULL; 
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
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_Rtsd0104onlinestatupdate(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_Rtsd0104onlinestatupdate(2)', v_Errortext, v_Return_Message);

  END p_Rtsd0104onlinestatupdate;

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
    ) IS

    e_Error EXCEPTION;
    v_Get_UserGrp       RTCM0001.USER_GRP%TYPE;       /*사용자 그룹           */
    v_Get_Statcd0104    RTSD0104.STAT_CD%TYPE;        /*상태                  */
    v_Get_Statcd0106    RTSD0106.STAT_CD%TYPE;        /*상태                  */
    v_Get_RecpAmt       RTRE0030.RECP_AMT%TYPE;       /*수납금액              */

    v_Add_No            RTSD0104.ORD_NO%TYPE;         /*재렌탈주문번호        */
  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;



    --01 : 영업관리자
    --02 : 콜센터
    SELECT USER_GRP
    INTO v_Get_UserGrp
    FROM RTCM0001
    WHERE USER_ID = v_Reg_Id;

    IF (TRIM(v_Get_UserGrp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C001', v_Get_UserGrp)) THEN
        v_Return_Message := '사용자 그룹('||v_Get_UserGrp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_UserGrp) <> '01' ) AND (TRIM(v_Get_UserGrp) <> '02' ) THEN
        v_Return_Message := '사용자 그룹('||v_Get_UserGrp||') : 주문취소 권한이 없습니다!';
        RAISE e_Error;
    END IF;



    --01 : 계약접수
    --03 : 장착대기
    SELECT  A.STAT_CD, B.STAT_CD
    INTO    v_Get_Statcd0104, v_Get_Statcd0106
    FROM    RTSD0104 A INNER JOIN RTSD0106 B ON A.ORD_NO = B.ORD_NO
    WHERE   A.ORD_NO = v_Ord_No;

    IF (TRIM(v_Get_Statcd0104) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S032', v_Get_Statcd0104)) THEN
        v_Return_Message := '상태('||v_Get_Statcd0104||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_Statcd0106) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S032', v_Get_Statcd0106)) THEN
        v_Return_Message := '상태('||v_Get_Statcd0106||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_Statcd0104) <> '01' ) AND (TRIM(v_Get_Statcd0104) <> '03' ) THEN
        v_Return_Message := '계약접수 및 장착대기 상태가 아니므로 취소 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_Statcd0106) <> '01' ) AND (TRIM(v_Get_Statcd0106) <> '03' ) THEN
        v_Return_Message := '계약접수 및 장착대기 상태가 아니므로 취소 불가 합니다!';
        RAISE e_Error;
    END IF;



    SELECT NVL(SUM(RECP_AMT),0)
    INTO v_Get_RecpAmt
    FROM RTRE0030
    WHERE ORD_NO = v_Ord_No;

    IF (TRIM(v_Get_RecpAmt) IS NULL) OR (TRIM(v_Get_RecpAmt) <> 0) THEN
        v_Return_Message := '수납금액('||v_Get_RecpAmt||')이 있으므로 취소 불가 합니다!';
        RAISE e_Error;
    END IF;




    IF 0 != f_UpdateRtsd0104OnlineCancel(v_Ord_No, v_Reg_Id, v_Errortext) THEN
        v_Return_Message := '취소상태로  수정 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    IF 0 != PKG_RTSD0106.f_UpdateRtsd0106OnlineCancel(v_Ord_No, v_Reg_Id, v_Errortext) THEN
        v_Return_Message := '취소상태로  수정 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    BEGIN
        SELECT ORD_NO
        INTO v_Add_No
        FROM RTSD0104
        WHERE FORD_NO = v_Ord_No;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_Errortext := v_Errortext;
    END;

    IF v_Add_No IS NOT NULL THEN

        IF 0 != f_UpdateRtsd0104ReRental('', v_Add_No, v_Errortext) THEN
            v_Return_Message := '재렌탈 취소상태로  수정 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    END IF;

    Pkg_Rtsd0430.p_IUDRTSD0430('I', v_Ord_No, TO_CHAR(SYSDATE, 'YYYYMMDD'), v_Canc_Cd, v_Reg_Id, v_Success_Code, v_Return_Message, v_Errortext);
    IF v_Success_Code < 0 THEN
        v_Return_Message := '주문취소내역 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
    
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
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_Rtsd0104statupdate(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_Rtsd0104statupdate(2)', v_Errortext, v_Return_Message);

  END p_Rtsd0104statupdate;

  /*****************************************************************************
  -- 계약 정보 저장전 - 온라인몰 동일계약 존재여부 체크
  *****************************************************************************/
  FUNCTION f_sRtsd0104GetExistContract(
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,         /*차량번호              */
    v_Mat_Cd         IN RTSD0106.MAT_CD%TYPE,         /*상품코드              */
    v_Chan_Cd        IN RTSD0104.CHAN_CD%TYPE         /*채널구분              */
    ) RETURN VARCHAR2 IS

    v_Ord_No RTSD0104.ORD_NO%TYPE DEFAULT NULL;       /*계약번호              */
  BEGIN

    v_Ord_No := NULL;
    IF (v_Chan_Cd = '01') OR
       --(v_Chan_Cd = '03') OR
       --(v_Chan_Cd = '04') OR
       (v_Chan_Cd = '05') OR
       (v_Chan_Cd = '06') THEN

       SELECT A.ORD_NO
         INTO v_Ord_No
         FROM RTSD0104 A
             ,RTSD0106 B
        WHERE A.ORD_NO = B.ORD_NO
          AND A.STAT_CD IN ('01','03')   -- '04'추가 --한창운 요청(김한나) 2016.03   장착완료는 제거 20160328 한승훈
          AND A.CHAN_CD NOT IN ('01','05','06')          /* 01:대리점,05:타이어뱅크,06:B2B */
          AND A.CUST_NO = v_Cust_No
          --AND A.CAR_NO  = REPLACE(v_Car_No,' ','')
        --  AND B.MAT_CD  = v_Mat_Cd-- 막음 -박정석 요청(김한나) 2016.03
          AND ROWNUM = 1;
    ELSE
       v_Ord_No := NULL;
    END IF;

    RETURN v_Ord_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0104GetExistContract;

  /*****************************************************************************
  -- 계약 정보 Update - 장착대리점 Data UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104AgencyUpdate (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Agency_Cd      IN RTSD0104.AGENCY_CD%TYPE,      /*장착대리점 코드       */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

    v_Sales_Group    RTSD0007.SALES_GROUP%TYPE;        /*지사                 */
    v_Sales_Office   RTSD0007.SALES_OFFICE%TYPE;       /*지점                 */
  BEGIN

    -- 대리점->지사,지점 참조
    SELECT SALES_GROUP, SALES_OFFICE
    INTO v_Sales_Group, v_Sales_Office
    FROM RTSD0007
    WHERE AGENCY_CD = v_Agency_Cd;

    UPDATE RTSD0104
    SET    AGENCY_CD    = v_Agency_Cd,
           SALES_GROUP  = v_Sales_Group,
           SALES_OFFICE = v_Sales_Office,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  ORD_NO       = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0104AgencyUpdate;

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
    ) IS

    e_Error EXCEPTION;
    v_Get_UserGrp       RTCM0001.USER_GRP%TYPE;       /*사용자 그룹           */
    v_Get_Statcd0104    RTSD0104.STAT_CD%TYPE;        /*상태                  */
    v_Get_Statcd0106    RTSD0106.STAT_CD%TYPE;        /*상태                  */
    v_Get_Season_Cd     RTSD0104.SEASON_CD%TYPE;      /*계절구분-계약         */
    v_Get_Season_Gbn    RTSD0007.SEASON_GBN%TYPE;     /*계절구분-대리점       */

  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    --01 : 영업관리자
    --02 : 콜센터
    SELECT USER_GRP
    INTO v_Get_UserGrp
    FROM RTCM0001
    WHERE USER_ID = v_Reg_Id;

    IF (TRIM(v_Get_UserGrp) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('C001', v_Get_UserGrp)) THEN
        v_Return_Message := '사용자 그룹('||v_Get_UserGrp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_UserGrp) <> '01' ) AND (TRIM(v_Get_UserGrp) <> '02' ) THEN
        v_Return_Message := '사용자 그룹('||v_Get_UserGrp||') : 장착대리점 변경 권한이 없습니다!';
        RAISE e_Error;
    END IF;

    --01 : 계약접수
    --03 : 장착대기
    SELECT  A.STAT_CD, B.STAT_CD, A.SEASON_CD
    INTO    v_Get_Statcd0104, v_Get_Statcd0106, v_Get_Season_Cd
    FROM    RTSD0104 A INNER JOIN RTSD0106 B ON A.ORD_NO = B.ORD_NO
    WHERE   A.ORD_NO = v_Ord_No;

    IF (TRIM(v_Get_Statcd0104) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S032', v_Get_Statcd0104)) THEN
        v_Return_Message := '상태('||v_Get_Statcd0104||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_Statcd0106) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S032', v_Get_Statcd0106)) THEN
        v_Return_Message := '상태('||v_Get_Statcd0106||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_Season_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S066', v_Get_Season_Cd)) THEN
        v_Return_Message := '계절구분-계약('||v_Get_Season_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_Statcd0104) <> '01' ) AND (TRIM(v_Get_Statcd0104) <> '03' ) THEN
        v_Return_Message := '계약접수 및 장착대기 상태가 아니므로 장착점 변경 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Get_Statcd0106) <> '01' ) AND (TRIM(v_Get_Statcd0106) <> '03' ) THEN
        v_Return_Message := '계약접수 및 장착대기 상태가 아니므로 장착점 변경 불가 합니다!';
        RAISE e_Error;
    END IF;

    SELECT SEASON_GBN
    INTO   v_Get_Season_Gbn
    FROM   RTSD0007
    WHERE  AGENCY_CD = v_Agency_Cd;

    IF (TRIM(v_Get_Season_Cd) = '02' ) AND (TRIM(v_Get_Season_Gbn) <> '02' ) THEN
        v_Return_Message := '겨울용 상품 계약건은 윈터 전문점만 가능합니다.';
        RAISE e_Error;
    END IF;

    IF 0 != f_UpdateRtsd0104AgencyUpdate(v_Ord_No, v_Agency_Cd, v_Reg_Id, v_Errortext) THEN
        v_Return_Message := '장착대리점 수정 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
        v_Return_Message := '이력 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

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
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_Rtsd0104statupdate(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_Rtsd0104statupdate(2)', v_Errortext, v_Return_Message);

  END p_Rtsd0104AgencyUpdate;

  /*****************************************************************************
  -- 계약 정보 - 계약번호로 차량번호 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104CarNo (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    ) RETURN VARCHAR IS

    v_Car_No   RTSD0104.CAR_NO%TYPE DEFAULT NULL;     /*차량번호              */

  BEGIN

    SELECT  CAR_NO
    INTO    v_Car_No
    FROM    RTSD0104
    WHERE   ORD_NO = v_Ord_No;

    RETURN v_Car_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0104CarNo;

  /*****************************************************************************
  -- 계약 정보 - 해당 계약번호의 타이어개수 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104Cnt_Cd(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR IS

    v_Cnt_Cd    RTSD0104.CNT_CD%TYPE DEFAULT NULL;      /*계약타이어개수      */

  BEGIN

    SELECT  CNT_CD
    INTO    v_Cnt_Cd
    FROM    RTSD0104
    WHERE   ORD_NO   = v_Ord_No
      AND   STAT_CD != '06';

    RETURN v_Cnt_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0104Cnt_Cd;

  /*****************************************************************************
  -- 계약 정보 Select - 주문리스트(판매인)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-09-28  wjim             [20170922_03] 조회 항목 추가
                                           - 가계약번호
   1.10       2019-05-24  wjim             [20190524_01] 휴대폰 추가                                           
  *****************************************************************************/
  PROCEDURE p_sRtsd0104StatusAgent (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Fday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자FROM          */
    v_Ord_Tday       IN RTSD0104.ORD_DAY%TYPE,        /*접수일자TO            */
    v_Ord_Agent      IN RTSD0104.AGENCY_CD%TYPE,      /*판매인번호            */
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE,        /*고객번호              */
    v_Proc_Fday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자FROM          */
    v_Proc_Tday      IN RTSD0104.PROC_DAY%TYPE,       /*장착일자TO            */
    v_EmpNo_Yn       IN VARCHAR2                      /*임직원상품여부            */
    ) IS

    v_Org_Main_Yn  RTSD0113.ORG_MAIN_YN%TYPE := 'N';
    v_Org_Com_Cd   RTSD0113.ORG_COM_CD%TYPE;
    
    v_Sale_Cd      RTSD0104.SALE_CD%TYPE := 'N';
  BEGIN

    --[20210309_01] kstka 판매인 그룹별로 조회
    IF v_Ord_Agent IS NOT NULL THEN
    
        SELECT NVL(ORG_MAIN_YN,'N') AS ORG_MAIN_YN, ORG_COM_CD 
        INTO v_Org_Main_Yn, v_Org_Com_Cd
        FROM RTSD0113
        WHERE ORD_AGENT = v_Ord_Agent;
        
    END IF; 

    
    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,                    /*주문번호            */
            B.SEQ,                       /*순번                */
            A.STAT_CD,                   /*상태(계약상태)      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD) STAT_NM,     /*계약상태     */
            DECODE( A.CHAN_CD, '01', TO_CHAR(C.REG_DT, 'YYYYMMDD'), '05', TO_CHAR(C.REG_DT, 'YYYYMMDD')
                             , DECODE( A.STAT_CD, '06', NULL, A.PROC_DAY)) PROC_DAY,  /*장착완료일자*/
            TO_CHAR(C.REG_DT, 'HH24:MI:SS') PROC_TM, /*장착완료시간*/
            B.MAT_CD,                    /*상품코드            */
            (SELECT PETTERN_CD FROM RTSD0005 WHERE MAT_CD =  B.MAT_CD) PETTERN_CD, /* 상품패턴 */
            Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD) MAT_NM,                /*상품명       */
            A.CNT_CD,                    /*타이어본수          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD) CNT_NM,       /*타이어본수   */
            A.PERIOD_CD,                 /*기간코드            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD) PERIOD_NM, /*계약기간     */
            B.REGI_AMT,                  /*렌탈등록비          */
--            B.MON_AMT,                   /*월렌탈료            */
            A.SUM_MON_AMT MON_AMT,        /*월렌탈료            */
            A.CUST_NO,                   /*고객번호            */
            Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO) CUST_NM,             /*고객명       */
            A.MODEL_CD,                  /*차종                */
            DECODE(A.CONTENTS_CD,'0001',Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                                       ,Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                                 ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)) MODEL_NM,   /*차종+사양명       */
            A.CAR_NO,                    /*차량번호            */
            /***********************************부가정보*************************************/
            A.PROC_DAY OPROC_DAY,                    /*계약-장착일자*/
            A.ORD_DAY,                   /*접수일자            */
            A.ORD_ID,                    /*주문구분            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID) ORD_NM,       /*주문구분     */
            A.CHAN_CD,                   /*채널구분            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD) CHAN_NM,     /*채널구분     */
            A.SALE_ID,                   /*계약유형            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID) SALE_NM,     /*계약유형     */
            A.REGI_CD,                   /*등록비코드          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S023', A.REGI_CD) REGI_NM,     /*등록비       */
            A.CAMP_YN,                   /*캠페인적용여부          */
            A.C_DCRATE,                  /*캠페인할인율        */
            A.C_DCAMT,                   /*캠페인할인금액      */
            A.CUST_TP,                   /*고객유형            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP) CUST_TP_NM,  /*고객유형     */
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
            A.CANC_DAY,                  /*취소일자            */
            A.AGENCY_CD,                 /*장착 대리점         */
            Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)            AS AGENCY_NM    ,       /*장착대리점*/
            A.SALES_GROUP,               /*지사                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018', A.SALES_GROUP)  AS SALES_GROUP_NM  ,    /*지사*/
            A.SALES_OFFICE,              /*지점                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019', A.SALES_OFFICE) AS SALES_OFFICE_NM ,    /*지점*/
            A.ENG_NM,                    /*장착기사            */
            A.AG_DESC,                   /*특이사항(장착점)    */
            A.MAKER_CD,                  /*카메이커            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD) MAKER_NM,      /*카메이커     */
            A.CONTENTS_CD,               /*사양                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD) CONTENTS_NM,/*사양         */
            A.FR_CD,                     /*전후 구분           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD) FR_NM,            /*전후 구분    */
            A.CAR_OWNER,                 /*차량소유자          */
            A.C_MILEAGE,                 /*현재주행거리        */
            A.REQ_TEXT,                  /*비고(기타정보)      */
            A.PAY_MTHD,                  /*결제구분            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('R004', A.PAY_MTHD) PAY_MTHD_NM,   /*결제구분     */
            A.PAY_DD,                    /*이체일              */
            A.ACC_SEQ,                   /*계좌순번            */
            A.CRD_SEQ,                   /*카드순번            */
            A.ACC_CHK,                   /*계좌확인상태        */
            A.ACC_STAT,                  /*계좌신청상태        */
            Pkg_Rtcm0051.f_sRtcm0051Codename('R008', A.ACC_STAT) ACC_STAT_NM,   /*계좌신청상태 */
            A.BKEY_CHK,                  /*배치키생성여부(카드)*/
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.BILL_YN,                   /*세금계산서발행여부  */
            A.CRDT_STAT,                 /*신용조회상태        */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S033', A.CRDT_STAT) CRDT_STAT_NM, /*신용조회상태 */
            A.CERT_CD,                   /*본인인증방법        */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S034', A.CERT_CD) CERT_NM,        /*본인인증방법 */
            A.CERT_STAT,                 /*본인인증상태        */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S035', A.CERT_STAT) CERT_STAT_NM, /*본인인증상태 */
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
            A.REG_ID,                    /*등록자 ID           */
            --A.REG_DT,                    /*등록일              */
            TO_CHAR(A.REG_DT, 'hh24:mi:ss') REG_DT,   /*계약접수시간*/
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            B.FR_CD,                     /*장착위치            */
            B.LR_CD,                     /*좌우                */
            B.ORD_QTY,                   /*수량                */
            B.RENT_AMT,                  /*월렌탈료(조견표)    */
            B.F_DCRATE F_DCRATE_1,       /*최종할인율          */
            B.F_DCAMT  F_DCAMT_1,        /*최종할인액          */
            B.MON_DCAMT,                 /*월렌탈료 할인액     */
            B.PLAN_DAY,                  /*장착예정일          */
            B.PLAN_TM,                   /*장착예정시간(HHMM)  */
            B.INST_DAY,                  /*장착일              */
            B.INST_TM,                   /*장착시간(HHMM)      */
            B.INST_YN,                   /*장착여부            */
            B.VAL_YN,                    /*유효여부            */
            B.EQU_NO,                    /*설비번호            */
            B.OS_ID,                     /*소유권이전구분      */
            B.OS_DAY,                    /*소유권이전일자(예정)*/
            B.FL_YN,                     /*장착위-앞,왼쪽      */
            B.FR_YN,                     /*장착위치-앞,오른쪽  */
            B.RL_YN,                     /*장착위치-뒤,왼쪽    */
            B.RR_YN,                     /*장착위치-뒤,오른쪽  */
            E.ORG_AGNM,                  /*판매인명            */
            DECODE(D.GENDER_CD,'1','남','2','여') GENDER_CD,  /*성별  */
            (TO_CHAR(SYSDATE,'YYYY')-SUBSTR(D.BIRTH_DAY,1,4)+1)   AGE, /*나이  */
            REPLACE(SUBSTR( D.ADDR1 ,1,REGEXP_INSTR(D.ADDR1,'\ ')),' ','') ADDR_AREA, /*지역  */
            A.SEASON_CD,                                                          /*계절구분코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD) SEASON_NM,      /*계절구분      */
            F.PROVSN_NO,                  /*가계약번호          */ --[20170922_03]
            D.MOB_NO,                      /*휴대폰번호          */ --[20190524_01]
            A.EMP_NO,                      /*임직원 사번 정보*/ --[20211012_01]
            Pkg_Rtsd0421.f_GetSendHist(A.ORD_NO, 1) AS FIRST_DAY
    FROM    RTSD0104 A,
            RTSD0106 B,
            RTSD0108 C,
            RTSD0100 D,
            RTSD0113 E,
            RTSD0121 F
    WHERE   A.ORD_DAY    BETWEEN v_Ord_Fday AND v_Ord_Tday                               /*접수일자FROM~TO       */
--    AND     A.ORD_AGENT  = DECODE(v_Ord_Agent   , NULL, A.ORD_AGENT   , v_Ord_Agent)     /*판매인번호            */
    AND   (  
                    (v_Org_Main_Yn = 'Y' AND A.ORD_AGENT IN (SELECT ORD_AGENT FROM RTSD0113 WHERE ORG_COM_CD = v_Org_Com_Cd))
            OR      (v_Org_Main_Yn = 'N' AND NVL(A.ORD_AGENT, '000000')   = DECODE( v_Ord_Agent, NULL, NVL(A.ORD_AGENT, '000000'), v_Ord_Agent ))
          )   --[20210309_01] kstka 판매인 그룹별로 조회    
    AND     A.ORD_NO     = DECODE(v_Ord_No      , NULL, A.ORD_NO      , v_Ord_No)        /*주문번호              */
    AND     A.CUST_NO    = DECODE(v_Cust_No     , NULL, A.CUST_NO     , v_Cust_No)       /*고객번호              */
    AND     (v_Proc_Fday IS NULL OR (v_Proc_Fday IS NOT NULL AND A.PROC_DAY BETWEEN v_Proc_Fday AND v_Proc_Tday))   /*장착일자FROM~TO       */
    AND     A.ORD_NO     = B.ORD_NO
    AND     A.ORD_NO     = C.ORD_NO (+)
    AND     A.CUST_NO    = D.CUST_NO
    AND     A.ORD_AGENT  = E.ORD_AGENT(+)
    AND     A.ORD_NO     = F.ORD_NO(+)
    AND     ( 
                (v_EmpNo_Yn = 'Y' AND A.SALE_CD    IN (SELECT SALE_CD FROM RTSD0020 WHERE PRDT_GRP_DTL = '02' AND USE_YN = 'Y'))
                OR
                (v_EmpNo_Yn = 'N' AND (A.SALE_CD IS NULL OR A.SALE_CD    =    A.SALE_CD))
            ); --[20211012_01] kstka 임직원상품코드 조회조건 추가

  END p_sRtsd0104StatusAgent;
  
  
  /*****************************************************************************
  -- 계약 정보 Select - 주문리스트(판매인)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-09-28  wjim             [20170922_03] 조회 항목 추가
                                           - 가계약번호
   1.4        2019-02-12                   - 조회조건에 렌탈지사/렌탈지점 추가
  *****************************************************************************/
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
SELECT *
  FROM (
    SELECT A.*,
           B.USER_ID,
           B.RENTAL_GROUP,
           B.RENTAL_OFFICE,
           Pkg_Rtcm0051.f_sRtcm0051Codename('S301',B.RENTAL_GROUP)  AS RENTAL_GROUP_NM  ,/*렌탈지사           */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S302',B.RENTAL_OFFICE) AS RENTAL_OFFICE_NM /*렌탈지점           */
      FROM (
    SELECT  A.ORD_NO,                    /*주문번호            */
            B.SEQ,                       /*순번                */
            A.STAT_CD,                   /*상태(계약상태)      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD) STAT_NM,     /*계약상태     */
            DECODE( A.CHAN_CD, '01', TO_CHAR(C.REG_DT, 'YYYYMMDD'), '05', TO_CHAR(C.REG_DT, 'YYYYMMDD')
                             , DECODE( A.STAT_CD, '06', NULL, A.PROC_DAY)) PROC_DAY,  /*장착완료일자*/
            TO_CHAR(C.REG_DT, 'HH24:MI:SS') PROC_TM, /*장착완료시간*/
            B.MAT_CD,                    /*상품코드            */
            (SELECT PETTERN_CD FROM RTSD0005 WHERE MAT_CD =  B.MAT_CD) PETTERN_CD, /* 상품패턴 */
            Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD) MAT_NM,                /*상품명       */
            A.CNT_CD,                    /*타이어본수          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022', B.CNT_CD) CNT_NM,       /*타이어본수   */
            A.PERIOD_CD,                 /*기간코드            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD) PERIOD_NM, /*계약기간     */
            B.REGI_AMT,                  /*렌탈등록비          */
--            B.MON_AMT,                   /*월렌탈료            */
            A.SUM_MON_AMT MON_AMT,                   /*월렌탈료            */
            A.CUST_NO,                   /*고객번호            */
            Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO) CUST_NM,             /*고객명       */
            A.MODEL_CD,                  /*차종                */
            DECODE(A.CONTENTS_CD,'0001',Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                                       ,Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                                 ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)) MODEL_NM,   /*차종+사양명       */
            A.CAR_NO,                    /*차량번호            */
            /***********************************부가정보*************************************/
            A.PROC_DAY OPROC_DAY,                    /*계약-장착일자*/
            A.ORD_DAY,                   /*접수일자            */
            A.ORD_ID,                    /*주문구분            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID) ORD_NM,       /*주문구분     */
            A.CHAN_CD,                   /*채널구분            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD) CHAN_NM,     /*채널구분     */
            A.SALE_ID,                   /*계약유형            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID) SALE_NM,     /*계약유형     */
            A.REGI_CD,                   /*등록비코드          */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S023', A.REGI_CD) REGI_NM,     /*등록비       */
            A.CAMP_YN,                   /*캠페인적용여부          */
            A.C_DCRATE,                  /*캠페인할인율        */
            A.C_DCAMT,                   /*캠페인할인금액      */
            A.CUST_TP,                   /*고객유형            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP) CUST_TP_NM,  /*고객유형     */
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
            A.CANC_DAY,                  /*취소일자            */
            A.AGENCY_CD,                 /*장착 대리점         */
            Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)            AS AGENCY_NM    ,       /*장착대리점*/
            A.SALES_GROUP,               /*지사                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018', A.SALES_GROUP)  AS SALES_GROUP_NM  ,    /*지사*/
            A.SALES_OFFICE,              /*지점                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019', A.SALES_OFFICE) AS SALES_OFFICE_NM ,    /*지점*/
            A.ENG_NM,                    /*장착기사            */
            A.AG_DESC,                   /*특이사항(장착점)    */
            A.MAKER_CD,                  /*카메이커            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD) MAKER_NM,      /*카메이커     */
            A.CONTENTS_CD,               /*사양                */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD) CONTENTS_NM,/*사양         */
            A.FR_CD,                     /*전후 구분           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD) FR_NM,            /*전후 구분    */
            A.CAR_OWNER,                 /*차량소유자          */
            A.C_MILEAGE,                 /*현재주행거리        */
            A.REQ_TEXT,                  /*비고(기타정보)      */
            A.PAY_MTHD,                  /*결제구분            */
            Pkg_Rtcm0051.f_sRtcm0051Codename('R004', A.PAY_MTHD) PAY_MTHD_NM,   /*결제구분     */
            A.PAY_DD,                    /*이체일              */
            A.ACC_SEQ,                   /*계좌순번            */
            A.CRD_SEQ,                   /*카드순번            */
            A.ACC_CHK,                   /*계좌확인상태        */
            A.ACC_STAT,                  /*계좌신청상태        */
            Pkg_Rtcm0051.f_sRtcm0051Codename('R008', A.ACC_STAT) ACC_STAT_NM,   /*계좌신청상태 */
            A.BKEY_CHK,                  /*배치키생성여부(카드)*/
            A.BATCH_KEY,                 /*BATCH KEY           */
            A.BILL_YN,                   /*세금계산서발행여부  */
            A.CRDT_STAT,                 /*신용조회상태        */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S033', A.CRDT_STAT) CRDT_STAT_NM, /*신용조회상태 */
            A.CERT_CD,                   /*본인인증방법        */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S034', A.CERT_CD) CERT_NM,        /*본인인증방법 */
            A.CERT_STAT,                 /*본인인증상태        */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S035', A.CERT_STAT) CERT_STAT_NM, /*본인인증상태 */
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
            A.REG_ID,                    /*등록자 ID           */
            --A.REG_DT,                    /*등록일              */
            TO_CHAR(A.REG_DT, 'hh24:mi:ss') REG_DT,   /*계약접수시간*/
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            B.FR_CD B_FR_CD,                     /*장착위치            */
            B.LR_CD,                     /*좌우                */
            B.ORD_QTY,                   /*수량                */
            B.RENT_AMT,                  /*월렌탈료(조견표)    */
            B.F_DCRATE F_DCRATE_1,       /*최종할인율          */
            B.F_DCAMT  F_DCAMT_1,        /*최종할인액          */
            B.MON_DCAMT,                 /*월렌탈료 할인액     */
            B.PLAN_DAY,                  /*장착예정일          */
            B.PLAN_TM,                   /*장착예정시간(HHMM)  */
            B.INST_DAY,                  /*장착일              */
            B.INST_TM,                   /*장착시간(HHMM)      */
            B.INST_YN,                   /*장착여부            */
            B.VAL_YN,                    /*유효여부            */
            B.EQU_NO,                    /*설비번호            */
            B.OS_ID,                     /*소유권이전구분      */
            B.OS_DAY,                    /*소유권이전일자(예정)*/
            B.FL_YN,                     /*장착위-앞,왼쪽      */
            B.FR_YN,                     /*장착위치-앞,오른쪽  */
            B.RL_YN,                     /*장착위치-뒤,왼쪽    */
            B.RR_YN,                     /*장착위치-뒤,오른쪽  */
            E.ORG_AGNM,                  /*판매인명            */
            DECODE(D.GENDER_CD,'1','남','2','여') GENDER_CD,  /*성별  */
            (TO_CHAR(SYSDATE,'YYYY')-SUBSTR(D.BIRTH_DAY,1,4)+1)   AGE, /*나이  */
            REPLACE(SUBSTR( D.ADDR1 ,1,REGEXP_INSTR(D.ADDR1,'\ ')),' ','') ADDR_AREA, /*지역  */
            A.SEASON_CD,                                                          /*계절구분코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD) SEASON_NM,      /*계절구분      */
            F.PROVSN_NO                  /*가계약번호          */ --[20170922_03]
    FROM    RTSD0104 A,
            RTSD0106 B,
            RTSD0108 C,
            RTSD0100 D,
            RTSD0113 E,
            RTSD0121 F
    WHERE   A.ORD_DAY    BETWEEN v_Ord_Fday AND v_Ord_Tday                               /*접수일자FROM~TO       */
    AND     A.ORD_AGENT  = DECODE(v_Ord_Agent   , NULL, A.ORD_AGENT   , v_Ord_Agent)     /*판매인번호            */
    AND     A.ORD_NO     = DECODE(v_Ord_No      , NULL, A.ORD_NO      , v_Ord_No)        /*주문번호              */
    AND     A.CUST_NO    = DECODE(v_Cust_No     , NULL, A.CUST_NO     , v_Cust_No)       /*고객번호              */
    AND     (v_Proc_Fday IS NULL OR (v_Proc_Fday IS NOT NULL AND A.PROC_DAY BETWEEN v_Proc_Fday AND v_Proc_Tday))   /*장착일자FROM~TO       */
    AND     A.ORD_NO     = B.ORD_NO
    AND     A.ORD_NO     = C.ORD_NO (+)
    AND     A.CUST_NO    = D.CUST_NO
    AND     A.ORD_AGENT  = E.ORD_AGENT(+)
    AND     A.ORD_NO     = F.ORD_NO(+)
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
  END p_sRtsd0104StatusAgentNew;
  
  

  /*****************************************************************************
  -- 계약 현황 조회 - 전자서명
  *****************************************************************************/
  PROCEDURE p_sRtsd0104Status_sign (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE   ,      /*주문번호              */
    v_Sheet_Id       IN VARCHAR2               ,      /*양식ID                */
    v_File_Name      IN RTSD0104.FILE_NAME%TYPE       /*파일명                */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT SHEET_ID                                                     , /*양식ID        */
           Pkg_Rtcm0051.f_sRtcm0051Codename('S080', SHEET_ID)  SHEET_NM , /*양식          */
           TO_CHAR(REG_DT,'YYYYMMDD')                          REG_DAY  , /*등록일        */
           TO_CHAR(REG_DT,'HH24MISS')                          REG_TM   , /*등록시간      */
           REG_ID                                                       , /*등록자ID      */
           PKG_RTCM0001.f_sRtcm0001UserNm(REG_ID)              REG_NM   , /*등록자        */
           FILE_PATH                                           PATH_DEC , /*경로          */
           REPLACE(FILE_PATH,'FORM','FORM_ENC')                PATH_ENC , /*경로(암호화)  */
           FILE_NAME                                                    , /*파일명        */
           EMAIL_ADDR                                                   , /*이메일주소    */
           CUST_NM                                                      , /*고객명        */
           CUST_NO                                                        /*고객번호      */
    FROM   (
    SELECT '01'                                            SHEET_ID , /*SHEET_ID      */
           A.REG_DT                                                 , /*등록일시      */
           A.REG_ID                                                 , /*등록자ID      */
           A.FILE_PATH                                              , /*파일경로      */
           A.FILE_NAME                                              , /*파일명        */
           B.EMAIL_ADDR                                             , /*이메일주소    */
           B.CUST_NM                                                , /*고객명        */
           B.CUST_NO                                                  /*고객번호      */
    FROM   RTSD0111 A, RTSD0100 B
    WHERE  A.CUST_NO   = (SELECT CUST_NO FROM RTSD0104
                           WHERE  ORD_NO = v_Ord_No)
    AND    A.FILE_NAME IS NOT NULL
    AND    A.CUST_NO   = B.CUST_NO
    UNION ALL
    SELECT '02'                                            SHEET_ID , /*양식ID        */
           A.REG_DT                                                 , /*등록일시      */
           A.REG_ID                                                 , /*등록자ID      */
           A.FILE_PATH                                              , /*파일경로      */
           A.FILE_NAME                                              , /*파일명        */
           B.EMAIL_ADDR                                             , /*이메일주소    */
           B.CUST_NM                                                , /*고객명        */
           B.CUST_NO                                                  /*고객번호      */
    FROM   RTSD0104 A, RTSD0100 B
    WHERE  A.ORD_NO    = v_Ord_No
    AND    A.FILE_NAME IS NOT NULL
    AND    A.CUST_NO   = B.CUST_NO
    UNION ALL
    SELECT '03'                                            SHEET_ID , /*양식ID        */
           A.REG_DT                                                 , /*등록일시      */
           A.REG_ID                                                 , /*등록자ID      */
           A.FILE_PATH                                              , /*파일경로      */
           A.FILE_NAME                                              , /*파일명        */
           B.EMAIL_ADDR                                             , /*이메일주소    */
           B.CUST_NM                                                , /*고객명        */
           B.CUST_NO                                                  /*고객번호      */
    FROM   RTSD0108 A, RTSD0100 B
    WHERE  A.ORD_NO    = v_Ord_No
    AND    A.FILE_NAME IS NOT NULL
    AND    A.CUST_NO   = B.CUST_NO
    UNION ALL
    SELECT '04'                                            SHEET_ID , /*양식ID        */
           A.REG_DT                                                 , /*등록일시      */
           A.REG_ID                                                 , /*등록자ID      */
           A.FILE_PATH                                              , /*파일경로      */
           A.FILE_NAME                                              , /*파일명        */
           B.EMAIL_ADDR                                             , /*이메일주소    */
           B.CUST_NM                                                , /*고객명        */
           B.CUST_NO                                                  /*고객번호      */
    FROM   RTSD0114 A, RTSD0108 C, RTSD0100 B
    WHERE  A.ORD_NO    = v_Ord_No
    AND    A.FILE_NAME IS NOT NULL
    AND    A.ORD_NO    = C.ORD_NO
    AND    C.CUST_NO   = B.CUST_NO
    UNION ALL
    SELECT '05'                                            SHEET_ID , /*양식ID        */
           A.STRG_DT                                       REG_DT   , /*등록일시      */
           A.STRG_USER_ID                                  REG_ID   , /*등록자ID      */
           A.STRG_FILE_PATH                                FILE_PATH, /*파일경로      */
           A.STRG_FILE_NAME                                FILE_NAME, /*파일명        */
           B.EMAIL_ADDR                                             , /*이메일주소    */
           B.CUST_NM                                                , /*고객명        */
           B.CUST_NO                                                  /*고객번호      */
    FROM   RTCS0203 A, RTSD0100 B
    WHERE  A.ORD_NO         = v_Ord_No
    AND    A.STRG_FILE_NAME IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    UNION ALL
    SELECT '06'                                            SHEET_ID , /*양식ID        */
           A.DLVR_DT                                       REG_DT   , /*등록일시      */
           A.DLVR_USER_ID                                  REG_ID   , /*등록자ID      */
           A.DLVR_FILE_PATH                                FILE_PATH, /*파일경로      */
           A.DLVR_FILE_NAME                                FILE_NAME, /*파일명        */
           B.EMAIL_ADDR                                             , /*이메일주소    */
           B.CUST_NM                                                , /*고객명        */
           B.CUST_NO                                                  /*고객번호      */
    FROM   RTCS0203 A, RTSD0100 B
    WHERE  A.ORD_NO         = v_Ord_No
    AND    A.DLVR_FILE_NAME IS NOT NULL
    AND    A.CUST_NO        = B.CUST_NO
    UNION ALL
    SELECT '07'                                            SHEET_ID , /*양식ID        */
           C.REG_DT                                                 , /*등록일시      */
           C.REG_ID                                                 , /*등록자ID      */
           C.FILE_PATH                                              , /*파일경로      */
           C.FILE_NAME                                              , /*파일명        */
           B.EMAIL_ADDR                                             , /*이메일주소    */
           B.CUST_NM                                                , /*고객명        */
           B.CUST_NO                                                  /*고객번호      */
    FROM   RTSD0104 A, RTSD0100 B, RTSD0108 C
    WHERE  A.ORD_NO    = v_Ord_No
    AND    A.FILE_NAME IS NOT NULL
    AND    A.CUST_NO   = B.CUST_NO
    AND    A.ORD_NO = C.ORD_NO
    )
    WHERE  SHEET_ID  = DECODE(v_Sheet_Id,  NULL, SHEET_ID,  v_Sheet_Id)  /*양식ID     */
    AND    FILE_NAME = DECODE(v_File_Name, NULL, FILE_NAME, v_File_Name) /*파일명     */

    ORDER BY REG_DT;

  END p_sRtsd0104Status_sign;


  /*****************************************************************************
  -- 계약 정보 - 채널구분 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0104ChanCd (
    v_In_Path      IN CHAR,                    /*유입경로('R':렌탈,'O':온라인)*/
    v_Ord_Agent    IN RTSD0104.ORD_AGENT%TYPE, /*판매인번호                   */
    v_Agency_Cd    IN RTSD0104.AGENCY_CD%TYPE  /*장착대리점코드               */
  ) RETURN VARCHAR2 IS
    v_Chan_Cd RTSD0104.CHAN_CD%TYPE DEFAULT NULL;         /*채널구분          */
    v_Sales_Group RTSD0007.SALES_GROUP%TYPE DEFAULT NULL; /*지사              */
    v_User_Grp    RTCM0001.USER_GRP%TYPE DEFAULT NULL;    /*사용자그룹        */
  BEGIN

    IF v_Ord_Agent IS NULL THEN
       IF v_In_Path = 'O' THEN
          v_Chan_Cd := '02';                 /*온라인   */
       ELSE
--          SELECT  SALES_GROUP
--          INTO    v_Sales_Group
--          FROM    RTSD0007
--          WHERE   AGENCY_CD = v_Agency_Cd;

          SELECT B1.SALES_GROUP, A1.USER_GRP
          INTO   v_Sales_Group, v_User_Grp
          FROM  RTCM0001 A1
             ,  RTSD0007 B1
         WHERE  A1.USER_ID = v_Agency_Cd
           AND  A1.AGENT_ID = B1.AGENCY_CD(+);

          IF SQL%NOTFOUND THEN
             v_Chan_Cd := 'XX';              /*채널오류  */
          ELSE
             --IF v_Sales_Group = 'RE4' OR v_User_Grp = '15'  THEN  /*신유통팀  */
             IF v_User_Grp = '15'  THEN  /*20190108 조직개편으로 타이어뱅크는 일단 사용자그룹으로만 구  */

                v_Chan_Cd := '05';           /*타이어뱅크*/
             ELSE
                v_Chan_Cd := '01';           /*대리점    */
             END IF;
          END IF;
       END IF;
    ELSE
       SELECT  CHAN_CD
       INTO    v_Chan_Cd
       FROM    RTSD0113
       WHERE   ORD_AGENT = v_Ord_Agent;

       IF SQL%NOTFOUND THEN
          v_Chan_Cd := 'XX';                /*채널오류   */
       END IF;
    END IF;

    RETURN v_Chan_Cd;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 'XX';                       /*채널오류   */

  END f_sRtsd0104ChanCd;



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
    ) IS

  BEGIN


    DELETE RTTEMP06;

    INSERT INTO RTTEMP06
    SELECT  --A.ORD_DAY,
            --A.PROC_DAY,
            C.CUST_TP,
            DECODE(C.CUST_TP,'01',TRUNC((TO_CHAR(SYSDATE,'YYYY')-SUBSTR(C.BIRTH_DAY,1,4)+1),-1))                 AGE,       /*연령        */
            C.GENDER_CD                                                                                          GENDER_CD, /*성별        */
            E.SIDO_CD                                                                                            SIDO_CD,   /*대리점지역  */
            A.PERIOD_CD                                                                                          PERIOD_CD, /*계약기간    */
            A.CHAN_CD                                                                                            CHAN_CD,   /*채널        */
            D.PETTERN_CD                                                                                         PETTERN_CD,/*패턴        */
            D.WHEEL_INCHES                                                                                       WHEEL_INCHES,   /*인치        */
            F.MF_CD                                                                                              MF_CD,     /*전 제조사   */
            SUM(DECODE(A.STAT_CD,'06',0,1))                                                                      ORD_CNT,   /*계약건수    */
            SUM(DECODE(A.STAT_CD,'06',0,TO_NUMBER(A.CNT_CD)))                                                    ORD_CNTM,  /*타이어본수  */
            SUM(DECODE(A.STAT_CD,'04',1,0))                                                                      PROC_CNT,  /*장착건수    */
            SUM(DECODE(A.STAT_CD,'04',TO_NUMBER(A.CNT_CD), 0))                                                   PROC_CNTM /*장착상품건수*/
    FROM    RTSD0104 A, -- 계약 정보
            RTSD0106 B, -- 계약 상품 정보
            RTSD0100 C, -- 고객 마스터
            RTSD0005 D, -- 상품 마스터
            RTSD0007 E, -- 대리점 정보
            RTCS0120 F  -- 사용자구매전제조사정보
    WHERE   ((v_Dis_Gb = '1' AND A.PROC_DAY BETWEEN v_FDay AND v_EDay) OR -- '1' 장착기준
             (v_Dis_Gb = '2' AND A.ORD_DAY  BETWEEN v_FDay AND v_EDay))   -- '2' 주문기준
    AND     A.ORD_NO    = B.ORD_NO
    AND     A.CUST_NO   = C.CUST_NO
    AND     B.MAT_CD    = D.MAT_CD
    AND     A.AGENCY_CD = E.AGENCY_CD
    AND     A.ORD_NO    = F.ORD_NO (+)
    GROUP   BY --A.ORD_DAY,
            --A.PROC_DAY,
            C.CUST_TP,
            DECODE(C.CUST_TP,'01',TRUNC((TO_CHAR(SYSDATE,'YYYY')-SUBSTR(C.BIRTH_DAY,1,4)+1),-1)),
            C.GENDER_CD,
            E.SIDO_CD,
            A.PERIOD_CD,
            A.CHAN_CD,
            D.PETTERN_CD,
            D.WHEEL_INCHES,
            F.MF_CD;


    -- 01.연령별
    OPEN Ref_Cursor01 FOR
    SELECT  A.GROUP_CD,
            A.GROUP_CD||' 대' AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.AGE  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.CUST_TP = '01'
            GROUP   BY A.AGE
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;

    -- 02.성별
    OPEN Ref_Cursor02 FOR
    SELECT  A.GROUP_CD,
            DECODE(A.GROUP_CD,'1','남','2','여','기타') AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.GENDER_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.CUST_TP = '01'
            GROUP   BY A.GENDER_CD
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;

    -- 03.대리점 지역별
    OPEN Ref_Cursor03 FOR
    SELECT  A.GROUP_CD,
            B.REMARK AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.SIDO_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.SIDO_CD IS NOT NULL
            GROUP   BY A.SIDO_CD
            ) A,
            RTCM0051 B
    WHERE   A.GROUP_CD  = B.CD (+)
    AND     B.CD_GRP_CD (+)= 'S016'
    AND     A.CNT > 0
    ORDER   BY A.CNT DESC;


    -- 04.계약기간별
    OPEN Ref_Cursor04 FOR
    SELECT  A.GROUP_CD,
            A.GROUP_CD||'개월' AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.PERIOD_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.PERIOD_CD IS NOT NULL
            GROUP   BY A.PERIOD_CD
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;



    -- 05.on/off별
    OPEN Ref_Cursor05 FOR
    SELECT  A.GROUP_CD,
            DECODE(A.GROUP_CD,'01','on line','02','off line') AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  DECODE(A.CHAN_CD,'01','02','05','02','01')  GROUP_CD, -- 01:on line,02:off line
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.CHAN_CD IS NOT NULL
            GROUP   BY DECODE(A.CHAN_CD,'01','02','05','02','01')
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;


    -- 06.채널별
    OPEN Ref_Cursor06 FOR
    SELECT  A.GROUP_CD,
            B.CD_NM AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.CHAN_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.CHAN_CD IS NOT NULL
            GROUP   BY A.CHAN_CD
            ) A,
            RTCM0051 B
    WHERE   A.GROUP_CD  = B.CD (+)
    AND     B.CD_GRP_CD (+)= 'S030'
    AND     A.CNT > 0
    ORDER   BY A.CNT DESC;


    -- 07.패턴별
    OPEN Ref_Cursor07 FOR
    SELECT  A.GROUP_CD,
            A.GROUP_CD AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.PETTERN_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.PETTERN_CD IS NOT NULL
            GROUP   BY A.PETTERN_CD
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;

    -- 08.인치별
    OPEN Ref_Cursor08 FOR
    SELECT  A.GROUP_CD,
            A.GROUP_CD||' 인치' AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.WHEEL_INCHES  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.WHEEL_INCHES IS NOT NULL
            GROUP   BY A.WHEEL_INCHES
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;

    -- 09. 교체유입 제조사
    OPEN Ref_Cursor09 FOR
    SELECT  A.GROUP_CD,
            B.CD_NM AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.MF_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.MF_CD IS NOT NULL
            GROUP   BY A.MF_CD
            ) A,
            RTCM0051 B
    WHERE   A.GROUP_CD  = B.CD (+)
    AND     B.CD_GRP_CD (+)= 'S078'
    AND     A.CNT > 0
    ORDER   BY A.CNT DESC;

  END p_sRtsd0104OrderAnalysis;


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
    ) IS

  BEGIN


    OPEN Ref_Cursor FOR
    SELECT  A.DT,
            SUM(DECODE(B.WEEK,'월',B.CNT)) MON,
            SUM(DECODE(B.WEEK,'화',B.CNT)) TUE,
            SUM(DECODE(B.WEEK,'수',B.CNT)) WED,
            SUM(DECODE(B.WEEK,'목',B.CNT)) THU,
            SUM(DECODE(B.WEEK,'금',B.CNT)) FRI,
            SUM(DECODE(B.WEEK,'토',B.CNT)) SAT,
            SUM(DECODE(B.WEEK,'일',B.CNT)) SUN
    FROM    (
            SELECT  TO_CHAR(LPAD((ROWNUM * v_Tim_Gb),2,'0'))  DT,
                    TO_CHAR(LPAD((ROWNUM - 1) * v_Tim_Gb,2,'0'))  FDT,
                    TO_CHAR(LPAD((ROWNUM * v_Tim_Gb) - 1,2,'0'))  TDT
            FROM    DUAL
            CONNECT BY LEVEL <= (24 / v_Tim_Gb)
            ) A,
            (
            SELECT  DECODE(v_Dis_Gb, '1', A.PROC_DT,   A.ORD_DT  ) HH24,
                    DECODE(v_Dis_Gb, '1', A.PROC_WEEK, A.ORD_WEEK) WEEK,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN A.PROC_CNT   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN A.PROC_CNTM  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN A.ORD_CNT    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN A.ORD_CNTM   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    (
                    SELECT  TO_CHAR(A.REG_DT,'HH24') ORD_DT,
                            TO_CHAR(A.REG_DT,'DY')   ORD_WEEK,
                            TO_CHAR(C.REG_DT,'HH24') PROC_DT,
                            TO_CHAR(C.REG_DT,'DY')   PROC_WEEK,
                            SUM(DECODE(A.STAT_CD,'06',0,1))                    ORD_CNT,   /*계약건수    */
                            SUM(DECODE(A.STAT_CD,'06',0,TO_NUMBER(A.CNT_CD)))  ORD_CNTM,  /*타이어본수  */
                            SUM(DECODE(A.STAT_CD,'04',1,0))                    PROC_CNT,  /*장착건수    */
                            SUM(DECODE(A.STAT_CD,'04',TO_NUMBER(A.CNT_CD),0))  PROC_CNTM  /*장착상품건수*/
                    FROM    RTSD0104 A, -- 계약 정보
                            RTSD0106 B, -- 계약 상품 정보
                            RTSD0108 C  -- 장착 정보
                    WHERE   ((v_Dis_Gb = '1' AND A.PROC_DAY BETWEEN v_FDay AND v_EDay) OR -- '1' 장착기준
                             (v_Dis_Gb = '2' AND A.ORD_DAY  BETWEEN v_FDay AND v_EDay))   -- '2' 주문기준
                    AND     A.CHAN_CD  IN (SELECT  REGEXP_SUBSTR(v_Chan_Cd,'[^|]+',1,LEVEL)
                                           FROM    DUAL
                                           CONNECT BY LEVEL <= REGEXP_COUNT(v_Chan_Cd, '[^|]+')
                                           )
                    AND     A.ORD_NO   = B.ORD_NO
                    AND     A.ORD_NO   = C.ORD_NO(+)
                    GROUP   BY
                            TO_CHAR(C.REG_DT,'HH24'),
                            TO_CHAR(A.REG_DT,'DY'),
                            TO_CHAR(A.REG_DT,'HH24'),
                            TO_CHAR(C.REG_DT,'DY')
                    ) A
            ) B
    WHERE   B.HH24(+) BETWEEN A.FDT AND A.TDT
    GROUP   BY A.DT
    ORDER   BY A.DT;

  END p_sRtsd0104OrderMonthAnalysis;


  /*****************************************************************************
  -- 수금내역 조회 - 조회조건에 맞는 계약정보를 조회한다.

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.6        2017-12-19  wjim             [20171219_01] '계약상태' 조회조건 추가
  *****************************************************************************/
  /* 2018.12.17 백업
  PROCEDURE p_sRtsd0104ResultCashApp (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0092.CUST_NO%TYPE,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,
    v_Cust_Nm        IN RTRE0092.CUST_NM%TYPE,
    v_Car_No         IN RTSD0104.CAR_NO%TYPE,
    v_Tel_No         IN RTSD0100.TEL_NO%TYPE,
    v_Mob_No         IN RTSD0100.MOB_NO%TYPE,
    v_Stat_Cd        IN RTSD0104.STAT_CD%TYPE
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  NVL( D.ORD_NO, B.ORD_NO ) AS ORD_NO,
            A.CUST_NO,
            A.CUST_NM,
            C.MAT_CD,
            Pkg_Rtsd0005.f_sRtsd0005MatName( C.MAT_CD ) AS MAT_NM,
            NVL( D.CAR_NO, B.CAR_NO ) AS CAR_NO,
            NVL( D.CNT_CD, B.CNT_CD ) AS CNT_CD,
            B.ORD_DAY,
            D.PROC_DAY,
            B.STAT_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S032', B.STAT_CD ) AS STAT_NM,
            A.BIRTH_DAY,
            A.BUSL_NO,
            A.MOB_NO,
            A.TEL_NO,
            NVL( D.PAY_MTHD, B.PAY_MTHD ) AS PAY_MTHD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R004', NVL( D.PAY_MTHD, B.PAY_MTHD ) ) AS PAY_NM,
            NVL( D.PAY_DD, B.PAY_DD ) AS PAY_DD,
            NVL( (  SELECT  SUM( NVL(Z.PND_AMT,0) - NVL(Z.SBS_AMT,0) )
                    FROM    RTRE0035 Z
                    WHERE   Z.ORD_NO = B.ORD_NO ), 0) AS PREPAID,
            NVL( (  SELECT  SUM( NVL(Y.ARRE_AMT,0) )
                    FROM    RTSD0109 Y
                    WHERE   Y.ORD_NO = B.ORD_NO
                    AND     Y.ARRE_AMT > 0
                    AND     Y.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                    AND     Y.SCD_STAT = 'S' ), 0) AS ARRE_AMT,
            NVL( (  SELECT  MAX(COUNT(*))
                    FROM    RTSD0109 X
                    WHERE   X.ORD_NO = B.ORD_NO
                    AND    X.ARRE_AMT > 0
                    AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                    AND    X.SCD_STAT = 'S'
                    GROUP   BY X.RECP_TP ), 0) AS ARRE_MON
    FROM    RTSD0100 A,
            RTSD0104 B,
            RTSD0106 C,
            RTSD0108 D
    WHERE   A.CUST_NO  = DECODE( TRIM( v_Cust_No ), NULL, A.CUST_NO, v_Cust_No )
    AND     A.CUST_NM  LIKE '%' || TRIM( v_Cust_Nm ) || '%'
    AND     B.ORD_NO   = DECODE( TRIM( v_Ord_No  ), NULL, B.ORD_NO , v_Ord_No  )
    AND     B.STAT_CD  = DECODE( TRIM( v_Stat_Cd ), NULL, B.STAT_CD, v_Stat_Cd )    --[20171219_01]
    AND     B.CAR_NO   = DECODE( TRIM( v_Car_No  ), NULL, B.CAR_NO , v_Car_No  )
    AND     A.TEL_NO   = DECODE( TRIM( v_Tel_No  ), NULL, A.TEL_NO , v_Tel_No  )
    AND     A.MOB_NO   = DECODE( TRIM( v_Mob_No  ), NULL, A.MOB_NO , v_Mob_No  )
    AND     A.CUST_NO  = B.CUST_NO
    AND     B.ORD_NO   = C.ORD_NO
    AND     B.ORD_NO   = D.ORD_NO(+);


  END p_sRtsd0104ResultCashApp;
*/

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
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  NVL( D.ORD_NO, B.ORD_NO ) AS ORD_NO,
            A.CUST_TP,
            A.CUST_TP2,
            A.CUST_NO,
            A.CUST_NM,
            (SELECT
                REPLACE(LISTAGG(C.MAT_CD, ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
            FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_CD,
            (SELECT
                REPLACE(LISTAGG(Pkg_Rtsd0005.f_sRtsd0005MatName( C.MAT_CD ), ',') WITHIN GROUP(ORDER BY C.MAT_CD),',',CHR(13)||CHR(10))
             FROM RTSD0106 C WHERE C.ORD_NO = B.ORD_NO) AS MAT_NM,
            NVL( D.CAR_NO, B.CAR_NO ) AS CAR_NO,
            NVL( D.CNT_CD, B.CNT_CD ) AS CNT_CD,
            B.ORD_DAY,
            D.PROC_DAY,
            B.STAT_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'S032', B.STAT_CD ) AS STAT_NM,
            A.BIRTH_DAY,
            A.BUSL_NO,
            A.MOB_NO,
            A.TEL_NO,
            NVL( D.PAY_MTHD, B.PAY_MTHD ) AS PAY_MTHD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName( 'R004', NVL( D.PAY_MTHD, B.PAY_MTHD ) ) AS PAY_NM,
            NVL( D.PAY_DD, B.PAY_DD ) AS PAY_DD,
            NVL( (  SELECT  SUM( NVL(Z.PND_AMT,0) - NVL(Z.SBS_AMT,0) )
                    FROM    RTRE0035 Z
                    WHERE   Z.ORD_NO = B.ORD_NO ), 0) AS PREPAID,
            NVL( (  SELECT  SUM( NVL(Y.ARRE_AMT,0) )
                    FROM    RTSD0109 Y
                    WHERE   Y.ORD_NO = B.ORD_NO
                    AND     Y.ARRE_AMT > 0
                    AND     Y.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                    AND     Y.SCD_STAT = 'S' ), 0) AS ARRE_AMT,
            NVL( (  SELECT  MAX(COUNT(*))
                    FROM    RTSD0109 X
                    WHERE   X.ORD_NO = B.ORD_NO
                    AND    X.ARRE_AMT > 0
                    AND    X.ZFB_DAY <= TO_CHAR( SYSDATE, 'YYYYMMDD' )
                    AND    X.SCD_STAT = 'S'
                    GROUP   BY X.RECP_TP ), 0) AS ARRE_MON,
            NVL( (  SELECT  SUM( CASE WHEN Y.ZFB_DAY > TO_CHAR(SYSDATE, 'YYYYMMDD') THEN NVL(Y.ARRE_AMT,0) ELSE 0 END )
                    FROM    RTSD0109 Y
                    WHERE   Y.ORD_NO = B.ORD_NO
                    AND     Y.ARRE_AMT > 0
--                    AND     Y.ZFB_DAY > TO_CHAR( SYSDATE, 'YYYYMMDD' )
                    AND     Y.SCD_STAT = 'S' ), 0) AS PRE_AMT,
                    (SELECT CASE WHEN MFP_YN = 'E' THEN 'E' 
                             WHEN MFP_YN = 'C' THEN
                                  CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = Y.ORD_NO) > 0 THEN 'D' ELSE 'C' END
                             ELSE 
                                  CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = Y.ORD_NO) > 0 THEN 'D' ELSE 'N' END                                    
                             END
                        FROM RTSD0108 Y 
                        WHERE Y.ORD_NO = B.ORD_NO
                        AND ROWNUM = 1) AS MFP_YN,
--                    D.MFP_YN,
                    NVL((SELECT CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END
                            FROM RTRE0220 
                            WHERE TORD_NO = B.ORD_NO 
                            AND VA_DATE >= TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS')), 0) VACS_YN
    FROM    RTSD0100 A,
            RTSD0104 B,
            RTSD0108 D
    WHERE   A.CUST_NO  = DECODE( TRIM( v_Cust_No ), NULL, A.CUST_NO, v_Cust_No )
    AND     A.CUST_NM  LIKE '%' || TRIM( v_Cust_Nm ) || '%'
    AND     B.ORD_NO   = DECODE( TRIM( v_Ord_No  ), NULL, B.ORD_NO , v_Ord_No  )
    AND     B.STAT_CD  = DECODE( TRIM( v_Stat_Cd ), NULL, B.STAT_CD, v_Stat_Cd )    --[20171219_01]
    AND     B.CAR_NO   = DECODE( TRIM( v_Car_No  ), NULL, B.CAR_NO , v_Car_No  )
    AND     A.TEL_NO   = DECODE( TRIM( v_Tel_No  ), NULL, A.TEL_NO , v_Tel_No  )
    AND     A.MOB_NO   = DECODE( TRIM( v_Mob_No  ), NULL, A.MOB_NO , v_Mob_No  )
    AND     A.CUST_NO  = B.CUST_NO
    AND     B.ORD_NO   = D.ORD_NO(+)
--    AND     NOT EXISTS (SELECT 1 FROM RTTEMPIWJ_190429_01 WHERE COL_01 = B.ORD_NO)
    ;


  END p_sRtsd0104ResultCashApp;


 /*****************************************************************************
  -- 계약 정보 - 차량정보 업데이트
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B일시불 가격정책 추가에 따른 수정
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
    ) IS

    e_Error EXCEPTION;
    v_Mat_Cd       RTSD0106.MAT_CD%TYPE;              /*상품코드              */
    v_Rent_Amt     RTSD0106.RENT_AMT%TYPE;            /*렌탈료                */
    v_Ord_Id       RTSD0104.ORD_ID%TYPE;              /*주문구분              */
    v_Ord_Day      RTSD0104.ORD_DAY%TYPE;             /*계약일자              */
    v_Regi_Cd      RTSD0104.REGI_CD%TYPE;             /*등록비코드            */
    v_Period_Cd    RTSD0104.PERIOD_CD%TYPE;           /*기간코드              */
    v_Cnt_Cd       RTSD0104.CNT_CD%TYPE;              /*타이어본수            */
    v_Mat_Cd_A     RTSD0106.MAT_CD%TYPE;              /*상품코드(체크)        */
    v_Rent_Amt_A   RTSD0106.RENT_AMT%TYPE;            /*렌탈료(체크)          */
    v_Sale_Id      RTSD0104.SALE_ID%TYPE;             /*재렌탈구분              */
    v_Chk_Cnt NUMBER DEFAULT 0;
  BEGIN

    IF (TRIM(v_Ord_No) IS NULL) OR (0 = f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '주문번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Maker_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S001', v_Maker_Cd)) THEN
        v_Return_Message := '카메이커('||v_Maker_Cd ||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Model_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S002', v_Model_Cd)) THEN
        v_Return_Message := '차종('||v_Model_Cd ||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Contents_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S003', v_Contents_Cd)) THEN
        v_Return_Message := '사양('||v_Contents_Cd ||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Fr_Cd) IS NULL) OR (0 = Pkg_Rtcm0051.f_sRtcm0051Count('S004', v_Fr_Cd)) THEN
        v_Return_Message := '전후 구분('||v_Fr_Cd ||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Car_No) IS NULL THEN
        v_Return_Message := '차량번호('||v_Car_No ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Car_Owner) IS NULL THEN
        v_Return_Message := '차량소유자('||v_Car_Owner ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_c_Mileage) IS NULL THEN
        v_Return_Message := '현재주행거리('||v_c_Mileage ||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_Srtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF NOT (Pkg_Rtcm0001.f_sRtcm0001UserGrp(v_Reg_Id) IN ('01','02')) THEN
        v_Return_Message := '해당 사용자('||v_Reg_Id||') : 주문취소 권한이 없습니다!';
        RAISE e_Error;
    END IF;

    BEGIN

        SELECT  O.ORD_DAY, O.PERIOD_CD, O.CNT_CD, O.REGI_CD, P.MAT_CD, P.RENT_AMT, O.ORD_ID, O.SALE_ID
        INTO    v_Ord_Day, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd, v_Mat_Cd, v_Rent_Amt, v_Ord_Id, v_Sale_Id
        FROM    RTSD0104 O, /*계약 정보     */
                RTSD0106 P  /*계약 상품 정보*/
        WHERE   O.ORD_NO = v_Ord_no
        AND     O.ORD_NO = P.ORD_NO;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_Return_Message := '해당 계약번호('||v_Ord_no||')로 등록된 계약정보가 없음으로 처리가 불가 합니다!';
        RAISE e_Error;

      WHEN OTHERS THEN
        v_Return_Message := '해당 계약번호('||v_Ord_no||')로 등록된 계약정보 획득시 에러로 처리가 불가 합니다! - '||SUBSTR(SQLERRM, 1, 200);
        RAISE e_Error;
    END;

    -- 변경전 상품정보와 변경후 상품정보를 비교하기 위해 변경된 차량정보 기준 상품코드와 금액 획득
--    BEGIN
--20160111 차종  변경에 따른 상품정보 획득 실패!.. 수정함.. USE_YN  삭제 및 가격관리(AMT) 조건 추가.
--        SELECT  A.MAT_CD, /*상품코드*/
--                D.AMT     /*상품금액*/
--        INTO    v_Mat_Cd_A,
--                v_Rent_Amt_A
--        FROM    RTSD0005 A, /*상품 마스터            */
--                RTSD0004 B, /*차종_장착가능 규격 관리*/
--                RTSD0001 C, /*차종 마스터            */
--                RTSD0008 D  /*가격 관리              */
--        WHERE   A.SECTION_WIDTH = B.SECTION_WIDTH             /*단면폭              */
--        AND     A.ASPECT_RATIO  = B.ASPECT_RATIO              /*편평비              */
--        AND     A.WHEEL_INCHES  = B.WHEEL_INCHES              /*인치                */
--        AND     A.PLY_RATING    = B.PLY_RATING                /*PR(강도)            */
--        AND     A.USE_YN        = 'Y'
--        AND     B.MODEL_CD      = v_Model_Cd                  /*차종(S001)          */
--        AND     B.CONTENTS_CD   = v_Contents_Cd               /*사양(S002,S003)     */
--        AND     B.FR_CD         = v_Fr_Cd                     /*전후 구분           */
--        AND     B.USE_YN        = 'Y'
--        AND     B.MODEL_CD      = C.MODEL_CD
--        AND     B.CONTENTS_CD   = C.CONTENTS_CD
--        AND     C.USE_YN        = 'Y'
--        AND     A.MAT_CD        = D.MAT_CD
--        AND     D.MAT_CD        = v_Mat_Cd                    /*상품코드            */
--        AND     v_Ord_Day BETWEEN D.STR_DAY AND D.END_DAY     /*가격적용            */
--        AND     D.PERIOD_CD     = v_Period_Cd                 /*기간코드            */
--        AND     D.CNT_CD        = v_Cnt_Cd                    /*타이어본수          */
--        AND     D.REGI_CD       = v_Regi_Cd                   /*등록비코드          */
--        AND     D.USE_YN        = 'Y';

--    EXCEPTION
--      WHEN OTHERS THEN
--        v_Return_Message := '차종 변경에 따른 상품정보 획득 실패!.처리가 불가 합니다!';
--        RAISE e_Error;
--    END;


--    IF (NVL(v_Mat_Cd,' ') <> NVL(v_Mat_Cd_A,' ')) OR (NVL(v_Rent_Amt,0) <> NVL(v_Rent_Amt_A,0)) THEN
--        v_Return_Message := '차종 변경 후 상품코드 또는 렌탈료의 변동이 발생하여 변경불가합니다.!';
--        RAISE e_Error;
--    END IF;

       BEGIN
        SELECT COUNT(*)
        INTO v_Chk_Cnt
        FROM    RTSD0005 A, /*상품 마스터            */
                RTSD0004 B, /*차종_장착가능 규격 관리*/
                RTSD0001 C, /*차종 마스터            */
                RTSD0008 D  /*가격 관리              */
        WHERE   A.SECTION_WIDTH = B.SECTION_WIDTH             /*단면폭              */
        AND     A.ASPECT_RATIO  = B.ASPECT_RATIO              /*편평비              */
        AND     A.WHEEL_INCHES  = B.WHEEL_INCHES              /*인치                */
        AND     A.PLY_RATING    = B.PLY_RATING                /*PR(강도)            */
        AND     A.MAT_CD        = D.MAT_CD
        AND     B.MODEL_CD      = v_Model_Cd                  /*차종(S001)          */
        AND     B.CONTENTS_CD   = v_Contents_Cd               /*사양(S002,S003)     */
        AND     B.FR_CD         = v_Fr_Cd                     /*전후 구분           */
        AND     B.MODEL_CD      = C.MODEL_CD
        AND     B.CONTENTS_CD   = C.CONTENTS_CD
        AND     v_Ord_Day BETWEEN D.STR_DAY AND D.END_DAY     /*가격적용            */
        AND     D.PRICE_CD      = DECODE(v_Ord_Id,'01','0002','02','0007','')       /* [20170313_01] */
        AND     D.MAT_CD        = v_Mat_Cd                    /*상품코드            */
        AND     D.PERIOD_CD     = v_Period_Cd                 /*기간코드            */
        AND     D.CNT_CD        = v_Cnt_Cd                    /*타이어본수          */
        AND     D.REGI_CD       = v_Regi_Cd                   /*등록비코드          */
        AND     D.AMT           = v_Rent_Amt;
    EXCEPTION
      WHEN OTHERS THEN
        v_Return_Message := '차종 변경에 따른 상품정보 획득 실패!.처리가 불가 합니다!';
        RAISE e_Error;
    END;

--    IF (v_Chk_Cnt <= 0 AND v_Sale_Id NOT IN ('04')) THEN
--         v_Return_Message := '차종 변경 후 상품코드 또는 렌탈료의 변동이 발생하여 변경불가합니다.!(상품정보 실패)' || v_Model_Cd || '-' || v_Contents_Cd || '-' || v_Fr_Cd || '-' || v_Ord_Id || '-' || v_Mat_Cd || '-' || v_Period_Cd || '-' || v_Cnt_Cd || '-' || v_Regi_Cd || '-' || v_Rent_Amt;
--        RAISE e_Error;
--    END IF;

    -- 장착정보(RTSD0108)가 존재하면 업데이트패
    IF (0 < Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No)) THEN

        UPDATE  RTSD0108
        SET     MAKER_CD    = v_Maker_Cd   ,
                MODEL_CD    = v_Model_Cd   ,
                CONTENTS_CD = v_Contents_Cd,
                FR_CD       = v_Fr_Cd      ,
                CAR_NO      = v_Car_No     ,
                CAR_OWNER   = v_Car_Owner  ,
                C_MILEAGE   = v_C_Mileage  ,
                CHG_ID      = v_Reg_Id     ,
                CHG_DT      = SYSDATE
        WHERE   ORD_NO      = v_Ord_No;

    END IF;

    -- 계약정보(RTSD0104) 업데이트
    UPDATE  RTSD0104
    SET     MAKER_CD    = v_Maker_Cd   ,
            MODEL_CD    = v_Model_Cd   ,
            CONTENTS_CD = v_Contents_Cd,
            FR_CD       = v_Fr_Cd      ,
            CAR_NO      = v_Car_No     ,
            CAR_OWNER   = v_Car_Owner  ,
            C_MILEAGE   = v_C_Mileage  ,
            CHG_ID      = v_Reg_Id     ,
            CHG_DT      = SYSDATE
    WHERE   ORD_NO      = v_Ord_No;

    -- 계약정보 변경 이력 생성
    IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
        v_Return_Message := '이력 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

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
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_Rtsd0104CarInfoUpdate(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_Rtsd0104CarInfoUpdate(2)', v_Errortext, v_Return_Message);

  END p_Rtsd0104CarInfoUpdate;

  /*****************************************************************************
  -- 계약 정보 Select - 고객현황 - 주문현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104CustAnalysis03 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE         /*고객번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO                                                AS ORD_NO,          /*계약번호       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM,         /*계약상태       */
            A.ORD_DAY                                               AS ORD_DAY,         /*접수일자       */
            A.PROC_DAY                                              AS OPROC_DAY,       /*계약-장착일자  */
            TO_CHAR(A.REG_DT, 'HH24:MI:SS')                         AS REG_DT,          /*계약접수시간   */
            DECODE(A.CHAN_CD,
                    '01', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                    '05', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                    DECODE(A.STAT_CD,
                           '06', NULL,
                           A.PROC_DAY))                             AS PROC_DAY,        /*장착완료일자   */
            TO_CHAR(C.REG_DT, 'HH24:MI:SS')                         AS PROC_TM,         /*장착완료시간   */
            (
            SELECT  PETTERN_CD
            FROM    RTSD0005
            WHERE   MAT_CD =  B.MAT_CD
            )                                                       AS PETTERN_CD,      /* 상품패턴      */
            B.MAT_CD                                                AS MAT_CD,          /*상품코드       */
            Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD)               AS MAT_NM,          /*상품명         */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022',A.CNT_CD)       AS CNT_NM,          /*타이어본수     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021',A.PERIOD_CD)    AS PERIOD_NM,       /*계약기간       */
            B.REGI_AMT                                              AS REGI_AMT,        /*렌탈등록비     */
            B.MON_AMT                                               AS MON_AMT,         /*월렌탈료       */
            Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)             AS CUST_NM,         /*고객명         */
            Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)           AS AGENCY_NM    ,   /*장착대리점     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018',A.SALES_GROUP)  AS SALES_GROUP_NM  ,/*지사           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019',A.SALES_OFFICE) AS SALES_OFFICE_NM ,/*지점           */
            DECODE(A.CONTENTS_CD,
                     '0001', Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD),
                             Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)||
                             ' '||
                             Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)) AS MODEL_NM, /*차종+사양명 */
            A.CAR_NO                                                AS CAR_NO,          /*차량번호       */
            A.ORD_AGENT                                             AS ORD_AGENT,       /*판매인번호     */
            E.ORG_AGNM                                              AS ORG_AGNM,        /*판매인명       */
            DECODE(D.GENDER_CD,'1','남','2','여')                   AS GENDER_CD,       /*성별           */
            A.C_MILEAGE                                             AS C_MILEAGE,       /*현재주행거리   */
            (TO_CHAR(SYSDATE,'YYYY')-SUBSTR(D.BIRTH_DAY,1,4)+1)     AS AGE,             /*나이           */
            REPLACE(SUBSTR( D.ADDR1 ,1,REGEXP_INSTR(D.ADDR1,'\ ')),' ','') AS ADDR_AREA,/*지역           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,       /*계절구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S078', F.MF_CD)       AS MF_NM,           /*구매전 제조사  */
            A.CHAN_CD                                               AS CHAN_CD,         /*채널구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM,         /*채널구분       */
            D.MOB_NO                                                AS MOB_NO,          /*핸드폰번호     */
            D.TEL_NO                                                AS TEL_NO,          /*전화번호       */
            C.CANC_DAY                                              AS CANC_DAY,        /*중도완납일     */
            C.OS_DAY                                                AS OS_DAY           /*소유권이전일   */
    FROM    RTSD0104 A,
            RTSD0106 B,
            RTSD0108 C,
            RTSD0100 D,
            RTSD0113 E,
            RTCS0120 F
    WHERE   A.CUST_NO   = v_Cust_No
    AND     A.ORD_NO    = B.ORD_NO
    AND     A.ORD_NO    = C.ORD_NO
    AND     A.CUST_NO   = D.CUST_NO
    AND     A.ORD_AGENT = E.ORD_AGENT(+)
    AND     A.ORD_NO    = F.ORD_NO (+);

  END p_sRtsd0104CustAnalysis03;

  /*****************************************************************************
  -- 계약서 우편발송 대상 추출
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
  *****************************************************************************/
  PROCEDURE p_sRtsd0104ZipDataExport(
    Ref_Cursor         IN OUT SYS_REFCURSOR,
    v_Proc_DayF        IN RTSD0104.PROC_DAY%TYPE,        /*장착일자              */
    v_Proc_DayT        IN RTSD0104.PROC_DAY%TYPE         /*장착일자              */
  ) IS

  BEGIN

      OPEN Ref_Cursor FOR
      SELECT  A.ORD_NO  /*계약번호*/,
            C.CUST_NM /*고객명*/,
            DECODE(C.CUST_TP, '01', C.BIRTH_DAY, O_BIRTHDAY) AS BIR_DAY /*법정생일*/,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S026',DECODE(C.CUST_TP, '01', C.GENDER_CD, O_GENDERCD)) AS GENDER_CD /*성별*/,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S027',DECODE(C.CUST_TP, '01', C.LF_CD    , O_LFCD    )) AS LF_CD /*국적*/,
            C.POS_CD /*우편번호*/,
            C.ADDR1 /*주소*/,
            C.ADDR2 /*상세주소*/,
            C.TEL_NO /*자택*/,
            DECODE(C.CUST_TP, '01', C.MOB_NO   , DECODE(A.CHAN_CD,'06',C.MOB_NO,O_MOBNO)) AS MOB_NO /*핸드폰*/,
            C.MOB_FIRM /*통신사*/,
            C.EMAIL_ADDR /*이메일*/,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) AS MODEL_CD /*차종*/,
            A.CAR_NO /*차량번호*/,
            A.CAR_OWNER /*차량소유주*/,
            A.C_MILEAGE /*현재주행거리*/,
            C.POS_CD2 /*근무지우편번호*/,
            C.ADDR1_2 /*근무지주소*/,
            C.ADDR2_2 /*근무지상세주소*/,
            C.TEL_NO2 /*연락처*/,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',D.PETTERN_CD) AS PATTERN_CD /*패턴*/,
            D.SECTION_WIDTH || '/' || D.ASPECT_RATIO || 'R' ||D.WHEEL_INCHES AS SPEC_NM /*규격*/,
            TO_NUMBER(NVL(A.CNT_CD,0)) AS CNT /*수량*/,
            B.REGI_AMT  /*렌탈등록비*/,
            B.MON_AMT  /*월렌탈료*/,
            A.PERIOD_CD /*총렌탈기간*/,
            B.MAT_DESC /*비고*/,
            DECODE(A.PAY_MTHD, 'A', F.CUST_NM, 'C', G.CUST_NM) AS ACCOUNT_HOLDER /*예금주*/,
            DECODE(A.PAY_MTHD, 'A', DECODE(F.CUST_TP, '01', F.EBIR_DAY, '02', F.BUSL_NO), 'C', DECODE(G.CUST_TP, '01', G.EBIR_DAY, '02', G.BUSL_NO)) AS BUSL_NO /*법정생일(결제정보)*/,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R004',A.PAY_MTHD) AS PAY_MTHD /*결제방법*/,
            A.PAY_DD /*결제일*/,
            DECODE(A.PAY_MTHD, 'A', Pkg_Rtcm0051.f_sRtcm0051CodeName('R001',F.BANK_CD), 'C', Pkg_Rtcm0051.f_sRtcm0051CodeName('R002',G.CARDCOM_CD)) AS BANK_NM /*은행명/카드사명*/,
            DECODE(A.PAY_MTHD, 'A', F.ACCT_NO, 'C', G.CARD_NO) AS CARD_NO /*은행계좌/카드번호*/,
            DECODE(A.PAY_MTHD, 'C', G.EXPIRE_YM) AS EXPIRE_YM /*유효기간(월/년)*/,
            A.AGENCY_CD /*장착점코드*/,
            H.AGENCY_NM /*장착점명*/,
            H.TEL_NO AS AGENCY_TEL  /*연락처(장착점)*/,
            J.PROC_DAY /*장착일자*/,
            H.POS_CD AS POS_CD1 /*장착점우편번호*/,
            H.CITY /*장착점주소*/,
            H.STREET /*장착점상세주소*/,
            A.ORG_CD /*판매점코드*/,
            NULL AS ORG_AGENCY_NM  /*판매점명*/,
            NULL AS ORG_AGENCY_TEL /*연락처(판매점)*/,
            A.ORD_AGENT /*판매인NO*/,
            I.ORG_AGNM  /*판매인명*/,
            I.ORG_AGTEL /*핸드폰(판매인)*/,
            A.FC_DAY /*청구일자*/,
            TO_CHAR(J.REG_DT,'YYYYMMDD') AS CONTRACT_DAY /*계약일자*/
    FROM    RTSD0104 A,
            RTSD0106 B,
            RTSD0100 C,
            RTSD0005 D,
            RTRE0010 F,
            RTRE0020 G,
            RTSD0007 H,
            RTSD0113 I,
            RTSD0108 J
    WHERE   A.PROC_DAY BETWEEN v_Proc_DayF AND v_Proc_DayT    --* 요청기간 세팅
    AND     A.CHAN_CD NOT IN ('09')                           -- [20170316_01] B2B일시불의 경우 계약서 없이 장착확인서만 존재하므로 제외
    AND     A.STAT_CD = '04'
    AND     A.CON_MTHD = '2'
    AND     A.ORD_NO  = B.ORD_NO
    AND     A.CUST_NO = C.CUST_NO
    AND     B.MAT_CD  = D.MAT_CD
    AND     A.ACC_SEQ = F.ACC_SEQ(+)
    AND     A.CRD_SEQ = G.CRD_SEQ(+)
    AND     A.AGENCY_CD = H.AGENCY_CD
    AND     A.ORD_AGENT = I.ORD_AGENT(+)
    AND     A.ORD_NO = J.ORD_NO
    ORDER BY A.ORD_NO;

  END p_sRtsd0104ZipDataExport;

  /*****************************************************************************
  -- 방판오더(B,O,M) SAP인터페이스 유무
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-03-16  wjim             [20170316_01] B2B일시불 채널 추가에 따른 수정
  *****************************************************************************/
  FUNCTION f_sRtsd0104ToRtsd0115Count(
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,            /*주문번호            */
    v_Ord_Type       IN VARCHAR2                         /*오더타입            */
  ) RETURN NUMBER IS

    v_Cnt NUMBER;
  BEGIN

    SELECT COUNT(*) INTO v_Cnt
    FROM RTSD0104 A, RTSD0115 B
    WHERE A.ORD_NO = B.ORD_NO
    AND TRANS_TP = v_Ord_Type --정상오더:N, 걱정제로:S1, S2
    AND A.ORD_NO = v_Ord_No
    AND SUBSTR(A.ORD_NO, 0, 1) IN ('B', 'O', 'M');

    RETURN v_Cnt;

  EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0104ToRtsd0115Count;

  /*****************************************************************************
  -- 계약 정보 Update - 재렌탈 정보 업데이트
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104ReRental (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Add_No         IN RTSD0104.ORD_NO%TYPE,         /*상태                  */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0104
    SET    FORD_NO  = v_Ord_No
    WHERE  ORD_NO   = v_Add_No;

    UPDATE RTSD0108
    SET    FORD_NO  = v_Ord_No
    WHERE  ORD_NO   = v_Add_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0104ReRental;

  /*****************************************************************************
  -- 계약상품 납부정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0104CntPrdPymInfo (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE          /*주문번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    
    SELECT AA.ORD_NO   /*주문번호*/,
       AA.MAT_CD       /*제품서비스코드*/,
       AA.MAT_NM       /*제품명*/,
       AA.PERIOD_CD    /*랜탈기간코드*/,
       AA.PERIOD_NM    /*랜탈기간명*/,
       AA.AMT          /*일시불*/,
       AA.RENT_AMT     /*월 렌탈료*/,
       AA.REGI_AMT     /*등록비*/,
       AA.DC_AMT       /*할인액*/,
       AA.CNT_CD       /*타이어본수*/,
       AA.PRS_PK       /*프리미엄서비스 키*/
    FROM (SELECT A.ORD_NO,
               A.MAT_CD,
               B.MAT_NM,
               A.PERIOD_CD,
               Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD) AS PERIOD_NM,
               0 AS AMT,
               NVL(A.RENT_AMT, 0) AS RENT_AMT,
               NVL(A.REGI_AMT, 0) AS REGI_AMT,
               NVL(A.MON_DCAMT, 0) AS DC_AMT, -- 할인액
               A.CNT_CD,
               A.MAT_CD||A.PERIOD_CD||A.CNT_CD AS PRS_PK
          FROM RTSD0106 A, RTSD0005 B, RTSD0040 C
         WHERE A.MAT_CD = B.MAT_CD
           AND A.ORD_NO = C.ORD_NO(+)
           AND A.SEQ = C.SEQ(+)
        UNION ALL
        SELECT A.ORD_NO,
               A.ADD_GDS_CD,
               B.ADD_GDS_NM, -- 제품명 (0005)
               CASE WHEN A.DC_YN = 'Y' THEN C.PERIOD_CD ELSE '' END AS PERIOD_CD,
               CASE WHEN A.DC_YN = 'Y' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S021', C.PERIOD_CD) ELSE '' END AS PERIOD_NM,
               CASE WHEN A.DC_YN = 'Y' THEN 0 ELSE A.L_AMT END AS AMT,
               CASE WHEN A.DC_YN = 'Y' THEN A.MON_AMT ELSE 0 END AS RENT_AMT,
               0,
               --CASE WHEN A.DC_YN = 'Y' THEN 0 ELSE A.DC_AMT END AS DC_AMT, -- 할인액
               0 AS DC_AMT, -- 할인액
               '0',
               ''
          FROM RTSD0041 A, RTSD0023 B, RTSD0104 C
         WHERE A.ADD_GDS_CD = B.ADD_GDS_CD
           AND A.ORD_NO = C.ORD_NO
       UNION ALL
       SELECT C.ORD_NO,
              C.PRS_DCD,
              C.PRS_NM,
              C.PERIOD_CD,
              C.PERIOD_NM,
              0,
              C.SERV_AMT_SUM,
              0,
              CASE WHEN C.DC_RATE = 0 THEN 0
                   ELSE TRUNC(C.SERV_AMT_SUM * C.DC_RATE/100 )
              END AS DC_AMT,
              C.CNT_CD,
              C.PRS_DCD AS PRS_PK              
        FROM (
                SELECT AA.SALE_CD,
                       AA.PRS_DCD,
                       Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM, 
                       AA.SERV_INF_YN,
                       CC.PERIOD_CD,
                       Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', CC.PERIOD_CD) AS PERIOD_NM,
                       BB.CNT_CD,
                       Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', BB.CNT_CD) AS CNT_NM,
                       BB.SERV_CNTR,
                       BB.SERV_AMT AS SERV_AMT_SUM,
                       CC.ORD_NO,
                       CASE WHEN DD.PRDT_GRP_DTL = '03' THEN 
                           CASE WHEN DD.DC_RATE = 0 THEN DD.DC_AMT
                                 ELSE TRUNC(BB.SERV_AMT * DD.DC_RATE/100 )
                           END
                       END GROUP_SALE_1,     /* 단체할인 */
                       CASE WHEN DD.PRDT_GRP_DTL IS NULL OR  DD.PRDT_GRP_DTL !='03' THEN 
                           CASE WHEN DD.DC_RATE = 0 THEN DD.DC_AMT
                                ELSE TRUNC(BB.SERV_AMT * DD.DC_RATE/100 ) 
                           END
                       END CHNL_SALE_1,       /* 판매채널할인 */
                       DD.DC_RATE,
                       DD.DC_AMT
                  FROM RTSD0028 AA, 
                       RTSD0013 BB, 
                       RTSD0104 CC,
                       RTSD0020 DD       
                 WHERE AA.PRS_DCD = BB.PRS_DCD
                   AND AA.SALE_CD = CC.SALE_CD
                   AND AA.SALE_CD = DD.SALE_CD
                   AND CC.ORD_NO = BB.ORD_NO             
             ) C
         ) AA
   WHERE AA.ORD_NO = v_Ord_No;
       
    /*
    SELECT AA.ORD_NO   --주문번호
       AA.MAT_CD       --제품서비스코드
       AA.MAT_NM       --제품명
       AA.PERIOD_CD    --랜탈기간코드
       AA.PERIOD_NM    --랜탈기간명
       AA.AMT          --일시불
       AA.RENT_AMT     --월 렌탈료
       AA.REGI_AMT     --등록비
       AA.DC_AMT       --할인액
       AA.CNT_CD       --타이어본수
       AA.PRS_PK       --프리미엄서비스 키
    FROM (SELECT A.ORD_NO,
               A.MAT_CD,
               B.MAT_NM,
               A.PERIOD_CD,
               Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD) AS PERIOD_NM,
               0 AS AMT,
               NVL(A.RENT_AMT, 0) AS RENT_AMT,
               NVL(A.REGI_AMT, 0) AS REGI_AMT,
               NVL(A.MON_DCAMT, 0) AS DC_AMT, -- 할인액
               A.CNT_CD,
               A.MAT_CD||A.PERIOD_CD||A.CNT_CD AS PRS_PK
          FROM RTSD0106 A, RTSD0005 B, RTSD0040 C
         WHERE A.MAT_CD = B.MAT_CD
           AND A.ORD_NO = C.ORD_NO(+)
           AND A.SEQ = C.SEQ(+)
        UNION ALL
        SELECT A.ORD_NO,
               A.ADD_GDS_CD,
               B.ADD_GDS_NM, -- 제품명 (0005)
               CASE WHEN A.DC_YN = 'Y' THEN C.PERIOD_CD ELSE '' END AS PERIOD_CD,
               CASE WHEN A.DC_YN = 'Y' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S021', C.PERIOD_CD) ELSE '' END AS PERIOD_NM,
               CASE WHEN A.DC_YN = 'Y' THEN 0 ELSE B.AMT END AS AMT,
               CASE WHEN A.DC_YN = 'Y' THEN A.MON_AMT ELSE 0 END AS RENT_AMT,
               0,
               --CASE WHEN A.DC_YN = 'Y' THEN 0 ELSE A.DC_AMT END AS DC_AMT, -- 할인액
               0 AS DC_AMT, -- 할인액
               '0',
               ''
          FROM RTSD0041 A, RTSD0023 B, RTSD0104 C
         WHERE A.ADD_GDS_CD = B.ADD_GDS_CD
           AND A.ORD_NO = C.ORD_NO
       UNION ALL
       SELECT C.ORD_NO,
              C.PRS_DCD,
              C.PRS_NM,
              C.PERIOD_CD,
              C.PERIOD_NM,
              0,
              C.SERV_AMT_SUM,
              0,
              0,
              C.CNT_CD,
              C.PRS_DCD AS PRS_PK
        FROM (
                SELECT AA.SALE_CD,
                       AA.PRS_DCD,
                       Pkg_Rtcm0051.f_sRtcm0051CodeName('S044', AA.PRS_DCD) AS PRS_NM,
                       AA.SERV_AMT,
                       AA.SERV_INF_AMT,
                       AA.SERV_INF_YN,
                       CC.PERIOD_CD,
                       Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', CC.PERIOD_CD) AS PERIOD_NM,
                       BB.CNT_CD,
                       Pkg_Rtcm0051.f_sRtcm0051CodeName('S022', BB.CNT_CD) AS CNT_NM,
                       BB.SERV_CNTR,
                      (BB.SERV_CNTR * AA.SERV_AMT) AS SERV_AMT_SUM,
                       CC.ORD_NO
                  FROM  (SELECT A.SALE_CD,
                              A.PRS_DCD,
                              B.SERV_AMT,
                              B.SERV_INF_AMT,
                              A.SERV_INF_YN
                         FROM RTSD0028 A, RTSD0043 B
                        WHERE A.PRS_DCD = B.PRS_DCD) AA, RTSD0013 BB, RTSD0104 CC
                 WHERE AA.PRS_DCD = BB.PRS_DCD
                   AND AA.SALE_CD = CC.SALE_CD
                   AND CC.ORD_NO = BB.ORD_NO
             ) C
         ) AA
   WHERE AA.ORD_NO = v_Ord_No;
  */
  END p_sRtsd0104CntPrdPymInfo;


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
    v_Grp_No     IN RTSD0104.GRP_NO%TYPE                    /* 단체번호 */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.ORD_DAY,                                                            /*계약일자      */
            B.ORD_NO,                                                             /*계약번호      */
            B.CUST_NO,                                                            /*고객코드      */
            A.BIRTH_DAY,                                                          /*법정생년월일  */
            A.BUSL_NO,                                                            /*사업자번호    */
            A.CUST_NM,                                                            /*고객명,법인명 */
            A.GENDER_CD,                                                          /*성별코드      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,   /*성별명        */
            A.LF_CD,                                                              /*내외국인코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,           /*내외국인코드명*/
            A.MOB_NO,                                                             /*핸드폰        */
            A.TEL_NO,                                                             /*전화번호      */
            A.TEL_NO2,                                                            /*전화번호2     */
            '('||A.POS_CD||')'||' '||A.ADDR1||' '||A.ADDR2 AS ADDR,               /*주소          */
            B.CAR_NO,                                                             /*차량번호      */
            B.MAKER_CD,                                                           /*카메이커      */
            B.MODEL_CD,                                                           /*차종          */
            B.CONTENTS_CD,                                                        /*사양          */
            B.FR_CD,                                                              /*전후구분      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S004', B.FR_CD) CAR_KIND,    /*차종          */
            B.STAT_CD,                                                            /*계약상태코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD) AS STAT_NM,       /*계약상태명    */
            E.SALE_NM,                                                          /*판매상품명*/
            A.CUST_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S214',E.CHAN_CD) AS CHAN_NM,          /*채널판매구분*/
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S096',E.HSHOP_GB) AS HSHOP_GB_NM,          /* 홈쇼핑구분코드명 */
            B.MON_AMT,                                                             /* 월렌탈료 */
            B.GRP_NO,                                                             /* 단체번호  */
            B.SEASON_CD,                                                          /*계절구분코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', B.SEASON_CD) SEASON_NM,       /*계절구분      */
            (SELECT COUNT(GRP_NO) FROM RTSD0104   WHERE GRP_NO=v_Grp_No)AS GRP_CNT,
            F.GRP_ST,
            F.GRP_DC_RATE,
            F.GRP_DC_AMT,
            B.CNT_CD                                                               /* 타이어본수 */
    FROM    RTSD0100 A,
            RTSD0104 B,
            RTSD0020 E,
            RTSD0031 F

    WHERE   A.CUST_NO = B.CUST_NO
    AND     B.SALE_CD = E.SALE_CD(+)
    AND     B.GRP_NO  = F.GRP_NO(+)
    AND     A.CUST_TP = DECODE( v_custTp , NULL, A.CUST_TP , v_custTp)
    AND     B.CHAN_CD = DECODE( v_chanCd , NULL, B.CHAN_CD , v_chanCd)
    AND     (v_statCd   IS NULL OR B.STAT_CD   =  v_statCd)
    AND     (v_birthday IS NULL OR A.BIRTH_DAY =  v_birthday)
    AND     (v_mobNo    IS NULL OR A.MOB_NO    =  v_mobNo)
    AND     (v_carNo    IS NULL OR B.CAR_NO    =  v_carNo)
    AND     (v_custNm   IS NULL OR A.CUST_NM   =  v_custNm)
    AND     (v_telNo    IS NULL OR A.TEL_NO    =  v_telNo)
    AND     (v_telNo2   IS NULL OR A.TEL_NO2   =  v_telNo2)
    AND     (v_gender   IS NULL OR A.GENDER_CD =  v_gender)
    AND     (v_lf       IS NULL OR A.LF_CD     =  v_lf)
    AND     (v_buslNo   IS NULL OR A.BUSL_NO   =  v_buslNo)
    AND     (v_Ord_No   IS NULL OR B.ORD_NO   =  v_Ord_No)
    AND     (v_Grp_No   IS NULL OR B.GRP_NO   =  v_Grp_No)

    ORDER   BY ORD_NO DESC;


  END p_sRtsd0104_ordNoList2PoPup;
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  B.ORD_DAY,                                                            /*계약일자      */
            B.ORD_NO,                                                             /*계약번호      */
            B.CUST_NO,                                                            /*고객코드      */
            A.BIRTH_DAY,                                                          /*법정생년월일  */
            A.BUSL_NO,                                                            /*사업자번호    */
            A.CUST_NM,                                                            /*고객명,법인명 */
            A.GENDER_CD,                                                          /*성별코드      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,   /*성별명        */
            A.LF_CD,                                                              /*내외국인코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,           /*내외국인코드명*/
            A.MOB_NO,                                                             /*핸드폰        */
            A.TEL_NO,                                                             /*전화번호      */
            A.TEL_NO2,                                                            /*전화번호2     */
            '('||A.POS_CD||')'||' '||A.ADDR1||' '||A.ADDR2 AS ADDR,               /*주소          */
            B.CAR_NO,                                                             /*차량번호      */
            B.MAKER_CD,                                                           /*카메이커      */
            B.MODEL_CD,                                                           /*차종          */
            B.CONTENTS_CD,                                                        /*사양          */
            B.FR_CD,                                                              /*전후구분      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S004', B.FR_CD) CAR_KIND,    /*차종          */
            B.STAT_CD,                                                            /*계약상태코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD) AS STAT_NM,       /*계약상태명    */
            A.CUST_TP,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S029',B.ORD_ID) AS ORDER_NM,          /*채널판매구분*/
            B.MON_AMT,                                                             /* 월렌탈료 */
            B.GRP_NO,                                                             /* 단체번호  */
            B.SEASON_CD,                                                          /*계절구분코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', B.SEASON_CD) SEASON_NM,       /*계절구분      */
            B.CNT_CD                                                               /* 타이어본수 */
    FROM    RTSD0100 A,
            RTSD0104 B

    WHERE   A.CUST_NO = B.CUST_NO
    AND     A.CUST_TP = DECODE( v_custTp , NULL, A.CUST_TP , v_custTp)
    AND     B.ORD_ID = DECODE( v_orderCd , NULL, B.ORD_ID , v_orderCd)
    AND     (v_birthday IS NULL OR A.BIRTH_DAY =  v_birthday)
    AND     (v_mobNo    IS NULL OR A.MOB_NO    =  v_mobNo)
    AND     (v_custNm   IS NULL OR A.CUST_NM   =  v_custNm)
    AND     (v_buslNo   IS NULL OR A.BUSL_NO   =  v_buslNo)

    ORDER   BY ORD_NO DESC;


  END p_sRtsd0104_ordNoList3PoPup;
  
  /*****************************************************************************
  -- 배송현황조회 팝업
  *****************************************************************************/
  PROCEDURE p_sRtsd0104_ordNoList4PoPup (
    Ref_Cursor   IN OUT SYS_REFCURSOR,
    v_Ord_No     IN RTSD0104.ORD_NO%TYPE,                /*주문번호          */
    v_Order_Type IN VARCHAR2,                            /*주문유형          */
    v_Req_Num    IN NUMBER
    ) IS

  BEGIN

    IF v_Order_Type = 'A' THEN
        
        OPEN Ref_Cursor FOR
        SELECT  B.ORD_NO,                                                             /*계약번호      */
                A.CUST_NO,                                                            /*고객코드      */
                A.CUST_NM,                                                            /*고객명,법인명 */
                A.MOB_NO,                                                             /*핸드폰        */
                B.OUT_STOCK_TYPE                                                      /*매입재고유형        */
        FROM    RTSD0100 A,
                RTSD0104 B

        WHERE   A.CUST_NO = B.CUST_NO
        AND     B.ORD_NO = v_Ord_No

        ORDER   BY ORD_NO DESC;
    
    ELSIF v_Order_Type = 'B' THEN
        
        OPEN Ref_Cursor FOR
        SELECT  B.ORD_NO,                                                             /*계약번호      */
                A.CUST_NO,                                                            /*고객코드      */
                NVL(B.CUST_NM, A.CUST_NM) AS CUST_NM,                                 /*고객명,법인명 */
                NVL(B.DLV_TEL, A.MOB_NO) AS MOB_NO,                                   /*핸드폰        */
                '' AS OUT_STOCK_TYPE                                                  /*매입재고유형        */
        FROM    RTSD0100 A,
                RTCS0010 B

        WHERE   A.CUST_NO = B.CUST_NO
        AND     B.ORD_NO = v_Ord_No
        AND     Pkg_Rtcs0010.f_sRtcs0010ReqNo(B.ORD_NO, B.DLVR_DAY, B.DLVR_SEQ) = v_Req_Num

        ORDER   BY ORD_NO DESC;
        
    ELSE 
    
        OPEN Ref_Cursor FOR
        SELECT  B.ORD_NO,                                                             /*계약번호      */
                A.CUST_NO,                                                            /*고객코드      */
                NVL(B.CUST_NM, A.CUST_NM) AS CUST_NM,                                 /*고객명,법인명 */
                NVL(B.DLV_TEL, A.MOB_NO) AS MOB_NO,                                   /*핸드폰        */
                '' AS OUT_STOCK_TYPE                                                  /*매입재고유형        */
        FROM    RTSD0100 A,
                RTCS0208 B

        WHERE   A.CUST_NO = B.CUST_NO
        AND     B.ORD_NO = v_Ord_No
        AND     Pkg_Rtcs0208.f_sRtcs0208ReqNo(B.ORD_NO, B.DLVR_TYPE, B.DLVR_DAY, B.DLVR_SEQ) = v_Req_Num

        ORDER   BY ORD_NO DESC;
        
    END IF;


  END p_sRtsd0104_ordNoList4PoPup;




  /*****************************************************************************
  -- 계약 정보 관리(IUD) - 일시불
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
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
    ) IS

    e_Error EXCEPTION;
    v_Sales_GroupB   RTSD0104.SALES_GROUP%TYPE;    /*지사                  */
    v_Sales_OfficeB  RTSD0104.SALES_OFFICE%TYPE;   /*지점                  */
    
--    v_Snd_Msg       RTSD0205.SND_MSG%TYPE DEFAULT NULL;               /*SMS메시지 [20170405_02] */
--    v_StatCd        VARCHAR2(10);    --상태코드
--    v_Cust_Nm       VARCHAR2(100);   --고객명
--    v_Mat_Nm        VARCHAR2(100);  --계약상품
--    v_Ord_Qty       VARCHAR2(100);  --계약수량
--    v_Period_Nm     VARCHAR2(10);  --계약기간
--    v_Regi_Nm       VARCHAR2(50);  --최초등록비
--    v_Summon_Amt    NUMBER;  --월렌탈료
--    v_Agency_Nm     VARCHAR2(100);  --장착점상호명
--    v_Agency_Addr   VARCHAR2(500);  --장착점주소
--    v_Agency_TelNo  VARCHAR2(20);  --장착점전화번호
--    v_Prc_Day       VARCHAR2(20);  --장착예정일
--    v_Customer_Mobno  VARCHAR2(20);--받는사람핸드폰번호

  BEGIN


    IF 0 = f_sRtsd0104Count(v_Ord_No) THEN



        IF v_Ord_No IS NULL OR TRIM(v_Ord_No) = '' THEN
            v_Ord_No := f_sRtsd0104Ordno(v_Chan_Cd);
        END IF;

        IF 0 != f_InsertRtsd0104(v_Ord_No, v_Ord_Day, v_Ord_Id, v_Chan_Cd,
                                 v_Sale_Id, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd,
                                 v_Camp_Yn, v_c_Dcrate, v_c_Dcamt, v_Cust_No,
                                 v_Cust_Tp, v_Safekey, v_Grp_Yn, v_Grp_No,
                                 v_g_Dcrate, v_G_Dcamt, v_L_Dcrate, v_L_Dcamt,
                                 v_F_Dcrate, v_F_Dcamt, v_Bord_No, v_Stat_Cd,
                                 v_Proc_Day, v_CANC_DAY, v_Agency_Cd, v_Sales_Group,
                                 v_Sales_Office, v_Eng_Nm, v_Ag_Desc, v_Maker_Cd,
                                 v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Car_No,
                                 v_Car_Owner, v_c_Mileage, v_Req_Text, v_Pay_Mthd,
                                 v_Pay_Dd, v_Acc_Seq, v_CRD_SEQ, v_Acc_Chk,
                                 v_Acc_Stat, v_Bkey_Chk, v_Batch_Key, v_Bill_Yn,
                                 v_Crdt_Stat, v_Cert_Cd, v_Cert_Stat, v_Ord_Agent,
                                 v_Org_Cd, v_Org_Hq, v_Org_L1, v_Org_L2,
                                 v_Org_L3, v_Org_L4, v_Ins_Org, v_Ps_Cd,
                                 v_Cmsag_Yn, v_Con_Mthd, v_Pcert_Yn, v_Fc_Day,
                                 v_Ag_Day, v_Ag_Seq, v_Input_Dt, v_File_Path, v_File_Name,
                                 v_Tcgrp_No, v_Vbeln, v_Season_Cd, v_Regi_Amt, v_Sum_Mon_Amt,
                                 v_Mon_Amt, v_Sale_Cd, v_Pay_Gb, v_Reg_Id, 
                                 v_Inst_Cd, v_Inst_Tm, v_Inst1_Poscd, v_Inst1_Addr1, v_Inst1_Addr2,
                                 v_Inst2_Poscd, v_Inst2_Addr1, v_Inst2_Addr2, v_Tms_OrderId, NULL,
                                 v_Out_Stock_Yn, v_Out_Stock_Type, v_Errortext) THEN
            v_Return_Message := '계약 등록 실패!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;

        END IF;

        IF v_Sale_Id IN ('04') THEN
            --재렌탈인경우 재렌탈 대상 주문번호를 입력
            v_Req_Text := PKG_COMM.f_sReRentalOrdNo(v_Cust_No, v_Safekey);
        END IF;

        IF 0 != f_UpdateRtsd0104ReRental(v_Ord_No, v_Req_Text, v_Errortext) THEN

            v_Return_Message := '재렌탈 정보 등록 실패!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF (TRIM(v_Chan_Cd) = '01') OR (TRIM(v_Chan_Cd) = '05') THEN
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('S068') <= f_sRtsd0104SetCarCountUp(v_Cust_No, v_Ord_No, v_Car_No) THEN
                    v_Return_Message := '수정 가능한 총 차량수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S068') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;

                -- [20171114_01] 겨울용 타이어 주문 시에는 장착가능개수 판단 skip
                IF (v_Season_Cd <> '02') AND (Pkg_Rtcm0051.f_sRtcm0051Cd('S069') < f_sRtsd0104SetTireNbCountUp(v_Cust_No, v_Ord_No) + TO_NUMBER(v_Cnt_Cd)) THEN
                    v_Return_Message := '수정 가능한 총 타이어본수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S069') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;

                IF Pkg_Rtsd0007.f_sRtsd0007SetOlimitCntCount(v_Agency_Cd) <= f_sRtsd0104SetOlimitCntUp(v_Ord_Day, v_Ord_No, v_Agency_Cd) THEN
                    v_Return_Message := '대리점 일일 계약가능한 건수를 초과하였습니다.';
                    RAISE e_Error;
                END IF;
            END IF;

            IF (TRIM(v_Chan_Cd) = '03') OR (TRIM(v_Chan_Cd) = '04') THEN
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('S068') <= f_sRtsd0104SetCarCountUp(v_Cust_No, v_Ord_No, v_Car_No) THEN
                    v_Return_Message := '수정 가능한 총 차량수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S068') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;

                -- [20171114_01] 겨울용 타이어 주문 시에는 장착가능개수 판단 skip
                IF (v_Season_Cd <> '02') AND (Pkg_Rtcm0051.f_sRtcm0051Cd('S069') < f_sRtsd0104SetTireNbCountUp(v_Cust_No, v_Ord_No) + TO_NUMBER(v_Cnt_Cd)) THEN
                    v_Return_Message := '수정 가능한 총 타이어본수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S069') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;

                --IF Pkg_Rtsd0007.f_sRtsd0007SetOlimitCntCount(v_Agency_Cd) <= f_sRtsd0104SetOlimitCntUp(v_Ord_Day, v_Ord_No, v_Agency_Cd) THEN
                --    v_Return_Message := '대리점 일일 계약가능한 건수를 초과하였습니다.';
                --    RAISE e_Error;
                --END IF;
            END IF;

            IF 0 != f_Updatertsd0104(v_Ord_No, v_Ord_Day, v_Ord_Id, v_Chan_Cd,
                                     v_Sale_Id, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd,
                                     v_Camp_Yn, v_c_Dcrate, v_c_Dcamt, v_Cust_No,
                                     v_Cust_Tp, v_Safekey, v_Grp_Yn, v_Grp_No,
                                     v_g_Dcrate, v_G_Dcamt, v_L_Dcrate, v_L_Dcamt,
                                     v_F_Dcrate, v_F_Dcamt, v_Bord_No, v_Stat_Cd,
                                     v_Proc_Day, v_CANC_DAY, v_Agency_Cd, v_Sales_Group,
                                     v_Sales_Office, v_Eng_Nm, v_Ag_Desc, v_Maker_Cd,
                                     v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Car_No,
                                     v_Car_Owner, v_c_Mileage, v_Req_Text, v_Pay_Mthd,
                                     v_Pay_Dd, v_Acc_Seq, v_Crd_Seq, v_Acc_Chk,
                                     v_Acc_Stat, v_Bkey_Chk, v_Batch_Key, v_Bill_Yn,
                                     v_Crdt_Stat, v_Cert_Cd, v_Cert_Stat, v_Ord_Agent,
                                     v_Org_Cd, v_Org_Hq, v_Org_L1, v_Org_L2,
                                     v_Org_L3, v_Org_L4, v_Ins_Org, v_Ps_Cd,
                                     v_Cmsag_Yn, v_Con_Mthd, v_Pcert_Yn, v_Fc_Day,
                                     v_Ag_Day, v_Ag_Seq, v_Input_Dt, v_File_Path, v_File_Name,
                                     v_Tcgrp_No, v_Vbeln, v_Season_Cd, v_Regi_Amt, v_Sum_Mon_Amt,
                                     v_Mon_Amt, v_Sale_Cd, v_Pay_Gb, v_Reg_Id,
                                     v_Inst_Cd, v_Inst_Tm, v_Inst1_Poscd, v_Inst1_Addr1, v_Inst1_Addr2,
                                     v_Inst2_Poscd, v_Inst2_Addr1, v_Inst2_Addr2, v_Errortext) THEN
                v_Return_Message := '계약 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_Deletertsd0104(v_Ord_No, v_Stat_Cd, v_Reg_Id, v_Errortext) THEN
               v_Return_Message := '삭제 실패!!!'||'-'||v_Errortext;
               v_Errortext := v_Errortext;
               RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
        v_Return_Message := '이력 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;

    
--    IF v_Ord_No IS NOT NULL THEN
--    
--        SELECT A.STAT_CD 
--        INTO   v_StatCd
--        FROM RTSD0104 A 
--        WHERE A.ORD_NO = v_Ord_No;
--        
--        IF v_StatCd = '01' THEN
--            
--            BEGIN
--                SELECT
--                  (SELECT A.CUST_NM FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS CUST_NM
--                  ,(SELECT LISTAGG(B.MAT_NM,',') WITHIN GROUP(ORDER BY B.MAT_NM) FROM RTSD0106 A, RTSD0005 B WHERE A.ORD_NO = T.ORD_NO AND A.MAT_CD = B.MAT_CD) AS MAT_NM
--                  ,(SELECT SUM(A.ORD_QTY) FROM RTSD0106 A WHERE A.ORD_NO = T.ORD_NO) AS ORD_QRY
--                  ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', T.PERIOD_CD) AS PERIOD_NM 
--                  ,T.REGI_AMT
--                  ,T.SUM_MON_AMT
--                  ,(SELECT A.AGENCY_NM  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_NM
--                  ,(SELECT A.CITY||' '||A.STREET  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_ADDR
--                  ,(SELECT REGEXP_REPLACE(REGEXP_REPLACE (A.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3')  
--                    FROM RTSD0007 A 
--                    WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_TEL_NO
--                  ,TO_CHAR(TO_DATE(T.PROC_DAY,'YYYYMMDD'),'YYYY.MM.DD') AS PROC_DAY
--                  ,(SELECT A.MOB_NO FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS MOB_NO
--                INTO v_Cust_Nm          --고객명
--                     ,v_Mat_Nm          --계약상품
--                     ,v_Ord_Qty         --계약수량
--                     ,v_Period_Nm       --계약기간
--                     ,v_Regi_Nm         --최초등록비
--                     ,v_Summon_Amt      --월렌탈료
--                     ,v_Agency_Nm       --장착점상호명
--                     ,v_Agency_Addr     --장착점주소
--                     ,v_Agency_TelNo    --장착점전화번호
--                     ,v_Prc_Day        --장착예정일
--                     ,v_Customer_Mobno  --받는사람핸드폰번호
--                FROM RTSD0104 T
--                WHERE T.ORD_NO = v_Ord_No;
--                
--                
--                v_Snd_Msg := '';
--                v_Snd_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님 타이어 렌탈 서비스를 이용해 주셔서 감사합니다.';
--                v_Snd_Msg := v_Snd_Msg||'구매자명 : '||v_Cust_Nm||', 구매 상품 : '||v_Mat_Nm||', 구매수량 : '||v_Ord_Qty||', 계약기간 : '||v_Period_Nm||', 총 결제금액 : '||v_Regi_Nm;
--                v_Snd_Msg := v_Snd_Msg||'(장착점 안내) 상호명 : '||v_Agency_Nm||', 주소 : '||v_Agency_Addr||', 전화번호 : '||v_Agency_TelNo||', 장착 예정일 : '||v_Prc_Day;
--                
--                --주문접수완료 SMS 발송
--                Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
--                      'I'                                   /*예약 전송여부    */
--                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
--                    , v_Customer_Mobno                      /*받는 전화번호    */
--                    , '18550100'                            /*보내는 전화번호  */
--                    , v_Snd_Msg                             /*메시지내용       */
--                    , ''                                    /*사용자지정 필드1 */
--                    , v_Ord_No                              /*사용자지정 필드2 */
--                    ,'2'
--                    ,'RENTAL00000000000086'
--                    , v_Reg_Id                              /*등록자 ID        */
--                    , v_Success_Code
--                    , v_Return_Message
--                    , v_ErrorText
--                );
--            EXCEPTION 
--                WHEN NO_DATA_FOUND THEN 
--                Null; 
--            END;
--            
--        END IF;
--    END IF;

               
    

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
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_IUDRtsd0104(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_IUDRtsd0104(2)', v_Errortext, v_Return_Message);

  END p_IUDRtsd0104DirectOrder;

 /*****************************************************************************
  -- 계약 정보 Select - 고객현황 - 주문현황리스트
  *****************************************************************************/
  PROCEDURE p_sRtsd0104CustAnalysis03New (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0104.CUST_NO%TYPE         /*고객번호              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO                                                AS ORD_NO,          /*계약번호       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM,         /*계약상태       */
            A.ORD_DAY                                               AS ORD_DAY,         /*접수일자       */
            A.PROC_DAY                                              AS OPROC_DAY,       /*계약-장착일자  */
            TO_CHAR(A.REG_DT, 'HH24:MI:SS')                         AS REG_DT,          /*계약접수시간   */
            DECODE(A.CHAN_CD,
                    '01', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                    '05', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                    DECODE(A.STAT_CD,
                           '06', NULL,
                           A.PROC_DAY))                             AS PROC_DAY,        /*장착완료일자   */
            TO_CHAR(C.REG_DT, 'HH24:MI:SS')                         AS PROC_TM,         /*장착완료시간   */
            Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)             AS CUST_NM,         /*고객명         */
            Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)           AS AGENCY_NM    ,   /*장착대리점     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018',A.SALES_GROUP)  AS SALES_GROUP_NM  ,/*지사           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019',A.SALES_OFFICE) AS SALES_OFFICE_NM ,/*지점           */
            DECODE(A.CONTENTS_CD,
                     '0001', Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD),
                             Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)||
                             ' '||
                             Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)) AS MODEL_NM, /*차종+사양명 */
            A.CAR_NO                                                AS CAR_NO,          /*차량번호       */
            A.ORD_AGENT                                             AS ORD_AGENT,       /*판매인번호     */
            E.ORG_AGNM                                              AS ORG_AGNM,        /*판매인명       */
            DECODE(D.GENDER_CD,'1','남','2','여')                   AS GENDER_CD,       /*성별           */
            A.C_MILEAGE                                             AS C_MILEAGE,       /*현재주행거리   */
            (TO_CHAR(SYSDATE,'YYYY')-SUBSTR(D.BIRTH_DAY,1,4)+1)     AS AGE,             /*나이           */
            REPLACE(SUBSTR( D.ADDR1 ,1,REGEXP_INSTR(D.ADDR1,'\ ')),' ','') AS ADDR_AREA,/*지역           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,       /*계절구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S078', F.MF_CD)       AS MF_NM,           /*구매전 제조사  */
            A.CHAN_CD                                               AS CHAN_CD,         /*채널구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM,         /*채널구분       */
            D.MOB_NO                                                AS MOB_NO,          /*핸드폰번호     */
            D.TEL_NO                                                AS TEL_NO,          /*전화번호       */
            C.CANC_DAY                                              AS CANC_DAY,        /*중도완납일     */
            C.OS_DAY                                                AS OS_DAY           /*소유권이전일   */
    FROM    RTSD0104 A,
            RTSD0108 C,
            RTSD0100 D,
            RTSD0113 E,
            RTCS0120 F
    WHERE   A.CUST_NO   = v_Cust_No
    AND     A.ORD_NO    = C.ORD_NO
    AND     A.CUST_NO   = D.CUST_NO
    AND     A.ORD_AGENT = E.ORD_AGENT(+)
    AND     A.ORD_NO    = F.ORD_NO (+);

  END p_sRtsd0104CustAnalysis03New;


  /*****************************************************************************
  -- 멤버십 정보 관리(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
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
    ) IS

    e_Error EXCEPTION;
    v_Sales_GroupB   RTSD0104.SALES_GROUP%TYPE;    /*지사                  */
    v_Sales_OfficeB  RTSD0104.SALES_OFFICE%TYPE;   /*지점                  */
    
    v_Snd_Msg        RTSD0205.SND_MSG%TYPE DEFAULT NULL;               /*SMS메시지 [20170405_02] */
    v_StatCd         VARCHAR2(10);      --상태코드
    v_Cust_Nm        VARCHAR2(100);     --고객명
    v_Period_Nm      VARCHAR2(10);      --계약기간
    v_Summon_Amt     NUMBER;            --월렌탈료
    v_Customer_Mobno VARCHAR2(20);      --받는사람핸드폰번호    

  BEGIN

    IF 0 = f_sRtsd0104Count(v_Ord_No) THEN



        --IF v_Ord_No IS NULL OR TRIM(v_Ord_No) = '' THEN
            v_Ord_No := f_sRtsd0104Ordno(v_Chan_Cd);
        --END IF;

        IF 0 != f_InsertRtsd0104(v_Ord_No, v_Ord_Day, v_Ord_Id, v_Chan_Cd,
                                 v_Sale_Id, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd,
                                 v_Camp_Yn, v_c_Dcrate, v_c_Dcamt, v_Cust_No,
                                 v_Cust_Tp, v_Safekey, v_Grp_Yn, v_Grp_No,
                                 v_g_Dcrate, v_G_Dcamt, v_L_Dcrate, v_L_Dcamt,
                                 v_F_Dcrate, v_F_Dcamt, v_Bord_No, v_Stat_Cd,
                                 v_Proc_Day, v_CANC_DAY, v_Agency_Cd, v_Sales_GroupB,
                                 v_Sales_OfficeB, v_Eng_Nm, v_Ag_Desc, v_Maker_Cd,
                                 v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Car_No,
                                 v_Car_Owner, v_c_Mileage, v_Req_Text, v_Pay_Mthd,
                                 v_Pay_Dd, v_Acc_Seq, v_CRD_SEQ, v_Acc_Chk,
                                 v_Acc_Stat, v_Bkey_Chk, v_Batch_Key, v_Bill_Yn,
                                 v_Crdt_Stat, v_Cert_Cd, v_Cert_Stat, v_Ord_Agent,
                                 v_Org_Cd, v_Org_Hq, v_Org_L1, v_Org_L2,
                                 v_Org_L3, v_Org_L4, v_Ins_Org, v_Ps_Cd,
                                 v_Cmsag_Yn, v_Con_Mthd, v_Pcert_Yn, v_Fc_Day,
                                 v_Ag_Day, v_Ag_Seq, v_Input_Dt, v_File_Path, v_File_Name,
                                 v_Tcgrp_No, v_Vbeln, v_Season_Cd, v_Regi_Amt, v_Sum_Mon_Amt,
                                 v_Mon_Amt, v_Sale_Cd, v_Pay_Gb, v_Reg_Id, 
                                 v_Inst_Cd, v_Inst_Tm, v_Inst1_Poscd, v_Inst1_Addr1, v_Inst1_Addr2,
                                 v_Inst2_Poscd, v_Inst2_Addr1, v_Inst2_Addr2, v_Tms_OrderId, NULL,
                                 v_Out_Stock_Yn, v_Out_Stock_Type, v_Errortext) THEN
            v_Return_Message := '계약 등록 실패!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;

        END IF;



    ELSE

        IF v_Comm_Dvsn = 'U' THEN

            IF (TRIM(v_Chan_Cd) = '01') OR (TRIM(v_Chan_Cd) = '05') THEN
                IF Pkg_Rtcm0051.f_sRtcm0051Cd('S068') <= f_sRtsd0104SetCarCountUp(v_Cust_No, v_Ord_No, v_Car_No) THEN
                    v_Return_Message := '수정 가능한 총 차량수 ('||Pkg_Rtcm0051.f_sRtcm0051Cd('S068') ||')를 초과하였습니다.';
                    RAISE e_Error;
                END IF;


            END IF;



            IF 0 != f_Updatertsd0104(v_Ord_No, v_Ord_Day, v_Ord_Id, v_Chan_Cd,
                                     v_Sale_Id, v_Period_Cd, v_Cnt_Cd, v_Regi_Cd,
                                     v_Camp_Yn, v_c_Dcrate, v_c_Dcamt, v_Cust_No,
                                     v_Cust_Tp, v_Safekey, v_Grp_Yn, v_Grp_No,
                                     v_g_Dcrate, v_G_Dcamt, v_L_Dcrate, v_L_Dcamt,
                                     v_F_Dcrate, v_F_Dcamt, v_Bord_No, v_Stat_Cd,
                                     v_Proc_Day, v_CANC_DAY, v_Agency_Cd, v_Sales_GroupB,
                                     v_Sales_OfficeB, v_Eng_Nm, v_Ag_Desc, v_Maker_Cd,
                                     v_Model_Cd, v_Contents_Cd, v_Fr_Cd, v_Car_No,
                                     v_Car_Owner, v_c_Mileage, v_Req_Text, v_Pay_Mthd,
                                     v_Pay_Dd, v_Acc_Seq, v_Crd_Seq, v_Acc_Chk,
                                     v_Acc_Stat, v_Bkey_Chk, v_Batch_Key, v_Bill_Yn,
                                     v_Crdt_Stat, v_Cert_Cd, v_Cert_Stat, v_Ord_Agent,
                                     v_Org_Cd, v_Org_Hq, v_Org_L1, v_Org_L2,
                                     v_Org_L3, v_Org_L4, v_Ins_Org, v_Ps_Cd,
                                     v_Cmsag_Yn, v_Con_Mthd, v_Pcert_Yn, v_Fc_Day,
                                     v_Ag_Day, v_Ag_Seq, v_Input_Dt, v_File_Path, v_File_Name,
                                     v_Tcgrp_No, v_Vbeln, v_Season_Cd, v_Regi_Amt, v_Sum_Mon_Amt,
                                     v_Mon_Amt, v_Sale_Cd, v_Pay_Gb, v_Reg_Id,
                                     v_Inst_Cd, v_Inst_Tm, v_Inst1_Poscd, v_Inst1_Addr1, v_Inst1_Addr2,
                                     v_Inst2_Poscd, v_Inst2_Addr1, v_Inst2_Addr2, v_Errortext) THEN
                v_Return_Message := '계약 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_Deletertsd0104(v_Ord_No, v_Stat_Cd, v_Reg_Id, v_Errortext) THEN
               v_Return_Message := '삭제 실패!!!'||'-'||v_Errortext;
               v_Errortext := v_Errortext;
               RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    -- 변경 이력 생성
    IF 0 != Pkg_Rtsd0105.f_InsertRtsd0105(v_Ord_No, v_Errortext) THEN
        v_Return_Message := '이력 등록 실패!!!'||'-'||v_Errortext;
        v_Errortext := v_Errortext;
        RAISE e_Error;
    END IF;
    
    Pkg_Rtsd0109.p_InsertRtsd0109MemberSchReal(v_Ord_No, v_Reg_Id, v_Success_Code, v_Return_Message, v_Errortext);
    IF 0 != v_Success_Code THEN
       v_Return_Message := '멤버십 청구 스케쥴 생성 실패!!!'||'-'||v_Return_Message;
       v_Errortext := v_Errortext;
       RAISE e_Error;
    END IF;


    IF v_Ord_No IS NOT NULL THEN
    
        SELECT A.STAT_CD 
        INTO   v_StatCd
        FROM RTSD0104 A 
        WHERE A.ORD_NO = v_Ord_No;
        
        IF v_StatCd = '04' THEN
            
            BEGIN
                SELECT
                  (SELECT A.CUST_NM FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS CUST_NM
                  ,Pkg_Rtcm0051.f_sRtcm0051CodeName('S021', T.PERIOD_CD) AS PERIOD_NM 
                  ,T.SUM_MON_AMT
                  ,(SELECT A.MOB_NO FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS MOB_NO
                INTO v_Cust_Nm          --고객명
                     ,v_Period_Nm       --계약기간
                     ,v_Summon_Amt      --월렌탈료
                     ,v_Customer_Mobno  --받는사람핸드폰번호  
                FROM RTSD0104 T
                WHERE T.ORD_NO = v_Ord_No;
                
                
                v_Snd_Msg := '';
                v_Snd_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님 타이어 렌탈 서비스를 이용해 주셔서 감사합니다.';
                v_Snd_Msg := v_Snd_Msg||'(렌탈 계약정보) 계약자명 : '||v_Cust_Nm||', 계약기간 : '||v_Period_Nm||', 월 렌탈료 : '||v_Summon_Amt;
                
                --주문접수완료 SMS 발송
                Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
                      'I'                                   /*예약 전송여부    */
                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
                    , v_Customer_Mobno                      /*받는 전화번호    */
                    , '18550100'                            /*보내는 전화번호  */
                    , v_Snd_Msg                             /*메시지내용       */
                    , ''                                    /*사용자지정 필드1 */
                    , v_Ord_No                              /*사용자지정 필드2 */
                    ,'2'
                    ,'RENTAL00000000000079'
                    , v_Reg_Id                              /*등록자 ID        */
                    , v_Success_Code
                    , v_Return_Message
                    , v_ErrorText
                );
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN 
                NULL; 
            END;
            
        END IF;
    END IF;



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
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_IUDRtsd0104(1)', v_Errortext, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.P_Errorfilewrite('Pkg_Rtsd0104.p_IUDRtsd0104(2)', v_Errortext, v_Return_Message);

  END p_IUDRtsd0104MemberOrder;

  /*****************************************************************************
  -- 등록급 및 일시불 납부
  *****************************************************************************/
 PROCEDURE p_regiAmtPay (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Grp_No         RTSD0104.GRP_NO%TYPE; 
    v_befor_lim_cnt  NUMBER DEFAULT 0;      /*장착전 타이어 본수 */
    v_after_lim_cnt  NUMBER DEFAULT 0;      /*장착ㅎ 타이어 본수 */

--    v_Sms_Msg       RTSD0205.SND_MSG%TYPE := '';
--    
--    v_StatCd        VARCHAR2(10);    --상태코드
--    v_Cust_Nm       VARCHAR2(100);   --고객명
--    v_Mat_Nm        VARCHAR2(100);  --계약상품
--    v_Ord_Qty       VARCHAR2(100);  --계약수량
--    v_Period_Nm     VARCHAR2(10);  --계약기간
--    v_Regi_Nm       VARCHAR2(50);  --최초등록비
--    v_Summon_Amt    NUMBER;  --월렌탈료
--    v_Agency_Nm     VARCHAR2(100);  --장착점상호명
--    v_Agency_Addr   VARCHAR2(500);  --장착점주소
--    v_Agency_TelNo  VARCHAR2(20);  --장착점전화번호
--    v_Prc_Day       VARCHAR2(20);  --장착예정일
--    v_Customer_Mobno  VARCHAR2(20);--받는사람핸드폰번호


   BEGIN
   
   SELECT  GRP_NO
     INTO  v_Grp_No
     FROM  RTSD0104
    WHERE  ORD_NO = v_Ord_No;
    
   v_befor_lim_cnt := f_sRtsd0104GrpYnCnt(v_Grp_No) ; 

   UPDATE RTSD0104
      SET STAT_CD  = '01',
          CHG_ID   = v_Reg_Id,
          CHG_DT   = SYSDATE
    WHERE ORD_NO   = v_Ord_No;

   UPDATE RTSD0106
      SET STAT_CD  = '01',
          CHG_ID   = v_Reg_Id,
          CHG_DT   = SYSDATE
    WHERE ORD_NO   = v_Ord_No;
   
    v_after_lim_cnt := f_sRtsd0104GrpYnCnt(v_Grp_No) ; 
   
    IF 0 != f_sRtsd0104GrpYnD(v_Ord_No) THEN
        
        /*단체 최소본수 미만일 경우*/
        IF 0 > v_befor_lim_cnt THEN 
    
            --IF 0 != PKG_RTSD0105.f_sRtsd0047CancelGroup(v_Ord_No, '', v_Reg_Id, 'Z', v_Errortext) THEN
            IF 0 != f_sRtsd0104SaleIns(v_Ord_No, v_Reg_Id, 'B', v_Errortext) THEN
                v_Return_Message := '계약별 할인(47) 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            --IF 0 != PKG_RTSD0105.f_sRtsd0040CancelGroup(v_Ord_No, '', v_Reg_Id, 'Z',  v_Errortext) THEN
            IF 0 != f_sRtsd0104SaleTempIns(v_Ord_No, v_Reg_Id, 'B', v_Errortext) THEN
                v_Return_Message := '계약별 할인(40) 이력 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            /*최소본수 0 또는 이상일 경우*/
            IF -1 < v_after_lim_cnt THEN
                PKG_RTSD0031.p_sRTSD0031AddGroup(v_Grp_No, v_Reg_Id, v_Success_Code, v_Return_Message, v_Errortext);
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
            END IF;
                    
        /*최소본수 이상일 경우*/    
        ELSE
        
            IF 0 != f_sRtsd0104SaleIns(v_Ord_No, v_Reg_Id, 'B', v_Errortext) THEN
                v_Return_Message := '계약별 할인(47) 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            IF 0 != f_sRtsd0104SaleTempIns(v_Ord_No, v_Reg_Id, 'B', v_Errortext) THEN
                v_Return_Message := '계약별 할인(40) 이력 등록 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
            
            /*최초 최소본수를 초과할 경우 단체그룹 전체 할인율 업그레이드*/
            IF 0 > v_befor_lim_cnt THEN
                PKG_RTSD0031.p_sRTSD0031AddGroup(v_Grp_No, v_Reg_Id, v_Success_Code, v_Return_Message, v_Errortext);
                IF 0 != v_Success_Code THEN
                    v_Return_Message := '청구 스케쥴 위약금 여부 실패!!!'||'-'||v_Return_Message;
                    v_Errortext := v_Errortext;
                    RAISE e_Error;
                END IF;
            END IF;
            
            
        END IF;
        
    ELSE
        IF 0 != f_sRtsd0104SaleIns(v_Ord_No, v_Reg_Id, 'G', v_Errortext) THEN
            v_Return_Message := '계약별 할인(47) 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
        IF 0 != f_sRtsd0104SaleTempIns(v_Ord_No, v_Reg_Id, 'G', v_Errortext) THEN
            v_Return_Message := '계약별 할인(40) 이력 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
    
    END IF;

--    IF v_Ord_No IS NOT NULL THEN
--    
--        SELECT A.STAT_CD 
--        INTO   v_StatCd
--        FROM RTSD0104 A 
--        WHERE A.ORD_NO = v_Ord_No;
--        
--        IF v_StatCd = '01' THEN
--            
--            BEGIN
--                SELECT
--                  (SELECT A.CUST_NM FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS CUST_NM
--                  ,(SELECT LISTAGG(B.MAT_NM,',') WITHIN GROUP(ORDER BY B.MAT_NM) FROM RTSD0106 A, RTSD0005 B WHERE A.ORD_NO = T.ORD_NO AND A.MAT_CD = B.MAT_CD) AS MAT_NM
--                  ,(SELECT SUM(A.ORD_QTY) FROM RTSD0106 A WHERE A.ORD_NO = T.ORD_NO) AS ORD_QRY
--                  ,T.PERIOD_CD
--                  ,T.REGI_AMT
--                  ,T.SUM_MON_AMT
--                  ,(SELECT A.AGENCY_NM  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_NM
--                  ,(SELECT A.CITY||' '||A.STREET  FROM RTSD0007 A WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_ADDR
--                  ,(SELECT REGEXP_REPLACE(REGEXP_REPLACE (A.TEL_NO, '[^[:digit:]]'), '(^02|050[[:digit:]]{1}|[[:digit:]]{3})([[:digit:]]{3,4})([[:digit:]]{4})', '\1-\2-\3')  
--                    FROM RTSD0007 A 
--                    WHERE A.AGENCY_CD = T.AGENCY_CD) AS AGENCY_TEL_NO
--                  ,TO_CHAR(TO_DATE(T.PROC_DAY,'YYYYMMDD'),'YYYY.MM.DD') AS PROC_DAY
--                  ,(SELECT A.MOB_NO FROM RTSD0100 A WHERE A.CUST_NO = T.CUST_NO) AS MOB_NO
--                INTO v_Cust_Nm          --고객명
--                     ,v_Mat_Nm          --계약상품
--                     ,v_Ord_Qty         --계약수량
--                     ,v_Period_Nm       --계약기간
--                     ,v_Regi_Nm         --최초등록비
--                     ,v_Summon_Amt      --월렌탈료
--                     ,v_Agency_Nm       --장착점상호명
--                     ,v_Agency_Addr     --장착점주소
--                     ,v_Agency_TelNo    --장착점전화번호
--                     ,v_Prc_Day        --장착예정일
--                     ,v_Customer_Mobno  --받는사람핸드폰번호
--                FROM RTSD0104 T
--                WHERE T.ORD_NO = v_Ord_No;
--                
--                v_Sms_Msg := '[넥센타이어] '||v_Cust_Nm||' 고객님 타이어 렌탈 서비스를 이용해 주셔서 감사합니다.';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'(렌탈 계약정보) 계약자명 : '||v_Cust_Nm||', 계약 상품 : '||v_Mat_Nm||', 계약 수량 : '||v_Ord_Qty||'개, 계약기간 : '||v_Period_Nm||'개월, 최초 등록비 : '||v_Regi_Nm||'원(1회), 월 렌탈료 : '||v_Summon_Amt||'원';
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'(장착점 안내) 상호명 : '||v_Agency_Nm||', 주소 : '||v_Agency_Addr||', 전화번호 : '||v_Agency_TelNo||', 장착 예정일 : '||v_Prc_Day;
--                v_Sms_Msg := v_Sms_Msg||CHR(13)||CHR(10); 
--                v_Sms_Msg := v_Sms_Msg||'※장착점 내방시 계약자 신분증, 장착 차량의 차량등록증을 반드시 지참해주세요.';
--                
--                --주문접수완료 SMS 발송
--                Pkg_Rtsd0205.p_Rtsd0205InterfaceNew (
--                      'I'                                   /*예약 전송여부    */
--                    , TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS')   /*예약 전송시간    */
--                    , v_Customer_Mobno                      /*받는 전화번호    */
--                    , '18550100'                            /*보내는 전화번호  */
--                    , v_Sms_Msg                             /*메시지내용       */
--                    , 'S003'                                /*사용자지정 필드1 */
--                    , v_Ord_No                              /*사용자지정 필드2 */
--                    ,'2'
--                    ,'RENTAL00000000000003'
--                    , v_Reg_Id                              /*등록자 ID        */
--                    , v_Success_Code
--                    , v_Return_Message
--                    , v_ErrorText
--                );
--            EXCEPTION 
--                WHEN NO_DATA_FOUND THEN 
--                Null; 
--            END;
--            
--        END IF;
--    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 저장되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0104.p_regiAmtPay(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0104.p_regiAmtPay(2)', v_ErrorText, v_Return_Message);
  END p_regiAmtPay;

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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR

    SELECT  /*+ INDEX_DESC ( B RTSD0104_PK) */  
            B.ORD_DAY,                                                            /*계약일자      */
            B.ORD_NO,                                                             /*계약번호      */
            B.CUST_NO,                                                            /*고객코드      */
            A.BIRTH_DAY,                                                          /*법정생년월일  */
            A.BUSL_NO,                                                            /*사업자번호    */
            A.CUST_NM,                                                            /*고객명,법인명 */
            A.GENDER_CD,                                                          /*성별코드      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S026', A.GENDER_CD) AS GENDER_NM,   /*성별명        */
            A.LF_CD,                                                              /*내외국인코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S027', A.LF_CD) AS LF_NM,           /*내외국인코드명*/
            A.MOB_NO,                                                             /*핸드폰        */
            A.TEL_NO,                                                             /*전화번호      */
            A.TEL_NO2,                                                            /*전화번호2     */
            '('||A.POS_CD||')'||' '||A.ADDR1||' '||A.ADDR2 AS ADDR,               /*주소          */
            B.CAR_NO,                                                             /*차량번호      */
            B.MAKER_CD,                                                           /*카메이커      */
            B.MODEL_CD,                                                           /*차종          */
            B.CONTENTS_CD,                                                        /*사양          */
            B.FR_CD,                                                              /*전후구분      */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S001', B.MAKER_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S002', B.MODEL_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S003', B.CONTENTS_CD)
            ||' '||Pkg_Rtcm0051.f_sRtcm0051Codename('S004', B.FR_CD) CAR_KIND,    /*차종          */
            B.STAT_CD,                                                            /*계약상태코드  */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', B.STAT_CD) AS STAT_NM,       /*계약상태명    */
            A.CUST_TP,
            NVL(Pkg_Rtre0160.f_Rtsd0105PrePymnt(B.ORD_NO),'N') AS CHECK_CNT,
            B.MON_AMT,                                                             /* 월렌탈료 */
            B.GRP_NO,                                                             /* 단체번호  */
            B.CNT_CD                                                               /* 타이어본수 */
    FROM    RTSD0100 A,
            RTSD0104 B

    WHERE   A.CUST_NO = B.CUST_NO
    AND     B.STAT_CD NOT IN ('00', '06')
    AND     B.ORD_ID NOT IN ('03', '04')
    AND     A.CUST_TP = DECODE( v_custTp , NULL, A.CUST_TP , v_custTp)
    AND     B.CHAN_CD = DECODE( v_chanCd , NULL, B.CHAN_CD , v_chanCd)
    AND     (v_statCd   IS NULL OR B.STAT_CD   =  v_statCd)
    AND     (v_birthday IS NULL OR A.BIRTH_DAY =  v_birthday)
    AND     (v_mobNo    IS NULL OR A.MOB_NO    =  v_mobNo)
    AND     (v_carNo    IS NULL OR B.CAR_NO    =  v_carNo)
    AND     (v_custNm   IS NULL OR A.CUST_NM   =  v_custNm)
    AND     (v_telNo    IS NULL OR A.TEL_NO    =  v_telNo)
    AND     (v_telNo2   IS NULL OR A.TEL_NO2   =  v_telNo2)
    AND     (v_gender   IS NULL OR A.GENDER_CD =  v_gender)
    AND     (v_lf       IS NULL OR A.LF_CD     =  v_lf)
    AND     (v_buslNo   IS NULL OR A.BUSL_NO   =  v_buslNo)
    AND     (v_Ord_No   IS NULL OR B.ORD_NO   =  v_Ord_No)
    AND     (v_Grp_No   IS NULL OR B.GRP_NO   =  v_Grp_No) ;


  END p_sRtsd0104_ordNoListPackage;



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
    ) IS

  BEGIN


    DELETE RTTEMP06;

    INSERT INTO RTTEMP06
    SELECT  --A.ORD_DAY,
            --A.PROC_DAY,
            C.CUST_TP,
            DECODE(C.CUST_TP,'01',TRUNC((TO_CHAR(SYSDATE,'YYYY')-SUBSTR(C.BIRTH_DAY,1,4)+1),-1))                 AGE,       /*연령        */
            C.GENDER_CD                                                                                          GENDER_CD, /*성별        */
            E.SIDO_CD                                                                                            SIDO_CD,   /*대리점지역  */
            A.PERIOD_CD                                                                                          PERIOD_CD, /*계약기간    */
            A.CHAN_CD                                                                                            CHAN_CD,   /*채널        */
            D.PETTERN_CD                                                                                         PETTERN_CD,/*패턴        */
            D.WHEEL_INCHES                                                                                       WHEEL_INCHES,   /*인치        */
            F.MF_CD                                                                                              MF_CD,     /*전 제조사   */
            SUM(DECODE(A.STAT_CD,'06',0,1)) OVER (PARTITION BY A.ORD_NO)                                         ORD_CNT,   /*계약건수    */
            SUM(DECODE(A.STAT_CD,'06',0,TO_NUMBER(B.CNT_CD)))                                                    ORD_CNTM,  /*타이어본수  */
            SUM(DECODE(A.STAT_CD,'04',1,0)) OVER(PARTITION BY A.ORD_NO)                                          PROC_CNT,  /*장착건수    */
            SUM(DECODE(A.STAT_CD,'04',TO_NUMBER(B.CNT_CD), 0))                                                   PROC_CNTM /*장착상품건수*/
    FROM    RTSD0104 A, -- 계약 정보
            RTSD0106 B, -- 계약 상품 정보
            RTSD0100 C, -- 고객 마스터
            RTSD0005 D, -- 상품 마스터
            RTSD0007 E, -- 대리점 정보
            RTCS0120 F  -- 사용자구매전제조사정보
    WHERE   ((v_Dis_Gb = '1' AND A.PROC_DAY BETWEEN v_FDay AND v_EDay) OR -- '1' 장착기준
             (v_Dis_Gb = '2' AND A.ORD_DAY  BETWEEN v_FDay AND v_EDay))   -- '2' 주문기준
    AND     A.ORD_NO    = B.ORD_NO
    AND     A.CUST_NO   = C.CUST_NO
    AND     B.MAT_CD    = D.MAT_CD
    AND     A.AGENCY_CD = E.AGENCY_CD
    AND     A.ORD_NO    = F.ORD_NO (+)
    AND     A.STAT_CD   != '00'
    GROUP   BY --A.ORD_DAY,
            --A.PROC_DAY,
            C.CUST_TP,
            DECODE(C.CUST_TP,'01',TRUNC((TO_CHAR(SYSDATE,'YYYY')-SUBSTR(C.BIRTH_DAY,1,4)+1),-1)),
            C.GENDER_CD,
            E.SIDO_CD,
            A.PERIOD_CD,
            A.CHAN_CD,
            D.PETTERN_CD,
            D.WHEEL_INCHES,
            F.MF_CD,
            A.CNT_CD,
            A.STAT_CD,
            A.ORD_NO
            ;


    -- 01.연령별
    OPEN Ref_Cursor01 FOR
    SELECT  A.GROUP_CD,
            A.GROUP_CD||' 대' AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.AGE  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.CUST_TP = '01'
            GROUP   BY A.AGE
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;

    -- 02.성별
    OPEN Ref_Cursor02 FOR
    SELECT  A.GROUP_CD,
            DECODE(A.GROUP_CD,'1','남','2','여','기타') AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.GENDER_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.CUST_TP = '01'
            GROUP   BY A.GENDER_CD
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;

    -- 03.대리점 지역별
    OPEN Ref_Cursor03 FOR
    SELECT  A.GROUP_CD,
            B.REMARK AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.SIDO_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.SIDO_CD IS NOT NULL
            GROUP   BY A.SIDO_CD
            ) A,
            RTCM0051 B
    WHERE   A.GROUP_CD  = B.CD (+)
    AND     B.CD_GRP_CD (+)= 'S016'
    AND     A.CNT > 0
    ORDER   BY A.CNT DESC;


    -- 04.계약기간별
    OPEN Ref_Cursor04 FOR
    SELECT  A.GROUP_CD,
            A.GROUP_CD||'개월' AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.PERIOD_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.PERIOD_CD IS NOT NULL
            GROUP   BY A.PERIOD_CD
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;



    -- 05.on/off별
    OPEN Ref_Cursor05 FOR
    SELECT  A.GROUP_CD,
            DECODE(A.GROUP_CD,'01','on line','02','off line') AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  DECODE(A.CHAN_CD,'01','02','05','02','01')  GROUP_CD, -- 01:on line,02:off line
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.CHAN_CD IS NOT NULL
            GROUP   BY DECODE(A.CHAN_CD,'01','02','05','02','01')
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;


    -- 06.채널별
    OPEN Ref_Cursor06 FOR
    SELECT  A.GROUP_CD,
            B.CD_NM AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.CHAN_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.CHAN_CD IS NOT NULL
            GROUP   BY A.CHAN_CD
            ) A,
            RTCM0051 B
    WHERE   A.GROUP_CD  = B.CD (+)
    AND     B.CD_GRP_CD (+)= 'S030'
    AND     A.CNT > 0
    ORDER   BY A.CNT DESC;


    -- 07.패턴별
    OPEN Ref_Cursor07 FOR
    SELECT  A.GROUP_CD,
            A.GROUP_CD AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.PETTERN_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.PETTERN_CD IS NOT NULL
            GROUP   BY A.PETTERN_CD
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;

    -- 08.인치별
    OPEN Ref_Cursor08 FOR
    SELECT  A.GROUP_CD,
            A.GROUP_CD||' 인치' AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.WHEEL_INCHES  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.WHEEL_INCHES IS NOT NULL
            GROUP   BY A.WHEEL_INCHES
            ) A
    WHERE   A.CNT > 0
    ORDER   BY A.CNT DESC;

    -- 09. 교체유입 제조사
    OPEN Ref_Cursor09 FOR
    SELECT  A.GROUP_CD,
            B.CD_NM AS GROUP_NM,
            A.CNT,
            TO_CHAR(ROUND(RATIO_TO_REPORT(A.CNT) OVER () * 100, 1),'990.9') RATIO
    FROM    (
            SELECT  A.MF_CD  GROUP_CD,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN SUM(A.PROC_CNT)   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN SUM(A.PROC_CNTM)  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN SUM(A.ORD_CNT)    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN SUM(A.ORD_CNTM)   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    RTTEMP06 A
            WHERE   A.MF_CD IS NOT NULL
            GROUP   BY A.MF_CD
            ) A,
            RTCM0051 B
    WHERE   A.GROUP_CD  = B.CD (+)
    AND     B.CD_GRP_CD (+)= 'S078'
    AND     A.CNT > 0
    ORDER   BY A.CNT DESC;

  END p_sRtsd0104OrderAnalysisNew;


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
    ) IS

  BEGIN


    OPEN Ref_Cursor FOR
    SELECT  A.DT,
            SUM(DECODE(B.WEEK,'월',B.CNT)) MON,
            SUM(DECODE(B.WEEK,'화',B.CNT)) TUE,
            SUM(DECODE(B.WEEK,'수',B.CNT)) WED,
            SUM(DECODE(B.WEEK,'목',B.CNT)) THU,
            SUM(DECODE(B.WEEK,'금',B.CNT)) FRI,
            SUM(DECODE(B.WEEK,'토',B.CNT)) SAT,
            SUM(DECODE(B.WEEK,'일',B.CNT)) SUN
    FROM    (
            SELECT  TO_CHAR(LPAD((ROWNUM * v_Tim_Gb),2,'0'))  DT,
                    TO_CHAR(LPAD((ROWNUM - 1) * v_Tim_Gb,2,'0'))  FDT,
                    TO_CHAR(LPAD((ROWNUM * v_Tim_Gb) - 1,2,'0'))  TDT
            FROM    DUAL
            CONNECT BY LEVEL <= (24 / v_Tim_Gb)
            ) A,
            (
            SELECT  DECODE(v_Dis_Gb, '1', A.PROC_DT,   A.ORD_DT  ) HH24,
                    DECODE(v_Dis_Gb, '1', A.PROC_WEEK, A.ORD_WEEK) WEEK,
                    CASE
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '1' THEN A.PROC_CNT   --'1' 장착기준'1' 계약건수 PROC_CNT
                       WHEN v_Dis_Gb = '1' AND v_Val_Gb = '2' THEN A.PROC_CNTM  --            '2' 상품건수 PROC_CNTM
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '1' THEN A.ORD_CNT    --'2' 주문기준'1' 계약건수 ORD_CNT
                       WHEN v_Dis_Gb = '2' AND v_Val_Gb = '2' THEN A.ORD_CNTM   --            '2' 상품건수 ORD_CNTM
                    END AS CNT
            FROM    (
                    SELECT  TO_CHAR(A.REG_DT,'HH24') ORD_DT,
                            TO_CHAR(A.REG_DT,'DY')   ORD_WEEK,
                            TO_CHAR(C.REG_DT,'HH24') PROC_DT,
                            TO_CHAR(C.REG_DT,'DY')   PROC_WEEK,
                            SUM(DECODE(A.STAT_CD,'06',0,1)) OVER( PARTITION BY A.ORD_NO) ORD_CNT,   /*계약건수    */
                            SUM(DECODE(A.STAT_CD,'06',0,TO_NUMBER(B.CNT_CD)))  ORD_CNTM,  /*타이어본수  */
                            SUM(DECODE(A.STAT_CD,'04',1,0)) OVER( PARTITION BY A.ORD_NO) PROC_CNT,  /*장착건수    */
                            SUM(DECODE(A.STAT_CD,'04',TO_NUMBER(B.CNT_CD),0))  PROC_CNTM  /*장착상품건수*/
                    FROM    RTSD0104 A, -- 계약 정보
                            RTSD0106 B, -- 계약 상품 정보
                            RTSD0108 C  -- 장착 정보
                    WHERE   ((v_Dis_Gb = '1' AND A.PROC_DAY BETWEEN v_FDay AND v_EDay) OR -- '1' 장착기준
                             (v_Dis_Gb = '2' AND A.ORD_DAY  BETWEEN v_FDay AND v_EDay))   -- '2' 주문기준
                    AND     A.CHAN_CD  IN (SELECT  REGEXP_SUBSTR(v_Chan_Cd,'[^|]+',1,LEVEL)
                                           FROM    DUAL
                                           CONNECT BY LEVEL <= REGEXP_COUNT(v_Chan_Cd, '[^|]+')
                                           )
                    AND     A.ORD_NO   = B.ORD_NO
                    AND     A.ORD_NO   = C.ORD_NO(+)
                    AND     A.STAT_CD != '00'
                    GROUP   BY
                            A.STAT_CD,
                            A.ORD_NO,
                            TO_CHAR(C.REG_DT,'HH24'),
                            TO_CHAR(A.REG_DT,'DY'),
                            TO_CHAR(A.REG_DT,'HH24'),
                            TO_CHAR(C.REG_DT,'DY')
                    ) A
            ) B
    WHERE   B.HH24(+) BETWEEN A.FDT AND A.TDT
    GROUP   BY A.DT
    ORDER   BY A.DT;

  END p_sRtsd0104OrdMonthAnalysisNew;



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
  ) IS

  BEGIN

    IF 0 != Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_NO                                                AS ORD_NO    ,   /*계약번호*/
                A.CUST_NO                                               AS CUST_NO   ,   /*고객번호*/
                PKG_RTSD0100.F_SRTSD0100CUSTNAME(A.CUST_NO)             AS CUST_NM   ,   /*고객명*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID)      AS ORD_NM    ,   /*주문구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM   ,   /*채널구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID)     AS SALE_NM   ,   /*계약유형*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM   ,   /*계약상태*/
                A.ORD_DAY                                               AS ORD_DAY   ,   /*접수일자*/
                B.SALE_CD                                                            ,   /*판매코드*/
                A.MODEL_CD                                                           ,   /*카모델CD*/
                A.PROC_DAY                                              AS PROC_DAY  ,   /*장착일자*/
                A.CANC_DAY                                              AS CANC_DAY  ,   /*취소일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)   AS PERIOD_NM ,   /*총렌탈기간*/
                'N'                                                     AS OS_YN     ,   /*소유권이전여부*/
--                CASE WHEN G.COL_01 IS NULL THEN Pkg_Rtsd0108.f_sRtsd0108Mfp_Yn(A.ORD_NO)
--                     ELSE 'D' END                                       AS MFP_YN    ,   /*중도완납여부*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM     ,   /*프리미엄서비스*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD)    AS MAKER_NM  ,   /*카메이커*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD)       AS MC_NM     ,   /*차종*/
                A.CAR_NO                                                AS CAR_NO    ,   /*차량번호*/
                A.CAR_OWNER                                             AS CAR_OWNER ,   /*차량소유자*/
                A.C_MILEAGE                                             AS C_MILEAGE ,   /*현재주행거리*/
                '0'                                                     AS MA_MILEAGE,   /*월 평균주행거리*/
                A.REQ_TEXT                                              AS REQ_TEXT,     /*비고(기타정보)*/
                C.BIRTH_DAY,
                C.MOB_NO,
                C.TEL_NO,
                B.MON_AMT,
                B.AGENCY_CD,
                Pkg_Rtsd0007.f_sRtsd0007Agencynm(B.AGENCY_CD)           AS AGENCY_NM    ,   /*장착대리점     */
                C.GENDER_CD,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S026', C.GENDER_CD)     AS    GENDER_CD_NM,      /*성별 */
                C.ADDR1,
                C.ADDR2,
                C.TEL_NO2,
                C.BUSL_NO,
                C.POS_CD,
                C.POS_CD2,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S039', C.MOB_FIRM)     AS    MOB_FIRM,        /*통신사 */
                A.CUST_TP,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP)      AS CUST_TP_NM    ,   /*고객유형*/
                D.VBELN,
                A.CHAN_CD,
                A.STAT_CD,
                A.SEASON_CD,                                                             /*계절구분코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,    /*계절구분      */
                A.MAKER_CD,                                                              /*카메이커      */
                A.MODEL_CD,                                                              /*차종          */
                A.CONTENTS_CD,                                                           /*사양          */
                A.FR_CD,                                                                 /*전후 구분     */
                E.PROVSN_NO,                                                             /*가계약번호    */
                Pkg_Rtre0160.f_Rtsd0105PrePymnt(A.ORD_NO)               AS PRPT_YN,      /*선납여부  */
                Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO)               AS ORDER_ST,     /*계약유형  */
                CASE 
                    WHEN Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO) = '01' THEN '단체'
                    WHEN Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO) = '02' THEN '패키지'
                    WHEN Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO) = '03' THEN '일시불'
                    WHEN Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO) = '04' THEN '멤버쉽'
                    ELSE '일반'
                END AS ORDER_ST_NM,                                                      /*계약유형 명*/
                CASE
                    WHEN A.END_TP IN ('C') OR A.CNT_CD IN ('01') THEN
                        NULL
                    WHEN A.END_TP IN ('E') THEN
                        A.CANC_DAY
                    ELSE
                        TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(A.PROC_DAY, 'YYYYMMDD'), A.PERIOD_CD)), -3), 'YYYYMMDD')
                END AS RERENT_DAY_F,                                                     /*재렌탈가능일(from) */
                CASE
                    WHEN A.END_TP IN ('C') OR A.CNT_CD IN ('01') THEN
                        NULL
                    ELSE
                        TO_CHAR(ADD_MONTHS(TO_DATE(A.PROC_DAY, 'YYYYMMDD'), 60)-1, 'YYYYMMDD')
                END AS RERENT_DAY_T,                                                      /*재렌탈가능일(to)   */
                F.SALE_NM AS SALE_CD_NM,
                CASE
                    WHEN NVL(F.DC_RATE, '0') != '0'  THEN TO_CHAR(F.DC_RATE) || '%'
                    ELSE TO_CHAR(F.DC_AMT)
                END SALE_CD_DC,
                B.SUM_MON_AMT,
                B.PAY_DD,
                (CASE WHEN A.MFP_YN = 'Y' THEN
                                CASE WHEN A.END_TP = 'E' THEN '중도완납' 
                                     ELSE CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = A.ORD_NO) > 0 THEN '채권매각' ELSE '중도해지' END 
                                END
                             ELSE ''                                    
                             END) AS MFP_YN,
                A.BOND_SEL_DAY
        FROM    RTSD0108 A INNER JOIN RTSD0104 B ON A.ORD_NO = B.ORD_NO
                           INNER JOIN RTSD0100 C ON A.CUST_NO = C.CUST_NO
                           LEFT OUTER JOIN RTSD0115 D ON A.ORD_NO = D.ORD_NO AND D.TRANS_TP = 'N'
                           LEFT OUTER JOIN RTSD0121 E ON A.ORD_NO = E.ORD_NO
                           LEFT OUTER JOIN RTSD0020 F ON B.SALE_CD = F.SALE_CD
                           LEFT OUTER JOIN RTTEMPIWJ_190429_01 G ON A.ORD_NO = G.COL_01
        WHERE   A.CUST_NO = v_Cust_No;

    ELSE

        OPEN Ref_Cursor FOR
        SELECT  A.ORD_NO                                                AS ORD_NO   ,    /*계약번호*/
                A.CUST_NO                                               AS CUST_NO   ,   /*고객번호*/
                PKG_RTSD0100.F_SRTSD0100CUSTNAME(A.CUST_NO)             AS CUST_NM   ,   /*고객명*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID)      AS ORD_NM    ,   /*주문구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM   ,   /*채널구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID)     AS SALE_NM   ,   /*계약유형*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM   ,   /*계약상태*/
                A.ORD_DAY                                               AS ORD_DAY   ,   /*접수일자*/
                A.SALE_CD                                                            ,   /*판매코드*/
                A.MODEL_CD                                                           ,   /*카모델CD*/
                A.PROC_DAY                                              AS PROC_DAY  ,   /*장착일자*/
                A.CANC_DAY                                              AS CANC_DAY  ,   /*취소일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)   AS PERIOD_NM ,   /*총렌탈기간*/
                'N'                                                     AS OS_YN     ,   /*소유권이전여부*/
--                CASE WHEN G.COL_01 IS NULL THEN Pkg_Rtsd0108.f_sRtsd0108Mfp_Yn(A.ORD_NO)
--                     ELSE 'D' END                                       AS MFP_YN    ,   /*중도완납여부*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM     ,   /*프리미엄서비스*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD)    AS MAKER_NM  ,   /*카메이커*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD)       AS MC_NM     ,   /*차종*/
                A.CAR_NO                                                AS CAR_NO    ,   /*차량번호*/
                A.CAR_OWNER                                             AS CAR_OWNER ,   /*차량소유자*/
                A.C_MILEAGE                                             AS C_MILEAGE ,   /*현재주행거리*/
                '0'                                                     AS MA_MILEAGE,   /*월 평균주행거리*/
                A.REQ_TEXT                                              AS REQ_TEXT,     /*비고(기타정보)*/
                C.BIRTH_DAY,
                C.MOB_NO,
                C.TEL_NO,
                A.MON_AMT,
                A.AGENCY_CD,
                Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)           AS AGENCY_NM    ,   /*장착대리점     */
                C.GENDER_CD,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S026', C.GENDER_CD)     AS    GENDER_CD_NM,      /*성별 */
                C.ADDR1,
                C.ADDR2,
                C.TEL_NO2,
                C.BUSL_NO,
                C.POS_CD,
                C.POS_CD2,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S039', C.MOB_FIRM)     AS    MOB_FIRM,
                A.CUST_TP,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP)      AS CUST_TP_NM    ,   /*고객유형*/
                D.VBELN,
                A.CHAN_CD,
                A.STAT_CD,
                A.SEASON_CD,                                                             /*계절구분코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,    /*계절구분      */
                A.MAKER_CD,                                                              /*카메이커      */
                A.MODEL_CD,                                                              /*차종          */
                A.CONTENTS_CD,                                                           /*사양          */
                A.FR_CD,                                                                 /*전후 구분     */
                E.PROVSN_NO,                                                             /*가계약번호    */
                NULL                                                    AS RERENT_DAY_F, /*재렌탈가능일(from) */
                NULL                                                    AS RERENT_DAY_T,  /*재렌탈가능일(to)   */
                Pkg_Rtre0160.f_Rtsd0105PrePymnt(A.ORD_NO)               AS PRPT_YN,      /*선납여부  */    
                Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO)               AS ORDER_ST,     /*계약유형  */   
                CASE 
                    WHEN Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO) = '01' THEN '단체'
                    WHEN Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO) = '02' THEN '패키지'
                    WHEN Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO) = '03' THEN '일시불'
                    WHEN Pkg_Rtsd0104.f_sRtsd0104OrderSt(A.ORD_NO) = '04' THEN '멤버쉽'
                    ELSE '일반'
                END AS ORDER_ST_NM,                                                      /*계약유형 명*/                         
                F.SALE_NM AS SALE_CD_NM,
                CASE
                    WHEN NVL(F.DC_RATE, '0') != '0'  THEN TO_CHAR(F.DC_RATE) || '%'
                    ELSE TO_CHAR(F.DC_AMT)
                END SALE_CD_DC,
                A.SUM_MON_AMT,
                A.PAY_DD,
                CASE WHEN G.MFP_YN = 'Y' THEN
                                CASE WHEN G.END_TP = 'E' THEN '중도완납' 
                                     ELSE CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = G.ORD_NO) > 0 THEN '채권매각' ELSE '중도해지' END 
                                END
                             ELSE ''                                    
                             END AS MFP_YN,
                G.BOND_SEL_DAY
        FROM    RTSD0104 A INNER JOIN RTSD0100 C ON A.CUST_NO = C.CUST_NO
                           LEFT OUTER JOIN RTSD0115 D ON A.ORD_NO = D.ORD_NO AND D.TRANS_TP = 'N'
                           LEFT OUTER JOIN RTSD0121 E ON A.ORD_NO = E.ORD_NO
                           LEFT OUTER JOIN RTSD0020 F ON A.SALE_CD = F.SALE_CD
                           LEFT OUTER JOIN RTTEMPIWJ_190429_01 G ON A.ORD_NO = G.COL_01
                           LEFT OUTER JOIN RTSD0108 G ON A.ORD_NO = G.ORD_NO
        WHERE   A.CUST_NO = v_Cust_No;

    END IF;

  END p_sRtsdAdviceStatusNew;


 /*****************************************************************************
  -- 상담통합관리 계약 현황 조회 - 설치정보
  *****************************************************************************/
  PROCEDURE p_sRtsdStatus_Adviceinstall (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE                        /*주문번호*/
    ) IS

  BEGIN

    IF 0 != Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) THEN

        OPEN Ref_Cursor FOR
        SELECT  Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)            AS AGENCY_NM    ,    /*장착대리점*/
                A.PROC_DAY                                               AS PROC_DAY     ,    /*장착일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S019', A.SALES_OFFICE) AS SALES_OFFICE ,    /*지점*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S018', A.SALES_GROUP)  AS SALES_GROUP  ,    /*지사*/
                A.ENG_NM                                                 AS ENG_NM       ,    /*장착기사*/
                C.EQU_NO                                                 AS EQU_NO       ,    /*설비번호*/
                B.INST_YN                                                AS INST_YN      ,    /*장착여부*/
                B.PLAN_DAY                                               AS PLAN_DAY     ,    /*장착예정일*/
                B.MAT_DESC                                               AS AG_DESC      ,    /*특이(장착)*/
                C.EQU_NO                                                 AS EQU_NO       ,     /*설비번호*/
                D.POS_CD                                                 AS POS_CD       ,
                D.CITY                                                   AS CITY         ,
                D.STREET                                                 AS STREET         
        FROM    RTSD0108 A,
                RTSD0106 B,
                RTCS0001 C,
                RTSD0007 D
        WHERE   A.ORD_NO = v_Ord_No
        AND     A.ORD_NO = B.ORD_NO
        AND     A.ORD_NO = C.ORD_NO(+)
        AND     A.AGENCY_CD = D.AGENCY_CD;

    ELSE

        OPEN Ref_Cursor FOR
                 SELECT  Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)            AS AGENCY_NM    ,    /*장착대리점*/
                B.PLAN_DAY                                               AS PROC_DAY     ,    /*장착일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S019', A.SALES_OFFICE) AS SALES_OFFICE ,    /*지점*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S018', A.SALES_GROUP)  AS SALES_GROUP  ,    /*지사*/
                A.ENG_NM                                                 AS ENG_NM       ,    /*장착기사*/
                C.EQU_NO                                                 AS EQU_NO       ,    /*설비번호*/
                B.INST_YN                                                AS INST_YN      ,    /*장착여부*/
                B.PLAN_DAY                                               AS PLAN_DAY     ,    /*장착예정일*/
                B.MAT_DESC                                               AS AG_DESC      ,    /*특이(장착)*/
                C.EQU_NO                                                 AS EQU_NO       ,    /*설비번호*/
                D.POS_CD                                                 AS POS_CD       ,
                D.CITY                                                   AS CITY         ,
                D.STREET                                                 AS STREET         
        FROM    RTSD0104 A,
                RTSD0106 B,
                RTCS0001 C,
                RTSD0007 D
        WHERE   A.ORD_NO = v_Ord_No
        AND     A.ORD_NO = B.ORD_NO
        AND     A.ORD_NO = C.ORD_NO(+)
        AND     A.AGENCY_CD = D.AGENCY_CD;

    END IF;

  END p_sRtsdStatus_Adviceinstall;

  /*****************************************************************************
  -- 단체여부 확인 
  *****************************************************************************/
  FUNCTION f_sRtsd0104GrpYnD(
   v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    ) RETURN NUMBER IS
    v_grp_chk              NUMBER DEFAULT 0;
  BEGIN

    SELECT COUNT(1) AS CNT   
      INTO v_grp_chk
      FROM RTSD0104
     WHERE ORD_NO = DECODE(v_Ord_No, NULL, ORD_NO, v_Ord_No)  
       AND GRP_YN = 'Y'
       AND SUBSTR(GRP_NO,1,1) = 'D';
    RETURN v_grp_chk;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;  

  END f_sRtsd0104GrpYnD;
  
  /*****************************************************************************
  -- 단체할인율 적용대상 여부확인 
  *****************************************************************************/
  FUNCTION f_sRtsd0104GrpYnCnt(
    v_Grp_No            IN RTSD0104.GRP_NO%TYPE         /* 단체번호           */
  ) RETURN NUMBER IS
    
    v_lim_cnt           NUMBER DEFAULT 0;
  BEGIN
    
   SELECT (C.SUM_CNT - C.MIN_AGR_CNT) AS LIMT_CNT 
     INTO v_lim_cnt
     FROM (SELECT B.MIN_AGR_CNT,
                 SUM(TO_NUMBER(A.CNT_CD)) OVER() SUM_CNT
            FROM RTSD0104 A, RTSD0031 B
           WHERE A.GRP_NO = B.GRP_NO 
             AND A.GRP_NO = v_Grp_No
             AND A.STAT_CD NOT IN ('00', '06' )) C
    GROUP BY C.MIN_AGR_CNT, C.SUM_CNT;

    RETURN v_lim_cnt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN -1;  

  END f_sRtsd0104GrpYnCnt;
  
  /*****************************************************************************
  -- 단체, 계약시 채널 및 단체 할인 Insert
  *****************************************************************************/
  FUNCTION f_sRtsd0104SaleIns (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_DC_GB              IN CHAR,
    v_ErrorText          OUT VARCHAR2
    ) RETURN NUMBER IS
   
      iSumMonAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
      iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
      iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */
      
  BEGIN
      iSumMonAmt := Pkg_Rtsd0105.f_sRtsd0105SumAmt(v_Ord_No);
      iMonAmt :=  Pkg_Rtsd0105.f_sRtsd0105MonAmt(v_Ord_No);
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
            v_DC_GB,                        /*할인구분*/
            '',               
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
        
  END f_sRtsd0104SaleIns;   

  /*****************************************************************************
  -- 단체, 계약시 채널 및 단체 할인 이력 Insert
  *****************************************************************************/
  FUNCTION f_sRtsd0104SaleTempIns (
    v_Ord_No             IN RTSD0047.ORD_NO%TYPE,
    v_REG_ID             IN RTSD0031.REG_ID%TYPE,
    v_DC_GB              IN CHAR,
    v_ErrorText          OUT VARCHAR2
    ) RETURN NUMBER IS
    
    iSumMonAmt NUMBER DEFAULT 0;  /* 합계월렌탈료 */
    iDcAmt NUMBER DEFAULT 0;      /* 할인금액 */
    iMonAmt NUMBER DEFAULT 0;     /* 월렌탈료 */
  BEGIN
    iSumMonAmt := Pkg_Rtsd0105.f_sRtsd0105SumAmt(v_Ord_No);
    iMonAmt :=  Pkg_Rtsd0105.f_sRtsd0105MonAmt(v_Ord_No);
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
            v_Ord_No,                               /*계약번호*/
            NVL(Pkg_Rtsd0105.f_sRtsd0105Seq2(v_Ord_No),1),
            v_DC_GB,                                /*할인구분*/
            '',   
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
        
  END f_sRtsd0104SaleTempIns;
  
  
  
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
  ) IS

  BEGIN



    OPEN Ref_Cursor FOR
        SELECT  A.ORD_NO                                                AS ORD_NO   ,    /*계약번호*/
                A.CUST_NO                                               AS CUST_NO   ,   /*고객번호*/
                PKG_RTSD0100.F_SRTSD0100CUSTNAME(A.CUST_NO)             AS CUST_NM   ,   /*고객명*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S029', A.ORD_ID)      AS ORD_NM    ,   /*주문구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM   ,   /*채널구분*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S031', A.SALE_ID)     AS SALE_NM   ,   /*계약유형*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM   ,   /*계약상태*/
                A.ORD_DAY                                               AS ORD_DAY   ,   /*접수일자*/
                A.SALE_CD                                                            ,   /*판매코드*/
                A.MODEL_CD                                                           ,   /*카모델CD*/
                A.PROC_DAY                                              AS PROC_DAY  ,   /*장착일자*/
                A.CANC_DAY                                              AS CANC_DAY  ,   /*취소일자*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S021', A.PERIOD_CD)   AS PERIOD_NM ,   /*총렌탈기간*/
                'N'                                                     AS OS_YN     ,   /*소유권이전여부*/
--                'N'                                                     AS MFP_YN    ,   /*중도완납여부*/
                (SELECT CASE WHEN MFP_YN = 'Y' THEN
                                CASE WHEN END_TP = 'E' THEN 'E' 
                                     ELSE CASE WHEN (SELECT COUNT(*) FROM RTTEMPIWJ_190429_01 X WHERE X.COL_01 = Y.ORD_NO) > 0 THEN 'D' ELSE 'C' END 
                                END
                             ELSE 'N'                                    
                             END
                        FROM RTSD0108 Y 
                        WHERE Y.ORD_NO = A.ORD_NO
                        AND ROWNUM = 1) AS MFP_YN,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM     ,   /*프리미엄서비스*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S001', A.MAKER_CD)    AS MAKER_NM  ,   /*카메이커*/
                Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)
                ||' '||
                Pkg_Rtcm0051.f_sRtcm0051Codename('S004', A.FR_CD)       AS MC_NM     ,   /*차종*/
                A.CAR_NO                                                AS CAR_NO    ,   /*차량번호*/
                A.CAR_OWNER                                             AS CAR_OWNER ,   /*차량소유자*/
                A.C_MILEAGE                                             AS C_MILEAGE ,   /*현재주행거리*/
                '0'                                                     AS MA_MILEAGE,   /*월 평균주행거리*/
                A.REQ_TEXT                                              AS REQ_TEXT,     /*비고(기타정보)*/
                C.BIRTH_DAY,
                C.MOB_NO,
                C.TEL_NO,
                A.MON_AMT,
                A.SUM_MON_AMT,  --[20220104_01] kstka 월렌탈료 추가
                Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)           AS AGENCY_NM    ,   /*장착대리점     */
                C.GENDER_CD,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S026', C.GENDER_CD)     AS    GENDER_CD_NM,      /*성별 */
                C.ADDR1,
                C.ADDR2,
                C.TEL_NO2,
                C.BUSL_NO,
                C.POS_CD,
                C.POS_CD2,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S039', C.MOB_FIRM)     AS    MOB_FIRM,
                A.CUST_TP,
                Pkg_Rtcm0051.f_sRtcm0051Codename('S024', A.CUST_TP)      AS CUST_TP_NM    ,   /*고객유형*/
                D.VBELN,
                A.CHAN_CD,
                A.STAT_CD,
                A.SEASON_CD,                                                             /*계절구분코드  */
                Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,    /*계절구분      */
                A.MAKER_CD,                                                              /*카메이커      */
                A.MODEL_CD,                                                              /*차종          */
                A.CONTENTS_CD,                                                           /*사양          */
                A.FR_CD,                                                                 /*전후 구분     */
                E.PROVSN_NO,                                                             /*가계약번호    */
                NULL                                                    AS RERENT_DAY_F, /*재렌탈가능일(from) */
                NULL                                                    AS RERENT_DAY_T,  /*재렌탈가능일(to)   */
                F.SALE_NM AS SALE_CD_NM,
                CASE
                    WHEN NVL(F.DC_RATE, '0') != '0'  THEN TO_CHAR(F.DC_RATE) || '%'
                    ELSE TO_CHAR(F.DC_AMT)

                END SALE_CD_DC,
                G.BOND_SEL_DAY  --[20220104_01] 채권매각일자
        FROM    RTSD0104 A INNER JOIN RTSD0100 C ON A.CUST_NO = C.CUST_NO
                           LEFT OUTER JOIN RTSD0115 D ON A.ORD_NO = D.ORD_NO AND D.TRANS_TP = 'N'
                           LEFT OUTER JOIN RTSD0121 E ON A.ORD_NO = E.ORD_NO
                           LEFT OUTER JOIN RTSD0020 F ON A.SALE_CD = F.SALE_CD
                           LEFT OUTER JOIN RTSD0108 G ON A.ORD_NO = G.ORD_NO
        WHERE   A.ORD_NO    = DECODE(v_Ord_No    , NULL, A.ORD_NO    , v_Ord_No);

  END p_sRtsdAdviceStatusContract;  
  
  /*****************************************************************************
  -- 계약별 계약 상태여부
  -- 00 없음, 01 단체, 02 패키지, 03 일시불, 04 멤버쉽
  *****************************************************************************/
  FUNCTION f_sRtsd0104OrderSt(
    v_Ord_No            IN RTSD0104.ORD_NO%TYPE         /*계약번호            */
  ) RETURN VARCHAR2 IS
  
    v_grp_st         RTSD0104.ORD_ID%TYPE DEFAULT '00'; 
  
  BEGIN  
  
    SELECT 
        CASE 
            WHEN GRP_YN = 'Y' THEN
                CASE 
                    WHEN SUBSTR(GRP_NO,1,1) = 'D' THEN '01'
                    ELSE '02'
                END
            ELSE
                CASE 
                    WHEN ORD_ID = '03' THEN '03'
                    WHEN ORD_ID = '04' THEN '04'
                    ELSE '00'
                END    
        END AS RESULT
        INTO v_grp_st
    FROM RTSD0104
    WHERE ORD_NO = v_Ord_No;
    
    RETURN v_grp_st;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN '00';  

  END f_sRtsd0104OrderSt;

  /*****************************************************************************
  -- 계약 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0104CheckOrdNo(
    v_Cust_No         IN RTSD0104.CUST_NO%TYPE            /*주문번호            */
    ) RETURN VARCHAR2 IS
    v_Curr_Ordno   RTSD0104.ORD_NO%TYPE;
  BEGIN
    
    /*
    SELECT  ORD_NO
    INTO    v_Curr_Ordno
    FROM    RTSD0104
    WHERE   CUST_NO = v_Cust_No
    AND     ORD_ID NOT IN('06')
    AND ROWNUM=1
    ORDER BY CHG_DT DESC;
    */
    
    SELECT  MAX(ORD_NO) KEEP(DENSE_RANK LAST ORDER BY REG_DT)
    INTO    v_Curr_Ordno
    FROM    RTSD0104
    WHERE   CUST_NO = v_Cust_No
    AND     STAT_CD NOT IN('06')
    AND     ORD_ID NOT IN('04')    
    ORDER BY REG_DT DESC;
    

    RETURN v_Curr_Ordno;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0104CheckOrdNo;


  /*****************************************************************************
  -- 계약 정보 Select - 주문현황리스트
 
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.01       2016-07-12  이영근           대리점코드/채널대분류/채널중분류 컬럼 추가   
   1.7        2018-03-01  wjim             [20180301_03] 프리미엄 서비스 추가
   1.8        2019-01-22  KJU              2+2 합산 
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO                                                AS ORD_NO,          /*주문번호       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S032', A.STAT_CD)     AS STAT_NM,         /*계약상태       */
            A.ORD_DAY                                               AS ORD_DAY,         /*접수일자       */
            A.PROC_DAY                                              AS OPROC_DAY,       /*계약-장착일자  */
            TO_CHAR(A.REG_DT, 'HH24:MI:SS')                         AS REG_DT,          /*계약접수시간   */
            DECODE(A.CHAN_CD,
                '01', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                '05', TO_CHAR(C.REG_DT, 'YYYYMMDD'),
                DECODE(A.STAT_CD,
                   '06', NULL,
                   A.PROC_DAY))                             AS PROC_DAY,        /*장착완료일자   */
            TO_CHAR(C.REG_DT, 'HH24:MI:SS')                         AS PROC_TM,         /*장착완료시간   */
            ''                                                      AS PETTERN_CD,      /* 상품패턴      */        
            LISTAGG(B.MAT_CD, ',') WITHIN GROUP (ORDER BY B.MAT_CD) AS MAT_CD,           /*상품코드       */
            LISTAGG(DECODE(B.FR_CD,'Z','(범용)','F','(앞)','R','(뒤)')||Pkg_Rtsd0005.f_sRtsd0005Matname(B.MAT_CD), ',') WITHIN GROUP (ORDER BY B.FR_CD, B.MAT_CD)          AS MAT_NM,          /*상품명         */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S022',LPAD(SUM(TO_NUMBER(B.CNT_CD)),2,'0'))  AS CNT_NM,          /*타이어본수     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S021',A.PERIOD_CD)    AS PERIOD_NM,       /*계약기간       */
            A.REGI_AMT                                         AS REGI_AMT,        /*렌탈등록비     */
            A.SUM_MON_AMT                                          AS MON_AMT,         /*월렌탈료       */
            Pkg_Rtsd0100.F_sRtsd0100Custname(A.CUST_NO)             AS CUST_NM,         /*고객명         */
            Pkg_Rtsd0007.f_sRtsd0007Agencynm(A.AGENCY_CD)           AS AGENCY_NM    ,   /*장착대리점     */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S018',A.SALES_GROUP)  AS SALES_GROUP_NM  ,/*지사           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S019',A.SALES_OFFICE) AS SALES_OFFICE_NM ,/*지점           */
            DECODE(A.CONTENTS_CD,
                 '0001', Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD),
                     Pkg_Rtcm0051.f_sRtcm0051Codename('S002', A.MODEL_CD)||
                     ' '||
                     Pkg_Rtcm0051.f_sRtcm0051Codename('S003', A.CONTENTS_CD)) AS MODEL_NM, /*차종+사양명 */
            A.CAR_NO                                                AS CAR_NO,          /*차량번호       */
            A.ORD_AGENT                                             AS ORD_AGENT,       /*판매인번호     */
            E.ORG_AGNM                                              AS ORG_AGNM,        /*판매인명       */
            DECODE(D.GENDER_CD,'1','남','2','여')                   AS GENDER_CD,       /*성별           */
            A.C_MILEAGE                                             AS C_MILEAGE,       /*현재주행거리   */
            (TO_CHAR(SYSDATE,'YYYY')-SUBSTR(D.BIRTH_DAY,1,4)+1)     AS AGE,             /*나이           */
            REPLACE(SUBSTR( D.ADDR1 ,1,REGEXP_INSTR(D.ADDR1,'\ ')),' ','') AS ADDR_AREA,/*지역           */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S014', A.SEASON_CD)   AS SEASON_NM,       /*계절구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S078', F.MF_CD)       AS MF_NM,           /*구매전 제조사  */
            A.CHAN_CD                                               AS CHAN_CD,         /*채널구분       */
            Pkg_Rtcm0051.f_sRtcm0051Codename('S030', A.CHAN_CD)     AS CHAN_NM,         /*채널구분       */
            D.MOB_NO,                                                                   /*휴대폰번호 20160408 추가 한승훈    */
            A.AGENCY_CD,
            DECODE(A.CHAN_CD,'03',E.CHAN_LCLS_CD,G.CHAN_LCLS_CD) AS CHAN_LCLS_CD,
            DECODE(A.CHAN_CD,'03',E.CHAN_MCLS_CD,G.CHAN_MCLS_CD) AS CHAN_MCLS_CD,
            Pkg_Rtcm0051.f_sRtcm0051Codename('S090',DECODE(A.CHAN_CD,'03',E.CHAN_LCLS_CD,G.CHAN_LCLS_CD)) AS CHAN_LCLS_NM,
            Pkg_Rtcm0051.f_sRtcm0051Codename('S091',DECODE(A.CHAN_CD,'03',E.CHAN_MCLS_CD,G.CHAN_MCLS_CD)) AS CHAN_MCLS_NM,
            '(' || D.POS_CD || ') ' || D.ADDR1 || ' ' || D.ADDR2 AS ADDR,
            A.PS_CD,                                                                   /*서비스코드     */ --[20180301_03]
            Pkg_Rtcm0051.f_sRtcm0051Codename('S043', A.PS_CD)       AS PS_NM           /*서비스명       */ --[20180301_03]
        FROM    RTSD0104 A,
            RTSD0106 B,
            RTSD0108 C,
            RTSD0100 D,
            RTSD0113 E,
            RTCS0120 F,
            RTSD0007 G
        WHERE   A.ORD_DAY       BETWEEN v_Ord_Fday AND v_Ord_Tday                               /*접수일자FROM~TO       */
        AND     A.SALES_OFFICE  = DECODE(v_Sales_Office, NULL, A.SALES_OFFICE, v_Sales_Office)  /*지점                  */
        AND     A.SALES_GROUP   = DECODE(v_Sales_Group , NULL, A.SALES_GROUP , v_Sales_Group)   /*지사                  */
        AND     A.AGENCY_CD     = DECODE(v_Agency_Cd   , NULL, A.AGENCY_CD   , v_Agency_Cd)     /*장착 대리점           */
        AND     A.ORD_NO        = DECODE(v_Ord_No      , NULL, A.ORD_NO      , v_Ord_No)        /*주문번호              */
        AND     A.CUST_NO       = DECODE(v_Cust_No     , NULL, A.CUST_NO     , v_Cust_No)       /*고객번호              */
        AND     (v_Proc_Fday IS NULL OR (v_Proc_Fday IS NOT NULL AND A.PROC_DAY BETWEEN v_Proc_Fday AND v_Proc_Tday))   /*장착일자FROM~TO       */
        AND     (v_Mob_No IS NULL OR (v_Mob_No IS NOT NULL AND D.MOB_NO LIKE '%'|| v_Mob_No ||'%'))   /*핸드폰번호 추가 20160408 한승훈        */
        AND     A.ORD_NO = B.ORD_NO
        AND     A.ORD_NO = C.ORD_NO (+)
        AND     A.CUST_NO = D.CUST_NO
        AND     A.ORD_AGENT = E.ORD_AGENT(+)
        AND     A.ORD_NO    = F.ORD_NO (+)
        AND     A.AGENCY_CD = G.AGENCY_CD(+)
        GROUP BY A.ORD_NO,A.STAT_CD,A.ORD_DAY,A.REG_DT,A.PROC_DAY,C.REG_DT,A.PERIOD_CD,A.CUST_NO,A.AGENCY_CD,A.SALES_GROUP,
             A.SALES_OFFICE,A.CONTENTS_CD,A.MODEL_CD,A.CAR_NO,A.ORD_AGENT,E.ORG_AGNM,D.GENDER_CD,A.C_MILEAGE,D.BIRTH_DAY,
             D.ADDR1,A.SEASON_CD,F.MF_CD,A.CHAN_CD,D.MOB_NO,E.CHAN_LCLS_CD,G.CHAN_LCLS_CD,E.CHAN_MCLS_CD,G.CHAN_MCLS_CD,
             D.POS_CD,D.ADDR1,D.ADDR2,A.PS_CD,A.REGI_AMT,A.SUM_MON_AMT;

  END p_sRtsd0104StatusBizApp;


  /*****************************************************************************
  -- 주문등록시 값 비교하기 위한 FUNCTION
  *****************************************************************************/
  FUNCTION f_sRtsd0104SumMonAtm (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE         /*계약번호              */
    ) RETURN NUMBER IS
    
    sumMonAmt     NUMBER DEFAULT 0;  /* 합계월렌탈료 */

  BEGIN

    SELECT
        TRUNC((((NVL(SUM(T.RENT_AMT),0)*MAX(T.PERIOD_CD)) + ((NVL(SUM(T.REGI_AMT),0) - NVL(MAX(T.REGI_AMT_104),0))))/MAX(T.PERIOD_CD))-NVL(SUM(T.DC_AMT),0),-1) AS LAST_RENT_AMT 
    INTO sumMonAmt
    FROM (
        SELECT AA.ORD_NO,    
               AA.RENT_AMT,     
               CASE WHEN AA.SALE_ID = '04' THEN 0
               ELSE AA.REGI_AMT
               END REGI_AMT,     
               AA.DC_AMT,       
               AA.PERIOD_CD,
               AA.SALE_ID,
               (SELECT REGI_AMT FROM RTSD0104 WHERE ORD_NO = v_Ord_No) AS REGI_AMT_104
        FROM (
--             SELECT A.ORD_NO,
--                   A.PERIOD_CD,
--                   0 AS AMT,
--                   NVL(A.RENT_AMT, 0) AS RENT_AMT,
--                   NVL(A.REGI_AMT, 0) AS REGI_AMT,
--                   NVL(A.MON_DCAMT, 0) AS DC_AMT, -- 할인액
--                   (SELECT SALE_ID FROM RTSD0104 WHERE ORD_NO = v_Ord_No) AS SALE_ID
--              FROM RTSD0106 A, RTSD0005 B, RTSD0040 C
--             WHERE A.MAT_CD = B.MAT_CD
--               AND A.ORD_NO = C.ORD_NO(+)
--               AND A.SEQ = C.SEQ(+)
             SELECT A.ORD_NO,
                   A.PERIOD_CD,
                   0 AS AMT,
                   NVL(A.RENT_AMT, 0) AS RENT_AMT,
                   NVL(A.REGI_AMT, 0) AS REGI_AMT,
                   CASE WHEN E.DC_RATE = 0 THEN NVL(A.MON_DCAMT, 0)
                        ELSE TRUNC(NVL(A.RENT_AMT, 0) * E.DC_RATE/100, -1 ) END AS DC_AMT, --[20210907_01] kstka 원단위 절사
--                        ELSE TRUNC(NVL(A.MON_DCAMT, 0) * E.DC_RATE/100 ) * 10 END AS DC_AMT,
--                   NVL(A.MON_DCAMT, 0) AS DC_AMT, -- [20210218_01]할인액
                   (SELECT SALE_ID FROM RTSD0104 WHERE ORD_NO = v_Ord_No) AS SALE_ID
              FROM RTSD0106 A, RTSD0005 B, RTSD0040 C, RTSD0104 D, RTSD0020 E
             WHERE A.MAT_CD = B.MAT_CD
               AND A.ORD_NO = C.ORD_NO(+)
               AND A.SEQ = C.SEQ(+)
               AND A.ORD_NO = D.ORD_NO
               AND D.SALE_CD = E.SALE_CD
            UNION ALL
            SELECT A.ORD_NO,
                   CASE WHEN A.DC_YN = 'Y' THEN C.PERIOD_CD ELSE '' END AS PERIOD_CD,
                   CASE WHEN A.DC_YN = 'Y' THEN 0 ELSE A.L_AMT END AS AMT,
                   CASE WHEN A.DC_YN = 'Y' THEN A.MON_AMT ELSE 0 END AS RENT_AMT,
                   0,
                   0 AS DC_AMT, -- 할인액
                   C.SALE_ID
                   FROM RTSD0041 A, RTSD0023 B, RTSD0104 C
             WHERE A.ADD_GDS_CD = B.ADD_GDS_CD
               AND A.ORD_NO = C.ORD_NO
           UNION ALL
           SELECT C.ORD_NO,
                  C.PERIOD_CD,
                  0,
                  C.SERV_AMT_SUM,
                  0,
                  CASE WHEN C.DC_RATE = 0 THEN 0
                       ELSE TRUNC(C.SERV_AMT_SUM * C.DC_RATE/100 )
                  END AS DC_AMT,
                  C.SALE_ID 
            FROM (
                    SELECT AA.SALE_CD,
                           CC.PERIOD_CD,
                           BB.SERV_CNTR,
                           BB.SERV_AMT AS SERV_AMT_SUM,
                           CC.ORD_NO,
                           CASE WHEN DD.PRDT_GRP_DTL = '03' THEN 
                               CASE WHEN DD.DC_RATE = 0 THEN DD.DC_AMT
                                     ELSE TRUNC(BB.SERV_AMT * DD.DC_RATE/100 )
                               END
                           END GROUP_SALE_1,     /* 단체할인 */
                           CASE WHEN DD.PRDT_GRP_DTL IS NULL OR  DD.PRDT_GRP_DTL !='03' THEN 
                               CASE WHEN DD.DC_RATE = 0 THEN DD.DC_AMT
                                    ELSE TRUNC(BB.SERV_AMT * DD.DC_RATE/100 ) 
                               END
                           END CHNL_SALE_1,       /* 판매채널할인 */
                           DD.DC_RATE,
                           DD.DC_AMT,
                           CC.SALE_ID
                      FROM RTSD0028 AA, 
                           RTSD0013 BB, 
                           RTSD0104 CC,
                           RTSD0020 DD       
                     WHERE AA.PRS_DCD = BB.PRS_DCD
                       AND BB.ORD_NO  = CC.ORD_NO   --[20191001_01] 상품별 서비스수수료 별도 적용 
                       AND AA.SALE_CD = CC.SALE_CD
                       AND AA.SALE_CD = DD.SALE_CD
                       AND CC.ORD_NO = BB.ORD_NO    
                 ) C
             ) AA
        WHERE AA.ORD_NO = v_Ord_No
    ) T    
    GROUP BY T.ORD_NO;
        
    RETURN sumMonAmt;
    
    EXCEPTION
      WHEN OTHERS THEN
        RETURN -1;  
    
  END f_sRtsd0104SumMonAtm;


  /*****************************************************************************
  -- 계약금액 체크
   
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   
  *****************************************************************************/
  PROCEDURE p_sRtsd0104ChkSumMonAtm (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error EXCEPTION;
    sumMonAmt      RTSD0104.SUM_MON_AMT%TYPE;
    saleCd         RTSD0104.SALE_CD%TYPE;
    
  BEGIN
    
    SELECT SUM_MON_AMT, SALE_CD 
      INTO sumMonAmt, saleCd
      FROM RTSD0104
     WHERE ORD_NO = v_Ord_No;
    
    IF saleCd NOT IN ('S000000114', 'S000000120', 'S000000121', 'S000000122') THEN
        IF (sumMonAmt != f_sRtsd0104SumMonAtm(v_Ord_No)) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 총 합계렌탈료가 다릅니다.';
            RAISE e_Error;
        END IF;
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0104.p_sRtsd0104ChkSumMonAtm(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0104.p_sRtsd0104ChkSumMonAtm(2)', v_ErrorText, v_Return_Message);

  END p_sRtsd0104ChkSumMonAtm;  
  
  /*****************************************************************************
  -- USAGE 구분 (Pkg_Exif0002, Pkg_Exif0003)
  *****************************************************************************/
  FUNCTION f_sRtsdGetUsage (
    v_Ord_Day         IN RTSD0104.ORD_DAY%TYPE,           /*주문일자              */
    v_Proc_Day        IN RTSD0104.PROC_DAY%TYPE,         /*장착일자              */
    v_Chan_Cd         IN RTSD0104.CHAN_CD%TYPE           /*채널코드              */
    ) RETURN VARCHAR2 IS
    
    v_Usage     VARCHAR2(4);  /* Usage*/

  BEGIN

    SELECT 
                CASE WHEN v_Proc_Day >= '20191223' THEN -- [2019-00359563] 신사업팀 구광태 대리 요청으로 실적분리를 위해 Order Reason 신규코드로 분리 
                    CASE v_Chan_Cd WHEN '01' THEN 'R65'
                                   WHEN '02' THEN 'R60'
                                   WHEN '03' THEN 'R63'
                                   WHEN '04' THEN 'R61'
                                   WHEN '05' THEN 'R66'
                                   WHEN '06' THEN 'R43'
                                   WHEN '09' THEN 'R43'
                    END
                WHEN v_Ord_Day >= '20180801' THEN                
                    CASE v_Chan_Cd WHEN '01' THEN 'R42'
                                   WHEN '02' THEN 'R43'
                                   WHEN '03' THEN 'R43'
                                   WHEN '04' THEN 'R43'
                                   WHEN '05' THEN 'R42'
                                   WHEN '06' THEN 'R43'
                                   WHEN '09' THEN 'R43' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
                    END 
                ELSE
                    CASE v_Chan_Cd WHEN '01' THEN 'R42'
                                   WHEN '02' THEN 'R41'
                                   WHEN '03' THEN 'R41'
                                   WHEN '04' THEN 'R41'
                                   WHEN '05' THEN 'R42'
                                   WHEN '06' THEN 'R41'
                                   WHEN '09' THEN 'R41' --B2B일시불, 회수오더 미발생이지만 나중을 위해 일단 추가 [20170227_01]
                    END
                END AS USAGE
                INTO v_Usage
                FROM DUAL;
        
    RETURN v_Usage;
    
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;  
    
  END f_sRtsdGetUsage;
  
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.ORD_NO,
            C.CUST_NM,
            DECODE(C.CUST_TP, '01', C.BIRTH_DAY, O_BIRTHDAY) AS BIRTH_DAY,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S026',DECODE(C.CUST_TP, '01', C.GENDER_CD, O_GENDERCD)) AS GENDER_NM, 
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S027',DECODE(C.CUST_TP, '01', C.LF_CD    , O_LFCD    )) AS LF_NM,
            C.POS_CD,
            C.ADDR1,
            C.ADDR2,
            C.TEL_NO,
            DECODE(C.CUST_TP, '01', C.MOB_NO   , DECODE(A.CHAN_CD,'06',C.MOB_NO,O_MOBNO)) AS MOB_NO,
            C.MOB_FIRM,                
            C.EMAIL_ADDR,              
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002', A.MODEL_CD) ||' '||Pkg_Rtcm0051.f_sRtcm0051CodeName('S003', A.CONTENTS_CD) AS CAR_TYPE, 
            A.CAR_NO,                
            A.CAR_OWNER,            
            A.C_MILEAGE, 
            C.POS_CD2 ,
            C.ADDR1_2 ,
            C.ADDR2_2 , 
            C.TEL_NO2 ,     
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S012',D.PETTERN_CD) AS PATTERN_NM,              
            D.SECTION_WIDTH || '/' || D.ASPECT_RATIO || 'R' ||D.WHEEL_INCHES AS SPEC_NM,
            (SELECT SUM(CNT_CD) FROM RTSD0106 WHERE ORD_NO = A.ORD_NO) QTY,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S044',PRS_DCD) PRS_NM,
            K.SERV_CNT0, 
            M.ADD_GDS_NM,
            CASE WHEN M.ADD_GDS_NM IS NULL THEN '' ELSE '1' END ADD_GDS_QTY,
            A.PERIOD_CD, 
            A.REGI_AMT,
            A.MON_AMT,
            (
            SELECT 
             (NVL(SUM(T.F_DCAMT),0)+NVL(CASE WHEN MAX(T1.DC_RATE) = 0 THEN 0
                                       ELSE TRUNC(MAX((SELECT SUM(TRUNC(A.SERV_AMT)) FROM RTSD0013 A WHERE A.ORD_NO = T.ORD_NO)) * MAX(T1.DC_RATE)/100)
                                       END,0)) AS MON_DC_AMT
            FROM RTSD0106 T, RTSD0020 T1
            WHERE T.ORD_NO = A.ORD_NO
            AND T.SALE_CD = T1.SALE_CD
            ) AS MON_DC_AMT,              
            A.SUM_MON_AMT,
            (
            SELECT 
             (NVL(SUM(T.F_DCAMT),0)+NVL(CASE WHEN MAX(T1.DC_RATE) = 0 THEN 0
                                       ELSE TRUNC(MAX((SELECT SUM(TRUNC(A.SERV_AMT)) FROM RTSD0013 A WHERE A.ORD_NO = T.ORD_NO)) * MAX(T1.DC_RATE)/100)
                                       END,0)) * NVL(MAX(T.PERIOD_CD),0) AS MON_DC_AMT
            FROM RTSD0106 T, RTSD0020 T1
            WHERE T.ORD_NO = A.ORD_NO
            AND T.SALE_CD = T1.SALE_CD
            ) AS TOT_DC_AMT,                                               
            DECODE(A.PAY_MTHD, 'A', F.CUST_NM, 'C', G.CUST_NM) AS PAYER,
            DECODE(A.PAY_MTHD, 'A', DECODE(F.CUST_TP, '01', F.EBIR_DAY, '02', F.BUSL_NO), 'C', DECODE(G.CUST_TP, '01', G.EBIR_DAY, '02', G.BUSL_NO)) AS BIRTH_DAY2,
            A.PAY_DD ,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R004',A.PAY_MTHD) AS PAY_MTHD_NM,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R001',F.BANK_CD) BANK_NM,           
            Pkg_Rtcm0051.f_sRtcm0051CodeName('R002',G.CARDCOM_CD) CARD_NM,
            F.ACCT_NO ,
            G.CARD_NO ,
            B.MAT_DESC ,              
            H.AGENCY_NM ,               
            H.TEL_NO AS AGENCY_TEL_NO ,           
            H.POS_CD AS AGENCY_POS_CD,
            H.CITY ,
            H.STREET , 
            A.ORG_CD ,              
            NULL AS ORG_NM,           
            NULL AS ORG_TEL,       
            A.ORD_AGENT ,     
            I.ORG_AGNM ,       
            I.ORG_AGTEL ,         
            A.FC_DAY ,
            TO_CHAR(J.REG_DT,'YYYYMMDD') ORD_DAY
            FROM    RTSD0104 A,
                    RTSD0106 B,
                    RTSD0100 C,
                    RTSD0005 D,
                    RTRE0010 F,
                    RTRE0020 G,
                    RTSD0007 H,
                    RTSD0113 I,
                    RTSD0108 J,
                    RTSD0013 K,
                    RTSD0041 L,
                    RTSD0023 M
            WHERE   A.PROC_DAY BETWEEN v_Send_Fday AND v_Send_Tday
            AND     A.STAT_CD = '04'
            AND     ((A.CON_MTHD = '2') OR (A.CON_MTHD = '1' AND C.EMAIL_ADDR IS NULL)) 
            AND     A.ORD_NO  = B.ORD_NO
            AND     A.CUST_NO = C.CUST_NO
            AND     B.MAT_CD  = D.MAT_CD
            AND     A.ACC_SEQ = F.ACC_SEQ(+)
            AND     A.CRD_SEQ = G.CRD_SEQ(+)
            AND     A.AGENCY_CD = H.AGENCY_CD
            AND     A.ORD_AGENT = I.ORD_AGENT(+)
            AND     A.ORD_NO = J.ORD_NO
            AND     A.ORD_NO = K.ORD_NO(+)
            AND     A.ORD_NO = L.ORD_NO(+)
            AND     L.ADD_GDS_CD = M.ADD_GDS_CD(+)
         ORDER BY A.ORD_NO, B.SEQ, K.PRS_DCD,M.ADD_GDS_NM ;

  END p_sSendContractList;
  
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.CUST_NM
         , A.MOB_NO
         , A.POS_CD
         , A.ADDR1
         , A.ADDR2
         , B.ORD_NO
         , E.MAT_NM
         , B.PROC_DAY
         , TO_NUMBER(B.CNT_CD) CNT_CD
         , B.PERIOD_CD
         , TO_CHAR(ADD_MONTHS(B.PROC_DAY, B.PERIOD_CD) - 1, 'YYYY-MM-DD') OS_DAY_T
         , MAX(DECODE(D.PRS_DCD, 'B00001', NVL(DECODE(D.PRS_DCD, 'B00001', SERV_CNTR, NULL), 0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(B.ORD_NO),'0')) AS SERV_01
         , MAX(DECODE(D.PRS_DCD, 'B00002', NVL(DECODE(D.PRS_DCD, 'B00002', SERV_CNTR, NULL), 0), '0')) AS SERV_02
         , MAX(DECODE(D.PRS_DCD, 'B00003', NVL(DECODE(D.PRS_DCD, 'B00003', SERV_CNTR, NULL), 0), '0')) AS SERV_03
         , MAX(DECODE(D.PRS_DCD, 'B00004', NVL(DECODE(D.PRS_DCD, 'B00004', SERV_CNTR, NULL), 0), '0')) AS SERV_04
         , MAX(DECODE(D.PRS_DCD, 'B00005', NVL(DECODE(D.PRS_DCD, 'B00005', SERV_CNTR, NULL), 0), '0')) AS SERV_05
         , MAX(DECODE(D.PRS_DCD, 'B00006', NVL(DECODE(D.PRS_DCD, 'B00006', SERV_CNTR, NULL), 0), '0')) AS SERV_06
         , MAX(DECODE(D.PRS_DCD, 'B00007', NVL(DECODE(D.PRS_DCD, 'B00007', SERV_CNTR, NULL), 0) - Pkg_Rtcs0010.f_sRtcs0010DlvrCnt(B.ORD_NO),'0')) AS SERV_07
         , MAX(DECODE(D.PRS_DCD, 'B00008', NVL(DECODE(D.PRS_DCD, 'B00008', SERV_CNTR, NULL), 0), '0')) AS SERV_08
    FROM RTSD0100 A, RTSD0108 B, RTSD0106 C, RTSD0013 D, RTSD0005 E
    WHERE A.CUST_NO = B.CUST_NO
      AND B.ORD_NO = C.ORD_NO
      AND C.ORD_NO = D.ORD_NO
      AND C.MAT_CD = E.MAT_CD
      AND B.STAT_CD = '04'
      AND A.CUST_NM IS NOT NULL
      AND B.MFP_YN = 'N'
      AND TO_CHAR(ADD_MONTHS(B.PROC_DAY, B.PERIOD_CD) - 1, 'YYYYMMDD') BETWEEN v_End_Fday AND v_End_Tday
      GROUP BY A.CUST_NM, A.MOB_NO, A.POS_CD, A.ADDR1, A.ADDR2, B.ORD_NO, E.MAT_NM, B.PROC_DAY, B.CNT_CD, B.PERIOD_CD;

  END p_sEndContractList;
  
  /*****************************************************************************
  -- 계약 정보 Update - 임직원 상품의 경우 임직원 정보 업데이트
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0104EmpNo (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*주문번호              */
    v_Emp_No         IN RTSD0104.EMP_NO%TYPE,         /*상태                  */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*상태                  */
    v_Success_Code      OUT NUMBER
    ) IS

  BEGIN   
        
        UPDATE RTSD0104
        SET    EMP_NO  = v_Emp_No
        WHERE  ORD_NO   = v_Ord_No;

    v_Success_Code := 0;
    
    EXCEPTION
      WHEN OTHERS THEN
        v_Success_Code := -1;

  END p_UpdateRtsd0104EmpNo;
  
  /*****************************************************************************
  -- 주문 BLOCK 처리
  *****************************************************************************/
  FUNCTION f_sRtsdOrdBlockYn (
    v_Cust_No         IN RTSD0100.CUST_NO%TYPE           /*고객번호              */
    ) RETURN VARCHAR2 IS
    
    v_BlockYn     VARCHAR2(1) := 'N';

    v_Canc_Day    VARCHAR2(8);
    v_Canc_Cd     VARCHAR2(2);
    v_Block_Day   VARCHAR2(8);
    v_Chan_Cd     VARCHAR2(2);
    
    Cursor Cur_rtsd0430 IS
    SELECT B.CANC_DAY
         , B.CANC_CD
         , TO_CHAR(ADD_MONTHS(B.CANC_DAY, 3), 'YYYYMMDD') AS BLOCK_DAY
         , A.CHAN_CD
    FROM RTSD0104 A
    ,    RTSD0430 B
    WHERE A.CUST_NO = v_Cust_No
    AND A.ORD_NO = B.ORD_NO;

  BEGIN

    --취소 사유가 여러개 등록되어 있는 경우 
    --하나라도 하기 사항에 해당이 되면 BLOCK처리
    FOR CUR IN Cur_rtsd0430 LOOP   
    
        IF CUR.CANC_CD IN ('03', '04', '05', '06', '07', '08') THEN
            --위 사유의 경우 3개월이내 주문시 block처리
            IF CUR.BLOCK_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') THEN
                v_BlockYn := 'Y';
            END IF;
        ELSIF CUR.CANC_CD IN ('09', '10', '11') THEN
            -- 위 사유의 경우 온라인 계약만 가능
            IF CUR.CHAN_CD NOT IN ('02', '03', '04') THEN
                v_BlockYn := 'Y';
            END IF;
        END IF;
        
    END LOOP;
    
    RETURN v_BlockYn;
    
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;  
    
  END f_sRtsdOrdBlockYn;

  /*****************************************************************************
  -- 계약취소여부 확인 (1달이내)
  *****************************************************************************/
  FUNCTION f_sRtsdCheckCancelOrder (
    v_Cust_No  IN RTSD0100.CUST_NO%TYPE,
    v_Chan_Cd  IN RTSD0104.CHAN_CD%TYPE
  ) RETURN VARCHAR IS

    v_Canc_Yn VARCHAR2(1);
  BEGIN

      SELECT CASE WHEN v_Chan_Cd IN ('01', '05') THEN 
                  CASE WHEN COUNT(*) > 0 THEN 'Y' ELSE 'N' END 
             ELSE 'N' END AS CANC_YN 
            INTO v_Canc_Yn
            FROM RTSD0104
            WHERE CUST_NO = v_Cust_No
            AND CHAN_CD IN ('02', '03', '04')
            AND STAT_CD = '06'
            AND ADD_MONTHS(ORD_DAY, 1) >= TO_CHAR(SYSDATE, 'YYYYMMDD');

      RETURN v_Canc_Yn;
    
    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;  
    
  END f_sRtsdCheckCancelOrder;

  /*****************************************************************************
  -- SAP인터페이스 오더 정보 조회
 
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0       2023-09-14   kstka              
   1.1       2024-07-17   백인천				[이름 and 휴대전화번호] 컬럼 추가              
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
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT A.ORD_NO
        , A.STAT_CD
        , M.CUST_NM
    	, M.MOB_NO
        , F.CD_NM STAT_NM
        , A.ORD_DAY
        , A.PROC_DAY
        , B.MAT_CD
        , D.MAT_NM
        , A.CNT_CD
        , J.CD_NM CNT_NM
        , Pkg_Exif0004.f_sExif0004O2OAgency(A.AGENCY_CD) RC_YN
        , A.OUT_STOCK_TYPE
        , G.CD_NM OUT_STOCK_TYPE_NM
        , A.CHAN_CD
        , H.CD_NM CHAN_NM
        , E.CHAN_MCLS_CD
        , I.CD_NM CHAN_MCLS_NM
        , A.AGENCY_CD
        , E.AGENCY_NM
        , K.VBELN
        , K.VBELN_D
        , K.VBELN_R
        , K.VBELN_D_R
        , L.GI_DAY
    FROM  RTSD0104 A
        , RTSD0106 B
        , RTSD0005 D
        , RTSD0007 E
        , RTCM0051 F
        , RTCM0051 G
        , RTCM0051 H
        , RTCM0051 I
        , RTCM0051 J
        , RTSD0115 K
        , RTSD0116 L
        , RTSD0100 M
        , (
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
        ) N
    WHERE 1=1
        AND A.ORD_NO = B.ORD_NO
        AND B.MAT_CD = D.MAT_CD
        AND A.AGENCY_CD = E.AGENCY_CD
        AND F.CD_GRP_CD = 'S032'
        AND A.STAT_CD = F.CD
        AND G.CD_GRP_CD = 'S313'
        AND G.CD = NVL(A.OUT_STOCK_TYPE, '00')
        AND H.CD_GRP_CD = 'S030'
        AND H.CD = A.CHAN_CD
        AND I.CD_GRP_CD = 'S091'
        AND I.CD = E.CHAN_MCLS_CD
        AND J.CD_GRP_CD = 'S022'
        AND J.CD = A.CNT_CD
        AND A.ORD_NO = K.ORD_NO(+)
        AND K.TRANS_TP(+) = 'N'
        AND K.ORD_NO = L.ORD_NO(+)
        AND K.VBELN = L.VBELN(+)
        AND TRIM(K.VBELN_D) = L.VBELN_D(+)
        AND A.CUST_NO = M.CUST_NO
        AND (v_Ord_Fday IS NULL OR A.ORD_DAY BETWEEN v_Ord_Fday AND v_Ord_Tday)
        AND (v_Proc_Fday IS NULL OR A.PROC_DAY BETWEEN v_Proc_Fday AND v_Proc_Tday)
        AND A.AGENCY_CD = DECODE(v_Agency_Cd, NULL, A.AGENCY_CD, v_Agency_Cd)
        AND A.ORD_NO    = DECODE(v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
        AND A.CHAN_CD   = DECODE(v_Chan_Cd, NULL, A.CHAN_CD, v_Chan_Cd)
        AND NVL(A.OUT_STOCK_TYPE, '00') = DECODE(v_Out_Stock_Type, NULL, A.OUT_STOCK_TYPE, v_Out_Stock_Type)
        AND M.MOB_NO = DECODE(v_Mob_No, NULL, M.MOB_NO, v_Mob_No)
        AND A.AGENCY_CD = N.USER_ID
        AND 'OK' = (SELECT CASE WHEN v_Mode = '01' THEN 
                                    CASE WHEN K.VBELN IS NOT NULL AND TRIM(K.VBELN_D) IS NULL THEN 'OK' ELSE 'NO' END
                                WHEN v_Mode = '02' THEN
                                    CASE WHEN A.STAT_CD = '04' AND TRIM(L.GI_DAY) IS NULL THEN 'OK' ELSE 'NO' END
                                WHEN v_Mode = '03' THEN 
                                    CASE WHEN A.STAT_CD = '06' AND K.VBELN IS NOT NULL AND K.VBELN_D IS NOT NULL AND K.VBELN_R IS NULL THEN 'OK' ELSE 'NO' END
                    END FROM DUAL)
        AND ((v_Rental_Goup IS NULL) OR (v_Rental_Goup IS NOT NULL AND N.RENTAL_GROUP = v_Rental_Goup ))
        AND ((v_Rental_Office IS NULL) OR (v_Rental_Office IS NOT NULL AND N.RENTAL_OFFICE = v_Rental_Office ))
        AND (
            CASE WHEN v_Login_Grp = 'RM' AND N.RENTAL_GROUP IN (SELECT RNT_OFC FROM RTCM0110 WHERE RNT_MST_ID = v_Login_Id) THEN 1
                 WHEN v_Login_Grp IN ('01', '02') THEN 1 --[20190301_01]
                 WHEN v_Login_Id = N.USER_ID THEN 1
            ELSE 0 END
        ) = 1
        AND (
            CASE WHEN v_Login_Grp = 'RM' AND N.RENTAL_OFFICE IN (SELECT RNT_PNT FROM RTCM0110 WHERE RNT_MST_ID = v_Login_Id) THEN 1
                 WHEN v_Login_Grp IN ('01', '02') THEN 1 --[20190301_01]
                 WHEN v_Login_Id = N.USER_ID THEN 1
            ELSE 0 END
        ) = 1
        ;

  END p_sNoMadeOrderList;
  
  /*****************************************************************************
  -- 계약 정보 Update - 주문유형 Data UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0104OrderType (
    v_Ord_No         IN RTSD0104.ORD_NO%TYPE,         /*계약번호              */
    v_Order_Type     IN RTSD0104.AG_DESC%TYPE,        /*주문유형              */
    v_Reg_Id         IN RTSD0104.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS

  BEGIN

    UPDATE RTSD0104
    SET    AG_DESC      = v_Order_Type,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE
    WHERE  ORD_NO       = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_Errortext := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0104OrderType;
  
END Pkg_Rtsd0104;