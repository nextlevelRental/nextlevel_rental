CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0002 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0002
   PURPOSE   카마스타 마스터 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
   1.3        2017-06-22  wjim             [20170622_01] 사번으로 로디안 조회기능 추가
*******************************************************************************/

  /*****************************************************************************
  -- 카마스타 마스터 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0002Count(
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE      /*카마스타 사번       */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카마스타 마스터 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE    /*카마스타 사번         */
    );

  /*****************************************************************************
  -- 카마스타 마스터 Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  FUNCTION f_InsertRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*카마스타 사번         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*전화번호              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTCS0002.CITY%TYPE,           /*주소                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*상세주소              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*입사일                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*퇴사일                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*근무여부              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*기타1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*기타2                 */    
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*등록자ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카마스타 마스터 Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*카마스타 사번         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*전화번호              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTCS0002.CITY%TYPE,           /*주소                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*상세주소              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*입사일                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*퇴사일                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*근무여부              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*기타1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*기타2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*등록자ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카마스타 마스터 Delete
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*카마스타 사번         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*전화번호              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTCS0002.CITY%TYPE,           /*주소                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*상세주소              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*입사일                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*퇴사일                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*근무여부              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*기타1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*기타2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*등록자ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 카마스타 마스터 관리(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] 판매인번호 추가
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0002 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*카마스타 사번         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*지사코드              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*지점코드              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*핸드폰번호            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*전화번호              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*우편번호              */
    v_City           IN RTCS0002.CITY%TYPE,           /*주소                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*상세주소              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*입사일                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*퇴사일                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*근무여부              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*기타1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*기타2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*등록자ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*판매인번호            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*렌탈지역 코드 */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*렌탈지역 코드 */    
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- 카마스타 팝업
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.4        2017-06-22  wjim             [20170622_02] '근무여부' 조회조건 추가   
  *****************************************************************************/
  PROCEDURE p_sRtcs0002carmasterPopup(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*카마스타 명           */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE          /*근무여부              */
  );
    
  /*****************************************************************************
  -- 사번으로 로디안 정보 조회
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-06-22  wjim             [20170622_01] 기능추가
  *****************************************************************************/
  PROCEDURE p_sRtcs0002carmasterNu (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE    /*로디안 사번         */
  );    

  /*****************************************************************************
  -- AS기사순번 구하기
  *****************************************************************************/
  PROCEDURE p_sRtcs0002getmaxnu(
    v_Carmaster_Nu   OUT  RTCS0002.CARMASTER_NU%TYPE  /*카마스타 사번         */
    );
END Pkg_Rtcs0002;
/
