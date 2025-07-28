CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0070 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0210
    PURPOSE : 계좌즉시출금 내역조회
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-19  han             1. Created this package body.
 *******************************************************************************/

/*******************************************************************************
 -- 클레임관리조회 Select
 *******************************************************************************/
     PROCEDURE p_sRtsd0070Status (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_clm_FDay       IN RTSD0070.CLM_DAY%TYPE              /*접수일자FROM          */
    , v_clm_TDay       IN RTSD0070.CLM_DAY%TYPE              /*접수일자TO            */
    , v_clm_Gb         IN RTSD0070.CLM_GB%TYPE               /*방문점검구분          */
    , v_prgrs_State    IN RTSD0070.PRGRS_STATE%TYPE          /*처리상태              */
    , v_ord_No         IN RTSD0070.ORD_NO%TYPE               /*계약번호              */
    , v_cust_No        IN RTSD0070.CUST_NO%TYPE              /*고객번호              */
    ) IS


  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.CLM_DAY                                                                     /*접수일자              */                                                                            
          , A.CLM_SEQ                                                                     /*일련번호              */                                                                        
          , A.CUST_NO                                                                     /*고객번호              */                                                                     
          , A.ORD_NO                                                                      /*계약번호              */                                                                       
          , A.CUST_NM                                                                     /*고객명                */                                                                     
          , A.PRGRS_STATE                                                                 /*처리상태              */                                                               
          , Pkg_Rtcm0051.f_sRtcm0051Codename('C027',A.PRGRS_STATE)  AS PRGRS_STATE_NM     /*진행상태이름          */                                                                                                                                                          
          , A.CLM_GB                                                                      /*방문점검구분          */                                                                    
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S230',A.CLM_GB)       AS CLM_GB_NM          /*방문점검구분이름      */                                                                                                                                          
          , A.CLM_TP                                                                      /*방문점검유형          */                                                                
          , CASE WHEN A.CLM_GB = 'P' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S232', A.CLM_TP)
                 WHEN A.CLM_GB = 'V' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S231', A.CLM_TP)
                 ELSE ''
                 END AS CLM_TP_NM                                                         /*방문점검유형이름      */                                                                                                                                            
          , A.COUNS_ID                                                                    /*장착상담사ID          */                                                                  
          , A.COUNS_NM                                                                    /*접수상담사            */                                                                       
          , A.MOB_NO                                                                      /*연락처                */                                      
          , A.ADD_MOB_NO                                                                  /*컨텍연락처            */                                          
          , A.PETTERN_CD                                                                  /*패턴                  */                            
          , A.CNT_CD                                                                      /*본수                  */                    
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S022',A.CNT_CD)       AS CNT_NM             /*본수이름              */                                                                                                 
          , A.PROC_DAY                                                                    /*장착일자              */                      
          , A.AGENCY_CD                                                                   /*대리점코드            */                                 
          , A.AGENCY_NM                                                                   /*장착점                */                          
          , A.MODEL_CD                                                                    /*차종코드              */                                           
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S002',A.MODEL_CD)       AS MODEL_NM         /*차종명                */                                             
          , A.CAR_NO                                                                      /*차량번호              */                        
          , A.POS_CD                                                                      /*고객주소-우편번호     */                                
          , A.ADDR1                                                                       /*고객주소-주소         */                     
          , A.ADDR2                                                                       /*고객주소-상세주소     */                                   
          , A.CHC_RQS_MNT                                                                 /*점검요청월            */                                                         
          , A.TRN_RSL                                                                     /*이관결과              */                                          
          , A.CHARG_RODI                                                                  /*담당로디안            */                                                         
          , A.RE_RENT_YN                                                                  /*재렌탈가능성고객      */                                                            
          , A.RGST_DTL                                                                    /*접수내용              */                                                 
          , A.PRCSN_RSLTS                                                                 /*처리결과              */                                                      
          , A.CON_HIST                                                                    /*컨택이력              */                                              
          , A.REG_DT                                                                      /*등록일                */                                           
          , A.REG_ID                                                                      /*등록자ID              */                                                  
          , A.CHG_ID                                                                      /*변경자ID              */                                                        
          , A.CHG_DT                                                                      /*변경일                */   
    FROM    RTSD0070 A
    WHERE   (v_clm_FDay IS NULL OR (v_clm_FDay IS NOT NULL AND A.CLM_DAY BETWEEN v_clm_FDay AND v_clm_TDay)) /*접수일자FROM~TO */
    AND     A.CLM_GB        = DECODE(v_clm_Gb, NULL, A.CLM_GB, v_clm_Gb)                  /*방문점검구분          */                                                                                                                 
    AND     A.PRGRS_STATE   = DECODE(v_prgrs_State , NULL, A.PRGRS_STATE , v_prgrs_State) /*처리상태              */                                                                                                               
    AND     A.ORD_NO        = DECODE(v_ord_No      , NULL, A.ORD_NO      , v_ord_No)      /*주문번호              */                                                                                                     
    AND     A.CUST_NO       = DECODE(v_cust_No     , NULL, A.CUST_NO     , v_cust_No);    /*고객번호              */        
    
  END p_sRtsd0070Status;

/*******************************************************************************
 -- 클레임관리조회 Select 고객번호로 조회
 *******************************************************************************/
     PROCEDURE p_sRtsd0070StatusCust (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_cust_No        IN RTSD0070.CUST_NO%TYPE              /*고객번호              */
    ) IS


  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.CLM_DAY                                                                     /*접수일자              */                                                                            
          , A.CLM_SEQ                                                                     /*일련번호              */                                                                        
          , A.CUST_NO                                                                     /*고객번호              */                                                                     
          , A.ORD_NO                                                                      /*계약번호              */                                                                       
          , A.CUST_NM                                                                     /*고객명                */                                                                     
          , A.PRGRS_STATE                                                                 /*처리상태              */                                                               
          , Pkg_Rtcm0051.f_sRtcm0051Codename('C027',A.PRGRS_STATE)  AS PRGRS_STATE_NM     /*진행상태이름          */                                                                                                                                                          
          , A.CLM_GB                                                                      /*방문점검구분          */                                                                    
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S230',A.CLM_GB)       AS CLM_GB_NM          /*방문점검구분이름      */                                                                                                                                          
          , A.CLM_TP                                                                      /*방문점검유형          */                                                                
          , CASE WHEN A.CLM_GB = 'P' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S232', A.CLM_TP)
                 WHEN A.CLM_GB = 'V' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S231', A.CLM_TP)
                 ELSE ''
                 END AS CLM_TP_NM                                                         /*방문점검유형이름      */                                                                                                                                            
          , A.COUNS_ID                                                                    /*장착상담사ID          */                                                                  
          , A.COUNS_NM                                                                    /*접수상담사            */                                                                       
          , A.MOB_NO                                                                      /*연락처                */                                      
          , A.ADD_MOB_NO                                                                  /*컨텍연락처            */                                          
          , A.PETTERN_CD                                                                  /*패턴                  */                            
          , A.CNT_CD                                                                      /*본수                  */                    
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S022',A.CNT_CD)       AS CNT_NM             /*본수이름              */                                                                                                 
          , A.PROC_DAY                                                                    /*장착일자              */                      
          , A.AGENCY_CD                                                                   /*대리점코드            */                                 
          , A.AGENCY_NM                                                                   /*장착점                */                          
          , A.MODEL_CD                                                                    /*차종코드              */                                           
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S002',A.MODEL_CD)       AS MODEL_NM         /*차종명                */                                             
          , A.CAR_NO                                                                      /*차량번호              */                        
          , A.POS_CD                                                                      /*고객주소-우편번호     */                                
          , A.ADDR1                                                                       /*고객주소-주소         */                     
          , A.ADDR2                                                                       /*고객주소-상세주소     */                                   
          , A.CHC_RQS_MNT                                                                 /*점검요청월            */                                                         
          , A.TRN_RSL                                                                     /*이관결과              */                                          
          , A.CHARG_RODI                                                                  /*담당로디안            */                                                         
          , A.RE_RENT_YN                                                                  /*재렌탈가능성고객      */                                                            
          , A.RGST_DTL                                                                    /*접수내용              */                                                 
          , A.PRCSN_RSLTS                                                                 /*처리결과              */                                                      
          , A.CON_HIST                                                                    /*컨택이력              */                                              
          , A.REG_DT                                                                      /*등록일                */                                           
          , A.REG_ID                                                                      /*등록자ID              */                                                  
          , A.CHG_ID                                                                      /*변경자ID              */                                                        
          , A.CHG_DT                                                                      /*변경일                */
          , '1' AS TEMP   
    FROM    RTSD0070 A
           ,RTSD0100 B
    WHERE   1=1                                                                                                     
    AND     B.CUST_NO       = DECODE(v_cust_No     , NULL, A.CUST_NO     , v_cust_No)     /*고객번호              */        
    AND     B.CUST_NO = A.CUST_NO(+);
    
  END p_sRtsd0070StatusCust;

  
 /*****************************************************************************
  -- 클레임관리 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0070 (
      v_custNo       IN RTSD0070.CUST_NO%TYPE       /*고객번호              */                                        
    , v_ordNo        IN RTSD0070.ORD_NO%TYPE        /*계약번호              */                                     
    , v_custNm       IN RTSD0070.CUST_NM%TYPE       /*고객명                */                                           
    , v_prgrsState   IN RTSD0070.PRGRS_STATE%TYPE   /*처리상태              */
    , v_clmGb        IN RTSD0070.CLM_GB%TYPE        /*방문점검구분          */
    , v_clmTp        IN RTSD0070.CLM_TP%TYPE        /*방문점검유형          */
    , v_counsId      IN RTSD0070.COUNS_ID%TYPE      /*장착상담사ID          */                                               
    , v_counsNm      IN RTSD0070.COUNS_NM%TYPE      /*접수상담사            */                                                
    , v_mobNo        IN RTSD0070.MOB_NO%TYPE        /*연락처                */                                       
    , v_addMobNo     IN RTSD0070.ADD_MOB_NO%TYPE    /*컨텍연락처            */                                                
    , v_petternCd    IN RTSD0070.PETTERN_CD%TYPE    /*패턴                  */                                               
    , v_cntCd        IN RTSD0070.CNT_CD%TYPE        /*본수                  */ 
    , v_procDay      IN RTSD0070.PROC_DAY%TYPE      /*장착일자              */                                                    
    , v_agencyCd     IN RTSD0070.AGENCY_CD%TYPE     /*대리점코드            */                                                      
    , v_agencyNm     IN RTSD0070.AGENCY_NM%TYPE     /*장착점                */                                                   
    , v_modelCd      IN RTSD0070.MODEL_CD%TYPE      /*차종코드              */                                             
    , v_modelNm      IN RTSD0070.MODEL_NM%TYPE      /*차종명                */                                           
    , v_carNo        IN RTSD0070.CAR_NO%TYPE        /*차량번호              */                                        
    , v_posCd        IN RTSD0070.POS_CD%TYPE        /*고객주소-우편번호     */                                         
    , v_addr1        IN RTSD0070.ADDR1%TYPE         /*고객주소-주소         */                                     
    , v_addr2        IN RTSD0070.ADDR2%TYPE         /*고객주소-상세주소     */                                       
    , v_chcRqsMnt    IN RTSD0070.CHC_RQS_MNT%TYPE   /*점검요청월            */                                                        
    , v_trnRsl       IN RTSD0070.TRN_RSL%TYPE       /*이관결과              */                                        
    , v_chargRodi    IN RTSD0070.CHARG_RODI%TYPE    /*담당로디안            */                                                        
    , v_reRentYn     IN RTSD0070.RE_RENT_YN%TYPE    /*재렌탈가능성고객      */                                                         
    , v_rgstDtl      IN RTSD0070.RGST_DTL%TYPE      /*접수내용              */                                          
    , v_prcsnRslts   IN RTSD0070.PRCSN_RSLTS%TYPE   /*처리결과              */                                                       
    , v_conHist      IN RTSD0070.CON_HIST%TYPE      /*컨택이력              */                                        
    , v_regId        IN RTSD0070.REG_ID%TYPE        /*등록자ID              */                          
    , v_clmDay       IN RTSD0070.CLM_DAY%TYPE        /*접수일자             */
    , v_clmSeq       OUT NUMBER                     /*일련번호              */ 
    , v_ErrorText    OUT VARCHAR2  


  ) RETURN NUMBER IS

  
    ln_CLM_SEQ    RTSD0070.CLM_SEQ%TYPE;

  BEGIN

    /*
     * 요청일련번호 획득
     */
    SELECT  NVL2(MAX(CLM_SEQ), TO_NUMBER(MAX(CLM_SEQ))+1, 1)
      INTO  ln_CLM_SEQ
      FROM  RTSD0070
     WHERE  CLM_DAY = v_clmDay;

    INSERT  INTO RTSD0070 (
          CLM_DAY
        , CLM_SEQ
        , CUST_NO
        , ORD_NO
        , CUST_NM
        , PRGRS_STATE
        , CLM_GB
        , CLM_TP
        , COUNS_ID
        , COUNS_NM
        , MOB_NO
        , ADD_MOB_NO
        , PETTERN_CD
        , CNT_CD
        , PROC_DAY
        , AGENCY_CD
        , AGENCY_NM
        , MODEL_CD
        , MODEL_NM
        , CAR_NO
        , POS_CD
        , ADDR1
        , ADDR2
        , CHC_RQS_MNT
        , TRN_RSL
        , CHARG_RODI
        , RE_RENT_YN
        , RGST_DTL
        , PRCSN_RSLTS
        , CON_HIST        
        , REG_ID
        , REG_DT
        , CHG_ID
        , CHG_DT
    ) VALUES (
          v_clmDay      /* 요청일자             */
        , ln_CLM_SEQ    /* 요청일련번호         */
        , v_custNo      /*고객번호              */                                        
        , v_ordNo       /*계약번호              */                                     
        , v_custNm      /*고객명                */                                           
        , v_prgrsState  /*처리상태              */
        , v_clmGb       /*방문점검구분          */
        , v_clmTp       /*방문점검유형          */
        , v_counsId     /*장착상담사ID          */                                               
        , v_counsNm     /*접수상담사            */                                                
        , v_mobNo       /*연락처                */                                       
        , v_addMobNo    /*컨텍연락처            */                                                
        , v_petternCd   /*패턴                  */                                               
        , v_cntCd       /*본수                  */ 
        , v_procDay     /*장착일자              */                                                    
        , v_agencyCd    /*대리점코드            */                                                      
        , v_agencyNm    /*장착점                */                                                   
        , v_modelCd     /*차종코드              */                                             
        , v_modelNm     /*차종명                */                                           
        , v_carNo       /*차량번호              */                                        
        , v_posCd       /*고객주소-우편번호     */                                         
        , v_addr1       /*고객주소-주소         */                                     
        , v_addr2       /*고객주소-상세주소     */                                       
        , v_chcRqsMnt   /*점검요청월            */                                                        
        , v_trnRsl      /*이관결과              */                                        
        , v_chargRodi   /*담당로디안            */                                                        
        , v_reRentYn    /*재렌탈가능성고객      */                                                         
        , v_rgstDtl     /*접수내용              */                                          
        , v_prcsnRslts  /*처리결과              */                                                       
        , v_conHist     /*컨택이력              */                                                                
        , v_regId       /* 등록자ID             */
        , SYSDATE
        , v_regId
        , SYSDATE
    );

    v_clmSeq := ln_CLM_SEQ;
   

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtsd0070;
/*****************************************************************************
  -- 클레임관리 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0070 (
      v_clmDay       IN RTSD0070.CLM_DAY%TYPE       /* 요청일자             */
    , v_clmSeq       IN RTSD0070.CLM_SEQ%TYPE       /* 요청일련번           */
    , v_custNo       IN RTSD0070.CUST_NO%TYPE       /*고객번호              */                                        
    , v_ordNo        IN RTSD0070.ORD_NO%TYPE        /*계약번호              */                                     
    , v_custNm       IN RTSD0070.CUST_NM%TYPE       /*고객명                */                                           
    , v_prgrsState   IN RTSD0070.PRGRS_STATE%TYPE   /*처리상태              */
    , v_clmGb        IN RTSD0070.CLM_GB%TYPE        /*방문점검구분          */
    , v_clmTp        IN RTSD0070.CLM_TP%TYPE        /*방문점검유형          */
    , v_counsId      IN RTSD0070.COUNS_ID%TYPE      /*장착상담사ID          */                                               
    , v_counsNm      IN RTSD0070.COUNS_NM%TYPE      /*접수상담사            */                                                
    , v_mobNo        IN RTSD0070.MOB_NO%TYPE        /*연락처                */                                       
    , v_addMobNo     IN RTSD0070.ADD_MOB_NO%TYPE    /*컨텍연락처            */                                                
    , v_petternCd    IN RTSD0070.PETTERN_CD%TYPE    /*패턴                  */                                               
    , v_cntCd        IN RTSD0070.CNT_CD%TYPE        /*본수                  */ 
    , v_procDay      IN RTSD0070.PROC_DAY%TYPE      /*장착일자              */                                                    
    , v_agencyCd     IN RTSD0070.AGENCY_CD%TYPE     /*대리점코드            */                                                      
    , v_agencyNm     IN RTSD0070.AGENCY_NM%TYPE     /*장착점                */                                                   
    , v_modelCd      IN RTSD0070.MODEL_CD%TYPE      /*차종코드              */                                             
    , v_modelNm      IN RTSD0070.MODEL_NM%TYPE      /*차종명                */                                           
    , v_carNo        IN RTSD0070.CAR_NO%TYPE        /*차량번호              */                                        
    , v_posCd        IN RTSD0070.POS_CD%TYPE        /*고객주소-우편번호     */                                         
    , v_addr1        IN RTSD0070.ADDR1%TYPE         /*고객주소-주소         */                                     
    , v_addr2        IN RTSD0070.ADDR2%TYPE         /*고객주소-상세주소     */                                       
    , v_chcRqsMnt    IN RTSD0070.CHC_RQS_MNT%TYPE   /*점검요청월            */                                                        
    , v_trnRsl       IN RTSD0070.TRN_RSL%TYPE       /*이관결과              */                                        
    , v_chargRodi    IN RTSD0070.CHARG_RODI%TYPE    /*담당로디안            */                                                        
    , v_reRentYn     IN RTSD0070.RE_RENT_YN%TYPE    /*재렌탈가능성고객      */                                                         
    , v_rgstDtl      IN RTSD0070.RGST_DTL%TYPE      /*접수내용              */                                          
    , v_prcsnRslts   IN RTSD0070.PRCSN_RSLTS%TYPE   /*처리결과              */                                                       
    , v_conHist      IN RTSD0070.CON_HIST%TYPE      /*컨택이력              */                                        
    , v_regId        IN RTSD0070.REG_ID%TYPE        /*등록자ID              */   
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTSD0070
       SET
           
            CUST_NO        =   v_custNo      /*고객번호              */                                        
          , ORD_NO         =   v_ordNo       /*계약번호              */                                     
          , CUST_NM        =   v_custNm      /*고객명                */                                           
          , PRGRS_STATE    =   v_prgrsState  /*처리상태              */
          , CLM_GB         =   v_clmGb       /*방문점검구분          */
          , CLM_TP         =   v_clmTp       /*방문점검유형          */
          , COUNS_ID       =   v_counsId     /*장착상담사ID          */                                               
          , COUNS_NM       =   v_counsNm     /*접수상담사            */                                                
          , MOB_NO         =   v_mobNo       /*연락처                */                                       
          , ADD_MOB_NO     =   v_addMobNo    /*컨텍연락처            */                                                
          , PETTERN_CD     =   v_petternCd   /*패턴                  */                                               
          , CNT_CD         =   v_cntCd       /*본수                  */ 
          , PROC_DAY       =   v_procDay     /*장착일자              */                                                    
          , AGENCY_CD      =   v_agencyCd    /*대리점코드            */                                                      
          , AGENCY_NM      =   v_agencyNm    /*장착점                */                                                   
          , MODEL_CD       =   v_modelCd     /*차종코드              */                                             
          , MODEL_NM       =   v_modelNm     /*차종명                */                                           
          , CAR_NO         =   v_carNo       /*차량번호              */                                        
          , POS_CD         =   v_posCd       /*고객주소-우편번호     */                                         
          , ADDR1          =   v_addr1       /*고객주소-주소         */                                     
          , ADDR2          =   v_addr2       /*고객주소-상세주소     */                                       
          , CHC_RQS_MNT    =   v_chcRqsMnt   /*점검요청월            */                                                        
          , TRN_RSL        =   v_trnRsl      /*이관결과              */                                        
          , CHARG_RODI     =   v_chargRodi   /*담당로디안            */                                                        
          , RE_RENT_YN     =   v_reRentYn    /*재렌탈가능성고객      */                                                         
          , RGST_DTL       =   v_rgstDtl     /*접수내용              */                                          
          , PRCSN_RSLTS    =   v_prcsnRslts  /*처리결과              */                                                       
          , CON_HIST       =   v_conHist     /*컨택이력              */                                                                
          , CHG_ID      = v_regId
          , CHG_DT      = SYSDATE
     WHERE  CLM_DAY     = v_clmDay
       AND  CLM_SEQ     = v_clmSeq
    ;

    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0070;
  
  
     /*****************************************************************************
  -- 클레임  관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0070 (
      v_comm_Dvsn    IN CHAR                        /* 처리구분(I,U,D)      */
    , v_clmDay       IN RTSD0070.CLM_DAY%TYPE       /* 요청일자             */
    , v_clmSeq   IN OUT RTSD0070.CLM_SEQ%TYPE       /* 요청일련번           */
    , v_custNo       IN RTSD0070.CUST_NO%TYPE       /*고객번호              */                                        
    , v_ordNo        IN RTSD0070.ORD_NO%TYPE        /*계약번호              */                                     
    , v_custNm       IN RTSD0070.CUST_NM%TYPE       /*고객명                */                                           
    , v_prgrsState   IN RTSD0070.PRGRS_STATE%TYPE   /*처리상태              */
    , v_clmGb        IN RTSD0070.CLM_GB%TYPE        /*방문점검구분          */
    , v_clmTp        IN RTSD0070.CLM_TP%TYPE        /*방문점검유형          */
    , v_counsId      IN RTSD0070.COUNS_ID%TYPE      /*장착상담사ID          */                                               
    , v_counsNm      IN RTSD0070.COUNS_NM%TYPE      /*접수상담사            */                                                
    , v_mobNo        IN RTSD0070.MOB_NO%TYPE        /*연락처                */                                       
    , v_addMobNo     IN RTSD0070.ADD_MOB_NO%TYPE    /*컨텍연락처            */                                                
    , v_petternCd    IN RTSD0070.PETTERN_CD%TYPE    /*패턴                  */                                               
    , v_cntCd        IN RTSD0070.CNT_CD%TYPE        /*본수                  */ 
    , v_procDay      IN RTSD0070.PROC_DAY%TYPE      /*장착일자              */                                                    
    , v_agencyCd     IN RTSD0070.AGENCY_CD%TYPE     /*대리점코드            */                                                      
    , v_agencyNm     IN RTSD0070.AGENCY_NM%TYPE     /*장착점                */                                                   
    , v_modelCd      IN RTSD0070.MODEL_CD%TYPE      /*차종코드              */                                             
    , v_modelNm      IN RTSD0070.MODEL_NM%TYPE      /*차종명                */                                           
    , v_carNo        IN RTSD0070.CAR_NO%TYPE        /*차량번호              */                                        
    , v_posCd        IN RTSD0070.POS_CD%TYPE        /*고객주소-우편번호     */                                         
    , v_addr1        IN RTSD0070.ADDR1%TYPE         /*고객주소-주소         */                                     
    , v_addr2        IN RTSD0070.ADDR2%TYPE         /*고객주소-상세주소     */                                       
    , v_chcRqsMnt    IN RTSD0070.CHC_RQS_MNT%TYPE   /*점검요청월            */                                                        
    , v_trnRsl       IN RTSD0070.TRN_RSL%TYPE       /*이관결과              */                                        
    , v_chargRodi    IN RTSD0070.CHARG_RODI%TYPE    /*담당로디안            */                                                        
    , v_reRentYn     IN RTSD0070.RE_RENT_YN%TYPE    /*재렌탈가능성고객      */                                                         
    , v_rgstDtl      IN RTSD0070.RGST_DTL%TYPE      /*접수내용              */                                          
    , v_prcsnRslts   IN RTSD0070.PRCSN_RSLTS%TYPE   /*처리결과              */                                                       
    , v_conHist      IN RTSD0070.CON_HIST%TYPE      /*컨택이력              */                                        
    , v_regId        IN RTSD0070.REG_ID%TYPE        /*등록자ID              */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2   
  ) IS

    e_Error EXCEPTION;
  BEGIN
  
    -- 필수값 확인
    IF TRIM(v_custNo) IS NULL THEN
        v_Return_Message := '고객번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_ordNo) IS NULL THEN
        v_Return_Message := '계약번호 : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_clmTp) IS NULL THEN
        v_Return_Message := '클레임유형 : 필수 선택값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
        IF 0 != f_InsertRtsd0070 (
              v_custNo         /*고객번호              */                                        
            , v_ordNo          /*계약번호              */                                     
            , v_custNm         /*고객명                */                                           
            , v_prgrsState     /*처리상태              */
            , v_clmGb          /*방문점검구분          */
            , v_clmTp          /*방문점검유형          */
            , v_counsId        /*장착상담사ID          */                                               
            , v_counsNm        /*접수상담사            */                                                
            , v_mobNo          /*연락처                */                                       
            , v_addMobNo       /*컨텍연락처            */                                                
            , v_petternCd      /*패턴                  */                                               
            , v_cntCd          /*본수                  */ 
            , v_procDay        /*장착일자              */                                                    
            , v_agencyCd       /*대리점코드            */                                                      
            , v_agencyNm       /*장착점                */                                                   
            , v_modelCd        /*차종코드              */                                             
            , v_modelNm        /*차종명                */                                           
            , v_carNo          /*차량번호              */                                        
            , v_posCd          /*고객주소-우편번호     */                                         
            , v_addr1          /*고객주소-주소         */                                     
            , v_addr2          /*고객주소-상세주소     */                                       
            , v_chcRqsMnt      /*점검요청월            */                                                        
            , v_trnRsl         /*이관결과              */                                        
            , v_chargRodi      /*담당로디안            */                                                        
            , v_reRentYn       /*재렌탈가능성고객      */                                                         
            , v_rgstDtl        /*접수내용              */                                          
            , v_prcsnRslts     /*처리결과              */                                                       
            , v_conHist        /*컨택이력              */                                        
            , v_regId          /*등록자ID              */                          
            , v_clmDay          /*접수일자             */
            , v_clmSeq         /*일련번호              */ 
            , v_ErrorText                                  
        ) THEN
            v_Return_Message := '클레임 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;            

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtsd0070 (
              v_clmDay          /* 요청일자             */
            , v_clmSeq          /* 요청일련번           */
            , v_custNo          /*고객번호              */                                        
            , v_ordNo           /*계약번호              */                                     
            , v_custNm          /*고객명                */                                           
            , v_prgrsState      /*처리상태              */
            , v_clmGb           /*방문점검구분          */
            , v_clmTp           /*방문점검유형          */
            , v_counsId         /*장착상담사ID          */                                               
            , v_counsNm         /*접수상담사            */                                                
            , v_mobNo           /*연락처                */                                       
            , v_addMobNo        /*컨텍연락처            */                                                
            , v_petternCd       /*패턴                  */                                               
            , v_cntCd           /*본수                  */ 
            , v_procDay         /*장착일자              */                                                    
            , v_agencyCd        /*대리점코드            */                                                      
            , v_agencyNm        /*장착점                */                                                   
            , v_modelCd         /*차종코드              */                                             
            , v_modelNm         /*차종명                */                                           
            , v_carNo           /*차량번호              */                                        
            , v_posCd           /*고객주소-우편번호     */                                         
            , v_addr1           /*고객주소-주소         */                                     
            , v_addr2           /*고객주소-상세주소     */                                       
            , v_chcRqsMnt       /*점검요청월            */                                                        
            , v_trnRsl          /*이관결과              */                                        
            , v_chargRodi       /*담당로디안            */                                                        
            , v_reRentYn        /*재렌탈가능성고객      */                                                         
            , v_rgstDtl         /*접수내용              */                                          
            , v_prcsnRslts      /*처리결과              */                                                       
            , v_conHist         /*컨택이력              */                                        
            , v_regId           /*등록자ID              */   
            , v_ErrorText                                    
        ) THEN
            v_Return_Message := '클레임 정보 수정 실패!!!'||'-'||v_ErrorText;
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
        v_Success_code   := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0070.p_IUDRtsdRTSD0070(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code   := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0070.p_IUDRtsdRTSD0070(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0070;
        
  
END Pkg_Rtsd0070;