CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0045 AS
/******************************************************************************
   NAME:       Pkg_Rtsd0045
   PURPOSE:   판매채널등록

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-11-20   sePark       1. Created this package.
******************************************************************************/

  /*****************************************************************************
  -- 판매채널등록 [추가] Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0045 (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0045.SALE_CD%TYPE     /* 판매상품코드            */
  );

  /*****************************************************************************
  -- 기존정보만 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0045select (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN     RTSD0045.SALE_CD%TYPE     /* 판매상품코드            */
  );

  /*****************************************************************************
  -- 기존정보를 제외한 코드만 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0045selectAdd (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Sale_Cd       IN RTSD0045.SALE_CD%TYPE,     /* 판매상품코드            */
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE      /* 부모코드              */
  );
        
  /*****************************************************************************
  -- 판매채널등록 [추가] 이벤트(2-3레벨)
  *****************************************************************************/
  PROCEDURE p_sRtsd0045_detail (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE      /* 부모코드              */
  ); 
  
  /*****************************************************************************
  -- 채널구분 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0045 (
    v_Comm_Dvsn      IN CHAR,                         /* 처리구분(I,U,D)       */
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* 판매코드              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE,        /* 채널구분(대분류)       */
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE,      /* 부모코드              */
    v_ORG_CD         IN RTSD0045.ORG_CD%TYPE,         /* 판매인코드            */    
    v_ORG_NM         IN RTSD0045.ORG_NM%TYPE,         /* 판매인명              */
    v_Reg_Id         IN RTSD0045.REG_ID%TYPE,         /* 등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- 판매코드 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0045Count(
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* 판매코드              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE         /* 채널구분(대분류)       */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0045 (
    v_SALE_CD         IN RTSD0045.SALE_CD%TYPE        /* 판매코드              */
    ) RETURN NUMBER;    

  /*****************************************************************************
  -- Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0045 (
    v_SALE_CD        IN RTSD0045.SALE_CD%TYPE,        /* 판매코드              */
    v_CHAN_CD        IN RTSD0045.CHAN_CD%TYPE,        /* 채널구분(대분류)       */
    v_P_CHAN_CD      IN RTSD0045.P_CHAN_CD%TYPE,      /* 부모코드              */
    v_ORG_CD         IN RTSD0045.ORG_CD%TYPE,         /* 판매인코드            */        
    v_ORG_NM         IN RTSD0045.ORG_NM%TYPE,         /* 판매인명              */ 
    v_Reg_Id         IN RTSD0045.REG_ID%TYPE,         /* 등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 필터 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0045filter (
    Ref_Cursor      IN OUT SYS_REFCURSOR,    
    v_Org_Nm        IN     RTSD0045.ORG_NM%TYPE     /* 판매인명                */
  );  
  
  /*****************************************************************************
  -- 상품판매구분 별 사용채널 목록
  *****************************************************************************/
  PROCEDURE p_userChanCdList(
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_SALE_CD       IN RTSD0045.SALE_CD%TYPE          /* 판매코드             */
   );
  
END Pkg_Rtsd0045;