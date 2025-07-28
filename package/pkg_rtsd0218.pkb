CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0218 AS
/******************************************************************************* 
   NAME      Pkg_Rtsd0218 
   PURPOSE   Paysign발송이력(동의, 약관) 
   
   REVISIONS 
   Ver        Date        Author           Description 
   ---------  ----------  ---------------  ------------------------------------- 
   1.0        2025-03-13  10243054         1. Created this package body.
   
   TEMPLATE_SEQ (페이싸인 템플릿 번호)
   1678776299950706193 개인 계약서
   1677487175997951663 사업자 계약서
   1715849025709267949 만족도조사
   1740622318620369995 주문등록
   1740617118511128007 고객등록
   
   상기 템플릿 변동 사항 있을 시 하단 소스 체크
   PKG_RTSD0218
   application.properties(카프카 스프링부트)
   RTSDCustRegisterServiceImpl.java
   RTSDContractRegisterServiceImpl.java
*******************************************************************************/ 

/*****************************************************************************
-- Paysign발송이력(동의, 약관) Insert
*****************************************************************************/
	PROCEDURE p_InsertRtsd0218 (
    v_Template_Seq   IN RTSD0218.TEMPLATE_SEQ%TYPE,   /*템플릿번호*/
    v_Receiver_Seq   IN RTSD0218.RECEIVER_SEQ%TYPE,   /*수신인번호*/
    v_Doc_Seq        IN RTSD0218.DOC_SEQ%TYPE,        /*문서번호*/
    v_Send_Code      IN RTSD0218.SEND_CODE%TYPE,      /*응답코드*/
    v_Send_Message   IN RTSD0218.SEND_MESSAGE%TYPE,   /*응답메시지*/
    v_Ord_No   		 IN RTSD0218.ORD_NO%TYPE,   	  /*주문번호*/
    v_Cust_No		 IN RTSD0218.CUST_NO%TYPE,   	  /*고객번호*/
    v_Cust_Nm        IN RTSD0218.CUST_NM%TYPE,        /*고객이름*/
    v_Mob_No         IN RTSD0218.MOB_NO%TYPE,         /*휴대폰번호*/
    v_Birth_Day      IN RTSD0218.BIRTH_DAY%TYPE,      /*법정생년월일*/
    v_State      	 IN RTSD0218.STATE%TYPE,      	  /*상태*/
    v_Reg_Id         IN RTSD0218.REG_ID%TYPE,         /*등록자ID*/
    v_Chg_Id         IN RTSD0218.CHG_ID%TYPE,         /*변경자ID*/
	v_Success_Code   OUT NUMBER,                      /* 성공 코드 */
	v_Return_Message OUT VARCHAR2,                    /* 반환 메시지 */
	v_ErrorText      OUT VARCHAR2                     /* 에러 메시지 */
	) IS
	
	v_Tmp_Cust_No	 RTSD0218.CUST_NO%TYPE;
	v_Tmp_Reg_Id	 RTSD0218.REG_ID%TYPE;
	v_Tmp_Chg_Id	 RTSD0218.CHG_ID%TYPE;
	
	BEGIN
	
	v_Tmp_Cust_No := v_Cust_No;
	v_Tmp_Reg_Id  := v_Reg_Id;
	v_Tmp_Chg_Id  := v_Chg_Id;
	
	IF v_Ord_No != '999999999999' THEN
    	SELECT NVL((SELECT MAX(CUST_NO)  -- 여러 행 나올 가능성 대비
        			  FROM RTSD0104
        			 WHERE ORD_NO = v_Ord_No), '9999999999')
    	  INTO v_Tmp_Cust_No
    	  FROM DUAL;
	END IF;

	IF (v_Reg_Id = 'kafka_cont' OR v_Reg_Id = 'kafka_satis') AND (v_Ord_No != '999999999999') THEN	-- 변경시 kafka 스프링부트 이력 등록 같이 수정
		SELECT AGENCY_CD
		  INTO v_Tmp_Reg_Id
		  FROM RTSD0104
		 WHERE ORD_NO = v_Ord_No;

		v_Tmp_Chg_Id := v_Tmp_Reg_Id;
	END IF;

	-- 1. 새로운 데이터 삽입
	INSERT INTO RTSD0218 (
		SEND_SEQ,
		TEMPLATE_SEQ,
		RECEIVER_SEQ,
		DOC_SEQ,
		SEND_CODE,
		SEND_MESSAGE,
		ORD_NO,
		CUST_NO,
		CUST_NM,
		MOB_NO,
		BIRTH_DAY,
		STATE,
		REG_ID,
		REG_DT,
		CHG_ID,
		CHG_DT
	)
	VALUES (
		SEND_SEQ.NEXTVAL,        		  -- 발송번호
		v_Template_Seq,                   -- 템플릿번호
		v_Receiver_Seq,                   -- 수신인번호
		v_Doc_Seq,                        -- 문서번호
		v_Send_Code,                      -- 응답코드
		v_Send_Message,                   -- 응답메시지
		v_Ord_No,                   	  -- 주문번호
		v_Tmp_Cust_No,                    -- 고객번호
		v_Cust_Nm,                        -- 고객이름
		v_Mob_No,                         -- 휴대폰번호
		v_Birth_Day,                      -- 법정생년월일
		v_State,                          -- 상태
		v_Tmp_Reg_Id,                     -- 등록자ID
		SYSDATE,                          -- 등록일
		v_Tmp_Chg_Id,                     -- 변경자ID
		SYSDATE                           -- 변경일
	);
	
	-- 2. 성공적인 삽입 후 출력 파라미터 설정
	v_Success_Code := 0;
	v_Return_Message := '정상적으로 등록되었습니다.';
	v_ErrorText := '';
	
	COMMIT;
	
	EXCEPTION
	WHEN OTHERS THEN
		-- 3. 에러 발생 시 롤백 및 에러 메시지 설정
		ROLLBACK;
		v_Success_Code := -1;
		v_Return_Message := '등록에 실패하였습니다. 시스템관리자에게 문의바랍니다.';
		v_ErrorText := SUBSTR(SQLERRM, 1, 200);
	END p_InsertRtsd0218;
	
/*****************************************************************************
-- Paysign발송이력(동의, 약관) Update
*****************************************************************************/
	PROCEDURE p_UpdateRtsd0218 (
	v_Receiver_Seq   IN RTSD0218.RECEIVER_SEQ%TYPE,   /* 수신인번호 */
	v_Doc_Seq        IN RTSD0218.DOC_SEQ%TYPE,        /* 문서번호 */
	v_Send_Code      IN RTSD0218.SEND_CODE%TYPE,      /* 응답코드 */
	v_Send_Message   IN RTSD0218.SEND_MESSAGE%TYPE,   /* 응답메시지 */
	v_State          IN RTSD0218.STATE%TYPE,          /* 상태 */
	v_Chg_Id         IN RTSD0218.CHG_ID%TYPE,         /* 변경자ID */
	v_Success_Code   OUT NUMBER,
	v_Return_Message OUT VARCHAR2,
	v_ErrorText      OUT VARCHAR2
	) IS
	BEGIN
    -- 1. 발송번호에 해당하는 레코드를 업데이트
    UPDATE RTSD0218
    SET
      SEND_CODE      = v_Send_Code,      -- 응답코드
      SEND_MESSAGE   = v_Send_Message,   -- 응답메시지
      STATE          = v_State,          -- 상태
      CHG_ID         = v_Chg_Id,         -- 변경자ID
      CHG_DT         = SYSDATE           -- 변경일
    WHERE RECEIVER_SEQ = v_Receiver_Seq
    AND   DOC_SEQ      = v_Doc_Seq;

    -- 2. 성공적인 업데이트 후 출력 파라미터 설정
    v_Success_Code := 0;  -- 성공
    v_Return_Message := '수정에 성공하였습니다.';  -- 성공 메시지
    v_ErrorText := NULL;   -- 에러 없음

	COMMIT;
	
	EXCEPTION
	WHEN OTHERS THEN
		-- 3. 에러 발생 시 롤백 및 에러 메시지 설정
		ROLLBACK;
		v_Success_Code := -1;
		v_Return_Message := '수정에 실패하였습니다. 시스템관리자에게 문의바랍니다.';
		v_ErrorText := SUBSTR(SQLERRM, 1, 200);
	END p_UpdateRtsd0218;
	
/*****************************************************************************
-- Paysign발송이력(동의, 약관) CUST_NO Update
*****************************************************************************/
	PROCEDURE p_UpdateCustNoRtsd0218 (
    v_Receiver_Seq   IN RTSD0218.RECEIVER_SEQ%TYPE,   /*수신인번호            */
    v_Doc_Seq        IN RTSD0218.DOC_SEQ%TYPE,        /*문서번호              */
    v_Cust_No        IN RTSD0218.CUST_NO%TYPE,        /*고객번호              */
    v_Chg_Id         IN RTSD0218.CHG_ID%TYPE,         /*변경자ID              */
	v_Success_Code   OUT NUMBER,
	v_Return_Message OUT VARCHAR2,
	v_ErrorText      OUT VARCHAR2
	) IS
	BEGIN
    -- 1. 고객번호에 해당하는 레코드를 업데이트
    UPDATE RTSD0218
    SET
      CUST_NO        = v_Cust_No,        -- 고객번호
      CHG_ID         = v_Chg_Id,         -- 변경자ID
      CHG_DT         = SYSDATE           -- 변경일
    WHERE RECEIVER_SEQ = v_Receiver_Seq
    AND   DOC_SEQ      = v_Doc_Seq;

    -- 2. 성공적인 업데이트 후 출력 파라미터 설정
    v_Success_Code := 0;  -- 성공
    v_Return_Message := '수정에 성공하였습니다.';  -- 성공 메시지
    v_ErrorText := NULL;   -- 에러 없음

	COMMIT;
	
	EXCEPTION
	WHEN OTHERS THEN
		-- 3. 에러 발생 시 롤백 및 에러 메시지 설정
		ROLLBACK;
		v_Success_Code := -1;
		v_Return_Message := '수정에 실패하였습니다. 시스템관리자에게 문의바랍니다.';
		v_ErrorText := SUBSTR(SQLERRM, 1, 200);
	END p_UpdateCustNoRtsd0218;
	
/*****************************************************************************
-- Paysign발송이력(동의, 약관) ORD_NO Update
*****************************************************************************/
	PROCEDURE p_UpdateOrdNoRtsd0218 (
    v_Receiver_Seq   IN RTSD0218.RECEIVER_SEQ%TYPE,   /*수신인번호            */
    v_Doc_Seq        IN RTSD0218.DOC_SEQ%TYPE,        /*문서번호              */
    v_Ord_No         IN RTSD0218.ORD_NO%TYPE,         /*주문번호              */
    v_Chg_Id         IN RTSD0218.CHG_ID%TYPE,         /*변경자ID              */
	v_Success_Code   OUT NUMBER,
	v_Return_Message OUT VARCHAR2,
	v_ErrorText      OUT VARCHAR2
	) IS
	BEGIN
    -- 1. 주문번호에 해당하는 레코드를 업데이트
    UPDATE RTSD0218
    SET
      ORD_NO         = v_Ord_No,         -- 주문번호
      CHG_ID         = v_Chg_Id,         -- 변경자ID
      CHG_DT         = SYSDATE           -- 변경일
    WHERE RECEIVER_SEQ = v_Receiver_Seq
    AND   DOC_SEQ      = v_Doc_Seq;

    -- 2. 성공적인 업데이트 후 출력 파라미터 설정
    v_Success_Code := 0;  -- 성공
    v_Return_Message := '수정에 성공하였습니다.';  -- 성공 메시지
    v_ErrorText := NULL;   -- 에러 없음

	COMMIT;
	
	EXCEPTION
	WHEN OTHERS THEN
		-- 3. 에러 발생 시 롤백 및 에러 메시지 설정
		ROLLBACK;
		v_Success_Code := -1;
		v_Return_Message := '수정에 실패하였습니다. 시스템관리자에게 문의바랍니다.';
		v_ErrorText := SUBSTR(SQLERRM, 1, 200);
	END p_UpdateOrdNoRtsd0218;

/*****************************************************************************
-- Paysign 전후륜 구분 타입 주문 만족도조사 발송 여부
*****************************************************************************/
	PROCEDURE p_sRtsd0218FrontRearSendYn (
    v_OrdNo			 	IN VARCHAR2,					/*주문번호*/
    v_FrontRearSendYn	OUT VARCHAR2                   	/*발송여부*/
	) IS
	v_TmpOrdNo	RTSD0104.ORD_NO%TYPE;
	v_OrdDay	RTSD0104.ORD_DAY%TYPE;
	v_CntCd		RTSD0104.CNT_CD%TYPE;
	v_CustNo	RTSD0104.CUST_NO%TYPE;
	v_StatCd	RTSD0104.STAT_CD%TYPE;
	v_ProcDay	RTSD0104.PROC_DAY%TYPE;
	v_AgencyCd	RTSD0104.AGENCY_CD%TYPE;
	v_CarNo		RTSD0104.CAR_NO%TYPE;
	v_OrdRowNo	NUMBER;
	v_SendCheck NUMBER;
	BEGIN
    -- 1. 주문번호 기준 주문 정보 조회
    SELECT ORD_NO, ORD_DAY, CNT_CD, CUST_NO, STAT_CD, PROC_DAY, AGENCY_CD, CAR_NO
      INTO v_TmpOrdNo, v_OrdDay, v_CntCd, v_CustNo, v_StatCd, v_ProcDay, v_AgencyCd, v_CarNo
    FROM RTSD0104
    WHERE ORD_NO = v_OrdNo;

    -- 2. 타이어 본수가 4본('04')인 경우는 발송여부 'N' 처리 후 종료
    IF v_CntCd = '04' THEN
        v_FrontRearSendYn := 'N';
        RETURN;
    END IF;

    -- 3. 타이어 본수가 2본('02')인 경우 로직 처리
    IF v_CntCd = '02' THEN
        -- 같은 고객, 대리점, 차량, 상태코드가 '06'이 아닌 조건으로 ±2일 범위 내 주문 개수 조회, 범위 수정 시 하단 발송 여부 체크도 같이 수정
        SELECT COUNT(*)
          INTO v_OrdRowNo
        FROM RTSD0104
        WHERE TO_DATE(ORD_DAY, 'YYYYMMDD') BETWEEN TO_DATE(v_OrdDay, 'YYYYMMDD') - 2 AND TO_DATE(v_OrdDay, 'YYYYMMDD') + 2
          AND CNT_CD = '02'
          AND CUST_NO = v_CustNo
          AND STAT_CD NOT IN ('06')
          AND AGENCY_CD = v_AgencyCd
          AND CAR_NO = v_CarNo;

        -- 주문 개수가 1건이면 발송여부 'N' 처리 후 종료
        IF v_OrdRowNo = 1 THEN
            v_FrontRearSendYn := 'N';
            RETURN;
        END IF;

        -- 주문 개수가 2건 이상이면 RTSD0218 테이블에서 발송 여부 체크
        IF v_OrdRowNo > 1 THEN
            SELECT COUNT(*)
              INTO v_SendCheck
            FROM RTSD0218
            WHERE ORD_NO IN (SELECT ORD_NO
                  			   FROM RTSD0104
                  			  WHERE TO_DATE(ORD_DAY, 'YYYYMMDD') BETWEEN TO_DATE(v_OrdDay, 'YYYYMMDD') - 2 AND TO_DATE(v_OrdDay, 'YYYYMMDD') + 2
                    			AND CNT_CD = '02'
                    			AND CUST_NO = v_CustNo
                    			AND STAT_CD NOT IN ('06')
                    			AND AGENCY_CD = v_AgencyCd
                    			AND CAR_NO = v_CarNo)
            AND TEMPLATE_SEQ = '1715849025709267949';

            IF v_SendCheck > 0 THEN
                v_FrontRearSendYn := 'Y';
            ELSE
                v_FrontRearSendYn := 'N';
            END IF;
            RETURN;
        END IF;
    END IF;

    -- 4. 위 조건에 해당하지 않으면 기본값 'N' 설정
    v_FrontRearSendYn := 'N';

	EXCEPTION
	WHEN OTHERS THEN
		v_FrontRearSendYn := 'N';
	END p_sRtsd0218FrontRearSendYn;

END Pkg_Rtsd0218;