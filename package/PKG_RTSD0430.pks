CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0430 AS
/*******************************************************************************
    NAME        Pkg_RTSD0430
    PURPOSE     주문취소등록내역
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-16  kstka            [20210916_01] Created this package spec.
*******************************************************************************/
  
  /*****************************************************************************
  -- 주문취소사유등록내역 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-16  kstka            [20210916_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0430 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Ord_No          IN RTSD0430.ORD_NO%TYPE                  /*주문번호             */
    , v_Cust_No         IN RTSD0100.CUST_NO%TYPE                 /*고객번호             */
    , v_Canc_Cd         IN RTSD0430.CANC_CD%TYPE                 /*취소사유             */
    , v_Canc_Day_F      IN RTSD0430.CANC_DAY%TYPE                /*취소일자             */
    , v_Canc_Day_T      IN RTSD0430.CANC_DAY%TYPE
  );
       
  /*****************************************************************************
  -- 주문취소사유등록(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-16  kstka            [20210916_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRTSD0430 (
      v_Comm_Dvsn       IN CHAR                                 /*처리구분(I,U,D)      */
    , v_Ord_No          IN RTSD0430.ORD_NO%TYPE                 /*주문번호             */
    , v_Canc_Day        IN RTSD0430.CANC_DAY%TYPE               /*취소일자             */
    , v_Canc_Cd         IN RTSD0430.CANC_CD%TYPE                /*취소사유             */
    , v_Reg_Id          IN RTSD0430.REG_ID%TYPE                 /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
  
  /*****************************************************************************
  -- 주문취소사유등록 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2021-09-16  kstka            [20210916_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRTSD0430 (
      v_Ord_No          IN RTSD0430.ORD_NO%TYPE                 /*주문번호             */
    , v_Canc_Day        IN RTSD0430.CANC_DAY%TYPE               /*취소일자             */
    , v_Canc_Cd         IN RTSD0430.CANC_CD%TYPE                /*취소코드             */
    , v_Reg_Id          IN RTSD0430.REG_ID%TYPE                 /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;
       
END Pkg_Rtsd0430;