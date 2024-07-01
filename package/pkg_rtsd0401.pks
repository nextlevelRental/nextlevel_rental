CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0401 AS
/*******************************************************************************
    NAME        Pkg_Rtsd0401
    PURPOSE     �湮���� ���� ����

    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-24  wjim            [20181122_01] Created this package spec.
    1.2     2019-01-24  wjim            [20190124_01] �湮���� ���� �����ȸ ��ȸ���� �߰�
*******************************************************************************/

  /*****************************************************************************
  -- �湮���� ���� Count
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_sRtsd0401Count(
    v_Ord_No         IN RTSD0401.ORD_NO%TYPE            /*����ȣ            */
  ) RETURN NUMBER;
  
  /*****************************************************************************
  -- �湮���� ���� ��� Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-12-01  wjim            [20181122_01] Created this package spec.
    1.2     2019-01-24  wjim            [20190124_01] ��ȸ���� �߰�
                                        - �����������(from~to)
  *****************************************************************************/
  PROCEDURE p_sRTSD0401 (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Agency_Cd       IN RTSD0401.AGENCY_CD%TYPE     /*�븮����ȣ           */
    , v_Proc_Day_F      IN RTSD0401.PROC_DAY%TYPE      /*������������(from)   */   
    , v_Proc_Day_T      IN RTSD0401.PROC_DAY%TYPE      /*������������(to)     */
    , v_Stat_Cd         IN RTSD0401.STAT_CD%TYPE       /*�����ڵ�(S105)       */
    , v_Stat_Dtl_Cd     IN RTSD0401.STAT_DTL_CD%TYPE   /*���¼����ڵ�(S106)   */    
    , v_Cust_Nm         IN RTSD0100.CUST_NM%TYPE       /*����               */
    , v_Mob_No          IN RTSD0401.MOB_NO%TYPE        /*�޴�����ȣ           */
    , v_Ord_No          IN RTSD0401.ORD_NO%TYPE        /*����ȣ             */
    , v_Ord_Day_F       IN RTSD0104.ORD_Day%TYPE       /*�����������(from)   */
    , v_Ord_Day_T       IN RTSD0104.ORD_Day%TYPE       /*�����������(from)   */
  );

  /*****************************************************************************
  -- �湮���� ���� Insert
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_InsertRtsd0401 (
      v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*����ȣ              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*�븮����ȣ            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*������û����          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*������������          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*�������ǽð�          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*����ó                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*�ǹ���ȣ              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*�����ȣ              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*�ּ�                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*���ּ�              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*�����ڵ�(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*���¼����ڵ�(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*�޸�                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� ���� Update
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0401 (
      v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*����ȣ              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*�븮����ȣ            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*������û����          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*������������          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*�������ǽð�          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*����ó                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*�ǹ���ȣ              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*�����ȣ              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*�ּ�                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*���ּ�              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*�����ڵ�(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*���¼����ڵ�(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*�޸�                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*����� ID             */
    , v_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER;

  /*****************************************************************************
  -- �湮���� ���� ����(IUD)
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-26  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0401 (
      v_Comm_Dvsn      IN CHAR                        /*ó������(I,U,D)       */
    , v_Ord_No         IN RTSD0401.ORD_NO%TYPE        /*����ȣ              */
    , v_Agency_Cd      IN RTSD0401.AGENCY_CD%TYPE     /*�븮����ȣ            */
    , v_Req_Day        IN RTSD0401.REQ_DAY%TYPE       /*������û����          */
    , v_Proc_Day       IN RTSD0401.PROC_DAY%TYPE      /*������������          */
    , v_Proc_Tm        IN RTSD0401.PROC_TM%TYPE       /*�������ǽð�          */
    , v_Mob_No         IN RTSD0401.MOB_NO%TYPE        /*����ó                */
    , v_Bld_Mng_No     IN RTSD0401.BLD_MNG_NO%TYPE    /*�ǹ���ȣ              */
    , v_Poscd          IN RTSD0401.POSCD%TYPE         /*�����ȣ              */
    , v_Addr1          IN RTSD0401.ADDR1%TYPE         /*�ּ�                  */
    , v_Addr2          IN RTSD0401.ADDR2%TYPE         /*���ּ�              */
    , v_Stat_Cd        IN RTSD0401.STAT_CD%TYPE       /*�����ڵ�(S105)        */
    , v_Stat_Dtl_Cd    IN RTSD0401.STAT_DTL_CD%TYPE   /*���¼����ڵ�(S106)    */
    , v_Memo           IN RTSD0401.MEMO%TYPE          /*�޸�                  */
    , v_Reg_Id         IN RTSD0401.REG_ID%TYPE        /*����� ID             */
    , v_Success_Code   OUT NUMBER
    , v_Return_Message OUT VARCHAR2
    , v_ErrorText      OUT VARCHAR2
  );
    
  /*****************************************************************************
  -- �湮���� ���� Select
  
    REVISIONS
    Ver     Date        Author          Description
    -----   ----------  --------------  -------------------------------------
    1.0     2018-11-24  wjim            [20181122_01] Created this package spec.
  *****************************************************************************/
  PROCEDURE p_sRTSD0401CountPerStat (
      Ref_Cursor        IN OUT SYS_REFCURSOR
    , v_Agency_Cd       IN RTSD0401.AGENCY_CD%TYPE      /* �븮����ȣ         */  
    , v_Proc_Day_F      IN RTSD0401.PROC_DAY%TYPE       /* ������������(from) */   
    , v_Proc_Day_T      IN RTSD0401.PROC_DAY%TYPE       /* ������������(to)   */   
  );

        
END Pkg_Rtsd0401;
/
