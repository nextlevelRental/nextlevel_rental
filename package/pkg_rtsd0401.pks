CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0401 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0401
    PURPOSE     방문장착 정보 관리

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-24  wjim            [20181122_01] Created this package spec.
    1.2     2019-01-24  wjim            [20190124_01] 방문장착 정보 목록조회 조회조건 추가
*******************************************************************************/

  /*****************************************************************************
  -- 방문장착 정보 Count
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_sRtsd0401Count(
    v_Ord_No         IN RTSD0401.ORD_NO%TYPE            /*계약번호            */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- 방문장착 정보 목록 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-01  wjim            [20181122_01] Created this package spec.
    1.2     2019-01-24  wjim            [20190124_01] 조회조건 추가
                                        - 계약접수일자(from~to)
  *****************************************************************************/
  PROCEDURE p_sRTSD0401 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Agency_Cd       IN RTSD0401.AGENCY_CD%TYPE     /*대리점번호           */
    , v_Proc_Day_F      IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자(from)   */   
    , v_Proc_Day_T      IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자(to)     */
    , v_Stat_Cd         IN RTSD0401.STAT_CD%TYPE       /*상태코드(S105)       */
    , v_Stat_Dtl_Cd     IN RTSD0401.STAT_DTL_CD%TYPE   /*상태세부코드(S106)   */    
    , v_Cust_Nm         IN RTSD0100.CUST_NM%TYPE       /*고객명               */
    , v_Mob_No          IN RTSD0401.MOB_NO%TYPE        /*휴대폰번호           */
    , v_Ord_No          IN RTSD0401.ORD_NO%TYPE        /*계약번호             */
    , v_Ord_Day_F       IN RTSD0104.ORD_Day%TYPE       /*계약접수일자(from)   */
    , v_Ord_Day_T       IN RTSD0104.ORD_Day%TYPE       /*계약접수일자(from)   */
  );

  /*****************************************************************************
  -- 방문장착 정보 Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0401 (
      v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*계약번호              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*대리점번호            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*장착요청일자          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*장착협의시간          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*연락처                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*건물번호              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*우편번호              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*주소                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*상세주소              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*상태코드(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*상태세부코드(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*메모                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문장착 정보 Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0401 (
      v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*계약번호              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*대리점번호            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*장착요청일자          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*장착협의시간          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*연락처                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*건물번호              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*우편번호              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*주소                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*상세주소              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*상태코드(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*상태세부코드(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*메모                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*등록자 ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- 방문장착 정보 관리(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0401 (
      v_Comm_Dvsn      IN CHAR                        /*처리구분(I,U,D)       */
    , v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*계약번호              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*대리점번호            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*장착요청일자          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*장착협의일자          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*장착협의시간          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*연락처                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*건물번호              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*우편번호              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*주소                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*상세주소              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*상태코드(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*상태세부코드(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*메모                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*등록자 ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
    
  /*****************************************************************************
  -- 방문장착 정보 Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-24  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0401CountPerStat (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Agency_Cd       IN RTSD0401.AGENCY_CD%TYPE      /* 대리점번호         */  
    , v_Proc_Day_F      IN RTSD0401.PROC_DAY%TYPE       /* 장착협의일자(from) */   
    , v_Proc_Day_T      IN RTSD0401.PROC_DAY%TYPE       /* 장착협의일자(to)   */   
  );

        
END Pkg_Rtsd0401;