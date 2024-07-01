CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0120
AS
   /*******************************************************************************
      NAME      Pkg_Rtre0120
      PURPOSE   [RE] 이연대상 내역 관리

      REVISIONS
      Ver        Date        Author           Description
      ---------  ----------  ---------------  -------------------------------------
      1.0        2015-09-16  choidh           1. Created this package body.
      1.1        2016-04-28  이영근           걱정제로 감가상각 출고기준 처리, 당원신청건 처리      
      1.2        2016-05-13  이영근           2본씩 별도 신청한 경우에도 걱정제로 서비스 부과      
      1.3        2016-12-01  wjim             [20161201_01] 트럭용 6본 걱정제로 감가상각 처리
      1.4        2017-01-30  wjim             [20170130_01] 2+1 적용에 따른 감가상각 이연처리 변경
      1.5        2018-09-30  wjim             [20180920_01] 실제 출고제품으로 감가상각 처리
      1.6        2019-04-01  wjim             [20190401_01] 장착당월 중도완납(해지)의 경우 감가비이연구분 기준 변경
      1.7        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
      1.8        2020-01-14  rentaldev        [20200114_01] 걱정제로 충당 이연 로직 변경, 이연변경 로직 분리
   *******************************************************************************/

   /*****************************************************************************
   -- [RE] 이연대상 내역 Count
   *****************************************************************************/
   FUNCTION f_sRtre0120Count (v_Ord_No     IN RTRE0120.ORD_NO%TYPE, /*계약번호            */
                              v_Postp_Tp   IN RTRE0120.POSTP_TP%TYPE /*이연항목            */
                                                                    )
      RETURN NUMBER
   IS
      v_curr_cunt   NUMBER DEFAULT 0;
   BEGIN
      SELECT COUNT (*)
        INTO v_curr_cunt
        FROM RTRE0120
       WHERE ORD_NO = v_Ord_No AND POSTP_TP = v_Postp_Tp;

      RETURN v_curr_cunt;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END f_sRtre0120Count;


   /*****************************************************************************
   -- [RE] 이연대상 내역 Count(마감월 기처리 확인용)
   *****************************************************************************/
   FUNCTION f_sRtre0120Pstr_YmCount (v_Pstr_Ym    IN RTRE0120.PSTR_YM%TYPE, /*이연시작월            */
                                     v_Postp_Tp   IN RTRE0120.POSTP_TP%TYPE /*이연항목              */
                                                                           )
      RETURN NUMBER
   IS
      v_curr_cunt   NUMBER DEFAULT 0;
   BEGIN
      SELECT COUNT (*)
        INTO v_curr_cunt
        FROM RTRE0120
       WHERE PSTR_YM = v_Pstr_Ym AND POSTP_TP = v_Postp_Tp AND ROWNUM = 1;

      RETURN v_curr_cunt;
   EXCEPTION
      WHEN OTHERS
      THEN
         RETURN 0;
   END f_sRtre0120Pstr_YmCount;


   /*****************************************************************************
   -- [RE] 이연대상 내역 Select
   *****************************************************************************/
   PROCEDURE p_sRtre0120 (Ref_Cursor    IN OUT SYS_REFCURSOR,
                          v_Ord_No      IN     RTRE0120.ORD_NO%TYPE, /*계약번호              */
                          v_Postp_Tp    IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
                          v_Pstr_Ym     IN     RTRE0120.PSTR_YM%TYPE, /*이연시작월            */
                          v_Pend_Ym     IN     RTRE0120.PEND_YM%TYPE, /*이연종료월            */
                          v_Pptrm       IN     RTRE0120.PPTRM%TYPE, /*이연기간              */
                          v_Acq_Amt     IN     RTRE0120.ACQ_AMT%TYPE, /*이연처리대상금액      */
                          v_Res_Amt     IN     RTRE0120.RES_AMT%TYPE, /*잔존가액              */
                          v_Mpp_Amt     IN     RTRE0120.MPP_AMT%TYPE, /*월이연처리금액        */
                          v_Lpp_Amt     IN     RTRE0120.LPP_AMT%TYPE, /*막달 이연처리금액     */
                          v_Prost_Tp    IN     RTRE0120.PROST_TP%TYPE, /*처리구분              */
                          v_Chan_Cd     IN     RTRE0120.CHAN_CD%TYPE, /*채널구분              */
                          v_Agency_Cd   IN     RTRE0120.AGENCY_CD%TYPE, /*취득조직              */
                          v_Cust_Tp     IN     RTRE0120.CUST_TP%TYPE, /*고객유형              */
                          v_Mat_Cd      IN     RTRE0120.MAT_CD%TYPE, /*상품코드              */
                          v_Ord_Qty     IN     RTRE0120.ORD_QTY%TYPE, /*장착갯수              */
                          v_Pp_Stat     IN     RTRE0120.PP_STAT%TYPE, /*이연대상상태          */
                          v_Ppch_Ym     IN     RTRE0120.PPCH_YM%TYPE, /*이연대상상태변경년월  */
                          v_Reg_Id      IN     RTRE0120.REG_ID%TYPE /*등록자 ID             */
                                                                   )
   IS
   BEGIN
      OPEN Ref_Cursor FOR
         SELECT A.ORD_NO,                                 /*계약번호            */
                A.POSTP_TP,                               /*이연항목            */
                A.PSTR_YM,                                 /*이연시작월          */
                A.PEND_YM,                                 /*이연종료월          */
                A.PPTRM,                                  /*이연기간            */
                A.ACQ_AMT,                                    /*이연처리대상금액    */
                A.RES_AMT,                                /*잔존가액            */
                A.MPP_AMT,                                   /*월이연처리금액      */
                A.LPP_AMT,                                    /*막달 이연처리금액   */
                A.PROST_TP,                               /*처리구분            */
                A.CHAN_CD,                                /*채널구분            */
                A.AGENCY_CD,                              /*취득조직            */
                A.CUST_TP,                                /*고객유형            */
                A.MAT_CD,                                 /*상품코드            */
                A.ORD_QTY,                                /*장착갯수            */
                A.PP_STAT,                                  /*이연대상상태        */
                A.PPCH_YM,                                      /*이연대상상태변경년월*/
                A.REG_ID,                                /*등록자 ID           */
                A.REG_DT,                                /*등록일              */
                A.CHG_ID,                                /*변경자 ID           */
                A.CHG_DT                                 /*변경일              */
           FROM RTRE0120 A
          WHERE     A.ORD_NO = DECODE (v_Ord_No, NULL, A.ORD_NO, v_Ord_No)
                AND A.POSTP_TP =
                       DECODE (v_Postp_Tp, NULL, A.POSTP_TP, v_Postp_Tp)
                AND A.PSTR_YM =
                       DECODE (v_Pstr_Ym, NULL, A.PSTR_YM, v_Pstr_Ym)
                AND A.PEND_YM =
                       DECODE (v_Pend_Ym, NULL, A.PEND_YM, v_Pend_Ym)
                AND A.PPTRM = DECODE (v_Pptrm, NULL, A.PPTRM, v_Pptrm)
                AND A.ACQ_AMT =
                       DECODE (v_Acq_Amt, NULL, A.ACQ_AMT, v_Acq_Amt)
                AND A.RES_AMT =
                       DECODE (v_Res_Amt, NULL, A.RES_AMT, v_Res_Amt)
                AND A.MPP_AMT =
                       DECODE (v_Mpp_Amt, NULL, A.MPP_AMT, v_Mpp_Amt)
                AND A.LPP_AMT =
                       DECODE (v_Lpp_Amt, NULL, A.LPP_AMT, v_Lpp_Amt)
                AND A.PROST_TP =
                       DECODE (v_Prost_Tp, NULL, A.PROST_TP, v_Prost_Tp)
                AND A.CHAN_CD =
                       DECODE (v_Chan_Cd, NULL, A.CHAN_CD, v_Chan_Cd)
                AND A.AGENCY_CD =
                       DECODE (v_Agency_Cd, NULL, A.AGENCY_CD, v_Agency_Cd)
                AND A.CUST_TP =
                       DECODE (v_Cust_Tp, NULL, A.CUST_TP, v_Cust_Tp)
                AND A.MAT_CD = DECODE (v_Mat_Cd, NULL, A.MAT_CD, v_Mat_Cd)
                AND A.ORD_QTY =
                       DECODE (v_Ord_Qty, NULL, A.ORD_QTY, v_Ord_Qty)
                AND A.PP_STAT =
                       DECODE (v_Pp_Stat, NULL, A.PP_STAT, v_Pp_Stat)
                AND A.PPCH_YM =
                       DECODE (v_Ppch_Ym, NULL, A.PPCH_YM, v_Ppch_Ym)
                AND A.REG_ID = DECODE (v_Reg_Id, NULL, A.REG_ID, v_Reg_Id);
   END p_sRtre0120;

   /*****************************************************************************
   -- [RE] 이연대상 내역 Insert
   *****************************************************************************/
   FUNCTION f_InsertRtre0120 (v_Ord_No      IN     RTRE0120.ORD_NO%TYPE, /*계약번호              */
                              v_Postp_Tp    IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
                              v_Pstr_Ym     IN     RTRE0120.PSTR_YM%TYPE, /*이연시작월            */
                              v_Pend_Ym     IN     RTRE0120.PEND_YM%TYPE, /*이연종료월            */
                              v_Pptrm       IN     RTRE0120.PPTRM%TYPE, /*이연기간              */
                              v_Acq_Amt     IN     RTRE0120.ACQ_AMT%TYPE, /*이연처리대상금액      */
                              v_Res_Amt     IN     RTRE0120.RES_AMT%TYPE, /*잔존가액              */
                              v_Mpp_Amt     IN     RTRE0120.MPP_AMT%TYPE, /*월이연처리금액        */
                              v_Lpp_Amt     IN     RTRE0120.LPP_AMT%TYPE, /*막달 이연처리금액     */
                              v_Prost_Tp    IN     RTRE0120.PROST_TP%TYPE, /*처리구분              */
                              v_Chan_Cd     IN     RTRE0120.CHAN_CD%TYPE, /*채널구분              */
                              v_Agency_Cd   IN     RTRE0120.AGENCY_CD%TYPE, /*취득조직              */
                              v_Cust_Tp     IN     RTRE0120.CUST_TP%TYPE, /*고객유형              */
                              v_Mat_Cd      IN     RTRE0120.MAT_CD%TYPE, /*상품코드              */
                              v_Ord_Qty     IN     RTRE0120.ORD_QTY%TYPE, /*장착갯수              */
                              v_Pp_Stat     IN     RTRE0120.PP_STAT%TYPE, /*이연대상상태          */
                              v_Ppch_Ym     IN     RTRE0120.PPCH_YM%TYPE, /*이연대상상태변경년월  */
                              v_Reg_Id      IN     RTRE0120.REG_ID%TYPE, /*등록자 ID             */
                              v_ErrorText      OUT VARCHAR2)
      RETURN NUMBER
   IS
   BEGIN
      INSERT INTO RTRE0120 (ORD_NO,
                            POSTP_TP,
                            PSTR_YM,
                            PEND_YM,
                            PPTRM,
                            ACQ_AMT,
                            RES_AMT,
                            MPP_AMT,
                            LPP_AMT,
                            PROST_TP,
                            CHAN_CD,
                            AGENCY_CD,
                            CUST_TP,
                            MAT_CD,
                            ORD_QTY,
                            PP_STAT,
                            PPCH_YM,
                            REG_ID,
                            REG_DT,
                            CHG_ID,
                            CHG_DT)
           VALUES (v_Ord_No,
                   v_Postp_Tp,
                   v_Pstr_Ym,
                   v_Pend_Ym,
                   v_Pptrm,
                   v_Acq_Amt,
                   v_Res_Amt,
                   v_Mpp_Amt,
                   v_Lpp_Amt,
                   v_Prost_Tp,
                   v_Chan_Cd,
                   v_Agency_Cd,
                   v_Cust_Tp,
                   v_Mat_Cd,
                   v_Ord_Qty,
                   v_Pp_Stat,
                   v_Ppch_Ym,
                   v_Reg_Id,
                   SYSDATE,
                   v_Reg_Id,
                   SYSDATE);

      RETURN SQLCODE;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         RETURN SQLCODE;
   END f_InsertRtre0120;

   /*****************************************************************************
   -- [RE] 이연대상 내역 Update
   *****************************************************************************/
   FUNCTION f_UpdateRtre0120 (v_Ord_No      IN     RTRE0120.ORD_NO%TYPE, /*계약번호              */
                              v_Postp_Tp    IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
                              v_Pstr_Ym     IN     RTRE0120.PSTR_YM%TYPE, /*이연시작월            */
                              v_Pend_Ym     IN     RTRE0120.PEND_YM%TYPE, /*이연종료월            */
                              v_Pptrm       IN     RTRE0120.PPTRM%TYPE, /*이연기간              */
                              v_Acq_Amt     IN     RTRE0120.ACQ_AMT%TYPE, /*이연처리대상금액      */
                              v_Res_Amt     IN     RTRE0120.RES_AMT%TYPE, /*잔존가액              */
                              v_Mpp_Amt     IN     RTRE0120.MPP_AMT%TYPE, /*월이연처리금액        */
                              v_Lpp_Amt     IN     RTRE0120.LPP_AMT%TYPE, /*막달 이연처리금액     */
                              v_Prost_Tp    IN     RTRE0120.PROST_TP%TYPE, /*처리구분              */
                              v_Chan_Cd     IN     RTRE0120.CHAN_CD%TYPE, /*채널구분              */
                              v_Agency_Cd   IN     RTRE0120.AGENCY_CD%TYPE, /*취득조직              */
                              v_Cust_Tp     IN     RTRE0120.CUST_TP%TYPE, /*고객유형              */
                              v_Mat_Cd      IN     RTRE0120.MAT_CD%TYPE, /*상품코드              */
                              v_Ord_Qty     IN     RTRE0120.ORD_QTY%TYPE, /*장착갯수              */
                              v_Pp_Stat     IN     RTRE0120.PP_STAT%TYPE, /*이연대상상태          */
                              v_Ppch_Ym     IN     RTRE0120.PPCH_YM%TYPE, /*이연대상상태변경년월  */
                              v_Reg_Id      IN     RTRE0120.REG_ID%TYPE, /*등록자 ID             */
                              v_ErrorText      OUT VARCHAR2)
      RETURN NUMBER
   IS
   BEGIN
      UPDATE RTRE0120
         SET PSTR_YM = v_Pstr_Ym,
             PEND_YM = v_Pend_Ym,
             PPTRM = v_Pptrm,
             ACQ_AMT = v_Acq_Amt,
             RES_AMT = v_Res_Amt,
             MPP_AMT = v_Mpp_Amt,
             LPP_AMT = v_Lpp_Amt,
             PROST_TP = v_Prost_Tp,
             CHAN_CD = v_Chan_Cd,
             AGENCY_CD = v_Agency_Cd,
             CUST_TP = v_Cust_Tp,
             MAT_CD = v_Mat_Cd,
             ORD_QTY = v_Ord_Qty,
             PP_STAT = v_Pp_Stat,
             PPCH_YM = v_Ppch_Ym,
             CHG_ID = v_Reg_Id,
             CHG_DT = SYSDATE
       WHERE ORD_NO = v_Ord_No AND POSTP_TP = v_Postp_Tp;

      RETURN SQLCODE;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         RETURN SQLCODE;
   END f_UpdateRtre0120;

   /*****************************************************************************
   -- [RE] 이연대상 내역 Delete
   *****************************************************************************/
   FUNCTION f_DeleteRtre0120 (v_Ord_No      IN     RTRE0120.ORD_NO%TYPE, /*계약번호              */
                              v_Postp_Tp    IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
                              v_Reg_Id      IN     RTRE0120.REG_ID%TYPE, /*등록자 ID             */
                              v_ErrorText      OUT VARCHAR2)
      RETURN NUMBER
   IS
   BEGIN
      DELETE FROM RTRE0120
            WHERE ORD_NO = v_Ord_No AND POSTP_TP = v_Postp_Tp;

      Pkg_Utility.p_ErrorFileWrite ('Pkg_Rtre0037.f_DeleteRtre0120(2)',
                                    '계약번호',
                                    v_Ord_No);
      Pkg_Utility.p_ErrorFileWrite ('Pkg_Rtre0037.f_DeleteRtre0120(2)',
                                    '이연항목',
                                    v_Postp_Tp);
      Pkg_Utility.p_ErrorFileWrite ('Pkg_Rtre0037.f_DeleteRtre0120(2)',
                                    '등록자 ID',
                                    v_Reg_Id);

      RETURN SQLCODE;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         RETURN SQLCODE;
   END f_DeleteRtre0120;

   /*****************************************************************************
   -- [RE] 이연대상 내역 관리(IUD)
   *****************************************************************************/
   PROCEDURE p_IUDRtre0120 (v_Comm_Dvsn        IN     CHAR, /*처리구분(I,U,D)       */
                            v_Ord_No           IN     RTRE0120.ORD_NO%TYPE, /*계약번호              */
                            v_Postp_Tp         IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
                            v_Pstr_Ym          IN     RTRE0120.PSTR_YM%TYPE, /*이연시작월            */
                            v_Pend_Ym          IN     RTRE0120.PEND_YM%TYPE, /*이연종료월            */
                            v_Pptrm            IN     RTRE0120.PPTRM%TYPE, /*이연기간              */
                            v_Acq_Amt          IN     RTRE0120.ACQ_AMT%TYPE, /*이연처리대상금액      */
                            v_Res_Amt          IN     RTRE0120.RES_AMT%TYPE, /*잔존가액              */
                            v_Mpp_Amt          IN     RTRE0120.MPP_AMT%TYPE, /*월이연처리금액        */
                            v_Lpp_Amt          IN     RTRE0120.LPP_AMT%TYPE, /*막달 이연처리금액     */
                            v_Prost_Tp         IN     RTRE0120.PROST_TP%TYPE, /*처리구분              */
                            v_Chan_Cd          IN     RTRE0120.CHAN_CD%TYPE, /*채널구분              */
                            v_Agency_Cd        IN     RTRE0120.AGENCY_CD%TYPE, /*취득조직              */
                            v_Cust_Tp          IN     RTRE0120.CUST_TP%TYPE, /*고객유형              */
                            v_Mat_Cd           IN     RTRE0120.MAT_CD%TYPE, /*상품코드              */
                            v_Ord_Qty          IN     RTRE0120.ORD_QTY%TYPE, /*장착갯수              */
                            v_Pp_Stat          IN     RTRE0120.PP_STAT%TYPE, /*이연대상상태          */
                            v_Ppch_Ym          IN     RTRE0120.PPCH_YM%TYPE, /*이연대상상태변경년월  */
                            v_Reg_Id           IN     RTRE0120.REG_ID%TYPE, /*등록자 ID             */
                            v_Success_Code        OUT NUMBER,
                            v_Return_Message      OUT VARCHAR2,
                            v_ErrorText           OUT VARCHAR2)
   IS
      e_Error   EXCEPTION;
   BEGIN
      -- 필수값: 계약번호, 이연항목, 등록자 ID
      IF (TRIM (v_Ord_No) IS NULL)
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Postp_Tp) IS NULL)
      THEN
         v_Return_Message :=
               '이연항목('
            || v_Postp_Tp
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF v_Comm_Dvsn = 'I'
      THEN
         IF 0 != f_InsertRtre0120 (v_Ord_No,
                                   v_Postp_Tp,
                                   v_Pstr_Ym,
                                   v_Pend_Ym,
                                   v_Pptrm,
                                   v_Acq_Amt,
                                   v_Res_Amt,
                                   v_Mpp_Amt,
                                   v_Lpp_Amt,
                                   v_Prost_Tp,
                                   v_Chan_Cd,
                                   v_Agency_Cd,
                                   v_Cust_Tp,
                                   v_Mat_Cd,
                                   v_Ord_Qty,
                                   v_Pp_Stat,
                                   v_Ppch_Ym,
                                   v_Reg_Id,
                                   v_ErrorText)
         THEN
            v_Return_Message :=
                  '[RE] 이연대상 내역 등록 실패!!!'
               || '-'
               || v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
         END IF;
      ELSIF v_Comm_Dvsn = 'U'
      THEN
         IF 0 != f_UpdateRtre0120 (v_Ord_No,
                                   v_Postp_Tp,
                                   v_Pstr_Ym,
                                   v_Pend_Ym,
                                   v_Pptrm,
                                   v_Acq_Amt,
                                   v_Res_Amt,
                                   v_Mpp_Amt,
                                   v_Lpp_Amt,
                                   v_Prost_Tp,
                                   v_Chan_Cd,
                                   v_Agency_Cd,
                                   v_Cust_Tp,
                                   v_Mat_Cd,
                                   v_Ord_Qty,
                                   v_Pp_Stat,
                                   v_Ppch_Ym,
                                   v_Reg_Id,
                                   v_ErrorText)
         THEN
            v_Return_Message :=
                  '[RE] 이연대상 내역 수정 실패!!!'
               || '-'
               || v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
         END IF;
      ELSIF v_Comm_Dvsn = 'D'
      THEN
         IF 0 != f_DeleteRtre0120 (v_Ord_No,
                                   v_Postp_Tp,
                                   v_Reg_Id,
                                   v_ErrorText)
         THEN
            v_Return_Message :=
                  '[RE] 이연대상 내역 삭제 실패!!!'
               || '-'
               || v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
         END IF;
      ELSE
         v_Return_Message :=
            '처리구분(I,U,D)값 오류!!![' || v_Comm_Dvsn || ']';
         RAISE e_Error;
      END IF;



      v_Success_code := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText := '';
   --COMMIT;

   EXCEPTION
      WHEN e_Error
      THEN
         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
--         Pkg_Utility.p_ErrorFileWrite ('Pkg_Rtre0120.p_IUDRtre0120(1)',
--                                       v_ErrorText,
--                                       v_Return_Message);
      WHEN OTHERS
      THEN
         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
--         Pkg_Utility.p_ErrorFileWrite ('Pkg_Rtre0120.p_IUDRtre0120(2)',
--                                       v_ErrorText,
--                                       v_Return_Message);
   END p_IUDRtre0120;


   /*****************************************************************************
   -- [RE] 이연대상 내역 생성 처리
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120Postpone (
      v_Ord_No           IN     RTRE0120.ORD_NO%TYPE,   /*계약번호              */
      v_Postp_Tp         IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
      v_Pstr_Ym          IN     RTRE0120.PSTR_YM%TYPE,   /*이연시작월            */
      v_Pptrm            IN     RTRE0120.PPTRM%TYPE,    /*이연기간              */
      v_Acq_Amt          IN     RTRE0120.ACQ_AMT%TYPE,      /*이연처리대상금액      */
      v_Res_Amt          IN     RTRE0120.RES_AMT%TYPE,  /*잔존가액              */
      v_Prost_Tp         IN     RTRE0120.PROST_TP%TYPE, /*처리구분              */
      v_Chan_Cd          IN     RTRE0120.CHAN_CD%TYPE,  /*채널구분              */
      v_Agency_Cd        IN     RTRE0120.AGENCY_CD%TYPE, /*취득조직              */
      v_Cust_Tp          IN     RTRE0120.CUST_TP%TYPE,  /*고객유형              */
      v_Mat_Cd           IN     RTRE0120.MAT_CD%TYPE,   /*상품코드              */
      v_Ord_Qty          IN     RTRE0120.ORD_QTY%TYPE,  /*장착갯수              */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      e_Error        EXCEPTION;

      v_Chan_Cd1     RTSD0108.CHAN_CD%TYPE DEFAULT NULL;
      v_Agency_Cd1   RTSD0108.AGENCY_CD%TYPE DEFAULT NULL;
      v_Ord_Qty1     RTSD0108.CNT_CD%TYPE DEFAULT NULL;
      v_Cust_Tp1     RTSD0100.CUST_TP%TYPE DEFAULT NULL;
      v_Mat_Cd1      RTCS0001.MAT_CD%TYPE DEFAULT NULL;

      v_Pend_Ym      RTRE0120.PEND_YM%TYPE DEFAULT NULL;
      v_Mpp_Amt      RTRE0120.MPP_AMT%TYPE DEFAULT NULL;
      v_Lpp_Amt      RTRE0120.LPP_AMT%TYPE DEFAULT NULL;
      v_Pp_Stat      RTRE0120.PP_STAT%TYPE DEFAULT NULL;
      v_Ppch_Ym      RTRE0120.PPCH_YM%TYPE DEFAULT NULL;

      v_Postp_Seq    RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
      v_Postp_Stat   RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
      v_Postp_Ym     RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
      v_Ly_Tpp_Amt   RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
      v_Cy_Pp_Amt    RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
      v_Cy_Tpp_Amt   RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
      v_Cm_Pp_Amt    RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
      v_Cm_R_Amt     RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;
   BEGIN
      -- 필수값: 계약번호, 이연항목, 이연시작월, 이연기간, 이연처리대상금액, 잔존가액,
      -- 처리구분, 채널구분, 취득조직, 고객유형, 상품코드, 장착갯수, 등록자 ID
      IF    (TRIM (v_Ord_No) IS NULL)
         OR Pkg_Rtsd0108.f_sRtsd0108Count (v_Ord_No) = 0
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Postp_Tp) IS NULL)
      THEN
         v_Return_Message :=
               '이연항목('
            || v_Postp_Tp
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Pstr_Ym) IS NULL)
      THEN
         v_Return_Message :=
               '이연시작월('
            || v_Pstr_Ym
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Pptrm) IS NULL) OR v_Pptrm = 0
      THEN
         v_Return_Message :=
               '이연기간('
            || v_Pptrm
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Acq_Amt) IS NULL) OR v_Acq_Amt = 0
      THEN
         v_Return_Message :=
               '이연처리대상금액('
            || v_Acq_Amt
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!(계약번호:'||v_Ord_No|| '-' || v_Mat_Cd ||', ERR CODE: 78532)';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Res_Amt) IS NULL)
      THEN
         v_Return_Message :=
               '잔존가액('
            || v_Res_Amt
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Prost_Tp) IS NULL)
      THEN
         v_Return_Message :=
               '처리구분('
            || v_Prost_Tp
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Chan_Cd) IS NULL)
      THEN
         v_Return_Message :=
               '채널구분('
            || v_Chan_Cd
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Agency_Cd) IS NULL) AND (TRIM (V_CHAN_CD) <> '02')
      THEN
         v_Return_Message :=
               '취득조직('
            || v_Agency_Cd
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Cust_Tp) IS NULL)
      THEN
         v_Return_Message :=
               '고객유형('
            || v_Cust_Tp
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Mat_Cd) IS NULL)
      THEN
         v_Return_Message :=
               '상품코드('
            || v_Ord_No || v_Mat_Cd
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Ord_Qty) IS NULL) OR v_Ord_Qty = 0
      THEN
         v_Return_Message :=
               '장착갯수('
            || v_Ord_Qty
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;


      --  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Chan_Cd1);

      -- 주문 check
      v_Ord_Qty1 := 0;
      v_Mat_Cd1 := '';

      BEGIN
         SELECT A.CHAN_CD,
                DECODE (
                   v_Postp_Tp,
                   '08', A.AGENCY_CD,
                   DECODE (
                      A.CHAN_CD,
                      '01', A.AGENCY_CD,
                      DECODE (A.CHAN_CD, '05', A.AGENCY_CD, A.ORD_AGENT)))
                   AGENCY_CD,
                A.CNT_CD ORD_QTY,
                NVL (NVL(TRIM(C.MATNR_S), B.MAT_CD), '') MAT_CD
           INTO v_Chan_Cd1,
                v_Agency_Cd1,
                v_Ord_Qty1,
                v_Mat_Cd1
           FROM RTSD0108 A, RTCS0001 B, RTSD0115 C
          WHERE A.ORD_NO = v_Ord_No AND A.ORD_NO = B.ORD_NO(+)
          AND A.ORD_NO = C.ORD_NO(+) AND C.TRANS_TP(+) = 'N' AND ROWNUM = 1;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK;
            v_Success_code := -1;
            v_Return_Message :=
                  '계약번호('
               || v_Ord_No
               || ') : 가 존재하지 않아 처리가 불가 합니다!';
            v_ErrorText :=
               SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite (
               'Pkg_Rtre0120.p_CreateRtre0120Postpone(1)',
               v_ErrorText,
               v_Return_Message);
      END;



      --  DBMS_OUTPUT.Put_Line('v_Chan_Cd = ' || v_Chan_Cd || ',  v_Chan_Cd1 = ' || v_Chan_Cd1);

      IF v_Ord_Qty1 = 0
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 의 주문장착의 갯수 수량이 0 입니다. 처리할 수 없습니다!(ERR CODE:45FOR3)';
         RAISE e_Error;
      ELSIF v_Chan_Cd1 <> v_Chan_Cd
      THEN
         v_Return_Message :=
               '채널구분('
            || v_Chan_Cd
            || '-'
            || v_Chan_Cd1
            || ') : 이주문과 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      ELSIF v_Agency_Cd1 <> v_Agency_Cd
      THEN
         v_Return_Message :=
               '취득조직('
            || v_Agency_Cd
            || '-'
            || v_Agency_Cd1
            || ') : 이주문과 맞지않아 처리할 수 없습니다! ' || v_Ord_No;
         RAISE e_Error;
      ELSIF v_Ord_Qty1 <> v_Ord_Qty
      THEN
         v_Return_Message :=
               '장착갯수('
            || v_Ord_Qty
            || '-'
            || v_Ord_Qty1
            || ') : 가 주문과 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      ELSIF v_Mat_Cd1 <> v_Mat_Cd
      THEN
         v_Return_Message :=
               '상품코드('
            || v_Ord_No
            || '-'
            || v_Mat_Cd
            || '-'
            || v_Mat_Cd1
            || ') : 가 설치와 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      END IF;

      -- 장착정보 check
      v_Cust_Tp1 := '';

      BEGIN
         SELECT NVL (B.CUST_TP, '') CUST_TP
           INTO v_Cust_Tp1
           FROM RTSD0108 A, RTSD0100 B
          WHERE     A.ORD_NO = v_Ord_No
                AND A.CUST_NO = B.CUST_NO(+)
                AND ROWNUM = 1;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK;
            v_Success_code := -1;
            v_Return_Message :=
                  '계약번호('
               || v_Ord_No
               || ') : 의 장착정보가 존재하지 않아 처리가 불가 합니다!';
            v_ErrorText :=
               SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite (
               'Pkg_Rtre0120.p_CreateRtre0120Postpone(1)',
               v_ErrorText,
               v_Return_Message);
      END;


      IF v_Cust_Tp1 <> v_Cust_Tp
      THEN
         v_Return_Message :=
               '고객유형('
            || v_Cust_Tp
            || '-'
            || v_Cust_Tp1
            || ') : 가 장착정보와 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      END IF;


      v_Postp_Seq := 1;
      v_Ly_Tpp_Amt := 0;
      v_Cy_Pp_Amt := 0;
      v_Cy_Tpp_Amt := 0;
      v_Cm_Pp_Amt := 0;

      LOOP
         IF v_Postp_Seq = 1
         THEN                                                     -- MASTER 생성
            -- 이연종료월
            v_Pend_Ym :=
               TO_CHAR (
                  ADD_MONTHS (TO_DATE (v_Pstr_Ym, 'YYYYMM'), (v_Pptrm - 1)),
                  'YYYYMM');
            -- 월처리금액
            v_Mpp_Amt := TRUNC ( (v_Acq_Amt - v_Res_Amt) / v_Pptrm, 0);
            -- 마지막달 처리금액
            v_Lpp_Amt := (v_Acq_Amt - v_Res_Amt) - v_Mpp_Amt * (v_Pptrm - 1);
            v_Pp_Stat := 'A';
            v_Ppch_Ym := v_Pstr_Ym;

            --            IF 0 != f_InsertRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
            --                                      v_Pptrm,   v_Acq_Amt,  v_Res_Amt, v_Mpp_Amt,
            --                                      v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
            --                                      v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
            --                                      v_Ppch_Ym, v_Reg_Id,   v_ErrorText
            IF 0 != f_InsertRtre0120 (v_Ord_No,
                                      v_Postp_Tp,
                                      v_Pstr_Ym,
                                      v_Pend_Ym,
                                      v_Pptrm,
                                      v_Acq_Amt,
                                      v_Res_Amt,
                                      v_Mpp_Amt,
                                      v_Lpp_Amt,
                                      v_Prost_Tp,
                                      v_Chan_Cd,
                                      v_Agency_Cd,
                                      v_Cust_Tp,
                                      v_Mat_Cd,
                                      v_Ord_Qty,
                                      v_Pp_Stat,
                                      v_Ppch_Ym,
                                      v_Reg_Id,
                                      v_ErrorText)
            THEN
               v_Return_Message :=
                     '계약번호('
                  || v_Ord_No
                  || ')[RE] 이연대상 MASTER 등록 실패!!!'
                  || '-'
                  || v_Errortext;
               v_Errortext := v_Errortext;
               RAISE e_Error;
            END IF;
         END IF;

         -- 이연상태
         IF v_Postp_Seq = 1
         THEN                                                           -- 1차분
            v_Postp_Stat := 'N';
            -- 대상년월 시작
            v_Postp_Ym := v_Pstr_Ym;
         ELSE
            --  대상년월 ADD
            v_Postp_Ym :=
               TO_CHAR (ADD_MONTHS (TO_DATE (v_Postp_Ym, 'YYYYMM'), 1),
                        'YYYYMM');

            IF v_Postp_Seq = 60
            THEN                                                    -- 소유권인 경우
               v_Postp_Stat := 'O';                                   -- 소유권이전
            ELSE
               v_Postp_Stat := 'A';                                      -- 기존
            END IF;
         END IF;

         -- 전기말 누적액
         IF SUBSTR (v_Postp_Ym, 1, 4) <>
               TO_CHAR (ADD_MONTHS (TO_DATE (v_Postp_Ym, 'YYYYMM'), -1),
                        'YYYY')
         THEN
            v_Ly_Tpp_Amt := v_Cy_Tpp_Amt;                   -- 다른 년도면 전년까지 누적분
         ELSE
            v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;                         -- 같은 년도는 동일
         END IF;

         -- 당월 처리금액
         IF v_Postp_Seq <> v_Pptrm
         THEN
            v_Cm_Pp_Amt := v_Mpp_Amt;
         ELSE                                                           -- 최종분
            v_Cm_Pp_Amt := v_Lpp_Amt;
         END IF;

         -- 당기 처리액
         IF SUBSTR (v_Postp_Ym, 1, 4) <>
               TO_CHAR (ADD_MONTHS (TO_DATE (v_Postp_Ym, 'YYYYMM'), -1),
                        'YYYY')
         THEN
            v_Cy_Pp_Amt := v_Cm_Pp_Amt;                             -- 첫달은 당월분
         ELSE
            v_Cy_Pp_Amt := v_Cy_Pp_Amt + v_Cm_Pp_Amt;             -- 같은 년도면 누적
         END IF;

         -- 당기 총 누적액
         v_Cy_Tpp_Amt := v_Ly_Tpp_Amt + v_Cy_Pp_Amt;        -- 전기말 누적액 + 당기처리액

         -- 당월 잔존가액
         v_Cm_R_Amt := v_Acq_Amt - v_Cy_Tpp_Amt;            -- 전체금액 - 당기 총 누적액


         --        IF 0 != f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
         --                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
         --                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText
         IF 0 != Pkg_Rtre0125.f_InsertRtre0125 (v_Ord_No,
                                                v_Postp_Tp,
                                                v_Postp_Seq,
                                                v_Postp_Stat,
                                                v_Postp_Ym,
                                                v_Ly_Tpp_Amt,
                                                v_Cy_Pp_Amt,
                                                v_Cy_Tpp_Amt,
                                                v_Cm_Pp_Amt,
                                                v_Cm_R_Amt,
                                                v_Reg_Id,
                                                v_ErrorText)
         THEN
            v_Return_Message :=
                  '계약번호('
               || v_Ord_No
               || ') 순번('
               || v_Postp_Seq
               || ')[RE] 이연처리 월별내역 등록 실패!!!'
               || '-'
               || v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
         END IF;


         v_Postp_Seq := v_Postp_Seq + 1;
         EXIT WHEN v_Postp_Seq > v_Pptrm;
      END LOOP;



      v_Success_code := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText := '';
   --COMMIT;

   EXCEPTION
      WHEN e_Error
      THEN
         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120Postpone(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120Postpone(2)',
            v_ErrorText,
            v_Return_Message);
   END p_CreateRtre0120Postpone;

   /*****************************************************************************
    -- [RE] 이연대상 내역 생성 처리--걱정제로 관련
    *****************************************************************************/
   PROCEDURE p_CreateRtre0120ZeroPostpone (
      v_Ord_No           IN     RTRE0120.ORD_NO%TYPE,   /*계약번호              */
      v_Postp_Tp         IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
      v_Pstr_Ym          IN     RTRE0120.PSTR_YM%TYPE,   /*이연시작월            */
      v_Pptrm            IN     RTRE0120.PPTRM%TYPE,    /*이연기간              */
      v_Acq_Amt          IN     RTRE0120.ACQ_AMT%TYPE,      /*이연처리대상금액      */
      v_Res_Amt          IN     RTRE0120.RES_AMT%TYPE,  /*잔존가액              */
      v_Prost_Tp         IN     RTRE0120.PROST_TP%TYPE, /*처리구분              */
      v_Chan_Cd          IN     RTRE0120.CHAN_CD%TYPE,  /*채널구분              */
      v_Agency_Cd        IN     RTRE0120.AGENCY_CD%TYPE, /*취득조직              */
      v_Cust_Tp          IN     RTRE0120.CUST_TP%TYPE,  /*고객유형              */
      v_Mat_Cd           IN     RTRE0120.MAT_CD%TYPE,   /*상품코드              */
      v_Ord_Qty          IN     RTRE0120.ORD_QTY%TYPE,  /*장착갯수              */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      e_Error        EXCEPTION;

      v_Chan_Cd1     RTSD0108.CHAN_CD%TYPE DEFAULT NULL;
      v_Agency_Cd1   RTSD0108.AGENCY_CD%TYPE DEFAULT NULL;
      v_Ord_Qty1     RTRE0120.ORD_QTY%TYPE DEFAULT NULL;
      v_Cust_Tp1     RTSD0100.CUST_TP%TYPE DEFAULT NULL;
      v_Mat_Cd1      RTCS0001.MAT_CD%TYPE DEFAULT NULL;

      v_Pend_Ym      RTRE0120.PEND_YM%TYPE DEFAULT NULL;
      v_Mpp_Amt      RTRE0120.MPP_AMT%TYPE DEFAULT NULL;
      v_Lpp_Amt      RTRE0120.LPP_AMT%TYPE DEFAULT NULL;
      v_Pp_Stat      RTRE0120.PP_STAT%TYPE DEFAULT NULL;
      v_Ppch_Ym      RTRE0120.PPCH_YM%TYPE DEFAULT NULL;

      v_Postp_Seq    RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
      v_Postp_Stat   RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
      v_Postp_Ym     RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
      v_Ly_Tpp_Amt   RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
      v_Cy_Pp_Amt    RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
      v_Cy_Tpp_Amt   RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
      v_Cm_Pp_Amt    RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
      v_Cm_R_Amt     RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;
      v_Acq_Amt_R    RTRE0120.ACQ_AMT%TYPE;
   BEGIN
      -- 필수값: 계약번호, 이연항목, 이연시작월, 이연기간, 이연처리대상금액, 잔존가액,
      -- 처리구분, 채널구분, 취득조직, 고객유형, 상품코드, 장착갯수, 등록자 ID
      IF    (TRIM (v_Ord_No) IS NULL)
         OR Pkg_Rtsd0108.f_sRtsd0108Count (v_Ord_No) = 0
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Postp_Tp) IS NULL)
      THEN
         v_Return_Message :=
               '이연항목('
            || v_Postp_Tp
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Pstr_Ym) IS NULL)
      THEN
         v_Return_Message :=
               '이연시작월('
            || v_Pstr_Ym
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Pptrm) IS NULL) OR v_Pptrm = 0
      THEN
         v_Return_Message :=
               '이연기간('
            || v_Pptrm
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Acq_Amt) IS NULL) OR v_Acq_Amt = 0
      THEN
         v_Return_Message :=
               '이연처리대상금액('
            || v_Acq_Amt
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!(ERR CODE: 86902)';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Res_Amt) IS NULL)
      THEN
         v_Return_Message :=
               '잔존가액('
            || v_Res_Amt
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Prost_Tp) IS NULL)
      THEN
         v_Return_Message :=
               '처리구분('
            || v_Prost_Tp
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Chan_Cd) IS NULL)
      THEN
         v_Return_Message :=
               '채널구분('
            || v_Chan_Cd
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Agency_Cd) IS NULL) AND (TRIM (V_CHAN_CD) <> '02')
      THEN
         v_Return_Message :=
               '취득조직('
            || v_Agency_Cd
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Cust_Tp) IS NULL)
      THEN
         v_Return_Message :=
               '고객유형('
            || v_Cust_Tp
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Mat_Cd) IS NULL)
      THEN
         v_Return_Message :=
               '상품코드('
            || v_Mat_Cd
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Ord_Qty) IS NULL) OR v_Ord_Qty = 0
      THEN
         v_Return_Message :=
               '장착갯수('
            || v_Ord_Qty
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;


      --  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Chan_Cd1);

      -- 주문 check
      v_Ord_Qty1 := 0;
      v_Mat_Cd1 := '';

      BEGIN
         SELECT A.CHAN_CD,
                DECODE (
                   v_Postp_Tp,
                   '08', A.AGENCY_CD,
                   DECODE (
                      A.CHAN_CD,
                      '01', A.AGENCY_CD,
                      DECODE (A.CHAN_CD, '05', A.AGENCY_CD, A.ORD_AGENT)))
                   AGENCY_CD,
                --DECODE (A.CNT_CD, '04', '01', A.CNT_CD) ORD_QTY,
                TO_NUMBER(A.CNT_CD) AS ORD_QTY, -- 2016-05-13 이영근, 장착수량으로 변경
                NVL (NVL(TRIM(C.MATNR_S), B.MAT_CD), '') MAT_CD
           INTO v_Chan_Cd1,
                v_Agency_Cd1,
                v_Ord_Qty1,
                v_Mat_Cd1
           FROM RTSD0108 A, RTCS0001 B, RTSD0115 C
          WHERE     A.ORD_NO = v_Ord_No
                AND A.ORD_NO = B.ORD_NO(+)
                AND A.ORD_NO = C.ORD_NO(+)
                AND C.TRANS_TP(+) = 'N'
                --AND A.CNT_CD = '04' -- 2016-05-13 이영근, 4본 기준 제외
                AND ROWNUM = 1;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK;
            v_Success_code := -1;
            v_Return_Message :=
                  '타이어본수 계약번호('
               || v_Ord_No
               || ') : 가 존재하지 않아 처리가 불가 합니다!';
            v_ErrorText :=
               SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite (
               'Pkg_Rtre0120.p_CreateRtre0120ZeroPostpone(1)',
               v_ErrorText,
               v_Return_Message);
      END;



      --  DBMS_OUTPUT.Put_Line('v_Chan_Cd = ' || v_Chan_Cd || ',  v_Chan_Cd1 = ' || v_Chan_Cd1);

      IF v_Ord_Qty1 = 0
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 의 주문장착의 갯수 수량이 0 입니다. 처리할 수 없습니다!(ERR CODE:CR49QL)';
         RAISE e_Error;
      ELSIF v_Chan_Cd1 <> v_Chan_Cd
      THEN
         v_Return_Message :=
               '채널구분('
            || v_Chan_Cd
            || '-'
            || v_Chan_Cd1
            || ') : 이주문과 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      ELSIF v_Agency_Cd1 <> v_Agency_Cd
      THEN
         v_Return_Message :=
               '취득조직('
            || v_Agency_Cd
            || '-'
            || v_Agency_Cd1
            || ') : 이주문과 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      ELSIF v_Ord_Qty1 <> v_Ord_Qty
      THEN
         v_Return_Message :=
               '서비스개수('
            || v_Ord_Qty
            || '-'
            || v_Ord_Qty1
            || ') : 가 주문시 서비스 개수와 과 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      ELSIF v_Mat_Cd1 <> v_Mat_Cd
      THEN
         v_Return_Message :=
               '상품코드('
            || v_Mat_Cd
            || '-'
            || v_Mat_Cd1
            || ') : 가 설치와 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      END IF;

      -- 장착정보 check
      v_Cust_Tp1 := '';

      BEGIN
         SELECT NVL (B.CUST_TP, '') CUST_TP
           INTO v_Cust_Tp1
           FROM RTSD0108 A, RTSD0100 B
          WHERE     A.ORD_NO = v_Ord_No
                AND A.CUST_NO = B.CUST_NO(+)
                --AND A.CNT_CD = '04' -- 2016-05-13 이영근, 4본 기준 제외
                AND ROWNUM = 1;
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK;
            v_Success_code := -1;
            v_Return_Message :=
                  '계약번호('
               || v_Ord_No
               || ') : 의 장착정보가 존재하지 않아 처리가 불가 합니다!';
            v_ErrorText :=
               SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite (
               'Pkg_Rtre0120.p_CreateRtre0120Postpone(1)',
               v_ErrorText,
               v_Return_Message);
      END;


      IF v_Cust_Tp1 <> v_Cust_Tp
      THEN
         v_Return_Message :=
               '고객유형('
            || v_Cust_Tp
            || '-'
            || v_Cust_Tp1
            || ') : 가 장착정보와 맞지않아 처리할 수 없습니다!';
         RAISE e_Error;
      END IF;


      v_Postp_Seq := 1;
      v_Ly_Tpp_Amt := 0;
      v_Cy_Pp_Amt := 0;
      v_Cy_Tpp_Amt := 0;
      v_Cm_Pp_Amt := 0;

      LOOP
         v_Acq_Amt_R := TRUNC (ROUND (v_Acq_Amt / v_Ord_Qty), 0);

         IF v_Postp_Seq = 1
         THEN                                                     -- MASTER 생성
            -- 이연종료월
            v_Pend_Ym :=
               TO_CHAR (
                  ADD_MONTHS (TO_DATE (v_Pstr_Ym, 'YYYYMM'), (v_Pptrm - 1)),
                  'YYYYMM');
            -- 월처리금액
            --v_Mpp_Amt := TRUNC((v_Acq_Amt - v_Res_Amt) / v_Pptrm, 0);   --한나 변경
            v_Mpp_Amt :=
               TRUNC ( (ROUND (v_Acq_Amt / v_Ord_Qty) - v_Res_Amt) / v_Pptrm, 0); --한나 변경 --( 타이어본수자산가 / 타이어본수 )-잔존가액0 / 기간
            -- 마지막달 처리금액
            -- v_Lpp_Amt := (v_Acq_Amt - v_Res_Amt) - v_Mpp_Amt * (v_Pptrm - 1);--한나 변경
            v_Lpp_Amt :=
                 (ROUND (v_Acq_Amt / v_Ord_Qty) - v_Res_Amt)
               - v_Mpp_Amt * (v_Pptrm - 1);                            --한나 변경

            v_Pp_Stat := 'A';
            v_Ppch_Ym := v_Pstr_Ym;

            --            IF 0 != f_InsertRtre0120( v_Ord_No,  v_Postp_Tp, v_Pstr_Ym, v_Pend_Ym,
            --                                      v_Pptrm,   v_Acq_Amt,  v_Res_Amt, v_Mpp_Amt,
            --                                      v_Lpp_Amt, v_Prost_Tp, v_Chan_Cd, v_Agency_Cd,
            --                                      v_Cust_Tp, v_Mat_Cd,   v_Ord_Qty, v_Pp_Stat,
            --                                      v_Ppch_Ym, v_Reg_Id,   v_ErrorText
            IF 0 != f_InsertRtre0120 (v_Ord_No,
                                      v_Postp_Tp,
                                      v_Pstr_Ym,
                                      v_Pend_Ym,
                                      v_Pptrm,
                                      v_Acq_Amt_R,
                                      v_Res_Amt,
                                      v_Mpp_Amt,
                                      v_Lpp_Amt,
                                      v_Prost_Tp,
                                      v_Chan_Cd,
                                      v_Agency_Cd,
                                      v_Cust_Tp,
                                      v_Mat_Cd,
                                      1, -- 2016-06-02 이영근, 걱정제로 서비스는 각 1본씩 부과되므로 강제 지정 
                                      v_Pp_Stat,
                                      v_Ppch_Ym,
                                      v_Reg_Id,
                                      v_ErrorText)
            THEN
               v_Return_Message :=
                     '계약번호('
                  || v_Ord_No
                  || ')[RE] 이연대상 MASTER 등록 실패!!!'
                  || '-'
                  || v_Errortext;
               v_Errortext := v_Errortext;
               RAISE e_Error;
            END IF;
         END IF;

         -- 이연상태
         IF v_Postp_Seq = 1
         THEN                                                           -- 1차분
            v_Postp_Stat := 'N';
            -- 대상년월 시작
            v_Postp_Ym := v_Pstr_Ym;
         ELSE
            --  대상년월 ADD
            v_Postp_Ym :=
               TO_CHAR (ADD_MONTHS (TO_DATE (v_Postp_Ym, 'YYYYMM'), 1),
                        'YYYYMM');

            IF v_Postp_Seq = 60
            THEN                                                    -- 소유권인 경우
               v_Postp_Stat := 'O';                                   -- 소유권이전
            ELSE
               v_Postp_Stat := 'A';                                      -- 기존
            END IF;
         END IF;

         -- 전기말 누적액
         IF SUBSTR (v_Postp_Ym, 1, 4) <>
               TO_CHAR (ADD_MONTHS (TO_DATE (v_Postp_Ym, 'YYYYMM'), -1),
                        'YYYY')
         THEN
            v_Ly_Tpp_Amt := v_Cy_Tpp_Amt;                   -- 다른 년도면 전년까지 누적분
         ELSE
            v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;                         -- 같은 년도는 동일
         END IF;

         -- 당월 처리금액
         IF v_Postp_Seq <> v_Pptrm
         THEN
            v_Cm_Pp_Amt := v_Mpp_Amt;
         ELSE                                                           -- 최종분
            v_Cm_Pp_Amt := v_Lpp_Amt;
         END IF;

         -- 당기 처리액
         IF SUBSTR (v_Postp_Ym, 1, 4) <>
               TO_CHAR (ADD_MONTHS (TO_DATE (v_Postp_Ym, 'YYYYMM'), -1),
                        'YYYY')
         THEN
            v_Cy_Pp_Amt := v_Cm_Pp_Amt;                             -- 첫달은 당월분
         ELSE
            v_Cy_Pp_Amt := v_Cy_Pp_Amt + v_Cm_Pp_Amt;             -- 같은 년도면 누적
         END IF;

         -- 당기 총 누적액
         v_Cy_Tpp_Amt := v_Ly_Tpp_Amt + v_Cy_Pp_Amt;        -- 전기말 누적액 + 당기처리액

         -- 당월 잔존가액
         v_Cm_R_Amt := v_Acq_Amt_R - v_Cy_Tpp_Amt;          -- 전체금액 - 당기 총 누적액


         --        IF 0 != f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
         --                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
         --                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText
         IF 0 != Pkg_Rtre0125.f_InsertRtre0125 (v_Ord_No,
                                                v_Postp_Tp,
                                                v_Postp_Seq,
                                                v_Postp_Stat,
                                                v_Postp_Ym,
                                                v_Ly_Tpp_Amt,
                                                v_Cy_Pp_Amt,
                                                v_Cy_Tpp_Amt,
                                                v_Cm_Pp_Amt,
                                                v_Cm_R_Amt,
                                                v_Reg_Id,
                                                v_ErrorText)
         THEN
            v_Return_Message :=
                  '계약번호('
               || v_Ord_No
               || ') 순번('
               || v_Postp_Seq
               || ')[RE] 이연처리 월별내역 등록 실패!!!'
               || '-'
               || v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
         END IF;


         v_Postp_Seq := v_Postp_Seq + 1;
         EXIT WHEN v_Postp_Seq > v_Pptrm;
      END LOOP;



      v_Success_code := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText := '';
   --COMMIT;

   EXCEPTION
      WHEN e_Error
      THEN
         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120Postpone(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120Postpone(2)',
            v_ErrorText,
            v_Return_Message);
   END p_CreateRtre0120ZeroPostpone;


   /*****************************************************************************
   -- [RE] 이연대상 중도변경 UPDATE
   *****************************************************************************/
   FUNCTION f_UpdateRtre0120Postpone (
      v_Ord_No      IN     RTRE0120.ORD_NO%TYPE,        /*계약번호              */
      v_Postp_Tp    IN     RTRE0120.POSTP_TP%TYPE,      /*이연항목              */
      v_Pp_Stat     IN     RTRE0120.PP_STAT%TYPE,         /*이연대상상태          */
      v_Ppch_Ym     IN     RTRE0120.PPCH_YM%TYPE,             /*이연대상상태변경년월  */
      v_Reg_Id      IN     RTRE0120.REG_ID%TYPE,       /*등록자 ID             */
      v_ErrorText      OUT VARCHAR2)
      RETURN NUMBER
   IS
   BEGIN
--        DBMS_OUTPUT.PUT_LINE('['||v_Ord_No||']['||v_Postp_Tp||']['||v_Pp_Stat||']['||v_Ppch_Ym ||']');
      UPDATE RTRE0120
         SET PP_STAT  = v_Pp_Stat,
             PPCH_YM  = v_Ppch_Ym,
             CHG_ID   = v_Reg_Id,
             CHG_DT   = SYSDATE
       WHERE ORD_NO   = v_Ord_No 
         AND POSTP_TP = v_Postp_Tp
         AND PP_STAT IN ('A') --[20161031_05]
         ;

      RETURN SQLCODE;
   EXCEPTION
      WHEN OTHERS
      THEN
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         RETURN SQLCODE;
   END f_UpdateRtre0120Postpone;


   /*****************************************************************************
   -- [RE] 이연대상 중도변경 처리
   *****************************************************************************/
   PROCEDURE p_Rtre0120ChangePostpone (
      v_Ord_No           IN     RTRE0120.ORD_NO%TYPE,   /*계약번호              */
      v_Postp_Tp         IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
      v_Pp_Stat          IN     RTRE0120.PP_STAT%TYPE,    /*이연대상상태          */
      v_Ppch_Ym          IN     RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtre0125
      IS
         SELECT ORD_NO, POSTP_TP, POSTP_SEQ
           FROM RTRE0125
          WHERE     ORD_NO = v_Ord_No
                AND POSTP_TP = v_Postp_Tp
                AND POSTP_YM >= v_Ppch_Ym
                AND POSTP_STAT IN ('N','A','O'); --[20161031_05]

      e_Error        EXCEPTION;

      v_Prost_Tp     RTRE0120.PROST_TP%TYPE DEFAULT NULL;

      v_Postp_Seq    RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
      v_Postp_Stat   RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
      v_Postp_Ym     RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
      v_Ly_Tpp_Amt   RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
      v_Cy_Pp_Amt    RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
      v_Cy_Tpp_Amt   RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
      v_Cm_Pp_Amt    RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
      v_Cm_R_Amt     RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;

      v_curr_cunt    NUMBER;
   BEGIN
      -- 필수값: 계약번호, 이연항목, 이연대상상태, 이연대상상태변경년월, 등록자 ID
      IF    (TRIM (v_Ord_No) IS NULL)
         OR Pkg_Rtsd0108.f_sRtsd0108Count (v_Ord_No) = 0
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Postp_Tp) IS NULL)
         OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count ('R037', v_Postp_Tp)
      THEN
         v_Return_Message :=
               '이연항목('
            || v_Postp_Tp
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Pp_Stat) IS NULL)
         OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count ('R038', v_Pp_Stat)
      THEN
         v_Return_Message :=
               '이연대상상태('
            || v_Pp_Stat
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Ppch_Ym) IS NULL)
      THEN
         v_Return_Message :=
               '이연대상상태변경년월('
            || v_Ppch_Ym
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;


      --  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Postp_Tp);

      v_Ly_Tpp_Amt := 0;
      v_Cy_Pp_Amt := 0;
      v_Cy_Tpp_Amt := 0;
      v_Cm_Pp_Amt := 0;
      v_Cm_R_Amt := 0;

      BEGIN
         -- 이연처리 처리구분 발췌
         SELECT PROST_TP
           INTO v_Prost_Tp
           FROM RTRE0120
          WHERE ORD_NO = v_Ord_No 
            AND POSTP_TP = v_Postp_Tp 
            AND PP_STAT IN ('A'); --[20161031_05]
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK;
            v_Success_code := -1;
            v_Return_Message :=
                  '계약번호('
               || v_Ord_No
               || ') : 의 이연정보가 존재하지 않아 처리가 불가 합니다!';
            v_ErrorText :=
               SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite (
               'Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)',
               v_ErrorText,
               v_Return_Message);
      END;


      BEGIN
         -- 이연처리  월별에서 금액자료발췌
         SELECT LY_TPP_AMT,
                CY_PP_AMT,
                CY_TPP_AMT,
                CM_PP_AMT,
                CM_R_AMT
           INTO v_Ly_Tpp_Amt,
                v_Cy_Pp_Amt,
                v_Cy_Tpp_Amt,
                v_Cm_Pp_AMT,
                v_Cm_R_Amt
           FROM RTRE0125
          WHERE     ORD_NO = v_Ord_No
                AND POSTP_TP = v_Postp_Tp
                AND POSTP_YM = v_Ppch_Ym
                AND POSTP_STAT IN ('N','A','O'); --[20161031_05]
      EXCEPTION
         WHEN OTHERS
         THEN
            ROLLBACK;
            v_Success_code := -1;
            v_Return_Message :=
                  '변경년월('
               || v_Postp_Ym
               || ') : 의 이연 월별정보가 존재하지 않아 처리가 불가 합니다!';
            v_ErrorText :=
               SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite (
               'Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)',
               v_ErrorText,
               v_Return_Message);
      END;


      --    IF 0 = f_sRtre0120Count(v_Ord_No, v_Postp_Tp) THEN
      --        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다!';
      --        RAISE e_Error;
      --    END;

      -- 이연정보 중도변경으로 UPDATE
      IF 0 <> f_UpdateRtre0120Postpone (v_Ord_No,
                                        v_Postp_Tp,
                                        v_Pp_Stat,
                                        v_Ppch_Ym,
                                        v_Reg_Id,
                                        v_ErrorText)
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 의 이연정보 UPDATE 오류입니다!';
         RAISE e_Error;
      END IF;


      -- 이연처리 월별내역 UPDATE
      FOR CUR_0125 IN Cur_Rtre0125
      LOOP
         EXIT WHEN Cur_Rtre0125%NOTFOUND;

         v_Postp_Stat := 'Z';

         IF 0 <> Pkg_Rtre0125.f_UpdateRtre0125Postpone (v_Ord_No,
                                                        v_Postp_Tp,
                                                        CUR_0125.POSTP_SEQ,
                                                        v_Postp_Stat,
                                                        v_Reg_Id,
                                                        v_ErrorText)
         THEN
            v_Return_Message :=
                  '계약번호('
               || v_Ord_No
               || ') : 의 이연정보 월별내역 중도변경 오류입니다!';
            RAISE e_Error;
         END IF;
      END LOOP;

      IF Cur_Rtre0125%ISOPEN
      THEN
         CLOSE Cur_Rtre0125;
      END IF;


      -- 이연회차
      v_Postp_Seq := Pkg_Rtre0125.f_sRtre0125MaxSeq (v_Ord_No, v_Postp_Tp) + 1;
      -- 이연상태
      v_Postp_Stat := v_Pp_Stat;
      -- 대상년월
      v_Postp_Ym := v_Ppch_Ym;

      IF v_Prost_Tp = 'A'
      THEN                                                       -- 자산자료 금액 계산
         -- 전기말 누적액
         v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;
         -- 당기 처리액
         v_Cy_Pp_Amt := v_Cy_Pp_Amt - v_Cm_Pp_Amt;
         -- 당기 총 누적액
         v_Cy_Tpp_Amt := v_Cy_Tpp_Amt - v_Cm_Pp_Amt;
         -- 당월 잔존가액
         v_Cm_R_Amt := v_Cm_R_Amt + v_Cm_Pp_Amt;
         -- 당월 처리금액
         v_Cm_Pp_Amt := 0;
      ELSE                                                            -- 매출/비용
         -- 전기말 누적액
         v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;
         -- 당기 처리액
         v_Cy_Pp_Amt := v_Cy_Pp_Amt + v_Cm_R_Amt;
         -- 당기 총 누적액
         v_Cy_Tpp_Amt := v_Cy_Tpp_Amt + v_Cm_R_Amt;
         -- 당월 처리금액
         v_Cm_Pp_Amt := v_Cm_Pp_Amt + v_Cm_R_Amt;
         -- 당월 잔존가액
         v_Cm_R_Amt := 0;
      END IF;


      --        IF 0 != f_InsertRtre0125( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
      --                                  v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
      --                                  v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText
      IF 0 != Pkg_Rtre0125.f_InsertRtre0125 (v_Ord_No,
                                             v_Postp_Tp,
                                             v_Postp_Seq,
                                             v_Postp_Stat,
                                             v_Postp_Ym,
                                             v_Ly_Tpp_Amt,
                                             v_Cy_Pp_Amt,
                                             v_Cy_Tpp_Amt,
                                             v_Cm_Pp_Amt,
                                             v_Cm_R_Amt,
                                             v_Reg_Id,
                                             v_ErrorText)
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') 순번('
            || v_Postp_Seq
            || ')[RE] 이연처리 월별내역 등록 실패!!!'
            || '-'
            || v_Errortext;
         v_Errortext := v_Errortext;
         RAISE e_Error;
      END IF;


      v_Success_code := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText := '';
   --COMMIT;

   EXCEPTION
      WHEN e_Error
      THEN
         ROLLBACK;

         IF Cur_Rtre0125%ISOPEN
         THEN
            CLOSE Cur_Rtre0125;
         END IF;

         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         IF Cur_Rtre0125%ISOPEN
         THEN
            CLOSE Cur_Rtre0125;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_Rtre0120ChangePostpone(2)',
            v_ErrorText,
            v_Return_Message);
   END p_Rtre0120ChangePostpone;


   /*****************************************************************************
   -- [RE] 이연대상 중도변경 처리 Main
   *****************************************************************************/
   PROCEDURE p_Rtre0120ChangeMain (
      v_Ord_No           IN     RTRE0120.ORD_NO%TYPE,   /*계약번호              */
      v_Postp_Tp         IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
      v_Pp_Stat          IN     RTRE0120.PP_STAT%TYPE,  /*이연대상상태          */
      v_Ppch_Ym          IN     RTRE0120.PPCH_YM%TYPE,  /*이연대상상태변경년월  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,   /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtre0120
      IS
         SELECT ORD_NO, POSTP_TP
           FROM RTRE0120
          WHERE     ORD_NO = v_Ord_No
                AND POSTP_TP =
                       DECODE (NVL (v_Postp_Tp, ''),
                               '', POSTP_TP,
                               v_Postp_Tp);

      e_Error       EXCEPTION;

      v_curr_cunt   NUMBER;
   BEGIN
      -- 필수값: 계약번호, 이연항목, 이연대상상태, 이연대상상태변경년월, 등록자 ID
      IF    (TRIM (v_Ord_No) IS NULL)
         OR Pkg_Rtsd0108.f_sRtsd0108Count (v_Ord_No) = 0
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      -- 이연항목 NULL로 넘어올 수 있음
      IF (TRIM (v_Postp_Tp) IS NOT NULL)
      THEN
         IF 0 = Pkg_Rtcm0051.f_sRtcm0051Count ('R037', v_Postp_Tp)
         THEN
            v_Return_Message :=
                  '이연항목('
               || v_Postp_Tp
               || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
         END IF;
      END IF;

      IF    (TRIM (v_Pp_Stat) IS NULL)
         OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count ('R038', v_Pp_Stat)
      THEN
         v_Return_Message :=
               '이연대상상태('
            || v_Pp_Stat
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Ppch_Ym) IS NULL)
      THEN
         v_Return_Message :=
               '이연대상상태변경년월('
            || v_Ppch_Ym
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      -- 이연처리 월별내역 UPDATE
      FOR CUR_0120 IN Cur_Rtre0120
      LOOP
         EXIT WHEN Cur_Rtre0120%NOTFOUND;

         BEGIN
            -- 이연처리  월별에서 대상존재여부 확인
            v_curr_cunt := 0;

            SELECT COUNT (*)
              INTO v_curr_cunt
              FROM RTRE0125
             WHERE     ORD_NO = v_Ord_No
                   AND POSTP_TP = CUR_0120.POSTP_TP
                   AND POSTP_YM >= v_Ppch_Ym
                   AND POSTP_STAT IN ('A', 'O');
         EXCEPTION
            WHEN OTHERS
            THEN
               v_curr_cunt := 0;
         END;

         IF v_curr_cunt > 0
         THEN
--            DBMS_OUTPUT.PUT_LINE('POSTP_TP = [' || CUR_0120.POSTP_TP || ']');
            p_Rtre0120ChangePostpone (v_Ord_No,
                                      CUR_0120.POSTP_TP,
                                      v_Pp_Stat,
                                      v_Ppch_Ym,
                                      v_Reg_Id,
                                      v_Success_Code,
                                      v_Return_Message,
                                      v_ErrorText);

            IF v_Success_Code <> 0
            THEN
               RAISE e_Error;
            END IF;
         END IF;
      END LOOP;

      IF Cur_Rtre0120%ISOPEN
      THEN
         CLOSE Cur_Rtre0120;
      END IF;



      v_Success_code := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText := '';
   --COMMIT;

   EXCEPTION
      WHEN e_Error
      THEN
         IF Cur_Rtre0120%ISOPEN
         THEN
            CLOSE Cur_Rtre0120;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_Rtre0120ChangeMain(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         IF Cur_Rtre0120%ISOPEN
         THEN
            CLOSE Cur_Rtre0120;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_Rtre0120ChangeMain(2)',
            v_ErrorText,
            v_Return_Message);
   END p_Rtre0120ChangeMain;


   /*****************************************************************************
   -- 등록비 이연대상 생성
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120RegiPostpone (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtcs0001
      IS
           SELECT A.ORD_NO,
                  SUBSTR (A.PROC_DAY, 1, 6) PSTR_YM,
                  ROUND (B.REGI_AMT / 1.1) REGI_AMT,
                  B.PERIOD_CD,
                  B.CHAN_CD,
                  DECODE (B.CHAN_CD,
                          '01', B.AGENCY_CD,
                          DECODE (B.CHAN_CD, '05', B.AGENCY_CD, B.ORD_AGENT))
                     AGENCY_CD,
                  C.CUST_TP,
                  --A.MAT_CD,
                  NVL(TRIM(D.MATNR_S), A.MAT_CD) MAT_CD,
                  B.CNT_CD
             FROM RTCS0001 A, RTSD0108 B, RTSD0100 C, RTSD0115 D
            WHERE     A.PROC_DAY BETWEEN v_Period || '01'
                                     AND TO_CHAR (
                                            LAST_DAY (
                                               TO_DATE (v_Period, 'YYYYMM')),
                                            'YYYYMMDD')
                  AND A.ORD_NO = B.ORD_NO
                  AND B.CUST_NO = C.CUST_NO
                  AND A.ORD_NO = D.ORD_NO(+)
                  AND D.TRANS_TP(+) = 'N'
                  AND B.REGI_AMT > 0
         ORDER BY A.PROC_DAY, A.ORD_NO;

      e_Error       EXCEPTION;
      v_curr_cunt   NUMBER;

      v_Ord_No      RTRE0120.ORD_NO%TYPE;               /*계약번호              */
      v_Postp_Tp    RTRE0120.POSTP_TP%TYPE;             /*이연항목              */
      v_Pstr_Ym     RTRE0120.PSTR_YM%TYPE;              /*이연시작월            */
      v_Pptrm       RTRE0120.PPTRM%TYPE;                /*이연기간              */
      v_Acq_Amt     RTRE0120.ACQ_AMT%TYPE;              /*이연처리대상금액      */
      v_Res_Amt     RTRE0120.RES_AMT%TYPE;              /*잔존가액              */
      v_Prost_Tp    RTRE0120.PROST_TP%TYPE;             /*처리구분              */
      v_Chan_Cd     RTRE0120.CHAN_CD%TYPE;              /*채널구분              */
      v_Agency_Cd   RTRE0120.AGENCY_CD%TYPE;            /*취득조직              */
      v_Cust_Tp     RTRE0120.CUST_TP%TYPE;              /*고객유형              */
      v_Mat_Cd      RTRE0120.MAT_CD%TYPE;               /*상품코드              */
      v_Ord_Qty     RTRE0120.ORD_QTY%TYPE;              /*장착갯수              */
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Pstr_Ym := v_Period;
      v_Prost_Tp := 'P';                                              -- 매출(P)
      v_Postp_Tp := '01';                                           -- 등록비(01)

      -- 이미처리되었는지 확인
      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_curr_cunt := 0;

      -- 이연처리 월별내역 UPDATE
      FOR CUR_0001 IN Cur_Rtcs0001
      LOOP
         EXIT WHEN Cur_Rtcs0001%NOTFOUND;

         v_curr_cunt := v_curr_cunt + 1;
         --        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
         --                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
         --                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
         p_CreateRtre0120Postpone (CUR_0001.ORD_NO,
                                   v_Postp_Tp,
                                   v_Pstr_Ym,
                                   CUR_0001.PERIOD_CD,
                                   CUR_0001.REGI_AMT,
                                   0,
                                   v_Prost_Tp,
                                   CUR_0001.CHAN_CD,
                                   CUR_0001.AGENCY_CD,
                                   CUR_0001.CUST_TP,
                                   CUR_0001.MAT_CD,
                                   CUR_0001.CNT_CD,
                                   v_Reg_Id,
                                   v_Success_Code,
                                   v_Return_Message,
                                   v_ErrorText);

         IF v_Success_Code <> 0
         THEN
            RAISE e_Error;
         END IF;
      END LOOP;

      IF Cur_Rtcs0001%ISOPEN
      THEN
         CLOSE Cur_Rtcs0001;
      END IF;


      IF v_curr_cunt > 0
      THEN
         v_Success_code := 0;
         v_Return_Message := '정상적으로 처리되었습니다';
         v_ErrorText := '';
      --COMMIT;
      ELSE
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 처리건이 존재하지 않습니다!';
         RAISE e_Error;
      END IF;
   EXCEPTION
      WHEN e_Error
      THEN
         IF Cur_Rtcs0001%ISOPEN
         THEN
            CLOSE Cur_Rtcs0001;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120RegiPostpone(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         IF Cur_Rtcs0001%ISOPEN
         THEN
            CLOSE Cur_Rtcs0001;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120RegiPostpone(2)',
            v_ErrorText,
            v_Return_Message);
   END p_CreateRtre0120RegiPostpone;


   /*****************************************************************************
   -- 감가상각비 이연대상 생성
   
   REVISIONS
      Ver        Date        Author           Description
      ---------  ----------  ---------------  -------------------------------------
      1.0        2015-09-16  choidh           1. Created this package body.
      1.1        2016-04-28  이영근           걱정제로 감가상각 출고기준 처리, 당원신청건 처리
      1.2        2016-05-13  이영근           2본씩 별도 신청한 경우에도 걱정제로 서비스 부과      
      1.3        2016-12-01  wjim             [20161201_01] 트럭용 6본 걱정제로 감가상각 처리
      1.4        2017-01-30  wjim             [20170130_01] 2+1 적용에 따른 감가상각 이연처리 변경
      1.5        2018-09-30  wjim             [20180920_01] 실제 출고제품으로 감가상각 처리
      1.8        2020-01-14  rentaldev        [20200114_01] 걱정제로 충당 이연 로직 변경
                                              - 기존 : 본품 4본에 2(09,10), 2본에 1(09) (고정)
                                              - 변경 : 판매상품에 근거한 걱정제로 횟수에 따라 최대 6개까지 부여
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120DeprePostpone (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtcs0003
      IS
           SELECT A.MATNR, A.MENGE, A.COSGAMT
             FROM RTCS0003 A
            WHERE A.ZMONTH = v_Period
         ORDER BY A.MATNR;

      CURSOR Cur_Rtcs0001 (
         v_Mat_Cd VARCHAR)
      IS
           SELECT COUNT (*) OVER () CNT,
                  A.ORD_NO,
                  SUBSTR (A.PROC_DAY, 1, 6) PSTR_YM,
                  B.PERIOD_CD,
                  B.CHAN_CD,
                  DECODE (B.CHAN_CD,
                          '01', B.AGENCY_CD,
                          DECODE (B.CHAN_CD, '05', B.AGENCY_CD, B.ORD_AGENT))
                     AGENCY_CD,
                  C.CUST_TP,
--                  A.MAT_CD,
                  NVL(TRIM(E.MATNR_S), A.MAT_CD) AS MAT_CD,                         --[20180920_01] 실제 출고제품코드 사용
                  B.CNT_CD,
                  B.ORD_DAY,
                  (SELECT SUM(TO_NUMBER(D.CNT_CD))
                     FROM RTSD0108 D
                    WHERE D.CUST_NO  = B.CUST_NO
                      AND (D.PROC_DAY = B.PROC_DAY OR D.ORD_DAY = B.ORD_DAY) -- 2016-07-29 이영근, 장착일자가 같거나 주문일자가 같은 경우
                      AND D.CAR_NO   = B.CAR_NO) AS SUM_CNT_CD               -- 2016-05-13 이영근, 2본씩 각각 계약한 고객정보 확인  
                , NVL(D.SERV_CNT0, 0) AS SERV_CNT0                           -- [20170130_01] 걱정제로 서비스 부여횟수 추가 (장착 시 이미 부여된 건도 감가상각 이연대상)             
             FROM RTCS0001 A, RTSD0108 B, RTSD0100 C, RTSD0013 D, RTSD0115 E
            WHERE     A.PROC_DAY BETWEEN v_Period || '01'
                                     AND TO_CHAR (
                                            LAST_DAY (
                                               TO_DATE (v_Period, 'YYYYMM')),
                                            'YYYYMMDD')
                  AND A.ORD_NO      = B.ORD_NO
                  AND B.CUST_NO     = C.CUST_NO
--                  AND A.MAT_CD      = v_Mat_Cd
                  AND NVL(TRIM(E.MATNR_S), A.MAT_CD) = v_Mat_Cd                     --[20180920_01]
                  AND A.ORD_NO      = D.ORD_NO(+)
                  AND D.PRS_DCD(+)  = 'B00007'
                  AND A.ORD_NO      = E.ORD_NO(+)
                  AND E.TRANS_TP(+) = 'N'
         ORDER BY A.PROC_DAY, A.ORD_NO;

      e_Error       EXCEPTION;
      v_curr_cunt   NUMBER;

      v_Ord_No      RTRE0120.ORD_NO%TYPE;               /*계약번호              */
      v_Postp_Tp    RTRE0120.POSTP_TP%TYPE;             /*이연항목              */
      v_Pstr_Ym     RTRE0120.PSTR_YM%TYPE;               /*이연시작월            */
      v_Pptrm       RTRE0120.PPTRM%TYPE;                /*이연기간              */
      v_Acq_Amt     RTRE0120.ACQ_AMT%TYPE;                  /*이연처리대상금액      */
      v_Res_Amt     RTRE0120.RES_AMT%TYPE;              /*잔존가액              */
      v_Prost_Tp    RTRE0120.PROST_TP%TYPE;             /*처리구분              */
      v_Chan_Cd     RTRE0120.CHAN_CD%TYPE;              /*채널구분              */
      v_Agency_Cd   RTRE0120.AGENCY_CD%TYPE;            /*취득조직              */
      v_Cust_Tp     RTRE0120.CUST_TP%TYPE;              /*고객유형              */
      v_Mat_Cd      RTRE0120.MAT_CD%TYPE;               /*상품코드              */
      v_Ord_Qty     RTRE0120.ORD_QTY%TYPE;              /*장착갯수              */
      v_Acq_Tot     RTRE0120.ACQ_AMT%TYPE;                  /*이연처리전체금액      */
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL) THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Pstr_Ym := v_Period;
      -- 이미처리되었는지 확인
      v_Postp_Tp := '03';                                     -- 감가상각 계약기간(03)

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp) THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Postp_Tp := '02';                                     -- 감가상각 60개월(02)

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp) THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Postp_Tp := '09';                                   -- 걱정제로감가상각 계약기간_1

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp) THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Postp_Tp := '10';                                    --걱정제로감가상각 계약기간_2

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp) THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      -- 제품별 갯수 check
      v_Mat_Cd := '';
      v_curr_cunt := 0;

      BEGIN
         SELECT MATNR                                    --, CNT_COST, CNT_ORD
           INTO v_Mat_Cd
           --    SELECT  COUNT(*)
           --    INTO    v_curr_cunt
           FROM (  SELECT MATNR, SUM (CNT_COST) CNT_COST, SUM (CNT_ORD) CNT_ORD
                     FROM (  SELECT MATNR MATNR, SUM (MENGE) CNT_COST, 0 CNT_ORD
                               FROM RTCS0003
                              WHERE ZMONTH = v_Period
                           GROUP BY MATNR
                           UNION ALL
--                             SELECT A.MAT_CD MATNR,
                             SELECT NVL(TRIM(C.MATNR_S), A.MAT_CD) AS MATNR,        --[20180920_01] 실제 출고제품코드 사용  
                                    0 CNT_COST,
                                    SUM (B.CNT_CD) CNT_ORD
                               FROM RTCS0001 A, RTSD0108 B, RTSD0115 C
                              WHERE     A.PROC_DAY BETWEEN v_Period || '01'
                                                       AND TO_CHAR (
                                                              LAST_DAY (
                                                                 TO_DATE (
                                                                    v_Period,
                                                                    'YYYYMM')),
                                                              'YYYYMMDD')
                                    AND A.ORD_NO      = B.ORD_NO
                                    AND A.ORD_NO      = C.ORD_NO(+)
                                    AND C.TRANS_TP(+) = 'N'
                           GROUP BY NVL(TRIM(C.MATNR_S), A.MAT_CD))
                 GROUP BY MATNR
                   HAVING SUM (CNT_COST) <> SUM (CNT_ORD))
          WHERE ROWNUM = 1;
      EXCEPTION
         WHEN OTHERS THEN
            v_curr_cunt := 0;
      END;

      IF v_curr_cunt <> 0 THEN
         v_Return_Message :=
            '상품코드별 : 수량이 맞지 않아 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      --  DBMS_OUTPUT.Put_Line('SELECT 후222 v_curr_cunt' || TO_CHAR(v_curr_cunt));

      -- 이연처리 월별내역 생성
      FOR CUR_0003 IN Cur_Rtcs0003
      LOOP
         EXIT WHEN Cur_Rtcs0003%NOTFOUND;

         v_Mat_Cd := CUR_0003.MATNR;
         v_curr_cunt := 1;
         v_Acq_Tot := 0;

         FOR CUR_0001 IN Cur_Rtcs0001 (v_Mat_Cd)
         LOOP
            EXIT WHEN Cur_Rtcs0001%NOTFOUND;

            -- 대상금액 처리(마지막인 경우 나머지금액 전체로)
--            IF v_curr_cunt = CUR_0001.CNT
--            THEN
--               v_Acq_Amt := CUR_0003.COSGAMT - v_Acq_Tot;
--            ELSE
--               v_Acq_Amt := TRUNC (CUR_0003.COSGAMT * (CUR_0001.CNT_CD / CUR_0003.MENGE));                     
--               v_Acq_Tot := v_Acq_Tot + v_Acq_Amt;
--            END IF;
            
            v_Acq_Amt := TRUNC ((CUR_0003.COSGAMT / CUR_0003.MENGE) * CUR_0001.CNT_CD);

            -- 처리구분
            v_Prost_Tp := 'A';
            -- 잔존가액
            v_Res_Amt := CUR_0001.CNT_CD * 1000;           -- 잔존가액 : 갯수당 1000원
            -- 1.감가상각 계약기간 처리
            v_Postp_Tp := '03';                               -- 감가상각 계약기간(03)
            v_Pptrm := CUR_0001.PERIOD_CD;
            --        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
            --                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
            --                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
            
            p_CreateRtre0120Postpone (CUR_0001.ORD_NO,
                                      v_Postp_Tp,
                                      v_Pstr_Ym,
                                      v_Pptrm,
                                      v_Acq_Amt,
                                      v_Res_Amt,
                                      v_Prost_Tp,
                                      CUR_0001.CHAN_CD,
                                      CUR_0001.AGENCY_CD,
                                      CUR_0001.CUST_TP,
                                      CUR_0001.MAT_CD,
                                      CUR_0001.CNT_CD,
                                      v_Reg_Id,
                                      v_Success_Code,
                                      v_Return_Message,
                                      v_ErrorText);

            IF v_Success_Code <> 0 THEN
               RAISE e_Error;
            END IF;

            -- 2.감가상각 60개월 처리 (내용연수)
            v_Postp_Tp := '02';                               -- 감가상각 60개월(02)
            v_Pptrm := 60;
            p_CreateRtre0120Postpone (CUR_0001.ORD_NO,
                                      v_Postp_Tp,
                                      v_Pstr_Ym,
                                      v_Pptrm,
                                      v_Acq_Amt,
                                      v_Res_Amt,
                                      v_Prost_Tp,
                                      CUR_0001.CHAN_CD,
                                      CUR_0001.AGENCY_CD,
                                      CUR_0001.CUST_TP,
                                      CUR_0001.MAT_CD,
                                      CUR_0001.CNT_CD,
                                      v_Reg_Id,
                                      v_Success_Code,
                                      v_Return_Message,
                                      v_ErrorText);

            IF v_Success_Code <> 0 THEN
               RAISE e_Error;
            END IF;

            -- [20200114_01] 실제 걱정제로 횟수에 의거 걱정제로 충당 이연 데이터 생성
            IF CUR_0001.SERV_CNT0 > 0 THEN
               
                v_Prost_Tp := 'A';                   --처리구분=자산               
                v_Res_Amt  := 0;                     --잔존가액. 본품과는 달리 0원 책정
                v_Pptrm    := CUR_0001.PERIOD_CD;    --이연기간=계약기간
            
                -- 걱정제로 충당 갯수는 LTR 고려 최대 6개 까지 가능 (09~15)
                FOR i IN 9..LEAST(9+CUR_0001.SERV_CNT0-1, 15) LOOP

                    v_Postp_Tp := TO_CHAR(i, 'FM00'); --이연항목=09~15 
                    
                    p_CreateRtre0120ZeroPostpone (
                          CUR_0001.ORD_NO
                        , v_Postp_Tp
                        , v_Pstr_Ym
                        , v_Pptrm
                        , v_Acq_Amt
                        , v_Res_Amt
                        , v_Prost_Tp
                        , CUR_0001.CHAN_CD
                        , CUR_0001.AGENCY_CD
                        , CUR_0001.CUST_TP
                        , CUR_0001.MAT_CD
                        , TO_NUMBER(CUR_0001.CNT_CD)
                        , v_Reg_Id
                        , v_Success_Code
                        , v_Return_Message
                        , v_ErrorText
                    );

                    IF v_Success_Code <> 0 THEN
                        RAISE e_Error;
                    END IF;
                    
                END LOOP;
            END IF;

            /* [20200114_01] 이전
            -- 김한나 추가 바퀴의 개수가 네개인 경우 이연처리 대상 
            -- 2016-05-13 이영근, 2본씩 각각 계약한 고객에게도 걱정제로 서비스 이연처리
            -- [20161201_01] 트럭용 6본(4+2) 감가상각 처리 추가
--            IF CUR_0001.CNT_CD = '04' OR CUR_0001.SUM_CNT_CD = 4 --[20161201_01] 이전
--            IF (CUR_0001.CNT_CD = '04') OR (CUR_0001.CNT_CD = '02' AND CUR_0001.SUM_CNT_CD IN (4,6))  --[20161201_01] 이후 
            IF (CUR_0001.CNT_CD = '04') OR (CUR_0001.CNT_CD = '02' AND (CUR_0001.SUM_CNT_CD IN (4,6) OR CUR_0001.SERV_CNT0 > 0)) -- [20170130_01]
            THEN 
               --   IF CUR_0001.ORD_DAY > '20151231' THEN  --12/31 경우 이연 대상
               -- 처리구분
               v_Prost_Tp := 'A';
               -- 잔존가액
               v_Res_Amt := 0;            -- 잔존가액 : 갯수당 1000원1개만 할거니 개수는 1000원
               -- 1.감가상각 계약기간 처리-- 타이어 1개
               v_Postp_Tp := '09';                            -- 감가상각 계약기간(03)
               v_Pptrm := CUR_0001.PERIOD_CD;
               --        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
               --                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
               --                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
               p_CreateRtre0120ZeroPostpone (CUR_0001.ORD_NO,
                                             v_Postp_Tp,
                                             v_Pstr_Ym,
                                             v_Pptrm,
                                             v_Acq_Amt,
                                             v_Res_Amt,
                                             v_Prost_Tp,
                                             CUR_0001.CHAN_CD,
                                             CUR_0001.AGENCY_CD,
                                             CUR_0001.CUST_TP,
                                             CUR_0001.MAT_CD,
                                             TO_NUMBER(CUR_0001.CNT_CD),
                                             v_Reg_Id,
                                             v_Success_Code,
                                             v_Return_Message,
                                             v_ErrorText);

               IF v_Success_Code <> 0
               THEN
                  RAISE e_Error;
               END IF;
               
               -- 2016-05-13 이영근, 4본 계약한 고객에게만 10번 생성
               IF CUR_0001.CNT_CD = '04'
               THEN
                   -- 1.감가상각 계약기간 처리--타이어 1개
                   v_Postp_Tp := '10';                            -- 감가상각 계약기간(03)
                   v_Pptrm := CUR_0001.PERIOD_CD;
                   --        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
                   --                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
                   --                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
                   p_CreateRtre0120ZeroPostpone (CUR_0001.ORD_NO,
                                                 v_Postp_Tp,
                                                 v_Pstr_Ym,
                                                 v_Pptrm,
                                                 v_Acq_Amt,
                                                 v_Res_Amt,
                                                 v_Prost_Tp,
                                                 CUR_0001.CHAN_CD,
                                                 CUR_0001.AGENCY_CD,
                                                 CUR_0001.CUST_TP,
                                                 CUR_0001.MAT_CD,
                                                 TO_NUMBER(CUR_0001.CNT_CD),
                                                 v_Reg_Id,
                                                 v_Success_Code,
                                                 v_Return_Message,
                                                 v_ErrorText);

                   IF v_Success_Code <> 0
                   THEN
                      RAISE e_Error;
                   END IF;
               END IF;
              
            END IF;
            */
            
            v_curr_cunt := v_curr_cunt + 1;
         END LOOP;

         IF Cur_Rtcs0001%ISOPEN THEN
            CLOSE Cur_Rtcs0001;
         END IF;
      END LOOP;

      IF Cur_Rtcs0003%ISOPEN THEN
         CLOSE Cur_Rtcs0003;
      END IF;

      IF v_curr_cunt > 0 THEN
         v_Success_code := 0;
         v_Return_Message := '정상적으로 처리되었습니다';
         v_ErrorText := '';
      ELSE
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 처리건이 존재하지 않습니다!';
         RAISE e_Error;
      END IF;
      
   EXCEPTION
      WHEN e_Error THEN
         IF Cur_Rtcs0001%ISOPEN THEN
            CLOSE Cur_Rtcs0001;
         END IF;

         IF Cur_Rtcs0003%ISOPEN THEN
            CLOSE Cur_Rtcs0003;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
--         Pkg_Utility.p_ErrorFileWrite (
--            'Pkg_Rtre0120.p_CreateRtre0120DeprePostpone(1)',
--            v_ErrorText,
--            v_Return_Message);
      WHEN OTHERS THEN
         IF Cur_Rtcs0001%ISOPEN THEN
            CLOSE Cur_Rtcs0001;
         END IF;

         IF Cur_Rtcs0003%ISOPEN THEN
            CLOSE Cur_Rtcs0003;
         END IF;

         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := NVL(TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200);
--         Pkg_Utility.p_ErrorFileWrite (
--            'Pkg_Rtre0120.p_CreateRtre0120DeprePostpone(2)',
--            v_ErrorText,
--            v_Return_Message);
   END p_CreateRtre0120DeprePostpone;


   /*****************************************************************************
   -- 이연처리 변경사항 반영
   
      REVISIONS
      Ver        Date        Author           Description
      ---------  ----------  ---------------  -------------------------------------
      1.1        2016-05-13  이영근           걱정제로서비스 이연처리 추가      
      1.6        2019-04-01  wjim             [20190401_01] 장착당월 중도완납(해지)의 경우 감가비이연구분을 'E','C'가 아닌 'N'으로 변경
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120ChangePost (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtsd0108
      IS
         SELECT COUNT(*) OVER () AS TOT_CNT,A.ORD_NO, A.END_TP, B.POSTP_TP
           FROM RTSD0108 A, RTRE0120 B
          WHERE     A.CANC_DAY BETWEEN v_Period || '01'
                                   AND TO_CHAR (
                                          LAST_DAY (
                                             TO_DATE (v_Period, 'YYYYMM')),
                                          'YYYYMMDD')
                AND A.MFP_YN = 'Y'
--                AND A.ORD_NO IN ('D16000037442','D16000044998','D16000041520','D16000041698')
                AND A.ORD_NO = B.ORD_NO
                AND B.PP_STAT IN ('A') ; --[20161031_05]


      e_Error       EXCEPTION;
      v_curr_cunt   NUMBER;

      v_Ord_No      RTRE0120.ORD_NO%TYPE;               /*계약번호              */
      v_Postp_Tp    RTRE0120.POSTP_TP%TYPE;             /*이연항목              */
      v_Pstr_Ym     RTRE0120.PSTR_YM%TYPE;               /*이연시작월            */
      v_Pptrm       RTRE0120.PPTRM%TYPE;                /*이연기간              */
      v_Acq_Amt     RTRE0120.ACQ_AMT%TYPE;                  /*이연처리대상금액      */
      v_Res_Amt     RTRE0120.RES_AMT%TYPE;              /*잔존가액              */
      v_Prost_Tp    RTRE0120.PROST_TP%TYPE;             /*처리구분              */
      v_Chan_Cd     RTRE0120.CHAN_CD%TYPE;              /*채널구분              */
      v_Agency_Cd   RTRE0120.AGENCY_CD%TYPE;            /*취득조직              */
      v_Cust_Tp     RTRE0120.CUST_TP%TYPE;              /*고객유형              */
      v_Mat_Cd      RTRE0120.MAT_CD%TYPE;               /*상품코드              */
      v_Ord_Qty     RTRE0120.ORD_QTY%TYPE;              /*장착갯수              */
      v_Acq_Tot     RTRE0120.ACQ_AMT%TYPE;                  /*이연처리전체금액      */
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Pstr_Ym := v_Period;

      -- 이미처리되었는지 확인
      v_curr_cunt := 0;
        /* [20161031_05] 기처리 여부 확인로직 변경 */
      BEGIN
         SELECT COUNT (*)
           INTO v_curr_cunt
           FROM RTRE0120
          WHERE PPCH_YM = v_Period
            AND PP_STAT NOT IN ('A');
      EXCEPTION
         WHEN OTHERS
         THEN
            v_curr_cunt := 0;
      END;
        
      /* [20161031_05] 기처리 여부 확인로직 변경전 */
--      BEGIN
--         SELECT COUNT (*)
--           INTO v_curr_cunt
--           FROM RTSD0108 A, RTRE0120 B
--          WHERE     A.CANC_DAY BETWEEN v_Period || '01'
--                                   AND TO_CHAR (
--                                          LAST_DAY (
--                                             TO_DATE (v_Period, 'YYYYMM')),
--                                          'YYYYMMDD')
--                AND A.MFP_YN = 'Y'
--                AND A.ORD_NO = B.ORD_NO
--                --AND B.PSTR_YM = v_Period --12321 
--                AND A.ORD_NO NOT IN ('D16000037442','D16000044998','D16000041520','D16000041698') 
--                AND B.PP_STAT <> 'A'
--                AND ROWNUM = 1;
--      EXCEPTION
--         WHEN OTHERS
--         THEN
--            v_curr_cunt := 0;
--      END;

--      IF NVL (v_curr_cunt, 0) > 0
--      THEN
--         v_Return_Message :=
--               '마감년월('
--            || v_Period
--            || ') : 이미 처리되어 처리가 불가 합니다!';
--         RAISE e_Error;
--      END IF;


--       이연처리 변경내역 생성
--      FOR CUR_0108 IN Cur_Rtsd0108
--      LOOP
--         EXIT WHEN Cur_Rtsd0108%NOTFOUND;
--
--         v_curr_cunt := v_curr_cunt + 1;
--         
----         Pkg_Utility.p_InfoFileWrite ('Pkg_Rtre0120.p_CreateRtre0120ChangePost(1/3)', v_curr_cunt||'/'||CUR_0108.TOT_CNT, CUR_0108.ORD_NO);
--         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost(1/3)'||'['||v_curr_cunt||'/'||CUR_0108.TOT_CNT||']['||CUR_0108.ORD_NO||']');
--
--         p_Rtre0120ChangeMain (CUR_0108.ORD_NO,
--                               CUR_0108.POSTP_TP,
--                               CUR_0108.END_TP,
--                               v_Period,
--                               v_Reg_Id,
--                               v_Success_Code,
--                               v_Return_Message,
--                               v_ErrorText);
--
--         IF v_Success_Code <> 0
--         THEN
--            RAISE e_Error;
--         END IF;
--      END LOOP;
--
--      IF Cur_Rtsd0108%ISOPEN
--      THEN
--         CLOSE Cur_Rtsd0108;
--      END IF;

      -- 2016-05-13 이영근, 걱정제로 서비스 이연처리
--      p_ZeroChangePostSer (v_Period,
--                           v_Reg_Id,
--                           v_Success_Code,
--                           v_Return_Message,
--                           v_ErrorText);
--                           
--      IF v_Success_Code <> 0
--      THEN
--         RAISE e_Error;
--      END IF; 
      
--      p_ZeroSrvChangePostSer (v_Period,
--                              v_Reg_Id,
--                              v_Success_Code,
--                              v_Return_Message,
--                              v_ErrorText);
--                           
--      IF v_Success_Code <> 0
--      THEN
--         RAISE e_Error;
--      END IF;
      
      --[20190401_01] 장착당월 중도완납(해지)건 감가상각구분 변경 (E, C -> N)
      FOR cur1 IN (
        SELECT  ORD_NO
          FROM  RTSD0108
         WHERE  PROC_DAY LIKE v_Period||'%'
           AND  MFP_YN = 'Y'
           AND  CANC_DAY LIKE v_Period||'%'
      ) LOOP
      
--        Pkg_Utility.p_InfoFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(3)', '장착당월 중도완납해지', cur1.ORD_NO);
        DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost(3)'||'['||'장착당월 중도완납해지'||']['||cur1.ORD_NO||']');
        
        UPDATE  RTRE0125
           SET  POSTP_STAT  = 'N'
         WHERE  ORD_NO      = cur1.ORD_NO
           AND  POSTP_TP   IN ('02','03')
           AND  POSTP_STAT IN ('E','C')
        ;
                   
      END LOOP;

      IF v_curr_cunt > 0
      THEN
         v_Success_code := 0;
         v_Return_Message := '정상적으로 처리되었습니다';
         v_ErrorText := '';
      --COMMIT;
      ELSE
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 처리건이 존재하지 않습니다!';
         RAISE e_Error;
      END IF;
      
   EXCEPTION
      WHEN e_Error
      THEN
         IF Cur_Rtsd0108%ISOPEN
         THEN
            CLOSE Cur_Rtsd0108;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120ChangePost(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         IF Cur_Rtsd0108%ISOPEN
         THEN
            CLOSE Cur_Rtsd0108;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120ChangePost(2)',
            v_ErrorText,
            v_Return_Message);
   END p_CreateRtre0120ChangePost;
   
   
  /*****************************************************************************
   -- 이연처리 변경사항 반영 - Step 00
      - 이연변경 대상 제외
   
      REVISIONS
      Ver        Date        Author           Description
      ---------  ----------  ---------------  -------------------------------------
      1.8        2020-01-14  rentaldev        [20200114_01] 걱정제로 충당 이연 로직 변경, 이연변경 로직 분리
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120ChangePost00 (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
   
      e_Error       EXCEPTION;
      
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL) THEN
         v_Return_Message := '마감년월(' || v_Period || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id)) THEN
         v_Return_Message := '등록자 ID(' || v_Reg_Id || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

        INSERT  INTO RTRE0126_TMP
        SELECT  v_Period
             ,  ORD_NO
          FROM  (
                    SELECT  *
                      FROM  RTSD0013
                     WHERE  1=1
                       AND  PRS_DCD = 'B00007'
                       AND  ORD_NO IN (
                                SELECT A.ORD_NO
                                   FROM (
                                         SELECT DISTINCT A.ORD_NO, CUST_NO
                                           FROM 
                                                (SELECT A.ORD_NO, A.CUST_NO, 
                                                        RANK() OVER(PARTITION BY A.ORD_NO ORDER BY A.REG_DT ASC)  AS RNK
                                                   FROM RTCS0010 A
                                                  WHERE A.DLVR_DAY >= TO_CHAR(ADD_MONTHS(TO_DATE(v_Period,'YYYYMM'),-1),'YYYYMM') || '01' -- 전월 이후 신청내역부터 조회
                                                    AND A.DLV_STAT NOT IN ('01','06') -- 취소건이나 SAP로 미전송된 건은 제외
                                                ) A,
                                                RTSD0116 B,
                                                RTSD0115 C
                                          WHERE A.ORD_NO = B.ORD_NO
                                            AND A.RNK    = B.NUM
                                            AND B.GI_DAY LIKE v_Period||'%'
                                            AND B.ORD_NO = C.ORD_NO
                                            AND B.VBELN  = C.VBELN
                                            AND B.NUM IS NOT NULL  
                                        ) A,               
                                        RTRE0120 B
                                  WHERE A.ORD_NO    = B.ORD_NO
                                    AND B.POSTP_TP IN ('02', '03')
                                    AND B.PP_STAT  IN ('A', 'O')
                                 GROUP  BY A.ORD_NO    
                            ) 
                )     
         WHERE  (CNT_CD = '02' AND SERV_CNT0 >= 2 OR  CNT_CD = '04' AND SERV_CNT0 > 2)
        ;
        
        INSERT  INTO RTRE0126_TMP
        SELECT  v_Period
             ,  X.ORD_NO
          FROM  (
                    SELECT  *
                      FROM  RTSD0013
                     WHERE  1=1
                       AND  PRS_DCD = 'B00007'
                       AND  ORD_NO IN (
                                SELECT A.ORD_NO
                                   FROM (
                                         SELECT DISTINCT A.ORD_NO, CUST_NO
                                           FROM 
                                                (SELECT A.ORD_NO, A.CUST_NO, 
                                                        RANK() OVER(PARTITION BY A.ORD_NO ORDER BY A.REG_DT ASC)  AS RNK
                                                   FROM RTCS0010 A
                                                  WHERE A.DLVR_DAY >= TO_CHAR(ADD_MONTHS(TO_DATE(v_Period,'YYYYMM'),-1),'YYYYMM') || '01' -- 전월 이후 신청내역부터 조회
                                                    AND A.DLV_STAT NOT IN ('01','06') -- 취소건이나 SAP로 미전송된 건은 제외
                                                ) A,
                                                RTSD0116 B,
                                                RTSD0115 C
                                          WHERE A.ORD_NO = B.ORD_NO
                                            AND A.RNK    = B.NUM
                                            AND B.GI_DAY LIKE v_Period||'%'
                                            AND B.ORD_NO = C.ORD_NO
                                            AND B.VBELN  = C.VBELN
                                            AND B.NUM IS NOT NULL  
                                        ) A,               
                                        RTRE0120 B
                                  WHERE A.ORD_NO    = B.ORD_NO
                                    AND B.POSTP_TP IN ('02', '03')
                                    AND B.PP_STAT  IN ('A', 'O')
                                 GROUP  BY A.ORD_NO    
                            ) 
                ) X    
         WHERE  NOT EXISTS (SELECT 1 FROM RTRE0120 WHERE ORD_NO = X.ORD_NO AND POSTP_TP IN ('09','10') AND PP_STAT NOT IN ('Q')) 
        ;
        
      v_Success_code   := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText      := '';
         
      DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost00::정상처리');
      DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
      DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
      DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
      
   EXCEPTION
      WHEN e_Error THEN
         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost00::사용자정의에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
      WHEN OTHERS THEN
         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := NVL (TRIM (v_Return_Message), '시스템관리자에게 문의바랍니다!.');
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost00::시스템에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
   END p_CreateRtre0120ChangePost00;
   
   
   /*****************************************************************************
   -- 이연처리 변경사항 반영 - Step 01
      - 이연처리 변경내역 생성
      
      REVISIONS
      Ver        Date        Author           Description
      ---------  ----------  ---------------  -------------------------------------
      1.8        2020-01-14  rentaldev        [20200114_01] 걱정제로 충당 이연 로직 변경, 이연변경 로직 분리
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120ChangePost01 (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtsd0108 IS
         SELECT COUNT(*) OVER () AS TOT_CNT,A.ORD_NO, A.END_TP, B.POSTP_TP
           FROM RTSD0108 A, RTRE0120 B
          WHERE     A.CANC_DAY BETWEEN v_Period || '01'
                                   AND TO_CHAR (
                                          LAST_DAY (
                                             TO_DATE (v_Period, 'YYYYMM')),
                                          'YYYYMMDD')
                AND A.MFP_YN = 'Y'
--                AND A.ORD_NO IN ('D16000037442','D16000044998','D16000041520','D16000041698')
                AND A.ORD_NO = B.ORD_NO
                AND B.PP_STAT IN ('A') ; --[20161031_05]

      e_Error       EXCEPTION;
      v_curr_cunt   NUMBER;

   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL) THEN
         v_Return_Message := '마감년월(' || v_Period || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id)) THEN
         v_Return_Message := '등록자 ID(' || v_Reg_Id || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      -- 이미처리되었는지 확인
      v_curr_cunt := 0;

      BEGIN
         SELECT COUNT (*)
           INTO v_curr_cunt
           FROM RTRE0120
          WHERE PPCH_YM = v_Period
            AND PP_STAT NOT IN ('A');
      EXCEPTION
         WHEN OTHERS THEN
            v_curr_cunt := 0;
      END;

      IF NVL (v_curr_cunt, 0) > 0 THEN
         v_Return_Message := '마감년월(' || v_Period || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      -- 이연처리 변경내역 생성
      FOR CUR_0108 IN Cur_Rtsd0108 LOOP
         EXIT WHEN Cur_Rtsd0108%NOTFOUND;

         v_curr_cunt := v_curr_cunt + 1;
         
--         Pkg_Utility.p_InfoFileWrite ('Pkg_Rtre0120.p_CreateRtre0120ChangePost(1/3)', v_curr_cunt||'/'||CUR_0108.TOT_CNT, CUR_0108.ORD_NO);
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost01'||'['||v_curr_cunt||'/'||CUR_0108.TOT_CNT||']['||CUR_0108.ORD_NO||']');

         p_Rtre0120ChangeMain (CUR_0108.ORD_NO,
                               CUR_0108.POSTP_TP,
                               CUR_0108.END_TP,
                               v_Period,
                               v_Reg_Id,
                               v_Success_Code,
                               v_Return_Message,
                               v_ErrorText);

         IF v_Success_Code <> 0 THEN
            RAISE e_Error;
         END IF;
      END LOOP;

      IF Cur_Rtsd0108%ISOPEN THEN
         CLOSE Cur_Rtsd0108;
      END IF;      

      IF v_curr_cunt > 0 THEN
         v_Success_code   := 0;
         v_Return_Message := '정상적으로 처리되었습니다';
         v_ErrorText      := '';
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost01::정상처리');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');

      ELSE
         v_Return_Message := '마감년월(' || v_Period || ') : 처리건이 존재하지 않습니다!';
         RAISE e_Error;
      END IF;
      
   EXCEPTION
      WHEN e_Error THEN
         IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
         END IF;

         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost01::사용자정의에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
      WHEN OTHERS THEN
         IF Cur_Rtsd0108%ISOPEN THEN
            CLOSE Cur_Rtsd0108;
         END IF;

         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := NVL (TRIM (v_Return_Message), '시스템관리자에게 문의바랍니다!.');
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost01::시스템에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
   END p_CreateRtre0120ChangePost01;
   
   
   /*****************************************************************************
   -- 이연처리 변경사항 반영 - Step 02
      - 걱정제로 서비스 이연처리 1
      
      REVISIONS
      Ver        Date        Author           Description
      ---------  ----------  ---------------  -------------------------------------
      1.8        2020-01-14  rentaldev        [20200114_01] 걱정제로 충당 이연 로직 변경, 이연변경 로직 분리
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120ChangePost02 (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS

      e_Error       EXCEPTION;
      
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL) THEN
         v_Return_Message := '마감년월(' || v_Period || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id)) THEN
         v_Return_Message := '등록자 ID(' || v_Reg_Id || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;
      
      -- 2016-05-13 이영근, 걱정제로 서비스 이연처리
      p_ZeroChangePostSer (v_Period,
                           v_Reg_Id,
                           v_Success_Code,
                           v_Return_Message,
                           v_ErrorText);
                                       
      IF v_Success_Code <> 0 THEN
         RAISE e_Error;
      END IF;
      
      v_Success_code   := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText      := '';
         
      DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost02::정상처리');
      DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
      DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
      DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');      
      
   EXCEPTION
      WHEN e_Error THEN
         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost02::사용자정의에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
      WHEN OTHERS THEN
         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := NVL (TRIM (v_Return_Message), '시스템관리자에게 문의바랍니다!.');
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost02::시스템에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
   END p_CreateRtre0120ChangePost02;
   
   
   /*****************************************************************************
   -- 이연처리 변경사항 반영 - Step 03
      - 걱정제로 서비스 이연처리 2
      
      REVISIONS
      Ver        Date        Author           Description
      ---------  ----------  ---------------  -------------------------------------
      1.8        2020-01-14  rentaldev        [20200114_01] 걱정제로 충당 이연 로직 변경, 이연변경 로직 분리
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120ChangePost03 (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS

      e_Error       EXCEPTION;
      
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL) THEN
         v_Return_Message := '마감년월(' || v_Period || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id)) THEN
         v_Return_Message := '등록자 ID(' || v_Reg_Id || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;
      
      p_ZeroSrvChangePostSer (v_Period,
                              v_Reg_Id,
                              v_Success_Code,
                              v_Return_Message,
                              v_ErrorText);
                               
      IF v_Success_Code <> 0 THEN
         RAISE e_Error;
      END IF;
      
      v_Success_code   := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText      := '';
         
      DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost03::정상처리');
      DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
      DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
      DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
      
   EXCEPTION
      WHEN e_Error THEN         
         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost03::사용자정의에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
      WHEN OTHERS THEN        
         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := NVL (TRIM (v_Return_Message), '시스템관리자에게 문의바랍니다!.');
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost03::시스템에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
   END p_CreateRtre0120ChangePost03;
   
   
   /*****************************************************************************
   -- 이연처리 변경사항 반영 - Step 04
      - 장착당월 중도완납(해지)건 감가상각구분 변경
   
      REVISIONS
      Ver        Date        Author           Description
      ---------  ----------  ---------------  -------------------------------------
      1.8        2020-01-14  rentaldev        [20200114_01] 걱정제로 충당 이연 로직 변경, 이연변경 로직 분리
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120ChangePost04 (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
   
      e_Error       EXCEPTION;
      
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL) THEN
         v_Return_Message := '마감년월(' || v_Period || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id)) THEN
         v_Return_Message := '등록자 ID(' || v_Reg_Id || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      --[20190401_01] 장착당월 중도완납(해지)건 감가상각구분 변경 (E, C -> N)
      FOR cur1 IN (
        SELECT  ORD_NO
          FROM  RTSD0108
         WHERE  PROC_DAY LIKE v_Period||'%'
           AND  MFP_YN = 'Y'
           AND  CANC_DAY LIKE v_Period||'%'
      ) LOOP
      
--        Pkg_Utility.p_InfoFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(3)', '장착당월 중도완납해지', cur1.ORD_NO);
        DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost04::장착당월 중도완납해지['||cur1.ORD_NO||']');
        
        UPDATE  RTRE0125
           SET  POSTP_STAT  = 'N'
         WHERE  ORD_NO      = cur1.ORD_NO
           AND  POSTP_TP   IN ('02','03')
           AND  POSTP_STAT IN ('E','C')
        ;
                   
      END LOOP; 
      
      v_Success_code   := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText      := '';
         
      DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost04::정상처리');
      DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
      DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
      DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
      
   EXCEPTION
      WHEN e_Error THEN
         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost04::사용자정의에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
      WHEN OTHERS THEN
         ROLLBACK;
         v_Success_code   := -1;
         v_Return_Message := NVL (TRIM (v_Return_Message), '시스템관리자에게 문의바랍니다!.');
         v_ErrorText      := SUBSTR (SQLERRM, 1, 200);
         
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_CreateRtre0120ChangePost04::시스템에러');
         DBMS_OUTPUT.PUT_LINE('v_Success_code = ['||v_Success_code||']');
         DBMS_OUTPUT.PUT_LINE('v_Return_Message = ['||v_Return_Message||']');
         DBMS_OUTPUT.PUT_LINE('v_ErrorText = ['||v_ErrorText||']');
         
   END p_CreateRtre0120ChangePost04;
   
   
   /*****************************************************************************
   -- 수수료 이연대상 생성
    REVISIONS
    Ver        Date        Author           Description
    ---------  ----------  ---------------  -------------------------------------
    1.8        2019-06-11  wjim             [20190611_01] 서비스 판매수수료, 판매장려수수료 추가
   *****************************************************************************/
   PROCEDURE p_CreateRtre0120CommPostpone (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtre0120
      IS
      -- [20190611_01] 이전
--         SELECT A.ORD_NO,
--                A.COMM_TP,
--                A.SLCM_YM PSRT_YM,
--                ROUND (A.SLCM_AMT / 1.1) ACQ_AMT,
--                B.PERIOD_CD,
--                A.CHAN_CD,
--                A.ORD_AGENT AGENCY_CD,
--                C.CUST_TP,
--                NVL(TRIM(D.MATNR_S), A.MAT_CD) MAT_CD,
--                A.CNT_CD
--           FROM RTRE5040 A, RTSD0108 B, RTSD0100 C, RTSD0115 D
--          WHERE     A.SLCM_YM = v_Period
--                AND A.PPOB_YN = 'Y'
--                AND A.ORD_NO = B.ORD_NO
--                AND A.CUST_NO = C.CUST_NO
--                AND A.ORD_NO = D.ORD_NO(+)
--                AND D.TRANS_TP(+) = 'N'
         -- [20190611_01] 이후
         -- - 서비스판매수수료, 판매장려수수료는 기존 판매수수료에 합산
         SELECT A.ORD_NO,
                MIN(A.COMM_TP) COMM_TP,
                A.SLCM_YM PSRT_YM,
                ROUND (SUM(A.SLCM_AMT) / 1.1) ACQ_AMT,
                B.PERIOD_CD,
                A.CHAN_CD,
                A.ORD_AGENT AGENCY_CD,
                C.CUST_TP,
                NVL(TRIM(D.MATNR_S), A.MAT_CD) MAT_CD,
                A.CNT_CD
           FROM RTRE5040 A, RTSD0108 B, RTSD0100 C, RTSD0115 D
          WHERE     A.SLCM_YM = v_Period
                AND A.PPOB_YN = 'Y'
                AND A.ORD_NO = B.ORD_NO
                AND A.CUST_NO = C.CUST_NO
                AND A.ORD_NO = D.ORD_NO(+)
                AND D.TRANS_TP(+) = 'N'
         GROUP  BY A.ORD_NO,                
                A.SLCM_YM,
                B.PERIOD_CD,
                A.CHAN_CD,
                A.ORD_AGENT,
                C.CUST_TP,
                NVL(TRIM(D.MATNR_S), A.MAT_CD),
                A.CNT_CD
         UNION
         SELECT A.ORD_NO,
                A.COMM_TP,
                A.SLCM_YM PSRT_YM,
                ROUND (A.PROCC_AMT / 1.1) ACQ_AMT,
                B.PERIOD_CD,
                A.CHAN_CD,
                A.AGENCY_CD,
                C.CUST_TP,
                NVL(TRIM(D.MATNR_S), A.MAT_CD) MAT_CD,
                A.CNT_CD
           FROM RTRE5050 A, RTSD0108 B, RTSD0100 C, RTSD0115 D
          WHERE     A.SLCM_YM = v_Period
                AND A.PPOB_YN = 'Y'
                AND A.ORD_NO = B.ORD_NO
                AND A.CUST_NO = C.CUST_NO
                AND A.ORD_NO = D.ORD_NO(+)
                AND D.TRANS_TP(+) = 'N';
 

      e_Error       EXCEPTION;
      v_curr_cunt   NUMBER;

      v_Ord_No      RTRE0120.ORD_NO%TYPE;               /*계약번호              */
      v_Postp_Tp    RTRE0120.POSTP_TP%TYPE;             /*이연항목              */
      v_Pstr_Ym     RTRE0120.PSTR_YM%TYPE;               /*이연시작월            */
      v_Pptrm       RTRE0120.PPTRM%TYPE;                /*이연기간              */
      v_Acq_Amt     RTRE0120.ACQ_AMT%TYPE;                  /*이연처리대상금액      */
      v_Res_Amt     RTRE0120.RES_AMT%TYPE;              /*잔존가액              */
      v_Prost_Tp    RTRE0120.PROST_TP%TYPE;             /*처리구분              */
      v_Chan_Cd     RTRE0120.CHAN_CD%TYPE;              /*채널구분              */
      v_Agency_Cd   RTRE0120.AGENCY_CD%TYPE;            /*취득조직              */
      v_Cust_Tp     RTRE0120.CUST_TP%TYPE;              /*고객유형              */
      v_Mat_Cd      RTRE0120.MAT_CD%TYPE;               /*상품코드              */
      v_Ord_Qty     RTRE0120.ORD_QTY%TYPE;              /*장착갯수              */
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF    (TRIM (v_Period) IS NULL)
         OR (0 <> ISDATE (v_Period))
         OR (6 <> LENGTH (TRIM (v_Period)))
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Pstr_Ym := v_Period;
      v_Prost_Tp := 'C';                                              -- 비용(C)

      -- 이미처리되었는지 확인
      v_Postp_Tp := '04';                                     -- 대리점 판매수수료(04)

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Postp_Tp := '05';                                      -- 방판 판매수수료(05)

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Postp_Tp := '06';                                     -- 오픈몰 판매수수료(06)

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Postp_Tp := '07';                                   -- 타이어뱅크 판매수수료(07)

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Postp_Tp := '08';                                         -- 장착수수료(08)

      IF 0 <> f_sRtre0120Pstr_YmCount (v_Pstr_Ym, v_Postp_Tp)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') 이연항목('
            || v_Postp_Tp
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_curr_cunt := 0;

      -- 이연처리 월별내역 UPDATE
      FOR CUR_0120 IN Cur_Rtre0120
      LOOP
         EXIT WHEN Cur_Rtre0120%NOTFOUND;

         v_curr_cunt := v_curr_cunt + 1;

         IF CUR_0120.COMM_TP = 'A1'
         THEN
            v_Postp_Tp := '04';
         ELSIF CUR_0120.COMM_TP = 'A2'
         THEN
            v_Postp_Tp := '05';
         ELSIF CUR_0120.COMM_TP = 'A3'
         THEN
            v_Postp_Tp := '06';
         ELSIF CUR_0120.COMM_TP = 'A4'
         THEN
            v_Postp_Tp := '07';
         ELSIF CUR_0120.COMM_TP = 'B1'
         THEN
            v_Postp_Tp := '08';
         ELSIF CUR_0120.COMM_TP = 'B2'
         THEN
            v_Postp_Tp := '08';
         END IF;

         --        p_CreateRtre0120Postpone(v_Ord_No, v_Postp_Tp, v_Pstr_Ym, v_Pptrm,
         --                                 v_Acq_Amt, v_Res_Amt, v_Prost_Tp, v_Chan_Cd,
         --                                 v_Agency_Cd, v_Cust_Tp, v_Mat_Cd, v_Ord_Qty,
         p_CreateRtre0120Postpone (CUR_0120.ORD_NO,
                                   v_Postp_Tp,
                                   v_Pstr_Ym,
                                   CUR_0120.PERIOD_CD,
                                   CUR_0120.ACQ_AMT,
                                   0,
                                   v_Prost_Tp,
                                   CUR_0120.CHAN_CD,
                                   CUR_0120.AGENCY_CD,
                                   CUR_0120.CUST_TP,
                                   CUR_0120.MAT_CD,
                                   CUR_0120.CNT_CD,
                                   v_Reg_Id,
                                   v_Success_Code,
                                   v_Return_Message,
                                   v_ErrorText);

         IF v_Success_Code <> 0
         THEN
            RAISE e_Error;
         END IF;
      END LOOP;

      IF Cur_Rtre0120%ISOPEN
      THEN
         CLOSE Cur_Rtre0120;
      END IF;


      IF v_curr_cunt > 0
      THEN
         v_Success_code := 0;
         v_Return_Message := '정상적으로 처리되었습니다';
         v_ErrorText := '';
      --COMMIT;
      ELSE
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 처리건이 존재하지 않습니다!';
         RAISE e_Error;
      END IF;
   EXCEPTION
      WHEN e_Error
      THEN
         IF Cur_Rtre0120%ISOPEN
         THEN
            CLOSE Cur_Rtre0120;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120CommPostpone(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         IF Cur_Rtre0120%ISOPEN
         THEN
            CLOSE Cur_Rtre0120;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (
               TRIM (v_Return_Message),
                  '시스템관리자에게 문의바랍니다!. - '
               || SUBSTR (SQLERRM, 1, 200));
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120CommPostpone(2)',
            v_ErrorText,
            v_Return_Message);
   END p_CreateRtre0120CommPostpone;

   /*****************************************************************************
     -- 이연처리 변경사항 반영
     *****************************************************************************/
   PROCEDURE p_CreateRtre0120ChangePostSer (
      v_Period           IN     CHAR,                 /*년월                  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtsd0108
      IS
         SELECT A.ORD_NO, A.END_TP, B.POSTP_TP
           FROM RTSD0108 A, RTRE0120 B
          WHERE     A.CANC_DAY BETWEEN v_Period || '01'
                                   AND TO_CHAR (
                                          LAST_DAY (
                                             TO_DATE (v_Period, 'YYYYMM')),
                                          'YYYYMMDD')
                AND A.MFP_YN = 'Y'
                AND A.ORD_NO = B.ORD_NO;


      e_Error       EXCEPTION;
      v_curr_cunt   NUMBER;

      v_Ord_No      RTRE0120.ORD_NO%TYPE;               /*계약번호              */
      v_Postp_Tp    RTRE0120.POSTP_TP%TYPE;             /*이연항목              */
      v_Pstr_Ym     RTRE0120.PSTR_YM%TYPE;               /*이연시작월            */
      v_Pptrm       RTRE0120.PPTRM%TYPE;                /*이연기간              */
      v_Acq_Amt     RTRE0120.ACQ_AMT%TYPE;                  /*이연처리대상금액      */
      v_Res_Amt     RTRE0120.RES_AMT%TYPE;              /*잔존가액              */
      v_Prost_Tp    RTRE0120.PROST_TP%TYPE;             /*처리구분              */
      v_Chan_Cd     RTRE0120.CHAN_CD%TYPE;              /*채널구분              */
      v_Agency_Cd   RTRE0120.AGENCY_CD%TYPE;            /*취득조직              */
      v_Cust_Tp     RTRE0120.CUST_TP%TYPE;              /*고객유형              */
      v_Mat_Cd      RTRE0120.MAT_CD%TYPE;               /*상품코드              */
      v_Ord_Qty     RTRE0120.ORD_QTY%TYPE;              /*장착갯수              */
      v_Acq_Tot     RTRE0120.ACQ_AMT%TYPE;                  /*이연처리전체금액      */
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Pstr_Ym := v_Period;

      -- 이미처리되었는지 확인
      v_curr_cunt := 0;

      BEGIN
         SELECT COUNT (*)
           INTO v_curr_cunt
           FROM RTSD0108 A, RTRE0120 B
          WHERE     A.CANC_DAY BETWEEN v_Period || '01'
                                   AND TO_CHAR (
                                          LAST_DAY (
                                             TO_DATE (v_Period, 'YYYYMM')),
                                          'YYYYMMDD')
                AND A.MFP_YN = 'Y'
                AND A.ORD_NO = B.ORD_NO
                AND B.PP_STAT <> 'A'
                AND ROWNUM = 1;
      EXCEPTION
         WHEN OTHERS
         THEN
            v_curr_cunt := 0;
      END;

      IF NVL (v_curr_cunt, 0) > 0
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 이미 처리되어 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;


      -- 이연처리 변경내역 생성
      FOR CUR_0108 IN Cur_Rtsd0108
      LOOP
         EXIT WHEN Cur_Rtsd0108%NOTFOUND;

         v_curr_cunt := v_curr_cunt + 1;
         --        p_Rtre0120ChangeMain(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym,
         p_Rtre0120ChangeMain (CUR_0108.ORD_NO,
                               CUR_0108.POSTP_TP,
                               CUR_0108.END_TP,
                               v_Period,
                               v_Reg_Id,
                               v_Success_Code,
                               v_Return_Message,
                               v_ErrorText);

         IF v_Success_Code <> 0
         THEN
            RAISE e_Error;
         END IF;
      END LOOP;

      IF Cur_Rtsd0108%ISOPEN
      THEN
         CLOSE Cur_Rtsd0108;
      END IF;


      IF v_curr_cunt > 0
      THEN
         v_Success_code := 0;
         v_Return_Message := '정상적으로 처리되었습니다';
         v_ErrorText := '';
      --COMMIT;
      ELSE
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 처리건이 존재하지 않습니다!';
         RAISE e_Error;
      END IF;
   EXCEPTION
      WHEN e_Error
      THEN
         IF Cur_Rtsd0108%ISOPEN
         THEN
            CLOSE Cur_Rtsd0108;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120ChangePost(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         IF Cur_Rtsd0108%ISOPEN
         THEN
            CLOSE Cur_Rtsd0108;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120ChangePost(2)',
            v_ErrorText,
            v_Return_Message);
   END p_CreateRtre0120ChangePostSer;

   /*****************************************************************************
   /*****************************************************************************
   /*****************************************************************************
   /*****************************************************************************
   /*****************************************************************************
   /*****************************************************************************
   /*****************************************************************************
 /*****************************************************************************
   -- 이연처리 변경사항 반영-- 걱정제로 서비스 이연 변경      감가상각    <시작
   
   -- VER 1.1 2016-04-26 이영근, 걱정제로 서비스 출고완료 기준으로 감가상각 처리
   *****************************************************************************/
   PROCEDURE p_ZeroChangePostSer (v_Period           IN     CHAR, /*년월                  */
                                  v_Reg_Id           IN     RTRE0120.REG_ID%TYPE, /*등록자 ID             */
                                  v_Success_Code        OUT NUMBER,
                                  v_Return_Message      OUT VARCHAR2,
                                  v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtcs0010
      IS
         SELECT COUNT(*) OVER () AS TOT_CNT,
                A.ORD_NO,
                B.POSTP_TP,
                'S' AS END_TP,
                B.ORD_QTY,
                B.PP_STAT
           FROM (
                 SELECT DISTINCT A.ORD_NO, CUST_NO
                   FROM 
                        (SELECT A.ORD_NO, A.CUST_NO, 
                                RANK() OVER(PARTITION BY A.ORD_NO ORDER BY A.REG_DT ASC)  AS RNK
                           FROM RTCS0010 A
                          WHERE A.DLVR_DAY >= TO_CHAR(ADD_MONTHS(TO_DATE(v_Period,'YYYYMM'),-1),'YYYYMM') || '01' -- 전월 이후 신청내역부터 조회
                            AND A.DLV_STAT NOT IN ('01','06') -- 취소건이나 SAP로 미전송된 건은 제외
                        ) A,
                        RTSD0116 B,
                        RTSD0115 C
                  WHERE A.ORD_NO = B.ORD_NO
                    AND A.RNK    = B.NUM
                    AND B.GI_DAY LIKE v_Period||'%'
                    AND B.ORD_NO = C.ORD_NO
                    AND B.VBELN  = C.VBELN
                    AND B.NUM IS NOT NULL  
                ) A,               
                RTRE0120 B
          WHERE A.ORD_NO    = B.ORD_NO
--            AND A.ORD_NO IN ('D16000037442','D16000044998','D16000041520','D16000041698') --12321
            AND B.POSTP_TP IN ('02', '03')
            AND B.PP_STAT  IN ('A', 'O')
            AND A.ORD_NO NOT IN (SELECT ORD_NO FROM RTRE0126_TMP WHERE PERIOD_YM = v_Period) --2019.05.01 by wjim
            ;


      e_Error       EXCEPTION;
      v_curr_cunt   NUMBER;

      v_Ord_No      RTRE0120.ORD_NO%TYPE;               /*계약번호              */
      v_Postp_Tp    RTRE0120.POSTP_TP%TYPE;             /*이연항목              */
      v_Pstr_Ym     RTRE0120.PSTR_YM%TYPE;              /*이연시작월            */
      v_Pptrm       RTRE0120.PPTRM%TYPE;                /*이연기간              */
      v_Acq_Amt     RTRE0120.ACQ_AMT%TYPE;              /*이연처리대상금액      */
      v_Res_Amt     RTRE0120.RES_AMT%TYPE;              /*잔존가액              */
      v_Prost_Tp    RTRE0120.PROST_TP%TYPE;             /*처리구분              */
      v_Chan_Cd     RTRE0120.CHAN_CD%TYPE;              /*채널구분              */
      v_Agency_Cd   RTRE0120.AGENCY_CD%TYPE;            /*취득조직              */
      v_Cust_Tp     RTRE0120.CUST_TP%TYPE;              /*고객유형              */
      v_Mat_Cd      RTRE0120.MAT_CD%TYPE;               /*상품코드              */
      v_Ord_Qty     RTRE0120.ORD_QTY%TYPE;              /*장착갯수              */
      v_Acq_Tot     RTRE0120.ACQ_AMT%TYPE;              /*이연처리전체금액      */
   BEGIN
      -- 필수값: 마감년월, 등록자 ID
      IF (TRIM (v_Period) IS NULL)
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      v_Pstr_Ym := v_Period;

      -- 이미처리되었는지 확인
      v_curr_cunt := 0;

      BEGIN
         SELECT COUNT (*)
           INTO v_curr_cunt
           FROM (
                 SELECT DISTINCT A.ORD_NO, CUST_NO
                   FROM 
                        (SELECT A.ORD_NO, A.CUST_NO, 
                                RANK() OVER(PARTITION BY A.ORD_NO ORDER BY A.REG_DT ASC)  AS RNK
                           FROM RTCS0010 A
                          WHERE A.DLVR_DAY >= TO_CHAR(ADD_MONTHS(TO_DATE(v_Period,'YYYYMM'),-1),'YYYYMM') || '01' -- 전월 이후 신청내역부터 조회
                            AND A.DLV_STAT NOT IN ('01','06') -- 취소건이나 SAP로 미전송된 건은 제외
                        ) A,
                        RTSD0116 B,
                        RTSD0115 C
                  WHERE A.ORD_NO = B.ORD_NO
                    AND A.RNK    = B.NUM
                    AND B.GI_DAY LIKE v_Period||'%'
                    AND B.ORD_NO = C.ORD_NO
                    AND B.VBELN  = C.VBELN                    
                    AND B.NUM IS NOT NULL           
                ) A, 
                RTRE0120 B, 
                RTRE0125 C
          WHERE C.ORD_NO    = B.ORD_NO(+)
--            AND C.ORD_NO IN ('D16000037442','D16000044998','D16000041520','D16000041698') --12321
            AND C.POSTP_TP  = B.POSTP_TP(+)
            AND A.ORD_NO    = B.ORD_NO
            AND B.PP_STAT  <> 'A'
            AND B.POSTP_TP IN ('02', '03')
            AND C.ZERO_DAY  = v_Period
            AND ROWNUM      = 1;
      EXCEPTION
         WHEN OTHERS
         THEN
            v_Return_Message := '조회실패1';
            v_curr_cunt := -1;
            RAISE e_Error;
      END;

      IF NVL (v_curr_cunt, 0) > 0
      THEN
         v_Return_Message :=
               '마감년월('
            || v_Period
            || ') : 이미 처리되어 처리가 불가 합니다';
         RAISE e_Error;
      END IF;


      -- 이연처리 변경내역 생성
      FOR CUR_0010 IN Cur_Rtcs0010
      LOOP
         EXIT WHEN Cur_Rtcs0010%NOTFOUND;
         
         v_curr_cunt := v_curr_cunt + 1;
         
--         Pkg_Utility.p_InfoFileWrite ('Pkg_Rtre0120.p_ZeroChangePostSer(2/3)', v_curr_cunt||'/'||CUR_0010.TOT_CNT, CUR_0010.ORD_NO);
         DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_ZeroChangePostSer(2/3)'||'['||v_curr_cunt||'/'||CUR_0010.TOT_CNT||']['||CUR_0010.ORD_NO||']');
         
         p_Rtre0120ZeroMainSer (CUR_0010.ORD_NO,
                                CUR_0010.POSTP_TP,
                                CUR_0010.END_TP,
                                v_Period,
                                v_Reg_Id,
                                v_Success_Code,
                                v_Return_Message,
                                v_ErrorText);


         IF v_Success_Code <> 0
         THEN
            RAISE e_Error;
         END IF;
      END LOOP;

      IF Cur_Rtcs0010%ISOPEN
      THEN
         CLOSE Cur_Rtcs0010;
      END IF;
      
      --[20161031_05] 이후 로직
      v_Success_code := 0;
      v_Return_Message := '정상적으로 처리되었습니다';
      v_ErrorText := '';

    /* [20161031_05] 이전 로직
      IF v_curr_cunt > 0
      THEN
         v_Success_code := 0;
         v_Return_Message := '정상적으로 처리되었습니다';
         v_ErrorText := '';
      --COMMIT;
      ELSE
         v_Return_Message :=
               v_Success_Code
            || v_Return_Message
            || '마감년월('
            || v_Period
            || ') : 처리건이 존재하지 않습니다!(ERR CODE: 4D7B2V)';
         RAISE e_Error;
      END IF;
      */
   EXCEPTION
      WHEN e_Error
      THEN
         IF Cur_Rtcs0010%ISOPEN
         THEN
            CLOSE Cur_Rtcs0010;
         END IF;

         ROLLBACK;
         -- v_Success_code := -1;
         v_Return_Message := v_Return_Message;
         v_ErrorText := SUBSTR (SQLERRM, 1, 200) || ':' || TRIM (v_ErrorText);
--         dbms_output.put_line('Pkg_Rtre0120.p_CreateRtre0120ChangePost(11)::'||v_Return_Message);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120ChangePost(1)',
            v_ErrorText,
            v_Return_Message);
      WHEN OTHERS
      THEN
         IF Cur_Rtcs0010%ISOPEN
         THEN
            CLOSE Cur_Rtcs0010;
         END IF;

         ROLLBACK;
         v_Success_code := -1;
         v_Return_Message :=
            NVL (TRIM (v_Return_Message),
                 '시스템관리자에게 문의바랍니다!.');
         v_ErrorText := SUBSTR (SQLERRM, 1, 200);
         Pkg_Utility.p_ErrorFileWrite (
            'Pkg_Rtre0120.p_CreateRtre0120ChangePost(2)',
            v_ErrorText,
            v_Return_Message);
   END p_ZeroChangePostSer;

   /*****************************************************************************
   -- [RE] 걱정제로 이연대상 중도변경 처리 Main- 1
   *****************************************************************************/
   PROCEDURE p_Rtre0120ZeroMainSer (
      v_Ord_No           IN     RTRE0120.ORD_NO%TYPE,   /*계약번호              */
      v_Postp_Tp         IN     RTRE0120.POSTP_TP%TYPE, /*이연항목              */
      v_Pp_Stat          IN     RTRE0120.PP_STAT%TYPE,    /*이연대상상태          */
      v_Ppch_Ym          IN     RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
      v_Reg_Id           IN     RTRE0120.REG_ID%TYPE,  /*등록자 ID             */
      v_Success_Code        OUT NUMBER,
      v_Return_Message      OUT VARCHAR2,
      v_ErrorText           OUT VARCHAR2)
   IS
      CURSOR Cur_Rtre0120
      IS
         SELECT ORD_NO, POSTP_TP
           FROM RTRE0120
          WHERE ORD_NO  = v_Ord_No
            AND POSTP_TP = DECODE (NVL (v_Postp_Tp, ''),
                                   '', POSTP_TP,
                                   v_Postp_Tp)
            AND pp_stat = 'A';

      e_Error       EXCEPTION;

      v_curr_cunt   NUMBER;
   BEGIN
      -- 필수값: 계약번호, 이연항목, 이연대상상태, 이연대상상태변경년월, 등록자 ID
      IF    (TRIM (v_Ord_No) IS NULL)
         OR Pkg_Rtsd0108.f_sRtsd0108Count (v_Ord_No) = 0
      THEN
         v_Return_Message :=
               '계약번호('
            || v_Ord_No
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!(ERR CODE: 3E4D5M)';
         RAISE e_Error;
      END IF;

      -- 이연항목 NULL로 넘어올 수 있음
      IF (TRIM (v_Postp_Tp) IS NOT NULL)
      THEN
         IF 0 = Pkg_Rtcm0051.f_sRtcm0051Count ('R037', v_Postp_Tp)
         THEN
            v_Return_Message :=
                  '이연항목('
               || v_Postp_Tp
               || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
            RAISE e_Error;
         END IF;
      END IF;

      IF    (TRIM (v_Pp_Stat) IS NULL)
         OR 0 = Pkg_Rtcm0051.f_sRtcm0051Count ('R038', v_Pp_Stat)
      THEN
         v_Return_Message :=
               '이연대상상태('
            || v_Pp_Stat
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF (TRIM (v_Ppch_Ym) IS NULL)
      THEN
         v_Return_Message :=
               '이연대상상태변경년월('
            || v_Ppch_Ym
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;

      IF    (TRIM (v_Reg_Id) IS NULL)
         OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count (v_Reg_Id))
      THEN
         v_Return_Message :=
               '등록자 ID('
            || v_Reg_Id
            || ') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
         RAISE e_Error;
      END IF;


      BEGIN
         -- 기존 S는 .. SS로 변경
         UPDATE RTRE0120
            SET pp_stat  = 'SS',
                CHG_ID   = v_Reg_Id,
                CHG_DT   = SYSDATE
          WHERE ORD_NO   = v_Ord_No
            AND POSTP_TP = v_Postp_Tp
            AND pp_stat  = 'S';
    --COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다1';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

        RAISE e_Error;
    END;

    BEGIN
        -- 기존 Z는 .. ZZ로 변경
        UPDATE RTRE0120
        SET    pp_stat   = 'ZZ',
               CHG_ID    = v_Reg_Id,
               CHG_DT    = SYSDATE
        WHERE  ORD_NO    = v_Ord_No
        AND    POSTP_TP  = v_Postp_Tp
        AND    pp_stat   = 'Z';
    --COMMIT;
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다2';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

        RAISE e_Error;
    END;

    -- 이연처리 월별내역 UPDATE
    FOR CUR_0120 IN Cur_Rtre0120 LOOP
        EXIT WHEN Cur_Rtre0120%NOTFOUND;

        BEGIN
            -- 이연처리  월별에서 대상존재여부 확인
            v_curr_cunt := 0;
            SELECT  COUNT(*)
            INTO    v_curr_cunt
            FROM    RTRE0125
            WHERE   ORD_NO      = v_Ord_No
            AND     POSTP_TP    = v_Postp_Tp
            AND     POSTP_YM   >= v_Ppch_Ym
            AND     POSTP_STAT IN ('A', 'O');

        EXCEPTION
        WHEN OTHERS THEN
         v_Return_Message := '조회실패12222';
        v_curr_cunt := -1;
        RAISE e_Error;
    END;

        IF v_curr_cunt > 0 THEN
            p_ZeroRChangePostSer(v_Ord_No, v_Postp_Tp, v_Pp_Stat, v_Ppch_Ym,
                                     v_Reg_Id, v_Success_Code, v_Return_Message, v_ErrorText);
            IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF;
        END IF;

    END LOOP;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtre0120%ISOPEN THEN
            CLOSE Cur_Rtre0120;
        END IF;
         ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangeMain(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre0120%ISOPEN THEN
            CLOSE Cur_Rtre0120;
        END IF;
      --  ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangeMain(2)', v_ErrorText, v_Return_Message);

  END p_Rtre0120ZeroMainSer;

 /*****************************************************************************
   걱정제로 이연대상 중도변경 처리 Main- 2
   -- VER 1.1 2016-04-26 이영근, 걱정제로 서비스 출고완료 기준으로 감가상각 처리
   -- VER 1.2 2016-04-28 이영근, 장착당월 서비스 신청시 'N' -> 'Z'  
  *****************************************************************************/
  PROCEDURE p_ZeroRChangePostSer (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR  Cur_Rtre0125 IS
    SELECT  ORD_NO, POSTP_TP, POSTP_SEQ, POSTP_STAT, POSTP_YM
    FROM    RTRE0125
    WHERE   ORD_NO       = v_Ord_No
    AND     POSTP_TP     = v_Postp_Tp
    AND     (   (POSTP_YM  >= v_Ppch_Ym AND POSTP_STAT  IN ('A','O'))
             OR (POSTP_YM   = v_Ppch_Ym AND POSTP_STAT  IN ('N'))); -- 2016-04-28 이영근, 장착당월 서비스 신청시 'N' -> 'Z'

    CURSOR  Cur_Rtre0120 IS
    SELECT   ORD_NO,  POSTP_TP,  PSTR_YM, PEND_YM, PPTRM, ACQ_AMT, RES_AMT ,MPP_AMT ,LPP_AMT, PROST_TP,CHAN_CD,
             AGENCY_CD,  CUST_TP, MAT_CD, ORD_QTY, PP_STAT, PPCH_YM, Ord_Qty_Now
    FROM    RTRE0120
    WHERE   ORD_NO    = v_Ord_No
    AND     POSTP_TP  = v_Postp_Tp
    AND     PP_STAT  IN ('A','K');

    e_Error EXCEPTION;

    v_Prost_Tp   RTRE0120.PROST_TP%TYPE DEFAULT NULL;

    v_Postp_Seq  RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
    v_Postp_Stat RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Postp_Ym   RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt1 RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt1  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt1 RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt1  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt1   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;

    v_Ly_Tpp_Amt2 RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt2  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt2 RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt2  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt2   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;

    v_curr_cunt       NUMBER;
    v_Kwmeng          NUMBER; --RTCS0010.KWMENG%TYPE;
    v_OrdQtyNow       NUMBER;
    v_Qstat           RTRE0120.PP_STAT%TYPE DEFAULT NULL;
    v_QstatCnt        NUMBER;
    v_Before_Ymd      RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Postp_Stat_Chk  RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Ord_Qty         RTRE0120.ORD_QTY%TYPE DEFAULT NULL;

  BEGIN

--  DBMS_OUTPUT.Put_Line('SELECT  이전 ' || v_Postp_Tp);

    v_Ly_Tpp_Amt := 0;
    v_Cy_Pp_Amt  := 0;
    v_Cy_Tpp_Amt := 0;
    v_Cm_Pp_Amt  := 0;
    v_Cm_R_Amt   := 0;

    v_Ly_Tpp_Amt1 := 0;
    v_Cy_Pp_Amt1  := 0;
    v_Cy_Tpp_Amt1 := 0;
    v_Cm_Pp_Amt1  := 0;
    v_Cm_R_Amt1   := 0;

    BEGIN
        -- 이연처리 처리구분 발췌
        SELECT  PROST_TP, DECODE(ORD_QTY_NOW,'',ORD_QTY,ORD_QTY_NOW)
        INTO    v_Prost_Tp, v_OrdQtyNow
        FROM    RTRE0120
        WHERE   ORD_NO    = v_Ord_No
        AND     POSTP_TP  = v_Postp_Tp
        AND     pp_stat   = 'A';
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다1';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

        RAISE e_Error;
    END;


    BEGIN
        -- 이연처리 처리구분 발췌
        SELECT TO_NUMBER(SUM(A.KWMENG))
          INTO v_Kwmeng
          FROM 
               (SELECT A.ORD_NO, A.KWMENG, 
                       RANK() OVER(PARTITION BY A.ORD_NO ORDER BY A.REG_DT ASC)  AS RNK
                  FROM RTCS0010 A
                 WHERE A.DLVR_DAY >= TO_CHAR(ADD_MONTHS(TO_DATE(v_Ppch_Ym,'YYYYMM'),-1),'YYYYMM') || '01' -- 전월 이후 신청내역부터 조회
                   AND A.DLV_STAT NOT IN ('01','06') -- 취소건이나 SAP로 미전송된 건은 제외
               ) A          
               
         WHERE A.ORD_NO =  v_Ord_No
           AND EXISTS (SELECT 1
                         FROM RTSD0116 B,
                              RTSD0115 C
                        WHERE A.ORD_NO = B.ORD_NO
                          AND A.RNK    = B.NUM
                          AND B.GI_DAY LIKE v_Ppch_Ym||'%'
                          AND B.NUM IS NOT NULL
                          AND B.ORD_NO = C.ORD_NO
                          AND B.VBELN  = C.VBELN);          
        

    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보가 존재하지 않아 처리가 불가 합니다!';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

        RAISE e_Error;
    END;

   -- 이연정보 중도변경으로 UPDATE
    IF 0 <> f_UpdateRtre0120SvrPostpone(v_Ord_No, v_Postp_Tp, 'T', v_Ppch_Ym, v_OrdQtyNow - v_Kwmeng , v_Reg_Id,  v_ErrorText) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 UPDATE 오류입니다!'||v_Postp_Tp||'--T--'||v_Ppch_Ym||'--'|| v_Kwmeng;
        RAISE e_Error;
    END IF;

    BEGIN
        SELECT COUNT(*)
        INTO   v_QstatCnt
        FROM   RTRE0120
        WHERE  pp_stat IN ('T','ZZ')
        AND    ord_no   = v_Ord_No
        AND    postp_tp = v_Postp_Tp;

        IF v_QstatCnt = 1 THEN
            v_Qstat := 'T';
        ELSE
            v_Qstat := 'ZZ';
        END IF;

    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := 'RTRE0120 조회불가-T/ZZ';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

        RAISE e_Error;
    END;


    BEGIN
    INSERT INTO RTRE0120
         SELECT ORD_NO,
                POSTP_TP,
                PSTR_YM,
                PEND_YM,
                PPTRM,
                ROUND (ACQ_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS ACQ_AMT,
                ROUND (RES_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS RES_AMT,
                ROUND (MPP_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS MPP_AMT,
                ROUND (LPP_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS LPP_AMT,
                PROST_TP,
                CHAN_CD,
                AGENCY_CD,
                CUST_TP,
                MAT_CD,
                v_OrdQtyNow  - v_Kwmeng AS ORD_QTY, --변경할것
                'A' AS PP_STAT,
                PPCH_YM,
                REG_ID,
                REG_DT,
                CHG_ID,
                CHG_DT,
                v_OrdQtyNow  - v_Kwmeng
                --     v_Ppch_Ym AS  ZERO_DAY
         FROM rtre0120
         WHERE pp_stat  = 'T'
         -- pp_stat = 'Z'
         AND   ord_no   = v_Ord_No
         AND   postp_tp = v_Postp_Tp
         UNION ALL
         SELECT ORD_NO,
                POSTP_TP,
                PSTR_YM,
                PEND_YM,
                PPTRM,
                ACQ_AMT- ROUND (ACQ_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS ACQ_AMT,   --v_Kwmeng
                RES_AMT- ROUND (RES_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS RES_AMT,
                MPP_AMT- ROUND (MPP_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS MPP_AMT,
                LPP_AMT- ROUND (LPP_AMT / v_OrdQtyNow * (v_OrdQtyNow - v_Kwmeng)) AS LPP_AMT,
                PROST_TP,
                CHAN_CD,
                AGENCY_CD,
                CUST_TP,
                MAT_CD,
                v_Kwmeng AS ORD_QTY, --변경할것
                'K' AS PP_STAT,
                PPCH_YM,
                REG_ID,
                REG_DT,
                CHG_ID,
                CHG_DT,
                v_Kwmeng
                --   v_Ppch_Ym AS  ZERO_DAY
         FROM   rtre0120
         WHERE  pp_stat  = 'T' --v_Qstat
         -- pp_stat = 'Z'
         AND    ord_no   = v_Ord_No
         AND    postp_tp = v_Postp_Tp;

       --  commit;
       EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '120 신규생성 실패';
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
        RAISE e_Error;
    END;



    -- 이연처리 월별내역 UPDATE Z
    FOR CUR_0125 IN Cur_Rtre0125 LOOP
        EXIT WHEN Cur_Rtre0125%NOTFOUND;
        v_Postp_Stat := 'T';
        IF 0 <> Pkg_Rtre0125.f_UpdateRtre0125Postpone(v_Ord_No, v_Postp_Tp, CUR_0125.POSTP_SEQ,
                                                      v_Postp_Stat, v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '계약번호('||v_Ord_No||') : 의 이연정보 월별내역 중도변경 오류입니다!-125 기존 Z로 변경 update 실패';
            RAISE e_Error;
        END IF;

    END LOOP;

    IF Cur_Rtre0125%ISOPEN THEN
        CLOSE Cur_Rtre0125;
    END IF;


    ------------------------임시테이블에 개수대로 뿌리는거 만들어야함==> 신규생성 Rtre0120_TEMP, Rtre0120_TEMPB -------------------------------
    DELETE FROM Rtre0125_temp;
    DELETE FROM Rtre0125_tempB;
    
    -- 이연처리 월별내역 UPDATE
    FOR CUR_0120 IN Cur_Rtre0120 LOOP
        EXIT WHEN Cur_Rtre0120%NOTFOUND;


         p_ZeroCal( CUR_0120.ORD_NO,  CUR_0120.POSTP_TP,  CUR_0120.PSTR_YM,  CUR_0120.PPTRM,     CUR_0120.ACQ_AMT,
                    CUR_0120.RES_AMT, CUR_0120.PROST_TP,  CUR_0120.CHAN_CD,  CUR_0120.AGENCY_CD, CUR_0120.CUST_TP,
                    CUR_0120.MAT_CD,  CUR_0120.ORD_QTY,   CUR_0120.PP_STAT,  v_Ppch_Ym,          v_Reg_Id, 
                    v_Success_Code,   v_Return_Message,   v_ErrorText);


        IF v_Success_Code <> 0 THEN
          v_Return_Message := v_Return_Message||'계약번호('||v_Ord_No||') : 의 이연정보 월별내역 중도변경 오류입니다-임시테이블 생성 실패';
          RAISE e_Error;
        END IF;



    END LOOP;
        ------------------------임시테이블에 개수대로 뿌리는거 만들어야함==> 신규생성끝 -------------------------------

    ------------------------여기까지 , ==> 신규생성끝(임시) 120 T, A, S 만듦  -------------------------------
    ---------------------아래코딩내용  Rtre0120_TEMP 오늘 날자 이우로 밀어넣기 125에,  Rtre0120_TEMPB 이번당월만 보정해서 밀어넣기 ---------
    --------------------T ==> Z 변경하기 ---------------------------------------------------------------------
    BEGIN
        SELECT LY_TPP_AMT   , CY_PP_AMT   , CY_TPP_AMT   , CM_PP_AMT   , CM_R_AMT
          INTO v_Ly_Tpp_Amt2, v_Cy_Pp_Amt2, v_Cy_Tpp_Amt2, v_Cm_Pp_Amt2, v_Cm_R_Amt2
          FROM RTRE0125
         WHERE ORD_NO      = v_Ord_No
           AND Postp_Tp    = v_Postp_Tp
           AND POSTP_YM    = (SELECT TO_CHAR(ADD_MONTHS(TO_DATE(v_Ppch_Ym,'YYYYMM'),-1),'YYYYMM') FROM DUAL)
           AND POSTP_STAT IN ('A','N'); --2016-04-02 이영근 ADD, 조건 'N' 추가

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    v_Ly_Tpp_Amt2 := 0;
    v_Cy_Pp_Amt2  := 0;
    v_Cy_Tpp_Amt2 := 0;
    v_Cm_Pp_Amt2  := 0;
    v_Cm_R_Amt2   := 0; -- 2016-04-04 이영근 ADD, 장착 당월 서비스 신청시 0원 책정

    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '125 조회 실패 v_Ord_No-'||v_Ord_No||'v_Postp_Tp-'||v_Postp_Tp||'v_Ppch_Ym'||v_Ppch_Ym;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
                RAISE e_Error;
    END;

    v_Postp_Seq := '';
    SELECT Pkg_Rtre0125.f_sRtre0125MaxSeq(v_Ord_No, v_Postp_Tp) + 1 
      INTO v_Postp_Seq 
      FROM DUAL;

    BEGIN
    INSERT INTO Rtre0125
        SELECT ORD_NO    ,
               POSTP_TP  ,
               v_Postp_Seq  AS POSTP_SEQ ,
               'S'          AS POSTP_STAT,
               v_Ppch_Ym ,
               v_Ly_Tpp_Amt2 - LY_TPP_AMT,
               v_Cy_Pp_Amt2  - CY_PP_AMT ,
               v_Cy_Tpp_Amt2 - CY_TPP_AMT,
               v_Cm_Pp_Amt2  - CM_PP_AMT ,
               v_Cm_R_Amt2   - CM_R_AMT  ,
               REG_ID    ,
               REG_DT    ,
               CHG_ID    ,
               CHG_DT    ,
               v_Ppch_YM
          FROM Rtre0125_TEMP
         WHERE ORD_NO  = v_Ord_No
           AND POSTP_YM = (SELECT TO_CHAR(ADD_MONTHS(TO_DATE(v_Ppch_Ym,'YYYYMM'),-1),'YYYYMM') FROM DUAL)
           AND POSTP_TP = v_Postp_Tp;
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '125 신규 생성 실패 Ord_No : '||v_Ord_No||'Postp_Tp : '||v_Postp_Tp||'v_Ppch_Ym :'||v_Ppch_Ym||Pkg_Rtre0125.f_sRtre0125MaxSeq(v_Ord_No, v_Postp_Tp);
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
          RAISE e_Error;
    END;
    
    BEGIN
        UPDATE  rtre0120
        SET     pp_stat  = 'Z',
                CHG_ID   = v_Reg_Id,
                CHG_DT   = SYSDATE
        WHERE   ord_no   = v_Ord_No
        AND     postp_tp = v_Postp_Tp
        AND     pp_stat  = 'T';
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '120 상태 변경 실패1 - ord_no :'||v_Ord_No||' postp_tp: '||v_Postp_Tp;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
          RAISE e_Error;
    END;

    BEGIN
        UPDATE  rtre0120
           SET  pp_stat  = 'S',
                CHG_ID   = v_Reg_Id,
                CHG_DT   = SYSDATE
         WHERE  ord_no   = v_Ord_No
         AND    postp_tp = v_Postp_Tp
         AND    pp_stat  = 'K';

    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '120 상태 변경 실패2 - ord_no :'||v_Ord_No||' postp_tp: '||v_Postp_Tp;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
                RAISE e_Error;
    END;

    BEGIN
        UPDATE rtre0125
           SET postp_stat = 'Z',
               ZERO_DAY   = v_Ppch_Ym,
               CHG_DT     = SYSDATE,
               CHG_ID     = v_Reg_Id
         WHERE ord_no     = v_Ord_No
           AND postp_tp   = v_Postp_Tp
           AND postp_stat = 'T';
    EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := '125 상태 변경 실패3 - ord_no :'||v_Ord_No||' postp_tp: '||v_Postp_Tp;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
          RAISE e_Error;
    END;


    IF Cur_Rtre0120%ISOPEN THEN
        CLOSE Cur_Rtre0120;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '정상적으로 처리되었습니다';
    v_ErrorText := '';
    --COMMIT;
    V_RETURN_MESSAGE := '01'||v_Success_code;
    EXCEPTION
      WHEN e_Error THEN
     --   ROLLBACK;
        IF Cur_Rtre0125%ISOPEN THEN
            CLOSE Cur_Rtre0125;
        END IF;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtre0125%ISOPEN THEN
            CLOSE Cur_Rtre0125;
        END IF;
   --     ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(2)', v_ErrorText, v_Return_Message);

  END p_ZeroRChangePostSer;

  /*****************************************************************************
   걱정제로 이연대상 중도변경 처리 Main- 3
  *****************************************************************************/
  PROCEDURE p_ZeroCal (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pstr_Ym        IN RTRE0120.PSTR_YM%TYPE,        /*이연시작월            */
    v_Pptrm          IN RTRE0120.PPTRM%TYPE,          /*이연기간              */
    v_Acq_Amt        IN RTRE0120.ACQ_AMT%TYPE,        /*이연처리대상금액      */
    v_Res_Amt        IN RTRE0120.RES_AMT%TYPE,        /*잔존가액              */
    v_Prost_Tp       IN RTRE0120.PROST_TP%TYPE,       /*처리구분              */
    v_Chan_Cd        IN RTRE0120.CHAN_CD%TYPE,        /*채널구분              */
    v_Agency_Cd      IN RTRE0120.AGENCY_CD%TYPE,      /*취득조직              */
    v_Cust_Tp        IN RTRE0120.CUST_TP%TYPE,        /*고객유형              */
    v_Mat_Cd         IN RTRE0120.MAT_CD%TYPE,         /*상품코드              */
    v_Ord_Qty        IN RTRE0120.ORD_QTY%TYPE,        /*장착갯수              */
    v_Pp_stat1       IN RTRE0120.PP_STAT%TYPE,        /*상태값                */
    v_Ppch_Ym1       IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    CURSOR Cur_Rtre0125_temp IS
    SELECT POSTP_YM
      FROM Rtre0125_TEMP
     WHERE POSTP_YM >= v_Ppch_Ym1;

    e_Error EXCEPTION;

    v_Chan_Cd1   RTSD0108.CHAN_CD%TYPE DEFAULT NULL;
    v_Agency_Cd1 RTSD0108.AGENCY_CD%TYPE DEFAULT NULL;
    v_Ord_Qty1   RTSD0108.CNT_CD%TYPE DEFAULT NULL;
    v_Cust_Tp1   RTSD0100.CUST_TP%TYPE DEFAULT NULL;
    v_Mat_Cd1    RTCS0001.MAT_CD%TYPE DEFAULT NULL;

    v_Pend_Ym    RTRE0120.PEND_YM%TYPE DEFAULT NULL;
    v_Mpp_Amt    RTRE0120.MPP_AMT%TYPE DEFAULT NULL;
    v_Lpp_Amt    RTRE0120.LPP_AMT%TYPE DEFAULT NULL;
    v_Pp_Stat    RTRE0120.PP_STAT%TYPE DEFAULT NULL;
    v_Ppch_Ym    RTRE0120.PPCH_YM%TYPE DEFAULT NULL;

    v_Postp_Seq  RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;
    v_Postp_Stat RTRE0125.POSTP_STAT%TYPE DEFAULT NULL;
    v_Postp_Ym   RTRE0125.POSTP_YM%TYPE DEFAULT NULL;
    v_Ly_Tpp_Amt RTRE0125.LY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cy_Pp_Amt  RTRE0125.CY_PP_AMT%TYPE DEFAULT NULL;
    v_Cy_Tpp_Amt RTRE0125.CY_TPP_AMT%TYPE DEFAULT NULL;
    v_Cm_Pp_Amt  RTRE0125.CM_PP_AMT%TYPE DEFAULT NULL;
    v_Cm_R_Amt   RTRE0125.CM_R_AMT%TYPE DEFAULT NULL;

    p_Postp_Seq  RTRE0125.POSTP_SEQ%TYPE DEFAULT NULL;

  BEGIN

    -- 필수값: 계약번호, 이연항목, 이연시작월, 이연기간, 이연처리대상금액, 잔존가액,
    -- 처리구분, 채널구분, 취득조직, 고객유형, 상품코드, 장착갯수, 등록자 ID
    IF (TRIM(v_Ord_No) IS NULL) OR Pkg_Rtsd0108.f_sRtsd0108Count(v_Ord_No) = 0 THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Postp_Tp) IS NULL) THEN
        v_Return_Message := '이연항목('||v_Postp_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pstr_Ym) IS NULL) THEN
        v_Return_Message := '이연시작월('||v_Pstr_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Pptrm) IS NULL) OR v_Pptrm = 0 THEN
        v_Return_Message := '이연기간('||v_Pptrm||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Acq_Amt) IS NULL) OR v_Acq_Amt = 0 THEN
        v_Return_Message := '이연처리대상금액('||v_Acq_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!(ERR CODE: 43251)';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Res_Amt) IS NULL) THEN
        v_Return_Message := '잔존가액('||v_Res_Amt||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Prost_Tp) IS NULL) THEN
        v_Return_Message := '처리구분('||v_Prost_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Chan_Cd) IS NULL) THEN
        v_Return_Message := '채널구분('||v_Chan_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Agency_Cd) IS NULL) AND
       (TRIM(V_CHAN_CD) <> '02')   THEN
        v_Return_Message := '취득조직('||v_Agency_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Cust_Tp) IS NULL) THEN
        v_Return_Message := '고객유형('||v_Cust_Tp||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Mat_Cd) IS NULL) THEN
        v_Return_Message := '상품코드('||v_Mat_Cd||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Ord_Qty) IS NULL) OR v_Ord_Qty = 0 THEN
        v_Return_Message := '장착갯수('||v_Ord_Qty||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    v_Postp_Seq := 1;
    v_Ly_Tpp_Amt := 0;
    v_Cy_Pp_Amt  := 0;
    v_Cy_Tpp_Amt := 0;
    v_Cm_Pp_Amt  := 0;


    LOOP

        IF v_Postp_Seq = 1 THEN     -- MASTER 생성
            -- 이연종료월
            v_Pend_Ym := TO_CHAR(ADD_MONTHS(TO_DATE(v_Pstr_Ym, 'YYYYMM'), (v_Pptrm - 1)), 'YYYYMM');
            -- 월처리금액
            v_Mpp_Amt := TRUNC((v_Acq_Amt - v_Res_Amt) / v_Pptrm, 0);
            -- 마지막달 처리금액
            v_Lpp_Amt := (v_Acq_Amt - v_Res_Amt) - v_Mpp_Amt * (v_Pptrm - 1);
            v_Pp_Stat := 'A';
            v_Ppch_Ym := v_Pstr_Ym;
        END IF;

        -- 이연상태
        IF v_Postp_Seq = 1 THEN     -- 1차분
            v_Postp_Stat := 'N';
            -- 대상년월 시작
            v_Postp_Ym := v_Pstr_Ym;
        ELSE
            --  대상년월 ADD
            v_Postp_Ym := TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), 1), 'YYYYMM');
            IF v_Postp_Seq = 60 THEN -- 소유권인 경우
                v_Postp_Stat := 'O';    -- 소유권이전
            ELSE
                v_Postp_Stat := 'A';    -- 기존
            END IF;
        END IF;

        -- 전기말 누적액
        IF SUBSTR(v_Postp_Ym,1,4) <> TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), -1), 'YYYY') THEN
            v_Ly_Tpp_Amt := v_Cy_Tpp_Amt;   -- 다른 년도면 전년까지 누적분
        ELSE
            v_Ly_Tpp_Amt := v_Ly_Tpp_Amt;   -- 같은 년도는 동일
        END IF;

        -- 당월 처리금액
        IF v_Postp_Seq <> v_Pptrm THEN
            v_Cm_Pp_Amt := v_Mpp_Amt;
        ELSE                                -- 최종분
            v_Cm_Pp_Amt := v_Lpp_Amt;
        END IF;

        -- 당기 처리액
        IF SUBSTR(v_Postp_Ym,1,4) <> TO_CHAR(ADD_MONTHS(TO_DATE(v_Postp_Ym, 'YYYYMM'), -1), 'YYYY') THEN
            v_Cy_Pp_Amt  := v_Cm_Pp_Amt;    -- 첫달은 당월분
        ELSE
            v_Cy_Pp_Amt  := v_Cy_Pp_Amt + v_Cm_Pp_Amt; -- 같은 년도면 누적
        END IF;

        -- 당기 총 누적액
        v_Cy_Tpp_Amt  := v_Ly_Tpp_Amt + v_Cy_Pp_Amt;    -- 전기말 누적액 + 당기처리액

        -- 당월 잔존가액
        v_Cm_R_Amt  := v_Acq_Amt - v_Cy_Tpp_Amt;        -- 전체금액 - 당기 총 누적액

        IF v_Pp_stat1 = 'A' THEN
            IF 0 != f_InsertRtre0125_temp( v_Ord_No,    v_Postp_Tp,    v_Postp_Seq, v_Postp_Stat,
                                           v_Postp_Ym,  v_Ly_Tpp_Amt,  v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                                           v_Cm_Pp_Amt, v_Cm_R_Amt,    v_Reg_Id,    v_ErrorText
                                    ) THEN
                v_Return_Message := '계약번호('||v_Ord_No||') 순번('||v_Postp_Seq||')[RE] 이연처리 125번 임시 테이블 등록 실패-첫번째'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        ELSE
            IF 0 != f_InsertRtre0125_tempB( v_Ord_No,    v_Postp_Tp,   v_Postp_Seq, v_Postp_Stat,
                                      v_Postp_Ym,  v_Ly_Tpp_Amt, v_Cy_Pp_Amt, v_Cy_Tpp_Amt,
                                      v_Cm_Pp_Amt, v_Cm_R_Amt,   v_Reg_Id,    v_ErrorText
                                    ) THEN
                v_Return_Message := '계약번호('||v_Ord_No||') 순번('|| v_Postp_Seq||')[RE] 이연처리 125번 임시 테이블 등록 실패-두번째'||'-'||v_Errortext;
                v_Errortext := v_Errortext;
                RAISE e_Error;
            END IF;
        END IF;
        v_Postp_Seq := v_Postp_Seq + 1;
        EXIT WHEN v_Postp_Seq > v_Pptrm;

    END LOOP;

    p_Postp_Seq := 0;
    SELECT Pkg_Rtre0125.f_sRtre0125MaxSeq(v_Ord_No, v_Postp_Tp) +1
    INTO p_Postp_Seq
    FROM dual;

    IF v_Pp_stat1 = 'A' THEN

      FOR CUR_0125_temp IN Cur_Rtre0125_temp LOOP
        EXIT WHEN Cur_Rtre0125_temp%NOTFOUND;
         BEGIN
          INSERT INTO RTRE0125
          SELECT ORD_NO    ,
                 POSTP_TP  ,
                 p_Postp_Seq AS POSTP_SEQ ,
                 POSTP_STAT,
                 POSTP_YM  ,
                 LY_TPP_AMT,
                 CY_PP_AMT ,
                 CY_TPP_AMT,
                 CM_PP_AMT ,
                 CM_R_AMT  ,
                 REG_ID    ,
                 REG_DT    ,
                 CHG_ID    ,
                 CHG_DT    ,
                 v_Ppch_Ym1
          FROM Rtre0125_TEMP
          WHERE POSTP_YM = CUR_0125_temp.POSTP_YM;
          p_Postp_Seq := p_Postp_Seq + 1;

              EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            v_Success_code := -1;
            v_Return_Message := 'Rtre0125_TEMP ==> 125 생성 실패';
            v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
            Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_Rtre0120ChangePostpone(1)', v_ErrorText, v_Return_Message);
        END;
      END LOOP;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120Postpone(2)', v_ErrorText, v_Return_Message);

  END p_ZeroCal;

    /*****************************************************************************
  -- [RE] 이연처리 월별내역 Insert Rtre0125_temp
  *****************************************************************************/
  FUNCTION f_InsertRtre0125_temp (
    v_Ord_No         IN RTRE0125_TEMP.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125_TEMP.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Seq      IN RTRE0125_TEMP.POSTP_SEQ%TYPE,      /*이연회차              */
    v_Postp_Stat     IN RTRE0125_TEMP.POSTP_STAT%TYPE,     /*이연상태              */
    v_Postp_Ym       IN RTRE0125_TEMP.POSTP_YM%TYPE,       /*대상년월              */
    v_Ly_Tpp_Amt     IN RTRE0125_TEMP.LY_TPP_AMT%TYPE,     /*전기말 누계액         */
    v_Cy_Pp_Amt      IN RTRE0125_TEMP.CY_PP_AMT%TYPE,      /*당기 처리액           */
    v_Cy_Tpp_Amt     IN RTRE0125_TEMP.CY_TPP_AMT%TYPE,     /*당기 총누계액         */
    v_Cm_Pp_Amt      IN RTRE0125_TEMP.CM_PP_AMT%TYPE,      /*당월 처리액           */
    v_Cm_R_Amt       IN RTRE0125_TEMP.CM_R_AMT%TYPE,       /*당월 잔존가액         */
    v_Reg_Id         IN RTRE0125_TEMP.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0125_TEMP (
            ORD_NO,
            POSTP_TP,
            POSTP_SEQ,
            POSTP_STAT,
            POSTP_YM,
            LY_TPP_AMT,
            CY_PP_AMT,
            CY_TPP_AMT,
            CM_PP_AMT,
            CM_R_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Postp_Tp,
            v_Postp_Seq,
            v_Postp_Stat,
            v_Postp_Ym,
            v_Ly_Tpp_Amt,
            v_Cy_Pp_Amt,
            v_Cy_Tpp_Amt,
            v_Cm_Pp_Amt,
            v_Cm_R_Amt,
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

  END f_InsertRtre0125_temp;


    /*****************************************************************************
  -- [RE] 이연처리 월별내역 Insert Rtre0125_temp
  *****************************************************************************/
  FUNCTION f_InsertRtre0125_tempB (
    v_Ord_No         IN RTRE0125_TEMP.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0125_TEMP.POSTP_TP%TYPE,       /*이연항목              */
    v_Postp_Seq      IN RTRE0125_TEMP.POSTP_SEQ%TYPE,      /*이연회차              */
    v_Postp_Stat     IN RTRE0125_TEMP.POSTP_STAT%TYPE,     /*이연상태              */
    v_Postp_Ym       IN RTRE0125_TEMP.POSTP_YM%TYPE,       /*대상년월              */
    v_Ly_Tpp_Amt     IN RTRE0125_TEMP.LY_TPP_AMT%TYPE,     /*전기말 누계액         */
    v_Cy_Pp_Amt      IN RTRE0125_TEMP.CY_PP_AMT%TYPE,      /*당기 처리액           */
    v_Cy_Tpp_Amt     IN RTRE0125_TEMP.CY_TPP_AMT%TYPE,     /*당기 총누계액         */
    v_Cm_Pp_Amt      IN RTRE0125_TEMP.CM_PP_AMT%TYPE,      /*당월 처리액           */
    v_Cm_R_Amt       IN RTRE0125_TEMP.CM_R_AMT%TYPE,       /*당월 잔존가액         */
    v_Reg_Id         IN RTRE0125_TEMP.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTRE0125_TEMPB (
            ORD_NO,
            POSTP_TP,
            POSTP_SEQ,
            POSTP_STAT,
            POSTP_YM,
            LY_TPP_AMT,
            CY_PP_AMT,
            CY_TPP_AMT,
            CM_PP_AMT,
            CM_R_AMT,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Ord_No,
            v_Postp_Tp,
            v_Postp_Seq,
            v_Postp_Stat,
            v_Postp_Ym,
            v_Ly_Tpp_Amt,
            v_Cy_Pp_Amt,
            v_Cy_Tpp_Amt,
            v_Cm_Pp_Amt,
            v_Cm_R_Amt,
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

  END f_InsertRtre0125_tempB;

  /*****************************************************************************
  -- [RE] 이연대상 걱정제로이연처리 UPDATE
  *****************************************************************************/
  FUNCTION f_UpdateRtre0120SvrPostpone (
    v_Ord_No         IN RTRE0120.ORD_NO%TYPE,         /*계약번호              */
    v_Postp_Tp       IN RTRE0120.POSTP_TP%TYPE,       /*이연항목              */
    v_Pp_Stat        IN RTRE0120.PP_STAT%TYPE,        /*이연변경대상상태          */
    v_Ppch_Ym        IN RTRE0120.PPCH_YM%TYPE,        /*이연대상상태변경년월  */
    v_Ord_Qty_Now    IN RTRE0120.Ord_Qty_Now%TYPE,    /*현재장착   */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTRE0120
    SET    PP_STAT          = v_Pp_Stat,
           PPCH_YM          = v_Ppch_Ym,
           Ord_Qty_Now      = v_Ord_Qty_Now,
           CHG_ID           = v_Reg_Id,
           CHG_DT           = SYSDATE
    WHERE  ORD_NO           = v_Ord_No
    AND    POSTP_TP         = v_Postp_Tp
    AND    PP_STAT          = 'A';

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0120SvrPostpone;


/*****************************************************************************
  -- 이연처리 변경사항 반영-- 걱정제로 서비스 이연 변경           <시작 
  로직설명 : 걱정제로 타이어의 충당금을 중도완납 프로세스와 유사하게 보내서 충당처리 하는 프로시저
  구분==> 'S' / 당월감가상각액 ==>  0 / 당월 잔존가액==> 전달의 당월 잔존가액으로 보내야 한다
  그리고 나머지는 모두 Z처리하여 향후이연내역을 보내지 않도록 처리하는 로직   
   -- VER 1.1 2016-04-26 이영근, 걱정제로 서비스 출고완료 기준으로 감가상각 처리  
  *****************************************************************************/
  PROCEDURE p_ZeroSrvChangePostSer (
    v_Period         IN CHAR,                         /*년월                  */
    v_Reg_Id         IN RTRE0120.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS
/*****************************************************************************
      추출 대상 : QNT 2인 경우 충당금 2개 감가상각돌리는 것 추출 
                  QNT 1인 경우 충당금 1개 
*****************************************************************************/
    CURSOR  Cur_Rtcs0010 IS
    SELECT  COUNT(*) OVER () AS TOT_CNT
         ,  A2.*
      FROM  (   
                SELECT A.ORD_NO, MIN(A.POSTP_TP) AS POSTP_TP,  A.END_TP
                FROM   (
                        SELECT  A.ORD_NO, B.POSTP_TP,  'Q' AS END_TP, A.KWMENG , B.PP_STAT
                        FROM    (SELECT A.ORD_NO, A.KWMENG, 
                                        RANK() OVER(PARTITION BY A.ORD_NO ORDER BY A.REG_DT ASC)  AS RNK
                                   FROM RTCS0010 A
                                  WHERE A.DLVR_DAY >= TO_CHAR(ADD_MONTHS(TO_DATE(v_Period,'YYYYMM'),-1),'YYYYMM') || '01' -- 전월 이후 신청내역부터 조회
                                    AND A.DLV_STAT NOT IN ('01','06') -- 취소건이나 SAP로 미전송된 건은 제외
                                ) A,
                                RTRE0120 B
                        WHERE   A.ORD_NO = B.ORD_NO
                        AND     B.POSTP_TP IN ('09','10')
                        AND     B.PP_STAT NOT IN  ('Z','C','E','S','Q')             
                        AND     A.KWMENG = '1'
                        AND EXISTS (SELECT 1
                                      FROM RTSD0116 B,
                                           RTSD0115 C
                                     WHERE A.ORD_NO = B.ORD_NO
                                       AND A.RNK    = B.NUM
                                       AND B.GI_DAY LIKE v_Period||'%'
                                       AND B.NUM IS NOT NULL
                                       AND B.ORD_NO = C.ORD_NO
                                       AND B.VBELN  = C.VBELN)          
                       ) A
                GROUP BY A.ORD_NO, A.END_TP
                UNION ALL
                SELECT A.ORD_NO, B.POSTP_TP, 'Q' AS END_TP
                FROM   (
                        SELECT A.ORD_NO, A.KWMENG, 
                               RANK() OVER(PARTITION BY A.ORD_NO ORDER BY A.REG_DT ASC)  AS RNK
                          FROM RTCS0010 A
                         WHERE A.DLVR_DAY >= TO_CHAR(ADD_MONTHS(TO_DATE(v_Period,'YYYYMM'),-1),'YYYYMM') || '01' -- 전월 이후 신청내역부터 조회
                           AND A.DLV_STAT NOT IN ('01','06') -- 취소건이나 SAP로 미전송된 건은 제외
                       ) A,
                       RTRE0120 B
                WHERE  A.ORD_NO = B.ORD_NO
            --    AND A.ORD_NO IN ('D16000037442','D16000044998','D16000041520','D16000041698') --12321
                AND    B.POSTP_TP IN ('09','10')
                AND    B.PP_STAT NOT IN  ('Z','C','E','S','Q')     
                AND    A.KWMENG = '2'
                AND EXISTS (SELECT 1
                              FROM RTSD0116 B,
                                   RTSD0115 C
                             WHERE A.ORD_NO = B.ORD_NO
                               AND A.RNK    = B.NUM
                               AND B.GI_DAY LIKE v_Period||'%'
                               AND B.NUM IS NOT NULL
                               AND B.ORD_NO = C.ORD_NO
                               AND B.VBELN  = C.VBELN)
        ) A2
    WHERE   A2.ORD_NO NOT IN (SELECT ORD_NO FROM RTRE0126_TMP WHERE PERIOD_YM = v_Period) --2019.05.01 by wjim      
    ;

    e_Error EXCEPTION;
    v_curr_cunt  NUMBER;
    v_curr_cunt2  NUMBER;
    

    v_Ord_No          RTRE0120.ORD_NO%TYPE;         /*계약번호              */
    v_Postp_Tp        RTRE0120.POSTP_TP%TYPE;       /*이연항목              */
    v_Pstr_Ym         RTRE0120.PSTR_YM%TYPE;        /*이연시작월            */
    v_Pptrm           RTRE0120.PPTRM%TYPE;          /*이연기간              */
    v_Acq_Amt         RTRE0120.ACQ_AMT%TYPE;        /*이연처리대상금액      */
    v_Res_Amt         RTRE0120.RES_AMT%TYPE;        /*잔존가액              */
    v_Prost_Tp        RTRE0120.PROST_TP%TYPE;       /*처리구분              */
    v_Chan_Cd         RTRE0120.CHAN_CD%TYPE;        /*채널구분              */
    v_Agency_Cd       RTRE0120.AGENCY_CD%TYPE;      /*취득조직              */
    v_Cust_Tp         RTRE0120.CUST_TP%TYPE;        /*고객유형              */
    v_Mat_Cd          RTRE0120.MAT_CD%TYPE;         /*상품코드              */
    v_Ord_Qty         RTRE0120.ORD_QTY%TYPE;        /*장착갯수              */
    v_Acq_Tot         RTRE0120.ACQ_AMT%TYPE;        /*이연처리전체금액      */

    v_Cnt NUMBER;

  BEGIN

    -- 필수값: 마감년월, 등록자 ID
    IF (TRIM(v_Period) IS NULL) THEN
        v_Return_Message := '마감년월('||v_Period||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    --필수값 체크

    v_Cnt := 0;

    /* [20161031_05] 에 의해 삭제
    SELECT COUNT(*)
      INTO v_Cnt
      FROM RTRE0125
     WHERE POSTP_YM   = v_Period
       AND POSTP_STAT = 'Q';

        IF v_Cnt > 0 THEN
            v_Return_Message := '기존에 이미 처리됨 : 처리불가';
            RAISE e_Error;
        END IF;
    */

    v_Pstr_Ym   := v_Period;
    v_curr_cunt2  := 0;

    -- 이연처리 변경내역 생성
    FOR CUR_0010 IN Cur_Rtcs0010 LOOP
        EXIT WHEN Cur_Rtcs0010%NOTFOUND;

        -- 이미처리되었는지 확인
        v_curr_cunt := 0;
        BEGIN
        SELECT  COUNT(*)
        INTO    v_curr_cunt
        FROM    (
                 SELECT DISTINCT A.ORD_NO, CUST_NO
                   FROM 
                        (SELECT A.ORD_NO, A.CUST_NO, 
                                RANK() OVER(PARTITION BY A.ORD_NO ORDER BY A.REG_DT ASC)  AS RNK
                           FROM RTCS0010 A
                          WHERE A.DLVR_DAY >= TO_CHAR(ADD_MONTHS(TO_DATE(v_Period,'YYYYMM'),-1),'YYYYMM') || '01' -- 전월 이후 신청내역부터 조회
                            AND A.DLV_STAT NOT IN ('01','06') -- 취소건이나 SAP로 미전송된 건은 제외
                        ) A,
                        RTSD0116 B,
                        RTSD0115 C
                  WHERE A.ORD_NO = B.ORD_NO
                    AND A.RNK    = B.NUM
                    AND B.GI_DAY LIKE v_Period||'%'
                    AND B.ORD_NO = C.ORD_NO
                    AND B.VBELN  = C.VBELN                    
                    AND B.NUM IS NOT NULL           
                ) A,        
                RTRE0120 B
        WHERE   A.ORD_NO = B.ORD_NO
--        AND A.ORD_NO IN ('D16000037442','D16000044998','D16000041520','D16000041698') --12321
        AND     A.ORD_NO = CUR_0010.ORD_NO
        AND     B.PP_STAT <> 'A'
        AND     B.POSTP_TP = CUR_0010.POSTP_TP         
        AND     ROWNUM =  1;

        EXCEPTION
        WHEN OTHERS THEN
           v_Return_Message := '조회실패1';
            v_curr_cunt := -1;
            RAISE e_Error;
        END;

        IF NVL(v_curr_cunt, 0) > 0 THEN
            v_Return_Message := '마감년월('||v_Period||') : 이미 처리되어 처리가 불가 합니다!';
            RAISE e_Error;
        END IF;

        v_curr_cunt := v_curr_cunt + 1;
        v_curr_cunt2 := v_curr_cunt2 + 1;
        
--        Pkg_Utility.p_InfoFileWrite ('Pkg_Rtre0120.p_ZeroSrvChangePostSer(3/3)', v_curr_cunt2||'/'||CUR_0010.TOT_CNT, CUR_0010.ORD_NO);
        DBMS_OUTPUT.PUT_LINE('Pkg_Rtre0120.p_ZeroSrvChangePostSer(3/3)'||'['||v_curr_cunt2||'/'||CUR_0010.TOT_CNT||']['||CUR_0010.ORD_NO||']');

            p_Rtre0120ChangeMain(CUR_0010.ORD_NO, CUR_0010.POSTP_TP, CUR_0010.END_TP,  v_Period,
                                 v_Reg_Id,        v_Success_Code,    v_Return_Message, v_ErrorText);

            IF  v_Success_Code <> 0 THEN
                RAISE e_Error;
            END IF;

    END LOOP;

    IF Cur_Rtcs0010%ISOPEN THEN
        CLOSE Cur_Rtcs0010;
    END IF;


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '마감년월('||v_Period||') : 처리건이 존재하지 않습니다!(ERR CODE: 4F5T2B)';
        RAISE e_Error;
    END IF;


    EXCEPTION
      WHEN e_Error THEN
        IF Cur_Rtcs0010%ISOPEN THEN
            CLOSE Cur_Rtcs0010;
        END IF;

        ROLLBACK;
       -- v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
--        dbms_output.put_line('Pkg_Rtre0120.p_CreateRtre0120ChangePost(12)::'||v_Return_Message);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        IF Cur_Rtcs0010%ISOPEN THEN
            CLOSE Cur_Rtcs0010;
        END IF;

        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0120.p_CreateRtre0120ChangePost(2)', v_ErrorText, v_Return_Message);

  END p_ZeroSrvChangePostSer;

END Pkg_Rtre0120;
/