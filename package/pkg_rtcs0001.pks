CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0001 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0001
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
    ) RETURN NUMBER;

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

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
    );
    
  /*****************************************************************************
  -- 설비 정보 - 설비번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0001EquNo(
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR;


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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 설비 정보 - 계약번호로 설비번호 획득
  *****************************************************************************/
  FUNCTION f_sRtcs0001OrdNoForEquNo(
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE          /*계약번호              */
    ) RETURN VARCHAR;
        
END Pkg_Rtcs0001;
/
