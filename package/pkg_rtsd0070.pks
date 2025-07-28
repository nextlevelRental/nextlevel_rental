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
  -- 클레임관리 Select - 클레임관리
  *****************************************************************************/
PROCEDURE p_sRtsd0070Status (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_clm_FDay       IN RTSD0070.CLM_DAY%TYPE              /*접수일자FROM          */
    , v_clm_TDay       IN RTSD0070.CLM_DAY%TYPE              /*접수일자TO            */
    , v_clm_Gb         IN RTSD0070.CLM_GB%TYPE               /*방문점검구분          */
    , v_prgrs_State    IN RTSD0070.PRGRS_STATE%TYPE          /*처리상태              */
    , v_ord_No         IN RTSD0070.ORD_NO%TYPE               /*계약번호              */
    , v_cust_No        IN RTSD0070.CUST_NO%TYPE              /*고객번호              */
    );

/*******************************************************************************
 -- 클레임관리 내역조회 Select 고객번호로 조회
 *******************************************************************************/
     PROCEDURE p_sRtsd0070StatusCust (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_cust_No        IN RTSD0070.CUST_NO%TYPE              /*고객번호              */
    );

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


  ) RETURN NUMBER;
  
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
  ) RETURN NUMBER;
  
  
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
  );
  
END Pkg_Rtsd0070;