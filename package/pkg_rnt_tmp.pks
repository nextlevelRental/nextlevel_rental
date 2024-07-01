CREATE OR REPLACE PACKAGE NXRADMIN.PKG_RNT_TMP AS
/******************************************************************************
   NAME:       PKG_RNT_TMP
   PURPOSE:    �������� COMMON PACKAGE TEMP VER

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-12-20  ncho             1. Created this package.
******************************************************************************/
    TYPE TYP_ARR_VARCHAR IS TABLE OF VARCHAR2(4000) INDEX BY BINARY_INTEGER;

    /** �⺻ ���� �޽��� */
    GV_ARR_ERR_MESG TYP_ARR_VARCHAR;
    GV_ERR_OK       NUMBER(3);  -- OK!
    GV_ERR_OPN      NUMBER(3);  -- OPERATION ERROR
    GV_ERR_DUP      NUMBER(3);  -- DUPLICATION ERROR
    GV_ERR_NOF      NUMBER(3);  -- NOT FOUND ERROR
    GV_ERR_SQL      NUMBER(3);  -- SQL ERROR

/******************************************************************************
    �μ�Ƽ�� �������� �������� ���� ��ȸ(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_INC_BAS_AGGR_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                        , V_SLCM_YM  IN RTRE7040.SLCM_YM%TYPE /* ������ */
  	);

/******************************************************************************
    �μ�Ƽ�� / ����� �Ǹ����� �������� ���� ��ȸ(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_INC_SBS_SLS_AGGR_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                            , V_SLCM_YM  IN VARCHAR2 /* ������ */
                                            , V_AGG_GRP  IN VARCHAR2 /* ����׷� */
    );

/******************************************************************************
    ��������̷� ��ȸ(Temp Ver)
 ******************************************************************************/
    PROCEDURE PRC_LIST_AGGR_EXEC_HST_TMP(  REF_CURSOR IN OUT SYS_REFCURSOR
                                         , V_SLCM_YM  IN RTHS7000.SLCM_YM%TYPE /* ������ */
    );
END PKG_RNT_TMP;
/
