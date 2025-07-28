CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Utility AS
/******************************************************************************
   NAME:       pkg_Utility
   PURPOSE:    유틸리티(테이블과 관여되지 않는 공통모듈)
   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2015-06-16  jimcarry         1. Created this package.
******************************************************************************/

  /****************************************************************************
  -- 선분시간에서 선분시간을 뺀 시간(초단위)
  ****************************************************************************/
  FUNCTION SEGMENTGAP(
    A_S IN VARCHAR2,
    A_E IN VARCHAR2,
    B_S IN VARCHAR2,
    B_E IN VARCHAR2
    ) RETURN NUMBER;

  /****************************************************************************
  -- 36진법변환(10진수 --> 36진수)
  ****************************************************************************/
   FUNCTION DEC2SEQ (a NUMBER) RETURN VARCHAR2;
   PRAGMA RESTRICT_REFERENCES
      (DEC2SEQ, WNDS, WNPS, RNDS, RNPS);

  /****************************************************************************
  -- 36진법변환(36진수 --> 10진수)
  ****************************************************************************/
   FUNCTION SEQ2DEC (a VARCHAR2) RETURN NUMBER;
   PRAGMA RESTRICT_REFERENCES
      (SEQ2DEC, WNDS, WNPS, RNDS, RNPS);


  /****************************************************************************
  -- 숫자를 문자로 나타냄 (1,234 -> 일천이백삼십사 또는 壹千貳百參拾四)
  ****************************************************************************/    
  FUNCTION NumToHanChar (
    CHAR_NUM IN VARCHAR2
    ) RETURN VARCHAR2;
          
  /****************************************************************************
  -- GE Serial CheckDigit값 획득
  ****************************************************************************/  
  FUNCTION OEM_GE(a IN NUMBER) RETURN VARCHAR2;
  
  /****************************************************************************
  -- 구분자가 포함된 스트링을 짤라서 ROW 형태로 추출한다. 
     CREATE OR REPLACE TYPE POPADMIN.TBLPARSE AS TABLE OF VARCHAR2(32767);
  ****************************************************************************/
  FUNCTION StrParse (
    CHAR_LIST IN VARCHAR2,
    DELIMITER IN VARCHAR2
  ) RETURN TblParse PIPELINED;

    
  /****************************************************************************
  -- 16진수 --> 10진수
  ****************************************************************************/
  FUNCTION HEXTODEC ( A IN VARCHAR2 ) RETURN NUMBER;

  /****************************************************************************
  -- 접속자 정보 획득
  ****************************************************************************/
  FUNCTION f_getSessionContext RETURN VARCHAR2;

  /****************************************************************************
  -- ERROR 로그 파일 생성
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
  -- INFO 로그 파일 생성
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
  -- LOGIN 로그 파일 생성
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
  --  로그 파일 생성
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