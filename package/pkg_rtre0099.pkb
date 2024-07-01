CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0099 AS
/*******************************************************************************
   NAME      Pkg_Rtre0099
   PURPOSE   �ۼ��� �۾� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
   1.1        2016-09-13  �ӿ���           ���½�û��� '�������'�� ���� �������ó��  
*******************************************************************************/

  /*****************************************************************************
  -- �ۼ��� �۾� Count
  *****************************************************************************/
  FUNCTION f_sRtre0099Count(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*���ϸ�              */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE          /*���ϼ���            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0099
    WHERE   FILE_TP  = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     FILE_SEQ = v_File_Seq;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0099Count;

  /*****************************************************************************
  -- �ۼ��� �۾� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0099 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*������迩��          */
    v_Confi_Yn       IN RTRE0099.CONFI_YN%TYPE,       /*���Ȯ�ο���          */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*���ϻ�������          */
    v_Ftran_Yn       IN RTRE0099.FTRAN_YN%TYPE,       /*�������ۿ���          */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*��������ü����        */
    v_Str_Day        IN RTRE0099.STR_DAY%TYPE,        /*������ ������       */
    v_End_Day        IN RTRE0099.END_DAY%TYPE,        /*������ ������       */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER ���翩��       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*������ �ѰǼ�         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*������ �ѱݾ�         */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*�������������Ǽ�      */
    v_Reqst_Cnt      IN RTRE0099.REQST_CNT%TYPE,      /*��û�Ǽ�              */
    v_Reqst_Amt      IN RTRE0099.REQST_AMT%TYPE,      /*��û�ݾ�              */
    v_Cncrq_Cnt      IN RTRE0099.CNCRQ_CNT%TYPE,      /*��ҿ�û�Ǽ�          */
    v_Cncrq_Amt      IN RTRE0099.CNCRQ_AMT%TYPE,      /*��ҿ�û�ݾ�          */
    v_Srecp_Cnt      IN RTRE0099.SRECP_CNT%TYPE,      /*������� ó���Ǽ�     */
    v_Srecp_Amt      IN RTRE0099.SRECP_AMT%TYPE,      /*������� ó���ݾ�     */
    v_Hsrcp_Cnt      IN RTRE0099.HSRCP_CNT%TYPE,      /*�κа��� ó���Ǽ�     */
    v_Hsrcp_Amt      IN RTRE0099.HSRCP_AMT%TYPE,      /*�κа��� ó���ݾ�     */
    v_Erecp_Cnt      IN RTRE0099.ERECP_CNT%TYPE,      /*�������� ó���Ǽ�     */
    v_Erecp_Amt      IN RTRE0099.ERECP_AMT%TYPE,      /*�������� ó���ݾ�     */
    v_Scnrq_Cnt      IN RTRE0099.SCNRQ_CNT%TYPE,      /*������� ó���Ǽ�     */
    v_Scnrq_Amt      IN RTRE0099.SCNRQ_AMT%TYPE,      /*������� ó���ݾ�     */
    v_Ecnrq_Cnt      IN RTRE0099.ECNRQ_CNT%TYPE,      /*��ҿ��� ó���Ǽ�     */
    v_Ecnrq_Amt      IN RTRE0099.ECNRQ_AMT%TYPE,      /*��ҿ��� ó���ݾ�     */
    v_Del_Yn         IN RTRE0099.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE          /*����� ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.FILE_TP,                   /*�ۼ������ϱ���      */
            A.RQST_DAY,                  /*��û����            */
            A.FILE_NM,                   /*���ϸ�              */
            A.FILE_SEQ,                  /*���ϼ���            */
            A.EXTRC_YN,                  /*������迩��        */
            A.CONFI_YN,                  /*���Ȯ�ο���        */
            A.FCRET_YN,                  /*���ϻ�������        */
            A.FTRAN_YN,                  /*�������ۿ���        */
            A.STDEX_DD,                  /*��������ü����      */
            A.STR_DAY,                   /*������ ������     */
            A.END_DAY,                   /*������ ������     */
            A.HEADER_YN,                 /*HEADER ���翩��     */
            A.TRAILER_YN,                /*TRAILER ���翩��    */
            A.TDATA_CNT,                 /*������ �ѰǼ�       */
            A.TDATA_AMT,                 /*������ �ѱݾ�       */
            A.ACRQ_CNT,                  /*���½�û�Ǽ�        */
            A.ACCNRQ_CNT,                /*���������Ǽ�        */
            A.RMCNRQ_CNT,                /*�������������Ǽ�    */
            A.REQST_CNT,                 /*��û�Ǽ�            */
            A.REQST_AMT,                 /*��û�ݾ�            */
            A.CNCRQ_CNT,                 /*��ҿ�û�Ǽ�        */
            A.CNCRQ_AMT,                 /*��ҿ�û�ݾ�        */
            A.SRECP_CNT,                 /*������� ó���Ǽ�   */
            A.SRECP_AMT,                 /*������� ó���ݾ�   */
            A.HSRCP_CNT,                 /*�κа��� ó���Ǽ�   */
            A.HSRCP_AMT,                 /*�κа��� ó���ݾ�   */
            A.ERECP_CNT,                 /*�������� ó���Ǽ�   */
            A.ERECP_AMT,                 /*�������� ó���ݾ�   */
            A.SCNRQ_CNT,                 /*������� ó���Ǽ�   */
            A.SCNRQ_AMT,                 /*������� ó���ݾ�   */
            A.ECNRQ_CNT,                 /*��ҿ��� ó���Ǽ�   */
            A.ECNRQ_AMT,                 /*��ҿ��� ó���ݾ�   */
            A.DEL_YN,                    /*��������            */
            A.REG_ID,                    /*����� ID           */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ ID           */
            A.CHG_DT                     /*������              */
    FROM    RTRE0099 A
    WHERE   A.FILE_TP    = DECODE(v_File_Tp    , NULL, A.FILE_TP    , v_File_Tp)
    AND     A.RQST_DAY   = DECODE(v_Rqst_Day   , NULL, A.RQST_DAY   , v_Rqst_Day)
    AND     A.FILE_NM    = DECODE(v_File_Nm    , NULL, A.FILE_NM    , v_File_Nm)
    AND     A.FILE_SEQ   = DECODE(v_File_Seq   , NULL, A.FILE_SEQ   , v_File_Seq)
    AND     A.EXTRC_YN   = DECODE(v_Extrc_Yn   , NULL, A.EXTRC_YN   , v_Extrc_Yn)
    AND     A.CONFI_YN   = DECODE(v_Confi_Yn   , NULL, A.CONFI_YN   , v_Confi_Yn)
    AND     A.FCRET_YN   = DECODE(v_Fcret_Yn   , NULL, A.FCRET_YN   , v_Fcret_Yn)
    AND     A.FTRAN_YN   = DECODE(v_Ftran_Yn   , NULL, A.FTRAN_YN   , v_Ftran_Yn)
    AND     A.STDEX_DD   = DECODE(v_Stdex_Dd   , NULL, A.STDEX_DD   , v_Stdex_Dd)
    AND     A.STR_DAY    = DECODE(v_Str_Day    , NULL, A.STR_DAY    , v_Str_Day)
    AND     A.END_DAY    = DECODE(v_End_Day    , NULL, A.END_DAY    , v_End_Day)
    AND     A.HEADER_YN  = DECODE(v_Header_Yn  , NULL, A.HEADER_YN  , v_Header_Yn)
    AND     A.TRAILER_YN = DECODE(v_Trailer_Yn , NULL, A.TRAILER_YN , v_Trailer_Yn)
    AND     A.TDATA_CNT  = DECODE(v_Tdata_Cnt  , NULL, A.TDATA_CNT  , v_Tdata_Cnt)
    AND     A.TDATA_AMT  = DECODE(v_Tdata_Amt  , NULL, A.TDATA_AMT  , v_Tdata_Amt)
    AND     A.ACRQ_CNT   = DECODE(v_Acrq_Cnt   , NULL, A.ACRQ_CNT   , v_Acrq_Cnt)
    AND     A.ACCNRQ_CNT = DECODE(v_Accnrq_Cnt , NULL, A.ACCNRQ_CNT , v_Accnrq_Cnt)
    AND     A.RMCNRQ_CNT = DECODE(v_Rmcnrq_Cnt , NULL, A.RMCNRQ_CNT , v_Rmcnrq_Cnt)
    AND     A.REQST_CNT  = DECODE(v_Reqst_Cnt  , NULL, A.REQST_CNT  , v_Reqst_Cnt)
    AND     A.REQST_AMT  = DECODE(v_Reqst_Amt  , NULL, A.REQST_AMT  , v_Reqst_Amt)
    AND     A.CNCRQ_CNT  = DECODE(v_Cncrq_Cnt  , NULL, A.CNCRQ_CNT  , v_Cncrq_Cnt)
    AND     A.CNCRQ_AMT  = DECODE(v_Cncrq_Amt  , NULL, A.CNCRQ_AMT  , v_Cncrq_Amt)
    AND     A.SRECP_CNT  = DECODE(v_Srecp_Cnt  , NULL, A.SRECP_CNT  , v_Srecp_Cnt)
    AND     A.SRECP_AMT  = DECODE(v_Srecp_Amt  , NULL, A.SRECP_AMT  , v_Srecp_Amt)
    AND     A.HSRCP_CNT  = DECODE(v_Hsrcp_Cnt  , NULL, A.HSRCP_CNT  , v_Hsrcp_Cnt)
    AND     A.HSRCP_AMT  = DECODE(v_Hsrcp_Amt  , NULL, A.HSRCP_AMT  , v_Hsrcp_Amt)
    AND     A.ERECP_CNT  = DECODE(v_Erecp_Cnt  , NULL, A.ERECP_CNT  , v_Erecp_Cnt)
    AND     A.ERECP_AMT  = DECODE(v_Erecp_Amt  , NULL, A.ERECP_AMT  , v_Erecp_Amt)
    AND     A.SCNRQ_CNT  = DECODE(v_Scnrq_Cnt  , NULL, A.SCNRQ_CNT  , v_Scnrq_Cnt)
    AND     A.SCNRQ_AMT  = DECODE(v_Scnrq_Amt  , NULL, A.SCNRQ_AMT  , v_Scnrq_Amt)
    AND     A.ECNRQ_CNT  = DECODE(v_Ecnrq_Cnt  , NULL, A.ECNRQ_CNT  , v_Ecnrq_Cnt)
    AND     A.ECNRQ_AMT  = DECODE(v_Ecnrq_Amt  , NULL, A.ECNRQ_AMT  , v_Ecnrq_Amt)
    AND     A.DEL_YN     = DECODE(v_Del_Yn     , NULL, A.DEL_YN     , v_Del_Yn)
    AND     A.REG_ID     = DECODE(v_Reg_Id     , NULL, A.REG_ID     , v_Reg_Id);

  END p_sRtre0099;

  /*****************************************************************************
  -- �ۼ��� �۾� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0099 (

    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*������迩��          */
    v_Confi_Yn       IN RTRE0099.CONFI_YN%TYPE,       /*���Ȯ�ο���          */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*���ϻ�������          */
    v_Ftran_Yn       IN RTRE0099.FTRAN_YN%TYPE,       /*�������ۿ���          */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*��������ü����        */
    v_Str_Day        IN RTRE0099.STR_DAY%TYPE,        /*������ ������       */
    v_End_Day        IN RTRE0099.END_DAY%TYPE,        /*������ ������       */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER ���翩��       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*������ �ѰǼ�         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*������ �ѱݾ�         */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*�������������Ǽ�      */
    v_Reqst_Cnt      IN RTRE0099.REQST_CNT%TYPE,      /*��û�Ǽ�              */
    v_Reqst_Amt      IN RTRE0099.REQST_AMT%TYPE,      /*��û�ݾ�              */
    v_Cncrq_Cnt      IN RTRE0099.CNCRQ_CNT%TYPE,      /*��ҿ�û�Ǽ�          */
    v_Cncrq_Amt      IN RTRE0099.CNCRQ_AMT%TYPE,      /*��ҿ�û�ݾ�          */
    v_Srecp_Cnt      IN RTRE0099.SRECP_CNT%TYPE,      /*������� ó���Ǽ�     */
    v_Srecp_Amt      IN RTRE0099.SRECP_AMT%TYPE,      /*������� ó���ݾ�     */
    v_Hsrcp_Cnt      IN RTRE0099.HSRCP_CNT%TYPE,      /*�κа��� ó���Ǽ�     */
    v_Hsrcp_Amt      IN RTRE0099.HSRCP_AMT%TYPE,      /*�κа��� ó���ݾ�     */
    v_Erecp_Cnt      IN RTRE0099.ERECP_CNT%TYPE,      /*�������� ó���Ǽ�     */
    v_Erecp_Amt      IN RTRE0099.ERECP_AMT%TYPE,      /*�������� ó���ݾ�     */
    v_Scnrq_Cnt      IN RTRE0099.SCNRQ_CNT%TYPE,      /*������� ó���Ǽ�     */
    v_Scnrq_Amt      IN RTRE0099.SCNRQ_AMT%TYPE,      /*������� ó���ݾ�     */
    v_Ecnrq_Cnt      IN RTRE0099.ECNRQ_CNT%TYPE,      /*��ҿ��� ó���Ǽ�     */
    v_Ecnrq_Amt      IN RTRE0099.ECNRQ_AMT%TYPE,      /*��ҿ��� ó���ݾ�     */
    v_Del_Yn         IN RTRE0099.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0099 (
            FILE_TP,
            RQST_DAY,
            FILE_NM,
            FILE_SEQ,
            FILE_DATA,
            EXTRC_YN,
            CONFI_YN,
            FCRET_YN,
            FTRAN_YN,
            STDEX_DD,
            STR_DAY,
            END_DAY,
            HEADER_YN,
            TRAILER_YN,
            TDATA_CNT,
            TDATA_AMT,
            ACRQ_CNT,
            ACCNRQ_CNT,
            RMCNRQ_CNT,
            REQST_CNT,
            REQST_AMT,
            CNCRQ_CNT,
            CNCRQ_AMT,
            SRECP_CNT,
            SRECP_AMT,
            HSRCP_CNT,
            HSRCP_AMT,
            ERECP_CNT,
            ERECP_AMT,
            SCNRQ_CNT,
            SCNRQ_AMT,
            ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_File_Tp,
            v_Rqst_Day,
            v_File_Nm,
            v_File_Seq,
            v_File_Data,
            v_Extrc_Yn,
            v_Confi_Yn,
            v_Fcret_Yn,
            v_Ftran_Yn,
            v_Stdex_Dd,
            v_Str_Day,
            v_End_Day,
            v_Header_Yn,
            v_Trailer_Yn,
            v_Tdata_Cnt,
            v_Tdata_Amt,
            v_Acrq_Cnt,
            v_Accnrq_Cnt,
            v_Rmcnrq_Cnt,
            v_Reqst_Cnt,
            v_Reqst_Amt,
            v_Cncrq_Cnt,
            v_Cncrq_Amt,
            v_Srecp_Cnt,
            v_Srecp_Amt,
            v_Hsrcp_Cnt,
            v_Hsrcp_Amt,
            v_Erecp_Cnt,
            v_Erecp_Amt,
            v_Scnrq_Cnt,
            v_Scnrq_Amt,
            v_Ecnrq_Cnt,
            v_Ecnrq_Amt,
            v_Del_Yn,
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

  END f_InsertRtre0099;

  /*****************************************************************************
  -- �ۼ��� �۾� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099 (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*������迩��          */
    v_Confi_Yn       IN RTRE0099.CONFI_YN%TYPE,       /*���Ȯ�ο���          */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*���ϻ�������          */
    v_Ftran_Yn       IN RTRE0099.FTRAN_YN%TYPE,       /*�������ۿ���          */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*��������ü����        */
    v_Str_Day        IN RTRE0099.STR_DAY%TYPE,        /*������ ������       */
    v_End_Day        IN RTRE0099.END_DAY%TYPE,        /*������ ������       */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER ���翩��       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*������ �ѰǼ�         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*������ �ѱݾ�         */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*�������������Ǽ�      */
    v_Reqst_Cnt      IN RTRE0099.REQST_CNT%TYPE,      /*��û�Ǽ�              */
    v_Reqst_Amt      IN RTRE0099.REQST_AMT%TYPE,      /*��û�ݾ�              */
    v_Cncrq_Cnt      IN RTRE0099.CNCRQ_CNT%TYPE,      /*��ҿ�û�Ǽ�          */
    v_Cncrq_Amt      IN RTRE0099.CNCRQ_AMT%TYPE,      /*��ҿ�û�ݾ�          */
    v_Srecp_Cnt      IN RTRE0099.SRECP_CNT%TYPE,      /*������� ó���Ǽ�     */
    v_Srecp_Amt      IN RTRE0099.SRECP_AMT%TYPE,      /*������� ó���ݾ�     */
    v_Hsrcp_Cnt      IN RTRE0099.HSRCP_CNT%TYPE,      /*�κа��� ó���Ǽ�     */
    v_Hsrcp_Amt      IN RTRE0099.HSRCP_AMT%TYPE,      /*�κа��� ó���ݾ�     */
    v_Erecp_Cnt      IN RTRE0099.ERECP_CNT%TYPE,      /*�������� ó���Ǽ�     */
    v_Erecp_Amt      IN RTRE0099.ERECP_AMT%TYPE,      /*�������� ó���ݾ�     */
    v_Scnrq_Cnt      IN RTRE0099.SCNRQ_CNT%TYPE,      /*������� ó���Ǽ�     */
    v_Scnrq_Amt      IN RTRE0099.SCNRQ_AMT%TYPE,      /*������� ó���ݾ�     */
    v_Ecnrq_Cnt      IN RTRE0099.ECNRQ_CNT%TYPE,      /*��ҿ��� ó���Ǽ�     */
    v_Ecnrq_Amt      IN RTRE0099.ECNRQ_AMT%TYPE,      /*��ҿ��� ó���ݾ�     */
    v_Del_Yn         IN RTRE0099.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    EXTRC_YN   = v_Extrc_Yn,
           CONFI_YN   = v_Confi_Yn,
           FCRET_YN   = v_Fcret_Yn,
           FTRAN_YN   = v_Ftran_Yn,
           STDEX_DD   = v_Stdex_Dd,
           STR_DAY    = v_Str_Day,
           END_DAY    = v_End_Day,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           TDATA_AMT  = v_Tdata_Amt,
           ACRQ_CNT   = v_Acrq_Cnt,
           ACCNRQ_CNT = v_Accnrq_Cnt,
           RMCNRQ_CNT = v_Rmcnrq_Cnt,
           REQST_CNT  = v_Reqst_Cnt,
           REQST_AMT  = v_Reqst_Amt,
           CNCRQ_CNT  = v_Cncrq_Cnt,
           CNCRQ_AMT  = v_Cncrq_Amt,
           SRECP_CNT  = v_Srecp_Cnt,
           SRECP_AMT  = v_Srecp_Amt,
           HSRCP_CNT  = v_Hsrcp_Cnt,
           HSRCP_AMT  = v_Hsrcp_Amt,
           ERECP_CNT  = v_Erecp_Cnt,
           ERECP_AMT  = v_Erecp_Amt,
           SCNRQ_CNT  = v_Scnrq_Cnt,
           SCNRQ_AMT  = v_Scnrq_Amt,
           ECNRQ_CNT  = v_Ecnrq_Cnt,
           ECNRQ_AMT  = v_Ecnrq_Amt,
           DEL_YN     = v_Del_Yn,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099;

  /*****************************************************************************
  -- �ۼ��� �۾� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0099 (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    DEL_YN   = 'Y',
           CHG_ID   = v_Reg_Id,
           CHG_DT   = SYSDATE
    WHERE  FILE_TP  = v_File_Tp
    AND    RQST_DAY = v_Rqst_Day
    AND    FILE_NM  = v_File_Nm
    AND    FILE_SEQ = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0099;

  /*****************************************************************************
  -- �ۼ��� �۾� ����- ���½�û ������� ���ε�
  *****************************************************************************/
  PROCEDURE p_InsertRtre0099AcrqFileUpload (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT NULL;  /*�ۼ������ϱ���        */
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL; /*���ϼ���              */
    v_Extrc_Yn   RTRE0099.EXTRC_YN%TYPE DEFAULT 'N';  /*������迩��          */
    v_Confi_Yn   RTRE0099.CONFI_YN%TYPE DEFAULT 'N';  /*���Ȯ�ο���          */
    v_Fcret_Yn   RTRE0099.FCRET_YN%TYPE DEFAULT 'N';  /*���ϻ�������          */
    v_Ftran_Yn   RTRE0099.FTRAN_YN%TYPE DEFAULT 'N';  /*�������ۿ���          */
    v_Stdex_Dd   RTRE0099.STDEX_DD%TYPE DEFAULT NULL; /*��������ü����        */
    v_Str_Day    RTRE0099.STR_DAY%TYPE DEFAULT NULL;  /*������ ������       */
    v_End_Day    RTRE0099.END_DAY%TYPE DEFAULT NULL;  /*������ ������       */
    v_Header_Yn  RTRE0099.HEADER_YN%TYPE DEFAULT 'N'; /*HEADER ���翩��       */
    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT 'N';/*TRAILER ���翩��      */
    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT 0;   /*������ �ѰǼ�         */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT 0;   /*������ �ѱݾ�         */
    v_Acrq_Cnt   RTRE0099.ACRQ_CNT%TYPE DEFAULT 0;    /*���½�û�Ǽ�          */
    v_Accnrq_Cnt RTRE0099.ACCNRQ_CNT%TYPE DEFAULT 0;  /*���������Ǽ�          */
    v_Rmcnrq_Cnt RTRE0099.RMCNRQ_CNT%TYPE DEFAULT 0;  /*�������������Ǽ�      */
    v_Reqst_Cnt  RTRE0099.REQST_CNT%TYPE DEFAULT 0;   /*��û�Ǽ�              */
    v_Reqst_Amt  RTRE0099.REQST_AMT%TYPE DEFAULT 0;   /*��û�ݾ�              */
    v_Cncrq_Cnt  RTRE0099.CNCRQ_CNT%TYPE DEFAULT 0;   /*��ҿ�û�Ǽ�          */
    v_Cncrq_Amt  RTRE0099.CNCRQ_AMT%TYPE DEFAULT 0;   /*��ҿ�û�ݾ�          */
    v_Srecp_Cnt  RTRE0099.SRECP_CNT%TYPE DEFAULT 0;   /*������� ó���Ǽ�     */
    v_Srecp_Amt  RTRE0099.SRECP_AMT%TYPE DEFAULT 0;   /*������� ó���ݾ�     */
    v_Hsrcp_Cnt  RTRE0099.HSRCP_CNT%TYPE DEFAULT 0;   /*�κа��� ó���Ǽ�     */
    v_Hsrcp_Amt  RTRE0099.HSRCP_AMT%TYPE DEFAULT 0;   /*�κа��� ó���ݾ�     */
    v_Erecp_Cnt  RTRE0099.ERECP_CNT%TYPE DEFAULT 0;   /*�������� ó���Ǽ�     */
    v_Erecp_Amt  RTRE0099.ERECP_AMT%TYPE DEFAULT 0;   /*�������� ó���ݾ�     */
    v_Scnrq_Cnt  RTRE0099.SCNRQ_CNT%TYPE DEFAULT 0;   /*������� ó���Ǽ�     */
    v_Scnrq_Amt  RTRE0099.SCNRQ_AMT%TYPE DEFAULT 0;   /*������� ó���ݾ�     */
    v_Ecnrq_Cnt  RTRE0099.ECNRQ_CNT%TYPE DEFAULT 0;   /*��ҿ��� ó���Ǽ�     */
    v_Ecnrq_Amt  RTRE0099.ECNRQ_AMT%TYPE DEFAULT 0;   /*��ҿ��� ó���ݾ�     */
    v_Del_Yn     RTRE0099.DEL_YN%TYPE DEFAULT 'N';    /*��������              */

    --v_Acrq_Fg    RTRE0060.ACRQ_FG%TYPE DEFAULT 'A';   /*���½�û �߻�����     */
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT '2';   /*���½�û ó������     */


    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:��û����,���ϸ�, ����� ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Nm) IS NULL THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ۼ������ϱ���
    v_File_Tp := SUBSTR(v_File_Nm, 1, 4);

    -- ���� �ۼ��� ������ �����ϸ�(�̹� ���� ���ε带 �� ����)
    IF 0 < Pkg_Rtre0098.f_sRtre0098CountCheck2(v_Rqst_Day, v_File_Nm) THEN

        -- ���Ȯ�ο��� ȹ��
        v_Confi_Yn := Pkg_Rtre0099.f_sRtre0099ConfiYn(v_File_Tp, v_Rqst_Day, v_File_Nm);

        IF v_Confi_Yn IS NULL THEN
            v_Return_Message := '���Ȯ���� �ȵǹǷ� ó���� �Ұ� �մϴ�.!!';
            RAISE e_Error;

        ELSIF v_Confi_Yn = 'Y' THEN
            v_Return_Message := '���Ȯ���� �Ϸ�� �����̹Ƿ� ó���� �Ұ� �մϴ�.!!';
            RAISE e_Error;

        -- ���Ȯ�� �����̹Ƿ� ���� �����͸� ����(������Ʈ) ó��
        ELSIF v_Confi_Yn = 'N' THEN

            -- �ۼ��� �۾�(RTRE0099) - ��û����, ���ϸ� ���� ����ó��
            IF 0 != f_DeleteRtre0099DelYn(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�ۼ��� �۾�(RTRE0099) - ��û����, ���ϸ� ���� ����ó�� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


            -- ���� �ۼ��� ����(RTRE0098) Update - �۽� ���� ����� DEL_YN ������Ʈ
            IF 0 != Pkg_Rtre0098.f_Delete0098FileClear2(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� �ۼ��� ����(RTRE0098) Update - �۽� ���� ����� DEL_YN ������Ʈ ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            IF v_Acrq_Fg = 'A' THEN

                -- ���½�û ����(RTRE0060) Update - ȸ������(A)�ǿ� ���Ͽ�  ���½�ûó�� ���¸� ����(2) ���·� ����
                IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqSt(v_Acrq_Fg, v_Rqst_Day, v_Acrq_St, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '���� �ۼ��� ����(RTRE0098) Update - �۽� ���� ����� DEL_YN ������Ʈ ����!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSIF v_Acrq_Fg = 'B' THEN

                -- ���½�û ����(RTRE0060) DELETE - ��������(B)�ǿ� ���Ͽ� �����ϸ� ���½�û������ ������
                IF 0 != Pkg_Rtre0060.f_DeleteRtre0060All(v_Acrq_Fg, v_Rqst_Day, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '���½�û ����(RTRE0060) DELETE - ��������(B)�ǿ� ���Ͽ� �����ϸ� ���½�û������ ���� ����!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSE
                v_Return_Message := '���½�û �߻�����-ȸ������(A),��������(B) : ('||v_Acrq_Fg||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
                RAISE e_Error;
            END IF;
        END IF;

    END IF;

    -- ���ϼ��� ȹ��
    v_File_Seq := f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);

    -- �ۼ��� �۾�(RTRE0099) ������ ����
    IF 0 != f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn,
                             v_Stdex_Dd, v_Str_Day, v_End_Day, v_Header_Yn,
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, v_Acrq_Cnt,
                             v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reqst_Cnt, v_Reqst_Amt,
                             v_Cncrq_Cnt, v_Cncrq_Amt, v_Srecp_Cnt, v_Srecp_Amt,
                             v_Hsrcp_Cnt, v_Hsrcp_Amt, v_Erecp_Cnt, v_Erecp_Amt,
                             v_Scnrq_Cnt, v_Scnrq_Amt, v_Ecnrq_Cnt, v_Ecnrq_Amt,
                             v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾�(RTRE0099) ������ ���� ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;

    END IF;



    -- ȸ������(A)
    IF v_Acrq_Fg = 'A' THEN
        -- ���� �ۼ��� ����(RTRE0098) ���� - ������ ���� �Ľ��Ͽ� ����
        Pkg_Rtre0098.p_InsertRtre0098FileParsingA(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_File_Data, v_Acrq_Fg,
                                                 v_Extrc_Yn, v_Header_Yn, v_Trailer_Yn, v_Tdata_Cnt,
                                                 v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reg_Id,
                                                 v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� - ������ ���� �Ľ��Ͽ� ���� ����!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    -- ��������(B)
    ELSIF v_Acrq_Fg = 'B' THEN


        -- ���� �ۼ��� ����(RTRE0098) ���� - ������ ���� �Ľ��Ͽ� ����
        Pkg_Rtre0098.p_InsertRtre0098FileParsingB(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq, v_File_Data, v_Acrq_Fg,
                                                 v_Extrc_Yn, v_Header_Yn, v_Trailer_Yn, v_Tdata_Cnt,
                                                 v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reg_Id,
                                                 v_Success_Code, v_Return_Message, v_ErrorText);
        IF 0 != v_Success_Code THEN
            v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� - ������ ���� �Ľ��Ͽ� ���� ����!!!'||'-'||v_Return_Message;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE
        v_Return_Message := '���½�û �߻�����-ȸ������(A),��������(B) : ('||v_Acrq_Fg||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- �ۼ��� �۾�(RTRE0099) Update - ���½�û ������� ���ε� ��� ������Ʈ
    IF 0 != f_UpdateRtre0099AcrqFileUpload (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                            v_Extrc_Yn, v_Header_Yn, v_Trailer_Yn, v_Tdata_Cnt,
                                            v_Acrq_Cnt, v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reg_Id,
                                            v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾�(RTRE0099) Update - ���½��� ��� ��ġ ��� ������Ʈ ����!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_InsertRtre0099AcrqFileUpload(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_InsertRtre0099AcrqFileUpload(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0099AcrqFileUpload;


 /*****************************************************************************
  -- �ۼ��� �۾� ���� ������Ʈ(������迩��, ���Ȯ�ο��� ���ϻ�������, �������ۿ��� �۾��� ó������ ������Ʈ)
  *****************************************************************************/
   PROCEDURE   p_UpdateRtre0099Extrcyn (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*���½�û����          */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�               */
    v_Cnf_Step       IN RTRE0099.FILE_NM%TYPE,        /*�۽�ó���ܰ�          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    e_Error EXCEPTION;
    v_cnt   NUMBER DEFAULT 0;
    v_Extrc_Yn VARCHAR(1);  /*������迩��*/
    v_Confi_Yn VARCHAR(1);  /*���Ȯ�ο���*/
    v_Fcret_Yn VARCHAR(1);  /*���ϻ�������*/
    v_Ftran_Yn VARCHAR(1);  /*�������ۿ���*/

  BEGIN

    SELECT  COUNT(*) OVER() CNT , EXTRC_YN, CONFI_YN, FCRET_YN, FTRAN_YN
    INTO    v_cnt, v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn
    FROM    RTRE0099
    WHERE   FILE_TP  = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     DEL_YN   = 'N';

    IF (v_cnt = 0 OR v_cnt > 1) THEN

        v_Return_Message := '�ۼ��� ó�� ���� ���� �Դϴ�. �����ڿ��� Ȯ���ϼ���.(ERR CODE:9JT1F2)';
        RAISE e_Error;

    ELSIF v_cnt = 1 THEN
        v_Success_code := 0;
        v_Return_Message := '���������� ó���Ǿ����ϴ�.';
        v_ErrorText := '';

        IF 0 != Pkg_Rtre0099.f_UpdateRtre0099Extrcyn(v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn, v_File_Tp, v_Rqst_Day, v_File_Nm, v_Cnf_Step, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '�ۼ��� ó�� ���� ���� �Դϴ�. �����ڿ��� Ȯ���ϼ���.(ERR CODE:567F4D) [Cnf_Step:'||v_Cnf_Step||',File_Tp:'||v_File_Tp||',Extrc_Yn:'||v_Extrc_Yn||',Confi_Yn:'||v_Confi_Yn||',Fcret_Yn:'||v_Fcret_Yn||',Ftran_Yn:'||v_Ftran_Yn||']';
            RAISE e_Error;
        ELSE
            v_Success_code := 0;
            v_Return_Message := '���������� ó���Ǿ����ϴ�.';
            v_ErrorText := '';
        END IF;

    ELSE
        v_Success_code := -1;
        v_Return_Message := '�ۼ��� ó�� ���� ���� �Դϴ�. �����ڿ��� Ȯ���ϼ���.(ERR CODE:B6EDW2)';
        RAISE e_Error;
    END IF;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099Extrcyn(1)', v_ErrorText, v_Return_Message);
      WHEN NO_DATA_FOUND THEN
        v_Success_code := -1;
        v_Return_Message := '������(RTRE0099). �ý��� ����ڿ��� Ȯ���ϼ���.('||v_File_Tp||','||v_Rqst_Day||','||v_File_Nm||')';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099Extrcyn(3)', v_ErrorText, v_Return_Message);
      WHEN OTHERS THEN
        v_Success_code := -1;
        v_Return_Message := SUBSTR(SQLERRM, 1, 200);
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099Extrcyn(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0099Extrcyn;

 /*****************************************************************************
  -- �ۼ��� �۾� ���� ������Ʈ FUNCTION
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099Extrcyn (
    v_Extrc_Yn       IN VARCHAR,                      /*������迩��          */
    v_Confi_Yn       IN VARCHAR,                      /*���Ȯ�ο���          */
    v_Fcret_Yn       IN VARCHAR,                      /*���ϻ�������          */
    v_Ftran_Yn       IN VARCHAR,                      /*�������ۿ���          */
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*���½�û����          */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_Cnf_Step       IN RTRE0099.FILE_NM%TYPE,        /*�۽�ó���ܰ�          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

      --�۽�ó���ܰ�(������迩��)
      IF v_Cnf_Step = 'EXTR' THEN

        IF v_Extrc_Yn = 'N' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN

            UPDATE  RTRE0099
            SET     EXTRC_YN = 'Y',
                    CHG_ID   = v_Reg_Id,
                    CHG_DT   = SYSDATE
            WHERE   FILE_TP  = v_File_Tp
            AND     RQST_DAY = v_Rqst_Day
            AND     FILE_NM  = v_File_Nm
            AND     DEL_YN   = 'N';

        ELSE
          RETURN -1;
        END IF;

      --�۽�ó���ܰ�(���Ȯ�ο���)
      ELSIF v_Cnf_Step = 'CONF' THEN

        IF v_Extrc_Yn = 'Y' AND v_Confi_Yn = 'N' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN

            UPDATE  RTRE0099
            SET     CONFI_YN = 'Y',
                    CHG_ID   = v_Reg_Id,
                    CHG_DT   = SYSDATE
            WHERE   FILE_TP  = v_File_Tp
            AND     RQST_DAY = v_Rqst_Day
            AND     FILE_NM  = v_File_Nm
            AND     DEL_YN   = 'N';

        ELSE
          RETURN -1;
        END IF;

      --�۽�ó���ܰ�(���ϻ�������)
      ELSIF v_Cnf_Step = 'FILE' THEN

        IF v_Extrc_Yn = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'N' AND v_Ftran_Yn = 'N' THEN

            UPDATE  RTRE0099
            SET     FCRET_YN = 'Y',
                    CHG_ID   = v_Reg_Id,
                    CHG_DT   = SYSDATE
            WHERE   FILE_TP  = v_File_Tp
            AND     RQST_DAY = v_Rqst_Day
            AND     FILE_NM  = v_File_Nm
            AND     DEL_YN   = 'N';
        ELSE
          RETURN -1;
        END IF;


      --�۽�ó���ܰ�(�������ۿ���)
      ELSIF v_Cnf_Step = 'TRAN' THEN

        IF v_Extrc_Yn = 'Y' AND v_Confi_Yn = 'Y' AND v_Fcret_Yn = 'Y' AND v_Ftran_Yn = 'N' THEN

            UPDATE  RTRE0099
            SET     FTRAN_YN = 'Y',
                    CHG_ID   = v_Reg_Id,
                    CHG_DT   = SYSDATE
            WHERE   FILE_TP  = v_File_Tp
            AND     RQST_DAY = v_Rqst_Day
            AND     FILE_NM  = v_File_Nm
            AND     DEL_YN   = 'N';

        ELSE
          RETURN -1;
        END IF;

      END IF;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099Extrcyn;

  /*****************************************************************************
  -- �ۼ��� �۾� - �ۼ������ϱ���/��û����/���ϸ� ����  ���ϼ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0099FileSeq(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN NUMBER IS
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;    /*���ϼ���            */
  BEGIN


    SELECT  NVL((SELECT  MAX(FILE_SEQ)
                 FROM    RTRE0099
                 WHERE   FILE_TP        = v_File_Tp
                 AND     RQST_DAY       = v_Rqst_Day
                 AND     FILE_NM        = v_File_Nm
                 )+ 1, 1) AS FILE_SEQ
    INTO    v_File_Seq
    FROM    DUAL;

    RETURN v_File_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0099FileSeq;


  /*****************************************************************************
  -- �ۼ��� �۾� - �ۼ������ϱ���/��û����/���ϸ� ����  �������ϼ��� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtre0099FinalFileSeq(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN NUMBER IS
    v_File_Seq  RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;    /*���ϼ���            */
  BEGIN


    SELECT  FILE_SEQ
    INTO    v_File_Seq
    FROM    RTRE0099
    WHERE   FILE_TP  = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     FILE_NM  = v_File_Nm
    AND     DEL_YN   = 'N'
    AND     EXTRC_YN = 'Y'
    AND     CONFI_YN = 'Y'
    AND     FTRAN_YN = 'N'
    ;

    RETURN v_File_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0099FinalFileSeq;


  /*****************************************************************************
  -- �ۼ��� �۾� - ���� ���½�û �۾����� ���ϱ�
  *****************************************************************************/
  FUNCTION f_sRtre0099RpcDay RETURN VARCHAR IS
    v_Rpc_Day    VARCHAR(8) DEFAULT NULL;                  /*�۾�����          */
  BEGIN


    SELECT  NVL((SELECT  MAX(END_DAY)        -- ������ ������
                 FROM    RTRE0099            -- �ۼ��� �۾�
                 WHERE   FILE_TP     = 'EB13'-- �ۼ������ϱ���
                 AND     FCRET_YN    = 'Y'   -- ���ϻ�������
                 AND     FTRAN_YN    = 'Y'   -- �������ۿ���
                 AND     DEL_YN      = 'N'   -- ��������
                 ), TO_CHAR(SYSDATE-1, 'YYYYMMDD')) -- MAX(END_DAY) ���� ��� ������ - 1
    INTO    v_Rpc_Day
    FROM    DUAL;

    RETURN v_Rpc_Day;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN TO_CHAR(SYSDATE-1, 'YYYYMMDD');

  END f_sRtre0099RpcDay;


  /*****************************************************************************
  -- �ۼ��� �۾� Count - �������� ���� ������� ���� COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099FileCount(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*���ϸ�              */
    v_Del_Yn         IN VARCHAR                         /*��������(NULL,Y,N)  */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0099
    WHERE   FILE_TP = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     FILE_NM = v_File_Nm
    AND     DEL_YN  LIKE TRIM(v_Del_Yn)||'%';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0099FileCount;



  /*****************************************************************************
  -- �ۼ��� �۾� Count - �ۼ���ó�� ���� üũ COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099CountCheck(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTRE0099
    WHERE   FILE_TP   = v_File_Tp
    AND     RQST_DAY  = v_Rqst_Day
    AND     FILE_NM   = v_File_Nm
    AND     DEL_YN    = 'N'
    AND     EXTRC_YN  = 'Y'
    AND     CONFI_YN  = 'Y'
    AND     FCRET_YN  = 'N'
    AND     FTRAN_YN  = 'N';

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0099CountCheck;


  /*****************************************************************************
  -- �����ü �۾� Count - �����üó�� ���� üũ COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099CountCheck2(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*���ϸ�              */
    v_Gubun          IN VARCHAR2                        /*����                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    IF NVL(v_Gubun, '') = 'DEL' THEN

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE0099
        WHERE   FILE_TP   = v_File_Tp
        AND     RQST_DAY  = v_Rqst_Day
        AND     FILE_NM   = v_File_Nm
        AND     DEL_YN    = 'N';

     ELSIF NVL(v_Gubun, '') = 'TRANS' THEN

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE0099
        WHERE   FILE_TP   = v_File_Tp
        AND     RQST_DAY  = v_Rqst_Day
        AND     FILE_NM   = v_File_Nm
        AND     DEL_YN    = 'N'
        AND     EXTRC_YN  = 'Y'
        AND     CONFI_YN  = 'Y'
        AND     FTRAN_YN  = 'N';

     ELSE

        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    RTRE0099
        WHERE   FILE_TP   = v_File_Tp
        AND     RQST_DAY  = v_Rqst_Day
        AND     FILE_NM   = v_File_Nm
        AND     DEL_YN    = 'N'
        AND     CONFI_YN  = 'N'
        AND     FCRET_YN  = 'N'
        AND     FTRAN_YN  = 'N';

    END IF;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtre0099CountCheck2;



  /*****************************************************************************
  -- �ۼ��� �۾� - ���Ȯ�ο��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0099ConfiYn(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN VARCHAR IS
    v_Confi_Yn   VARCHAR(1) DEFAULT NULL;               /*���Ȯ�ο���        */
  BEGIN

    SELECT  CONFI_YN        -- ���Ȯ�ο���
    INTO    v_Confi_Yn
    FROM    RTRE0099
    WHERE   FILE_TP   = v_File_Tp
    AND     RQST_DAY  = v_Rqst_Day
    AND     FILE_NM   = v_File_Nm
    AND     FCRET_YN  = 'N' -- ���ϻ�������
    AND     FTRAN_YN  = 'N' -- �������ۿ���
    AND     DEL_YN    = 'N';-- ��������

    RETURN v_Confi_Yn;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtre0099ConfiYn;


  /*****************************************************************************
  -- �ۼ��� �۾� Update - ���½��� ��� ��ġ ��� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099BatchResult (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*������迩��          */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*�������������Ǽ�      */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    EXTRC_YN         = v_Extrc_Yn,
           ACRQ_CNT         = v_Acrq_Cnt,
           ACCNRQ_CNT       = v_Accnrq_Cnt,
           RMCNRQ_CNT       = v_Rmcnrq_Cnt,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  FILE_TP          = v_File_Tp
    AND    RQST_DAY         = v_Rqst_Day
    AND    FILE_NM          = v_File_Nm
    AND    FILE_SEQ         = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099BatchResult;


  /*****************************************************************************
  -- �ۼ��� �۾� Update - ���ݿ����� ���ϻ��� ��� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099FileResult2 (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*���ϻ�������          */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER ���翩��       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*������ �ѰǼ�         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*������ �ѱݾ�         */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    FCRET_YN   = v_Fcret_Yn,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           TDATA_AMT  = v_Tdata_Amt,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099FileResult2;



  /*****************************************************************************
  -- �ۼ��� �۾� Update - ���½��� ���� ���� ��� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099FileResult (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*���ϻ�������          */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER ���翩��       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*������ �ѰǼ�         */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    FCRET_YN   = v_Fcret_Yn,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099FileResult;


  /*****************************************************************************
  -- �ۼ��� �۾� - ��û����, ���ϸ� ���� ����ó��
  *****************************************************************************/
  FUNCTION f_DeleteRtre0099DelYn(
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*���ϸ�              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0099
    SET     DEL_YN    = 'Y',
            CHG_ID    = v_Reg_Id,
            CHG_DT    = SYSDATE
    WHERE   RQST_DAY  = v_Rqst_Day
    AND     FILE_NM   = v_File_Nm
    AND     DEL_YN    = 'N';-- ��������

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0099DelYn;

  /*****************************************************************************
  -- �ۼ��� �۾� Update - ���½�û ������� ���ε� ��� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099AcrqFileUpload (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*������迩��          */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER ���翩��       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*������ �ѰǼ�         */
    v_Acrq_Cnt       IN RTRE0099.ACRQ_CNT%TYPE,       /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN RTRE0099.ACCNRQ_CNT%TYPE,     /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN RTRE0099.RMCNRQ_CNT%TYPE,     /*�������������Ǽ�      */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    EXTRC_YN   = v_Extrc_Yn,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           ACRQ_CNT   = v_Acrq_Cnt,
           ACCNRQ_CNT = v_Accnrq_Cnt,
           RMCNRQ_CNT = v_Rmcnrq_Cnt,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099AcrqFileUpload;


  /*****************************************************************************
  -- �ۼ��� �۾� Update - ���ݿ����� ������� ���ε� ��� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099CashFileUpload (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE,       /*���ϼ���              */
    v_Extrc_Yn       IN RTRE0099.EXTRC_YN%TYPE,       /*������迩��          */
    v_Header_Yn      IN RTRE0099.HEADER_YN%TYPE,      /*HEADER ���翩��       */
    v_Trailer_Yn     IN RTRE0099.TRAILER_YN%TYPE,     /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN RTRE0099.TDATA_CNT%TYPE,      /*������ �ѰǼ�         */
    v_Tdata_Amt      IN RTRE0099.TDATA_AMT%TYPE,      /*������ �ѱݾ�         */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0099
    SET    EXTRC_YN   = v_Extrc_Yn,
           HEADER_YN  = v_Header_Yn,
           TRAILER_YN = v_Trailer_Yn,
           TDATA_CNT  = v_Tdata_Cnt,
           TDATA_AMT  = v_Tdata_Amt,
           CHG_ID     = v_Reg_Id,
           CHG_DT     = SYSDATE
    WHERE  FILE_TP    = v_File_Tp
    AND    RQST_DAY   = v_Rqst_Day
    AND    FILE_NM    = v_File_Nm
    AND    FILE_SEQ   = v_File_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099CashFileUpload;

  /*****************************************************************************
  -- �ۼ��� �۾� Update - ���½�û ���ó�� ��� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099FileUpResult (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*���ϻ�������          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0099
    SET     FCRET_YN = v_Fcret_Yn,
            CHG_ID   = v_Reg_Id,
            CHG_DT   = SYSDATE
    WHERE   FILE_TP  = v_File_Tp
    AND     RQST_DAY = v_Rqst_Day
    AND     DEL_YN   = 'N'
    AND     EXTRC_YN = 'Y'
    AND     CONFI_YN = 'Y'
    AND     FCRET_YN = 'N'
    AND     FTRAN_YN = 'N';

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0099FileUpResult;

  /*****************************************************************************
  -- �����ü ��� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0099TransAccum (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*��������ü����        */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Pay_Mthd  RTSD0108.PAY_MTHD%TYPE;
    v_Rcms_day  VARCHAR2(08);
    v_Start         NUMBER;
    v_Trans_Type    CHAR(04);
    v_File_Tp       CHAR(04);
    v_File_Nm   VARCHAR2(20);  /*���ϸ�*/

  BEGIN

    -- �ʼ���: ��û���� ,��������ü���� ,����� ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Stdex_Dd) IS NULL THEN
        v_Return_Message := '��������ü����('||v_Stdex_Dd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    ELSIF INSTR(TRIM(v_Stdex_Dd),'Y') = 0 THEN
        v_Return_Message := '��������ü����('||v_Stdex_Dd||') : �� �������ڰ� ��� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    v_File_Tp := 'EB21';
    v_File_Nm := v_File_Tp||SUBSTR(v_Rqst_Day, 5, 4);
    IF f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') > 0 THEN
        v_Return_Message := '��û����('||v_File_Nm||') : �� �̹� ��ݿ�û�� �ڷᰡ �־ ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    v_Rcms_day := v_Rqst_Day;
    v_Pay_Mthd := 'A';  -- ������ü
    v_Start := 1;

    IF Pkg_Rtre0070.f_sRtre0070ProcessCount(v_Rcms_day) > 0 THEN
        v_Return_Message := '��û����('||v_Rcms_day||') : ������ �� �����ü�ݿ� �̿Ϸ��� �ڷᰡ �־ ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- ��ü���ں� �ڷ� ����(RTRE0071)
    WHILE v_Start <= LENGTH(TRIM(v_Stdex_Dd))
    LOOP
        v_Trans_Type := SUBSTR(v_Stdex_Dd, v_Start, 4);

        IF INSTR(v_Trans_Type, 'Y') > 0 THEN
            Pkg_Rtre0071.p_CreateRtre0071TransAccum(v_Rcms_Day, v_Trans_Type, v_Reg_Id,
                                                    v_Success_Code, v_Return_Message, v_ErrorText);
        END IF;

        v_Start := v_Start + 4;

        IF v_Success_Code <> 0 THEN
            v_Start := LENGTH(TRIM(v_Stdex_Dd)) + 1;
            RAISE e_Error;
        END IF;

    END LOOP;

    -- ��ü���� ���� �ڷ� ����(RTRE0070)
    Pkg_Rtre0070.p_CreateRtre0070TransAccum(v_Rcms_Day, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF v_Success_Code <> 0 THEN
        RAISE e_Error;
    END IF;


    -- ��ü���ں� �ڷ� Update(RTRE0071)
    IF 0 <> Pkg_Rtre0071.f_URtre0071TransAccum(v_Rcms_Day,
                                    v_ErrorText) THEN
        v_Return_Message := 'Rtre0071 ���� ����!!!';
        RAISE e_Error;
    END IF;


    -- �ۼ����۾� �ڷ� Insert(RTRE0099)
    INSERT  INTO RTRE0099 (
            FILE_TP, RQST_DAY,  FILE_NM, FILE_SEQ,
            EXTRC_YN, CONFI_YN, FCRET_YN,  FTRAN_YN,
            STDEX_DD, HEADER_YN,  TRAILER_YN,
            TDATA_CNT, TDATA_AMT,
            ACRQ_CNT,  ACCNRQ_CNT, RMCNRQ_CNT, REQST_CNT,
            REQST_AMT, CNCRQ_CNT,  CNCRQ_AMT,  SRECP_CNT,
            SRECP_AMT, HSRCP_CNT,  HSRCP_AMT,  ERECP_CNT,
            ERECP_AMT, SCNRQ_CNT,  SCNRQ_AMT,  ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            REG_ID, REG_DT,  CHG_ID,CHG_DT )
        SELECT  v_File_tp, v_Rqst_Day, v_File_Nm,
                NVL(( SELECT  MAX(B.FILE_SEQ)
                      FROM    RTRE0099 B
                      WHERE   B.FILE_TP = v_File_Tp
                      AND     B.RQST_DAY  = v_Rqst_Day
                      AND     B.FILE_NM   = v_File_Nm), 0) + 1 FILE_SEQ,
                'Y' EXTRC_YN, 'N', 'N','N',
                v_Stdex_Dd,  'N' HEADER_YN, 'N' TRAILER_YN,
                X.TDATA_CNT, X.TDATA_AMT,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0,
                'N' DEL_YN,
                v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE CHG_DT
        FROM    (
                SELECT  COUNT(1) TDATA_CNT, SUM(A.RCMS_AMT) TDATA_AMT
                FROM    RTRE0070 A
                WHERE   A.RCMS_DAY = v_Rcms_Day
                ) X;

    IF SQLCODE <> 0 THEN
        v_Return_Message := 'Rtre0099 ���� ����!!!';
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '���������� ����Ǿ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_CreateRtre0099TransAccum(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_CreateRtre0099TransAccum(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0099TransAccum;

  /*****************************************************************************
  -- ī����ü ��� ����
  *****************************************************************************/
  PROCEDURE p_CreateRtre0099CardTrans (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_Stdex_Dd       IN RTRE0099.STDEX_DD%TYPE,       /*��������ü����        */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
    v_Rcrd_day  RTRE0081.RCRD_DAY%TYPE;
    v_Start         NUMBER;
    v_Trans_Type    CHAR(04);
    v_File_Tp   RTRE0099.FILE_TP%TYPE;
    v_File_Nm   RTRE0099.FILE_NM%TYPE;  /*���ϸ�*/

  BEGIN

    -- �ʼ���: ��û���� ,��������ü���� ,����� ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Stdex_Dd) IS NULL THEN
        v_Return_Message := '��������ü����('||v_Stdex_Dd||') : �ʼ� �Է°� �������� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    ELSIF INSTR(TRIM(v_Stdex_Dd),'Y') = 0 THEN
        v_Return_Message := '��������ü����('||v_Stdex_Dd||') : �� �������ڰ� ��� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    v_File_Tp := 'BC02_INX';
    v_File_Nm := 'KCP_BATCH_FILE_'||v_File_Tp||'_V5407_'||SUBSTR(v_Rqst_Day, 1, 8);
    IF f_sRtre0099FileCount(v_File_Tp, v_Rqst_Day, v_File_Nm, 'N') > 0 THEN
        v_Return_Message := '��û����('||v_File_Nm||') : �� �̹� ��ݿ�û�� �ڷᰡ �־ ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    v_Rcrd_day := v_Rqst_Day;

    IF Pkg_Rtre0080.f_sRtre0080ProcessCount(v_Rcrd_day) > 0 THEN
        v_Return_Message := '��û����('||v_Rcrd_day||') : ������ �� ī����ü�ݿ� �̿Ϸ��� �ڷᰡ �־ ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- ��ü���ں� �ڷ� ����(RTRE0081)
    v_Start := 1;
    WHILE v_Start <= LENGTH(TRIM(v_Stdex_Dd))
    LOOP
        v_Trans_Type := SUBSTR(v_Stdex_Dd, v_Start, 4);

        IF INSTR(v_Trans_Type, 'Y') > 0 THEN
            Pkg_Rtre0081.p_CreateRtre0081CardTrans(v_Rcrd_Day, v_Trans_Type, v_Reg_Id,
                                                    v_Success_Code, v_Return_Message, v_ErrorText);
        END IF;

        v_Start := v_Start + 4;

        IF v_Success_Code <> 0 THEN
            v_Start := LENGTH(TRIM(v_Stdex_Dd)) + 1;
            RAISE e_Error;
        END IF;

    END LOOP;


    -- ��ü���� ���� �ڷ� ����(RTRE0080)
    Pkg_Rtre0080.p_CreateRtre0080CardTrans(v_Rcrd_Day, v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);

    IF v_Success_Code <> 0 THEN
        RAISE e_Error;
    END IF;


    -- ��ü���ں� �ڷ� Update(RTRE0081)
    IF 0 <> Pkg_Rtre0081.f_URtre0081CardTrans(v_Rcrd_Day, v_ErrorText) THEN
        v_Return_Message := 'Rtre0071 ���� ����!!!';
        RAISE e_Error;
    END IF;


    -- �ۼ����۾� �ڷ� Insert(RTRE0099)
    INSERT  INTO RTRE0099 (
            FILE_TP, RQST_DAY,  FILE_NM, FILE_SEQ,
            EXTRC_YN, CONFI_YN, FCRET_YN,  FTRAN_YN,
            STDEX_DD, HEADER_YN,  TRAILER_YN,
            TDATA_CNT, TDATA_AMT,
            ACRQ_CNT,  ACCNRQ_CNT, RMCNRQ_CNT, REQST_CNT,
            REQST_AMT, CNCRQ_CNT,  CNCRQ_AMT,  SRECP_CNT,
            SRECP_AMT, HSRCP_CNT,  HSRCP_AMT,  ERECP_CNT,
            ERECP_AMT, SCNRQ_CNT,  SCNRQ_AMT,  ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            REG_ID, REG_DT,  CHG_ID,CHG_DT )
        SELECT  v_File_tp, v_Rqst_Day, v_File_Nm,
                NVL(( SELECT  MAX(B.FILE_SEQ)
                      FROM    RTRE0099 B
                      WHERE   B.FILE_TP = v_File_Tp
                      AND     B.RQST_DAY  = v_Rqst_Day
                      AND     B.FILE_NM   = v_File_Nm), 0) + 1 FILE_SEQ,
                'Y' EXTRC_YN, 'N', 'N','N',
                v_Stdex_Dd,  'N' HEADER_YN, 'N' TRAILER_YN,
                X.TDATA_CNT, X.TDATA_AMT,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0, 0, 0, 0,
                0,
                'N' DEL_YN,
                v_Reg_Id REG_ID, SYSDATE REG_DT, v_Reg_Id CHG_ID, SYSDATE CHG_DT
        FROM    (
                SELECT  COUNT(1) TDATA_CNT, SUM(A.RCRD_AMT) TDATA_AMT
                FROM    RTRE0080 A
                WHERE   A.RCRD_DAY = v_Rcrd_Day
                ) X;

    IF SQLCODE <> 0 THEN
        v_Return_Message := 'Rtre0099 ���� ����!!!';
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '���������� ����Ǿ����ϴ�';
    v_ErrorText := '';
    --COMMIT;


    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_CreateRtre0099CardTrans(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_CreateRtre0099CardTrans(2)', v_ErrorText, v_Return_Message);

  END p_CreateRtre0099CardTrans;


  /*****************************************************************************
  -- �ۼ��� �۾� ����- ���½�û ���ó��(ȸ������): ���½�û ����ڵ� ������Ʈ �� ���� ���������� �� �������� ���� ������ ������Ʈ ó��
    REVISIONS
    Date        Author      Description
    ----------  --------    -------------------------------------
    2016-09-13  �ӿ���     ���½�û��� '�������'�� ���� �������ó��  
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099FileUpResultA (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- ���½�û ����
    CURSOR  Cur_Rtre0060 IS
    SELECT  ACRQ_FG,            /*���½�û �߻�����     */
            ACRQ_DAY,           /*���½�û��            */
            ACRQ_SEQ,           /*���½�û����          */
            ACRQ_TP,            /*���½�û ����         */
            ACRQ_ST,            /*���½�û ó������     */
            RPC_SEQ,            /*���������û����      */
            ORD_NO,             /*����ȣ              */
            ACC_SEQ,            /*���¹�ȣ              */
            ACERCD              /*���½�û����ڵ�      */
    FROM    RTRE0060            /*���½�û����          */
    WHERE   ACRQ_FG = 'A'       /*���½�û �߻�����     */
    AND     ACRQ_DAY  = v_Rqst_Day; /*���½�û��        */

    v_Total_Cnt  NUMBER DEFAULT 0;
    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT 'EB14';  /*�ۼ������ϱ���        */
    v_Fcret_Yn   RTRE0099.FCRET_YN%TYPE DEFAULT 'Y';    /*���ϻ�������          */
    v_Afacc_Stat RTRE0050.AFACC_STAT%TYPE DEFAULT NULL; /*������ ���½�û ����  */
    v_Afacrq_St  RTRE0050.AFACRQ_ST%TYPE DEFAULT NULL;  /*������ ���½�û ó����*/
    v_Pay_Mthd   RTSD0108.PAY_MTHD%TYPE DEFAULT NULL;   /*��������              */
    v_Acc_Seq    RTSD0108.ACC_SEQ%TYPE DEFAULT NULL;    /*���¼���              */
    v_Acc_Stat   RTSD0108.ACC_STAT%TYPE DEFAULT NULL;   /*���½�û����          */
    v_Bfacc_Stat RTRE0050.BFACC_STAT%TYPE DEFAULT NULL; /*������ ���½�û����   */
    v_Bfacrq_St  RTRE0050.BFACRQ_ST%TYPE DEFAULT NULL;  /*������ �������� ��û  */

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:��û����, ����� ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

   -- �ۼ��� �۾� �ڷ�  Ȯ��(RTRE0099)
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck (v_File_Tp, v_Rqst_Day, v_File_Tp||SUBSTR(v_Rqst_Day, 5,4)) THEN
        v_Return_Message := 'ó���� ���� �ۼ��� ����(RTRE0099) ����� �����ϴ�!!. �ý��۰����� ���� �ٶ�!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- ���½�û ���� ���� ������������(RTRE0050) ���� �� ����������(RTSD0108) ���½�û���� ������Ʈ
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;
        v_Total_Cnt := v_Total_Cnt+1;

        -- ���½�û ����:  ��û(1)
        IF CUR.ACRQ_TP = '1' THEN

            -- ���½�û ó������(ACRQ_ST) = 2 �̸� '4', �ƴϸ� '3'
            IF CUR.ACRQ_ST = '2' THEN
                v_Afacc_Stat := '4';
                v_Afacrq_St  := '4';
            ELSE
                v_Afacc_Stat := '3';
                v_Afacrq_St  := '3';
            END IF;

            IF 0 = Pkg_Rtre0050.f_sRtre0050Count(CUR.RPC_SEQ) THEN
                v_Return_Message := '���½�û������ ���������û����('||CUR.RPC_SEQ||')�� �������� �����̷�(RTRE0050)�� �����Ƿ� ó�� �Ұ�!!';
                RAISE e_Error;
            END IF;

            -- �������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°�(������) Update
            IF 0!= Pkg_Rtre0050.f_UpdateRtre0050AfterResult (CUR.RPC_SEQ, v_Afacc_Stat , v_Afacrq_St, v_Reg_Id,
                                                             v_ErrorText) THEN
                v_Return_Message := '�������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°� Update ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- ���������� �������а� ���¼��� ȹ��
            BEGIN
                SELECT  PAY_MTHD, ACC_SEQ
                INTO    v_Pay_Mthd, v_Acc_Seq
                FROM    RTSD0108
                WHERE   ORD_NO = CUR.ORD_NO;
            END;

            -- ������������ ȹ���� �������а� ���¼����� ���½�û ����(RTRE0060)�� ��ġ���� ������ ����ó��
            IF (NVL(v_Pay_Mthd, ' ') != 'A') OR (NVL(v_Acc_Seq, ' ') != CUR.ACC_SEQ) THEN
                v_Return_Message := '��������(RTSD0108)�� ��������(A - '||CUR.ACC_SEQ||')�� �����Ͽ� ó�� �Ұ�!!';
                RAISE e_Error;
            END IF;


            -- ���½�û ó������(ACRQ_ST) = 2 �̸� '4', �ƴϸ� '3'
            IF CUR.ACRQ_ST = '2' THEN
                v_Acc_Stat  := '4';

                -- ���½�û���� ������Ʈ
                IF 0!= Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ,  v_Acc_Stat, '0000', v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '���½�û ����(RTRE0050)�� ���½�û ó�����°� Update ����!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSE
                v_Acc_Stat  := '3';
            END IF;
            
            -- ���½�û �����ڵ尡 '���߽�û'�� ��쿡�� ����� ����ó���ϱ� ����
            -- ���������� ���½�û���´� '����'ó��
            IF v_Acc_Stat = '3' AND CUR.ACERCD = 'A016' THEN
                v_Acc_Stat := '4';
            END IF;
            
            -- ��������(RTSD0108)�� ���½�û���� ������Ʈ
            IF 0!= Pkg_Rtsd0108.f_UpdateRtsd0108AccStat (CUR.ORD_NO, v_Acc_Stat , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '��������(RTSD0108)�� ���½�û���� ������Ʈ ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        -- ���½�û ����: ����(3)
        ELSIF CUR.ACRQ_TP = '3' THEN

            -- ���½�û ó������(ACRQ_ST) = 2 �̸� '8', �ƴϸ� '7'
            IF CUR.ACRQ_ST = '2' THEN
                v_Bfacc_Stat  := '8';
                v_Bfacrq_St  := '8';

                -- ���½�û���� ������Ʈ
                IF 0!= Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ,  v_Bfacrq_St, '0000', v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '���½�û ����(RTRE0050)�� ���½�û ó�����°� Update ����!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            ELSE
                v_Bfacc_Stat  := '7';
                v_Bfacrq_St  := '7';
            END IF;

            -- �������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°�(������) Update
            IF 0!= Pkg_Rtre0050.f_UpdateRtre0050BeforeResult (CUR.RPC_SEQ, v_Bfacrq_St , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°� Update ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := '���½�û ���� ���� ó���� �� ���� ���½�û ����('||CUR.ACRQ_TP||')���� ó�� �Ұ�!!.';
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;


    -- �ۼ��� ó�� ���� ���� ������Ʈ
    IF 0!= f_UpdateRtre0099FileUpResult (v_File_Tp, v_Rqst_Day , v_Fcret_Yn, v_Reg_Id,
                                         v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾� Update - ���½�û ���ó�� ��� ������Ʈ ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099FileUpResultA(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099FileUpResultA(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0099FileUpResultA;

  /*****************************************************************************
  -- �ۼ��� �۾� ����- ���½�û ���ó��(��������): ���½�û ����ڵ� ������Ʈ �� ���� ���������� �� �������� ���� ������ ������Ʈ ó��
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099FileUpResultB (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- ���½�û ����
    CURSOR  Cur_Rtre0060 IS
    SELECT  ACRQ_FG,            /*���½�û �߻�����     */
            ACRQ_DAY,           /*���½�û��            */
            ACRQ_SEQ,           /*���½�û����          */
            ORD_NO,             /*����ȣ              */
            CUST_NO,            /*����ȣ              */
            ACC_SEQ,            /*���¼���              */
            ACRQ_TP,            /*���½�û ����         */
            RPC_SEQ,            /*���������û����      */
            ACRQ_ST             /*���½�û ó������     */
    FROM    RTRE0060            /*���½�û����          */
    WHERE   ACRQ_FG  = 'B'      /*���½�û �߻�����     */
    AND     ACRQ_DAY = v_Rqst_Day   /*���½�û��        */
    AND     ACRQ_ST != '3'
    AND     ACRQ_ST != '7';


    v_Total_Cnt  NUMBER DEFAULT 0;
    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT 'EB11';  /*�ۼ������ϱ���        */
    v_Fcret_Yn   RTRE0099.FCRET_YN%TYPE DEFAULT 'Y';    /*���ϻ�������          */

    v_Pay_Mthd   RTSD0108.PAY_MTHD%TYPE DEFAULT NULL;   /*��������              */
    v_Acc_Seq    RTSD0108.ACC_SEQ%TYPE DEFAULT NULL;    /*���¼���              */
    v_Acc_Stat   RTSD0108.ACC_STAT%TYPE DEFAULT NULL;   /*���½�û����          */

    v_Afacc_Stat RTRE0050.AFACC_STAT%TYPE DEFAULT NULL; /*������ ���½�û ����  */
    v_Afacrq_St  RTRE0050.AFACRQ_ST%TYPE DEFAULT NULL;  /*������ ���½�û ó����*/
    v_Bfacc_Stat RTRE0050.BFACC_STAT%TYPE DEFAULT NULL; /*������ ���½�û����   */
    v_Bfacrq_St  RTRE0050.BFACRQ_ST%TYPE DEFAULT NULL;  /*������ �������� ��û  */
    v_Rpc_Seq    RTRE0050.RPC_SEQ%TYPE DEFAULT NULL;    /*���������û����      */

    v_Acrq_Fg    RTRE0060.ACRQ_FG%TYPE DEFAULT NULL;    /*���½�û �߻�����     */
    v_Acrq_Day   RTRE0060.ACRQ_DAY%TYPE DEFAULT NULL;   /*���½�û��            */
    v_Acrq_Seq   RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL;   /*���½�û����          */
    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT NULL;    /*���½�û ó������     */
    v_Acercd     RTRE0060.ACERCD%TYPE DEFAULT NULL;     /*���½�û ����ڵ�     */


    v_File_Nm    RTRE0099.FILE_NM%TYPE DEFAULT NULL;    /*���ϸ�                */
    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:��û����, ����� ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- ���½�û�� = ��û����
    v_Acrq_Day := v_Rqst_Day;
    v_File_Nm  := v_File_Tp||SUBSTR(v_Rqst_Day, 5,4);

   -- �ۼ��� �۾� �ڷ�  Ȯ��(RTRE0099)
    IF 1 <> Pkg_Rtre0099.f_sRtre0099CountCheck (v_File_Tp, v_Rqst_Day, v_File_Nm) THEN
        v_Return_Message := 'ó���� ���� �ۼ��� ����(RTRE0099) ����� �����ϴ�!!. �ý��۰����� ���� �ٶ�!'||'-'||v_ErrorText;
        RAISE e_Error;
    END IF;

    -- ���½�û ���� ���� ������������(RTRE0050) ���� �� ����������(RTSD0108) ���½�û���� ������Ʈ
    FOR CUR IN Cur_Rtre0060 LOOP
        EXIT WHEN Cur_Rtre0060%NOTFOUND;
        v_Total_Cnt := v_Total_Cnt+1;

        -- ���������� �������а� ���¼��� ȹ��
        BEGIN
            SELECT  ACC_SEQ, ACC_STAT
            INTO    v_Acc_Seq, v_Acc_Stat
            FROM    RTSD0108
            WHERE   ORD_NO = CUR.ORD_NO;
        END;

        -- ���������û����
        v_Rpc_Seq := NULL;

        -- ���½�û ����:  ��û(1)
        IF CUR.ACRQ_TP = '1' THEN

            -- ������������ ȹ���� �������а� ���¼����� ���½�û ����(RTRE0060)�� ��ġ�ϸ�
            IF (NVL(v_Acc_Seq, ' ') = CUR.ACC_SEQ) AND (NVL(v_Acc_Stat, ' ') = '4') THEN


                    -- ���½�û ó������ : ��û����(4)
                    v_Acrq_St := '4';

                    -- ���½�û ����(RTRE0060) Update - ���½�ûó�� ���¸� ����
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqSt(v_Acrq_Fg, v_Rqst_Day, v_Acrq_St, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '���½�û ����(RTRE0060) Update - ���½�ûó�� ����(��û����:4)�� ���� ����!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

            ELSE
                -- �������� �����̷�(RTRE0050) ���� �� ���� ����
                p_UpdateRtre0099Acrq (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, CUR.ACRQ_TP,
                                      v_Reg_Id, v_Rpc_Seq, v_Success_Code, v_Return_Message, v_ErrorText);


                -- �������� �����̷� ���� �� ���� �߻��� �κ� �ѹ����� �ʰ� �Ʒ��� ����
                IF 0 = v_Success_Code THEN

                    v_Afacc_Stat := '4'; /*������ ���½�û ����  */
                    v_Afacrq_St  := '4'; /*������ ���½�û ó����*/


                    -- �������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°�(������) Update
                    IF 0!= Pkg_Rtre0050.f_UpdateRtre0050AfterResult (CUR.RPC_SEQ, v_Afacc_Stat , v_Afacrq_St, v_Reg_Id,
                                                                     v_ErrorText) THEN
                        v_Return_Message := '�������� �����̷�(RTRE0050)�� ���½�û ���ó�� ���°� Update ����!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                    v_Acrq_St := '4';     /*���½�û ó������     */
                    v_Acercd  := '0000';  /*���½�û ����ڵ�     */

                    -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ���������û���� ������Ʈ
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqStRpcSeq (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                                       v_Acercd, v_Rpc_Seq, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '���½�û ����(RTRE0060) Update(2) - ���½�û ó�����¿� ���������û���� ������Ʈ �� ����!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                ELSE

                    v_Acrq_St := '3';     /*���½�û ó������     */
                    v_Acercd  := 'A017';  /*���½�û ����ڵ�     */


                    -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ����ڵ� Update
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                                   v_Acercd, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '���½�û ����(RTRE0060) Update(1) - ���½�û ó�����¿� ����ڵ� Update �� ����!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;


                END IF;


            END IF;


        -- ���½�û ����: ����(3),��������(7)
        ELSIF CUR.ACRQ_TP IN ('3','7') THEN

            v_Acercd  := '0000';  /*���½�û ����ڵ�- ����ó��    */

            IF CUR.ACRQ_TP = '3' THEN
                v_Acrq_St := '8';
            ELSIF CUR.ACRQ_TP = '7' THEN
                v_Acrq_St := '9';
            END IF;

            -- ������������ ȹ���� �������а� ���¼����� ���½�û ����(RTRE0060)�� ��ġ�ϸ�
            IF NVL(v_Acc_Seq, ' ') = CUR.ACC_SEQ THEN

                IF NVL(v_Acc_Stat, ' ') = '4' THEN


                    -- �������� �����̷�(RTRE0050) ���� �� ���� ����(���������û���� ȹ��)
                    p_UpdateRtre0099Acrq (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, CUR.ACRQ_TP,
                                          v_Reg_Id, v_Rpc_Seq, v_Success_Code, v_Return_Message, v_ErrorText);

                    -- �������� �����̷� ���� �� ���� �߻��� �κ� �ѹ����� �ʰ� �Ʒ��� ����
                    IF 0 = v_Success_Code THEN

                        -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ���������û���� ������Ʈ
                        IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqStRpcSeq (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                                           v_Acercd, v_Rpc_Seq, v_Reg_Id, v_ErrorText) THEN
                            v_Return_Message := '���½�û ����(RTRE0060) Update(2) - ���½�û ó�����¿� ���������û���� ������Ʈ �� ����!!.'||'-'||v_ErrorText;
                            v_ErrorText := v_ErrorText;
                            RAISE e_Error;
                        END IF;

                    ELSE
                        v_Return_Message := '���½�û ����(RTRE0050) ���� ���� !!.'||'-'||v_Return_Message||'-'||v_ErrorText;
                        --v_Return_Message := '���½�û ����(RTRE0050) ���� ���� !!.'||'-'||CUR.ORD_NO||'-'||CUR.ACRQ_FG||'-'||CUR.ACRQ_DAY||'-'||CUR.ACRQ_SEQ||'-'||CUR.ACRQ_TP||'-'||v_Reg_Id;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                ELSE

                    v_Acrq_St := '7';
                    v_Acercd  := 'A017';  /*���½�û ����ڵ�     */

                    -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ����ڵ� Update
                    IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                                   v_Acercd, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '���½�û ����(RTRE0060) Update(3) - ���½�û ó�����¿� ����ڵ� Update �� ����!!.'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;

                END IF;

            ELSE

                v_Acrq_St := '7';
                v_Acercd  := 'A017';  /*���½�û ����ڵ�     */

                -- ���½�û ����(RTRE0060) Update - ���½�û ó�����¿� ����ڵ� Update
                IF 0 != Pkg_Rtre0060.f_UpdateRtre0060AcrqcdSt (CUR.ACRQ_FG, CUR.ACRQ_DAY, CUR.ACRQ_SEQ, v_Acrq_St,
                                                               v_Acercd, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '���½�û ����(RTRE0060) Update(3) - ���½�û ó�����¿� ����ڵ� Update �� ����!!.'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;

            END IF;

        ELSE
            v_Return_Message := '���½�û ���� ���� ó���� �� ���� ���½�û ����('||CUR.ACRQ_TP||')���� ó�� �Ұ�!!.';
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0060%ISOPEN THEN
        CLOSE Cur_Rtre0060;
    END IF;


    -- �ۼ��� ó�� ���� ���� ������Ʈ
    IF 0!= f_UpdateRtre0099FileUpResult (v_File_Tp, v_Rqst_Day , v_Fcret_Yn, v_Reg_Id,
                                          v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾� Update - ���½�û ���ó�� ��� ������Ʈ ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    -- ��������(EB11)�� �������� �����ü��û����(EB12)�� ����
    /* IF 0!= f_InsertRtre0099FileUpResult (v_File_Tp, v_Rqst_Day , v_File_Nm, v_Reg_Id,
                                         v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾� Update - ���½�û ���ó�� ��� ������Ʈ ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF; */

    -- ��������(EB11)�� �������� �����ü��û����(EB12)�� ����
    IF 0!= f_InsertRtre0099FileUpResult ('EB12', v_Rqst_Day , v_File_Nm, v_Reg_Id,
                                         v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾� Update - ���½�û ���ó�� ��� ������Ʈ ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099FileUpResultB(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_UpdateRtre0099FileUpResultB(2)', v_ErrorText, v_Return_Message);

  END p_UpdateRtre0099FileUpResultB;

  /*****************************************************************************
  -- �ۼ��� �۾� ���� - ��������(EB11)�� �������� �����ü��û����(EB12)�� ����
  *****************************************************************************/
  FUNCTION f_InsertRtre0099FileUpResult(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0099 (
            FILE_TP,
            RQST_DAY,
            FILE_NM,
            FILE_SEQ,
            FILE_DATA,
            EXTRC_YN,
            CONFI_YN,
            FCRET_YN,
            FTRAN_YN,
            STDEX_DD,
            STR_DAY,
            END_DAY,
            HEADER_YN,
            TRAILER_YN,
            TDATA_CNT,
            TDATA_AMT,
            ACRQ_CNT,
            ACCNRQ_CNT,
            RMCNRQ_CNT,
            REQST_CNT,
            REQST_AMT,
            CNCRQ_CNT,
            CNCRQ_AMT,
            SRECP_CNT,
            SRECP_AMT,
            HSRCP_CNT,
            HSRCP_AMT,
            ERECP_CNT,
            ERECP_AMT,
            SCNRQ_CNT,
            SCNRQ_AMT,
            ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  FILE_TP,
            RQST_DAY,
            'EB12'||SUBSTR(v_Rqst_Day,5,4) FILE_NM,
            FILE_SEQ,
            FILE_DATA,
            'Y' EXTRC_YN,
            'Y' CONFI_YN,
            'N' FCRET_YN,
            'N' FTRAN_YN,
            STDEX_DD,
            STR_DAY,
            END_DAY,
            HEADER_YN,
            TRAILER_YN,
            TDATA_CNT,
            TDATA_AMT,
            ACRQ_CNT,
            ACCNRQ_CNT,
            RMCNRQ_CNT,
            REQST_CNT,
            REQST_AMT,
            CNCRQ_CNT,
            CNCRQ_AMT,
            SRECP_CNT,
            SRECP_AMT,
            HSRCP_CNT,
            HSRCP_AMT,
            ERECP_CNT,
            ERECP_AMT,
            SCNRQ_CNT,
            SCNRQ_AMT,
            ECNRQ_CNT,
            ECNRQ_AMT,
            DEL_YN,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE
    FROM    RTRE0099
    WHERE   FILE_TP   = v_File_Tp
    AND     RQST_DAY  = v_Rqst_Day
    AND     FILE_NM   = v_File_Nm
    AND     DEL_YN    = 'N';


    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0099FileUpResult;


  /*****************************************************************************
  -- �ۼ��� �۾� ���� - ���½�û ����
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099Acrq (
    v_IAcrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,       /*���½�û �߻�����     */
    v_IAcrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,      /*���½�û��            */
    v_IAcrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,      /*���½�û����          */
    v_IAcrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,       /*���½�û����          */
    v_Reg_Id          IN RTRE0060.REG_ID%TYPE,        /*����� ID             */
    v_Rpc_Seq        OUT RTRE0050.RPC_SEQ%TYPE,       /*���������û����      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS


    v_Comm_Dvsn    CHAR DEFAULT NULL;                       /*ó������              */
    v_Ord_No       RTRE0050.ORD_NO%TYPE DEFAULT NULL;       /*�ֹ���ȣ              */
    v_Rpc_Day      RTRE0050.RPC_DAY%TYPE DEFAULT NULL;      /*���������û��        */
    v_Rpc_Uid      RTRE0050.RPC_UID%TYPE DEFAULT NULL;      /*���������û��        */
    v_Rpc_Cd       RTRE0050.RPC_CD%TYPE DEFAULT NULL;       /*��������ڵ�          */
    v_Rpc_Rsn      RTRE0050.RPC_RSN%TYPE DEFAULT NULL;      /*�������              */
    v_Acrq_Day     RTRE0060.ACRQ_DAY%TYPE DEFAULT NULL;     /*���½�û ó����       */
    v_Acrq_Seq     RTRE0060.ACRQ_SEQ%TYPE DEFAULT NULL;     /*���½�û ����         */
    v_File_Grp_Seq RTRE0050.FILE_GRP_SEQ%TYPE DEFAULT NULL; /*÷������              */
    v_Bfcust_No    RTRE0050.BFCUST_NO%TYPE DEFAULT NULL;    /*������ ����ȣ       */
    v_Bftcgrp_No   RTRE0050.BFTCGRP_NO%TYPE DEFAULT NULL;   /*������ ����û����ȣ   */
    v_Bfpay_Mthd   RTRE0050.BFPAY_MTHD%TYPE DEFAULT NULL;   /*������ �������       */
    v_Bfpay_Dd     RTRE0050.BFPAY_DD%TYPE DEFAULT NULL;     /*������ ��������       */
    v_Bfacc_Seq    RTRE0050.BFACC_SEQ%TYPE DEFAULT NULL;    /*������ ���¼���       */
    v_Bfacust_Nm   RTRE0010.CUST_NM%TYPE DEFAULT NULL;      /*������ �����ָ�       */
    v_Bfacust_Tp   RTRE0010.CUST_TP%TYPE DEFAULT NULL;      /*���������� ������   */
    v_Bfaebir_Day  RTRE0010.EBIR_DAY%TYPE DEFAULT NULL;     /*������ �����������   */
    v_Bfabusl_No   RTRE0010.BUSL_NO%TYPE DEFAULT NULL;      /*������ ���� ����ڹ�ȣ*/
    v_Bfbank_No    RTRE0010.BANK_CD%TYPE DEFAULT NULL;      /*������ �����ڵ�       */
    v_Bfacct_No    RTRE0010.ACCT_NO%TYPE DEFAULT NULL;      /*������ ���¹�ȣ       */
    v_Bfcrd_Seq    RTRE0020.CRD_SEQ%TYPE DEFAULT NULL;      /*������ ī�����       */
    v_Bfccust_Nm   RTRE0020.CUST_NM%TYPE DEFAULT NULL;      /*������ ī���ָ�       */
    v_Bfccust_Tp   RTRE0020.CUST_TP%TYPE DEFAULT NULL;      /*������ī�������    */
    v_Bfcebir_Day  RTRE0020.EBIR_DAY%TYPE DEFAULT NULL;     /*������ī������������*/
    v_Bfcbusl_No   RTRE0020.BUSL_NO%TYPE DEFAULT NULL;      /*������ī�����ڹ�ȣ  */
    v_Bfcardcom_No RTRE0020.CARDCOM_CD%TYPE DEFAULT NULL;   /*������ī����ڵ�      */
    v_Bfcard_No    RTRE0020.CARD_NO%TYPE DEFAULT NULL;      /*������ ī���ȣ       */
    v_Bfexpire_Ym  RTRE0020.EXPIRE_YM%TYPE DEFAULT NULL;    /*������ ��ȿ�Ⱓ       */
    v_Bfbatch_Key  RTRE0050.BFBATCH_KEY%TYPE DEFAULT NULL;  /*������ BATCH KEY      */
    v_Bfacc_Stat   RTRE0050.BFACC_STAT%TYPE DEFAULT NULL;   /*������ ���½�û����   */
    v_Afcust_No    RTRE0050.AFCUST_NO%TYPE DEFAULT NULL;    /*������ ����ȣ       */
    v_Aftcgrp_No   RTRE0050.AFTCGRP_NO%TYPE DEFAULT NULL;   /*������ ����û����ȣ   */
    v_Afpay_Mthd   RTRE0050.AFPAY_MTHD%TYPE DEFAULT NULL;   /*������ �������       */
    v_Afpay_Dd     RTRE0050.AFPAY_DD%TYPE DEFAULT NULL;     /*������ ��������       */
    v_Afacc_Seq    RTRE0050.AFACC_SEQ%TYPE DEFAULT NULL;    /*������ ���¼���       */
    v_Afacust_Nm   RTRE0010.CUST_NM%TYPE DEFAULT NULL;      /*������ ����         */
    v_Afacust_Tp   RTRE0010.CUST_TP%TYPE DEFAULT NULL;      /*������ ������       */
    v_Afaebir_Day  RTRE0010.EBIR_DAY%TYPE DEFAULT NULL;     /*������ �����������   */
    v_Afabusl_No   RTRE0010.BUSL_NO%TYPE DEFAULT NULL;      /*������ ����ڹ�ȣ     */
    v_Afbank_No    RTRE0010.BANK_CD%TYPE DEFAULT NULL;      /*������ �����ڵ�       */
    v_Afacct_No    RTRE0010.ACCT_NO%TYPE DEFAULT NULL;      /*������ ���¹�ȣ       */
    v_Afacc_Chk    RTRE0010.ACC_CHK%TYPE DEFAULT NULL;      /*������ ����Ȯ�λ���   */
    v_Afcrd_Seq    RTRE0050.AFCRD_SEQ%TYPE DEFAULT NULL;    /*������ ī�����       */
    v_Afbatch_Key  RTRE0050.AFBATCH_KEY%TYPE DEFAULT NULL;  /*������ BATCH KEY      */
    v_Afccust_Nm   RTRE0020.CUST_NM%TYPE DEFAULT NULL;      /*������ ī���ָ�       */
    v_Afccust_Tp   RTRE0020.CUST_TP%TYPE DEFAULT NULL;      /*������ī�������    */
    v_Afcebir_Day  RTRE0020.EBIR_DAY%TYPE DEFAULT NULL;     /*������ī������������*/
    v_Afcbusl_No   RTRE0020.BUSL_NO%TYPE DEFAULT NULL;      /*������ī�����ڹ�ȣ  */
    v_Afcardcom_No RTRE0020.CARDCOM_CD%TYPE DEFAULT NULL;   /*������ī����ڵ�      */
    v_Afcard_No    RTRE0020.CARD_NO%TYPE DEFAULT NULL;      /*������ ī���ȣ       */
    v_Afexpire_Ym  RTRE0020.EXPIRE_YM%TYPE DEFAULT NULL;    /*������ ��ȿ�Ⱓ       */
    v_Afbkey_Chk   RTRE0020.BKEY_CHK%TYPE DEFAULT NULL;     /*������ ī��Ȯ�� ����  */

  BEGIN


        BEGIN


            SELECT  'I'             Comm_Dvsn,
                    A.ORD_NO        Ord_No,                  /*����ȣ              */
                    v_IAcrq_Day     Rpc_Day,                 /*���������û��        */
                    NULL            Rpc_Uid,                 /*���������û��        */
                    DECODE(v_IAcrq_Tp, '1','03','3','02','7','06') Rpc_Cd, /*��������ڵ� */
                    Pkg_Rtcm0051.f_sRtcm0051CodeName('R013', DECODE(v_IAcrq_Tp, '1','03','3','02','7','06')) Rpc_Rsn, /*������� */
                    v_IAcrq_Day     Acrq_Day,                /*���½�û ó����       */
                    v_IAcrq_Seq     Acrq_Seq,                /*���½�û ����         */
                    NULL            File_Grp_Seq,            /*÷������              */
                    A.CUST_NO       Bfcust_No,               /*������ ����ȣ       */
                    A.TCGRP_NO      Bftcgrp_No,              /*����û����ȣ          */
                    A.PAY_MTHD      Bfpay_Mthd,              /*�������              */
                    A.PAY_DD        Bfpay_Dd,                /*������                */
                    A.ACC_SEQ       Bfacc_Seq,               /*���¼���              */
                    C.CUST_NM       Bfacust_Nm,              /*������ �����ָ�       */
                    C.CUST_TP       Bfacust_Tp,              /*���������� ������   */
                    C.EBIR_DAY      Bfaebir_Day,             /*������ �����������   */
                    C.BUSL_NO       Bfabusl_No,              /*������ ���� ����ڹ�ȣ*/
                    C.BANK_CD       Bfbank_No,               /*������ �����ڵ�       */
                    C.ACCT_NO       Bfacct_No,               /*������ ���¹�ȣ       */
                    D.CRD_SEQ       Bfcrd_Seq,               /*������ ī�����       */
                    D.CUST_NM       Bfccust_Nm,              /*������ ī���ָ�       */
                    D.CUST_TP       Bfccust_Tp,              /*������ī�������    */
                    D.EBIR_DAY      Bfcebir_Day,             /*������ī������������*/
                    D.BUSL_NO       Bfcbusl_No,              /*������ī�����ڹ�ȣ  */
                    D.CARDCOM_CD    Bfcardcom_No,            /*������ī����ڵ�      */
                    D.CARD_NO       Bfcard_No,               /*������ ī���ȣ       */
                    D.EXPIRE_YM     Bfexpire_Ym,             /*������ ��ȿ�Ⱓ       */
                    A.BATCH_KEY     Bfbatch_Key,             /*������ BATCH KEY      */
                    A.ACC_STAT      Bfacc_Stat,              /*������ ���½�û����   */
                    B.CUST_NO       Afcust_No,               /*������ ����ȣ       */
                    A.TCGRP_NO      Aftcgrp_No,              /*������ ����û����ȣ   */
                    'A'             Afpay_Mthd,              /*������ �������       */
                    A.PAY_DD        Afpay_Dd,                /*������ ��������       */
                    B.ACC_SEQ       Afacc_Seq,               /*������ ���¼���       */
                    E.CUST_NM       Afacust_Nm,              /*������ ����         */
                    E.CUST_TP       Afacust_Tp,              /*������ ������       */
                    E.EBIR_DAY      Afaebir_Day,             /*������ �����������   */
                    E.BUSL_NO       Afabusl_No,              /*������ ����ڹ�ȣ     */
                    E.BANK_CD       Afbank_No,               /*������ �����ڵ�       */
                    E.ACCT_NO       Afacct_No,               /*������ ���¹�ȣ       */
                    'Y'             Afacc_Chk,               /*������ ����Ȯ�λ���   */
                    NULL            Afcrd_Seq,               /*������ ī�����       */
                    NULL            Afbatch_Key,             /*������ BATCH KEY      */
                    NULL            Afccust_Nm,              /*������ ī���ָ�       */
                    NULL            Afccust_Tp,              /*������ī�������    */
                    NULL            Afcebir_Day,             /*������ī������������*/
                    NULL            Afcbusl_No,              /*������ī�����ڹ�ȣ  */
                    NULL            Afcardcom_No,            /*������ī����ڵ�      */
                    NULL            Afcard_No,               /*������ ī���ȣ       */
                    NULL            Afexpire_Ym,             /*������ ��ȿ�Ⱓ       */
                    'N'             Afbkey_Chk               /*������ ī��Ȯ�� ����  */
            INTO    v_Comm_Dvsn, v_Ord_No, v_Rpc_Day, v_Rpc_Uid, v_Rpc_Cd, v_Rpc_Rsn, v_Acrq_Day, v_Acrq_Seq, v_File_Grp_Seq, v_Bfcust_No,
                    v_Bftcgrp_No, v_Bfpay_Mthd, v_Bfpay_Dd, v_Bfacc_Seq, v_Bfacust_Nm, v_Bfacust_Tp, v_Bfaebir_Day, v_Bfabusl_No, v_Bfbank_No, v_Bfacct_No,
                    v_Bfcrd_Seq, v_Bfccust_Nm, v_Bfccust_Tp, v_Bfcebir_Day, v_Bfcbusl_No, v_Bfcardcom_No, v_Bfcard_No, v_Bfexpire_Ym, v_Bfbatch_Key, v_Bfacc_Stat,
                    v_Afcust_No, v_Aftcgrp_No, v_Afpay_Mthd, v_Afpay_Dd, v_Afacc_Seq, v_Afacust_Nm, v_Afacust_Tp, v_Afaebir_Day, v_Afabusl_No, v_Afbank_No,
                    v_Afacct_No, v_Afacc_Chk, v_Afcrd_Seq, v_Afbatch_Key, v_Afccust_Nm, v_Afccust_Tp, v_Afcebir_Day, v_Afcbusl_No, v_Afcardcom_No, v_Afcard_No,
                    v_Afexpire_Ym, v_Afbkey_Chk
            FROM    RTSD0108 A,              /*��������T    */
                    RTRE0060 B,              /*���½�û ����T*/
                    RTRE0010 C,              /*����������T*/
                    RTRE0020 D,              /*��ī������T*/
                    RTRE0010 E               /*����������T*/
            WHERE   B.ACRQ_FG   = v_IAcrq_Fg
            AND     B.ACRQ_DAY  = v_IAcrq_Day
            AND     B.ACRQ_SEQ  = v_IAcrq_Seq
            AND     A.ORD_NO    = B.ORD_NO
            AND     A.ACC_SEQ   = C.ACC_SEQ(+)
            AND     A.CRD_SEQ   = D.CRD_SEQ(+)
            AND     C.USE_YN(+) = 'Y'
            AND     D.USE_YN(+) = 'Y'
            AND     B.ACC_SEQ   = E.ACC_SEQ;

        END;

        -- �������� �����̷� ����(IUD)
        Pkg_Rtre0050.p_IUDRtre0050 (v_Comm_Dvsn, v_Ord_No, v_Rpc_Day, v_Rpc_Uid, v_Rpc_Cd, v_Rpc_Rsn, v_Acrq_Day, v_Acrq_Seq, v_File_Grp_Seq, v_Bfcust_No,
                                    v_Bftcgrp_No, v_Bfpay_Mthd, v_Bfpay_Dd, v_Bfacc_Seq, v_Bfacust_Nm, v_Bfacust_Tp, v_Bfaebir_Day, v_Bfabusl_No, v_Bfbank_No, v_Bfacct_No,
                                    v_Bfcrd_Seq, v_Bfccust_Nm, v_Bfccust_Tp, v_Bfcebir_Day, v_Bfcbusl_No, v_Bfcardcom_No, v_Bfcard_No, v_Bfexpire_Ym, v_Bfbatch_Key, v_Bfacc_Stat,
                                    v_Afcust_No, v_Aftcgrp_No, v_Afpay_Mthd, v_Afpay_Dd, v_Afacc_Seq, v_Afacust_Nm, v_Afacust_Tp, v_Afaebir_Day, v_Afabusl_No, v_Afbank_No,
                                    v_Afacct_No, v_Afacc_Chk, v_Afcrd_Seq, v_Afbatch_Key, v_Afccust_Nm, v_Afccust_Tp, v_Afcebir_Day, v_Afcbusl_No, v_Afcardcom_No, v_Afcard_No,
                                    v_Afexpire_Ym, v_Afbkey_Chk, v_Reg_Id, v_Rpc_Seq,
                                    v_Success_Code, v_Return_Message, v_ErrorText);


  END p_UpdateRtre0099Acrq;

  /*****************************************************************************
  -- �ۼ��� �۾� ����- ���ݿ����� ������� ���ε�
  *****************************************************************************/
  PROCEDURE p_InsertRtre0099CashFileUpload (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS


    v_Acrq_Fg    RTRE0060.ACRQ_FG%TYPE DEFAULT NULL;  /*���½�û �߻�����     */
    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL; /*���ϼ���              */
    v_Extrc_Yn   RTRE0099.EXTRC_YN%TYPE DEFAULT 'N';  /*������迩��          */
    v_Confi_Yn   RTRE0099.CONFI_YN%TYPE DEFAULT 'N';  /*���Ȯ�ο���          */
    v_Fcret_Yn   RTRE0099.FCRET_YN%TYPE DEFAULT 'N';  /*���ϻ�������          */
    v_Ftran_Yn   RTRE0099.FTRAN_YN%TYPE DEFAULT 'N';  /*�������ۿ���          */
    v_Stdex_Dd   RTRE0099.STDEX_DD%TYPE DEFAULT NULL; /*��������ü����        */
    v_Str_Day    RTRE0099.STR_DAY%TYPE DEFAULT NULL;  /*������ ������       */
    v_End_Day    RTRE0099.END_DAY%TYPE DEFAULT NULL;  /*������ ������       */
    v_Header_Yn  RTRE0099.HEADER_YN%TYPE DEFAULT 'N'; /*HEADER ���翩��       */
    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT 'N';/*TRAILER ���翩��      */
    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT 0;   /*������ �ѰǼ�         */
    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT 0;   /*������ �ѱݾ�         */
    v_Acrq_Cnt   RTRE0099.ACRQ_CNT%TYPE DEFAULT 0;    /*���½�û�Ǽ�          */
    v_Accnrq_Cnt RTRE0099.ACCNRQ_CNT%TYPE DEFAULT 0;  /*���������Ǽ�          */
    v_Rmcnrq_Cnt RTRE0099.RMCNRQ_CNT%TYPE DEFAULT 0;  /*�������������Ǽ�      */
    v_Reqst_Cnt  RTRE0099.REQST_CNT%TYPE DEFAULT 0;   /*��û�Ǽ�              */
    v_Reqst_Amt  RTRE0099.REQST_AMT%TYPE DEFAULT 0;   /*��û�ݾ�              */
    v_Cncrq_Cnt  RTRE0099.CNCRQ_CNT%TYPE DEFAULT 0;   /*��ҿ�û�Ǽ�          */
    v_Cncrq_Amt  RTRE0099.CNCRQ_AMT%TYPE DEFAULT 0;   /*��ҿ�û�ݾ�          */
    v_Srecp_Cnt  RTRE0099.SRECP_CNT%TYPE DEFAULT 0;   /*������� ó���Ǽ�     */
    v_Srecp_Amt  RTRE0099.SRECP_AMT%TYPE DEFAULT 0;   /*������� ó���ݾ�     */
    v_Hsrcp_Cnt  RTRE0099.HSRCP_CNT%TYPE DEFAULT 0;   /*�κа��� ó���Ǽ�     */
    v_Hsrcp_Amt  RTRE0099.HSRCP_AMT%TYPE DEFAULT 0;   /*�κа��� ó���ݾ�     */
    v_Erecp_Cnt  RTRE0099.ERECP_CNT%TYPE DEFAULT 0;   /*�������� ó���Ǽ�     */
    v_Erecp_Amt  RTRE0099.ERECP_AMT%TYPE DEFAULT 0;   /*�������� ó���ݾ�     */
    v_Scnrq_Cnt  RTRE0099.SCNRQ_CNT%TYPE DEFAULT 0;   /*������� ó���Ǽ�     */
    v_Scnrq_Amt  RTRE0099.SCNRQ_AMT%TYPE DEFAULT 0;   /*������� ó���ݾ�     */
    v_Ecnrq_Cnt  RTRE0099.ECNRQ_CNT%TYPE DEFAULT 0;   /*��ҿ��� ó���Ǽ�     */
    v_Ecnrq_Amt  RTRE0099.ECNRQ_AMT%TYPE DEFAULT 0;   /*��ҿ��� ó���ݾ�     */
    v_Del_Yn     RTRE0099.DEL_YN%TYPE DEFAULT 'N';    /*��������              */

    v_Acrq_St    RTRE0060.ACRQ_ST%TYPE DEFAULT '2';   /*���½�û ó������     */
    v_Cash_Stat  RTRE0091.CASH_STAT%TYPE DEFAULT NULL;/*���ݿ����� �������   */

--    v_File_Tp    RTRE0099.FILE_TP%TYPE DEFAULT NULL;   /*�ۼ������ϱ���        */
--    v_Rqst_Day   RTRE0099.RQST_DAY%TYPE DEFAULT NULL;  /*��û����              */
--    v_File_Nm    RTRE0099.FILE_NM%TYPE DEFAULT NULL;   /*���ϸ�                */
--    v_File_Seq   RTRE0099.FILE_SEQ%TYPE DEFAULT NULL;  /*���ϼ���              */
--    v_Extrc_Yn   RTRE0099.EXTRC_YN%TYPE DEFAULT NULL;  /*������迩��          */
--    v_Header_Yn  RTRE0099.HEADER_YN%TYPE DEFAULT NULL; /*HEADER ���翩��       */
--    v_Trailer_Yn RTRE0099.TRAILER_YN%TYPE DEFAULT NULL;/*TRAILER ���翩��      */
--    v_Tdata_Cnt  RTRE0099.TDATA_CNT%TYPE DEFAULT NULL; /*������ �ѰǼ�         */
--    v_Tdata_Amt  RTRE0099.TDATA_AMT%TYPE DEFAULT NULL; /*������ �ѱݾ�         */
--    v_Reg_Id     RTRE0099.REG_ID%TYPE DEFAULT NULL;    /*����� ID             */

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���:��û����,���ϸ�, ����� ID
    IF 0 != ISDATE(v_Rqst_Day) THEN
        v_Return_Message := '��û����('||v_Rqst_Day||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_File_Nm) IS NULL THEN
        v_Return_Message := '���ϸ�('||v_File_Nm||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;

    -- ���� �ۼ��� ������ �����ϸ�(�̹� ���� ���ε带 �� ����)
    IF 0 < Pkg_Rtre0098.f_sRtre0098CountCheck2(v_Rqst_Day, v_File_Nm) THEN

        BEGIN
            -- ���Ȯ�ο���
            SELECT  FILE_SEQ, CONFI_YN
            INTO    v_File_Seq, v_Confi_Yn
            FROM    RTRE0099
            WHERE   FILE_TP   = v_File_Tp
            AND     RQST_DAY  = v_Rqst_Day
            AND     FILE_NM   = v_File_Nm
            AND     FCRET_YN  = 'N' -- ���ϻ�������
            AND     FTRAN_YN  = 'N' -- �������ۿ���
            AND     DEL_YN    = 'N';-- ��������

            EXCEPTION
              WHEN OTHERS THEN
                v_Return_Message := '�ۼ������� ���� ȹ�� ����!!!. �ý��۰����� ���� �ٶ�!(ERR CODE: 9GM5F2)';
                RAISE e_Error;
        END;

        IF v_Confi_Yn IS NULL THEN
            v_Return_Message := '���Ȯ���� �ȵǹǷ� ó���� �Ұ� �մϴ�.!!';
            RAISE e_Error;

        ELSIF v_Confi_Yn = 'Y' THEN
            v_Return_Message := '���Ȯ���� �Ϸ�� �����̹Ƿ� ó���� �Ұ� �մϴ�.!!';
            RAISE e_Error;

        -- ���Ȯ�� �����̹Ƿ� ���� �����͸� ����(������Ʈ) ó��
        ELSIF v_Confi_Yn = 'N' THEN

            -- �ۼ��� �۾�(RTRE0099) - ��û����, ���ϸ� ���� ����ó��
            IF 0 != f_DeleteRtre0099DelYn(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '�ۼ��� �۾�(RTRE0099) - ��û����, ���ϸ� ���� ����ó�� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


            -- ���� �ۼ��� ����(RTRE0098) Update - �۽� ���� ����� DEL_YN ������Ʈ
            IF 0 != Pkg_Rtre0098.f_Delete0098FileClear2(v_Rqst_Day, v_File_Nm, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���� �ۼ��� ����(RTRE0098) Update - �۽� ���� ����� DEL_YN ������Ʈ ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

            -- ���ݿ����� �������
            v_Cash_Stat := '2';

            -- ���ݿ������߱޳���(RTRE0091) ������� ������Ʈ
            IF 0!= Pkg_Rtre0091.f_UpdateRtre0091CashStat2 (v_Rqst_Day, v_File_Seq, v_Cash_Stat , v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '���ݿ������߱޳���(RTRE0091) ������� ������Ʈ ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        END IF;

    END IF;

    -- ���ϼ��� ȹ��
    v_File_Seq := f_sRtre0099FileSeq(v_File_Tp, v_Rqst_Day, v_File_Nm);


    -- �ۼ��� �۾�(RTRE0099) ������ ����
    IF 0 != f_InsertRtre0099(v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq, v_File_Data,
                             v_Extrc_Yn, v_Confi_Yn, v_Fcret_Yn, v_Ftran_Yn,
                             v_Stdex_Dd, v_Str_Day, v_End_Day, v_Header_Yn,
                             v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, v_Acrq_Cnt,
                             v_Accnrq_Cnt, v_Rmcnrq_Cnt, v_Reqst_Cnt, v_Reqst_Amt,
                             v_Cncrq_Cnt, v_Cncrq_Amt, v_Srecp_Cnt, v_Srecp_Amt,
                             v_Hsrcp_Cnt, v_Hsrcp_Amt, v_Erecp_Cnt, v_Erecp_Amt,
                             v_Scnrq_Cnt, v_Scnrq_Amt, v_Ecnrq_Cnt, v_Ecnrq_Amt,
                             v_Del_Yn, v_Reg_Id, v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾�(RTRE0099) ������ ���� ����!!!'||'-'||v_ErrorText;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;

    END IF;


    -- ���� �ۼ��� ����(RTRE0098) ���� - ������ ���� �Ľ��Ͽ� ����
    Pkg_Rtre0098.p_InsertRtre0098FileParsingCh(v_Rqst_Day, v_File_Nm, v_File_Tp, v_File_Seq,
                                               v_File_Data, v_Header_Yn,
                                               v_Trailer_Yn, v_Tdata_Cnt, v_Tdata_Amt, v_Reg_Id,
                                               v_Success_Code, v_Return_Message, v_ErrorText);
    IF 0 != v_Success_Code THEN
        v_Return_Message := '���� �ۼ��� ����(RTRE0098) ���� - ������ ���� �Ľ��Ͽ� ���� ����!!!'||'-'||v_Return_Message;
        v_ErrorText := v_ErrorText;
        RAISE e_Error;
    END IF;

    -- ������迩��
    v_Extrc_Yn := 'Y';

    -- �ۼ��� �۾�(RTRE0099) Update - ���ݿ����� ������� ���ε� ��� ������Ʈ
    IF 0 != f_UpdateRtre0099CashFileUpload (v_File_Tp, v_Rqst_Day, v_File_Nm, v_File_Seq,
                                            v_Extrc_Yn, v_Header_Yn, v_Trailer_Yn, v_Tdata_Cnt,
                                            v_Tdata_Amt, v_Reg_Id,
                                            v_ErrorText) THEN
        v_Return_Message := '�ۼ��� �۾�(RTRE0099) Update - ���½��� ��� ��ġ ��� ������Ʈ ����!!!'||'-'||v_Return_Message;
        RAISE e_Error;
    END IF;


    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_InsertRtre0099AcrqFileUpload(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0099.p_InsertRtre0099AcrqFileUpload(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0099CashFileUpload;

END Pkg_Rtre0099;
/
