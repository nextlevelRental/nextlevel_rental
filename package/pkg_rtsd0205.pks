CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0205 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0205
   PURPOSE   SMS 발송 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-20  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- SMS 발송 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0205Count(
    v_Cmp_Msg_Id     IN RTSD0205.CMP_MSG_ID%TYPE        /*메시지 ID           */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SMS 발송 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0205 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cmp_Msg_Id     IN RTSD0205.CMP_MSG_ID%TYPE,     /*메시지 ID             */
    v_Cmp_Msg_Group_Id IN RTSD0205.CMP_MSG_GROUP_ID%TYPE, /*메시지 그룹ID     */
    v_Usr_Id         IN RTSD0205.USR_ID%TYPE,         /*서비스ID              */
    v_Sms_Gb         IN RTSD0205.SMS_GB%TYPE,         /*전송 위치구분         */
    v_Used_Cd        IN RTSD0205.USED_CD%TYPE,        /*메시지 구분           */
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,    /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,  /*예약 전송시간         */
    v_Saved_Fg       IN RTSD0205.SAVED_FG%TYPE,       /*메시지 저장여부       */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,     /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,     /*보내는 전화번호       */
    v_Nat_Cd         IN RTSD0205.NAT_CD%TYPE,         /*국가코드              */
    v_Assign_Cd      IN RTSD0205.ASSIGN_CD%TYPE,      /*특정가입자지정        */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,        /*메시지내용            */
    v_Callback_Url   IN RTSD0205.CALLBACK_URL%TYPE,   /*Callback URL          */
    v_Content_Cnt    IN RTSD0205.CONTENT_CNT%TYPE,    /*첨부된 컨텐츠개수     */
    v_Content_Mime_Type IN RTSD0205.CONTENT_MIME_TYPE%TYPE, /*컨텐츠 MIME TYPE*/
    v_Content_Path   IN RTSD0205.CONTENT_PATH%TYPE,   /*첨부된 컨텐츠PATH     */
    v_Cmp_Snd_Dttm   IN RTSD0205.CMP_SND_DTTM%TYPE,   /*업체 SK 전송한시간    */
    v_Cmp_Rcv_Dttm   IN RTSD0205.CMP_RCV_DTTM%TYPE,   /*업체 결과받은시간     */
    v_Reg_Snd_Dttm   IN RTSD0205.REG_SND_DTTM%TYPE,   /*SK 통신사보낸시간     */
    v_Reg_Rcv_Dttm   IN RTSD0205.REG_RCV_DTTM%TYPE,   /*메시지 받은시간       */
    v_Machine_Id     IN RTSD0205.MACHINE_ID%TYPE,     /*메시지입력경로        */
    v_Sms_Status     IN RTSD0205.SMS_STATUS%TYPE,     /*메시지 처리 상태      */
    v_Rslt_Val       IN RTSD0205.RSLT_VAL%TYPE,       /*전송 결과값           */
    v_Msg_Title      IN RTSD0205.MSG_TITLE%TYPE,      /*메시지 타이틀         */
    v_Telco_Id       IN RTSD0205.TELCO_ID%TYPE,       /*수신 이통사코드       */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_3     IN RTSD0205.ETC_CHAR_3%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_4     IN RTSD0205.ETC_CHAR_4%TYPE,     /*사용자지정 필드       */
    v_Etc_Int_5      IN RTSD0205.ETC_INT_5%TYPE,      /*사용자지정 필드       */
    v_Etc_Int_6      IN RTSD0205.ETC_INT_6%TYPE,      /*사용자지정 필드       */
    v_Job_Day        IN RTSD0205.JOB_DAY%TYPE,        /*작업일자              */
    v_Eai_Tr_Dttm    IN RTSD0205.EAI_TR_DTTM%TYPE,    /*EAI전송시간           */
    v_Eai_Tr_Yn      IN RTSD0205.EAI_TR_YN%TYPE,      /*EAI전송여부           */
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE          /*등록자 ID             */
    );

  /*****************************************************************************
  -- SMS 발송 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0205 (
    v_Cmp_Msg_Id     IN RTSD0205.CMP_MSG_ID%TYPE,     /*메시지 ID             */
    v_Cmp_Msg_Group_Id IN RTSD0205.CMP_MSG_GROUP_ID%TYPE, /*메시지 그룹ID     */
    v_Usr_Id         IN RTSD0205.USR_ID%TYPE,         /*서비스ID              */
    v_Sms_Gb         IN RTSD0205.SMS_GB%TYPE,         /*전송 위치구분         */
    v_Used_Cd        IN RTSD0205.USED_CD%TYPE,        /*메시지 구분           */
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,    /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,  /*예약 전송시간         */
    v_Saved_Fg       IN RTSD0205.SAVED_FG%TYPE,       /*메시지 저장여부       */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,     /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,     /*보내는 전화번호       */
    v_Nat_Cd         IN RTSD0205.NAT_CD%TYPE,         /*국가코드              */
    v_Assign_Cd      IN RTSD0205.ASSIGN_CD%TYPE,      /*특정가입자지정        */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,        /*메시지내용            */
    v_Callback_Url   IN RTSD0205.CALLBACK_URL%TYPE,   /*Callback URL          */
    v_Content_Cnt    IN RTSD0205.CONTENT_CNT%TYPE,    /*첨부된 컨텐츠개수     */
    v_Content_Mime_Type IN RTSD0205.CONTENT_MIME_TYPE%TYPE, /*컨텐츠 MIME TYPE*/
    v_Content_Path   IN RTSD0205.CONTENT_PATH%TYPE,   /*첨부된 컨텐츠PATH     */
    v_Cmp_Snd_Dttm   IN RTSD0205.CMP_SND_DTTM%TYPE,   /*업체 SK 전송한시간    */
    v_Cmp_Rcv_Dttm   IN RTSD0205.CMP_RCV_DTTM%TYPE,   /*업체 결과받은시간     */
    v_Reg_Snd_Dttm   IN RTSD0205.REG_SND_DTTM%TYPE,   /*SK 통신사보낸시간     */
    v_Reg_Rcv_Dttm   IN RTSD0205.REG_RCV_DTTM%TYPE,   /*메시지 받은시간       */
    v_Machine_Id     IN RTSD0205.MACHINE_ID%TYPE,     /*메시지입력경로        */
    v_Sms_Status     IN RTSD0205.SMS_STATUS%TYPE,     /*메시지 처리 상태      */
    v_Rslt_Val       IN RTSD0205.RSLT_VAL%TYPE,       /*전송 결과값           */
    v_Msg_Title      IN RTSD0205.MSG_TITLE%TYPE,      /*메시지 타이틀         */
    v_Telco_Id       IN RTSD0205.TELCO_ID%TYPE,       /*수신 이통사코드       */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_3     IN RTSD0205.ETC_CHAR_3%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_4     IN RTSD0205.ETC_CHAR_4%TYPE,     /*사용자지정 필드       */
    v_Etc_Int_5      IN RTSD0205.ETC_INT_5%TYPE,      /*사용자지정 필드       */
    v_Etc_Int_6      IN RTSD0205.ETC_INT_6%TYPE,      /*사용자지정 필드       */
    v_Job_Day        IN RTSD0205.JOB_DAY%TYPE,        /*작업일자              */
    v_Eai_Tr_Dttm    IN RTSD0205.EAI_TR_DTTM%TYPE,    /*EAI전송시간           */
    v_Eai_Tr_Yn      IN RTSD0205.EAI_TR_YN%TYPE,      /*EAI전송여부           */
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SMS 발송 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0205 (
    v_Cmp_Msg_Id     IN RTSD0205.CMP_MSG_ID%TYPE,     /*메시지 ID             */
    v_Cmp_Msg_Group_Id IN RTSD0205.CMP_MSG_GROUP_ID%TYPE, /*메시지 그룹ID     */
    v_Usr_Id         IN RTSD0205.USR_ID%TYPE,         /*서비스ID              */
    v_Sms_Gb         IN RTSD0205.SMS_GB%TYPE,         /*전송 위치구분         */
    v_Used_Cd        IN RTSD0205.USED_CD%TYPE,        /*메시지 구분           */
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,    /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,  /*예약 전송시간         */
    v_Saved_Fg       IN RTSD0205.SAVED_FG%TYPE,       /*메시지 저장여부       */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,     /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,     /*보내는 전화번호       */
    v_Nat_Cd         IN RTSD0205.NAT_CD%TYPE,         /*국가코드              */
    v_Assign_Cd      IN RTSD0205.ASSIGN_CD%TYPE,      /*특정가입자지정        */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,        /*메시지내용            */
    v_Callback_Url   IN RTSD0205.CALLBACK_URL%TYPE,   /*Callback URL          */
    v_Content_Cnt    IN RTSD0205.CONTENT_CNT%TYPE,    /*첨부된 컨텐츠개수     */
    v_Content_Mime_Type IN RTSD0205.CONTENT_MIME_TYPE%TYPE, /*컨텐츠 MIME TYPE*/
    v_Content_Path   IN RTSD0205.CONTENT_PATH%TYPE,   /*첨부된 컨텐츠PATH     */
    v_Cmp_Snd_Dttm   IN RTSD0205.CMP_SND_DTTM%TYPE,   /*업체 SK 전송한시간    */
    v_Cmp_Rcv_Dttm   IN RTSD0205.CMP_RCV_DTTM%TYPE,   /*업체 결과받은시간     */
    v_Reg_Snd_Dttm   IN RTSD0205.REG_SND_DTTM%TYPE,   /*SK 통신사보낸시간     */
    v_Reg_Rcv_Dttm   IN RTSD0205.REG_RCV_DTTM%TYPE,   /*메시지 받은시간       */
    v_Machine_Id     IN RTSD0205.MACHINE_ID%TYPE,     /*메시지입력경로        */
    v_Sms_Status     IN RTSD0205.SMS_STATUS%TYPE,     /*메시지 처리 상태      */
    v_Rslt_Val       IN RTSD0205.RSLT_VAL%TYPE,       /*전송 결과값           */
    v_Msg_Title      IN RTSD0205.MSG_TITLE%TYPE,      /*메시지 타이틀         */
    v_Telco_Id       IN RTSD0205.TELCO_ID%TYPE,       /*수신 이통사코드       */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_3     IN RTSD0205.ETC_CHAR_3%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_4     IN RTSD0205.ETC_CHAR_4%TYPE,     /*사용자지정 필드       */
    v_Etc_Int_5      IN RTSD0205.ETC_INT_5%TYPE,      /*사용자지정 필드       */
    v_Etc_Int_6      IN RTSD0205.ETC_INT_6%TYPE,      /*사용자지정 필드       */
    v_Job_Day        IN RTSD0205.JOB_DAY%TYPE,        /*작업일자              */
    v_Eai_Tr_Dttm    IN RTSD0205.EAI_TR_DTTM%TYPE,    /*EAI전송시간           */
    v_Eai_Tr_Yn      IN RTSD0205.EAI_TR_YN%TYPE,      /*EAI전송여부           */
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SMS 발송 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0205 (
    v_Cmp_Msg_Id     IN RTSD0205.CMP_MSG_ID%TYPE,     /*메시지 ID             */
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

  /*****************************************************************************
  -- SMS 발송 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0205 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Cmp_Msg_Id     IN OUT RTSD0205.CMP_MSG_ID%TYPE, /*메시지 ID             */
    v_Cmp_Msg_Group_Id IN RTSD0205.CMP_MSG_GROUP_ID%TYPE, /*메시지 그룹ID     */
    v_Usr_Id         IN RTSD0205.USR_ID%TYPE,         /*서비스ID              */
    v_Sms_Gb         IN RTSD0205.SMS_GB%TYPE,         /*전송 위치구분         */
    v_Used_Cd        IN RTSD0205.USED_CD%TYPE,        /*메시지 구분           */
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,    /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,  /*예약 전송시간         */
    v_Saved_Fg       IN RTSD0205.SAVED_FG%TYPE,       /*메시지 저장여부       */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,     /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,     /*보내는 전화번호       */
    v_Nat_Cd         IN RTSD0205.NAT_CD%TYPE,         /*국가코드              */
    v_Assign_Cd      IN RTSD0205.ASSIGN_CD%TYPE,      /*특정가입자지정        */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,        /*메시지내용            */
    v_Callback_Url   IN RTSD0205.CALLBACK_URL%TYPE,   /*Callback URL          */
    v_Content_Cnt    IN RTSD0205.CONTENT_CNT%TYPE,    /*첨부된 컨텐츠개수     */
    v_Content_Mime_Type IN RTSD0205.CONTENT_MIME_TYPE%TYPE, /*컨텐츠 MIME TYPE*/
    v_Content_Path   IN RTSD0205.CONTENT_PATH%TYPE,   /*첨부된 컨텐츠PATH     */
    v_Cmp_Snd_Dttm   IN RTSD0205.CMP_SND_DTTM%TYPE,   /*업체 SK 전송한시간    */
    v_Cmp_Rcv_Dttm   IN RTSD0205.CMP_RCV_DTTM%TYPE,   /*업체 결과받은시간     */
    v_Reg_Snd_Dttm   IN RTSD0205.REG_SND_DTTM%TYPE,   /*SK 통신사보낸시간     */
    v_Reg_Rcv_Dttm   IN RTSD0205.REG_RCV_DTTM%TYPE,   /*메시지 받은시간       */
    v_Machine_Id     IN RTSD0205.MACHINE_ID%TYPE,     /*메시지입력경로        */
    v_Sms_Status     IN RTSD0205.SMS_STATUS%TYPE,     /*메시지 처리 상태      */
    v_Rslt_Val       IN RTSD0205.RSLT_VAL%TYPE,       /*전송 결과값           */
    v_Msg_Title      IN RTSD0205.MSG_TITLE%TYPE,      /*메시지 타이틀         */
    v_Telco_Id       IN RTSD0205.TELCO_ID%TYPE,       /*수신 이통사코드       */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_3     IN RTSD0205.ETC_CHAR_3%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_4     IN RTSD0205.ETC_CHAR_4%TYPE,     /*사용자지정 필드       */
    v_Etc_Int_5      IN RTSD0205.ETC_INT_5%TYPE,      /*사용자지정 필드       */
    v_Etc_Int_6      IN RTSD0205.ETC_INT_6%TYPE,      /*사용자지정 필드       */
    v_Job_Day        IN RTSD0205.JOB_DAY%TYPE,        /*작업일자              */
    v_Eai_Tr_Dttm    IN RTSD0205.EAI_TR_DTTM%TYPE,    /*EAI전송시간           */
    v_Eai_Tr_Yn      IN RTSD0205.EAI_TR_YN%TYPE,      /*EAI전송여부           */
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- SMS 발송 - 메시지 ID (90~) 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0205CmpMsgId9 RETURN VARCHAR;
  
  /*****************************************************************************
  -- SMS 발송 interface
  *****************************************************************************/
     PROCEDURE p_Rtsd0205Interface (
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,    /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,  /*예약 전송시간         */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,     /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,     /*보내는 전화번호       */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,        /*메시지내용            */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,     /*사용자지정 필드       */
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );


  /*****************************************************************************
  -- SMS 발송 interfaceNew - 2019/01/06
  *****************************************************************************/
   PROCEDURE p_Rtsd0205InterfaceNew (
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,    /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,  /*예약 전송시간         */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,     /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,     /*보내는 전화번호       */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,        /*메시지내용            */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_3     IN RTSD0205.ETC_CHAR_3%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_4     IN RTSD0205.ETC_CHAR_4%TYPE,     /*사용자지정 필드       */    
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
  
/*****************************************************************************
  -- SMS 발송 interfaceNew1 - 2021/09/13
  *****************************************************************************/
   PROCEDURE p_Rtsd0205InterfaceNew1 (
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,    /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,  /*예약 전송시간         */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,     /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,     /*보내는 전화번호       */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,        /*메시지내용            */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_3     IN RTSD0205.ETC_CHAR_3%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_4     IN RTSD0205.ETC_CHAR_4%TYPE,     /*사용자지정 필드       */    
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_Cmp_Msg_Id     OUT RTSD0205.CMP_MSG_ID%TYPE,    /*발송번호             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
    
  /*****************************************************************************
  -- SMS 발송 interfaceNew - 2019/01/06
  *****************************************************************************/
   PROCEDURE p_Rtsd0205InterfaceNew_REALTMP (
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,    /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,  /*예약 전송시간         */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,     /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,     /*보내는 전화번호       */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,        /*메시지내용            */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_3     IN RTSD0205.ETC_CHAR_3%TYPE,     /*사용자지정 필드       */
    v_Etc_Char_4     IN RTSD0205.ETC_CHAR_4%TYPE,     /*사용자지정 필드       */    
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );
     
  /*****************************************************************************
  -- SMS 발송 interface - 타이어데이
  *****************************************************************************/
   PROCEDURE p_Rtsd0205triedayJob;
    
/*****************************************************************************
  -- SMS 발송 interface - 타이어데이
  *****************************************************************************/
   PROCEDURE p_Rtsd0205trieday (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ); 

  /*****************************************************************************
  -- SMS 발송 interface - 장착점 도착
  *****************************************************************************/
   PROCEDURE p_Rtsd0205tirearrivalJob;
       
  /*****************************************************************************
  -- SMS 발송 interface - 장착점 도착
  *****************************************************************************/
   PROCEDURE p_Rtsd0205tirearrival (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- SMS 발송 interface - 방문점검
  *****************************************************************************/
   PROCEDURE p_Rtsd0205InspectionVisitJob;
  
  /*****************************************************************************
  -- SMS 발송 interface - 방문점검
  *****************************************************************************/
   PROCEDURE p_Rtsd0205InspectionVisit (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- SMS 발송 interface - 잔여서비스 횟수 안내
  *****************************************************************************/
   PROCEDURE p_Rtsd0205ResidualServicesJob;
    
  /*****************************************************************************
  -- SMS 발송 interface - 잔여서비스 횟수 안내
  *****************************************************************************/
   PROCEDURE p_Rtsd0205ResidualServices (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- SMS 발송 interface - 배송중-대리점발송
  *****************************************************************************/
   PROCEDURE p_Rtsd0205tirearrivalIngJob;
       
  /*****************************************************************************
  -- SMS 발송 interface - 배송중-대리점발송
  *****************************************************************************/
   PROCEDURE p_Rtsd0205tirearrivalIng (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    );

  /*****************************************************************************
  -- SMS 템플릿 조회
  *****************************************************************************/
   PROCEDURE p_Rtsd0205smsTmplCn (
    Ref_Cursor        IN OUT SYS_REFCURSOR,
    v_Tmpl_Cd 		 IN VARCHAR2            			/* 템플릿코드 */
    );

END Pkg_Rtsd0205;
/
