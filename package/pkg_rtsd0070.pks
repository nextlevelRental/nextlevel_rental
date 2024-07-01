CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0070 AS
/******************************************************************************
   NAME:       PKG_RTSD0070
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-12-18      han       1. Created this package.
******************************************************************************/
 /*****************************************************************************
  -- Ŭ���Ӱ��� Select - Ŭ���Ӱ���
  *****************************************************************************/
PROCEDURE p_sRtsd0070Status (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_clm_FDay       IN RTSD0070.CLM_DAY%TYPE              /*��������FROM          */
    , v_clm_TDay       IN RTSD0070.CLM_DAY%TYPE              /*��������TO            */
    , v_clm_Gb         IN RTSD0070.CLM_GB%TYPE               /*�湮���˱���          */
    , v_prgrs_State    IN RTSD0070.PRGRS_STATE%TYPE          /*ó������              */
    , v_ord_No         IN RTSD0070.ORD_NO%TYPE               /*����ȣ              */
    , v_cust_No        IN RTSD0070.CUST_NO%TYPE              /*����ȣ              */
    );

/*******************************************************************************
 -- Ŭ���Ӱ��� ������ȸ Select ����ȣ�� ��ȸ
 *******************************************************************************/
     PROCEDURE p_sRtsd0070StatusCust (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_cust_No        IN RTSD0070.CUST_NO%TYPE              /*����ȣ              */
    );

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


  ) RETURN NUMBER;
  
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
  ) RETURN NUMBER;
  
  
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
  );
  
END Pkg_Rtsd0070;
/
