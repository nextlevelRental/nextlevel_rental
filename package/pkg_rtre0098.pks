CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtre0098 AS
/*******************************************************************************
   NAME:      Pkg_Rtre0098
   PURPOSE   ���� �ۼ��� ���� ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-23  jemcarry         1. Created this package body.
*******************************************************************************/
    
  /*****************************************************************************
  -- ���� �ۼ��� ���� Count
  *****************************************************************************/
  FUNCTION f_sRtre0098Count(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,          /*���ϸ�              */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE           /*ROW ����            */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �ۼ��� ���� Select
  *****************************************************************************/
  PROCEDURE p_sRtre0098 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW ����              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*���ϳ���              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE          /*����� ID             */
    );

  /*****************************************************************************
  -- ���� �ۼ��� ���� Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW ����              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*���ϳ���              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    

  /*****************************************************************************
  -- ���� �ۼ��� ���� Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW ����              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*���ϳ���              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �ۼ��� ���� Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0098 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN RTRE0098.ROW_SEQ%TYPE,        /*ROW ����              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �ۼ��� ���� ����(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0098 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Row_Seq        IN OUT RTRE0098.ROW_SEQ%TYPE,    /*ROW ����              */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN RTRE0098.ROW_DATA%TYPE,       /*���ϳ���              */
    v_Del_Yn         IN RTRE0098.DEL_YN%TYPE,         /*��������              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���� �ۼ��� ���� - ��û����/���ϸ� ���� ROW ���� ȹ��
  *****************************************************************************/
  FUNCTION f_sRtre0098RowSeq(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,         /*��û����            */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE           /*���ϸ�              */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �ۼ��� ���� - ���½�û���� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EI13Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF����              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ���� �ۼ��� ���� - ���½�ûó�� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB13Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF����              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ���� �ۼ��� ���� - ���½�ûó�� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB12Batch (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Crlf_Yn        OUT VARCHAR,                     /*CRLF����              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- ���� �ۼ��� ���� - ���½�ûó�� ���ϻ��� - �޸��� �и��� ��Ʈ�������͸� ����ϴ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098EB13String (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Row_Data       IN STRING,                       /*���ϳ���              */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Tdata_Cnt      OUT VARCHAR,                     /*�����ͰǼ�            */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );        
  /*****************************************************************************
  -- ���� �ۼ��� ���� Count - �ۼ���ó�� ���� üũ COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0098CountCheck(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE        /*���� ����             */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���� �ۼ��� ���� Count - �ۼ���ó�� ���� üũ COUNT
  *****************************************************************************/
  FUNCTION f_sRtre0098CountCheck2(
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE         /*���ϸ�                */
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���� �ۼ��� ���� Update - �۽� ���� ����� DEL_YN ������Ʈ
  *****************************************************************************/
  FUNCTION f_Delete0098FileClear (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;
    
  /*****************************************************************************
  -- ���� �ۼ��� ���� Update - �۽� ���� ����� DEL_YN ������Ʈ
  *****************************************************************************/
  FUNCTION f_Delete0098FileClear2 (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �ۼ��� ���� Delete - �۽� ���� ���ε� ��ó���ϱ����� �����ڷ� ����
  *****************************************************************************/
  FUNCTION f_Delete0098Day_Nm (
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- ���� �ۼ��� ���� - �����ü�ڷ� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098TransAccum (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_Crlf_Yn        OUT VARCHAR2                     /* CRLF ����            */
    );        
    
    
  /*****************************************************************************
  -- ���� �ۼ��� ���� - ī����ü�ڷ� ���ϻ���
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098CardTrans (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2,
    v_Crlf_Yn        OUT VARCHAR2                     /* CRLF ����            */
    );        
    
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� -  ȸ������(A) ������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingA (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Extrc_Yn       IN OUT RTRE0099.EXTRC_YN%TYPE,   /*������迩��          */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER ���翩��       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*������ �ѰǼ�         */
    v_Acrq_Cnt       IN OUT RTRE0099.ACRQ_CNT%TYPE,   /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN OUT RTRE0099.ACCNRQ_CNT%TYPE, /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN OUT RTRE0099.RMCNRQ_CNT%TYPE, /*�������������Ǽ�      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� - ��������(B������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingB (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Acrq_Fg        IN RTRE0060.ACRQ_FG%TYPE,        /*���½�û �߻�����     */
    v_Extrc_Yn       IN OUT RTRE0099.EXTRC_YN%TYPE,   /*������迩��          */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER ���翩��       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*������ �ѰǼ�         */
    v_Acrq_Cnt       IN OUT RTRE0099.ACRQ_CNT%TYPE,   /*���½�û�Ǽ�          */
    v_Accnrq_Cnt     IN OUT RTRE0099.ACCNRQ_CNT%TYPE, /*���������Ǽ�          */
    v_Rmcnrq_Cnt     IN OUT RTRE0099.RMCNRQ_CNT%TYPE, /*�������������Ǽ�      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� -  �����ü(T) ��� ���� UPLOAD
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingT (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� -  ī����ü(C) ��� ���� UPLOAD
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingC (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- ���� �ۼ��� ����(RTRE0098) ���� - ���ݿ����� ������ ���� �Ľ��Ͽ� ����
  *****************************************************************************/
  PROCEDURE p_InsertRtre0098FileParsingCh (    
    v_Rqst_Day       IN RTRE0098.RQST_DAY%TYPE,       /*��û����              */
    v_File_Nm        IN RTRE0098.FILE_NM%TYPE,        /*���ϸ�                */
    v_File_Tp        IN RTRE0098.FILE_TP%TYPE,        /*�ۼ��� ���ϱ���       */
    v_File_Seq       IN RTRE0098.FILE_SEQ%TYPE,       /*���� ����             */
    v_File_Data      IN RTRE0099.FILE_DATA%TYPE,      /*���ϵ�����(CLOB)      */
    v_Header_Yn      IN OUT RTRE0099.HEADER_YN%TYPE,  /*HEADER ���翩��       */
    v_Trailer_Yn     IN OUT RTRE0099.TRAILER_YN%TYPE, /*TRAILER ���翩��      */
    v_Tdata_Cnt      IN OUT RTRE0099.TDATA_CNT%TYPE,  /*������ �ѰǼ�         */
    v_Tdata_Amt      IN OUT RTRE0099.TDATA_AMT%TYPE,  /*������ �ѱݾ�         */
    v_Reg_Id         IN RTRE0098.REG_ID%TYPE,         /*����� ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) ;    
    
END Pkg_Rtre0098;
/
