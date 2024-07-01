CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0113 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0113
   PURPOSE   채권 관리 처리결과 등록 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-27  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Count
  *****************************************************************************/
  FUNCTION f_sRtre0113Count(
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,          /*고객번호            */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE          /*채권관리순번        */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0113 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*채권관리순번          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*계약번호              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*채권관리결과등록일    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*채권관리결과등록구분  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*채권관리결과내용      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*채권관리순번          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*계약번호              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*채권관리결과등록일    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*채권관리결과등록구분  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*채권관리결과내용      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*채권관리순번          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*계약번호              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*채권관리결과등록일    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*채권관리결과등록구분  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*채권관리결과내용      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0113 (
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN RTRE0113.RAMG_SEQ%TYPE,       /*채권관리순번          */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0113 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ramg_Seq       IN OUT RTRE0113.RAMG_SEQ%TYPE,   /*채권관리순번          */
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE,         /*계약번호              */
    v_Cntct_Day      IN RTRE0113.CNTCT_DAY%TYPE,      /*채권관리결과등록일    */
    v_Cntct_Gb       IN RTRE0113.CNTCT_GB%TYPE,       /*채권관리결과등록구분  */
    v_Cntct_Desc     IN RTRE0113.CNTCT_DESC%TYPE,     /*채권관리결과내용      */
    v_Attch_Fl_Seq   IN RTRE0113.ATTCH_FL_SEQ%TYPE,   /*첨부파일 정보         */
    v_Del_Yn         IN RTRE0113.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0113.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Select - RE-040106_추심결과 등록 조회
  *****************************************************************************/
  PROCEDURE p_sRtre0113List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ramg_Ym        IN RTRE0113.RAMG_YM%TYPE,        /*채권관리년월          */
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE,        /*고객번호              */
    v_Ord_No         IN RTRE0113.ORD_NO%TYPE          /*계약번호              */
    );


  /*****************************************************************************
  -- 채권 관리 처리결과 등록 Count - 채권관리순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0113RamgSeq(
    v_Cust_No        IN RTRE0113.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER;
        
END Pkg_Rtre0113;
/
