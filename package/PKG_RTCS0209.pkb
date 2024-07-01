CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0209 AS 
/*******************************************************************************
   NAME      Pkg_Rtcs0209
   PURPOSE   미모파손 부여/신청 내역 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-10-14  kstka            1. Created this package body.
   1.1        2021-11-12  kstka            [20211112-0001] 자동가입프로세스 적용 
*******************************************************************************/
  
  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  PROCEDURE p_sRtcs0209List (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,          /*계약번호              */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,       /*부여:A, 신청:B        */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,         /*서비스코드            */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE         /*서비스부여/신청순번     */
    ) IS

  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT  ROWNUM AS NUM
          , ORD_NO
          , DLVR_TYPE
          , SERV_CD
          , SERV_SEQ
          , SEQ
          , FILE_PATH
          , FILE_NAME
          , CASE WHEN CONF_YN = 'Y' THEN '1' ELSE '0' END AS CONF_YN
          , PIC_SET
          , PKG_RTCM0051.f_sRTCM0051CodeName('S305', PIC_SET) AS PIC_SET_NM
          , REG_ID
          , REG_DT
          , CHG_ID
          , CHG_DT
    FROM    RTCS0209
    WHERE   ORD_NO      = v_Ord_No
    AND     DLVR_TYPE   = v_Dlvr_Type
    AND     SERV_CD     = v_Serv_Cd
    AND     SERV_SEQ    = v_Serv_Seq
    AND     DEL_YN      = 'N'
    ;

  END p_sRtcs0209List;  
  
  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지 INSERT
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_InsertRtcs0209 (
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,         /*배송신청일자          */
    v_Dlvr_Day       IN RTCS0209.DLVR_DAY%TYPE,       /*순번                  */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,        /*계약번호              */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE,       /*고객코드              */
    v_Seq            IN RTCS0209.SEQ%TYPE,            /*고객명                */
    v_File_Path      IN RTCS0209.FILE_PATH%TYPE,      /*대리점                */
    v_File_Name      IN RTCS0209.FILE_NAME%TYPE,      /**/
    v_Conf_Yn        IN RTCS0209.CONF_YN%TYPE,        /**/
    v_Pic_Set        IN RTCS0209.PIC_SET%TYPE,        /**/
    v_Reg_Id         IN RTCS0209.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0209 (
            ORD_NO,
            DLVR_DAY,
            DLVR_TYPE,
            SERV_CD,
            SERV_SEQ,
            SEQ,
            FILE_PATH,
            FILE_NAME,
            CONF_YN,
            PIC_SET,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Dlvr_Day,
            v_Dlvr_Type,
            v_Serv_Cd,
            v_Serv_Seq,
            v_Seq,
            v_File_Path,
            v_File_Name,
            v_Conf_Yn,
            v_Pic_Set,
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

  END f_InsertRtcs0209;

  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지 UPDATE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]                             
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0209 (
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,         /*배송신청일자          */
    v_Dlvr_Day       IN RTCS0209.DLVR_DAY%TYPE,      /*순번                  */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,        /*계약번호              */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE,       /*고객코드              */
    v_Seq            IN RTCS0209.SEQ%TYPE,            /*고객명                */
    v_Conf_Yn        IN RTCS0209.CONF_YN%TYPE,        /**/
    v_Pic_Set        IN RTCS0209.PIC_SET%TYPE,        /**/
    v_Reg_Id         IN RTCS0209.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0209
    SET    CONF_YN          = v_Conf_Yn,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  ORD_NO           = v_Ord_No
    AND    DLVR_TYPE        = v_Dlvr_Type
    AND    SERV_CD          = v_Serv_Cd
    AND    SERV_SEQ         = v_Serv_Seq
    AND    SEQ              = v_Seq;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0209;

  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지 DELETE
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0        2020-10-14  kstka           Created. [20201014_01]  
  1.1        2021-11-12  kstka            [20211112-0001] 자동가입프로세스 적용                        
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0209 (
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,         /*배송신청일자          */
    v_Dlvr_Day       IN RTCS0209.DLVR_DAY%TYPE,      /*순번                  */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,        /*계약번호              */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE,       /*고객코드              */
    v_Pic_Set        IN RTCS0209.PIC_SET%TYPE,            /*고객명                */
    v_Reg_Id         IN RTCS0209.REG_ID%TYPE,         /*교체예정일자          */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0209
    SET    DEL_YN           = 'Y'
    WHERE  ORD_NO           = v_Ord_No
    AND    DLVR_DAY         = v_Dlvr_Day
    AND    DLVR_TYPE        = v_Dlvr_Type
    AND    SERV_CD          = v_Serv_Cd
--    AND    SERV_SEQ         = v_Serv_Seq          --[20211112-0001]
    AND    PIC_SET          = v_Pic_Set;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0209;
  
  /*****************************************************************************
  -- 마모파손보증 부여/신청 첨부이미지 부여순번 획득
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.8        2020-10-05  kstka             [20201005_01] 신규 생성
  *****************************************************************************/
  FUNCTION f_sRtcs0209DlvrSeq(
    v_Ord_No       IN RTCS0209.ORD_NO%TYPE,          /*주문번호        */
    v_Serv_Cd      IN RTCS0209.SERV_CD%TYPE          /*서비스코드      */
    ) RETURN NUMBER IS
    v_Dlvr_Seq RTCS0209.SEQ%TYPE;                  /*순번                */
  BEGIN

    SELECT  NVL((SELECT  MAX(SEQ)
                 FROM    RTCS0209
                 WHERE   ORD_NO = v_Ord_No
                 AND     SERV_CD = v_Serv_Cd)+ 1, 1) AS DLVR_SEQ
    INTO    v_Dlvr_Seq
    FROM    DUAL;

    RETURN v_Dlvr_Seq;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;

  END f_sRtcs0209DlvrSeq;
  
  /*****************************************************************************
  -- 마모파손서비스 부여/신청 첨부이미지 관리(IUD)
  REVISIONS
  Ver        Date        Author           Description
  ---------  ----------  ---------------  -------------------------------------
  1.0.1      2020-10-14  wjim             [20201014-0001]                                                                         
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0209 (
    v_Comm_Dvsn      IN CHAR,                         /*1 처리구분(I,U,D)       */
    v_Ord_No         IN RTCS0209.ORD_NO%TYPE,         /*배송신청일자          */
    v_Dlvr_Day       IN RTCS0209.DLVR_DAY%TYPE,      /*순번                  */
    v_Dlvr_Type      IN RTCS0209.DLVR_TYPE%TYPE,      /*순번                  */
    v_Serv_Cd        IN RTCS0209.SERV_CD%TYPE,        /*계약번호              */
    v_Serv_Seq       IN RTCS0209.SERV_SEQ%TYPE,       /*고객코드              */
    v_Seq            IN RTCS0209.SEQ%TYPE,            /*고객코드              */
    v_File_Path      IN RTCS0209.FILE_PATH%TYPE,      /*대리점                */
    v_File_Name      IN RTCS0209.FILE_NAME%TYPE,      /**/
    v_Conf_Yn        IN RTCS0209.CONF_YN%TYPE,        /**/
    v_Pic_Set        IN RTCS0209.PIC_SET%TYPE,        /**/
    v_Reg_Id         IN RTCS0209.REG_ID%TYPE,         /*교체예정일자          */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
    
    e_Error         EXCEPTION;
    
    v_Seq_New RTCS0209.SEQ%TYPE;
  BEGIN  

    IF v_Comm_Dvsn = 'I' THEN
    
        IF 0 != f_DeleteRtcs0209(v_Ord_No, v_Dlvr_Day ,v_Dlvr_Type, v_Serv_Cd , v_Serv_Seq, v_Pic_Set,
                                 v_Reg_Id ,v_ErrorText) THEN
            v_Return_Message := '마모파손서비스 부여 내역 삭제 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
            
        -- 순번 획득
        v_Seq_New := f_sRtcs0209DlvrSeq(v_Ord_No, v_Serv_Cd);
    
        IF 0 != f_InsertRtcs0209(v_Ord_No, v_Dlvr_Day ,v_Dlvr_Type, v_Serv_Cd , v_Serv_Seq,
                                 v_Seq_New, v_File_Path ,v_File_Name ,CASE WHEN v_Conf_Yn = '1' THEN 'Y' ELSE 'N' END , v_Pic_Set, 
                                 v_Reg_Id ,v_ErrorText) THEN
            v_Return_Message := '마모파손서비스 신청 내역 등록 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;      
        
    ELSIF v_Comm_Dvsn IN ('U','D') THEN
        

        IF v_Comm_Dvsn = 'U' THEN                   
            
            IF 0 != f_UpdateRtcs0209(v_Ord_No, v_Dlvr_Day ,v_Dlvr_Type, v_Serv_Cd , v_Serv_Seq,
                                     v_Seq, CASE WHEN v_Conf_Yn = '1' THEN 'Y' ELSE 'N' END ,v_Pic_Set, v_Reg_Id ,
                                     v_ErrorText) THEN
                v_Return_Message := '마모파손서비스 부여 내역 수정 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;     
            
        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtcs0209(v_Ord_No, v_Dlvr_Day ,v_Dlvr_Type, v_Serv_Cd , v_Serv_Seq,
                                     v_Pic_Set, v_Reg_Id ,
                                     v_ErrorText) THEN
                v_Return_Message := '마모파손서비스 부여 내역 삭제 실패!!!'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;

        END IF;

    ELSE
        v_Return_Message := '처리구분(I,U,D)값 오류!!!['||v_Comm_Dvsn||']';
        RAISE e_Error;
    END IF;    

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);

    END p_IUDRtcs0209;
    
END Pkg_Rtcs0209;
/