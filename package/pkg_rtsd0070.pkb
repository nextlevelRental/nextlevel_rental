CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0070 AS
/*******************************************************************************
    NAME    : Pkg_Rtre0210
    PURPOSE : ���������� ������ȸ
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.0        2018-12-19  han             1. Created this package body.
 *******************************************************************************/

/*******************************************************************************
 -- Ŭ���Ӱ�����ȸ Select
 *******************************************************************************/
     PROCEDURE p_sRtsd0070Status (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_clm_FDay       IN RTSD0070.CLM_DAY%TYPE              /*��������FROM          */
    , v_clm_TDay       IN RTSD0070.CLM_DAY%TYPE              /*��������TO            */
    , v_clm_Gb         IN RTSD0070.CLM_GB%TYPE               /*�湮���˱���          */
    , v_prgrs_State    IN RTSD0070.PRGRS_STATE%TYPE          /*ó������              */
    , v_ord_No         IN RTSD0070.ORD_NO%TYPE               /*����ȣ              */
    , v_cust_No        IN RTSD0070.CUST_NO%TYPE              /*����ȣ              */
    ) IS


  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.CLM_DAY                                                                     /*��������              */                                                                            
          , A.CLM_SEQ                                                                     /*�Ϸù�ȣ              */                                                                        
          , A.CUST_NO                                                                     /*����ȣ              */                                                                     
          , A.ORD_NO                                                                      /*����ȣ              */                                                                       
          , A.CUST_NM                                                                     /*����                */                                                                     
          , A.PRGRS_STATE                                                                 /*ó������              */                                                               
          , Pkg_Rtcm0051.f_sRtcm0051Codename('C027',A.PRGRS_STATE)  AS PRGRS_STATE_NM     /*��������̸�          */                                                                                                                                                          
          , A.CLM_GB                                                                      /*�湮���˱���          */                                                                    
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S230',A.CLM_GB)       AS CLM_GB_NM          /*�湮���˱����̸�      */                                                                                                                                          
          , A.CLM_TP                                                                      /*�湮��������          */                                                                
          , CASE WHEN A.CLM_GB = 'P' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S232', A.CLM_TP)
                 WHEN A.CLM_GB = 'V' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S231', A.CLM_TP)
                 ELSE ''
                 END AS CLM_TP_NM                                                         /*�湮���������̸�      */                                                                                                                                            
          , A.COUNS_ID                                                                    /*��������ID          */                                                                  
          , A.COUNS_NM                                                                    /*��������            */                                                                       
          , A.MOB_NO                                                                      /*����ó                */                                      
          , A.ADD_MOB_NO                                                                  /*���ؿ���ó            */                                          
          , A.PETTERN_CD                                                                  /*����                  */                            
          , A.CNT_CD                                                                      /*����                  */                    
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S022',A.CNT_CD)       AS CNT_NM             /*�����̸�              */                                                                                                 
          , A.PROC_DAY                                                                    /*��������              */                      
          , A.AGENCY_CD                                                                   /*�븮���ڵ�            */                                 
          , A.AGENCY_NM                                                                   /*������                */                          
          , A.MODEL_CD                                                                    /*�����ڵ�              */                                           
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S002',A.MODEL_CD)       AS MODEL_NM         /*������                */                                             
          , A.CAR_NO                                                                      /*������ȣ              */                        
          , A.POS_CD                                                                      /*���ּ�-�����ȣ     */                                
          , A.ADDR1                                                                       /*���ּ�-�ּ�         */                     
          , A.ADDR2                                                                       /*���ּ�-���ּ�     */                                   
          , A.CHC_RQS_MNT                                                                 /*���˿�û��            */                                                         
          , A.TRN_RSL                                                                     /*�̰����              */                                          
          , A.CHARG_RODI                                                                  /*���ε��            */                                                         
          , A.RE_RENT_YN                                                                  /*�緻Ż���ɼ���      */                                                            
          , A.RGST_DTL                                                                    /*��������              */                                                 
          , A.PRCSN_RSLTS                                                                 /*ó�����              */                                                      
          , A.CON_HIST                                                                    /*�����̷�              */                                              
          , A.REG_DT                                                                      /*�����                */                                           
          , A.REG_ID                                                                      /*�����ID              */                                                  
          , A.CHG_ID                                                                      /*������ID              */                                                        
          , A.CHG_DT                                                                      /*������                */   
    FROM    RTSD0070 A
    WHERE   (v_clm_FDay IS NULL OR (v_clm_FDay IS NOT NULL AND A.CLM_DAY BETWEEN v_clm_FDay AND v_clm_TDay)) /*��������FROM~TO */
    AND     A.CLM_GB        = DECODE(v_clm_Gb, NULL, A.CLM_GB, v_clm_Gb)                  /*�湮���˱���          */                                                                                                                 
    AND     A.PRGRS_STATE   = DECODE(v_prgrs_State , NULL, A.PRGRS_STATE , v_prgrs_State) /*ó������              */                                                                                                               
    AND     A.ORD_NO        = DECODE(v_ord_No      , NULL, A.ORD_NO      , v_ord_No)      /*�ֹ���ȣ              */                                                                                                     
    AND     A.CUST_NO       = DECODE(v_cust_No     , NULL, A.CUST_NO     , v_cust_No);    /*����ȣ              */        
    
  END p_sRtsd0070Status;

/*******************************************************************************
 -- Ŭ���Ӱ�����ȸ Select ����ȣ�� ��ȸ
 *******************************************************************************/
     PROCEDURE p_sRtsd0070StatusCust (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_cust_No        IN RTSD0070.CUST_NO%TYPE              /*����ȣ              */
    ) IS


  BEGIN
    OPEN Ref_Cursor FOR
    SELECT  A.CLM_DAY                                                                     /*��������              */                                                                            
          , A.CLM_SEQ                                                                     /*�Ϸù�ȣ              */                                                                        
          , A.CUST_NO                                                                     /*����ȣ              */                                                                     
          , A.ORD_NO                                                                      /*����ȣ              */                                                                       
          , A.CUST_NM                                                                     /*����                */                                                                     
          , A.PRGRS_STATE                                                                 /*ó������              */                                                               
          , Pkg_Rtcm0051.f_sRtcm0051Codename('C027',A.PRGRS_STATE)  AS PRGRS_STATE_NM     /*��������̸�          */                                                                                                                                                          
          , A.CLM_GB                                                                      /*�湮���˱���          */                                                                    
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S230',A.CLM_GB)       AS CLM_GB_NM          /*�湮���˱����̸�      */                                                                                                                                          
          , A.CLM_TP                                                                      /*�湮��������          */                                                                
          , CASE WHEN A.CLM_GB = 'P' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S232', A.CLM_TP)
                 WHEN A.CLM_GB = 'V' THEN Pkg_Rtcm0051.f_sRtcm0051Codename('S231', A.CLM_TP)
                 ELSE ''
                 END AS CLM_TP_NM                                                         /*�湮���������̸�      */                                                                                                                                            
          , A.COUNS_ID                                                                    /*��������ID          */                                                                  
          , A.COUNS_NM                                                                    /*��������            */                                                                       
          , A.MOB_NO                                                                      /*����ó                */                                      
          , A.ADD_MOB_NO                                                                  /*���ؿ���ó            */                                          
          , A.PETTERN_CD                                                                  /*����                  */                            
          , A.CNT_CD                                                                      /*����                  */                    
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S022',A.CNT_CD)       AS CNT_NM             /*�����̸�              */                                                                                                 
          , A.PROC_DAY                                                                    /*��������              */                      
          , A.AGENCY_CD                                                                   /*�븮���ڵ�            */                                 
          , A.AGENCY_NM                                                                   /*������                */                          
          , A.MODEL_CD                                                                    /*�����ڵ�              */                                           
          , Pkg_Rtcm0051.f_sRtcm0051Codename('S002',A.MODEL_CD)       AS MODEL_NM         /*������                */                                             
          , A.CAR_NO                                                                      /*������ȣ              */                        
          , A.POS_CD                                                                      /*���ּ�-�����ȣ     */                                
          , A.ADDR1                                                                       /*���ּ�-�ּ�         */                     
          , A.ADDR2                                                                       /*���ּ�-���ּ�     */                                   
          , A.CHC_RQS_MNT                                                                 /*���˿�û��            */                                                         
          , A.TRN_RSL                                                                     /*�̰����              */                                          
          , A.CHARG_RODI                                                                  /*���ε��            */                                                         
          , A.RE_RENT_YN                                                                  /*�緻Ż���ɼ���      */                                                            
          , A.RGST_DTL                                                                    /*��������              */                                                 
          , A.PRCSN_RSLTS                                                                 /*ó�����              */                                                      
          , A.CON_HIST                                                                    /*�����̷�              */                                              
          , A.REG_DT                                                                      /*�����                */                                           
          , A.REG_ID                                                                      /*�����ID              */                                                  
          , A.CHG_ID                                                                      /*������ID              */                                                        
          , A.CHG_DT                                                                      /*������                */
          , '1' AS TEMP   
    FROM    RTSD0070 A
           ,RTSD0100 B
    WHERE   1=1                                                                                                     
    AND     B.CUST_NO       = DECODE(v_cust_No     , NULL, A.CUST_NO     , v_cust_No)     /*����ȣ              */        
    AND     B.CUST_NO = A.CUST_NO(+);
    
  END p_sRtsd0070StatusCust;

  
 /*****************************************************************************
  -- Ŭ���Ӱ��� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0070 (
      v_custNo       IN RTSD0070.CUST_NO%TYPE       /*����ȣ              */                                        
    , v_ordNo        IN RTSD0070.ORD_NO%TYPE        /*����ȣ              */                                     
    , v_custNm       IN RTSD0070.CUST_NM%TYPE       /*����                */                                           
    , v_prgrsState   IN RTSD0070.PRGRS_STATE%TYPE   /*ó������              */
    , v_clmGb        IN RTSD0070.CLM_GB%TYPE        /*�湮���˱���          */
    , v_clmTp        IN RTSD0070.CLM_TP%TYPE        /*�湮��������          */
    , v_counsId      IN RTSD0070.COUNS_ID%TYPE      /*��������ID          */                                               
    , v_counsNm      IN RTSD0070.COUNS_NM%TYPE      /*��������            */                                                
    , v_mobNo        IN RTSD0070.MOB_NO%TYPE        /*����ó                */                                       
    , v_addMobNo     IN RTSD0070.ADD_MOB_NO%TYPE    /*���ؿ���ó            */                                                
    , v_petternCd    IN RTSD0070.PETTERN_CD%TYPE    /*����                  */                                               
    , v_cntCd        IN RTSD0070.CNT_CD%TYPE        /*����                  */ 
    , v_procDay      IN RTSD0070.PROC_DAY%TYPE      /*��������              */                                                    
    , v_agencyCd     IN RTSD0070.AGENCY_CD%TYPE     /*�븮���ڵ�            */                                                      
    , v_agencyNm     IN RTSD0070.AGENCY_NM%TYPE     /*������                */                                                   
    , v_modelCd      IN RTSD0070.MODEL_CD%TYPE      /*�����ڵ�              */                                             
    , v_modelNm      IN RTSD0070.MODEL_NM%TYPE      /*������                */                                           
    , v_carNo        IN RTSD0070.CAR_NO%TYPE        /*������ȣ              */                                        
    , v_posCd        IN RTSD0070.POS_CD%TYPE        /*���ּ�-�����ȣ     */                                         
    , v_addr1        IN RTSD0070.ADDR1%TYPE         /*���ּ�-�ּ�         */                                     
    , v_addr2        IN RTSD0070.ADDR2%TYPE         /*���ּ�-���ּ�     */                                       
    , v_chcRqsMnt    IN RTSD0070.CHC_RQS_MNT%TYPE   /*���˿�û��            */                                                        
    , v_trnRsl       IN RTSD0070.TRN_RSL%TYPE       /*�̰����              */                                        
    , v_chargRodi    IN RTSD0070.CHARG_RODI%TYPE    /*���ε��            */                                                        
    , v_reRentYn     IN RTSD0070.RE_RENT_YN%TYPE    /*�緻Ż���ɼ���      */                                                         
    , v_rgstDtl      IN RTSD0070.RGST_DTL%TYPE      /*��������              */                                          
    , v_prcsnRslts   IN RTSD0070.PRCSN_RSLTS%TYPE   /*ó�����              */                                                       
    , v_conHist      IN RTSD0070.CON_HIST%TYPE      /*�����̷�              */                                        
    , v_regId        IN RTSD0070.REG_ID%TYPE        /*�����ID              */                          
    , v_clmDay       IN RTSD0070.CLM_DAY%TYPE        /*��������             */
    , v_clmSeq       OUT NUMBER                     /*�Ϸù�ȣ              */ 
    , v_ErrorText    OUT VARCHAR2  


  ) RETURN NUMBER IS

  
    ln_CLM_SEQ    RTSD0070.CLM_SEQ%TYPE;

  BEGIN

    /*
     * ��û�Ϸù�ȣ ȹ��
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
          v_clmDay      /* ��û����             */
        , ln_CLM_SEQ    /* ��û�Ϸù�ȣ         */
        , v_custNo      /*����ȣ              */                                        
        , v_ordNo       /*����ȣ              */                                     
        , v_custNm      /*����                */                                           
        , v_prgrsState  /*ó������              */
        , v_clmGb       /*�湮���˱���          */
        , v_clmTp       /*�湮��������          */
        , v_counsId     /*��������ID          */                                               
        , v_counsNm     /*��������            */                                                
        , v_mobNo       /*����ó                */                                       
        , v_addMobNo    /*���ؿ���ó            */                                                
        , v_petternCd   /*����                  */                                               
        , v_cntCd       /*����                  */ 
        , v_procDay     /*��������              */                                                    
        , v_agencyCd    /*�븮���ڵ�            */                                                      
        , v_agencyNm    /*������                */                                                   
        , v_modelCd     /*�����ڵ�              */                                             
        , v_modelNm     /*������                */                                           
        , v_carNo       /*������ȣ              */                                        
        , v_posCd       /*���ּ�-�����ȣ     */                                         
        , v_addr1       /*���ּ�-�ּ�         */                                     
        , v_addr2       /*���ּ�-���ּ�     */                                       
        , v_chcRqsMnt   /*���˿�û��            */                                                        
        , v_trnRsl      /*�̰����              */                                        
        , v_chargRodi   /*���ε��            */                                                        
        , v_reRentYn    /*�緻Ż���ɼ���      */                                                         
        , v_rgstDtl     /*��������              */                                          
        , v_prcsnRslts  /*ó�����              */                                                       
        , v_conHist     /*�����̷�              */                                                                
        , v_regId       /* �����ID             */
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
  -- Ŭ���Ӱ��� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0070 (
      v_clmDay       IN RTSD0070.CLM_DAY%TYPE       /* ��û����             */
    , v_clmSeq       IN RTSD0070.CLM_SEQ%TYPE       /* ��û�Ϸù�           */
    , v_custNo       IN RTSD0070.CUST_NO%TYPE       /*����ȣ              */                                        
    , v_ordNo        IN RTSD0070.ORD_NO%TYPE        /*����ȣ              */                                     
    , v_custNm       IN RTSD0070.CUST_NM%TYPE       /*����                */                                           
    , v_prgrsState   IN RTSD0070.PRGRS_STATE%TYPE   /*ó������              */
    , v_clmGb        IN RTSD0070.CLM_GB%TYPE        /*�湮���˱���          */
    , v_clmTp        IN RTSD0070.CLM_TP%TYPE        /*�湮��������          */
    , v_counsId      IN RTSD0070.COUNS_ID%TYPE      /*��������ID          */                                               
    , v_counsNm      IN RTSD0070.COUNS_NM%TYPE      /*��������            */                                                
    , v_mobNo        IN RTSD0070.MOB_NO%TYPE        /*����ó                */                                       
    , v_addMobNo     IN RTSD0070.ADD_MOB_NO%TYPE    /*���ؿ���ó            */                                                
    , v_petternCd    IN RTSD0070.PETTERN_CD%TYPE    /*����                  */                                               
    , v_cntCd        IN RTSD0070.CNT_CD%TYPE        /*����                  */ 
    , v_procDay      IN RTSD0070.PROC_DAY%TYPE      /*��������              */                                                    
    , v_agencyCd     IN RTSD0070.AGENCY_CD%TYPE     /*�븮���ڵ�            */                                                      
    , v_agencyNm     IN RTSD0070.AGENCY_NM%TYPE     /*������                */                                                   
    , v_modelCd      IN RTSD0070.MODEL_CD%TYPE      /*�����ڵ�              */                                             
    , v_modelNm      IN RTSD0070.MODEL_NM%TYPE      /*������                */                                           
    , v_carNo        IN RTSD0070.CAR_NO%TYPE        /*������ȣ              */                                        
    , v_posCd        IN RTSD0070.POS_CD%TYPE        /*���ּ�-�����ȣ     */                                         
    , v_addr1        IN RTSD0070.ADDR1%TYPE         /*���ּ�-�ּ�         */                                     
    , v_addr2        IN RTSD0070.ADDR2%TYPE         /*���ּ�-���ּ�     */                                       
    , v_chcRqsMnt    IN RTSD0070.CHC_RQS_MNT%TYPE   /*���˿�û��            */                                                        
    , v_trnRsl       IN RTSD0070.TRN_RSL%TYPE       /*�̰����              */                                        
    , v_chargRodi    IN RTSD0070.CHARG_RODI%TYPE    /*���ε��            */                                                        
    , v_reRentYn     IN RTSD0070.RE_RENT_YN%TYPE    /*�緻Ż���ɼ���      */                                                         
    , v_rgstDtl      IN RTSD0070.RGST_DTL%TYPE      /*��������              */                                          
    , v_prcsnRslts   IN RTSD0070.PRCSN_RSLTS%TYPE   /*ó�����              */                                                       
    , v_conHist      IN RTSD0070.CON_HIST%TYPE      /*�����̷�              */                                        
    , v_regId        IN RTSD0070.REG_ID%TYPE        /*�����ID              */   
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS

  BEGIN

    UPDATE  RTSD0070
       SET
           
            CUST_NO        =   v_custNo      /*����ȣ              */                                        
          , ORD_NO         =   v_ordNo       /*����ȣ              */                                     
          , CUST_NM        =   v_custNm      /*����                */                                           
          , PRGRS_STATE    =   v_prgrsState  /*ó������              */
          , CLM_GB         =   v_clmGb       /*�湮���˱���          */
          , CLM_TP         =   v_clmTp       /*�湮��������          */
          , COUNS_ID       =   v_counsId     /*��������ID          */                                               
          , COUNS_NM       =   v_counsNm     /*��������            */                                                
          , MOB_NO         =   v_mobNo       /*����ó                */                                       
          , ADD_MOB_NO     =   v_addMobNo    /*���ؿ���ó            */                                                
          , PETTERN_CD     =   v_petternCd   /*����                  */                                               
          , CNT_CD         =   v_cntCd       /*����                  */ 
          , PROC_DAY       =   v_procDay     /*��������              */                                                    
          , AGENCY_CD      =   v_agencyCd    /*�븮���ڵ�            */                                                      
          , AGENCY_NM      =   v_agencyNm    /*������                */                                                   
          , MODEL_CD       =   v_modelCd     /*�����ڵ�              */                                             
          , MODEL_NM       =   v_modelNm     /*������                */                                           
          , CAR_NO         =   v_carNo       /*������ȣ              */                                        
          , POS_CD         =   v_posCd       /*���ּ�-�����ȣ     */                                         
          , ADDR1          =   v_addr1       /*���ּ�-�ּ�         */                                     
          , ADDR2          =   v_addr2       /*���ּ�-���ּ�     */                                       
          , CHC_RQS_MNT    =   v_chcRqsMnt   /*���˿�û��            */                                                        
          , TRN_RSL        =   v_trnRsl      /*�̰����              */                                        
          , CHARG_RODI     =   v_chargRodi   /*���ε��            */                                                        
          , RE_RENT_YN     =   v_reRentYn    /*�緻Ż���ɼ���      */                                                         
          , RGST_DTL       =   v_rgstDtl     /*��������              */                                          
          , PRCSN_RSLTS    =   v_prcsnRslts  /*ó�����              */                                                       
          , CON_HIST       =   v_conHist     /*�����̷�              */                                                                
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
  -- Ŭ����  ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0070 (
      v_comm_Dvsn    IN CHAR                        /* ó������(I,U,D)      */
    , v_clmDay       IN RTSD0070.CLM_DAY%TYPE       /* ��û����             */
    , v_clmSeq   IN OUT RTSD0070.CLM_SEQ%TYPE       /* ��û�Ϸù�           */
    , v_custNo       IN RTSD0070.CUST_NO%TYPE       /*����ȣ              */                                        
    , v_ordNo        IN RTSD0070.ORD_NO%TYPE        /*����ȣ              */                                     
    , v_custNm       IN RTSD0070.CUST_NM%TYPE       /*����                */                                           
    , v_prgrsState   IN RTSD0070.PRGRS_STATE%TYPE   /*ó������              */
    , v_clmGb        IN RTSD0070.CLM_GB%TYPE        /*�湮���˱���          */
    , v_clmTp        IN RTSD0070.CLM_TP%TYPE        /*�湮��������          */
    , v_counsId      IN RTSD0070.COUNS_ID%TYPE      /*��������ID          */                                               
    , v_counsNm      IN RTSD0070.COUNS_NM%TYPE      /*��������            */                                                
    , v_mobNo        IN RTSD0070.MOB_NO%TYPE        /*����ó                */                                       
    , v_addMobNo     IN RTSD0070.ADD_MOB_NO%TYPE    /*���ؿ���ó            */                                                
    , v_petternCd    IN RTSD0070.PETTERN_CD%TYPE    /*����                  */                                               
    , v_cntCd        IN RTSD0070.CNT_CD%TYPE        /*����                  */ 
    , v_procDay      IN RTSD0070.PROC_DAY%TYPE      /*��������              */                                                    
    , v_agencyCd     IN RTSD0070.AGENCY_CD%TYPE     /*�븮���ڵ�            */                                                      
    , v_agencyNm     IN RTSD0070.AGENCY_NM%TYPE     /*������                */                                                   
    , v_modelCd      IN RTSD0070.MODEL_CD%TYPE      /*�����ڵ�              */                                             
    , v_modelNm      IN RTSD0070.MODEL_NM%TYPE      /*������                */                                           
    , v_carNo        IN RTSD0070.CAR_NO%TYPE        /*������ȣ              */                                        
    , v_posCd        IN RTSD0070.POS_CD%TYPE        /*���ּ�-�����ȣ     */                                         
    , v_addr1        IN RTSD0070.ADDR1%TYPE         /*���ּ�-�ּ�         */                                     
    , v_addr2        IN RTSD0070.ADDR2%TYPE         /*���ּ�-���ּ�     */                                       
    , v_chcRqsMnt    IN RTSD0070.CHC_RQS_MNT%TYPE   /*���˿�û��            */                                                        
    , v_trnRsl       IN RTSD0070.TRN_RSL%TYPE       /*�̰����              */                                        
    , v_chargRodi    IN RTSD0070.CHARG_RODI%TYPE    /*���ε��            */                                                        
    , v_reRentYn     IN RTSD0070.RE_RENT_YN%TYPE    /*�緻Ż���ɼ���      */                                                         
    , v_rgstDtl      IN RTSD0070.RGST_DTL%TYPE      /*��������              */                                          
    , v_prcsnRslts   IN RTSD0070.PRCSN_RSLTS%TYPE   /*ó�����              */                                                       
    , v_conHist      IN RTSD0070.CON_HIST%TYPE      /*�����̷�              */                                        
    , v_regId        IN RTSD0070.REG_ID%TYPE        /*�����ID              */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2   
  ) IS

    e_Error EXCEPTION;
  BEGIN
  
    -- �ʼ��� Ȯ��
    IF TRIM(v_custNo) IS NULL THEN
        v_Return_Message := '����ȣ : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_ordNo) IS NULL THEN
        v_Return_Message := '����ȣ : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_clmTp) IS NULL THEN
        v_Return_Message := 'Ŭ�������� : �ʼ� ���ð� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
        IF 0 != f_InsertRtsd0070 (
              v_custNo         /*����ȣ              */                                        
            , v_ordNo          /*����ȣ              */                                     
            , v_custNm         /*����                */                                           
            , v_prgrsState     /*ó������              */
            , v_clmGb          /*�湮���˱���          */
            , v_clmTp          /*�湮��������          */
            , v_counsId        /*��������ID          */                                               
            , v_counsNm        /*��������            */                                                
            , v_mobNo          /*����ó                */                                       
            , v_addMobNo       /*���ؿ���ó            */                                                
            , v_petternCd      /*����                  */                                               
            , v_cntCd          /*����                  */ 
            , v_procDay        /*��������              */                                                    
            , v_agencyCd       /*�븮���ڵ�            */                                                      
            , v_agencyNm       /*������                */                                                   
            , v_modelCd        /*�����ڵ�              */                                             
            , v_modelNm        /*������                */                                           
            , v_carNo          /*������ȣ              */                                        
            , v_posCd          /*���ּ�-�����ȣ     */                                         
            , v_addr1          /*���ּ�-�ּ�         */                                     
            , v_addr2          /*���ּ�-���ּ�     */                                       
            , v_chcRqsMnt      /*���˿�û��            */                                                        
            , v_trnRsl         /*�̰����              */                                        
            , v_chargRodi      /*���ε��            */                                                        
            , v_reRentYn       /*�緻Ż���ɼ���      */                                                         
            , v_rgstDtl        /*��������              */                                          
            , v_prcsnRslts     /*ó�����              */                                                       
            , v_conHist        /*�����̷�              */                                        
            , v_regId          /*�����ID              */                          
            , v_clmDay          /*��������             */
            , v_clmSeq         /*�Ϸù�ȣ              */ 
            , v_ErrorText                                  
        ) THEN
            v_Return_Message := 'Ŭ���� ���� ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;            

    ELSIF v_Comm_Dvsn = 'U' THEN

        IF 0 != f_UpdateRtsd0070 (
              v_clmDay          /* ��û����             */
            , v_clmSeq          /* ��û�Ϸù�           */
            , v_custNo          /*����ȣ              */                                        
            , v_ordNo           /*����ȣ              */                                     
            , v_custNm          /*����                */                                           
            , v_prgrsState      /*ó������              */
            , v_clmGb           /*�湮���˱���          */
            , v_clmTp           /*�湮��������          */
            , v_counsId         /*��������ID          */                                               
            , v_counsNm         /*��������            */                                                
            , v_mobNo           /*����ó                */                                       
            , v_addMobNo        /*���ؿ���ó            */                                                
            , v_petternCd       /*����                  */                                               
            , v_cntCd           /*����                  */ 
            , v_procDay         /*��������              */                                                    
            , v_agencyCd        /*�븮���ڵ�            */                                                      
            , v_agencyNm        /*������                */                                                   
            , v_modelCd         /*�����ڵ�              */                                             
            , v_modelNm         /*������                */                                           
            , v_carNo           /*������ȣ              */                                        
            , v_posCd           /*���ּ�-�����ȣ     */                                         
            , v_addr1           /*���ּ�-�ּ�         */                                     
            , v_addr2           /*���ּ�-���ּ�     */                                       
            , v_chcRqsMnt       /*���˿�û��            */                                                        
            , v_trnRsl          /*�̰����              */                                        
            , v_chargRodi       /*���ε��            */                                                        
            , v_reRentYn        /*�緻Ż���ɼ���      */                                                         
            , v_rgstDtl         /*��������              */                                          
            , v_prcsnRslts      /*ó�����              */                                                       
            , v_conHist         /*�����̷�              */                                        
            , v_regId           /*�����ID              */   
            , v_ErrorText                                    
        ) THEN
            v_Return_Message := 'Ŭ���� ���� ���� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;

    END IF;

    v_Success_code   := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
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
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('PKG_RTSD0070.p_IUDRtsdRTSD0070(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0070;
        
  
END Pkg_Rtsd0070;
/
