CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0008 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0008
   PURPOSE   ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-29  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtsd0008Count(
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,          /*�������� ������     */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,          /*�������� �Ϸ���     */
    v_Seq            IN RTSD0008.SEQ%TYPE               /*����                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN OUT RTSD0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0008 (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0008 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_Seq            IN OUT RTSD0008.SEQ%TYPE,            /*����                  */
    v_Amt            IN RTSD0008.AMT%TYPE,            /*�ݾ�                  */
    v_Use_Yn         IN RTSD0008.USE_YN%TYPE,         /*��뿩��              */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���� ���� Select - ��ǰ �� ������ȸ POPUP
  *****************************************************************************/
  PROCEDURE p_sRtsd0008PoPup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,        /*����������            */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE         /*Ÿ�̾��            */
    );


  /*****************************************************************************
  -- ��ǰ���� Select - ��ǰ �� ������ȸ POPUP
  REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-13  wjim             [20170313_01] B2B�Ͻú� ������å �߰��� ���� �Ķ���� �߰�
  *****************************************************************************/
  PROCEDURE p_sRtsd0008_Pro_Pri_PoPup (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,         /*����������          */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,          /*��ǰ�ڵ�            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,       /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,          /*Ÿ�̾��          */
    v_regi_Amt       IN RTSD0106.REGI_AMT%TYPE,        /*��Ż��Ϻ�          */
    v_Amt            IN RTSD0008.AMT%TYPE,             /*�ݾ�                */
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE         /*���ݱݾ�����        */
    );
    

  /*****************************************************************************
    -- ��ǰ���� Select - ��ǰ �� ������ȸ
  *****************************************************************************/
  PROCEDURE p_sRtsd0008_ProductList (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,        /*����                */
    v_Contents_Cd    IN RTSD0004.CONTENTS_CD%TYPE,     /*���                */
    v_Fr_Cd          IN RTSD0004.FR_CD%TYPE,           /*���� ����           */
    v_Section_Width  IN RTSD0005.SECTION_WIDTH%TYPE,   /*�ܸ���              */
    v_Aspect_Ratio   IN RTSD0005.ASPECT_RATIO%TYPE,    /*�����              */
    v_Wheel_Inches   IN RTSD0005.WHEEL_INCHES%TYPE,    /*����ġ              */
    v_Ply_Rating     IN RTSD0005.PLY_RATING%TYPE,      /*����                */    
    v_Season_Cd      IN RTSD0005.SEASON_CD%TYPE,       /*���� ����           */
    v_Pettern_Cd     IN RTSD0005.PETTERN_CD%TYPE,      /*�����ڵ�            */
    v_Ord_Day        IN RTSD0008.STR_DAY%TYPE,         /*����������          */    
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,       /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE           /*Ÿ�̾��          */
    );
    
  /*****************************************************************************
  -- ���� ���� ����ä��
  *****************************************************************************/
  FUNCTION f_sRtsd0008MaxSeq(
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,          /*�������� ������     */
    v_End_Day        IN RTSD0008.END_DAY%TYPE          /*�������� �Ϸ���     */
    ) RETURN NUMBER;    


  /*****************************************************************************
  -- ���� �������ڵ�Ͽ��� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtsd0008ExistsDay(
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,         /*����,�ݾ�����       */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,           /*��ǰ�ڵ�            */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*Ÿ�̾��          */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,          /*��Ϻ��ڵ�          */
    v_Seq            OUT RTSD0008.SEQ%TYPE              /*���� */
    ) RETURN VARCHAR;    

  
   /*****************************************************************************
  -- ���� ���� ����(���� �������� ������Ʈó��)
  *****************************************************************************/
  PROCEDURE p_UpdateRtsd0008EndDay (
    v_Price_Cd       IN RTSD0008.PRICE_CD%TYPE,       /*����,�ݾ�����         */
    v_Mat_Cd         IN RTSD0008.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,      /*�Ⱓ�ڵ�              */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,         /*Ÿ�̾��            */
    v_Regi_Cd        IN RTSD0008.REGI_CD%TYPE,        /*��Ϻ��ڵ�            */
    v_Str_Day        IN RTSD0008.STR_DAY%TYPE,        /*�������� ������       */
    v_End_Day        IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���       */
    v_End_Day2       IN RTSD0008.END_DAY%TYPE,        /*�������� �Ϸ���(����)  */
    v_Seq            IN RTSD0008.SEQ%TYPE,            /*����                  */
    v_Reg_Id         IN RTSD0008.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ��ǰ�߰� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*����                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*�Ǹ޻�ǰ�ڵ�        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*������            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,              /*������ġ            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE,
    v_Pettern_cd    IN RTSD0005.PETTERN_CD%TYPE,
    v_Spec_cd   IN VARCHAR2
  );  
  
  /*****************************************************************************
  -- ��ະ ����� ��ǰ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddSelProduct (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd       IN RTSD0004.MODEL_CD%TYPE,         /*����                */
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,        /*�Ⱓ�ڵ�            */
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,           /*Ÿ�̾��          */    
    v_Ord_No         IN RTSD0106.ORD_NO%TYPE,           /*����ȣ            */ 
    v_Sale_Cd        IN RTSD0020.SALE_CD%TYPE,          /*Ÿ�̾��          */
    v_contents_Cd    IN RTSD0002.CONTENTS_CD%TYPE       /*������            */
  );
  
  
  /*****************************************************************************
  -- ��ະ ����� ��ǰ���� Select �Ͻú�
  *****************************************************************************/
  PROCEDURE p_sRtsd0008AddSelProductDirect (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Period_Cd      IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd         IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */ 
    v_Ord_no         IN RTSD0106.ORD_NO%TYPE,            /*����ȣ            */  
    v_Sale_Cd        IN RTSD0020.SALE_CD%TYPE            /*Ÿ�̾��          */
  );


  /*****************************************************************************
  -- ��ǰ�߰� ���� �޺��ڽ�  Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028PetternCombo (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*����                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*�Ǹ޻�ǰ�ڵ�        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*������            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,             /*������ġ            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE
  );  

  /*****************************************************************************
  -- ��ǰ�߰� �԰�  �޺��ڽ�  Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0028PetternComboStan (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Model_Cd      IN RTSD0004.MODEL_CD%TYPE,          /*����                */
    v_Period_Cd     IN RTSD0008.PERIOD_CD%TYPE,         /*�Ⱓ�ڵ�            */  
    v_Cnt_Cd        IN RTSD0008.CNT_CD%TYPE,            /*Ÿ�̾��          */      
    v_Sale_Cd       IN RTSD0020.SALE_CD%TYPE,           /*�Ǹ޻�ǰ�ڵ�        */
    v_contents_Cd   IN RTSD0002.CONTENTS_CD%TYPE,       /*������            */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE,             /*������ġ            */
    v_Season_cd     IN RTSD0005.SEASON_CD%TYPE,
    v_Pettern_cd    IN RTSD0005.PETTERN_CD%TYPE
  ); 
  
  /*****************************************************************************
  -- Ÿ�̾� ����  üũ
  *****************************************************************************/
  FUNCTION f_sRtsd0008GetWheelQty(
    v_Model_Cd      IN RTSD0001.MODEL_CD%TYPE,         /*����                 */
    v_contents_Cd   IN RTSD0001.CONTENTS_CD%TYPE,      /*������             */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE             /*������ġ             */
    ) RETURN VARCHAR;
    
  /*****************************************************************************
  -- ���� ���� Ÿ�̾� ����  üũ
  *****************************************************************************/
  FUNCTION f_sRtsd0008GetWheelQtyLt(
    v_Model_Cd      IN RTSD0001.MODEL_CD%TYPE,         /*����                 */
    v_contents_Cd   IN RTSD0001.CONTENTS_CD%TYPE,      /*������             */
    v_fr_Cd         IN RTSD0004.FR_CD%TYPE             /*������ġ             */
    ) RETURN VARCHAR;
        
END Pkg_Rtsd0008;
/
