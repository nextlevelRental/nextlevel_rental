CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0001 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0001
   PURPOSE   설비 정보 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 설비 정보 Count
  *****************************************************************************/
  FUNCTION f_sRtcs0001Count(
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE            /*설비번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0001
    WHERE   EQU_NO = v_Equ_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0001Count;

  /*****************************************************************************
  -- 설비 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE,         /*설비번호              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTCS0001.PROC_DAY%TYPE,       /*장착일자              */
    v_Mat_Cd         IN RTCS0001.MAT_CD%TYPE,         /*상품코드              */
    v_Mob_No         IN RTCS0001.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTCS0001.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0001.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTCS0001.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTCS0001.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTCS0001.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTCS0001.TEL_NO2%TYPE,        /*전화번호              */
    v_Bld_Mng_No2    IN RTCS0001.BLD_MNG_NO2%TYPE,    /*고객주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTCS0001.POS_CD2%TYPE,        /*고객주소-우편번호     */
    v_Addr1_2        IN RTCS0001.ADDR1_2%TYPE,        /*고객주소-주소         */
    v_Addr2_2        IN RTCS0001.ADDR2_2%TYPE,        /*고객주소-상세주소     */
    v_Car_No         IN RTCS0001.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTCS0001.CAR_OWNER%TYPE,      /*차량소유자            */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*종료여부              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*종료일자              */
    v_Fl_Yn          IN RTCS0001.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTCS0001.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTCS0001.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTCS0001.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Pos_X          IN RTCS0001.POS_X%TYPE,          /*X좌표                 */
    v_Pos_Y          IN RTCS0001.POS_Y%TYPE,          /*Y좌표                 */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE          /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.EQU_NO,                    /*설비번호            */
            A.ORD_NO,                    /*계약번호            */
            A.PROC_DAY,                  /*장착일자            */
            A.MAT_CD,                    /*상품코드            */
            A.MOB_NO,                    /*휴대폰번호          */
            A.TEL_NO,                    /*전화번호            */
            A.BLD_MNG_NO,                /*고객주소-우편번호PK(*/
            A.POS_CD,                    /*고객주소-우편번호   */
            A.ADDR1,                     /*고객주소-주소       */
            A.ADDR2,                     /*고객주소-상세주소   */
            A.TEL_NO2,                   /*전화번호            */
            A.BLD_MNG_NO2,               /*고객주소-우편번호PK(*/
            A.POS_CD2,                   /*고객주소-우편번호   */
            A.ADDR1_2,                   /*고객주소-주소       */
            A.ADDR2_2,                   /*고객주소-상세주소   */
            A.CAR_NO,                    /*차량번호            */
            A.CAR_OWNER,                 /*차량소유자          */
            A.CLOSE_YN,                  /*종료여부            */
            A.CLOSE_DAY,                 /*종료일자            */
            A.FL_YN,                     /*장착위-앞,왼쪽      */
            A.FR_YN,                     /*장착위치-앞,오른쪽  */
            A.RL_YN,                     /*장착위치-뒤,왼쪽    */
            A.RR_YN,                     /*장착위치-뒤,오른쪽  */
            A.POS_X,                     /*X좌표               */
            A.POS_Y,                     /*Y좌표               */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTCS0001 A
    WHERE   A.EQU_NO      = DECODE(v_Equ_No      , NULL, A.EQU_NO     , v_Equ_No)
    AND     A.ORD_NO      = DECODE(v_Ord_No      , NULL, A.ORD_NO     , v_Ord_No)
    AND     A.PROC_DAY    = DECODE(v_Proc_Day    , NULL, A.PROC_DAY   , v_Proc_Day)
    AND     A.MAT_CD      = DECODE(v_Mat_Cd      , NULL, A.MAT_CD     , v_Mat_Cd)
    AND     A.MOB_NO      = DECODE(v_Mob_No      , NULL, A.MOB_NO     , v_Mob_No)
    AND     A.TEL_NO      = DECODE(v_Tel_No      , NULL, A.TEL_NO     , v_Tel_No)
    AND     A.BLD_MNG_NO  = DECODE(v_Bld_Mng_No  , NULL, A.BLD_MNG_NO , v_Bld_Mng_No)
    AND     A.POS_CD      = DECODE(v_Pos_Cd      , NULL, A.POS_CD     , v_Pos_Cd)
    AND     A.ADDR1       = DECODE(v_Addr1       , NULL, A.ADDR1      , v_Addr1)
    AND     A.ADDR2       = DECODE(v_Addr2       , NULL, A.ADDR2      , v_Addr2)
    AND     A.TEL_NO2     = DECODE(v_Tel_No2     , NULL, A.TEL_NO2    , v_Tel_No2)
    AND     A.BLD_MNG_NO2 = DECODE(v_Bld_Mng_No2 , NULL, A.BLD_MNG_NO2, v_Bld_Mng_No2)
    AND     A.POS_CD2     = DECODE(v_Pos_Cd2     , NULL, A.POS_CD2    , v_Pos_Cd2)
    AND     A.ADDR1_2     = DECODE(v_Addr1_2     , NULL, A.ADDR1_2    , v_Addr1_2)
    AND     A.ADDR2_2     = DECODE(v_Addr2_2     , NULL, A.ADDR2_2    , v_Addr2_2)
    AND     A.CAR_NO      = DECODE(v_Car_No      , NULL, A.CAR_NO     , v_Car_No)
    AND     A.CAR_OWNER   = DECODE(v_Car_Owner   , NULL, A.CAR_OWNER  , v_Car_Owner)
    AND     A.CLOSE_YN    = DECODE(v_Close_Yn    , NULL, A.CLOSE_YN   , v_Close_Yn)
    AND     A.CLOSE_DAY   = DECODE(v_Close_Day   , NULL, A.CLOSE_DAY  , v_Close_Day)
    AND     A.FL_YN       = DECODE(v_Fl_Yn       , NULL, A.FL_YN      , v_Fl_Yn)
    AND     A.FR_YN       = DECODE(v_Fr_Yn       , NULL, A.FR_YN      , v_Fr_Yn)
    AND     A.RL_YN       = DECODE(v_Rl_Yn       , NULL, A.RL_YN      , v_Rl_Yn)
    AND     A.RR_YN       = DECODE(v_Rr_Yn       , NULL, A.RR_YN      , v_Rr_Yn)
    AND     A.POS_X       = DECODE(v_Pos_X       , NULL, A.POS_X      , v_Pos_X)
    AND     A.POS_Y       = DECODE(v_Pos_Y       , NULL, A.POS_Y      , v_Pos_Y)
    AND     A.REG_ID      = DECODE(v_Reg_Id      , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtcs0001;

  /*****************************************************************************
  -- 설비 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0001 (
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE,         /*설비번호              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTCS0001.PROC_DAY%TYPE,       /*장착일자              */
    v_Mat_Cd         IN RTCS0001.MAT_CD%TYPE,         /*상품코드              */
    v_Mob_No         IN RTCS0001.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTCS0001.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0001.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTCS0001.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTCS0001.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTCS0001.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTCS0001.TEL_NO2%TYPE,        /*전화번호              */
    v_Bld_Mng_No2    IN RTCS0001.BLD_MNG_NO2%TYPE,    /*고객주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTCS0001.POS_CD2%TYPE,        /*고객주소-우편번호     */
    v_Addr1_2        IN RTCS0001.ADDR1_2%TYPE,        /*고객주소-주소         */
    v_Addr2_2        IN RTCS0001.ADDR2_2%TYPE,        /*고객주소-상세주소     */
    v_Car_No         IN RTCS0001.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTCS0001.CAR_OWNER%TYPE,      /*차량소유자            */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*종료여부              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*종료일자              */
    v_Fl_Yn          IN RTCS0001.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTCS0001.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTCS0001.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTCS0001.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Pos_X          IN RTCS0001.POS_X%TYPE,          /*X좌표                 */
    v_Pos_Y          IN RTCS0001.POS_Y%TYPE,          /*Y좌표                 */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0001 (
            EQU_NO,
            ORD_NO,
            PROC_DAY,
            MAT_CD,
            MOB_NO,
            TEL_NO,
            BLD_MNG_NO,
            POS_CD,
            ADDR1,
            ADDR2,
            TEL_NO2,
            BLD_MNG_NO2,
            POS_CD2,
            ADDR1_2,
            ADDR2_2,
            CAR_NO,
            CAR_OWNER,
            CLOSE_YN,
            CLOSE_DAY,
            FL_YN,
            FR_YN,
            RL_YN,
            RR_YN,
            POS_X,
            POS_Y,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Equ_No,
            v_Ord_No,
            v_Proc_Day,
            v_Mat_Cd,
            v_Mob_No,
            v_Tel_No,
            v_Bld_Mng_No,
            v_Pos_Cd,
            v_Addr1,
            v_Addr2,
            v_Tel_No2,
            v_Bld_Mng_No2,
            v_Pos_Cd2,
            v_Addr1_2,
            v_Addr2_2,
            v_Car_No,
            v_Car_Owner,
            v_Close_Yn,
            v_Close_Day,
            v_Fl_Yn,
            v_Fr_Yn,
            v_Rl_Yn,
            v_Rr_Yn,
            v_Pos_X,
            v_Pos_Y,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0001;

  /*****************************************************************************
  -- 설비 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0001 (
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE,         /*설비번호              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTCS0001.PROC_DAY%TYPE,       /*장착일자              */
    v_Mat_Cd         IN RTCS0001.MAT_CD%TYPE,         /*상품코드              */
    v_Mob_No         IN RTCS0001.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTCS0001.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0001.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTCS0001.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTCS0001.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTCS0001.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTCS0001.TEL_NO2%TYPE,        /*전화번호              */
    v_Bld_Mng_No2    IN RTCS0001.BLD_MNG_NO2%TYPE,    /*고객주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTCS0001.POS_CD2%TYPE,        /*고객주소-우편번호     */
    v_Addr1_2        IN RTCS0001.ADDR1_2%TYPE,        /*고객주소-주소         */
    v_Addr2_2        IN RTCS0001.ADDR2_2%TYPE,        /*고객주소-상세주소     */
    v_Car_No         IN RTCS0001.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTCS0001.CAR_OWNER%TYPE,      /*차량소유자            */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*종료여부              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*종료일자              */
    v_Fl_Yn          IN RTCS0001.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTCS0001.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTCS0001.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTCS0001.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Pos_X          IN RTCS0001.POS_X%TYPE,          /*X좌표                 */
    v_Pos_Y          IN RTCS0001.POS_Y%TYPE,          /*Y좌표                 */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0001
    SET    ORD_NO      = v_Ord_No,
           PROC_DAY    = v_Proc_Day,
           MAT_CD      = v_Mat_Cd,
           MOB_NO      = v_Mob_No,
           TEL_NO      = v_Tel_No,
           BLD_MNG_NO  = v_Bld_Mng_No,
           POS_CD      = v_Pos_Cd,
           ADDR1       = v_Addr1,
           ADDR2       = v_Addr2,
           TEL_NO2     = v_Tel_No2,
           BLD_MNG_NO2 = v_Bld_Mng_No2,
           POS_CD2     = v_Pos_Cd2,
           ADDR1_2     = v_Addr1_2,
           ADDR2_2     = v_Addr2_2,
           CAR_NO      = v_Car_No,
           CAR_OWNER   = v_Car_Owner,
           CLOSE_YN    = v_Close_Yn,
           CLOSE_DAY   = v_Close_Day,
           FL_YN       = v_Fl_Yn,
           FR_YN       = v_Fr_Yn,
           RL_YN       = v_Rl_Yn,
           RR_YN       = v_Rr_Yn,
           POS_X       = v_Pos_X,
           POS_Y       = v_Pos_Y,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE 
    WHERE  EQU_NO      = v_Equ_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0001;

  /*****************************************************************************
  -- 설비 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0001 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Equ_No         IN OUT RTCS0001.EQU_NO%TYPE,     /*설비번호              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*계약번호              */
    v_Proc_Day       IN RTCS0001.PROC_DAY%TYPE,       /*장착일자              */
    v_Mat_Cd         IN RTCS0001.MAT_CD%TYPE,         /*상품코드              */
    v_Mob_No         IN RTCS0001.MOB_NO%TYPE,         /*휴대폰번호            */
    v_Tel_No         IN RTCS0001.TEL_NO%TYPE,         /*전화번호              */
    v_Bld_Mng_No     IN RTCS0001.BLD_MNG_NO%TYPE,     /*고객주소-우편번호PK(건*/
    v_Pos_Cd         IN RTCS0001.POS_CD%TYPE,         /*고객주소-우편번호     */
    v_Addr1          IN RTCS0001.ADDR1%TYPE,          /*고객주소-주소         */
    v_Addr2          IN RTCS0001.ADDR2%TYPE,          /*고객주소-상세주소     */
    v_Tel_No2        IN RTCS0001.TEL_NO2%TYPE,        /*전화번호              */
    v_Bld_Mng_No2    IN RTCS0001.BLD_MNG_NO2%TYPE,    /*고객주소-우편번호PK(건*/
    v_Pos_Cd2        IN RTCS0001.POS_CD2%TYPE,        /*고객주소-우편번호     */
    v_Addr1_2        IN RTCS0001.ADDR1_2%TYPE,        /*고객주소-주소         */
    v_Addr2_2        IN RTCS0001.ADDR2_2%TYPE,        /*고객주소-상세주소     */
    v_Car_No         IN RTCS0001.CAR_NO%TYPE,         /*차량번호              */
    v_Car_Owner      IN RTCS0001.CAR_OWNER%TYPE,      /*차량소유자            */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*종료여부              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*종료일자              */
    v_Fl_Yn          IN RTCS0001.FL_YN%TYPE,          /*장착위-앞,왼쪽        */
    v_Fr_Yn          IN RTCS0001.FR_YN%TYPE,          /*장착위치-앞,오른쪽    */
    v_Rl_Yn          IN RTCS0001.RL_YN%TYPE,          /*장착위치-뒤,왼쪽      */
    v_Rr_Yn          IN RTCS0001.RR_YN%TYPE,          /*장착위치-뒤,오른쪽    */
    v_Pos_X          IN RTCS0001.POS_X%TYPE,          /*X좌표                 */
    v_Pos_Y          IN RTCS0001.POS_Y%TYPE,          /*Y좌표                 */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 계약번호, 상품코드, 장착일자, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Mat_Cd) IS NULL) OR (0 = Pkg_Rtsd0005.f_sRtsd0005Count(v_Mat_Cd)) THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 != ISDATE(v_Proc_Day) THEN
        v_Return_Message := '장착일자('||v_Proc_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN
    
        v_Equ_No := f_sRtcs0001EquNo(v_Ord_No);
        
        IF 0 != f_InsertRtcs0001(v_Equ_No, v_Ord_No, v_Proc_Day, v_Mat_Cd, 
                                 v_Mob_No, v_Tel_No, v_Bld_Mng_No, v_Pos_Cd, 
                                 v_Addr1, v_Addr2, v_Tel_No2, v_Bld_Mng_No2, 
                                 v_Pos_Cd2, v_Addr1_2, v_Addr2_2, v_Car_No, 
                                 v_Car_Owner, v_Close_Yn, v_Close_Day, v_Fl_Yn, 
                                 v_Fr_Yn, v_Rl_Yn, v_Rr_Yn, v_Pos_X, 
                                 v_Pos_Y, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '설비 정보 등록실패!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF 0 = f_sRtcs0001Count(v_Equ_No) THEN        
            v_Return_Message := '해당 설비번호('||v_Equ_No||')로 등록된 정보가 없서 변경이 불가 합니다!';
            RAISE e_Error;
        END IF;
        
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0001(v_Equ_No, v_Ord_No, v_Proc_Day, v_Mat_Cd, 
                                     v_Mob_No, v_Tel_No, v_Bld_Mng_No, v_Pos_Cd, 
                                     v_Addr1, v_Addr2, v_Tel_No2, v_Bld_Mng_No2, 
                                     v_Pos_Cd2, v_Addr1_2, v_Addr2_2, v_Car_No, 
                                     v_Car_Owner, v_Close_Yn, v_Close_Day, v_Fl_Yn, 
                                     v_Fr_Yn, v_Rl_Yn, v_Rr_Yn, v_Pos_X, 
                                     v_Pos_Y, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '설비 정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
        ELSE
            v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 등록되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0001.p_IUDRtcs0001(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0001.p_IUDRtcs0001(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0001;

  /*****************************************************************************
  -- 설비 정보 - 설비번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0001EquNo(
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR IS
    v_Equ_No    RTCS0001.EQU_NO%TYPE DEFAULT NULL;       /*설비번호            */
  BEGIN

    -- 설비번호 : 계약번호(12) + SEQ(3)
    SELECT  v_Ord_No||LPAD(NVL((SELECT  /*+ INDEX_DESC ( RTCS0001 RTCS0001_PK ) */ 
                                        SUBSTR(EQU_NO,13,3)
                                FROM    RTCS0001
                                WHERE   ORD_NO = v_Ord_No
                                AND     ROWNUM <= 1) +1, 1) ,3,'0')
    INTO    v_Equ_No
    FROM    DUAL;

    RETURN v_Equ_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0001EquNo;

  
  /*****************************************************************************
  -- 설비 정보 Update - 중도완납
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0001Cancel (
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE,         /*설비번호              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*계약번호              */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*종료여부              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*종료일자              */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0001
    SET    CLOSE_YN  = v_Close_Yn,
           CLOSE_DAY = v_Close_Day,
           CHG_ID    = v_Reg_Id,
           CHG_DT    = SYSDATE 
    WHERE  EQU_NO    = v_Equ_No
    AND    ORD_NO    = v_Ord_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0001Cancel;


  /*****************************************************************************
  -- 설비 정보 - 계약번호로 설비번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0001OrdNoForEquNo(
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR IS
    v_Equ_No RTCS0001.EQU_NO%TYPE DEFAULT NULL;       /*설비번호              */
  BEGIN

    SELECT  EQU_NO
    INTO    v_Equ_No
    FROM    RTCS0001
    WHERE   ORD_NO = v_Ord_No
    AND     ROWNUM <= 1;

    RETURN v_Equ_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0001OrdNoForEquNo;
  
END Pkg_Rtcs0001;
/