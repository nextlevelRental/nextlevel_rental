CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0209 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0010
   PURPOSE   마모파손서비스 첨부이미지

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-10-14  kstka            1. Created this package body.
*******************************************************************************/
   
  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0209List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,          /*계약번호              */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,       /*부여:A, 신청:B        */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,         /*서비스코드            */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE         /*서비스부여/신청순번     */
    );
   
  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지 INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_InsertRtcs0209 (
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,         /*배송신청일자          */
    v_Dlvr_Day       IN RTCS0209.DLVR_DAY%TYPE,       /*순번                  */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,        /*계약번호              */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE,       /*고객코드              */
    v_Seq            IN RTCS0209.SEQ%TYPE,            /*고객명                */
    v_File_Path      IN RTCS0209.FILE_PATH%TYPE,      /*대리점                */
    v_File_Name      IN RTCS0209.FILE_NAME%TYPE,      /**/
    v_Conf_Yn        IN RTCS0209.CONF_YN%TYPE,        /**/
    v_Pic_Set        IN RTCS0209.PIC_SET%TYPE,        /**/
    v_Reg_Id         IN RTCS0209.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지 UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0209 (
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,         /*배송신청일자          */
    v_Dlvr_Day       IN RTCS0209.DLVR_DAY%TYPE,      /*순번                  */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,        /*계약번호              */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE,       /*고객코드              */
    v_Seq            IN RTCS0209.SEQ%TYPE,            /*고객명                */
    v_Conf_Yn        IN RTCS0209.CONF_YN%TYPE,        /**/
    v_Pic_Set        IN RTCS0209.PIC_SET%TYPE,        /**/
    v_Reg_Id         IN RTCS0209.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지 DELETE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0209 (
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,         /*배송신청일자          */
    v_Dlvr_Day       IN RTCS0209.DLVR_DAY%TYPE,      /*순번                  */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,        /*계약번호              */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE,       /*고객코드              */
    v_Pic_Set        IN RTCS0209.PIC_SET%TYPE,            /*고객명                */
    v_Reg_Id         IN RTCS0209.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지 부여순번 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-05  kstka             [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0209DlvrSeq(
    v_Ord_No       IN RTCS0209.ORD_NO%TYPE,          /*주문번호        */
    v_Serv_Cd      IN RTCS0209.SERV_CD%TYPE          /*서비스코드      */
    ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 마모파손서비스 부여/신청 첨부이미지 관리(IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2020-10-14  wjim             [20201014-0001]                                                                         
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0209 (
    v_Comm_Dvsn      IN CHAR,                         /*1 처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,         /*배송신청일자          */
    v_Dlvr_Day       IN RTCS0209.DLVR_DAY%TYPE,      /*순번                  */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,        /*계약번호              */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE,       /*고객코드              */
    v_Seq            IN RTCS0209.SEQ%TYPE,        /*고객코드              */
    v_File_Path      IN RTCS0209.FILE_PATH%TYPE,      /*대리점                */
    v_File_Name      IN RTCS0209.FILE_NAME%TYPE,      /**/
    v_Conf_Yn        IN RTCS0209.CONF_YN%TYPE,        /**/
    v_Pic_Set        IN RTCS0209.PIC_SET%TYPE,        /**/
    v_Reg_Id         IN RTCS0209.REG_ID%TYPE,         /*교체예정일자          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
      
END Pkg_Rtcs0209;
/
