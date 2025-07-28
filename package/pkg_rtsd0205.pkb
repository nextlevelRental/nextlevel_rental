CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0205 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0205
   PURPOSE   SMS 발송 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-20  jemcarry         1. Created this package body.
   1.1        2017-06-01  wjim             [20170601_03] SMS 계정분리에 따른 ID변경
                                           - 1931 > 5331
   1.2        2017-09-08  wjim             [20170906_01] SMS 수정
                                           - 배송중, 배송완료
                                           - 메시지 변경 및 대리점 SMS발송 추가
   1.3        2017-09-27  wjim             [20170927_01] 배송완료 고객발송 SMS 미발송 처리                                            
*******************************************************************************/

  /*****************************************************************************
  -- SMS 발송 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0205Count(
    v_Cmp_Msg_Id     IN RTSD0205.CMP_MSG_ID%TYPE        /*메시지 ID           */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0205
    WHERE   CMP_MSG_ID = v_Cmp_Msg_Id;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0205Count;

  /*****************************************************************************
  -- SMS 발송 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0205 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Cmp_Msg_Id     IN RTSD0205.CMP_MSG_ID%TYPE,                 /*메시지 ID             */
    v_Cmp_Msg_Group_Id IN RTSD0205.CMP_MSG_GROUP_ID%TYPE,         /*메시지 그룹ID     */
    v_Usr_Id         IN RTSD0205.USR_ID%TYPE,                     /*서비스ID              */
    v_Sms_Gb         IN RTSD0205.SMS_GB%TYPE,                     /*전송 위치구분         */
    v_Used_Cd        IN RTSD0205.USED_CD%TYPE,                    /*메시지 구분           */
    v_Reserved_Fg    IN RTSD0205.RESERVED_FG%TYPE,                /*예약 전송여부         */
    v_Reserved_Dttm  IN RTSD0205.RESERVED_DTTM%TYPE,              /*예약 전송시간         */
    v_Saved_Fg       IN RTSD0205.SAVED_FG%TYPE,                   /*메시지 저장여부       */
    v_Rcv_Phn_Id     IN RTSD0205.RCV_PHN_ID%TYPE,                 /*받는 전화번호         */
    v_Snd_Phn_Id     IN RTSD0205.SND_PHN_ID%TYPE,                 /*보내는 전화번호       */
    v_Nat_Cd         IN RTSD0205.NAT_CD%TYPE,                     /*국가코드              */
    v_Assign_Cd      IN RTSD0205.ASSIGN_CD%TYPE,                  /*특정가입자지정        */
    v_Snd_Msg        IN RTSD0205.SND_MSG%TYPE,                    /*메시지내용            */
    v_Callback_Url   IN RTSD0205.CALLBACK_URL%TYPE,               /*Callback URL          */
    v_Content_Cnt    IN RTSD0205.CONTENT_CNT%TYPE,                /*첨부된 컨텐츠개수     */
    v_Content_Mime_Type IN RTSD0205.CONTENT_MIME_TYPE%TYPE,       /*컨텐츠 MIME TYPE*/
    v_Content_Path   IN RTSD0205.CONTENT_PATH%TYPE,               /*첨부된 컨텐츠PATH     */
    v_Cmp_Snd_Dttm   IN RTSD0205.CMP_SND_DTTM%TYPE,               /*업체 SK 전송한시간    */
    v_Cmp_Rcv_Dttm   IN RTSD0205.CMP_RCV_DTTM%TYPE,               /*업체 결과받은시간     */
    v_Reg_Snd_Dttm   IN RTSD0205.REG_SND_DTTM%TYPE,               /*SK 통신사보낸시간     */
    v_Reg_Rcv_Dttm   IN RTSD0205.REG_RCV_DTTM%TYPE,               /*메시지 받은시간       */
    v_Machine_Id     IN RTSD0205.MACHINE_ID%TYPE,                 /*메시지입력경로        */
    v_Sms_Status     IN RTSD0205.SMS_STATUS%TYPE,                 /*메시지 처리 상태      */
    v_Rslt_Val       IN RTSD0205.RSLT_VAL%TYPE,                   /*전송 결과값           */
    v_Msg_Title      IN RTSD0205.MSG_TITLE%TYPE,                  /*메시지 타이틀         */
    v_Telco_Id       IN RTSD0205.TELCO_ID%TYPE,                   /*수신 이통사코드       */
    v_Etc_Char_1     IN RTSD0205.ETC_CHAR_1%TYPE,                 /*사용자지정 필드       */
    v_Etc_Char_2     IN RTSD0205.ETC_CHAR_2%TYPE,                 /*사용자지정 필드       */
    v_Etc_Char_3     IN RTSD0205.ETC_CHAR_3%TYPE,                 /*사용자지정 필드       */
    v_Etc_Char_4     IN RTSD0205.ETC_CHAR_4%TYPE,                 /*사용자지정 필드       */
    v_Etc_Int_5      IN RTSD0205.ETC_INT_5%TYPE,                  /*사용자지정 필드       */
    v_Etc_Int_6      IN RTSD0205.ETC_INT_6%TYPE,                  /*사용자지정 필드       */
    v_Job_Day        IN RTSD0205.JOB_DAY%TYPE,                    /*작업일자              */
    v_Eai_Tr_Dttm    IN RTSD0205.EAI_TR_DTTM%TYPE,                /*EAI전송시간           */
    v_Eai_Tr_Yn      IN RTSD0205.EAI_TR_YN%TYPE,                  /*EAI전송여부           */
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE                      /*등록자 ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CMP_MSG_ID,                /*메시지 ID           */
            A.CMP_MSG_GROUP_ID,          /*메시지 그룹ID       */
            A.USR_ID,                    /*서비스ID            */
            A.SMS_GB,                    /*전송 위치구분       */
            A.USED_CD,                   /*메시지 구분         */
            A.RESERVED_FG,               /*예약 전송여부       */
            A.RESERVED_DTTM,             /*예약 전송시간       */
            A.SAVED_FG,                  /*메시지 저장여부     */
            A.RCV_PHN_ID,                /*받는 전화번호       */
            A.SND_PHN_ID,                /*보내는 전화번호     */
            A.NAT_CD,                    /*국가코드            */
            A.ASSIGN_CD,                 /*특정가입자지정      */
            A.SND_MSG,                   /*메시지내용          */
            A.CALLBACK_URL,              /*Callback URL        */
            A.CONTENT_CNT,               /*첨부된 컨텐츠개수   */
            A.CONTENT_MIME_TYPE,         /*컨텐츠 MIME TYPE    */
            A.CONTENT_PATH,              /*첨부된 컨텐츠PATH   */
            A.CMP_SND_DTTM,              /*업체 SK 전송한시간  */
            A.CMP_RCV_DTTM,              /*업체 결과받은시간   */
            A.REG_SND_DTTM,              /*SK 통신사보낸시간   */
            A.REG_RCV_DTTM,              /*메시지 받은시간     */
            A.MACHINE_ID,                /*메시지입력경로      */
            A.SMS_STATUS,                /*메시지 처리 상태    */
            A.RSLT_VAL,                  /*전송 결과값         */
            A.MSG_TITLE,                 /*메시지 타이틀       */
            A.TELCO_ID,                  /*수신 이통사코드     */
            A.ETC_CHAR_1,                /*사용자지정 필드     */
            A.ETC_CHAR_2,                /*사용자지정 필드     */
            A.ETC_CHAR_3,                /*사용자지정 필드     */
            A.ETC_CHAR_4,                /*사용자지정 필드     */
            A.ETC_INT_5,                 /*사용자지정 필드     */
            A.ETC_INT_6,                 /*사용자지정 필드     */
            A.JOB_DAY,                   /*작업일자            */
            A.EAI_TR_DTTM,               /*EAI전송시간         */
            A.EAI_TR_YN,                 /*EAI전송여부         */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT                     /*변경일              */
    FROM    RTSD0205 A
    WHERE   A.CMP_MSG_ID       = DECODE(v_Cmp_Msg_Id     , NULL, A.CMP_MSG_ID      , v_Cmp_Msg_Id)
    AND     A.CMP_MSG_GROUP_ID = DECODE(v_Cmp_Msg_Group_Id, NULL, A.CMP_MSG_GROUP_ID, v_Cmp_Msg_Group_Id)
    AND     A.USR_ID           = DECODE(v_Usr_Id         , NULL, A.USR_ID          , v_Usr_Id)
    AND     A.SMS_GB           = DECODE(v_Sms_Gb         , NULL, A.SMS_GB          , v_Sms_Gb)
    AND     A.USED_CD          = DECODE(v_Used_Cd        , NULL, A.USED_CD         , v_Used_Cd)
    AND     A.RESERVED_FG      = DECODE(v_Reserved_Fg    , NULL, A.RESERVED_FG     , v_Reserved_Fg)
    AND     A.RESERVED_DTTM    = DECODE(v_Reserved_Dttm  , NULL, A.RESERVED_DTTM   , v_Reserved_Dttm)
    AND     A.SAVED_FG         = DECODE(v_Saved_Fg       , NULL, A.SAVED_FG        , v_Saved_Fg)
    AND     A.RCV_PHN_ID       = DECODE(v_Rcv_Phn_Id     , NULL, A.RCV_PHN_ID      , v_Rcv_Phn_Id)
    AND     A.SND_PHN_ID       = DECODE(v_Snd_Phn_Id     , NULL, A.SND_PHN_ID      , v_Snd_Phn_Id)
    AND     A.NAT_CD           = DECODE(v_Nat_Cd         , NULL, A.NAT_CD          , v_Nat_Cd)
    AND     A.ASSIGN_CD        = DECODE(v_Assign_Cd      , NULL, A.ASSIGN_CD       , v_Assign_Cd)
    AND     A.SND_MSG          = DECODE(v_Snd_Msg        , NULL, A.SND_MSG         , v_Snd_Msg)
    AND     A.CALLBACK_URL     = DECODE(v_Callback_Url   , NULL, A.CALLBACK_URL    , v_Callback_Url)
    AND     A.CONTENT_CNT      = DECODE(v_Content_Cnt    , NULL, A.CONTENT_CNT     , v_Content_Cnt)
    AND     A.CONTENT_MIME_TYPE = DECODE(v_Content_Mime_Type, NULL, A.CONTENT_MIME_TYPE, v_Content_Mime_Type)
    AND     A.CONTENT_PATH     = DECODE(v_Content_Path   , NULL, A.CONTENT_PATH    , v_Content_Path)
    AND     A.CMP_SND_DTTM     = DECODE(v_Cmp_Snd_Dttm   , NULL, A.CMP_SND_DTTM    , v_Cmp_Snd_Dttm)
    AND     A.CMP_RCV_DTTM     = DECODE(v_Cmp_Rcv_Dttm   , NULL, A.CMP_RCV_DTTM    , v_Cmp_Rcv_Dttm)
    AND     A.REG_SND_DTTM     = DECODE(v_Reg_Snd_Dttm   , NULL, A.REG_SND_DTTM    , v_Reg_Snd_Dttm)
    AND     A.REG_RCV_DTTM     = DECODE(v_Reg_Rcv_Dttm   , NULL, A.REG_RCV_DTTM    , v_Reg_Rcv_Dttm)
    AND     A.MACHINE_ID       = DECODE(v_Machine_Id     , NULL, A.MACHINE_ID      , v_Machine_Id)
    AND     A.SMS_STATUS       = DECODE(v_Sms_Status     , NULL, A.SMS_STATUS      , v_Sms_Status)
    AND     A.RSLT_VAL         = DECODE(v_Rslt_Val       , NULL, A.RSLT_VAL        , v_Rslt_Val)
    AND     A.MSG_TITLE        = DECODE(v_Msg_Title      , NULL, A.MSG_TITLE       , v_Msg_Title)
    AND     A.TELCO_ID         = DECODE(v_Telco_Id       , NULL, A.TELCO_ID        , v_Telco_Id)
    AND     A.ETC_CHAR_1       = DECODE(v_Etc_Char_1     , NULL, A.ETC_CHAR_1      , v_Etc_Char_1)
    AND     A.ETC_CHAR_2       = DECODE(v_Etc_Char_2     , NULL, A.ETC_CHAR_2      , v_Etc_Char_2)
    AND     A.ETC_CHAR_3       = DECODE(v_Etc_Char_3     , NULL, A.ETC_CHAR_3      , v_Etc_Char_3)
    AND     A.ETC_CHAR_4       = DECODE(v_Etc_Char_4     , NULL, A.ETC_CHAR_4      , v_Etc_Char_4)
    AND     A.ETC_INT_5        = DECODE(v_Etc_Int_5      , NULL, A.ETC_INT_5       , v_Etc_Int_5)
    AND     A.ETC_INT_6        = DECODE(v_Etc_Int_6      , NULL, A.ETC_INT_6       , v_Etc_Int_6)
    AND     A.JOB_DAY          = DECODE(v_Job_Day        , NULL, A.JOB_DAY         , v_Job_Day)
    AND     A.EAI_TR_DTTM      = DECODE(v_Eai_Tr_Dttm    , NULL, A.EAI_TR_DTTM     , v_Eai_Tr_Dttm)
    AND     A.EAI_TR_YN        = DECODE(v_Eai_Tr_Yn      , NULL, A.EAI_TR_YN       , v_Eai_Tr_Yn)
    AND     A.REG_ID           = DECODE(v_Reg_Id         , NULL, A.REG_ID          , v_Reg_Id);

  END p_sRtsd0205;

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
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0205 (
            CMP_MSG_ID,
            CMP_MSG_GROUP_ID,
            USR_ID,
            SMS_GB,
            USED_CD,
            RESERVED_FG,
            RESERVED_DTTM,
            SAVED_FG,
            RCV_PHN_ID,
            SND_PHN_ID,
            NAT_CD,
            ASSIGN_CD,
            SND_MSG,
            CALLBACK_URL,
            CONTENT_CNT,
            CONTENT_MIME_TYPE,
            CONTENT_PATH,
            CMP_SND_DTTM,
            CMP_RCV_DTTM,
            REG_SND_DTTM,
            REG_RCV_DTTM,
            MACHINE_ID,
            SMS_STATUS,
            RSLT_VAL,
            MSG_TITLE,
            TELCO_ID,
            ETC_CHAR_1,
            ETC_CHAR_2,
            ETC_CHAR_3,
            ETC_CHAR_4,
            ETC_INT_5,
            ETC_INT_6,
            JOB_DAY,
            EAI_TR_DTTM,
            EAI_TR_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Cmp_Msg_Id,
            v_Cmp_Msg_Group_Id,
            v_Usr_Id,
            v_Sms_Gb,
            v_Used_Cd,
            v_Reserved_Fg,
            v_Reserved_Dttm,
            v_Saved_Fg,
            v_Rcv_Phn_Id,
            v_Snd_Phn_Id,
            v_Nat_Cd,
            v_Assign_Cd,
            v_Snd_Msg,
            v_Callback_Url,
            v_Content_Cnt,
            v_Content_Mime_Type,
            v_Content_Path,
            v_Cmp_Snd_Dttm,
            v_Cmp_Rcv_Dttm,
            v_Reg_Snd_Dttm,
            v_Reg_Rcv_Dttm,
            v_Machine_Id,
            v_Sms_Status,
            v_Rslt_Val,
            v_Msg_Title,
            v_Telco_Id,
            v_Etc_Char_1,
            v_Etc_Char_2,
            v_Etc_Char_3,
            v_Etc_Char_4,
            v_Etc_Int_5,
            v_Etc_Int_6,
            v_Job_Day,
            v_Eai_Tr_Dttm,
            v_Eai_Tr_Yn,
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

  END f_InsertRtsd0205;

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
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0205
    SET    CMP_MSG_GROUP_ID = v_Cmp_Msg_Group_Id,
           USR_ID           = v_Usr_Id,
           SMS_GB           = v_Sms_Gb,
           USED_CD          = v_Used_Cd,
           RESERVED_FG      = v_Reserved_Fg,
           RESERVED_DTTM    = v_Reserved_Dttm,
           SAVED_FG         = v_Saved_Fg,
           RCV_PHN_ID       = v_Rcv_Phn_Id,
           SND_PHN_ID       = v_Snd_Phn_Id,
           NAT_CD           = v_Nat_Cd,
           ASSIGN_CD        = v_Assign_Cd,
           SND_MSG          = v_Snd_Msg,
           CALLBACK_URL     = v_Callback_Url,
           CONTENT_CNT      = v_Content_Cnt,
           CONTENT_MIME_TYPE = v_Content_Mime_Type,
           CONTENT_PATH     = v_Content_Path,
           CMP_SND_DTTM     = v_Cmp_Snd_Dttm,
           CMP_RCV_DTTM     = v_Cmp_Rcv_Dttm,
           REG_SND_DTTM     = v_Reg_Snd_Dttm,
           REG_RCV_DTTM     = v_Reg_Rcv_Dttm,
           MACHINE_ID       = v_Machine_Id,
           SMS_STATUS       = v_Sms_Status,
           RSLT_VAL         = v_Rslt_Val,
           MSG_TITLE        = v_Msg_Title,
           TELCO_ID         = v_Telco_Id,
           ETC_CHAR_1       = v_Etc_Char_1,
           ETC_CHAR_2       = v_Etc_Char_2,
           ETC_CHAR_3       = v_Etc_Char_3,
           ETC_CHAR_4       = v_Etc_Char_4,
           ETC_INT_5        = v_Etc_Int_5,
           ETC_INT_6        = v_Etc_Int_6,
           JOB_DAY          = v_Job_Day,
           EAI_TR_DTTM      = v_Eai_Tr_Dttm,
           EAI_TR_YN        = v_Eai_Tr_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  CMP_MSG_ID       = v_Cmp_Msg_Id;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0205;

  /*****************************************************************************
  -- SMS 발송 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0205 (
    v_Cmp_Msg_Id     IN RTSD0205.CMP_MSG_ID%TYPE,     /*메시지 ID             */
    v_Reg_Id         IN RTSD0205.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    DELETE RTSD0205
    WHERE  CMP_MSG_ID = v_Cmp_Msg_Id;

    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.f_DeleteRtsd0205(1)', '메시지 ID', v_Cmp_Msg_Id);
    Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.f_DeleteRtsd0205(1)', '등록자 ID', v_Reg_Id);

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0205;

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
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- 필수값: 등록자 ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF v_Comm_Dvsn = 'I' THEN

        IF 0 != f_sRtsd0205Count(v_Cmp_Msg_Id) THEN
            v_Return_Message := '해당 메시지 ID('||v_Cmp_Msg_Id||')는 이미 등록된 ID이므로 신규등록 처리가 불가합니다.';
            RAISE e_Error;
        END IF;


        v_Cmp_Msg_Id := f_sRtsd0205CmpMsgId9();

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, v_Cmp_Msg_Group_Id, v_Usr_Id,
                                  v_Sms_Gb, v_Used_Cd, v_Reserved_Fg, v_Reserved_Dttm,
                                  v_Saved_Fg, v_Rcv_Phn_Id, v_Snd_Phn_Id, v_Nat_Cd,
                                  v_Assign_Cd, v_Snd_Msg, v_Callback_Url, v_Content_Cnt,
                                  v_Content_Mime_Type, v_Content_Path, v_Cmp_Snd_Dttm,
                                  v_Cmp_Rcv_Dttm, v_Reg_Snd_Dttm, v_Reg_Rcv_Dttm, v_Machine_Id,
                                  v_Sms_Status, v_Rslt_Val, v_Msg_Title, v_Telco_Id,
                                  v_Etc_Char_1, v_Etc_Char_2, v_Etc_Char_3, v_Etc_Char_4,
                                  v_Etc_Int_5, v_Etc_Int_6, v_Job_Day, v_Eai_Tr_Dttm,
                                  v_Eai_Tr_Yn, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'SMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
            RAISE e_Error;

        END IF;
    ELSE
        IF 0 = f_sRtsd0205Count(v_Cmp_Msg_Id) THEN
            v_Return_Message := '해당 메시지 ID('||v_Cmp_Msg_Id||')는 등록된 ID가 아니므로 수정/삭제가 처리가 불가합니다.';
            RAISE e_Error;
        END IF;

        IF v_Comm_Dvsn = 'U' THEN
            IF 0 != f_UpdateRtsd0205( v_Cmp_Msg_Id, v_Cmp_Msg_Group_Id, v_Usr_Id,
                                      v_Sms_Gb, v_Used_Cd, v_Reserved_Fg, v_Reserved_Dttm,
                                      v_Saved_Fg, v_Rcv_Phn_Id, v_Snd_Phn_Id, v_Nat_Cd,
                                      v_Assign_Cd, v_Snd_Msg, v_Callback_Url, v_Content_Cnt,
                                      v_Content_Mime_Type, v_Content_Path, v_Cmp_Snd_Dttm,
                                      v_Cmp_Rcv_Dttm, v_Reg_Snd_Dttm, v_Reg_Rcv_Dttm, v_Machine_Id,
                                      v_Sms_Status, v_Rslt_Val, v_Msg_Title, v_Telco_Id,
                                      v_Etc_Char_1, v_Etc_Char_2, v_Etc_Char_3, v_Etc_Char_4,
                                      v_Etc_Int_5, v_Etc_Int_6, v_Job_Day, v_Eai_Tr_Dttm,
                                      v_Eai_Tr_Yn, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'SMS 발송 정보 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
            IF 0 != f_DeleteRtsd0205(v_Cmp_Msg_Id, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'SMS 발송 정보 삭제 실패!!!'||'-'||v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_IUDRtsd0205(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_IUDRtsd0205(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0205;

  /*****************************************************************************
  -- SMS 발송 - 메시지 ID (90~) 획득
  *****************************************************************************/
  FUNCTION f_sRtsd0205CmpMsgId9 RETURN VARCHAR IS
    v_Cmp_Msg_Id RTSD0205.CMP_MSG_ID%TYPE DEFAULT NULL;  /*메시지 ID          */
  BEGIN

    SELECT  '9' ||LPAD(SEQ_RTSD0205CMP_MSG_ID.NEXTVAL, 16,'0')
    INTO    v_Cmp_Msg_Id
    FROM    DUAL;

    RETURN v_Cmp_Msg_Id;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtsd0205CmpMsgId9;

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
    ) IS

    v_Cmp_Msg_Id NUMBER(20);
    v_Msglen     NUMBER(20);
    v_Rdttm      RTSD0205.RESERVED_DTTM%TYPE;

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 예약 전송여부, 예약 전송시간,받는 전화번호,메시지내용,  등록자 ID
    IF (TRIM(v_Reserved_Fg) IS NULL) OR (v_Reserved_Fg NOT IN ('I','R')) THEN
        v_Return_Message := '예약 전송여부(I,R)('||v_Reserved_Fg||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- I: 즉시발송, R:예약발송
    IF TRIM(v_Reserved_Fg) = 'R' THEN

        IF 0 != ISDATE(v_Reserved_Dttm) THEN
            v_Return_Message := '예약 전송시간('||v_Reserved_Dttm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    IF TRIM(v_Rcv_Phn_Id) IS NULL THEN
        v_Return_Message := '받는 전화번호('||v_Rcv_Phn_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Snd_Msg) IS NULL THEN
        v_Return_Message := '메시지내용('||v_Snd_Msg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    SELECT  LENGTHB(CONVERT(v_Snd_Msg,'KO16KSC5601','AL32UTF8'))
    INTO    v_Msglen
    FROM    DUAL;

    IF v_Msglen > 2000 THEN
        v_Return_Message := '메시지내용('||v_Snd_Msg||') 최대 길이 2,000 Byte를 초과('||NVL(v_Msglen,0)||')하여 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- I: 즉시발송, R:예약발송
    IF v_Reserved_Fg = 'I' THEN
        v_Rdttm:= TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS');
    ELSE
        v_Rdttm := v_Reserved_Dttm;
    END IF;

    v_Cmp_Msg_Id := f_sRtsd0205CmpMsgId9();

    -- 80 BYTE 기준 SMS 또는 LMS로 분리 발송
    IF v_Msglen <= 80 THEN

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, '1', '5331',
                              '1', '00', v_Reserved_Fg, v_Rdttm,
                              '0', v_Rcv_Phn_Id, v_Snd_Phn_Id, '',
                              '00000', v_Snd_Msg, '', 0,
                              '', '', '',
                              '', '', '', '',
                              '0', '', '', '',
                              v_Etc_Char_1, v_Etc_Char_2, '', '',
                              '', '', TO_CHAR(SYSDATE,'YYYYMMDD'), NULL,
                              'N', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'SMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, '1', '5331',
                              '1', '10', v_Reserved_Fg, v_Rdttm,
                              '0', v_Rcv_Phn_Id, v_Snd_Phn_Id, '',
                              '00000', v_Snd_Msg, '', 1,
                              'text/plain', '', '',
                              '', '', '', '',
                              '0', '', '', '',
                              v_Etc_Char_1, v_Etc_Char_2, '', '',
                              '', '', TO_CHAR(SYSDATE,'YYYYMMDD'), NULL,
                              'N', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'LMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205Interface(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205Interface(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205Interface;

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
    ) IS

    v_Cmp_Msg_Id NUMBER(20);
    v_Msglen     NUMBER(20);
    v_Rdttm      RTSD0205.RESERVED_DTTM%TYPE;

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 예약 전송여부, 예약 전송시간,받는 전화번호,메시지내용,  등록자 ID
    IF (TRIM(v_Reserved_Fg) IS NULL) OR (v_Reserved_Fg NOT IN ('I','R')) THEN
        v_Return_Message := '예약 전송여부(I,R)('||v_Reserved_Fg||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- I: 즉시발송, R:예약발송
    IF TRIM(v_Reserved_Fg) = 'R' THEN

        IF 0 != ISDATE(v_Reserved_Dttm) THEN
            v_Return_Message := '예약 전송시간('||v_Reserved_Dttm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    IF TRIM(v_Rcv_Phn_Id) IS NULL THEN
        v_Return_Message := '받는 전화번호('||v_Rcv_Phn_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Snd_Msg) IS NULL THEN
        v_Return_Message := '메시지내용('||v_Snd_Msg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

--    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    SELECT  LENGTHB(CONVERT(v_Snd_Msg,'KO16KSC5601','AL32UTF8'))
    INTO    v_Msglen
    FROM    DUAL;

    IF v_Msglen > 2000 THEN
        v_Return_Message := '메시지내용('||v_Snd_Msg||') 최대 길이 2,000 Byte를 초과('||NVL(v_Msglen,0)||')하여 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- I: 즉시발송, R:예약발송
    IF v_Reserved_Fg = 'I' THEN
        v_Rdttm:= TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS');
    ELSE
        v_Rdttm := v_Reserved_Dttm;
    END IF;

    v_Cmp_Msg_Id := f_sRtsd0205CmpMsgId9();

    -- 80 BYTE 기준 SMS 또는 LMS로 분리 발송
    IF v_Msglen <= 80 THEN

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, '1', '5331',
                              '1', '00', v_Reserved_Fg, v_Rdttm,
                              '0', v_Rcv_Phn_Id, v_Snd_Phn_Id, '',
                              '00000', v_Snd_Msg, '', 0,
                              '', '', '',
                              '', '', '', '',
                              '0', '', '', '',
                              v_Etc_Char_1, v_Etc_Char_2, v_Etc_Char_3, v_Etc_Char_4,
                              '', '', TO_CHAR(SYSDATE,'YYYYMMDD'), NULL,
                              'N', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'SMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, '1', '5331',
                              '1', '10', v_Reserved_Fg, v_Rdttm,
                              '0', v_Rcv_Phn_Id, v_Snd_Phn_Id, '',
                              '00000', v_Snd_Msg, '', 1,
                              'text/plain', '', '',
                              '', '', '', '',
                              '0', '', '', '',
                              v_Etc_Char_1, v_Etc_Char_2, v_Etc_Char_3, v_Etc_Char_4,
                              '', '', TO_CHAR(SYSDATE,'YYYYMMDD'), NULL,
                              'N', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'LMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205Interface(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205Interface(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205InterfaceNew;
  
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
    ) IS

    v_Msglen     NUMBER(20);
    v_Rdttm      RTSD0205.RESERVED_DTTM%TYPE;

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 예약 전송여부, 예약 전송시간,받는 전화번호,메시지내용,  등록자 ID
    IF (TRIM(v_Reserved_Fg) IS NULL) OR (v_Reserved_Fg NOT IN ('I','R')) THEN
        v_Return_Message := '예약 전송여부(I,R)('||v_Reserved_Fg||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- I: 즉시발송, R:예약발송
    IF TRIM(v_Reserved_Fg) = 'R' THEN

        IF 0 != ISDATE(v_Reserved_Dttm) THEN
            v_Return_Message := '예약 전송시간('||v_Reserved_Dttm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    IF TRIM(v_Rcv_Phn_Id) IS NULL THEN
        v_Return_Message := '받는 전화번호('||v_Rcv_Phn_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Snd_Msg) IS NULL THEN
        v_Return_Message := '메시지내용('||v_Snd_Msg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

--    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    SELECT  LENGTHB(CONVERT(v_Snd_Msg,'KO16KSC5601','AL32UTF8'))
    INTO    v_Msglen
    FROM    DUAL;

    IF v_Msglen > 2000 THEN
        v_Return_Message := '메시지내용('||v_Snd_Msg||') 최대 길이 2,000 Byte를 초과('||NVL(v_Msglen,0)||')하여 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- I: 즉시발송, R:예약발송
    IF v_Reserved_Fg = 'I' THEN
        v_Rdttm:= TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS');
    ELSE
        v_Rdttm := v_Reserved_Dttm;
    END IF;

    v_Cmp_Msg_Id := f_sRtsd0205CmpMsgId9();

    -- 80 BYTE 기준 SMS 또는 LMS로 분리 발송
    IF v_Msglen <= 80 THEN

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, '1', '5331',
                              '1', '00', v_Reserved_Fg, v_Rdttm,
                              '0', v_Rcv_Phn_Id, v_Snd_Phn_Id, '',
                              '00000', v_Snd_Msg, '', 0,
                              '', '', '',
                              '', '', '', '',
                              '0', '', '', '',
                              v_Etc_Char_1, v_Etc_Char_2, v_Etc_Char_3, v_Etc_Char_4,
                              '', '', TO_CHAR(SYSDATE,'YYYYMMDD'), NULL,
                              'N', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'SMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, '1', '5331',
                              '1', '10', v_Reserved_Fg, v_Rdttm,
                              '0', v_Rcv_Phn_Id, v_Snd_Phn_Id, '',
                              '00000', v_Snd_Msg, '', 1,
                              'text/plain', '', '',
                              '', '', '', '',
                              '0', '', '', '',
                              v_Etc_Char_1, v_Etc_Char_2, v_Etc_Char_3, v_Etc_Char_4,
                              '', '', TO_CHAR(SYSDATE,'YYYYMMDD'), NULL,
                              'N', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'LMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205Interface(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205Interface(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205InterfaceNew1;
  
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
    ) IS

    v_Cmp_Msg_Id NUMBER(20);
    v_Msglen     NUMBER(20);
    v_Rdttm      RTSD0205.RESERVED_DTTM%TYPE;

    e_Error EXCEPTION;

  BEGIN

    -- 필수값: 예약 전송여부, 예약 전송시간,받는 전화번호,메시지내용,  등록자 ID
    IF (TRIM(v_Reserved_Fg) IS NULL) OR (v_Reserved_Fg NOT IN ('I','R')) THEN
        v_Return_Message := '예약 전송여부(I,R)('||v_Reserved_Fg||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- I: 즉시발송, R:예약발송
    IF TRIM(v_Reserved_Fg) = 'R' THEN

        IF 0 != ISDATE(v_Reserved_Dttm) THEN
            v_Return_Message := '예약 전송시간('||v_Reserved_Dttm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

    END IF;

    IF TRIM(v_Rcv_Phn_Id) IS NULL THEN
        v_Return_Message := '받는 전화번호('||v_Rcv_Phn_Id||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Snd_Msg) IS NULL THEN
        v_Return_Message := '메시지내용('||v_Snd_Msg||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

--    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
    IF TRIM(v_Reg_Id) IS NULL THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;


    SELECT  LENGTHB(CONVERT(v_Snd_Msg,'KO16KSC5601','AL32UTF8'))
    INTO    v_Msglen
    FROM    DUAL;

    IF v_Msglen > 2000 THEN
        v_Return_Message := '메시지내용('||v_Snd_Msg||') 최대 길이 2,000 Byte를 초과('||NVL(v_Msglen,0)||')하여 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    -- I: 즉시발송, R:예약발송
    IF v_Reserved_Fg = 'I' THEN
        v_Rdttm:= TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS');
    ELSE
        v_Rdttm := v_Reserved_Dttm;
    END IF;

    v_Cmp_Msg_Id := f_sRtsd0205CmpMsgId9();

    -- 80 BYTE 기준 SMS 또는 LMS로 분리 발송
    IF v_Msglen <= 80 THEN

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, '1', '5331',
                              '1', '00', v_Reserved_Fg, v_Rdttm,
                              '0', v_Rcv_Phn_Id, v_Snd_Phn_Id, '',
                              '00000', v_Snd_Msg, '', 0,
                              '', '', '',
                              '', '', '', '',
                              '0', '', '', '',
                              v_Etc_Char_1, v_Etc_Char_2, v_Etc_Char_3, v_Etc_Char_4,
                              '', '', TO_CHAR(SYSDATE,'YYYYMMDD'), NULL,
                              'N', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'SMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF 0 != f_InsertRtsd0205( v_Cmp_Msg_Id, '1', '5331',
                              '1', '10', v_Reserved_Fg, v_Rdttm,
                              '0', v_Rcv_Phn_Id, v_Snd_Phn_Id, '',
                              '00000', v_Snd_Msg, '', 1,
                              'text/plain', '', '',
                              '', '', '', '',
                              '0', '', '', '',
                              v_Etc_Char_1, v_Etc_Char_2, v_Etc_Char_3, v_Etc_Char_4,
                              '', '', TO_CHAR(SYSDATE,'YYYYMMDD'), NULL,
                              'N', v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'LMS 발송 정보 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205Interface(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205Interface(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205InterfaceNew_REALTMP;

  /*****************************************************************************
  -- SMS 발송 interface - 타이어데이
  *****************************************************************************/
   PROCEDURE p_Rtsd0205triedayJob IS

    v_Success_Code   NUMBER;
    v_Return_Message VARCHAR2(2000);
    v_ErrorText      VARCHAR2(2000);
  BEGIN
    p_Rtsd0205trieday (v_Success_Code, v_Return_Message, v_ErrorText);


    IF 0 != v_Success_Code THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205triedayJob(3)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205triedayJob(3)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205triedayJob(3)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205triedayJob(3)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205triedayJob(3)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205triedayJob(3)', 'v_ErrorText',      v_ErrorText);
    END IF;


  END p_Rtsd0205triedayJob;

  /*****************************************************************************
  -- SMS 발송 interface - 타이어데이
  *****************************************************************************/
   PROCEDURE p_Rtsd0205trieday (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Snd_Msg    VARCHAR2(200);
    v_Snd_Msg1   VARCHAR2(200);
    e_Error EXCEPTION;

  BEGIN

    v_Snd_Msg  := ' 고객님 8~15일 넥센타이어 데이에 방문하셔서 무상점검 받으세요. 엔진오일 서비스는 렌탈료 3개월 납입 후부터 가능하십니다.';
    v_Snd_Msg1 := ' 고객님 8~15일 넥센타이어 데이에 방문하셔서 무상점검 받으세요. ';
    
    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            CASE WHEN (SELECT LENGTHB(CONVERT(B.CUST_NM || CASE WHEN A.ord_day < '20160101' THEN v_Snd_Msg ELSE v_Snd_Msg1 END,'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN '00'  ELSE '10'
            END,                                                                /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            B.MOB_NO,                                                           /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
            B.CUST_NM || CASE WHEN A.ord_day < '20160101' THEN v_Snd_Msg ELSE v_Snd_Msg1 END,                                             /*메시지내용            */
            '',                                                                 /*Callback URL          */
            CASE WHEN (SELECT LENGTHB(CONVERT(B.CUST_NM || CASE WHEN A.ord_day < '20160101' THEN v_Snd_Msg ELSE v_Snd_Msg1 END,'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN '0' ELSE '1'
            END,                                                                /*첨부된 컨텐츠개수     */
            CASE WHEN (SELECT LENGTHB(CONVERT(B.CUST_NM || CASE WHEN A.ord_day < '20160101' THEN v_Snd_Msg ELSE v_Snd_Msg1 END,'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN ''  ELSE 'text/plain'
            END,                                                                /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S002',                                                             /*사용자지정 필드       */
            B.CUST_NO,                                                          /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'admin',                                                            /*등록자 ID             */
            SYSDATE,
            'admin',
            SYSDATE
    FROM    RTSD0108 A,
            RTSD0100 B
    WHERE   A.MFP_YN  = 'N'   -- 중도완납여부
    AND     ( A.OS_YN  = 'N' AND A.OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD') ) -- 소유권이전여부
    AND     A.STAT_CD = '04'  -- 계약상태 (장착)
    AND     A.CUST_NO = B.CUST_NO
    GROUP   BY B.CUST_NO, B.CUST_NM, B.MOB_NO;


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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205trieday(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205trieday(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205trieday;

  /*****************************************************************************
  -- SMS 발송 interface - 장착점 도착
  *****************************************************************************/
   PROCEDURE p_Rtsd0205tirearrivalJob IS

    v_Success_Code   NUMBER;
    v_Return_Message VARCHAR2(2000);
    v_ErrorText      VARCHAR2(2000);
  BEGIN
    p_Rtsd0205tirearrival (v_Success_Code, v_Return_Message, v_ErrorText);


    IF 0 != v_Success_Code THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_ErrorText',      v_ErrorText);
    END IF;


  END p_Rtsd0205tirearrivalJob;

  /*****************************************************************************
  -- SMS 발송 interface - 장착점 도착
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-09-08  wjim             [20170906_01] SMS 변경
                                           - 메시지 내용 수정 및 발송대상(대리점) 추가
                                           - 일반주문과 걱정제로 구분 발송
   1.3        2017-09-27  wjim             [20170927_01] 배송완료 고객발송 SMS 미발송 처리           
                                           - RE23택배, 타권역(방문)택배의 경우 택배요청 시 Good Issue 하여
                                             대리점에 실타이어 미도착했는데 고객SMS 발송되어 고객 클레임 발생                                 
  *****************************************************************************/
   PROCEDURE p_Rtsd0205tirearrival (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Snd_Msg_1    VARCHAR2(200);
    v_Snd_Msg_2    VARCHAR2(200);
    v_Snd_Msg_3    VARCHAR2(200);

    e_Error EXCEPTION;

  BEGIN

    DELETE FROM RTTEMP03;
    
    INSERT INTO RTTEMP03 (ORD_NO, CUST_NM, MOB_NO, VBELN, PROC_DAY, AGENCY_CD, ORD_DIV, AGENCY_NM, CITY, STREET, AGENCY_TEL_NO, AGENCY_MOB_NO, MAT_NM, KWMENG)
    SELECT  B.ORD_NO,
            C.CUST_NM,
            C.MOB_NO,
            A.VBELN,
            B.PROC_DAY,
            B.AGENCY_CD,
            'A',
            D.AGENCY_NM,
            D.CITY,
            D.STREET,
            D.TEL_NO,
            D.MOB_NO,
            F.PETTERN_CD||' '||F.SECTION_WIDTH||'/'||F.ASPECT_RATIO||'R'||F.WHEEL_INCHES,
            TO_CHAR(TO_NUMBER(E.CNT_CD))
    FROM    RTSD0116 A,
            RTSD0104 B,
            RTSD0100 C,
            RTSD0007 D,
            RTSD0106 E,
            RTSD0005 F   
    WHERE   A.GI_DAY  BETWEEN TO_CHAR(SYSDATE -8, 'YYYYMMDD') AND  TO_CHAR(SYSDATE - 1, 'YYYYMMDD') /* 대상:배송완료일이 전일 */
    AND     A.SMS_YN  = 'N'
    AND     B.STAT_CD = '01'
    AND     B.CHAN_CD NOT IN ('01','05')   /* 대리점과 타이어뱅크는 제외, 온라인,방판,오픈몰이 대상임 [20210907_01] consignment로 전환 후 대리점에도 문자발송 포함*/
    AND     A.ORD_NO  = B.ORD_NO
    AND     B.CUST_NO = C.CUST_NO
    AND     B.CUST_NO = C.CUST_NO 
    AND     A.NUM IS NULL                  /* 걱정제로 관련 추가 2016.03.01 오픈 현재줄부터 아래*/
    AND     B.AGENCY_CD = D.AGENCY_CD(+)
    AND     B.ORD_NO = E.ORD_NO
    AND     E.MAT_CD = F.MAT_CD(+)
    UNION ALL
    SELECT  B.ORD_NO,
            C.CUST_NM,
            C.MOB_NO,
            A.VBELN,
            B.SERVRQ_DAY,
            B.AGENCY_CD,
            'B',
            D.AGENCY_NM,
            D.CITY,
            D.STREET,
            D.TEL_NO,
            D.MOB_NO,
            E.PETTERN_CD||' '||E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES,
            B.KWMENG
    FROM    RTSD0116 A,
            RTCS0010 B,
            RTSD0100 C,
            RTSD0007 D,
            RTSD0005 E 
    WHERE   A.GI_DAY  BETWEEN TO_CHAR(SYSDATE -8, 'YYYYMMDD') AND  TO_CHAR(SYSDATE - 1, 'YYYYMMDD') /* 대상:배송완료일이 전일 */
    AND     A.SMS_YN  = 'N'
    AND     A.NUM IS NOT NULL    
    AND     B.DLV_STAT IN ('03','02')   --선처리는 고객문자 발송은 제외한다
    AND     A.ORD_NO  = B.ORD_NO
    AND     B.CUST_NO = C.CUST_NO
    AND     B.AGENCY_CD = D.AGENCY_CD(+)
    AND     B.MATNR     = E.MAT_CD(+)
    UNION ALL
    SELECT  B.ORD_NO,
            C.CUST_NM,
            C.MOB_NO,
            A.VBELN,
            B.SERVRQ_DAY,
            B.AGENCY_CD,
            'C',
            D.AGENCY_NM,
            D.CITY,
            D.STREET,
            D.TEL_NO,
            D.MOB_NO,
            E.PETTERN_CD||' '||E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES,
            B.KWMENG
    FROM    RTSD0116 A,
            RTCS0208 B,
            RTSD0100 C,
            RTSD0007 D,
            RTSD0005 E 
    WHERE   A.GI_DAY  BETWEEN TO_CHAR(SYSDATE -8, 'YYYYMMDD') AND  TO_CHAR(SYSDATE - 1, 'YYYYMMDD') /* 대상:배송완료일이 전일 */
    AND     A.SMS_YN  = 'N'
    AND     A.NUM IS NOT NULL    
    AND     B.DLV_STAT IN ('03','02')   --선처리는 고객문자 발송은 제외한다
    AND     A.ORD_NO  = B.ORD_NO
    AND     B.CUST_NO = C.CUST_NO
    AND     B.AGENCY_CD = D.AGENCY_CD(+)
    AND     B.MATNR     = E.MAT_CD(+)
    ;   
    
--    v_Snd_Msg_1 := ' 고객님, 주문하신 타이어가 렌탈전문점에 도착하였습니다. 장착점 ';
--    v_Snd_Msg_2 := '에 사전 통화 후 방문하시면 원활한 서비스를 받으실 수 있습니다. 장착예정일인 ';
--    v_Snd_Msg_3 := '일에 신분증과 차량등록증을 필히 지참하시어 방문해주세요.';

    ------------------------------
    -- 일반 도착 고객용 SMS발송 --
    ------------------------------
    -- - [20170927_01] 에 의해 미발송 처리
--    INSERT  INTO RTSD0205   (
--            CMP_MSG_ID,          /*메시지 ID             */
--            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
--            USR_ID,              /*서비스ID              */
--            SMS_GB,              /*전송 위치구분         */
--            USED_CD,             /*메시지 구분           */
--            RESERVED_FG,         /*예약 전송여부         */
--            RESERVED_DTTM,       /*예약 전송시간         */
--            SAVED_FG,            /*메시지 저장여부       */
--            RCV_PHN_ID,          /*받는 전화번호         */
--            SND_PHN_ID,          /*보내는 전화번호       */
--            NAT_CD,              /*국가코드              */
--            ASSIGN_CD,           /*특정가입자지정        */
--            SND_MSG,             /*메시지내용            */
--            CALLBACK_URL,        /*Callback URL          */
--            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
--            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
--            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
--            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
--            CMP_RCV_DTTM,        /*업체 결과받은시간     */
--            REG_SND_DTTM,        /*SK 통신사보낸시간     */
--            REG_RCV_DTTM,        /*메시지 받은시간       */
--            MACHINE_ID,          /*메시지입력경로        */
--            SMS_STATUS,          /*메시지 처리 상태      */
--            RSLT_VAL,            /*전송 결과값           */
--            MSG_TITLE,           /*메시지 타이틀         */
--            TELCO_ID,            /*수신 이통사코드       */
--            ETC_CHAR_1,          /*사용자지정 필드       */
--            ETC_CHAR_2,          /*사용자지정 필드       */
--            ETC_CHAR_3,          /*사용자지정 필드       */
--            ETC_CHAR_4,          /*사용자지정 필드       */
--            ETC_INT_5,           /*사용자지정 필드       */
--            ETC_INT_6,           /*사용자지정 필드       */
--            JOB_DAY,             /*작업일자              */
--            EAI_TR_DTTM,         /*EAI전송시간           */
--            EAI_TR_YN,           /*EAI전송여부           */
--            REG_ID,              /*등록자 ID             */
--            REG_DT,
--            CHG_ID,
--            CHG_DT
--            )
--    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */
--            '1',                                                                /*메시지 그룹ID         */
--            '5331',                                                             /*서비스ID              */
--            '1',                                                                /*전송 위치구분         */
--            '10',                                                               /*메시지 구분           */
--            'I',                                                                /*예약 전송여부         */
--            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
--            '0',                                                                /*메시지 저장여부       */
--            A.MOB_NO,                                                           /*받는 전화번호         */
--            '18550100',                                                         /*보내는 전화번호       */
--            '',                                                                 /*국가코드              */
--            '00000',                                                            /*특정가입자지정        */
--            '[넥센타이어] '||A.CUST_NM||' 고객님 주문하신 타이어가 렌탈 전문점에 도착하였습니다.'
--            ||'장착예정일인 '||SUBSTR(A.PROC_DAY,5,2)||'월 '||SUBSTR(A.PROC_DAY,7,2)||'일에 신분증과 차량등록증을 지참하여 방문해주시기 바랍니다.'
--            ||' 취소시 개당 1만원의 취소 수수료가 부과됩니다.'
--            ||CHR(13)||CHR(10)
--            ||'(장착점 안내) 상호명 : '||A.AGENCY_NM||', 주소 : '||A.CITY||' '||A.STREET||', 전화번호 :'||A.AGENCY_TEL_NO
--            ||', 장착 예정일 : '||REGEXP_REPLACE(A.PROC_DAY, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3'), /*메시지내용            */
--            '',                                                                 /*Callback URL          */
--            '1',                                                                /*첨부된 컨텐츠개수     */
--            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
--            '',                                                                 /*첨부된 컨텐츠PATH     */
--            '',                                                                 /*업체 SK 전송한시간    */
--            '',                                                                 /*업체 결과받은시간     */
--            '',                                                                 /*SK 통신사보낸시간     */
--            '',                                                                 /*메시지 받은시간       */
--            '',                                                                 /*메시지입력경로        */
--            '0',                                                                /*메시지 처리 상태      */
--            '',                                                                 /*전송 결과값           */
--            '',                                                                 /*메시지 타이틀         */
--            '',                                                                 /*수신 이통사코드       */
--            'S001',                                                             /*사용자지정 필드       */
--            A.ORD_NO,                                                           /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
--            NULL,                                                               /*EAI전송시간           */
--            'N',                                                                /*EAI전송여부           */
--            'ADMIN',                                                            /*등록자 ID             */
--            SYSDATE,
--            'ADMIN',
--            SYSDATE
--    FROM    RTTEMP03 A
--    WHERE   A.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
--      AND   A.ORD_DIV = 'A'
--      AND   ( (A.MOB_NO LIKE '010%') OR (A.MOB_NO LIKE '016%') OR (A.MOB_NO LIKE '011%')  OR (A.MOB_NO LIKE '019%')  OR (A.MOB_NO LIKE '017%') )
--      AND   ( (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') ) -- O,B 계약만 발송 [20170906_01]
--    ;
    
    /* 일반 도착 대리점용 SMS발송 */
    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            '10',                                                               /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            A.AGENCY_MOB_NO,                                                    /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
            '[넥센타이어] 계약번호 "'||A.ORD_NO||'", 고객명 : '||A.CUST_NM||', 연락처 : '||REGEXP_REPLACE(A.MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3')
            ||', '||A.MAT_NM||' '||A.KWMENG||'개가 도착하였습니다. 타이어 도착 여부 확인 후 고객님께 방문 요청을 해주세요.', /*메시지내용            */
            '',                                                                 /*Callback URL          */
            '1',                                                                /*첨부된 컨텐츠개수     */
            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S024',                                                             /*사용자지정 필드       */
            A.ORD_NO,                                                           /*사용자지정 필드       */
            '2',                                                                 /*사용자지정 필드       */
            'RENTAL00000000000010',                                            /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE
    FROM    RTTEMP03 A
    WHERE   A.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
      AND   A.ORD_DIV = 'A'
      AND   ( (A.AGENCY_MOB_NO LIKE '010%') OR (A.AGENCY_MOB_NO LIKE '016%') OR (A.AGENCY_MOB_NO LIKE '011%')  OR (A.AGENCY_MOB_NO LIKE '019%')  OR (A.AGENCY_MOB_NO LIKE '017%') )
      AND   ( (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- O,B,M 계약만 발송 [20170906_01]
    ; 
    
    ----------------------------------
    -- 걱정제로 도착 고객용 SMS발송 --
    ----------------------------------
    -- - [20170927_01] 에 의해 미발송 처리
--    INSERT  INTO RTSD0205   (
--            CMP_MSG_ID,          /*메시지 ID             */
--            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
--            USR_ID,              /*서비스ID              */
--            SMS_GB,              /*전송 위치구분         */
--            USED_CD,             /*메시지 구분           */
--            RESERVED_FG,         /*예약 전송여부         */
--            RESERVED_DTTM,       /*예약 전송시간         */
--            SAVED_FG,            /*메시지 저장여부       */
--            RCV_PHN_ID,          /*받는 전화번호         */
--            SND_PHN_ID,          /*보내는 전화번호       */
--            NAT_CD,              /*국가코드              */
--            ASSIGN_CD,           /*특정가입자지정        */
--            SND_MSG,             /*메시지내용            */
--            CALLBACK_URL,        /*Callback URL          */
--            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
--            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
--            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
--            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
--            CMP_RCV_DTTM,        /*업체 결과받은시간     */
--            REG_SND_DTTM,        /*SK 통신사보낸시간     */
--            REG_RCV_DTTM,        /*메시지 받은시간       */
--            MACHINE_ID,          /*메시지입력경로        */
--            SMS_STATUS,          /*메시지 처리 상태      */
--            RSLT_VAL,            /*전송 결과값           */
--            MSG_TITLE,           /*메시지 타이틀         */
--            TELCO_ID,            /*수신 이통사코드       */
--            ETC_CHAR_1,          /*사용자지정 필드       */
--            ETC_CHAR_2,          /*사용자지정 필드       */
--            ETC_CHAR_3,          /*사용자지정 필드       */
--            ETC_CHAR_4,          /*사용자지정 필드       */
--            ETC_INT_5,           /*사용자지정 필드       */
--            ETC_INT_6,           /*사용자지정 필드       */
--            JOB_DAY,             /*작업일자              */
--            EAI_TR_DTTM,         /*EAI전송시간           */
--            EAI_TR_YN,           /*EAI전송여부           */
--            REG_ID,              /*등록자 ID             */
--            REG_DT,
--            CHG_ID,
--            CHG_DT
--            )
--    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */
--            '1',                                                                /*메시지 그룹ID         */
--            '5331',                                                             /*서비스ID              */
--            '1',                                                                /*전송 위치구분         */
--            '10',                                                               /*메시지 구분           */
--            'I',                                                                /*예약 전송여부         */
--            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
--            '0',                                                                /*메시지 저장여부       */
--            A.MOB_NO,                                                           /*받는 전화번호         */
--            '18550100',                                                         /*보내는 전화번호       */
--            '',                                                                 /*국가코드              */
--            '00000',                                                            /*특정가입자지정        */
--            '[넥센타이어] '||A.CUST_NM||' 고객님 신청하신 걱정제로 서비스 타이어가 렌탈 전문점에 도착하였습니다.'
--            ||'장착예정일인 '||SUBSTR(A.PROC_DAY,5,2)||'월 '||SUBSTR(A.PROC_DAY,7,2)||'일에 방문해주시기 바랍니다.'
--            ||CHR(13)||CHR(10)
--            ||'(장착점 안내) 상호명 : '||A.AGENCY_NM||', 주소 : '||A.CITY||' '||A.STREET||', 전화번호 :'||A.AGENCY_TEL_NO
--            ||', 장착 예정일 : '||REGEXP_REPLACE(A.PROC_DAY, '(\d{4})(\d{2})(\d{2})', '\1.\2.\3'), /*메시지내용            */
--            '',                                                                 /*Callback URL          */
--            '1',                                                                /*첨부된 컨텐츠개수     */
--            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
--            '',                                                                 /*첨부된 컨텐츠PATH     */
--            '',                                                                 /*업체 SK 전송한시간    */
--            '',                                                                 /*업체 결과받은시간     */
--            '',                                                                 /*SK 통신사보낸시간     */
--            '',                                                                 /*메시지 받은시간       */
--            '',                                                                 /*메시지입력경로        */
--            '0',                                                                /*메시지 처리 상태      */
--            '',                                                                 /*전송 결과값           */
--            '',                                                                 /*메시지 타이틀         */
--            '',                                                                 /*수신 이통사코드       */
--            'S025',                                                             /*사용자지정 필드       */
--            A.ORD_NO,                                                           /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
--            NULL,                                                               /*EAI전송시간           */
--            'N',                                                                /*EAI전송여부           */
--            'ADMIN',                                                            /*등록자 ID             */
--            SYSDATE,
--            'ADMIN',
--            SYSDATE
--    FROM    RTTEMP03 A
--    WHERE   A.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
--      AND   A.ORD_DIV = 'B'
--      AND   ( (A.MOB_NO LIKE '010%') OR (A.MOB_NO LIKE '016%') OR (A.MOB_NO LIKE '011%')  OR (A.MOB_NO LIKE '019%')  OR (A.MOB_NO LIKE '017%') )
--      AND   ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01]
--    ;
    
    /* 걱정제로 도착 대리점용 SMS발송 */
    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            '10',                                                               /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            A.AGENCY_MOB_NO,                                                    /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
            '[넥센타이어] '||A.CUST_NM||' 고객님께서 신청하신 걱정제로 서비스 타이어가 도착하였습니다.'
            ||CHR(13)||CHR(10)
            ||'계약번호 "'||A.ORD_NO||'",  연락처 : '||REGEXP_REPLACE(A.MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3')
            ||', '||A.MAT_NM||' '||A.KWMENG||'개가 도착하였습니다. 타이어 도착 여부 확인 후 고객님께 방문 요청을 해주세요.',  /*메시지내용            */
            '',                                                                 /*Callback URL          */
            '1',                                                                /*첨부된 컨텐츠개수     */
            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S026',                                                             /*사용자지정 필드       */
            A.ORD_NO,                                                           /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE
    FROM    RTTEMP03 A
    WHERE   A.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
      AND   A.ORD_DIV = 'B'
      AND   ( (A.AGENCY_MOB_NO LIKE '010%') OR (A.AGENCY_MOB_NO LIKE '016%') OR (A.AGENCY_MOB_NO LIKE '011%')  OR (A.AGENCY_MOB_NO LIKE '019%')  OR (A.AGENCY_MOB_NO LIKE '017%') )
      AND   ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01]
    ;
    
    /* 마모파손 도착 대리점용 SMS발송 */
    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            '10',                                                               /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            A.AGENCY_MOB_NO,                                                    /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
            '[넥센타이어] '||A.CUST_NM||' 고객님께서 신청하신 마모파손 서비스 타이어가 도착하였습니다.'
            ||CHR(13)||CHR(10)
            ||'계약번호 "'||A.ORD_NO||'",  연락처 : '||REGEXP_REPLACE(A.MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3')
            ||', '||A.MAT_NM||' '||A.KWMENG||'개가 도착하였습니다. 타이어 도착 여부 확인 후 고객님께 방문 요청을 해주세요.',  /*메시지내용            */
            '',                                                                 /*Callback URL          */
            '1',                                                                /*첨부된 컨텐츠개수     */
            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S054',                                                             /*사용자지정 필드       */
            A.ORD_NO,                                                           /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE
    FROM    RTTEMP03 A
    WHERE   A.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
      AND   A.ORD_DIV = 'C'
      AND   ( (A.AGENCY_MOB_NO LIKE '010%') OR (A.AGENCY_MOB_NO LIKE '016%') OR (A.AGENCY_MOB_NO LIKE '011%')  OR (A.AGENCY_MOB_NO LIKE '019%')  OR (A.AGENCY_MOB_NO LIKE '017%') )
      AND   ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01]
    ;  

    -- 전송완료 처리
    UPDATE  RTSD0116 A
    SET     A.SMS_DAY = TO_CHAR(SYSDATE,'YYYYMMDD'),
            A.SMS_YN = 'Y',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.VBELN) IN (SELECT  B.ORD_NO, B.VBELN
                                    FROM    RTTEMP03 B
                                    WHERE   B.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
                                    );

    -- 전송SKIP 처리
    UPDATE  RTSD0116 A
    SET     A.SMS_DAY = TO_CHAR(SYSDATE,'YYYYMMDD'),
            A.SMS_YN = 'S',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.VBELN) IN (SELECT  B.ORD_NO, B.VBELN
                                    FROM    RTTEMP03 B
                                    WHERE   B.PROC_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD')
                                    );


    DELETE FROM RTTEMP03;


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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrival(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrival(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205tirearrival;


  /*****************************************************************************
  -- SMS 발송 interface - 방문점검
  *****************************************************************************/
   PROCEDURE p_Rtsd0205InspectionVisitJob IS
    v_Success_Code   NUMBER;
    v_Return_Message VARCHAR2(2000);
    v_ErrorText      VARCHAR2(2000);
  BEGIN

    p_Rtsd0205InspectionVisit (v_Success_Code, v_Return_Message, v_ErrorText);

    IF 0 != v_Success_Code THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205InspectionVisitJob(1)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205InspectionVisitJob(1)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205InspectionVisitJob(1)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205InspectionVisitJob(2)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205InspectionVisitJob(2)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205InspectionVisitJob(2)', 'v_ErrorText',      v_ErrorText);
    END IF;

  END p_Rtsd0205InspectionVisitJob;

  /*****************************************************************************
  -- SMS 발송 interface - 방문점검
  *****************************************************************************/
   PROCEDURE p_Rtsd0205InspectionVisit (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Snd_Msg    VARCHAR2(2000);
    e_Error EXCEPTION;
  BEGIN

    v_Snd_Msg := '『CUST_NM 고객님』당월 고객님 차량과 타이어에 대한 방문점검이 예정되어 있습니다. (계약번호: ORD_NO)';

    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            CASE WHEN (SELECT LENGTHB(CONVERT(REPLACE(REPLACE(v_Snd_Msg,'CUST_NM',CUST_NM), 'ORD_NO', ORD_NO),'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN '00'  ELSE '10'
            END,                                                                /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            MOB_NO,                                                             /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
            REPLACE(REPLACE(v_Snd_Msg,'CUST_NM',CUST_NM), 'ORD_NO', ORD_NO),    /*메시지내용            */
            '',                                                                 /*Callback URL          */
            CASE WHEN (SELECT LENGTHB(CONVERT(REPLACE(REPLACE(v_Snd_Msg,'CUST_NM',CUST_NM), 'ORD_NO', ORD_NO),'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN '0' ELSE '1'
            END,                                                                /*첨부된 컨텐츠개수     */
            CASE WHEN (SELECT LENGTHB(CONVERT(REPLACE(REPLACE(v_Snd_Msg,'CUST_NM',CUST_NM), 'ORD_NO', ORD_NO),'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN ''  ELSE 'text/plain'
            END,                                                                /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S004',                                                             /*사용자지정 필드       */
            ORD_NO,                                                            /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE
    FROM    (
            SELECT  D.CUST_NO,
                    D.CUST_NM,
                    B.MOB_NO,
                    A.ORD_NO
            FROM    RTCS0005 A,
                    RTCS0006 B,
                    RTSD0108 C,
                    RTSD0100 D
            WHERE   A.STD_YM    = TO_CHAR(SYSDATE,'YYYYMM')
            AND     A.CHK_STAT  = '01' -- 작업상태
            AND     B.ROWID     = ( SELECT  /*+ INDEX_DESC(Z RTCS0006_PK) */
                                            Z.ROWID
                                    FROM    RTCS0006 Z
                                    WHERE   Z.STD_YM    = A.STD_YM
                                    AND     Z.ORD_NO    = A.ORD_NO
                                    AND     Z.EQU_NO    = A.EQU_NO
                                    AND     Z.JOB_SEQ   = A.JOB_SEQ
                                    AND     ROWNUM <= 1
                                    )
            AND     A.ORD_NO    = C.ORD_NO
            AND     C.MFP_YN    = 'N' -- 중도완납여부
            AND     ( C.OS_YN  = 'N' AND C.OS_DAY >= TO_CHAR(SYSDATE,'YYYYMMDD') ) -- 소유권이전여부
            AND     C.CUST_NO   = D.CUST_NO
            GROUP   BY D.CUST_NO, D.CUST_NM, B.MOB_NO, A.ORD_NO
            );


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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205InspectionVisit(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205InspectionVisit(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205InspectionVisit;

  /*****************************************************************************
  -- SMS 발송 interface - 잔여서비스 횟수 안내
  *****************************************************************************/
   PROCEDURE p_Rtsd0205ResidualServicesJob IS
    v_Success_Code   NUMBER;
    v_Return_Message VARCHAR2(2000);
    v_ErrorText      VARCHAR2(2000);
  BEGIN

    p_Rtsd0205ResidualServices (v_Success_Code, v_Return_Message, v_ErrorText);


    IF 0 != v_Success_Code THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205ResidualServicesJob(3)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205ResidualServicesJob(3)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205ResidualServicesJob(3)', 'v_ErrorText',      v_ErrorText);
    ELSE
        COMMIT;
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205ResidualServicesJob(3)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205ResidualServicesJob(3)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205ResidualServicesJob(3)', 'v_ErrorText',      v_ErrorText);
    END IF;


  END p_Rtsd0205ResidualServicesJob;

  /*****************************************************************************
  -- SMS 발송 interface - 잔여서비스 횟수 안내
  *****************************************************************************/
   PROCEDURE p_Rtsd0205ResidualServices (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Snd_Msg    VARCHAR2(2000);
    e_Error EXCEPTION;
  BEGIN

    DELETE FROM RTTEMP03;

    INSERT INTO RTTEMP03 (ORD_NO, CUST_NM, MOB_NO, VBELN, PROC_DAY)
    SELECT  A.ORD_NO,
            D.CUST_NM,
            D.MOB_NO,
            B.SERV_CNTR VBELN,
            A.SEQ PROC_DAY
    FROM    RTSD0114 A,
            RTSD0013 B,
            RTSD0108 C,
            RTSD0100 D
    WHERE   A.PROC_DAY  BETWEEN TO_CHAR(SYSDATE -80, 'YYYYMMDD') AND  TO_CHAR(SYSDATE - 1, 'YYYYMMDD')
    AND     A.PRS_DCD1 = 'Y'
    AND     A.ORD_NO   = B.ORD_NO
    AND     B.PRS_DCD  = 'B00001'
    AND     A.ORD_NO   = C.ORD_NO
    AND     C.CUST_NO  = D.CUST_NO
    AND     A.SMS_YN   = 'N';


    v_Snd_Msg := '『CUST_NM 고객님』 엔진오일 무상교환 잔여횟수가 SERV_CNTR회 남았습니다. (계약번호:ORD_NO)';

    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            CASE WHEN (SELECT LENGTHB(CONVERT(REPLACE(REPLACE(REPLACE(v_Snd_Msg,'CUST_NM',CUST_NM),'ORD_NO',ORD_NO),'SERV_CNTR',VBELN),'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN '00'  ELSE '10'
            END,                                                                /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            MOB_NO,                                                             /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
            REPLACE(REPLACE(REPLACE(v_Snd_Msg,'CUST_NM',CUST_NM),'ORD_NO',ORD_NO),'SERV_CNTR',VBELN), /*메시지내용            */
            '',                                                                 /*Callback URL          */
            CASE WHEN (SELECT LENGTHB(CONVERT(REPLACE(REPLACE(REPLACE(v_Snd_Msg,'CUST_NM',CUST_NM),'ORD_NO',ORD_NO),'SERV_CNTR',VBELN),'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN '0' ELSE '1'
            END,                                                                /*첨부된 컨텐츠개수     */
            CASE WHEN (SELECT LENGTHB(CONVERT(REPLACE(REPLACE(REPLACE(v_Snd_Msg,'CUST_NM',CUST_NM),'ORD_NO',ORD_NO),'SERV_CNTR',VBELN),'KO16KSC5601','AL32UTF8')) FROM DUAL) <= 80
            THEN ''  ELSE 'text/plain'
            END,                                                                /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S005',                                                             /*사용자지정 필드       */
            ORD_NO,                                                             /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE
    FROM    RTTEMP03;

    -- 전송완료 처리
    UPDATE  RTSD0114 A
    SET     A.SMS_YN = 'Y',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.SEQ) IN (SELECT  B.ORD_NO, B.PROC_DAY SEQ
                                  FROM    RTTEMP03 B
                                  );

    DELETE FROM RTTEMP03;

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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205ResidualServices(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205ResidualServices(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205ResidualServices;

    
  /*****************************************************************************
  -- SMS 발송 interface - 배송중-대리점발송
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-09-08  wjim             [20170906_01] SMS 변경
                                           - 메시지 내용 수정 및 발송대상 추가
                                           - SMS, LMS 고민없이 모두 LMS로 발송
  *****************************************************************************/
   PROCEDURE p_Rtsd0205tirearrivalIng (
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    v_Snd_Msg    VARCHAR2(200);
    
    e_Error EXCEPTION;
      
  BEGIN

    --------------------------------
    -- 1. 걱정제로 아닌 경우 시작 --
    --------------------------------    
    DELETE FROM RTTEMP05;
    
    /* SMS 발송대상 선정 */
    INSERT INTO RTTEMP05
        SELECT  B.ORD_NO,
                C.CUST_NM,
                D.MOB_NO,
                A.VBELN,
                B.PROC_DAY,
                C.MOB_NO,
                F.PETTERN_CD||' '||F.SECTION_WIDTH||'/'||F.ASPECT_RATIO||'R'||F.WHEEL_INCHES,
                TO_NUMBER(E.CNT_CD)
        FROM    RTSD0117 A,
                RTSD0104 B,
                RTSD0100 C,
                RTSD0007 D,
                RTSD0106 E,
                RTSD0005 F                                 
        WHERE   --A.GI_DAY >  TO_CHAR(SYSDATE -9, 'YYYYMMDD')  /* 대상:배송완료일이 전일 */                        
        --AND
                A.SMS_YN  = 'N'                         
        AND     B.STAT_CD IN ('01','03')
        AND     B.CHAN_CD NOT IN ('01','05')   /* 대리점과 타이어뱅크는 제외, 온라인,방판,오픈몰이 대상임 */
        AND     A.ORD_NO  = B.ORD_NO
        AND     B.CUST_NO = C.CUST_NO
        AND     B.CUST_NO = C.CUST_NO
        AND     B.AGENCY_CD = D.AGENCY_CD
--        AND     ( (D.MOB_NO LIKE '010%') OR (D.MOB_NO LIKE '016%') OR (D.MOB_NO LIKE '011%')  OR (D.MOB_NO LIKE '019%')  OR (D.MOB_NO LIKE '017%') ) --[20170906_01] 에 의해 주석처리
        AND     A.ORD_NO = E.ORD_NO
        AND     E.MAT_CD = F.MAT_CD(+)
        AND     A.NUM IS NULL;  --2016.03.01 추가 걱정제로 

    /* 고객용 SMS 발송 */
    -- [20170906_01] 에 의해 추가
    -- 발송 프로세스 개발 후 이관 예정
--    INSERT  INTO RTSD0205   (
--            CMP_MSG_ID,          /*메시지 ID             */
--            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
--            USR_ID,              /*서비스ID              */
--            SMS_GB,              /*전송 위치구분         */
--            USED_CD,             /*메시지 구분           */
--            RESERVED_FG,         /*예약 전송여부         */
--            RESERVED_DTTM,       /*예약 전송시간         */
--            SAVED_FG,            /*메시지 저장여부       */
--            RCV_PHN_ID,          /*받는 전화번호         */
--            SND_PHN_ID,          /*보내는 전화번호       */
--            NAT_CD,              /*국가코드              */
--            ASSIGN_CD,           /*특정가입자지정        */
--            SND_MSG,             /*메시지내용            */
--            CALLBACK_URL,        /*Callback URL          */
--            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
--            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
--            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
--            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
--            CMP_RCV_DTTM,        /*업체 결과받은시간     */
--            REG_SND_DTTM,        /*SK 통신사보낸시간     */
--            REG_RCV_DTTM,        /*메시지 받은시간       */
--            MACHINE_ID,          /*메시지입력경로        */
--            SMS_STATUS,          /*메시지 처리 상태      */
--            RSLT_VAL,            /*전송 결과값           */
--            MSG_TITLE,           /*메시지 타이틀         */
--            TELCO_ID,            /*수신 이통사코드       */
--            ETC_CHAR_1,          /*사용자지정 필드       */
--            ETC_CHAR_2,          /*사용자지정 필드       */
--            ETC_CHAR_3,          /*사용자지정 필드       */
--            ETC_CHAR_4,          /*사용자지정 필드       */
--            ETC_INT_5,           /*사용자지정 필드       */
--            ETC_INT_6,           /*사용자지정 필드       */
--            JOB_DAY,             /*작업일자              */
--            EAI_TR_DTTM,         /*EAI전송시간           */
--            EAI_TR_YN,           /*EAI전송여부           */
--            REG_ID,              /*등록자 ID             */
--            REG_DT,
--            CHG_ID,
--            CHG_DT
--            )
--    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */                                                                       
--            '1',                                                                /*메시지 그룹ID         */
--            '5331',                                                             /*서비스ID              */
--            '1',                                                                /*전송 위치구분         */
--            '10',                                                               /*메시지 구분           */
--            'I',                                                                /*예약 전송여부         */
--            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
--            '0',                                                                /*메시지 저장여부       */
--            A.CUST_MOB_NO,                                                      /*받는 전화번호         */
--            '18550100',                                                         /*보내는 전화번호       */
--            '',                                                                 /*국가코드              */
--            '00000',                                                            /*특정가입자지정        */
--            '[넥센타이어] '||A.CUST_NM||'고객님 주문하신 타이어의 배송을 시작합니다. 도착완료 문자 수신 후 장착점에 내방해주세요.',
--            '',                                                                 /*Callback URL          */
--            '1',                                                                /*첨부된 컨텐츠개수     */
--            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
--            '',                                                                 /*첨부된 컨텐츠PATH     */
--            '',                                                                 /*업체 SK 전송한시간    */
--            '',                                                                 /*업체 결과받은시간     */
--            '',                                                                 /*SK 통신사보낸시간     */
--            '',                                                                 /*메시지 받은시간       */
--            '',                                                                 /*메시지입력경로        */
--            '0',                                                                /*메시지 처리 상태      */
--            '',                                                                 /*전송 결과값           */
--            '',                                                                 /*메시지 타이틀         */
--            '',                                                                 /*수신 이통사코드       */
--            'S021',                                                             /*사용자지정 필드       */
--            A.ORD_NO,                                                           /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
--            NULL,                                                               /*EAI전송시간           */
--            'N',                                                                /*EAI전송여부           */
--            'ADMIN',                                                            /*등록자 ID             */
--            SYSDATE,
--            'ADMIN',
--            SYSDATE                   
--    FROM    RTTEMP05 A
--    WHERE   A.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
--    AND     ( (A.CUST_MOB_NO LIKE '010%') OR (A.CUST_MOB_NO LIKE '016%') OR (A.CUST_MOB_NO LIKE '011%')  OR (A.CUST_MOB_NO LIKE '019%')  OR (A.CUST_MOB_NO LIKE '017%') )
--    ; 
    
    /* 대리점용 SMS 발송 */
    --    v_Snd_Msg := ' 고객님의 주문하신 타이어가 해당 지점에 배송중입니다. 장착예정일은 ';
    
    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */                                                                       
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            '10',                                                               /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            A.MOB_NO,                                                           /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
--            A.CUST_NM || v_Snd_Msg||TO_NUMBER(SUBSTR(A.PROC_DAY,5,2))||'월 '||TO_NUMBER(SUBSTR(A.PROC_DAY,7,2))||'일 입니다. -넥스트레벨-', /*메시지내용            */
            '[넥센타이어] 계약번호 "'||A.ORD_NO||'", 고객명 : '||A.CUST_NM||', 연락처 : '||REGEXP_REPLACE(A.CUST_MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3')
            ||', '||A.MAT_NM||' '||A.KWMENG||'개가 배송될 예정입니다.', /*메시지내용            */
            '',                                                                 /*Callback URL          */
            '1',                                                                /*첨부된 컨텐츠개수     */
            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S006',                                                             /*사용자지정 필드       */
            A.ORD_NO,                                                           /*사용자지정 필드       */
            '2',                                                                /*사용자지정 필드       */
            'RENTAL00000000000008',                                             /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE                   
    FROM    RTTEMP05 A
    WHERE   A.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
    AND     ( (A.MOB_NO LIKE '010%') OR (A.MOB_NO LIKE '016%') OR (A.MOB_NO LIKE '011%')  OR (A.MOB_NO LIKE '019%')  OR (A.MOB_NO LIKE '017%') ) -- 발송대상선정에서 빠지로 여기에 추가 [20170906_01]
    AND     ( (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- O,B,M 계약만 발송 [20170906_01]
    ; 
    
    -- 전송완료 처리
    UPDATE  RTSD0117 A
    SET     A.SMS_DAY = TO_CHAR(SYSDATE,'YYYYMMDD'),
            A.SMS_YN = 'Y',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.VBELN) IN (SELECT  B.ORD_NO, B.VBELN
                                    FROM    RTTEMP05 B
                                    WHERE   B.PROC_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
                                    );

    -- 전송SKIP 처리
    UPDATE  RTSD0117 A
    SET     A.SMS_DAY = TO_CHAR(SYSDATE,'YYYYMMDD'),
            A.SMS_YN = 'S',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.VBELN) IN (SELECT  B.ORD_NO, B.VBELN
                                    FROM    RTTEMP05 B
                                    WHERE   B.PROC_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD') 
                                    );

                
    DELETE FROM RTTEMP05;

    ------------------------
    -- 2. 걱정제로인 경우 --
    ------------------------    
    DELETE FROM RTTEMP08;
    
    /* SMS발송대상 집계 */ 
    INSERT INTO RTTEMP08
        SELECT  B.ORD_NO,
                C.CUST_NM,
                D.MOB_NO,
                A.VBELN,
                B.SERVRQ_DAY,
                C.MOB_NO,
                E.PETTERN_CD||' '||E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES,
                B.KWMENG
        FROM    RTSD0117 A,
                RTCS0010 B,
                RTSD0100 C,
                RTSD0007 D,
                RTSD0005 E                                 
        WHERE   A.SMS_YN    = 'N'                         
        AND     B.DLV_STAT  NOT IN ('01','06','05','07','08','09') --선처리는 배송문자 분리 발송 
        AND     A.ORD_NO    = B.ORD_NO
        AND     B.CUST_NO   = C.CUST_NO
        AND     B.CUST_NO   = C.CUST_NO
        AND     B.AGENCY_CD = D.AGENCY_CD
--        AND     ( (D.MOB_NO LIKE '010%') OR (D.MOB_NO LIKE '016%') OR (D.MOB_NO LIKE '011%')  OR (D.MOB_NO LIKE '019%')  OR (D.MOB_NO LIKE '017%') ) --[20170906_01] 에 의해 주석처리
        AND     B.MATNR     = E.MAT_CD(+)
        AND     A.NUM IS NOT NULL;  --2016.03.01 추가 걱정제로 
        
    /* 고객용 SMS 발송 */
    -- 발송 프로세스 개발 후 이관 예정
--    INSERT  INTO RTSD0205   (
--            CMP_MSG_ID,          /*메시지 ID             */
--            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
--            USR_ID,              /*서비스ID              */
--            SMS_GB,              /*전송 위치구분         */
--            USED_CD,             /*메시지 구분           */
--            RESERVED_FG,         /*예약 전송여부         */
--            RESERVED_DTTM,       /*예약 전송시간         */
--            SAVED_FG,            /*메시지 저장여부       */
--            RCV_PHN_ID,          /*받는 전화번호         */
--            SND_PHN_ID,          /*보내는 전화번호       */
--            NAT_CD,              /*국가코드              */
--            ASSIGN_CD,           /*특정가입자지정        */
--            SND_MSG,             /*메시지내용            */
--            CALLBACK_URL,        /*Callback URL          */
--            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
--            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
--            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
--            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
--            CMP_RCV_DTTM,        /*업체 결과받은시간     */
--            REG_SND_DTTM,        /*SK 통신사보낸시간     */
--            REG_RCV_DTTM,        /*메시지 받은시간       */
--            MACHINE_ID,          /*메시지입력경로        */
--            SMS_STATUS,          /*메시지 처리 상태      */
--            RSLT_VAL,            /*전송 결과값           */
--            MSG_TITLE,           /*메시지 타이틀         */
--            TELCO_ID,            /*수신 이통사코드       */
--            ETC_CHAR_1,          /*사용자지정 필드       */
--            ETC_CHAR_2,          /*사용자지정 필드       */
--            ETC_CHAR_3,          /*사용자지정 필드       */
--            ETC_CHAR_4,          /*사용자지정 필드       */
--            ETC_INT_5,           /*사용자지정 필드       */
--            ETC_INT_6,           /*사용자지정 필드       */
--            JOB_DAY,             /*작업일자              */
--            EAI_TR_DTTM,         /*EAI전송시간           */
--            EAI_TR_YN,           /*EAI전송여부           */
--            REG_ID,              /*등록자 ID             */
--            REG_DT,
--            CHG_ID,
--            CHG_DT
--            )
--    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */                                                                       
--            '1',                                                                /*메시지 그룹ID         */
--            '5331',                                                             /*서비스ID              */
--            '1',                                                                /*전송 위치구분         */
--            '10',                                                               /*메시지 구분           */
--            'I',                                                                /*예약 전송여부         */
--            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
--            '0',                                                                /*메시지 저장여부       */
--            A.CUST_MOB_NO,                                                      /*받는 전화번호         */
--            '18550100',                                                         /*보내는 전화번호       */
--            '',                                                                 /*국가코드              */
--            '00000',                                                            /*특정가입자지정        */
--            '[넥센타이어] '||A.CUST_NM||'고객님 주문하신 걱정제로 서비스 타이어의 배송을 시작합니다. 도착완료 문자 수신 후 장착점에 내방해주세요.',
--            '',                                                                 /*Callback URL          */
--            '1',                                                                /*첨부된 컨텐츠개수     */
--            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
--            '',                                                                 /*첨부된 컨텐츠PATH     */
--            '',                                                                 /*업체 SK 전송한시간    */
--            '',                                                                 /*업체 결과받은시간     */
--            '',                                                                 /*SK 통신사보낸시간     */
--            '',                                                                 /*메시지 받은시간       */
--            '',                                                                 /*메시지입력경로        */
--            '0',                                                                /*메시지 처리 상태      */
--            '',                                                                 /*전송 결과값           */
--            '',                                                                 /*메시지 타이틀         */
--            '',                                                                 /*수신 이통사코드       */
--            'S022',                                                             /*사용자지정 필드       */
--            A.ORD_NO,                                                           /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
--            NULL,                                                               /*EAI전송시간           */
--            'N',                                                                /*EAI전송여부           */
--            'ADMIN',                                                            /*등록자 ID             */
--            SYSDATE,
--            'ADMIN',
--            SYSDATE                   
--    FROM    RTTEMP08 A
--    WHERE   A.SERVRQ_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
--    AND     ( (A.CUST_MOB_NO LIKE '010%') OR (A.CUST_MOB_NO LIKE '016%') OR (A.CUST_MOB_NO LIKE '011%')  OR (A.CUST_MOB_NO LIKE '019%')  OR (A.CUST_MOB_NO LIKE '017%') ) --[20170906_01]
--    AND     ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01] 
--    ; 
    
    /* 대리점용 SMS 발송 */
    --    v_Snd_Msg := ' 고객님의 주문하신 타이어가 해당 지점에 배송중입니다. 장착예정일은 ';
    
    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */                                                                       
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            '10',                                                               /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            A.MOB_NO,                                                           /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
--            A.CUST_NM || v_Snd_Msg||TO_NUMBER(SUBSTR(A.SERVRQ_DAY,5,2))||'월 '||TO_NUMBER(SUBSTR(A.SERVRQ_DAY,7,2))||'일 입니다. -넥스트레벨-', /*메시지내용            */
            '[넥센타이어] '||A.CUST_NM||' 고객님께서 신청하신 타이어 무상교체 서비스가 배송을 시작합니다.'   --[20210107_01]
            ||CHR(13)||CHR(10)
            ||'계약번호 "'||A.ORD_NO||'", 연락처 : '||REGEXP_REPLACE(A.CUST_MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3')||', '||A.MAT_NM||' '||A.KWMENG||'개가 배송될 예정입니다.', /*메시지내용            */
            '',                                                                 /*Callback URL          */
            '1',                                                                /*첨부된 컨텐츠개수     */
            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S023',                                                             /*사용자지정 필드       */
            A.ORD_NO,                                                           /*사용자지정 필드       */
            '2',                                                                 /*사용자지정 필드       */
            'RENTAL00000000000009',                                             /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE                   
    FROM    RTTEMP08 A
    WHERE   A.SERVRQ_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
    AND     ( (A.MOB_NO LIKE '010%') OR (A.MOB_NO LIKE '016%') OR (A.MOB_NO LIKE '011%')  OR (A.MOB_NO LIKE '019%')  OR (A.MOB_NO LIKE '017%') ) -- 발송대상선정에서 빠지로 여기에 추가 [20170906_01]
    AND     ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01]
    ; 
    
    -------------------------------
    -- 3. 걱정제로 선처리인 경우 --
    -------------------------------
    INSERT INTO RTTEMP08
        SELECT  B.ORD_NO,
                C.CUST_NM,
                D.MOB_NO,
                A.VBELN,
                B.SERVRQ_DAY,
                C.MOB_NO,
                E.PETTERN_CD||' '||E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES,
                B.KWMENG
        FROM    RTSD0117 A,
                RTCS0010 B,
                RTSD0100 C,
                RTSD0007 D,
                RTSD0005 E                                 
        WHERE   A.SMS_YN  = 'N'                         
        AND     B.DLV_STAT IN ('08','09')
        AND     A.ORD_NO  = B.ORD_NO
        AND     B.CUST_NO = C.CUST_NO
        AND     B.CUST_NO = C.CUST_NO
        AND     B.AGENCY_CD = D.AGENCY_CD
        AND     ( (D.MOB_NO LIKE '010%') OR (D.MOB_NO LIKE '016%') OR (D.MOB_NO LIKE '011%')  OR (D.MOB_NO LIKE '019%')  OR (D.MOB_NO LIKE '017%') )
        AND     B.MATNR     = E.MAT_CD(+)
        AND     A.NUM IS NOT NULL;  --2016.03.01 추가 걱정제로 
        
--    v_Snd_Msg := ' 고객님의 선처리 타이어가 해당 지점에 배송중입니다.';             

    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */                                                                       
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
--            CASE WHEN (SELECT LENGTHB(CONVERT(A.CUST_NM || v_Snd_Msg||' -넥스트레벨-','KO16KSC5601','AL32UTF8'))  FROM DUAL) <= 80
--            THEN '00'  ELSE '10' 
--            END,                                                                /*메시지 구분           */
            '10',                                                               /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            A.MOB_NO,                                                           /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
--            A.CUST_NM || v_Snd_Msg||' -넥스트레벨-', /*메시지내용            */
            '[넥센타이어] 계약번호 "'||A.ORD_NO||'", 고객명 : '||A.CUST_NM||', 연락처 : '||REGEXP_REPLACE(A.CUST_MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3')
            ||', 타이어 무상교체 서비스 선처리된 타이어'||A.MAT_NM||' '||A.KWMENG||'개의 배송을 시작합니다.', /*메시지내용         [20210107_01]   */
            '',                                                                 /*Callback URL          */
            '1',                                                                /*첨부된 컨텐츠개수     */
            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S020',                                                             /*사용자지정 필드       */
            A.ORD_NO,                                                           /*사용자지정 필드       */
            '2',                                                                 /*사용자지정 필드       */
            'RENTAL00000000000007',                                              /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE                   
    FROM    RTTEMP08 A
    WHERE   A.SERVRQ_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
      AND   ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01]
    ;     
    
    
    -- 전송완료 처리
    UPDATE  RTSD0117 A
    SET     A.SMS_DAY = TO_CHAR(SYSDATE,'YYYYMMDD'),
            A.SMS_YN = 'Y',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.VBELN) IN (SELECT  B.ORD_NO, B.VBELN
                                    FROM    RTTEMP08 B
                                    WHERE   B.SERVRQ_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
                                    );

    -- 전송SKIP 처리
    UPDATE  RTSD0117 A
    SET     A.SMS_DAY = TO_CHAR(SYSDATE,'YYYYMMDD'),
            A.SMS_YN = 'S',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.VBELN) IN (SELECT  B.ORD_NO, B.VBELN
                                    FROM    RTTEMP08 B
                                    WHERE   B.SERVRQ_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD') 
                                    );

                
    DELETE FROM RTTEMP08;
    
    ------------------------
    -- 4. 마모파손인 경우 --
    ------------------------    
    DELETE FROM RTTEMP18;
    
    /* SMS발송대상 집계 */ 
    INSERT INTO RTTEMP18
        SELECT  B.ORD_NO,
                C.CUST_NM,
                D.MOB_NO,
                A.VBELN,
                B.SERVRQ_DAY,
                C.MOB_NO,
                E.PETTERN_CD||' '||E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES,
                B.KWMENG
        FROM    RTSD0117 A,
                RTCS0208 B,
                RTSD0100 C,
                RTSD0007 D,
                RTSD0005 E                                 
        WHERE   A.SMS_YN    = 'N'                         
        AND     B.DLV_STAT  NOT IN ('01','06','05','07','08','09') --선처리는 배송문자 분리 발송 
        AND     A.ORD_NO    = B.ORD_NO
        AND     B.CUST_NO   = C.CUST_NO
        AND     B.CUST_NO   = C.CUST_NO
        AND     B.AGENCY_CD = D.AGENCY_CD
--        AND     ( (D.MOB_NO LIKE '010%') OR (D.MOB_NO LIKE '016%') OR (D.MOB_NO LIKE '011%')  OR (D.MOB_NO LIKE '019%')  OR (D.MOB_NO LIKE '017%') ) --[20170906_01] 에 의해 주석처리
        AND     B.MATNR     = E.MAT_CD(+)
        AND     A.NUM IS NOT NULL;  --2016.03.01 추가 걱정제로 
        
    /* 고객용 SMS 발송 */
    -- 발송 프로세스 개발 후 이관 예정
--    INSERT  INTO RTSD0205   (
--            CMP_MSG_ID,          /*메시지 ID             */
--            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
--            USR_ID,              /*서비스ID              */
--            SMS_GB,              /*전송 위치구분         */
--            USED_CD,             /*메시지 구분           */
--            RESERVED_FG,         /*예약 전송여부         */
--            RESERVED_DTTM,       /*예약 전송시간         */
--            SAVED_FG,            /*메시지 저장여부       */
--            RCV_PHN_ID,          /*받는 전화번호         */
--            SND_PHN_ID,          /*보내는 전화번호       */
--            NAT_CD,              /*국가코드              */
--            ASSIGN_CD,           /*특정가입자지정        */
--            SND_MSG,             /*메시지내용            */
--            CALLBACK_URL,        /*Callback URL          */
--            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
--            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
--            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
--            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
--            CMP_RCV_DTTM,        /*업체 결과받은시간     */
--            REG_SND_DTTM,        /*SK 통신사보낸시간     */
--            REG_RCV_DTTM,        /*메시지 받은시간       */
--            MACHINE_ID,          /*메시지입력경로        */
--            SMS_STATUS,          /*메시지 처리 상태      */
--            RSLT_VAL,            /*전송 결과값           */
--            MSG_TITLE,           /*메시지 타이틀         */
--            TELCO_ID,            /*수신 이통사코드       */
--            ETC_CHAR_1,          /*사용자지정 필드       */
--            ETC_CHAR_2,          /*사용자지정 필드       */
--            ETC_CHAR_3,          /*사용자지정 필드       */
--            ETC_CHAR_4,          /*사용자지정 필드       */
--            ETC_INT_5,           /*사용자지정 필드       */
--            ETC_INT_6,           /*사용자지정 필드       */
--            JOB_DAY,             /*작업일자              */
--            EAI_TR_DTTM,         /*EAI전송시간           */
--            EAI_TR_YN,           /*EAI전송여부           */
--            REG_ID,              /*등록자 ID             */
--            REG_DT,
--            CHG_ID,
--            CHG_DT
--            )
--    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */                                                                       
--            '1',                                                                /*메시지 그룹ID         */
--            '5331',                                                             /*서비스ID              */
--            '1',                                                                /*전송 위치구분         */
--            '10',                                                               /*메시지 구분           */
--            'I',                                                                /*예약 전송여부         */
--            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
--            '0',                                                                /*메시지 저장여부       */
--            A.CUST_MOB_NO,                                                      /*받는 전화번호         */
--            '18550100',                                                         /*보내는 전화번호       */
--            '',                                                                 /*국가코드              */
--            '00000',                                                            /*특정가입자지정        */
--            '[넥센타이어] '||A.CUST_NM||'고객님 주문하신 걱정제로 서비스 타이어의 배송을 시작합니다. 도착완료 문자 수신 후 장착점에 내방해주세요.',
--            '',                                                                 /*Callback URL          */
--            '1',                                                                /*첨부된 컨텐츠개수     */
--            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
--            '',                                                                 /*첨부된 컨텐츠PATH     */
--            '',                                                                 /*업체 SK 전송한시간    */
--            '',                                                                 /*업체 결과받은시간     */
--            '',                                                                 /*SK 통신사보낸시간     */
--            '',                                                                 /*메시지 받은시간       */
--            '',                                                                 /*메시지입력경로        */
--            '0',                                                                /*메시지 처리 상태      */
--            '',                                                                 /*전송 결과값           */
--            '',                                                                 /*메시지 타이틀         */
--            '',                                                                 /*수신 이통사코드       */
--            'S022',                                                             /*사용자지정 필드       */
--            A.ORD_NO,                                                           /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            '',                                                                 /*사용자지정 필드       */
--            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
--            NULL,                                                               /*EAI전송시간           */
--            'N',                                                                /*EAI전송여부           */
--            'ADMIN',                                                            /*등록자 ID             */
--            SYSDATE,
--            'ADMIN',
--            SYSDATE                   
--    FROM    RTTEMP08 A
--    WHERE   A.SERVRQ_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
--    AND     ( (A.CUST_MOB_NO LIKE '010%') OR (A.CUST_MOB_NO LIKE '016%') OR (A.CUST_MOB_NO LIKE '011%')  OR (A.CUST_MOB_NO LIKE '019%')  OR (A.CUST_MOB_NO LIKE '017%') ) --[20170906_01]
--    AND     ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01] 
--    ; 
    
    /* 대리점용 SMS 발송 */
    --    v_Snd_Msg := ' 고객님의 주문하신 타이어가 해당 지점에 배송중입니다. 장착예정일은 ';
    
    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */                                                                       
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
            '10',                                                               /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            A.MOB_NO,                                                           /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
--            A.CUST_NM || v_Snd_Msg||TO_NUMBER(SUBSTR(A.SERVRQ_DAY,5,2))||'월 '||TO_NUMBER(SUBSTR(A.SERVRQ_DAY,7,2))||'일 입니다. -넥스트레벨-', /*메시지내용            */
            '[넥센타이어] '||A.CUST_NM||' 고객님께서 신청하신 무상보증 서비스가 배송을 시작합니다.'   --[20210107_01]
            ||CHR(13)||CHR(10)
            ||'계약번호 "'||A.ORD_NO||'", 연락처 : '||REGEXP_REPLACE(A.CUST_MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3')||', '||A.MAT_NM||' '||A.KWMENG||'개가 배송될 예정입니다.', /*메시지내용            */
            '',                                                                 /*Callback URL          */
            '1',                                                                /*첨부된 컨텐츠개수     */
            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S052',                                                             /*사용자지정 필드       */
            A.ORD_NO,                                                           /*사용자지정 필드       */
            '7',                                                                 /*사용자지정 필드       */
            '',                                             /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE                   
    FROM    RTTEMP18 A
    WHERE   A.SERVRQ_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
    AND     ( (A.MOB_NO LIKE '010%') OR (A.MOB_NO LIKE '016%') OR (A.MOB_NO LIKE '011%')  OR (A.MOB_NO LIKE '019%')  OR (A.MOB_NO LIKE '017%') ) -- 발송대상선정에서 빠지로 여기에 추가 [20170906_01]
    AND     ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01]
    ; 
    
    -------------------------------
    -- 5. 마모파손 선처리인 경우 --
    -------------------------------
    INSERT INTO RTTEMP18
        SELECT  B.ORD_NO,
                C.CUST_NM,
                D.MOB_NO,
                A.VBELN,
                B.SERVRQ_DAY,
                C.MOB_NO,
                E.PETTERN_CD||' '||E.SECTION_WIDTH||'/'||E.ASPECT_RATIO||'R'||E.WHEEL_INCHES,
                B.KWMENG
        FROM    RTSD0117 A,
                RTCS0208 B,
                RTSD0100 C,
                RTSD0007 D,
                RTSD0005 E                                 
        WHERE   A.SMS_YN  = 'N'                         
        AND     B.DLV_STAT IN ('08','09')
        AND     A.ORD_NO  = B.ORD_NO
        AND     B.CUST_NO = C.CUST_NO
        AND     B.CUST_NO = C.CUST_NO
        AND     B.AGENCY_CD = D.AGENCY_CD
        AND     ( (D.MOB_NO LIKE '010%') OR (D.MOB_NO LIKE '016%') OR (D.MOB_NO LIKE '011%')  OR (D.MOB_NO LIKE '019%')  OR (D.MOB_NO LIKE '017%') )
        AND     B.MATNR     = E.MAT_CD(+)
        AND     A.NUM IS NOT NULL;  --2016.03.01 추가 걱정제로 
        
--    v_Snd_Msg := ' 고객님의 선처리 타이어가 해당 지점에 배송중입니다.';             

    INSERT  INTO RTSD0205   (
            CMP_MSG_ID,          /*메시지 ID             */
            CMP_MSG_GROUP_ID,    /*메시지 그룹ID         */
            USR_ID,              /*서비스ID              */
            SMS_GB,              /*전송 위치구분         */
            USED_CD,             /*메시지 구분           */
            RESERVED_FG,         /*예약 전송여부         */
            RESERVED_DTTM,       /*예약 전송시간         */
            SAVED_FG,            /*메시지 저장여부       */
            RCV_PHN_ID,          /*받는 전화번호         */
            SND_PHN_ID,          /*보내는 전화번호       */
            NAT_CD,              /*국가코드              */
            ASSIGN_CD,           /*특정가입자지정        */
            SND_MSG,             /*메시지내용            */
            CALLBACK_URL,        /*Callback URL          */
            CONTENT_CNT,         /*첨부된 컨텐츠개수     */
            CONTENT_MIME_TYPE,   /*컨텐츠 MIME TYPE      */
            CONTENT_PATH,        /*첨부된 컨텐츠PATH     */
            CMP_SND_DTTM,        /*업체 SK 전송한시간    */
            CMP_RCV_DTTM,        /*업체 결과받은시간     */
            REG_SND_DTTM,        /*SK 통신사보낸시간     */
            REG_RCV_DTTM,        /*메시지 받은시간       */
            MACHINE_ID,          /*메시지입력경로        */
            SMS_STATUS,          /*메시지 처리 상태      */
            RSLT_VAL,            /*전송 결과값           */
            MSG_TITLE,           /*메시지 타이틀         */
            TELCO_ID,            /*수신 이통사코드       */
            ETC_CHAR_1,          /*사용자지정 필드       */
            ETC_CHAR_2,          /*사용자지정 필드       */
            ETC_CHAR_3,          /*사용자지정 필드       */
            ETC_CHAR_4,          /*사용자지정 필드       */
            ETC_INT_5,           /*사용자지정 필드       */
            ETC_INT_6,           /*사용자지정 필드       */
            JOB_DAY,             /*작업일자              */
            EAI_TR_DTTM,         /*EAI전송시간           */
            EAI_TR_YN,           /*EAI전송여부           */
            REG_ID,              /*등록자 ID             */
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    SELECT  Pkg_Rtsd0205.f_sRtsd0205CmpMsgId9,                                  /*메시지 ID             */                                                                       
            '1',                                                                /*메시지 그룹ID         */
            '5331',                                                             /*서비스ID              */
            '1',                                                                /*전송 위치구분         */
--            CASE WHEN (SELECT LENGTHB(CONVERT(A.CUST_NM || v_Snd_Msg||' -넥스트레벨-','KO16KSC5601','AL32UTF8'))  FROM DUAL) <= 80
--            THEN '00'  ELSE '10' 
--            END,                                                                /*메시지 구분           */
            '10',                                                               /*메시지 구분           */
            'I',                                                                /*예약 전송여부         */
            TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),                                /*예약 전송시간         */
            '0',                                                                /*메시지 저장여부       */
            A.MOB_NO,                                                           /*받는 전화번호         */
            '18550100',                                                         /*보내는 전화번호       */
            '',                                                                 /*국가코드              */
            '00000',                                                            /*특정가입자지정        */
--            A.CUST_NM || v_Snd_Msg||' -넥스트레벨-', /*메시지내용            */
            '[넥센타이어] 계약번호 "'||A.ORD_NO||'", 고객명 : '||A.CUST_NM||', 연락처 : '||REGEXP_REPLACE(A.CUST_MOB_NO, '(\d{3})(\d*)(\d{4})', '\1-\2-\3')
            ||', 무상보증 서비스 선처리된 타이어'||A.MAT_NM||' '||A.KWMENG||'개의 배송을 시작합니다.', /*메시지내용 [20210107_01]           */ 
            '',                                                                 /*Callback URL          */
            '1',                                                                /*첨부된 컨텐츠개수     */
            'text/plain',                                                       /*컨텐츠 MIME TYPE      */
            '',                                                                 /*첨부된 컨텐츠PATH     */
            '',                                                                 /*업체 SK 전송한시간    */
            '',                                                                 /*업체 결과받은시간     */
            '',                                                                 /*SK 통신사보낸시간     */
            '',                                                                 /*메시지 받은시간       */
            '',                                                                 /*메시지입력경로        */
            '0',                                                                /*메시지 처리 상태      */
            '',                                                                 /*전송 결과값           */
            '',                                                                 /*메시지 타이틀         */
            '',                                                                 /*수신 이통사코드       */
            'S053',                                                             /*사용자지정 필드       */
            A.ORD_NO,                                                           /*사용자지정 필드       */
            '7',                                                                 /*사용자지정 필드       */
            '',                                              /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            '',                                                                 /*사용자지정 필드       */
            TO_CHAR(SYSDATE,'YYYYMMDD'),                                        /*작업일자              */
            NULL,                                                               /*EAI전송시간           */
            'N',                                                                /*EAI전송여부           */
            'ADMIN',                                                            /*등록자 ID             */
            SYSDATE,
            'ADMIN',
            SYSDATE                   
    FROM    RTTEMP18 A
    WHERE   A.SERVRQ_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
      AND   ( (A.ORD_NO LIKE 'D%') OR (A.ORD_NO LIKE 'O%') OR (A.ORD_NO LIKE 'B%') OR (A.ORD_NO LIKE 'M%') ) -- D,O,B,M 계약만 발송 [20170906_01]
    ;     
    
    
    -- 전송완료 처리
    UPDATE  RTSD0117 A
    SET     A.SMS_DAY = TO_CHAR(SYSDATE,'YYYYMMDD'),
            A.SMS_YN = 'Y',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.VBELN) IN (SELECT  B.ORD_NO, B.VBELN
                                    FROM    RTTEMP18 B
                                    WHERE   B.SERVRQ_DAY >= TO_CHAR(SYSDATE, 'YYYYMMDD') -- 장착일 기준 현재 이후 장착건만
                                    );

    -- 전송SKIP 처리
    UPDATE  RTSD0117 A
    SET     A.SMS_DAY = TO_CHAR(SYSDATE,'YYYYMMDD'),
            A.SMS_YN = 'S',
            A.CHG_ID = 'ADMIN',
            A.CHG_DT = SYSDATE
    WHERE   (A.ORD_NO, A.VBELN) IN (SELECT  B.ORD_NO, B.VBELN
                                    FROM    RTTEMP18 B
                                    WHERE   B.SERVRQ_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD') 
                                    );

                
    DELETE FROM RTTEMP18;
    
    /*걱정제로 끝 */    
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrival(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrival(2)', v_ErrorText, v_Return_Message);

  END p_Rtsd0205tirearrivalIng;  

  
 /*****************************************************************************
  -- SMS 발송 interface - 배송중-대리점발송
  *****************************************************************************/
   PROCEDURE p_Rtsd0205tirearrivalIngJob IS   
   
    v_Success_Code   NUMBER;
    v_Return_Message VARCHAR2(2000);
    v_ErrorText      VARCHAR2(2000);
  BEGIN
    p_Rtsd0205tirearrivalIng (v_Success_Code, v_Return_Message, v_ErrorText);
    
          
    IF 0 != v_Success_Code THEN
        ROLLBACK;
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_ErrorText',      v_ErrorText);  
    ELSE
        COMMIT; 
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_Success_Code',   v_Success_Code);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_Return_Message', v_Return_Message);
        Pkg_Utility.p_InfoFileWrite('Pkg_Rtsd0205.p_Rtsd0205tirearrivalJob(3)', 'v_ErrorText',      v_ErrorText);   
    END IF;

    
  END p_Rtsd0205tirearrivalIngJob;     
END Pkg_Rtsd0205;