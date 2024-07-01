CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RTSD0060 AS 
/******************************************************************************* 
   NAME:     PKG_RTSD0060 
   PURPOSE   ��Ż ���� ���� 
 
   REVISIONS 
   Ver        Date        Author           Description 
   ---------  ----------  ---------------  ------------------------------------- 
   1.0        2018-11-01  Sean         1. Created this package spec. 
*******************************************************************************/ 
  /***************************************************************************** 
  -- ��Ż���� ��ȸ Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService (  
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,               /* �������  */
    v_Chan_Lcis_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,          /* ä�δ�з�  */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,           /* ä���ߺз�  */
     v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE         /*������              */      
    ); 
    
  /***************************************************************************** 
  -- ��Ż���� ��ȸ Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService2 (  
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,               /* �������  */
    v_Chan_Lcis_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,          /* ä�δ�з�  */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE           /* ä���ߺз�  */    
    );  
    
  /***************************************************************************** 
  -- ��Ż���� ��ȸ Select 
  *****************************************************************************/     
      PROCEDURE p_IUDRtsd0060 (
    v_Comm_Dvsn         IN CHAR,                         /*ó������(I,U,D)       */
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*�������� ������       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*�������� �Ϸ���       */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*����                  */
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
    
    
  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060Count(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Seq               IN RTSD0061.SEQ%TYPE            /*����                  */ 
    )RETURN NUMBER;
    
    
    
  /*****************************************************************************
  -- �湮 ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */    
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*�������� ������       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*�������� �Ϸ���       */    
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText         OUT VARCHAR2
    )RETURN NUMBER;
    


  /*****************************************************************************
  -- �湮 ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Sale_Min_Cnt      IN RTSD0061.SALE_MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0061.COMM_AMT%TYPE,        /*�������� ������       */
    v_Sale_Max_Cnt      IN RTSD0061.SALE_MAX_CNT%TYPE,        /*�������� �Ϸ���       */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*����                  */ 
    v_Use_Yn            IN RTSD0061.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0061.REG_ID%TYPE,         /*����� ID             */ 
    v_ErrorText         OUT VARCHAR2 
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  -- �湮 ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0060(
    v_Comm_Tp           IN RTSD0061.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chr_Seq           IN RTSD0061.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Chan_Mcls_Cd      IN RTSD0061.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0061.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Seq               IN RTSD0061.SEQ%TYPE,            /*����                  */
    v_ErrorText         OUT VARCHAR2  
    ) RETURN NUMBER;
    
    
    
    /*****************************************************************************
  -- �����ڵ� Detail ��ȸ- ��з��ڵ� ���� �Һз��ڵ�/�� ��ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0060CodeName (
    Ref_Cursor  IN OUT SYS_REFCURSOR,
    v_Cd        IN  RTCM0051.CD%TYPE,            /*�ڵ��                  */
    v_Cd2    IN  RTCM0051.CD%TYPE,        /*�ڵ�׷��ڵ�            */ 
    v_Cd3    IN  RTCM0051.CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd4    IN  RTCM0051.CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd5    IN  RTCM0051.CD%TYPE,        /*�ڵ�׷��ڵ�            */
    v_Cd_Grp_Cd IN  RTCM0051.CD_GRP_CD%TYPE,        /*�ڵ�׷��ڵ�            */   
    v_Use_Yn    IN  RTCM0051.USE_YN%TYPE            /*��뿩��                */
    );
    
    
/***************************************************************************** 
  -- ��Ż���� ��ȸ Select 
  *****************************************************************************/ 
  PROCEDURE p_sRtsd0060visitorService3 ( 
    Ref_Cursor        IN OUT SYS_REFCURSOR, 
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,               /* �������  */
    v_Chan_Lcis_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE         /* ä�δ�з�  */   
    );
    
    
   /***************************************************************************** 
  --�μ�Ƽ�� ����
  *****************************************************************************/  
  PROCEDURE p_IUDRtsd0060Insentive (
    v_Comm_Dvsn         IN CHAR,                         /*ó������(I,U,D)       */
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*ä���ߺз�              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*ä�δ�з�            */    
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE,         /*������              */   
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*��Ϻ��ڵ�   .         */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*�������� ������       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*�������� �Ϸ���       */    
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*����� ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*����� ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*����� ID             */ 
    v_Success_Code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- �湮 ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��           */
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE         /*��ǰ�ڵ�              */
    ) RETURN NUMBER;
    
    
  /*****************************************************************************
  -- �湮 ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0060Insentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*����,�ݾ�����         */    
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��            */
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*�������� ������       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*�������� �Ϸ���       */   
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*����� ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*����� ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*����� ID             */   
    v_ErrorText         OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �湮 ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0060Insentive(
    v_Comm_Tp           IN RTSD0060.COMM_TP%TYPE,       /*����,�ݾ�����         */
    v_Chan_Mcls_Cd      IN RTSD0060.CHAN_MCLS_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Chan_Lcls_Cd      IN RTSD0060.CHAN_LCLS_CD%TYPE,         /*Ÿ�̾��          */
    v_Chr_Seq           IN RTSD0060.CHR_SEQ%TYPE,         /*��ǰ�ڵ�              */
    v_Min_Cnt           IN RTSD0060.MIN_CNT%TYPE,        /*��Ϻ��ڵ�            */
    v_Comm_Amt          IN RTSD0060.COMM_AMT%TYPE,        /*�������� ������       */
    v_Max_Cnt           IN RTSD0060.MAX_CNT%TYPE,        /*�������� �Ϸ���       */ 
    v_Use_Yn            IN RTSD0060.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE,         /*����� ID             */
    v_Str_Day           IN RTSD0060.STR_DAY%TYPE,         /*����� ID             */
    v_End_Day           IN RTSD0060.END_DAY%TYPE,         /*����� ID             */  
    v_ErrorText         OUT VARCHAR2 
    ) RETURN NUMBER;
    
  /***************************************************************************** 
  --�μ�Ƽ�� ����
  *****************************************************************************/  
  PROCEDURE p_IUDRtsd0060Insentive2 (
    v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE,       /*����,�ݾ�����         */
    v_Reg_Id            IN RTSD0060.REG_ID%TYPE         /*����� ID             */  
    );
    
  /*****************************************************************************
  -- �湮 ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive3(
    v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE      /*����,�ݾ�����         */    
   
    ) RETURN NUMBER; 
                 
    
  /*****************************************************************************
  -- �湮 ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0060CountInsentive4(
    v_Slcm_Ym           IN RTRE5040.SLCM_YM%TYPE      /*����,�ݾ�����         */    
    ) RETURN VARCHAR2;     
END PKG_RTSD0060;
/
