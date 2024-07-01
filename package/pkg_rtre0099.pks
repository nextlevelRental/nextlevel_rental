CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0099 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0099
   PURPOSE   �ۼ��� �۾� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- �ۼ��� �۾� Count
  *****************************************************************************/
  FUNCTION f_sRtre0099Count(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*���ϸ�              */
    v_File_Seq       IN RTRE0099.FILE_SEQ%TYPE          /*���ϼ���            */
    ) RETURN NUMBER;

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
    );

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;

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
    ) ;

 /*****************************************************************************
  -- �ۼ��� �۾� ���� ������Ʈ(������迩��, ���Ȯ�ο��� ���ϻ�������, �������ۿ��� �۾��� ó������ ������Ʈ)
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099Extrcyn (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*���½�û����          */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_Cnf_Step       IN RTRE0099.FILE_NM%TYPE,        /*�۽�ó���ܰ�          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

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
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- �ۼ��� �۾� - �ۼ������ϱ���/��û����/���ϸ� ����  ���ϼ��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0099FileSeq(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �ۼ��� �۾� - �ۼ������ϱ���/��û����/���ϸ� ����  �������ϼ��� ��ȸ
  *****************************************************************************/
  FUNCTION f_sRtre0099FinalFileSeq(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN NUMBER;                                    /*���ϼ���            */


  /*****************************************************************************
  -- �ۼ��� �۾� - ���� ���½�û �۾����� ���ϱ�
  *****************************************************************************/
  FUNCTION f_sRtre0099RpcDay RETURN VARCHAR;

  /*****************************************************************************
  -- �ۼ��� �۾� Count - �������� ���� ������� ���� COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099FileCount(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*���ϸ�              */
    v_Del_Yn         IN VARCHAR                         /*��������(NULL,Y,N)  */
    ) RETURN NUMBER;
        
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
    ) RETURN NUMBER;

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
    ) RETURN NUMBER;
    
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
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �ۼ��� �۾� Count - �ۼ���ó�� ���� üũ COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099CountCheck(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- �����ü �۾� Count - �����üó�� ���� üũ COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0099CountCheck2(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*���ϸ�              */
    v_Gubun          IN VARCHAR2                        /*����                */
    ) RETURN NUMBER;

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
    );

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
    );

  /*****************************************************************************
  -- �ۼ��� �۾� - ���Ȯ�ο��� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0099ConfiYn(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,          /*�ۼ������ϱ���      */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN VARCHAR;


  /*****************************************************************************
  -- �ۼ��� �۾� - ��û����, ���ϸ� ���� ����ó��
  *****************************************************************************/
  FUNCTION f_DeleteRtre0099DelYn(
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,          /*���ϸ�              */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
                
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
    ) RETURN NUMBER;


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
    ) RETURN NUMBER;


  /*****************************************************************************
  -- �ۼ��� �۾� Update - ���½�û ���ó�� ��� ������Ʈ
  *****************************************************************************/
  FUNCTION f_UpdateRtre0099FileUpResult (
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_Fcret_Yn       IN RTRE0099.FCRET_YN%TYPE,       /*���ϻ�������          */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- �ۼ��� �۾� ����- ���½�û ���ó��(ȸ������): ���½�û ����ڵ� ������Ʈ �� ���� ���������� �� �������� ���� ������ ������Ʈ ó��
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099FileUpResultA (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */    
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- �ۼ��� �۾� ����- ���½�û ���ó��(��������): ���½�û ����ڵ� ������Ʈ �� ���� ���������� �� �������� ���� ������ ������Ʈ ó��
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099FileUpResultB (
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */    
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- �ۼ��� �۾� ���� - ��������(EB11)�� �������� �����ü��û����(EB12)�� ����
  *****************************************************************************/
  FUNCTION f_InsertRtre0099FileUpResult(
    v_File_Tp        IN RTRE0099.FILE_TP%TYPE,        /*�ۼ������ϱ���        */
    v_Rqst_Day       IN RTRE0099.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0099.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0099.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
        
  /*****************************************************************************
  -- �ۼ��� �۾� ���� - ���½�û ���� 
  *****************************************************************************/
  PROCEDURE p_UpdateRtre0099Acrq (
    v_IAcrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,       /*���½�û �߻�����     */
    v_IAcrq_Day       IN RTRE0060.ACRQ_DAY%TYPE,      /*���½�û��            */
    v_IAcrq_Seq       IN RTRE0060.ACRQ_SEQ%TYPE,      /*���½�û����          */
    v_IAcrq_Tp        IN RTRE0060.ACRQ_TP%TYPE,        /*���½�û����          */
    v_Reg_Id          IN RTRE0060.REG_ID%TYPE,        /*����� ID             */
    v_Rpc_Seq        OUT RTRE0050.RPC_SEQ%TYPE,       /*���������û����      */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

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
    );
            
END Pkg_Rtre0099;
/
