CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtcs0001 AS
/*******************************************************************************
   NAME:      Pkg_Rtcs0001
   PURPOSE   ���� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-24  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- ���� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtcs0001Count(
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE            /*�����ȣ            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtcs0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE,         /*�����ȣ              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*����ȣ              */
    v_Proc_Day       IN RTCS0001.PROC_DAY%TYPE,       /*��������              */
    v_Mat_Cd         IN RTCS0001.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Mob_No         IN RTCS0001.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTCS0001.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0001.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTCS0001.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTCS0001.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTCS0001.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTCS0001.TEL_NO2%TYPE,        /*��ȭ��ȣ              */
    v_Bld_Mng_No2    IN RTCS0001.BLD_MNG_NO2%TYPE,    /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTCS0001.POS_CD2%TYPE,        /*���ּ�-�����ȣ     */
    v_Addr1_2        IN RTCS0001.ADDR1_2%TYPE,        /*���ּ�-�ּ�         */
    v_Addr2_2        IN RTCS0001.ADDR2_2%TYPE,        /*���ּ�-���ּ�     */
    v_Car_No         IN RTCS0001.CAR_NO%TYPE,         /*������ȣ              */
    v_Car_Owner      IN RTCS0001.CAR_OWNER%TYPE,      /*����������            */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*���Ῡ��              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*��������              */
    v_Fl_Yn          IN RTCS0001.FL_YN%TYPE,          /*������-��,����        */
    v_Fr_Yn          IN RTCS0001.FR_YN%TYPE,          /*������ġ-��,������    */
    v_Rl_Yn          IN RTCS0001.RL_YN%TYPE,          /*������ġ-��,����      */
    v_Rr_Yn          IN RTCS0001.RR_YN%TYPE,          /*������ġ-��,������    */
    v_Pos_X          IN RTCS0001.POS_X%TYPE,          /*X��ǥ                 */
    v_Pos_Y          IN RTCS0001.POS_Y%TYPE,          /*Y��ǥ                 */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtcs0001 (
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE,         /*�����ȣ              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*����ȣ              */
    v_Proc_Day       IN RTCS0001.PROC_DAY%TYPE,       /*��������              */
    v_Mat_Cd         IN RTCS0001.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Mob_No         IN RTCS0001.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTCS0001.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0001.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTCS0001.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTCS0001.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTCS0001.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTCS0001.TEL_NO2%TYPE,        /*��ȭ��ȣ              */
    v_Bld_Mng_No2    IN RTCS0001.BLD_MNG_NO2%TYPE,    /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTCS0001.POS_CD2%TYPE,        /*���ּ�-�����ȣ     */
    v_Addr1_2        IN RTCS0001.ADDR1_2%TYPE,        /*���ּ�-�ּ�         */
    v_Addr2_2        IN RTCS0001.ADDR2_2%TYPE,        /*���ּ�-���ּ�     */
    v_Car_No         IN RTCS0001.CAR_NO%TYPE,         /*������ȣ              */
    v_Car_Owner      IN RTCS0001.CAR_OWNER%TYPE,      /*����������            */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*���Ῡ��              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*��������              */
    v_Fl_Yn          IN RTCS0001.FL_YN%TYPE,          /*������-��,����        */
    v_Fr_Yn          IN RTCS0001.FR_YN%TYPE,          /*������ġ-��,������    */
    v_Rl_Yn          IN RTCS0001.RL_YN%TYPE,          /*������ġ-��,����      */
    v_Rr_Yn          IN RTCS0001.RR_YN%TYPE,          /*������ġ-��,������    */
    v_Pos_X          IN RTCS0001.POS_X%TYPE,          /*X��ǥ                 */
    v_Pos_Y          IN RTCS0001.POS_Y%TYPE,          /*Y��ǥ                 */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0001 (
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE,         /*�����ȣ              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*����ȣ              */
    v_Proc_Day       IN RTCS0001.PROC_DAY%TYPE,       /*��������              */
    v_Mat_Cd         IN RTCS0001.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Mob_No         IN RTCS0001.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTCS0001.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0001.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTCS0001.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTCS0001.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTCS0001.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTCS0001.TEL_NO2%TYPE,        /*��ȭ��ȣ              */
    v_Bld_Mng_No2    IN RTCS0001.BLD_MNG_NO2%TYPE,    /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTCS0001.POS_CD2%TYPE,        /*���ּ�-�����ȣ     */
    v_Addr1_2        IN RTCS0001.ADDR1_2%TYPE,        /*���ּ�-�ּ�         */
    v_Addr2_2        IN RTCS0001.ADDR2_2%TYPE,        /*���ּ�-���ּ�     */
    v_Car_No         IN RTCS0001.CAR_NO%TYPE,         /*������ȣ              */
    v_Car_Owner      IN RTCS0001.CAR_OWNER%TYPE,      /*����������            */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*���Ῡ��              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*��������              */
    v_Fl_Yn          IN RTCS0001.FL_YN%TYPE,          /*������-��,����        */
    v_Fr_Yn          IN RTCS0001.FR_YN%TYPE,          /*������ġ-��,������    */
    v_Rl_Yn          IN RTCS0001.RL_YN%TYPE,          /*������ġ-��,����      */
    v_Rr_Yn          IN RTCS0001.RR_YN%TYPE,          /*������ġ-��,������    */
    v_Pos_X          IN RTCS0001.POS_X%TYPE,          /*X��ǥ                 */
    v_Pos_Y          IN RTCS0001.POS_Y%TYPE,          /*Y��ǥ                 */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0001 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Equ_No         IN OUT RTCS0001.EQU_NO%TYPE,     /*�����ȣ              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*����ȣ              */
    v_Proc_Day       IN RTCS0001.PROC_DAY%TYPE,       /*��������              */
    v_Mat_Cd         IN RTCS0001.MAT_CD%TYPE,         /*��ǰ�ڵ�              */
    v_Mob_No         IN RTCS0001.MOB_NO%TYPE,         /*�޴�����ȣ            */
    v_Tel_No         IN RTCS0001.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Bld_Mng_No     IN RTCS0001.BLD_MNG_NO%TYPE,     /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd         IN RTCS0001.POS_CD%TYPE,         /*���ּ�-�����ȣ     */
    v_Addr1          IN RTCS0001.ADDR1%TYPE,          /*���ּ�-�ּ�         */
    v_Addr2          IN RTCS0001.ADDR2%TYPE,          /*���ּ�-���ּ�     */
    v_Tel_No2        IN RTCS0001.TEL_NO2%TYPE,        /*��ȭ��ȣ              */
    v_Bld_Mng_No2    IN RTCS0001.BLD_MNG_NO2%TYPE,    /*���ּ�-�����ȣPK(��*/
    v_Pos_Cd2        IN RTCS0001.POS_CD2%TYPE,        /*���ּ�-�����ȣ     */
    v_Addr1_2        IN RTCS0001.ADDR1_2%TYPE,        /*���ּ�-�ּ�         */
    v_Addr2_2        IN RTCS0001.ADDR2_2%TYPE,        /*���ּ�-���ּ�     */
    v_Car_No         IN RTCS0001.CAR_NO%TYPE,         /*������ȣ              */
    v_Car_Owner      IN RTCS0001.CAR_OWNER%TYPE,      /*����������            */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*���Ῡ��              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*��������              */
    v_Fl_Yn          IN RTCS0001.FL_YN%TYPE,          /*������-��,����        */
    v_Fr_Yn          IN RTCS0001.FR_YN%TYPE,          /*������ġ-��,������    */
    v_Rl_Yn          IN RTCS0001.RL_YN%TYPE,          /*������ġ-��,����      */
    v_Rr_Yn          IN RTCS0001.RR_YN%TYPE,          /*������ġ-��,������    */
    v_Pos_X          IN RTCS0001.POS_X%TYPE,          /*X��ǥ                 */
    v_Pos_Y          IN RTCS0001.POS_Y%TYPE,          /*Y��ǥ                 */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ���� ���� - �����ȣ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0001EquNo(
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- ���� ���� Update - �ߵ��ϳ�
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0001Cancel (
    v_Equ_No         IN RTCS0001.EQU_NO%TYPE,         /*�����ȣ              */
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE,         /*����ȣ              */
    v_Close_Yn       IN RTCS0001.CLOSE_YN%TYPE,       /*���Ῡ��              */
    v_Close_Day      IN RTCS0001.CLOSE_DAY%TYPE,      /*��������              */
    v_Reg_Id         IN RTCS0001.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� ���� - ����ȣ�� �����ȣ ȹ��
  *****************************************************************************/
  FUNCTION f_sRtcs0001OrdNoForEquNo(
    v_Ord_No         IN RTCS0001.ORD_NO%TYPE          /*����ȣ              */
    ) RETURN VARCHAR;
        
END Pkg_Rtcs0001;
/
