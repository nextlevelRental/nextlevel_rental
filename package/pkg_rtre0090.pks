CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0090 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0090
   PURPOSE   현금영수증 발급기준 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-14  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 현금영수증 발급기준 Count
  *****************************************************************************/
  FUNCTION f_sRtre0090Count(
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,          /*고객번호            */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE            /*등록순번            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증 발급기준 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0090 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*등록순번              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*적용시작일            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*적용종료일            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*현금영수증 발급기준   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*현금영수증 발급번호   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- 현금영수증 발급기준 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*등록순번              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*적용시작일            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*적용종료일            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*현금영수증 발급기준   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*현금영수증 발급번호   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증 발급기준 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*등록순번              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*적용시작일            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*적용종료일            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*현금영수증 발급기준   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*현금영수증 발급번호   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증 발급기준 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0090 (
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN RTRE0090.CC_SEQ%TYPE,         /*등록순번              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 현금영수증 발급기준 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0090 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE,        /*고객번호              */
    v_Cc_Seq         IN OUT RTRE0090.CC_SEQ%TYPE,     /*등록순번              */
    v_Str_Day        IN RTRE0090.STR_DAY%TYPE,        /*적용시작일            */
    v_End_Day        IN RTRE0090.END_DAY%TYPE,        /*적용종료일            */
    v_Chi_Tp         IN RTRE0090.CHI_TP%TYPE,         /*현금영수증 발급기준   */
    v_Chi_No         IN RTRE0090.CHI_NO%TYPE,         /*현금영수증 발급번호   */
    v_Del_Yn         IN RTRE0090.DEL_YN%TYPE,         /*삭제여부              */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 현금영수증 발급기준 - 등록순번 획득
  *****************************************************************************/
  FUNCTION f_sRtre0090CcSeq(
    v_Cust_No        IN RTRE0090.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- 현금영수증 발급기준 - RE-030101_현금영수증 대상집계
  *****************************************************************************/
  PROCEDURE p_InsertRtre0090Aggregate (
    v_Cash_Day       IN RTRE0091.CASH_DAY%TYPE,       /*현금영수증발행일자    */
    v_Recv_SDay      IN RTRE0030.RECV_DAY%TYPE,       /*수납일자START         */
    v_Recv_EDay      IN RTRE0030.RECV_DAY%TYPE,       /*수납일자END           */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 현금영수증 발급기준 - RE-030102_현금영수증 파일생성 : 카드이체 내역을 기준으로 송신 대상 파일 형태로 내역을 생성하고 파일생성자료를 RETURN 하는 함수
  *****************************************************************************/
  PROCEDURE p_InsertRtre0090FileCreate (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rcrd_Day       IN RTRE0080.RCRD_DAY%TYPE,       /*카드이체일자          */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*파일명                */
    v_Reg_Id         IN RTRE0090.REG_ID%TYPE,         /*등록자 ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF여부              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
            
END Pkg_Rtre0090;