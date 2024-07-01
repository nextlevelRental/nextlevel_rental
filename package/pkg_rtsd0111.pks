CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0111 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0111
   PURPOSE   개인정보제공 동의 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-06  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 개인정보제공 동의 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0111Count(
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,          /*고객번호            */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,           /*동의일자            */
    v_Seq            IN RTSD0111.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인정보제공 동의 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0111 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_FDay        IN RTSD0111.AG_DAY%TYPE,         /*동의일자FROM          */
    v_Ag_TDay        IN RTSD0111.AG_DAY%TYPE          /*동의일자TO            */
    );

  /*****************************************************************************
  -- 개인정보제공 동의 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0111 (
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN RTSD0111.SEQ%TYPE,            /*순번                  */
    v_Safekey        IN RTSD0111.SAFEKEY%TYPE,        /*인증번호              */
    v_Nag_Yn         IN RTSD0111.NAG_YN%TYPE,         /*필수동의항목          */
    v_Cag_Yn         IN RTSD0111.CAG_YN%TYPE,         /*선택동의항목          */
    v_Cag_Yn1        IN RTSD0111.CAG_YN1%TYPE,        /*선택동의1-SMS(문자)   */
    v_Cag_Yn2        IN RTSD0111.CAG_YN2%TYPE,        /*선택동의1-전화        */
    v_Cag_Yn3        IN RTSD0111.CAG_YN3%TYPE,        /*선택동의1-이메일      */
    v_Cag_Yn4        IN RTSD0111.CAG_YN4%TYPE,        /*선택동의1-주소(우편)  */
    v_Cag_Yn5        IN RTSD0111.CAG_YN5%TYPE,        /*선택동의1-카카오알림톡 */
    v_Cth_Yn1        IN RTSD0111.CTH_YN1%TYPE,        /*선택_3자제공1         */
    v_Cth_Yn2        IN RTSD0111.CTH_YN2%TYPE,        /*선택_3자제공2         */
    v_Cth_Yn3        IN RTSD0111.CTH_YN3%TYPE,        /*선택_3자제공3         */
    v_Mag_Yn1        IN RTSD0111.MAG_YN1%TYPE,        /*선택_마케팅동의1       */
    v_Mag_Yn2        IN RTSD0111.MAG_YN2%TYPE,        /*선택_마케팅동의2       */
    v_File_Path      IN RTSD0111.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0111.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Input_Dt       IN RTSD0111.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_Input_Lgl_Path IN RTSD0111.INPUT_LGL_PATH%TYPE, /*인입채널대분류         */
    v_Input_Mdl_Path IN RTSD0111.INPUT_MDL_PATH%TYPE, /*인입채널중분류         */
    v_Reg_Id         IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인정보제공 동의 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0111 (
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN RTSD0111.SEQ%TYPE,            /*순번                  */
    v_Safekey        IN RTSD0111.SAFEKEY%TYPE,        /*인증번호              */
    v_Nag_Yn         IN RTSD0111.NAG_YN%TYPE,         /*필수동의항목          */
    v_Cag_Yn         IN RTSD0111.CAG_YN%TYPE,         /*선택동의항목          */
    v_Cag_Yn1        IN RTSD0111.CAG_YN1%TYPE,        /*선택동의1-SMS(문자)   */
    v_Cag_Yn2        IN RTSD0111.CAG_YN2%TYPE,        /*선택동의1-전화        */
    v_Cag_Yn3        IN RTSD0111.CAG_YN3%TYPE,        /*선택동의1-이메일      */
    v_Cag_Yn4        IN RTSD0111.CAG_YN4%TYPE,        /*선택동의1-주소(우편)  */
    v_Cag_Yn5        IN RTSD0111.CAG_YN5%TYPE,        /*선택동의1-카카오알림톡 */
    v_Cth_Yn1        IN RTSD0111.CTH_YN1%TYPE,        /*선택_3자제공1         */
    v_Cth_Yn2        IN RTSD0111.CTH_YN2%TYPE,        /*선택_3자제공2         */
    v_Cth_Yn3        IN RTSD0111.CTH_YN3%TYPE,        /*선택_3자제공3         */
    v_Mag_Yn1        IN RTSD0111.MAG_YN1%TYPE,        /*선택_마케팅동의1       */
    v_Mag_Yn2        IN RTSD0111.MAG_YN2%TYPE,        /*선택_마케팅동의2       */
    v_File_Path      IN RTSD0111.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0111.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Input_Dt       IN RTSD0111.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_Input_Lgl_Path IN RTSD0111.INPUT_LGL_PATH%TYPE, /*인입채널대분류         */
    v_Input_Mdl_Path IN RTSD0111.INPUT_MDL_PATH%TYPE, /*인입채널중분류         */
    v_Reg_Id         IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인정보제공 동의 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0111 (
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN RTSD0111.SEQ%TYPE,            /*순번                  */
    v_Reg_Id         IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인정보제공 동의 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0111 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN OUT RTSD0111.SEQ%TYPE,        /*순번                  */
    v_Safekey        IN OUT RTSD0111.SAFEKEY%TYPE,    /*인증번호              */
    v_Nag_Yn         IN RTSD0111.NAG_YN%TYPE,         /*필수동의항목          */
    v_Cag_Yn         IN RTSD0111.CAG_YN%TYPE,         /*선택동의항목          */
    v_Cag_Yn1        IN RTSD0111.CAG_YN1%TYPE,        /*선택동의1-SMS(문자)   */
    v_Cag_Yn2        IN RTSD0111.CAG_YN2%TYPE,        /*선택동의1-전화        */
    v_Cag_Yn3        IN RTSD0111.CAG_YN3%TYPE,        /*선택동의1-이메일      */
    v_Cag_Yn4        IN RTSD0111.CAG_YN4%TYPE,        /*선택동의1-주소(우편)  */
    v_Cag_Yn5        IN RTSD0111.CAG_YN5%TYPE,        /*선택동의1-카카오알림톡 */
    v_Cth_Yn1        IN RTSD0111.CTH_YN1%TYPE,        /*선택_3자제공1         */
    v_Cth_Yn2        IN RTSD0111.CTH_YN2%TYPE,        /*선택_3자제공2         */
    v_Cth_Yn3        IN RTSD0111.CTH_YN3%TYPE,        /*선택_3자제공3         */
    v_Mag_Yn1        IN RTSD0111.MAG_YN1%TYPE,        /*선택_마케팅동의1       */
    v_Mag_Yn2        IN RTSD0111.MAG_YN2%TYPE,        /*선택_마케팅동의2       */
    v_File_Path      IN RTSD0111.FILE_PATH%TYPE,      /*개인정보 제공동의서 파*/
    v_File_Name      IN RTSD0111.FILE_NAME%TYPE,      /*개인정보 제공동의서 파*/
    v_Input_Dt       IN RTSD0111.INPUT_DT%TYPE,       /*PAD입력일시           */
    v_Input_Lgl_Path IN RTSD0111.INPUT_LGL_PATH%TYPE, /*인입채널대분류         */
    v_Input_Mdl_Path IN RTSD0111.INPUT_MDL_PATH%TYPE, /*인입채널중분류         */
    v_Reg_Id         IN RTSD0111.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- 개인정보제공 동의 - 순번 췌번 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0111Seq(
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,          /*고객번호            */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE            /*동의일자            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 개인정보제공 동의 NAG_YN 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0111SelectNagYn(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE          /*고객번호            */
    );
    
  /*****************************************************************************
  -- 개인정보제공 동의 NAG_YN 조회
  *****************************************************************************/
  PROCEDURE p_sRtsd0111SelectNagYn2(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cust_No        IN RTSD0111.CUST_NO%TYPE,        /*고객번호              */
    v_Ag_Day         IN RTSD0111.AG_DAY%TYPE,         /*동의일자              */
    v_Seq            IN RTSD0111.SEQ%TYPE             /*순번                  */
    );
END Pkg_Rtsd0111;
/
