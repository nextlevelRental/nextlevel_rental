CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Utility AS
/******************************************************************************
   NAME:       pkg_Utility
   PURPOSE:    ��ƿ��Ƽ(���̺�� �������� �ʴ� ������)
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-16  jimcarry         1. Created this package.
******************************************************************************/

  /****************************************************************************
  -- ���нð����� ���нð��� �� �ð�(�ʴ���)
  ****************************************************************************/
  FUNCTION SEGMENTGAP(
    A_S IN VARCHAR2,
    A_E IN VARCHAR2,
    B_S IN VARCHAR2,
    B_E IN VARCHAR2
    ) RETURN NUMBER;

  /****************************************************************************
  -- 36������ȯ(10���� --> 36����)
  ****************************************************************************/
   FUNCTION DEC2SEQ (a NUMBER) RETURN VARCHAR2;
   PRAGMA RESTRICT_REFERENCES
      (DEC2SEQ, WNDS, WNPS, RNDS, RNPS);

  /****************************************************************************
  -- 36������ȯ(36���� --> 10����)
  ****************************************************************************/
   FUNCTION SEQ2DEC (a VARCHAR2) RETURN NUMBER;
   PRAGMA RESTRICT_REFERENCES
      (SEQ2DEC, WNDS, WNPS, RNDS, RNPS);


  /****************************************************************************
  -- ���ڸ� ���ڷ� ��Ÿ�� (1,234 -> ��õ�̹��ʻ� �Ǵ� ��������߳���)
  ****************************************************************************/    
  FUNCTION NumToHanChar (
    CHAR_NUM IN VARCHAR2
    ) RETURN VARCHAR2;
          
  /****************************************************************************
  -- GE Serial CheckDigit�� ȹ��
  ****************************************************************************/  
  FUNCTION OEM_GE(a IN NUMBER) RETURN VARCHAR2;
  
  /****************************************************************************
  -- �����ڰ� ���Ե� ��Ʈ���� ©�� ROW ���·� �����Ѵ�. 
     CREATE OR REPLACE TYPE POPADMIN.TBLPARSE AS TABLE OF VARCHAR2(32767);
  ****************************************************************************/
  FUNCTION StrParse (
    CHAR_LIST IN VARCHAR2,
    DELIMITER IN VARCHAR2
  ) RETURN TblParse PIPELINED;

    
  /****************************************************************************
  -- 16���� --> 10����
  ****************************************************************************/
  FUNCTION HEXTODEC ( A IN VARCHAR2 ) RETURN NUMBER;

  /****************************************************************************
  -- ������ ���� ȹ��
  ****************************************************************************/
  FUNCTION f_getSessionContext RETURN VARCHAR2;

  /****************************************************************************
  -- ERROR �α� ���� ����
  ****************************************************************************/  
  PROCEDURE p_ErrorFileWrite (
    v_ErrText1  VARCHAR2
    );
    
  PROCEDURE p_ErrorFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2
    );
    
  PROCEDURE p_ErrorFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2
    );
    
  PROCEDURE p_ErrorFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2,
    v_ErrText4  VARCHAR2
    );
    
  PROCEDURE p_ErrorFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2,
    v_ErrText4  VARCHAR2,
    v_ErrText5  VARCHAR2
    );
    
  /****************************************************************************
  -- INFO �α� ���� ����
  ****************************************************************************/  
  PROCEDURE p_InfoFileWrite (
    v_ErrText1  VARCHAR2
    );
    
  PROCEDURE p_InfoFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2
    );
    
  PROCEDURE p_InfoFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2
    );
    
  PROCEDURE p_InfoFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2,
    v_ErrText4  VARCHAR2
    );
    
  PROCEDURE p_InfoFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2,
    v_ErrText4  VARCHAR2,
    v_ErrText5  VARCHAR2
    );
    
  /****************************************************************************
  -- LOGIN �α� ���� ����
  ****************************************************************************/  
  PROCEDURE p_LoginFileWrite (
    v_ErrText1  VARCHAR2
    );
    
  PROCEDURE p_LoginFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2
    );
    
  PROCEDURE p_LoginFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2
    );
    
  PROCEDURE p_LoginFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2,
    v_ErrText4  VARCHAR2
    );
  
  PROCEDURE p_LoginFileWrite (
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2,
    v_ErrText4  VARCHAR2,
    v_ErrText5  VARCHAR2
    );
    
  /****************************************************************************
  --  �α� ���� ����
  ****************************************************************************/    
  PROCEDURE p_LogFileWrite (
    v_Dirname   VARCHAR2,
    v_ErrText1  VARCHAR2,
    v_ErrText2  VARCHAR2,
    v_ErrText3  VARCHAR2,
    v_ErrText4  VARCHAR2,
    v_ErrText5  VARCHAR2
    );
                                   
    
END Pkg_Utility;
/
