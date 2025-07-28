CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Comm AS
/*******************************************************************************
   NAME      Pkg_COMM
   PURPOSE   [COMM] 공통함수

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2016-12-15  kstka            1. Created this package body.
   1.1		  2025-05-30  10244015         [20250530_01] 계약만료고객 마지막 청구일자 SMS 메시지 내용 추가
*******************************************************************************/

  /*****************************************************************************
  -- [COMM] 장착계약삭제
  *****************************************************************************/
  PROCEDURE p_IRtCommOrdDel (
    v_Ord_No         IN VARCHAR2,                       /*계약번호              */
    v_User_Id        IN VARCHAR2,                       /*사용자ID              */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
  ) IS
  
  v_Cnt NUMBER;
  v_Call_No VARCHAR2(15);
  v_Stat_Cd VARCHAR2(2);
  v_Ord_Day VARCHAR2(8);
  v_Proc_Day VARCHAR2(8);
  v_Close_Ym VARCHAR2(8);
  v_Grp_Yn RTSD0104.GRP_YN%TYPE;
  v_Grp_No RTSD0104.GRP_NO%TYPE;
  v_Chan_Cd RTSD0104.CHAN_CD%TYPE;
  
  v_Cust_No VARCHAR2(20);
  v_Regi_Cd VARCHAR2(10);
  v_Add_No VARCHAR2(20);
  
  e_Error EXCEPTION;
  
  BEGIN

    BEGIN
        
--        v_Return_Message := '고도화 시스템 오픈으로 인해 장착계약삭제 기능은 현재 사용불가 입니다.';
--        RAISE e_Error;
            
        --장착계약삭제 권한 : CRM팀 임욱재과장, 김선태대리, 영업관리팀 박정석대리 
--        IF v_User_Id NOT IN ('wjim', 'kstka', '10083012', '10164030')  THEN
--            v_Return_Message := '장착계약삭제 권한이 없습니다. 관리자에게 문의해주세요.';
--            RAISE e_Error;
--        END IF;
        
        SELECT A.STAT_CD, A.ORD_DAY, B.PROC_DAY, A.GRP_YN, A.GRP_NO, A.CHAN_CD  
        INTO v_Stat_Cd, v_Ord_Day, v_Proc_Day, v_Grp_Yn, v_Grp_No, v_Chan_Cd 
        FROM RTSD0104 A, RTSD0108 B WHERE A.ORD_NO = B.ORD_NO AND A.ORD_NO = v_Ord_No;
        
        -- 장착 완료된 계약인지 확인
        IF v_Stat_Cd <> '04' OR v_Proc_Day IS NULL THEN
            v_Return_Message := '장착완료된 계약이 아닙니다.';
            RAISE e_Error;
        END IF;        
        
        --패키지/단체계약 구분
        IF v_Grp_Yn = 'Y' THEN
        
            IF SUBSTR(v_Grp_No, 0, 1) = 'F' THEN
                v_Return_Message := '해당계약은 패키지 계약입니다. 패키지를 해제하고 삭제해주세요.';
                RAISE e_Error;
            END IF;
            
            IF SUBSTR(v_Grp_No, 0, 1) = 'G' THEN --G
                v_Return_Message := '해당계약은 단체 계약입니다. 패키지를 해제하고 삭제해주세요.';
                RAISE e_Error;
            END IF;
        END IF;
        
--        IF v_Chan_Cd = '10' THEN --L
--            v_Return_Message := '해당계약은 일시불 계약입니다.';
--            RAISE e_Error;
--        END IF;
--        
--        IF v_Chan_Cd = '11' THEN --P
--            v_Return_Message := '해당계약은 멤버십 계약입니다.';
--            RAISE e_Error;
--        END IF;
            
        SELECT MAX(CLOSE_YM) INTO v_Close_Ym FROM RTRE5500;
        
        --해당월에 장착이 되었는지 여부 확인        
        IF SUBSTR(v_Proc_Day, 1, 6) <> TO_CHAR(ADD_MONTHS(LAST_DAY(v_Close_Ym || '01'), 1), 'YYYYMM') AND TO_NUMBER(SUBSTR(v_Close_Ym, 7, 2)) > 10 THEN
            v_Return_Message := '당월에 장착된 내역이 아닙니다.';
            RAISE e_Error;
        END IF;
        
    EXCEPTION
        WHEN no_data_found THEN
            v_Return_Message := v_Ord_No || '계약번호에 해당하는 장착내역이 존재하지 않습니다.';
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0104
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0104', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0104 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0104 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0105
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0105', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0105 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0105 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0106
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0106', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0106 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0106 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0107
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0107', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0107 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0107 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0108
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0108', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0108 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0108 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0109
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0109', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0109 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0109 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0115
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0115', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0115 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0115 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0116
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0116', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0116 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0116 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0013
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0013', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0013 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0013 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0014
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0014', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0014 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0014 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTCS0001
    p_IRtCommOrdDelLog(v_Ord_No, 'RTCS0001', 'ORD_NO', v_User_Id);
    DELETE FROM RTCS0001 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTCS0001 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTCS0100
    p_IRtCommOrdDelLog(v_Ord_No, 'RTCS0100', 'ORD_NO', v_User_Id);
    DELETE FROM RTCS0100 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTCS0100 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTCS0101  
    SELECT COUNT(*) INTO v_Cnt FROM RTCS0100 WHERE ORD_NO = v_Ord_No;
    IF v_Cnt > 0 THEN
        SELECT CALL_NO INTO v_Call_No FROM RTCS0100 WHERE ORD_NO = v_Ord_No;
        p_IRtCommOrdDelLog(v_Call_No, 'RTCS0101', 'CALL_NO', v_User_Id);
        DELETE FROM  RTCS0101 WHERE CALL_NO IN (SELECT CALL_NO FROM RTCS0100 WHERE ORD_NO = v_Ord_No);
    END IF;
    EXCEPTION            
        WHEN others THEN
            v_Return_Message := 'RTCS0101 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTRE0050
    p_IRtCommOrdDelLog(v_Ord_No, 'RTRE0050', 'ORD_NO', v_User_Id);
    DELETE FROM RTRE0050 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTRE0050 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTCS0203
    p_IRtCommOrdDelLog(v_Ord_No, 'RTCS0203', 'ORD_NO', v_User_Id);
    DELETE FROM RTCS0203 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTCS0203 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTRE0030
    p_IRtCommOrdDelLog(v_Ord_No, 'RTRE0030', 'ORD_NO', v_User_Id);
    DELETE FROM RTRE0030 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTRE0030 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTRE0035
    p_IRtCommOrdDelLog(v_Ord_No, 'RTRE0035', 'ORD_NO', v_User_Id);
    DELETE FROM RTRE0035 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTRE0035 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTRE0041
    p_IRtCommOrdDelLog(v_Ord_No, 'RTRE0041', 'ORD_NO', v_User_Id);
    DELETE FROM RTRE0041 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTRE0041 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTRE0060
    p_IRtCommOrdDelLog(v_Ord_No, 'RTRE0060', 'ORD_NO', v_User_Id);
    DELETE FROM RTRE0060 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTRE0060 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0107
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0107', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0107 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0107 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0041
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0041', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0041 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0041 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0040
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0040', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0040 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0040 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTSD0047
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0047', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0047 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0047 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    
    BEGIN
    
    -- RTRE0200
    p_IRtCommOrdDelLog(v_Ord_No, 'RTRE0200', 'TORD_NO', v_User_Id);
    DELETE FROM RTRE0200 WHERE TORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTRE0200 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTRE0210
    p_IRtCommOrdDelLog(v_Ord_No, 'RTRE0210', 'TORD_NO', v_User_Id);
    DELETE FROM RTRE0210 WHERE TORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTRE0210 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTCS0007
    p_IRtCommOrdDelLog(v_Ord_No, 'RTCS0007', 'ORD_NO', v_User_Id);
    DELETE FROM RTCS0007 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTCS0007 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTCS0008
    p_IRtCommOrdDelLog(v_Ord_No, 'RTCS0008', 'ORD_NO', v_User_Id);
    DELETE FROM RTCS0008 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTCS0008 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
    
    -- RTCS0008
    p_IRtCommOrdDelLog(v_Ord_No, 'RTSD0114', 'ORD_NO', v_User_Id);
    DELETE FROM RTSD0114 WHERE ORD_NO = v_Ord_No;
    
    EXCEPTION
        WHEN others THEN
            v_Return_Message := 'RTSD0114 삭제실패::'||SQLERRM;
            RAISE e_Error;
    END;
    
    --2018.08.02 김선태
    --장착계약삭제의 경우 재렌탈 계약을 삭제 하는 경우 초기화 필요       
    
    BEGIN
    
        SELECT ORD_NO
        INTO v_Add_No
        FROM RTSD0104
        WHERE FORD_NO = v_Ord_No;        
        
    EXCEPTION        
        WHEN NO_DATA_FOUND THEN
            v_Errortext := v_Errortext;
    END;
    
    IF v_Add_No IS NOT NULL THEN
    
        IF 0 != PKG_RTSD0104.f_UpdateRtsd0104ReRental('', v_Add_No, v_Errortext) THEN
            v_Return_Message := '재렌탈 취소상태로  수정 실패!!!'||'-'||v_Errortext;
            v_Errortext := v_Errortext;
            RAISE e_Error;
        END IF;
        
    END IF;
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 삭제되었습니다';
    v_ErrorText := '';
    
    COMMIT;
    
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
  END p_IRtCommOrdDel;
  
  /*****************************************************************************
  -- [COMM] 로그내역 INSERT 로그
  *****************************************************************************/
  PROCEDURE p_IRtCommOrdDelLog (
    v_Ord_No         IN VARCHAR2,                       /*계약번호              */
    v_Table_Nm       IN VARCHAR2,                       /*테이블명              */
    v_Col_Nm         IN VARCHAR2,                       /*컬럼명                */
    v_User_Id        IN VARCHAR2                        /*사용자ID              */
    ) IS

    v_Delimeter varchar2(10);
    v_TmpCol varchar2(1000); 
    v_Col varchar2(2000);
    v_Query varchar2(2000);
    
  BEGIN

    v_Delimeter := '||';
    
    v_TmpCol :='select LISTAGG(column_name, ''' || v_Delimeter || ''') within group (order by column_id) from cols where table_name =''' || v_Table_Nm || '''';
    
    execute immediate v_TmpCol into  v_Col;
    
    v_Col := replace(v_Col, '||', '||''^''||');
    v_Col := replace(v_Col, 'REG_DT', '''to_date(''||TO_CHAR(REG_DT, ''YYYYMMDDHHMISS'')||'', ''''yyyymmddhh24miss'''')''');
    v_Col := replace(v_Col, 'CHG_DT', '''to_date(''||TO_CHAR(CHG_DT, ''YYYYMMDDHHMISS'')||'', ''''yyyymmddhh24miss'''')''');

    v_Query := 'insert into ord_del_log ';
    v_Query := v_Query || ' select ''' || v_Ord_No ||'''';
    v_Query := v_Query || ',''' || v_Table_Nm || '''' ;
    v_Query := v_Query || ', (select nvl(max(row_seq), 0) from ord_del_log where ord_no = '''|| v_Ord_No ||''' and table_nm = '''|| v_Table_Nm ||''') + rownum row_seq';
    v_Query := v_Query || ',' || v_Col; 
    v_Query := v_Query || ',''' || v_User_Id || '''';
    v_Query := v_Query || ', sysdate from ' || v_Table_Nm || ' WHERE ' || v_Col_Nm || ' = ''' || v_Ord_No || '''';
    
    --dbms_output.put_line(v_Query);
    execute immediate v_Query;
    
  END p_IRtCommOrdDelLog;
  
  /*****************************************************************************
  -- [COMM] 로그내역 복구
  *****************************************************************************/
  PROCEDURE p_IRtCommOrdDelRedo (
    v_Ord_No         IN VARCHAR2,                       /*계약번호              */
    v_Table_Nm       IN VARCHAR2                       /*테이블명              */
  ) IS

    v_Query varchar2(2000);
    
  BEGIN

    v_Query := 'insert into ' || v_Table_Nm;
    v_Query := v_Query || ' select replace(replace('''' || replace(log_data, ''^'', '''','''')  || '''', ''''D+'', ''to_date(''''), ''+D'''', '''',''yyyy-mm-dd hh24:mi:ss'')'')';
    v_Query := v_Query || ' from ord_del_log WHERE ord_no = ''' || v_Ord_No || ''' and table_nm = ''' || v_Table_Nm || '''';
    
    dbms_output.put_line(v_Query);
    execute immediate v_Query;
    
  END p_IRtCommOrdDelRedo;

  /*****************************************************************************
  -- 수납 내역 관리 - 수납취소처리:수납내역생성처리
  *****************************************************************************/
  PROCEDURE p_InsertRtre0030Cancel (
    v_Recv_Day       IN RTRE0030.RECV_DAY%TYPE,       /*수납일자              */
    v_Recv_Seq       IN RTRE0030.RECV_SEQ%TYPE,       /*수납거래번호          */
    v_Ritm_Seq       IN RTRE0030.RITM_SEQ%TYPE,       /*수납거래번호          */
    v_Ord_No         IN RTRE0030.ORD_NO%TYPE,         /*계약번호              */
    v_Cust_No        IN RTRE0030.CUST_NO%TYPE,        /*고객번호              */
    v_Cnc_Rseq       IN RTRE0030.CNC_RSEQ%TYPE,       /*수납취소거래번호      */
    v_Reg_Id         IN RTRE0030.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 수납내역
    CURSOR  CUR_RTRE0030 IS
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.RECV_DAY,                  /*수납일자            */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.RECP_ID,                   /*수납자ID            */
            A.RECP_AMT,                  /*수납금액            */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.SCHD_SEQ,                  /*스케줄순번          */
            A.CASH_YN,                   /*현금영수증 발행여부 */
            A.CNC_STAT,                  /*수납취소여부        */
            A.CNC_RSEQ,                  /*수납취소거래번호    */
            A.CNC_ISEQ,                  /*수납취소거래일련번호*/
            A.CNC_IOSEQ                  /*수납취소거래번호종료*/                 
    FROM    RTRE0030 A
    WHERE   A.RECV_SEQ = v_Recv_Seq
    AND     A.RITM_SEQ = v_Ritm_Seq
    ORDER   BY A.RECV_SEQ, A.RITM_SEQ;

    -- 추가 선수금 내역 
    CURSOR  CUR_RTRE0035 IS
    SELECT  A.RECV_SEQ,                  /*수납거래번호        */
            A.RITM_SEQ,                  /*거래일련번호        */
            A.PND_DAY,                   /*선수 발생일자       */
            A.ORD_NO,                    /*계약번호            */
            A.CUST_NO,                   /*고객번호            */
            A.PND_AMT,                   /*선수 발생금액       */
            A.SBS_AMT,                   /*선수 정리금액       */
            A.RECP_TP,                   /*청구구분            */
            A.RECP_PAY,                  /*수납방법            */
            A.RECP_FG,                   /*수납유형            */
            A.PND_STAT                   /*선수금상태          */
    FROM    RTRE0035 A
    WHERE   A.RECV_SEQ  <> v_Recv_Seq
    AND     A.ORD_NO   = v_Ord_No
    AND     A.CUST_NO  = v_Cust_No
    AND     (A.PND_AMT - A.SBS_AMT) > 0
    ORDER   BY A.RECV_SEQ, A.RITM_SEQ;
             
    e_Error EXCEPTION;   
    
    v_Recp_Fg   RTRE0030.RECP_FG%TYPE DEFAULT '11';   /*수납유형              */
    v_Cnc_Stat  RTRE0030.CNC_STAT%TYPE DEFAULT 'Y';   /*수납취소여부          */
    v_Cnc_Iseq  RTRE0030.CNC_ISEQ%TYPE DEFAULT NULL;  /*수납취소거래일련번호  */
    v_Cnc_Ioseq RTRE0030.CNC_IOSEQ%TYPE DEFAULT NULL; /*수납취소거래번호 종료 */
    
    v_Pnd_Stat  RTRE0035.PND_STAT%TYPE DEFAULT NULL;  /*선수금상태            */
    
    v_BalanceAmt   NUMBER DEFAULT 0; -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산)
    v_RecpAmtSum   NUMBER DEFAULT 0; -- 수납거래번호로 선수금(RTRE0030) 합계
    
    v_BalanceAmt2  NUMBER DEFAULT 0; -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산)
    v_BalanceAmt3  NUMBER DEFAULT 0;
    
    v_RecpAAA_Amt NUMBER DEFAULT 0;
    v_RecpBBB_Amt NUMBER DEFAULT 0;
                  
    v_Recp_Tp_B  RTSD0109.RECP_TP%TYPE DEFAULT NULL;  /*청구구분              */   
    v_Recp_Amt_B RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */         
    v_Sale_Amt_B RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_B RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */
    v_Zfb_Day_B  RTSD0109.ZFB_DAY%TYPE DEFAULT NULL;  /*만기계산기준일        */
    
    v_Rc_Yn_A    RTSD0109.RC_YN%TYPE DEFAULT NULL;    /*수납여부              */ 
    v_Recp_Amt_A RTSD0109.RECP_AMT%TYPE DEFAULT NULL; /*수납금액              */          
    v_Sale_Amt_A RTSD0109.SALE_AMT%TYPE DEFAULT NULL; /*매출금액              */
    v_Arre_Amt_A RTSD0109.ARRE_AMT%TYPE DEFAULT NULL; /*연체금액              */ 
    
    v_exist BOOLEAN DEFAULT FALSE;-- 데이타 존재여부
  BEGIN     
  
    -- 필수값:  수납일자, 수납거래번호, 계약번호, 고객번호, 수납취소거래번호, 등록자 ID
    IF 0 != ISDATE(v_Recv_Day) THEN
        v_Return_Message := '수납일자('||v_Recv_Day||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Recv_Seq) IS NULL THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Ord_No) IS NULL) OR (0 = Pkg_Rtsd0104.f_sRtsd0104Count(v_Ord_No)) THEN
        v_Return_Message := '계약번호('||v_Ord_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Cust_No) IS NULL) OR (0 = Pkg_Rtsd0100.f_sRtsd0100Count(v_Cust_No))THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;    
    
    IF TRIM(v_Cnc_Rseq) IS NULL THEN
        v_Return_Message := '수납취소거래번호('||v_Cnc_Rseq||') : 필수 입력값 누락으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0108.f_sRtsd0108CustNo(v_Ord_No),' ') THEN
    
        IF TRIM(v_Cust_No) != NVL(Pkg_Rtsd0104.f_sRtsd0104CustNo(v_Ord_No),' ') THEN
            v_Return_Message := '계약번호('||v_Ord_No||')와 고객번호('||v_Cust_No||')가 일치하지 않음으로 처리가 불가 합니다!';
            RAISE e_Error;        
        END IF;
    END IF;          
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산) 획득
    v_BalanceAmt := Pkg_Rtre0035.f_sRtre0035BalanceAmt(v_Ord_No, v_Cust_No);
    
    -- 수납거래번호로 선수금(RTRE0030) 합계 획득
    v_RecpAmtSum := Pkg_Rtre0030.f_sRtre0030RecpAmtSum(v_Recv_Seq);    
    
    -- 선수금 잔액 확인하여 취소금액보다 큰경우 취소 가능
    -- 계약번호/고객번호 기준 선수금(RTRE0035) 잔액(합산) < 수납거래번호로 선수금(RTRE0030) 합계
    IF v_BalanceAmt < v_RecpAmtSum THEN
        v_Return_Message := '취소금액이 선수금 잔액보다 크므로 처리가 불가능합니다.확인 바랍니다.!';
        RAISE e_Error;
    END IF;  
    
    
    -- 수납거래번호 기준 취소처리
    FOR CUR30 IN CUR_RTRE0030 LOOP
        EXIT WHEN CUR_RTRE0030%NOTFOUND;
        v_exist := TRUE;

        -- 미수금 : 수납내역(RTRE0030)의 스케쥴번호(SCHD_SEQ)가 존재하는 미수금수납 처리
        IF CUR30.SCHD_SEQ IS NOT NULL THEN
        
            -- 수납취소거래일련번호 획득
            v_Cnc_Iseq := Pkg_Rtre0030.f_sRtre0030RitmSeq(v_Cnc_Rseq);
            
            -- 수납취소거래일련번호종료 = 수납취소거래일련번호
            v_Cnc_Ioseq := v_Cnc_Iseq; 
               
            -- 수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트
            IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq, 
                                                            v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
            
            -- 수납 내역(RTRE0030) 생성 (-)
            IF 0 != Pkg_Rtre0030.f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO, 
                                     CUR30.CUST_NO, CUR30.RECP_ID, - CUR30.RECP_AMT, CUR30.RECP_TP, 
                                     CUR30.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN, 
                                     v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id, 
                                     v_ErrorText) THEN
                v_Return_Message := '수납취소(미수금) 수납 내역(RTRE0030) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;       
               
    
            -- 청구 스케줄 :  청구구분, 수납금액, 매출금액, 연체금액(미납금액), 만기계산기준일 획득
            SELECT  RECP_TP, NVL(RECP_AMT,0), NVL(SALE_AMT,0), NVL(ARRE_AMT,0), ZFB_DAY
            INTO    v_Recp_Tp_B, v_Recp_Amt_B, v_Sale_Amt_B, v_Arre_Amt_B, v_Zfb_Day_B
            FROM    RTSD0109
            WHERE   ORD_NO   = CUR30.ORD_NO
            AND     SCHD_SEQ = CUR30.SCHD_SEQ; 
            
            IF SQL%NOTFOUND THEN
                v_Return_Message := '계약번호('||CUR30.ORD_NO||')와 청구순번('||CUR30.SCHD_SEQ||')으로 청구스케쥴을 찾을 수 없습니다. 처리 불가!';
                RAISE e_Error;
            END IF;
                       
            -- 수납 대상 내역(RTRE0031) 생성
            IF 0 != Pkg_Rtre0031.f_InsertRtre0031(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO, 
                                                  CUR30.SCHD_SEQ, CUR30.CUST_NO, v_Recp_Tp_B, v_Sale_Amt_B,
                                                  v_Arre_Amt_B, v_Zfb_Day_B, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '수납취소(미수금) 수납 대상 내역(RTRE0031) 생성 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;            
                        
            -- 수납금액: 기존수납금액 + 현재수납금액(-) 
            v_Recp_Amt_A := NVL(v_Recp_Amt_B,0) + (NVL(CUR30.RECP_AMT,0) * -1);
            
            -- 연체금액(미납금액) : 매출액 - 수납금액
            v_Arre_Amt_A := NVL(v_Sale_Amt_B,0) - v_Recp_Amt_A;
            
            -- 수납여부 획득 (Y:수납, P:부분수납, N:미수납)
            -- 수납금액 = 매출액
            IF v_Recp_Amt_A  = NVL(v_Sale_Amt_B,0) THEN
                v_Rc_Yn_A := 'Y';
                
            -- 수납금액 < 매출액
            ELSIF (v_Recp_Amt_A > 0) AND (v_Recp_Amt_A < NVL(v_Sale_Amt_B,0)) THEN     
                v_Rc_Yn_A := 'P';   
            
            -- 수납금액 = 0
            ELSIF v_Recp_Amt_A = 0 THEN
                v_Rc_Yn_A := 'N';
                
            --  수납금액 > 매출액
            ELSIF v_Recp_Amt_A > NVL(v_Sale_Amt_B,0) THEN
                v_Return_Message := '매출금액('||v_Sale_Amt_B||') 보다 수납금액('||v_Recp_Amt_A||')이 크므로 처리가 불가합니다!!';
                RAISE e_Error;                
            ELSE
                v_Return_Message := '매출금액('||v_Sale_Amt_B||') 또는 수납금액('||v_Recp_Amt_A||')의 문제로 처리가 불가합니다!!';
                RAISE e_Error;            
            END IF;
            
            -- 청구스케줄(RTSD0109) Update - 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자)
            IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109ReceiptState (CUR30.ORD_NO, CUR30.SCHD_SEQ, v_Rc_Yn_A, v_Recp_Amt_A, 
                                                               v_Arre_Amt_A, v_Recv_Day, v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '청구스케줄(RTSD0109) 수납 상태 업데이트(수납여부, 수납금액, 연체금액, 수납일자) 실패!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;
             
   
        -- 선수금 :  수납내역(RTRE0030)의 스케쥴번호(SCHD_SEQ)가 NULL인 선수금수납 처리
        ELSE

            -- 선수금잔액 =  선수 발생금액(PND_AMT) - 선수 정리금액(SBS_AMT)
            v_BalanceAmt2 := Pkg_Rtre0035.f_sRtre0035BalanceAmt2(CUR30.RECV_SEQ, CUR30.RITM_SEQ);

            -- 선수금잔액 > 0 AND  선수발생금액(PND_AMT) >= 선수금잔액            
            IF v_BalanceAmt2 > 0 AND CUR30.RECP_AMT >= v_BalanceAmt2 THEN
            
            
                -- 수납취소거래일련번호 획득
                v_Cnc_Iseq := Pkg_Rtre0030.f_sRtre0030RitmSeq(v_Cnc_Rseq);
                
                -- 수납취소거래일련번호종료 = 수납취소거래일련번호
                v_Cnc_Ioseq := v_Cnc_Iseq; 
                
                -- 수납 내역 Update - 수납 취소에 따른 취소정보 업데이트
                IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq, 
                                                                v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
                
                v_RecpAAA_Amt := CUR30.RECP_AMT -  v_BalanceAmt2;
                v_RecpBBB_Amt := v_BalanceAmt2;
                v_BalanceAmt2 := 0;
                 
                -- 수납 내역 생성 (-)
                IF 0 != Pkg_Rtre0030.f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO, 
                                         CUR30.CUST_NO, CUR30.RECP_ID, - v_RecpBBB_Amt, CUR30.RECP_TP, 
                                         CUR30.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN, 
                                         v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id, 
                                         v_ErrorText) THEN
                    v_Return_Message := '수납취소(미수금) 내역 생성 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
 
                -- 선수금 상태 획득 (P:발생, R:일부정리,  S:정리)
                IF v_BalanceAmt2 = 0 THEN
                    v_Pnd_Stat := 'S';
                ELSE
                    v_Pnd_Stat := 'R';
                END IF;
                 
                -- 선수금 발생내역 업데이트
                IF 0 != Pkg_Rtre0035.f_UpdateRtre0035SbsAmt(CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_RecpBBB_Amt, v_Pnd_Stat,
                                                            v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '선수금 발생내역 업데이트 실패!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
                
                -- 선수금 정리내역 Insert                
                IF 0 != Pkg_Rtre0036.f_InsertRtre0036(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO, 
                                                      CUR30.CUST_NO, v_RecpBBB_Amt, CUR30.RECP_TP, CUR30.RECP_PAY,
                                                      v_Recp_Fg, v_Pnd_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ,
                                                      v_Reg_Id, v_ErrorText) THEN
                    v_Return_Message := '선수금 정리내역 Insert!!!'||'-'||v_ErrorText;
                    v_ErrorText := v_ErrorText;
                    RAISE e_Error;
                END IF;
                
            END IF;
            
            
            -- 선수금 정리후에도 잔액이 남은 경우
            IF v_RecpAAA_Amt > 0 THEN
            
            
                
                FOR CUR35 IN CUR_RTRE0035 LOOP
                    EXIT WHEN CUR_RTRE0035%NOTFOUND;
                    
                    -- 선수금잔액 =  선수 발생금액(PND_AMT) - 선수 정리금액(SBS_AMT)
                    v_BalanceAmt3 := CUR35.PND_AMT -  CUR35.SBS_AMT;
                    
                    -- 취소잔액이 선수금액보다 클 경우에는 선수금 전액 취소처리
                    IF v_BalanceAmt3 < v_RecpAAA_Amt THEN
                    
                        v_RecpAAA_Amt := v_RecpAAA_Amt - v_BalanceAmt3;
                        v_RecpBBB_Amt := v_BalanceAmt3;
                        v_BalanceAmt3 := 0;
                    ELSE
                        v_RecpBBB_Amt := v_RecpAAA_Amt;
                        v_BalanceAmt3 := v_BalanceAmt3 - v_RecpAAA_Amt;
                        v_RecpAAA_Amt := 0;
                    
                    END IF; 
                                        
                    -- 수납취소거래일련번호종료
                    v_Cnc_Ioseq := Pkg_Rtre0030.f_sRtre0030RitmSeq(v_Cnc_Rseq);
                    
                    -- 수납 내역 Update - 수납 취소에 따른 취소정보 업데이트
                    IF 0 != Pkg_Rtre0030.f_UpdateRtre0030CncBefore (CUR30.RECV_SEQ, CUR30.RITM_SEQ, v_Cnc_Stat, v_Cnc_Rseq, 
                                                                       v_Cnc_Iseq, v_Cnc_Ioseq, v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '수납 내역(RTRE0030) Update - 수납 취소에 따른 취소정보 업데이트 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;
                    
                    -- 수납 내역 생성 (-)
                    IF 0 != Pkg_Rtre0030.f_InsertRtre0030(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO, 
                                             CUR30.CUST_NO, CUR30.RECP_ID, - v_RecpBBB_Amt, CUR35.RECP_TP, 
                                             CUR35.RECP_PAY, v_Recp_Fg, CUR30.SCHD_SEQ, CUR30.CASH_YN, 
                                             v_Cnc_Stat, CUR30.RECV_SEQ, CUR30.RITM_SEQ, CUR30.RITM_SEQ, v_Reg_Id, 
                                             v_ErrorText) THEN
                        v_Return_Message := '수납취소(미수금) 내역 생성 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;
                    
                    -- 선수금 상태 획득 (P:발생, R:일부정리,  S:정리)
                    IF v_BalanceAmt3 = 0 THEN
                        v_Pnd_Stat := 'S';
                    ELSE
                        v_Pnd_Stat := 'R';
                    END IF;
                     
                    -- 선수금 발생내역 업데이트
                    IF 0 != Pkg_Rtre0035.f_UpdateRtre0035SbsAmt(CUR35.RECV_SEQ, CUR35.RITM_SEQ, v_RecpBBB_Amt, v_Pnd_Stat,
                                                                v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '선수금 발생내역 업데이트 실패!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;
                    
                    -- 선수금 정리내역 Insert                
                    IF 0 != Pkg_Rtre0036.f_InsertRtre0036(v_Cnc_Rseq, v_Cnc_Iseq, v_Recv_Day, CUR30.ORD_NO, 
                                                          CUR30.CUST_NO, v_RecpBBB_Amt, CUR35.RECP_TP, CUR35.RECP_PAY,
                                                          v_Recp_Fg, v_Pnd_Stat, CUR35.RECV_SEQ, CUR35.RITM_SEQ,
                                                          v_Reg_Id, v_ErrorText) THEN
                        v_Return_Message := '선수금 정리내역 Insert!!!'||'-'||v_ErrorText;
                        v_ErrorText := v_ErrorText;
                        RAISE e_Error;
                    END IF;
                    
                    IF v_RecpAAA_Amt = 0 THEN 
                        EXIT;
                    END IF;
                    
                END LOOP;  
                
                IF v_RecpAAA_Amt > 0 THEN                
                    v_Return_Message := '선수금 금액(RTRE0035) 오류(부족)로 처리 실패!!';
                    RAISE e_Error;
                END IF;
                
            END IF;            
             
        END IF;           
        
    END LOOP;    
       
    IF CUR_RTRE0030%ISOPEN THEN
        CLOSE CUR_RTRE0030;
    END IF;      
    
    IF CUR_RTRE0035%ISOPEN THEN
        CLOSE CUR_RTRE0035;
    END IF;
                   
    IF v_exist = FALSE THEN
        v_Return_Message := '수납거래번호('||v_Recv_Seq||')에 해당하는 데이터가 존재하지 않아 처리가 불가 합니다.!';
        RAISE e_Error;
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
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.p_IUDRtre0030(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0030.p_IUDRtre0030(2)', v_ErrorText, v_Return_Message);

  END p_InsertRtre0030Cancel;
  
    /*****************************************************************************
  -- 2020.07.16 K.S.T. 서비스내역 원복처리
  *****************************************************************************/
  PROCEDURE p_IRtCommSvcRollBack (
    v_Ord_No            IN RTCS0007.ORD_NO%TYPE,
    v_Prs_Dcd           IN RTCS0008.SERVICE_CD%TYPE,
    v_Serv_Seq           IN RTCS0007.SERV_SEQ%TYPE,
    v_User_Id           IN RTCS0007.REG_ID%TYPE,
    v_Success_code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ) IS
  
  e_Error EXCEPTION; 
  
  v_Seq NUMBER;
  v_Cnt NUMBER;
  
  v_Prs_Dcd1 RTSD0114.PRS_DCD1%TYPE := 'N';
  v_Prs_Dcd2 RTSD0114.PRS_DCD2%TYPE := 'N';
  v_Prs_Dcd3 RTSD0114.PRS_DCD3%TYPE := 'N';
  v_Prs_Dcd4 RTSD0114.PRS_DCD4%TYPE := 'N';
  v_Prs_Dcd5 RTSD0114.PRS_DCD5%TYPE := 'N';
  v_Prs_Dcd6 RTSD0114.PRS_DCD6%TYPE := 'N';
  v_Prs_Dcd8 RTSD0114.PRS_DCD8%TYPE := 'N';
  
  v_Prs_Dcd9 RTSD0114.PRS_DCD9%TYPE := 'N';
  v_Prs_Dcd10 RTSD0114.PRS_DCD10%TYPE := 'N';
  v_Prs_Dcd11 RTSD0114.PRS_DCD11%TYPE := 'N';
  v_Prs_Dcd12 RTSD0114.PRS_DCD12%TYPE := 'N';
    
  BEGIN
     
     --v_Return_Message := '내선번호 0309로 연락해주세요~^^';
     --RAISE e_Error;
            
        BEGIN
     
            INSERT INTO RTCM0104 (SEQ, SVC_TYPE, LOG_YMD, LOG_TIME, USER_ID, USER_IP)
            SELECT 
                    TO_NUMBER((SELECT NVL(MAX(SEQ), '0') FROM RTCM0104) + 1)
                    , v_Prs_Dcd
                    , TO_CHAR(SYSDATE, 'YYYYMMDD')
                    , TO_CHAR(SYSDATE, 'HH24MISS')
                    , v_User_Id
                    , ''  
            FROM DUAL;
            
         EXCEPTION
            WHEN others THEN
            v_Return_Message := '로그 생성 오류' || v_User_Id;
            RAISE e_Error;
         END;
     
        SELECT COUNT(*) 
        INTO v_Cnt
        FROM RTCS0007 A, RTCS0008 B 
        WHERE A.ORD_NO = B.ORD_NO
        AND A.SERV_SEQ = B.SERV_SEQ
        AND A.ORD_NO = v_Ord_No
        AND B.SERVICE_CD = v_Prs_Dcd
        AND A.SERV_SEQ = v_Serv_Seq;
        
        DBMS_OUTPUT.PUT_LINE(v_Cnt);
        IF v_Cnt > 0 THEN
        
            --엔진오일                   
            IF v_Prs_Dcd = 'B00001' THEN                         
                 v_Prs_Dcd1 := 'Y';
            END IF;
            
            --위치교환
            IF v_Prs_Dcd = 'B00002' THEN                         
                 v_Prs_Dcd2 := 'Y';
             END IF;
             
            --방문점검
            IF v_Prs_Dcd = 'B00003' THEN
                    
                 v_Prs_Dcd3 := 'Y';
                    
                 UPDATE RTCS0005 
                            SET R_MRCD = ''
                                , PROC_DAY = ''
                                , PROC_TM = ''
                                , CHK_STAT = '01'
                                , SERV_SEQ = ''
                                , CHG_ID = v_User_Id
                                , CHG_DT = SYSDATE 
                  WHERE ORD_NO = v_Ord_No 
                  AND STD_YM = (
                                         SELECT STD_YM
                                         FROM RTCS0005 
                                         WHERE ORD_NO = v_Ord_No
                                         AND SERV_SEQ = v_Serv_Seq
                                         );
            END IF;
            
            --얼라인먼트
            IF v_Prs_Dcd = 'B00008' THEN                         
                v_Prs_Dcd8 := 'Y';
            END IF;
            
            --타이어무상교체
            IF v_Prs_Dcd = 'B00007' THEN                         
                 v_Prs_Dcd6 := 'Y';
            END IF;
            
            --무상얼라인먼트서비스
            IF v_Prs_Dcd = 'B00009' THEN                         
                 v_Prs_Dcd9 := 'Y';
            END IF;
               
            --Nexen Check서비스
            IF v_Prs_Dcd = 'B00010' THEN                         
                 v_Prs_Dcd10 := 'Y';
            END IF;
            
            --마모보증서비스
            IF v_Prs_Dcd = 'B00011' THEN                         
                 v_Prs_Dcd11 := 'Y';
            END IF;
            
            --파손보증서비스
            IF v_Prs_Dcd = 'B00012' THEN                         
                 v_Prs_Dcd12 := 'Y';
            END IF;
            
                      
            DELETE FROM RTCS0007 WHERE ORD_NO = v_Ord_No AND SERV_SEQ = v_Serv_Seq;
                         
            DELETE FROM RTCS0008 WHERE ORD_NO = v_Ord_No AND SERV_SEQ = v_Serv_Seq AND SERVICE_CD = v_Prs_Dcd;  
                 
            DELETE FROM RTSD0114 
            WHERE ORD_NO = v_Ord_No 
               AND NVL(PRS_DCD1, 'N') = v_Prs_Dcd1 
               AND NVL(PRS_DCD2, 'N') = v_Prs_Dcd2 
               AND NVL(PRS_DCD3, 'N') = v_Prs_Dcd3 
               AND NVL(PRS_DCD6, 'N') = v_Prs_Dcd6 
               AND NVL(PRS_DCD8, 'N') = v_Prs_Dcd8
               AND NVL(PRS_DCD9, 'N') = v_Prs_Dcd9
               AND NVL(PRS_DCD10, 'N') = v_Prs_Dcd10
               AND NVL(PRS_DCD11, 'N') = v_Prs_Dcd11
               AND NVL(PRS_DCD12, 'N') = v_Prs_Dcd12
               AND SEQ = v_Serv_Seq;
            
            UPDATE RTSD0013 SET 
                        SERV_CNTR = SERV_CNTR + TO_NUMBER(
                                                    CASE WHEN v_Prs_Dcd6 = 'Y' THEN 
                                                        (SELECT TO_CHAR(KWMENG) FROM RTCS0010 WHERE ORD_NO = v_Ord_No AND SERV_SEQ = v_Serv_Seq) 
                                                    ELSE '1' END
                                                    ), 
                        CHG_ID = v_User_Id, 
                        CHG_DT = SYSDATE
             WHERE ORD_NO = v_Ord_No 
             AND PRS_DCD = v_Prs_Dcd;        
       
        END IF;
           
         v_Success_code := 0;
         v_Return_Message := '정상적으로 복원되었습니다';
         v_ErrorText := '';
            
--     COMMIT;
            
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
                
  END p_IRtCommSvcRollBack;
  
  /*****************************************************************************
  -- 재렌탈대상조회
  -- 2017.10.18 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_sReRentalInfo (    
    Ref_Cursor          IN OUT SYS_REFCURSOR,
    v_Cust_No           IN VARCHAR2,
    v_Safe_Key          IN VARCHAR2,
    v_Success_code      OUT NUMBER,
    v_Return_Message    OUT VARCHAR2,
    v_ErrorText         OUT VARCHAR2
  ) IS

  v_Ord_No VARCHAR2(20);
  v_Cnt NUMBER;
  
  e_Error EXCEPTION; 
  
  BEGIN
  
    
    
--     SELECT COUNT(A.ORD_NO) INTO v_Cnt FROM RTSD0104 A, RTSD0108 B WHERE A.ORD_NO = B.ORD_NO AND A.CUST_NO = v_Cust_No;
--     
--     IF v_Cnt = 0 THEN
--        v_ErrorText := '해당고객의 장착/계약이 존재하지 않습니다.';
--        RAISE e_Error;
--     END IF;
     
--     BEGIN
--         SELECT MAX(ORD_NO) INTO v_Ord_No FROM RTSD0108 
--         WHERE STAT_CD IN ('04') 
--               AND (
--                   TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(OS_DAY, 0, 4) || '/' || SUBSTR(OS_DAY, 5, 2) || '/' || SUBSTR(OS_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), -3), 'yyyymmdd')
--                   AND TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(PROC_DAY, 0, 4) || '/' || SUBSTR(PROC_DAY, 5, 2) || '/' || SUBSTR(PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 60), 'yyyymmdd')
--               )           
--               AND CUST_NO = v_Cust_No;
--     EXCEPTION
--        WHEN NO_DATA_FOUND THEN
--            v_ErrorText := '재렌탈대상 주문이 존재하지 않습니다.';
--            RAISE e_Error;
--     END;
     
     OPEN Ref_Cursor FOR
--     SELECT COL1, COL2 FROM
--     (
--         SELECT TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(OS_DAY, 0, 4) || '/' || SUBSTR(OS_DAY, 5, 2) || '/' || SUBSTR(OS_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), -3), 'yyyymmdd') COL1, OS_DAY COL2 FROM RTSD0108 WHERE ORD_NO = v_Ord_No
--         UNION ALL
--         SELECT PROC_DAY COL1, TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(PROC_DAY, 0, 4) || '/' || SUBSTR(PROC_DAY, 5, 2) || '/' || SUBSTR(PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 60), 'yyyymmdd') COL2 FROM RTSD0108 WHERE ORD_NO = v_Ord_No
--         UNION ALL
--         SELECT TO_CHAR(COUNT(*)) COL1, '' COL2 FROM RTCS0010 WHERE ORD_NO = v_Ord_No AND DLV_STAT = '04'
--         UNION ALL
--         SELECT CASE WHEN TO_CHAR(COUNT(*)) = '0' OR (MAX(MFP_YN) = 'Y' AND MAX(CANC_DAY) IS NULL) THEN 'Y' ELSE 'N' END COL1, '' COL2 FROM RTSD0108 A, RTSD0109 B WHERE A.ORD_NO = B.ORD_NO AND A.ORD_NO = v_Ord_No AND RECP_TP = '11' AND B.RC_YN = 'N' AND DEMD_DT <= TO_CHAR(SYSDATE, 'YYYYMMDD')
--     );

     SELECT ORD_NO, CUST_NO, CUST_NM, MOB_NO, ORD_DAY, OS_DAY_F, OS_DAY_T, PROC_DAY_F, PROC_DAY_T, CNT, END_TP, CNT_CD, SAFE_KEY FROM (
        SELECT             
             B.ORD_NO,
             A.CUST_NO,
             A.CUST_NM,
             A.MOB_NO, 
             C.ORD_DAY, 
             --TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.OS_DAY, 0, 4) || '/' || SUBSTR(B.OS_DAY, 5, 2) || '/' || SUBSTR(B.OS_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), -3), 'yyyymmdd') OS_DAY_F,
             TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)), -3), 'yyyymmdd') OS_DAY_F, --재렌탈 3개월전 기준일자를 장착일 기준으로 변경 20180705
             B.OS_DAY OS_DAY_T, 
             B.PROC_DAY PROC_DAY_F, 
             TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')) -1, 60), 'yyyymmdd') PROC_DAY_T,
             CASE WHEN B.MFP_YN = 'Y' AND END_TP IN ('E', 'C') THEN '0' -- 중도완납/해지의 경우 기간에 상관없이 완납으로 봄
             ELSE NVL((
                            SELECT TO_CHAR(COUNT(*)) 
                            FROM RTSD0109 X, RTSD0104 Y, RTSD0044 Z 
                            WHERE RC_YN = 'N' 
                            AND ZFB_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD') 
                            AND X.ORD_NO = B.ORD_NO
                            AND X.ORD_NO = Y.ORD_NO
                            AND Y.SALE_CD = Z.SALE_CD
                            AND X.SCD_STAT = 'S'
                            AND X.RECP_NU NOT IN (Z.EXM_MNT) --20200331 면제회차는 연체산정 회차에서 제외
                            ), '0') END CNT, --청구일기준
             NVL(B.END_TP, 'X') END_TP,
             B.CNT_CD,
             A.SAFEKEY SAFE_KEY  
             FROM RTSD0100 A, RTSD0108 B, RTSD0104 C, RTSD0106 D, RTSD0005 E 
             WHERE A.CUST_NO = B.CUST_NO
                   AND B.STAT_CD IN ('04') 
                   AND (
                       TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)), -3), 'yyyymmdd')
                       AND TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')) - 1, 60), 'yyyymmdd')
                       OR (MFP_YN = 'Y' AND TO_CHAR(SYSDATE, 'YYYYMMDD') <= TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')) -1, 60), 'yyyymmdd'))
                   )           
                   AND B.ORD_NO = C.ORD_NO
                   AND C.ORD_NO = D.ORD_NO
                   AND D.MAT_CD = E.MAT_CD
                   AND C.FORD_NO IS NULL
                   ORDER BY ORD_NO) 
    WHERE CNT = 0
    AND END_TP  NOT IN ('C') --중도해지제외
    AND CNT_CD NOT IN ('01')
    AND CUST_NO = DECODE(v_Cust_No       , NULL, CUST_NO          , v_Cust_No)
    --AND SAFE_KEY = DECODE(v_Safe_Key     , NULL, SAFE_KEY         , v_Safe_Key)
    AND NVL(SAFE_KEY, 'NULL') = DECODE(v_Safe_Key     , NULL, NVL(SAFE_KEY, 'NULL')         , v_Safe_Key)
    AND ROWNUM = 1;
     
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
        
  END p_sReRentalInfo;
  
  /*****************************************************************************
  -- 재렌탈대상조회
  -- 2017.10.18 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_sReRentalList (
    Ref_Cursor            IN OUT SYS_REFCURSOR,
    v_ProcDayF            IN RTSD0108.PROC_DAY%TYPE,
    v_ProcDayT            IN RTSD0108.PROC_DAY%TYPE,
    v_OsDayF              IN RTSD0108.OS_DAY%TYPE,
    v_OsDayT              IN RTSD0108.OS_DAY%TYPE,
    v_OrdDayF             IN RTSD0108.ORD_DAY%TYPE,
    v_OrdDayT             IN RTSD0108.ORD_DAY%TYPE,    
    v_ChanCd              IN RTSD0108.CHAN_CD%TYPE,
    v_CarNo               IN RTSD0108.CAR_NO%TYPE,
    v_OrdNo               IN RTSD0108.ORD_NO%TYPE,    
    v_CustNm              IN RTSD0100.CUST_NM%TYPE,
    v_MobNo               IN RTSD0100.MOB_NO%TYPE,
    v_ProvsnSt            IN RTSD0121.PROVSN_ST%TYPE,
    v_ProvsnStDtl         IN RTSD0121.PROVSN_ST_DTL%TYPE,
    v_AreaNm              IN RTSD0100.ADDR1%TYPE,
    v_ProvsnNo            IN RTSD0121.PROVSN_NO%TYPE,
    v_RecallDay           IN RTSD0122.RECALL_DAY%TYPE
  ) IS
  
  BEGIN
  
    OPEN Ref_Cursor FOR
     SELECT F.ORD_NO, F.CUST_NO, CUST_NM, MOB_NO, F.ORD_DAY, OS_DAY_F, OS_DAY_T, PROC_DAY_F, PROC_DAY_T, CNT, END_TP, F.CNT_CD, SAFE_KEY, 
        F.MFP_YN, F.PROC_DAY, F.PERIOD_CD, REQ_TEXT, MAT_NM, PROVSN_NO, SUM_ARRE_AMT, PRV_ORD_NO, CUST_REQ, PROVSN_ST, PROVSN_ST_DTL, PROVSN_ST_NM, PROVSN_ST_DTL_NM,
        TEL_NO, BLD_MNG_NO, EMAIL_ADDR, PLAN_DAY, CONTACT_GET, PROVSN_DAY, PS_NM, CAR_NO, POS_CD, ADDR1, ADDR2, CONTACT_CNT, RECALL_DAY, RECALL_TM,
        MAX(DECODE(G.PRS_DCD, 'B00001', SERV_CNTR, 0)) B00001, MAX(DECODE(G.PRS_DCD, 'B00002', SERV_CNTR, 0)) B00002, MAX(DECODE(G.PRS_DCD, 'B00003', SERV_CNTR, 0)) B00003,
        MAX(DECODE(G.PRS_DCD, 'B00004', SERV_CNTR, 0)) B00004, MAX(DECODE(G.PRS_DCD, 'B00005', SERV_CNTR, 0)) B00005, MAX(DECODE(G.PRS_DCD, 'B00006', SERV_CNTR, 0)) B00006,
        MAX(DECODE(G.PRS_DCD, 'B00007', SERV_CNTR, 0)) - Pkg_Rtcs0010.f_sRtcs0010ComplCnt(F.ORD_NO) B00007, MAX(DECODE(G.PRS_DCD, 'B00008', SERV_CNTR, 0)) B00008
     FROM (
            SELECT             
                 B.ORD_NO,
                 A.CUST_NO,
                 A.CUST_NM,
                 A.MOB_NO, 
                 C.ORD_DAY, 
                 --TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.OS_DAY, 0, 4) || '/' || SUBSTR(B.OS_DAY, 5, 2) || '/' || SUBSTR(B.OS_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), -3), 'yyyymmdd') OS_DAY_F,
                 TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)), -3), 'yyyymmdd') OS_DAY_F, --재렌탈 3개월전 기준일자를 장착일 기준으로 변경 20180705
                 TO_CHAR(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)) -1, 'yyyymmdd') OS_DAY_T, 
                 B.PROC_DAY PROC_DAY_F, 
                 TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')) -1, 60), 'yyyymmdd') PROC_DAY_T,
                 CASE WHEN B.MFP_YN = 'Y' AND END_TP IN ('E', 'C') THEN '0' -- 중도완납/해지의 경우 기간에 상관없이 완납으로 봄
                 ELSE NVL((
                                SELECT TO_CHAR(COUNT(*)) 
                                FROM RTSD0109 X, RTSD0104 Y, RTSD0044 Z 
                                WHERE RC_YN = 'N' 
                                AND ZFB_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD') 
                                AND X.ORD_NO = B.ORD_NO
                                AND X.ORD_NO = Y.ORD_NO
                                AND Y.SALE_CD = Z.SALE_CD
                                AND X.SCD_STAT = 'S'
                                AND X.RECP_NU NOT IN (Z.EXM_MNT)
                                ), '0') END CNT, --청구일기준, 면제회차 제외 20200331 kstka
                 NVL(B.END_TP, 'X') END_TP,
                 B.CNT_CD,
                 A.SAFEKEY SAFE_KEY,
                 B.MFP_YN,
                 B.PROC_DAY, 
                 B.PERIOD_CD,
                 B.REQ_TEXT,
                 E.MAT_NM,
                 B.CAR_NO,
                 B.CHAN_CD,
                 I.CD_NM PS_NM,
                 H.PROVSN_NO,
                 H.PROVSN_DAY,
                 '' PRV_ORD_NO,
                 H.CUST_REQ,
                 H.PROVSN_ST,
                 H.PROVSN_ST_DTL,
                 H.PLAN_DAY,
                 H.CONTACT_GET,
                 K.CD_NM PROVSN_ST_NM,
                 L.CD_NM PROVSN_ST_DTL_NM,
                 A.TEL_NO,
                 A.BLD_MNG_NO,
                 A.POS_CD,
                 A.ADDR1,
                 A.ADDR2,
                 A.EMAIL_ADDR,
                 J.RECALL_DAY,
                 J.RECALL_TM,
                 (SELECT SUM(ARRE_AMT) FROM RTSD0109 WHERE ORD_NO = B.ORD_NO AND SCD_STAT = 'S') SUM_ARRE_AMT, 
                 (SELECT COUNT(*) FROM RTSD0122 WHERE PROVSN_NO = H.PROVSN_NO) CONTACT_CNT
                 FROM RTSD0100 A, RTSD0108 B, RTSD0104 C, RTSD0106 D, RTSD0005 E, RTSD0121 H, RTCM0051 I, RTCM0051 K, RTCM0051 L
                   , (SELECT ROW_NUMBER() OVER (PARTITION BY X.PROVSN_NO ORDER BY X.CALL_SEQ DESC) AS ROW_NUM, X.RECALL_DAY, X.RECALL_TM, X.PROVSN_NO FROM RTSD0122 X) J
                 WHERE A.CUST_NO = B.CUST_NO
                       AND B.STAT_CD IN ('04')           
                       AND B.ORD_NO = C.ORD_NO
                       AND C.ORD_NO = D.ORD_NO
                       AND D.MAT_CD = E.MAT_CD
                       AND B.ORD_NO = H.HSHOP_ORDNO(+)
                       AND H.PROVSN_TP(+) = 'R'
                       AND B.PS_CD  = I.CD(+)
                       AND I.CD_GRP_CD(+) = 'S043'
                       AND H.PROVSN_NO = J.PROVSN_NO(+)
                       AND J.ROW_NUM(+) = 1
                       AND H.PROVSN_ST = K.CD(+)
                       AND K.CD_GRP_CD(+) = 'S103'
                       AND H.PROVSN_ST_DTL = L.CD(+)
                       AND L.CD_GRP_CD(+) = 'S104'
--                       AND C.BORD_NO IS NULL
                       AND A.CUST_NM IS NOT NULL) F, RTSD0013 G                   
        WHERE 1=1 
        AND F.ORD_NO = G.ORD_NO
        AND F.CNT = 0
        AND F.END_TP  NOT IN ('C') --중도해지제외
        AND F.CNT_CD NOT IN ('01')
        AND F.PROC_DAY BETWEEN DECODE(v_ProcDayF, NULL, F.PROC_DAY, v_ProcDayF) AND DECODE(v_ProcDayT, NULL, F.PROC_DAY, v_ProcDayT)
        AND OS_DAY_T BETWEEN DECODE(v_OsDayF, NULL, OS_DAY_F, v_OsDayF) AND DECODE(v_OsDayT, NULL, OS_DAY_T, v_OsDayT)
        AND F.ORD_DAY BETWEEN DECODE(v_OrdDayF, NULL, F.ORD_DAY, v_OrdDayF) AND DECODE(v_OrdDayT, NULL, F.ORD_DAY, v_OrdDayT)        
        AND (
           OS_DAY_T BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(PROC_DAY, 0, 4) || '/' || SUBSTR(PROC_DAY, 5, 2) || '/' || SUBSTR(PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), PERIOD_CD)), -3), 'yyyymmdd')
           AND TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(PROC_DAY, 0, 4) || '/' || SUBSTR(PROC_DAY, 5, 2) || '/' || SUBSTR(PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')) - 1, 60), 'yyyymmdd')
           OR (MFP_YN = 'Y' AND OS_DAY_T <= TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(PROC_DAY, 0, 4) || '/' || SUBSTR(PROC_DAY, 5, 2) || '/' || SUBSTR(PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')) -1, 60), 'yyyymmdd'))
           )
        AND CUST_NM = DECODE(v_CustNm, NULL, CUST_NM, v_CustNm)
        AND CHAN_CD = DECODE(v_ChanCd, NULL, CHAN_CD, v_ChanCd)
        AND CAR_NO = DECODE(v_CarNo, NULL, CAR_NO, v_CarNo)
        AND MOB_NO = DECODE(v_MobNo, NULL, MOB_NO, v_MobNo)
        AND F.ORD_NO = DECODE(v_OrdNo, NULL, F.ORD_NO, v_OrdNo)
        AND NVL(PROVSN_ST, '1') = DECODE(v_ProvsnSt, NULL, NVL(PROVSN_ST, '1'), v_ProvsnSt)
        AND NVL(PROVSN_ST_DTL, '1') = DECODE(v_ProvsnStDtl, NULL, NVL(PROVSN_ST_DTL, '1'), v_ProvsnStDtl)
        AND ADDR1 LIKE '%' || DECODE(v_AreaNm, NULL, ADDR1, v_AreaNm) || '%'
        AND NVL(PROVSN_NO, '1') = DECODE(v_ProvsnNo, NULL, NVL(PROVSN_NO, '1'), v_ProvsnNo)
        AND NVL(RECALL_DAY, '1') = DECODE(v_RecallDay, NULL, NVL(RECALL_DAY, '1'), v_RecallDay)
    GROUP BY F.ORD_NO, CUST_NO, CUST_NM, MOB_NO, ORD_DAY, OS_DAY_F, OS_DAY_T, PROC_DAY_F, PROC_DAY_T, CNT, END_TP, F.CNT_CD, SAFE_KEY, 
    MFP_YN, PROC_DAY, PERIOD_CD, REQ_TEXT, MAT_NM, PROVSN_NO, SUM_ARRE_AMT, PRV_ORD_NO, CUST_REQ, PROVSN_ST, PROVSN_ST_DTL,
    TEL_NO, BLD_MNG_NO, EMAIL_ADDR, PLAN_DAY, CONTACT_GET, PROVSN_DAY, PS_NM, CAR_NO, POS_CD, ADDR1, ADDR2, CONTACT_CNT, RECALL_DAY, RECALL_TM,
    PROVSN_ST_NM, PROVSN_ST_DTL_NM
    --ORDER BY PROVSN_NO, ORD_NO
    ;
               
  END p_sReRentalList;
  
  /*****************************************************************************
  -- 재렌탈대상조회
  -- 2017.10.18 K.S.T. - 최초작성
  *****************************************************************************/
  FUNCTION f_sReRentalOrdNo (    
    v_Cust_No           IN VARCHAR2,
    v_Safe_Key          IN VARCHAR2
  ) RETURN VARCHAR2 IS

  v_Ord_No VARCHAR2(20); 
  
  BEGIN
  
     SELECT ORD_NO INTO v_Ord_No FROM (
        SELECT             
             B.ORD_NO,
             A.CUST_NO,
             A.CUST_NM,
             A.MOB_NO, 
             C.ORD_DAY, 
             TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.OS_DAY, 0, 4) || '/' || SUBSTR(B.OS_DAY, 5, 2) || '/' || SUBSTR(B.OS_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), -3), 'yyyymmdd') OS_DAY_F,
             B.OS_DAY OS_DAY_T, 
             B.PROC_DAY PROC_DAY_F, 
             TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 60), 'yyyymmdd') PROC_DAY_T,
             CASE WHEN B.MFP_YN = 'Y' AND END_TP IN ('E', 'C') THEN '0' -- 중도완납/해지의 경우 기간에 상관없이 완납으로 봄
             ELSE NVL((
                                SELECT TO_CHAR(COUNT(*)) 
                                FROM RTSD0109 X, RTSD0104 Y, RTSD0044 Z 
                                WHERE RC_YN = 'N' 
                                AND ZFB_DAY < TO_CHAR(SYSDATE, 'YYYYMMDD') 
                                AND X.ORD_NO = B.ORD_NO
                                AND X.ORD_NO = Y.ORD_NO
                                AND Y.SALE_CD = Z.SALE_CD
                                AND X.SCD_STAT = 'S'
                                AND X.RECP_NU NOT IN (Z.EXM_MNT)
                                ), '0') END CNT, --청구일기준
             NVL(B.END_TP, 'X') END_TP,
             B.CNT_CD,
             A.SAFEKEY SAFE_KEY  
             FROM RTSD0100 A, RTSD0108 B, RTSD0104 C, RTSD0106 D, RTSD0005 E 
             WHERE A.CUST_NO = B.CUST_NO
                   AND B.STAT_CD IN ('04') 
                   AND (
                       TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)), -3), 'yyyymmdd')
                       AND TO_CHAR(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), 60), 'yyyymmdd')
                       OR MFP_YN = 'Y'
                   )           
                   AND B.ORD_NO = C.ORD_NO
                   AND C.ORD_NO = D.ORD_NO
                   AND D.MAT_CD = E.MAT_CD
                   AND C.FORD_NO IS NULL
                   ORDER BY B.ORD_NO) 
    WHERE CNT = 0
    AND END_TP  NOT IN ('C') --중도해지제외
    AND CNT_CD NOT IN ('01')
    AND CUST_NO = DECODE(v_Cust_No       , NULL, CUST_NO          , v_Cust_No)
    AND SAFE_KEY = DECODE(v_Safe_Key     , NULL, SAFE_KEY         , v_Safe_Key)
    AND ROWNUM = 1;
     
    RETURN v_Ord_No;
    
  EXCEPTION
      WHEN OTHERS THEN
        RETURN NULL;
        
  END f_sReRentalOrdNo;
  
  /*****************************************************************************
  -- 연체강제리셋 - 백업테이블에 저장후 리셋
  -- 2017.10.17 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_URtre0100Backup (
    v_Cust_No              IN VARCHAR2,
    v_Success_code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
  ) IS
  
    v_Tmp_Cust_No VARCHAR2(10);
    v_Tmp_Cust_No1 VARCHAR2(10);
    v_Dely_Day VARCHAR2(8);
    v_User_Id  VARCHAR2(10);
    
    v_Cnt NUMBER;
    
    e_Error EXCEPTION;
    
  BEGIN

    v_Tmp_Cust_No := '9999999999';
    v_User_Id := 'kstka';

    
    SELECT COUNT(*) INTO v_Cnt FROM RTRE0100 WHERE CUST_NO = v_Tmp_Cust_No;
    
    IF v_Cnt > 0 THEN
        v_Return_Message := '현재 작업중인 연체내역이 존재 합니다.::'||SQLERRM;
        RAISE e_Error;
    END IF;
    
    BEGIN
        DBMS_OUTPUT.PUT_LINE('1.RTRE0100 UPDATE 진행 :: ' || v_Cust_No || '->' || v_Tmp_Cust_No);
        
        UPDATE RTRE0100 SET CUST_NO = v_Tmp_Cust_No WHERE CUST_NO = v_Cust_No;
    EXCEPTION
        WHEN e_Error THEN
            v_Return_Message := 'RTRE0100업데이트 에러::'||SQLERRM;
            RAISE e_Error;
    END;
    
    BEGIN
        
        DBMS_OUTPUT.PUT_LINE('1.RTRE0100 UPDATE 진행 :: ' || v_Cust_No || '->' || v_Tmp_Cust_No);
        
        UPDATE RTRE0100 SET CUST_NO = v_Tmp_Cust_No WHERE CUST_NO = v_Cust_No;
        
        DBMS_OUTPUT.PUT_LINE('2.RTTM0002 INSERT 진행');
        
        INSERT INTO RTTM0002 (CUST_NO, SEQ, ORD_NO, DELY_DAY, APPR_AMT, APPR_SCNT, REG_ID, REG_DT, CHG_ID, CHG_DT, RECP_TP, RES_YN)
        SELECT v_Cust_No, (SELECT TO_NUMBER(NVL(MAX(SEQ), '0')) + 1 FROM RTTM0002 WHERE CUST_NO = v_Cust_No) SEQ, ORD_NO, DELY_DAY, APPR_AMT, APPR_SCNT, v_User_Id, SYSDATE, v_User_Id, SYSDATE, RECP_TP, 'N' 
        FROM (SELECT CUST_NO, DELY_DAY, ORD_NO, RECP_TP, APPR_AMT, APPR_SCNT, RANK() OVER(PARTITION BY CUST_NO ORDER BY DELY_DAY DESC) RNK
        FROM RTRE0100 WHERE CUST_NO = v_Tmp_Cust_No) WHERE RNK = 1;
        
        SELECT COUNT(*) INTO v_Cnt FROM RTTM0002;
        
        DBMS_OUTPUT.PUT_LINE('3.DELY_DAY 조회(' || v_Cust_No || ')');
        
        SELECT DELY_DAY INTO v_Dely_Day FROM (SELECT DELY_DAY FROM RTTM0002 WHERE CUST_NO = v_Cust_No ORDER BY SEQ DESC) WHERE ROWNUM = 1;
        
        DBMS_OUTPUT.PUT_LINE('4.RTRE0100 금액/횟수 UPDATE (' || v_Cust_No || ',' || v_Dely_Day || ')');
        
        UPDATE RTRE0100 SET APPR_AMT = 0, APPR_SCNT = 0 WHERE CUST_NO = v_Tmp_Cust_No AND DELY_DAY = v_Dely_Day;
        
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN            
            v_Return_Message := 'RTRE0100 금액/횟수 업데이트 오류(' || v_Tmp_Cust_No || '-' || v_Dely_Day || ')::'||SQLERRM;
            RAISE e_Error;
    END;
    
    v_Success_code := 0;
    v_Return_Message := '정상적으로 삭제되었습니다';
    v_ErrorText := '';
     
  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        DBMS_OUTPUT.PUT_LINE(v_Return_Message);
       WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_Return_Message);
          
  END p_URtre0100Backup;
  
  /*****************************************************************************
  -- 연체강제리셋롤백 - 백업테이블 롤백
  -- 2017.10.18 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_URtre0100RollBack (
    v_Cust_No              IN VARCHAR2,
    v_Success_code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
  ) IS
  
    v_Tmp_Cust_No VARCHAR2(10);
    v_Dely_Day VARCHAR2(8);
    v_User_Id  VARCHAR2(10);
    
    v_Cnt NUMBER;
    
    e_Error EXCEPTION;
    
  BEGIN

    v_Tmp_Cust_No := '9999999999';
    v_User_Id := 'kstka';

    --SELECT MAX(DELY_DAY) INTO v_Dely_Day FROM RTRE0100;
    
    SELECT COUNT(*) INTO v_Cnt FROM RTTM0002 WHERE CUST_NO = v_Cust_No AND RES_YN = 'N';
    
    IF v_Cnt = 0 THEN
        v_Return_Message := '현재 연체작업중인 내역이 존재하지 않습니다.::'||SQLERRM;
        RAISE e_Error;
    END IF;
    
    BEGIN
        
        DBMS_OUTPUT.PUT_LINE('1.RTRE0100 복원(' || v_Tmp_Cust_No || '->' || v_Cust_No || ')');
        UPDATE RTRE0100 SET CUST_NO = v_Cust_No WHERE CUST_NO = v_Tmp_Cust_No;
        
        DBMS_OUTPUT.PUT_LINE('2.RTRE0100 금액/횟수 복원(' || v_Cust_No || ')');
        FOR curs IN (SELECT CUST_NO, ORD_NO, DELY_DAY, RECP_TP, APPR_AMT, APPR_SCNT FROM RTTM0002 WHERE CUST_NO = v_Cust_No AND RES_YN = 'N') LOOP
            DBMS_OUTPUT.PUT_LINE(curs.CUST_NO || '-' || curs.DELY_DAY || '-' || curs.ORD_NO || '-' || curs.RECP_TP || '-' ||  curs.APPR_AMT || '-' ||  curs.APPR_SCNT);
            
            v_Dely_Day := curs.DELY_DAY;
            
            UPDATE RTRE0100 SET APPR_AMT = curs.APPR_AMT, APPR_SCNT = curs.APPR_SCNT WHERE CUST_NO = curs.CUST_NO AND DELY_DAY = curs.DELY_DAY AND ORD_NO = curs.ORD_NO AND RECP_TP = curs.RECP_TP;
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('3.RTTM0002 결과 적용(' || v_Cust_No || ',' || v_Dely_Day || ')');
        UPDATE RTTM0002 SET CHG_ID = v_User_Id, CHG_DT = SYSDATE, RES_YN = 'Y' WHERE CUST_NO = v_Cust_No AND RES_YN = 'N';
        
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN            
            v_Return_Message := 'RTRE0100 연체 복원 업데이트 오류(' || v_Tmp_Cust_No || '-' || v_Dely_Day || ')::'||SQLERRM;
            RAISE e_Error;
    END;
  
    v_Success_code := 0;
    v_Return_Message := '정상적으로 삭제되었습니다';
    v_ErrorText := '';
    
  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        DBMS_OUTPUT.PUT_LINE(v_Return_Message);
       WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        DBMS_OUTPUT.PUT_LINE(v_Return_Message);
          
  END p_URtre0100RollBack;
  
  /*****************************************************************************
  -- 방문점검스케쥴 강제생성 - 초기배정건에 한해서 강제생성 가능
  -- 2017.10.17 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_CreateVisitCheckList (
    v_Ord_No          IN VARCHAR2,
    v_Std_Ym          IN VARCHAR2,
    v_Plan_Day        IN VARCHAR2,
    v_Mr_Cd           IN VARCHAR2,
    v_User_Id         IN VARCHAR2
  ) IS
  
  v_Tmp_Ord_No VARCHAR2(12);
  
  v_Return_Message VARCHAR2(200);
  
  e_Error EXCEPTION;
  BEGIN
   
    BEGIN
        SELECT ORD_NO INTO v_Tmp_Ord_No FROM RTCS0005 WHERE ORD_NO = v_Ord_No;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_Return_Message := '초기데이터를 찾을 수 없습니다.::'||SQLERRM;
    END;
    
    BEGIN
        
        INSERT INTO RTCS0005 (TARGET_CD, STD_YM, SERV_SEQ, R_MRCD, REQ_DESC, REG_ID, REG_DT, PROC_YN, PROC_TM, PROC_DAY, PLAN_TM0, PLAN_TM, PLAN_DAY0, PLAN_DAY, ORD_NO,
                              OB_ST_DTL, OB_ST, NP_DESC, NP_CD, MR_MEMO, MR_CD, JOB_SEQ, EQU_NO, CHK_STAT, CHG_ID, CHG_DT)
        SELECT '1', v_Std_Ym, '', '', '', v_User_Id, SYSDATE, 'N', '', '', '000000', '000000', v_Plan_Day, v_Plan_Day, v_Ord_No,
                              '0101', '01', '', '', '', v_Mr_Cd, 1, v_Ord_No || '001', '01', v_User_Id, SYSDATE FROM DUAL;
                              
        
        INSERT INTO RTCS0006 (ADDR1, ADDR2, BLD_MNG_NO, CHG_ID, CHG_DT, EQU_NO, JOB_SEQ, MOB_NO, MR_CD, ORD_NO, PLAN_DAY, PLAN_TM, POSCD, POS_X, POS_Y, REG_ID, REG_DT, 
                              SEQ, STD_YM, TEL_NO)
        SELECT ADDR1, ADDR2, BLD_MNG_NO, CHG_ID, CHG_DT, EQU_NO, JOB_SEQ, MOB_NO, MR_CD, ORD_NO, PLAN_DAY, PLAN_TM, POSCD, POS_X, POS_Y, REG_ID, REG_DT, SEQ, STD_YM, TEL_NO FROM
        (SELECT ADDR1, ADDR2, BLD_MNG_NO, v_User_Id REG_ID, SYSDATE REG_DT, EQU_NO, 1 JOB_SEQ, MOB_NO, v_Mr_Cd MR_CD, v_Ord_No ORD_NO, v_Plan_Day PLAN_DAY, '000000' PLAN_TM, 
        POSCD, '' POS_X, '' POS_Y, v_User_Id CHG_ID, SYSDATE CHG_DT, 1 SEQ, v_Std_Ym STD_YM, TEL_NO, RANK() OVER(PARTITION BY STD_YM ORDER BY SEQ DESC) RNK 
        FROM RTCS0006 WHERE ORD_NO = v_Ord_No) WHERE RNK = 1;
                                                    
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            v_Return_Message := '방문점검내역 생성 오류::'||SQLERRM;
            RAISE e_Error;
    END;
    
  END p_CreateVisitCheckList;
  
  /*****************************************************************************
  -- 방문점검스케쥴 원복
  -- 2017.10.23 K.S.T. - 최초작성
  --2020.07.16 K.S.T - 사용하지 않음
  *****************************************************************************/
  PROCEDURE p_VisitCheckRollBack (
    v_Ord_No          IN VARCHAR2,
    v_Std_Ym          IN VARCHAR2,
    v_User_Id         IN VARCHAR2,
    v_Success_code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
  ) IS
  
  v_Serv_Seq NUMBER;
  v_Proc_Day VARCHAR2(8);
  v_R_Mrcd   VARCHAR2(10);
  v_Proc_Tm  VARCHAR2(6);
  v_Chk_Stat VARCHAR2(2);
  v_A_Mileage NUMBER;
  v_Proc_In_Cd VARCHAR2(10);
  v_Dlvc_Yn VARCHAR2(1);
  v_Dlvr_Day VARCHAR2(8);
  v_Dlvr_Seq NUMBER;
  v_File_Name VARCHAR2(300);
  v_File_Path VARCHAR2(900);
  v_Input_Dt VARCHAR2(8);
  v_Sv_Sert VARCHAR2(1);
  v_Serv_Cntr NUMBER;
  
  e_Error    EXCEPTION;
  
  BEGIN    
        
    IF v_Std_Ym <> TO_CHAR(SYSDATE, 'YYYYMM') THEN
       v_Return_Message := '당월 처리 내역이 아닙니다. 관리자에게 연락 바랍니다.';
       RAISE e_Error;
    END IF;
    
    BEGIN    
        
        SELECT SERV_SEQ, PROC_DAY, R_MRCD, PROC_TM, CHK_STAT INTO v_Serv_Seq, v_Proc_Day, v_R_Mrcd, v_Proc_Tm, v_Chk_Stat FROM RTCS0005 WHERE ORD_NO = v_Ord_No AND STD_YM = v_Std_Ym AND TARGET_CD IN ('1', '3', '4');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_Return_Message := '해당월 방문점검 내역이 존재하지 않습니다.';
            RAISE e_Error;    
    END;
    
    BEGIN
        
        SELECT A_MILEAGE, PROC_IN_CD INTO v_A_Mileage, v_Proc_In_Cd  FROM RTCS0007 WHERE ORD_NO = v_Ord_No AND SERV_SEQ = v_Serv_Seq;
        
        SELECT DLVC_YN, DLVR_DAY, DLVR_SEQ INTO v_Dlvc_Yn, v_Dlvr_Day, v_Dlvr_Seq  FROM RTCS0008 WHERE ORD_NO = v_Ord_No AND SERV_SEQ = v_Serv_Seq;
        
        SELECT FILE_NAME, FILE_PATH, INPUT_DT, SV_SERT INTO v_File_Name, v_File_Path, v_Input_Dt, v_Sv_Sert  FROM RTSD0114 WHERE ORD_NO = v_Ord_No AND PROC_DAY = v_Proc_Day AND PRS_DCD3 = 'Y';
        
        SELECT SERV_CNTR INTO v_Serv_Cntr FROM RTSD0013 WHERE ORD_NO = v_Ord_No AND PRS_DCD = 'B00003';
        
        INSERT INTO RTCS0205 VALUES (v_Ord_No, v_Std_Ym, v_R_Mrcd, v_Proc_Day, v_Proc_Tm, v_Chk_Stat, v_Serv_Seq, v_Serv_Cntr, v_Proc_In_Cd, v_A_Mileage, v_Dlvc_Yn, v_Dlvr_Seq,
                                     v_Dlvr_Day, v_Input_Dt, v_File_Path, v_File_Name, v_Sv_Sert, 'N', v_User_Id, SYSDATE, v_User_Id, SYSDATE);
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_Return_Message := '로그정보가 존재하지 않습니다.';
            RAISE e_Error;
        WHEN OTHERS THEN
            v_Return_Message := '로그정보 저장 에러!!';
            RAISE e_Error;
    END;
    
    BEGIN
    
        UPDATE RTCS0005 SET R_MRCD = '', PROC_DAY = '', PROC_TM = '', CHK_STAT = '01', SERV_SEQ = '',
        CHG_ID = v_User_Id, CHG_DT = SYSDATE WHERE ORD_NO = v_Ord_No AND STD_YM = v_Std_Ym;
        
        --DELETE FROM RTCS0006 WHERE ORD_NO = v_Ord_No AND STD_YM = v_Std_Ym;
        
        DELETE FROM RTCS0007 WHERE ORD_NO = v_Ord_No AND SERV_SEQ = v_Serv_Seq;
        
        DELETE FROM RTCS0008 WHERE ORD_NO = v_Ord_No AND SERV_SEQ = v_Serv_Seq;
        
        DELETE FROM RTSD0114 WHERE ORD_NO = v_Ord_No AND PROC_DAY = v_Proc_Day AND PRS_DCD3 = 'Y';
        
        UPDATE RTSD0013 SET SERV_CNTR = SERV_CNTR + 1 WHERE ORD_NO = v_Ord_No AND PRS_DCD = 'B00003';
    
        COMMIT;
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
    END;
    
  END p_VisitCheckRollBack;
  
  /*****************************************************************************
  -- 홈쇼핑 가계약 등록(IUD)
  -- 2018.01.08 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IUDHomeProvisionalTemp (
    v_Comm_Dvsn            IN CHAR,                         /*처리구분(I,U,D)       */
    v_Col_01               IN VARCHAR2,
    v_Col_02               IN VARCHAR2,
    v_Col_03               IN VARCHAR2,
    v_Col_04               IN VARCHAR2,
    v_Col_05               IN VARCHAR2,
    v_Col_06               IN VARCHAR2,
    v_Col_07               IN VARCHAR2,
    v_Col_08               IN VARCHAR2,
    v_Col_09               IN VARCHAR2,
    v_Col_10               IN VARCHAR2,
    v_Col_11               IN VARCHAR2,
    v_Col_12               IN VARCHAR2,
    v_Col_13               IN VARCHAR2,
    v_Col_14               IN VARCHAR2,
    v_Col_15               IN VARCHAR2,
    v_Col_16               IN VARCHAR2,
    v_Col_17               IN VARCHAR2,
    v_Col_18               IN VARCHAR2,
    v_Col_19               IN VARCHAR2,
    v_Col_20               IN VARCHAR2,
    v_Col_21               IN VARCHAR2,
    v_Col_22               IN VARCHAR2,
    v_Col_23               IN VARCHAR2,
    v_Col_24               IN VARCHAR2,
    v_Col_25               IN VARCHAR2,
    v_Col_26               IN VARCHAR2,
    v_Col_27               IN VARCHAR2,
    v_Col_28               IN VARCHAR2,
    v_Col_29               IN VARCHAR2,
    v_Col_30               IN VARCHAR2,
    v_Col_31               IN VARCHAR2,
    v_Col_32               IN VARCHAR2,
    v_Col_33               IN VARCHAR2,
    v_Col_34               IN VARCHAR2,
    v_Col_35               IN VARCHAR2,
    v_Col_36               IN VARCHAR2,
    v_Col_37               IN VARCHAR2,
    v_Col_38               IN VARCHAR2,
    v_Col_39               IN VARCHAR2,
    v_Col_40               IN VARCHAR2,
    v_Col_41               IN VARCHAR2,
    v_Col_42               IN VARCHAR2,
    v_Col_43               IN VARCHAR2,
    v_Col_44               IN VARCHAR2,
    v_Col_45               IN VARCHAR2,
    v_Col_46               IN VARCHAR2,
    v_Col_47               IN VARCHAR2,
    v_Col_48               IN VARCHAR2,
    v_Col_49               IN VARCHAR2,
    v_Col_50               IN VARCHAR2,
    v_Success_Code         OUT NUMBER,
    v_Return_Message       OUT VARCHAR2,
    v_ErrorText            OUT VARCHAR2
    ) IS
    
  BEGIN
  
    IF v_Comm_Dvsn = 'I' THEN
        p_IHomeProvisionalTemp(V_COL_01, V_COL_02, V_COL_03, V_COL_04, V_COL_05, V_COL_06, V_COL_07, V_COL_08, V_COL_09, V_COL_10, 
                               V_COL_11, V_COL_12, V_COL_13, V_COL_14, V_COL_15, V_COL_16, V_COL_17, V_COL_18, V_COL_19, V_COL_20, 
                               V_COL_21, V_COL_22, V_COL_23, V_COL_24, V_COL_25, V_COL_26, V_COL_27, V_COL_28, V_COL_29, V_COL_30, 
                               V_COL_31, V_COL_32, V_Col_33, V_Col_34, V_Col_35, V_Col_36, V_Col_37, V_Col_38, V_Col_39, V_Col_40,
                               V_Col_41, V_Col_42, V_Col_43, V_Col_44, V_Col_45, V_Col_46, V_Col_47, V_Col_48, V_Col_49, V_Col_50);
    ELSIF v_Comm_Dvsn = 'D' THEN
        p_DHomeProvisionalTemp();
    END IF;
    
    v_Success_Code := 0;
    v_Return_Message := '';
    v_ErrorText := '';
    
    COMMIT;
    
  EXCEPTION
       WHEN OTHERS THEN
        --ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200); 
  END p_IUDHomeProvisionalTemp;
    
  /*****************************************************************************
  -- 홈쇼핑 가계약 등록
  -- 2017.12.22 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_IHomeProvisionalTemp (
    v_Col_01               IN VARCHAR2,
    v_Col_02               IN VARCHAR2,
    v_Col_03               IN VARCHAR2,
    v_Col_04               IN VARCHAR2,
    v_Col_05               IN VARCHAR2,
    v_Col_06               IN VARCHAR2,
    v_Col_07               IN VARCHAR2,
    v_Col_08               IN VARCHAR2,
    v_Col_09               IN VARCHAR2,
    v_Col_10               IN VARCHAR2,
    v_Col_11               IN VARCHAR2,
    v_Col_12               IN VARCHAR2,
    v_Col_13               IN VARCHAR2,
    v_Col_14               IN VARCHAR2,
    v_Col_15               IN VARCHAR2,
    v_Col_16               IN VARCHAR2,
    v_Col_17               IN VARCHAR2,
    v_Col_18               IN VARCHAR2,
    v_Col_19               IN VARCHAR2,
    v_Col_20               IN VARCHAR2,
    v_Col_21               IN VARCHAR2,
    v_Col_22               IN VARCHAR2,
    v_Col_23               IN VARCHAR2,
    v_Col_24               IN VARCHAR2,
    v_Col_25               IN VARCHAR2,
    v_Col_26               IN VARCHAR2,
    v_Col_27               IN VARCHAR2,
    v_Col_28               IN VARCHAR2,
    v_Col_29               IN VARCHAR2,
    v_Col_30               IN VARCHAR2,
    v_Col_31               IN VARCHAR2,
    v_Col_32               IN VARCHAR2,
    v_Col_33               IN VARCHAR2,
    v_Col_34               IN VARCHAR2,
    v_Col_35               IN VARCHAR2,
    v_Col_36               IN VARCHAR2,
    v_Col_37               IN VARCHAR2,
    v_Col_38               IN VARCHAR2,
    v_Col_39               IN VARCHAR2,
    v_Col_40               IN VARCHAR2,
    v_Col_41               IN VARCHAR2,
    v_Col_42               IN VARCHAR2,
    v_Col_43               IN VARCHAR2,
    v_Col_44               IN VARCHAR2,
    v_Col_45               IN VARCHAR2,
    v_Col_46               IN VARCHAR2,
    v_Col_47               IN VARCHAR2,
    v_Col_48               IN VARCHAR2,
    v_Col_49               IN VARCHAR2,
    v_Col_50               IN VARCHAR2
  ) IS
      
  e_Error    EXCEPTION;
  
  BEGIN
    
    BEGIN
        
        INSERT INTO RTTEMPIWJ (Col_01, Col_02, Col_03, Col_04, Col_05, Col_06, Col_07, Col_08, Col_09, Col_10,
            Col_11, Col_12, Col_13, Col_14, Col_15, Col_16, Col_17, Col_18, Col_19, Col_20,
            Col_21, Col_22, Col_23, Col_24, Col_25, Col_26, Col_27, Col_28, Col_29, Col_30, 
            Col_31, Col_32)
            VALUES (
            v_Col_01, v_Col_02, v_Col_03, v_Col_04, v_Col_05, v_Col_06, v_Col_07, v_Col_08, v_Col_09, v_Col_10,
            v_Col_11, v_Col_12, v_Col_13, v_Col_14, v_Col_15, v_Col_16, v_Col_17, v_Col_18, v_Col_19, v_Col_20,
            v_Col_21, v_Col_22, v_Col_23, v_Col_24, v_Col_25, v_Col_26, v_Col_27, v_Col_28, v_Col_29, v_Col_30,
            v_Col_31, v_Col_32);
   
    END;
    
    COMMIT;
    
  END p_IHomeProvisionalTemp;
  
  /*****************************************************************************
  -- 홈쇼핑 가계약 삭제
  -- 2018.01.08 K.S.T. - 최초작성
  *****************************************************************************/
  PROCEDURE p_DHomeProvisionalTemp IS
  
  BEGIN
        
    DELETE FROM RTTEMPIWJ;
    
    COMMIT;
    
  END p_DHomeProvisionalTemp;  
  
  PROCEDURE p_Test IS
    
        V_SUCCESS_CODE NUMBER;
        V_RETURN_MESSAGE VARCHAR2(200);
        V_ERRORTEXT VARCHAR2(200);
        
        REF_CURSOR SYS_REFCURSOR;        

        CHK VARCHAR2(100);
        ORD_NO VARCHAR2(100);
        CUST_NO VARCHAR2(100);
        CUST_NM VARCHAR2(100);
        MOB_NO VARCHAR2(100);
        ORD_DAY VARCHAR2(100);
        OS_DAY_F VARCHAR2(100);
        OS_DAY_T VARCHAR2(100);
        PROC_DAY_F VARCHAR2(100);
        PROC_DAY_T VARCHAR2(100);
        CNT VARCHAR2(100);
        END_TP VARCHAR2(100);
        CNT_CD VARCHAR2(100);
      
        v_Add_Ord VARCHAR2(100);
    BEGIN
        
        p_sReRentalInfo(REF_CURSOR, '1000000112', '', V_SUCCESS_CODE, V_RETURN_MESSAGE, V_ERRORTEXT);
              
        LOOP
            FETCH REF_CURSOR INTO CHK, ORD_NO, CUST_NO, CUST_NM, MOB_NO, ORD_DAY, OS_DAY_F, OS_DAY_T, PROC_DAY_F, PROC_DAY_T, CNT, END_TP, CNT_CD;
            EXIT WHEN REF_CURSOR%NOTFOUND;
            v_Add_Ord := ORD_NO;
        END LOOP;
        
        CLOSE REF_CURSOR;
        
        DBMS_OUTPUT.PUT_LINE('v_Add_Ord:' || v_Add_Ord);
    
  END;
  
  /*****************************************************************************
  -- 계약만료고객 SMS발송
  -- 2018.07.10 K.S.T. - 최초작성
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------   
   1.1        2025-05-30  10244015         [20250530_01] 계약만료고객 마지막 청구일자 SMS 메시지 내용 추가
  *****************************************************************************/
  PROCEDURE p_SmsAgregate (
    V_SEND_YM           IN VARCHAR2,
    V_SUCCESS_CODE      OUT NUMBER,
    V_RETURN_MESSAGE    OUT VARCHAR2,
    V_ERRORTEXT         OUT VARCHAR2
  )  IS

    V_SMS_MSG RTSD0205.SND_MSG%TYPE := '';
    V_PRS_DCD VARCHAR2(1000);
    V_ZFB_DAY VARCHAR2(10);
    
    v_Cnt NUMBER;
    
    e_Error EXCEPTION;
    
  BEGIN
    
    --집계일 기준 계약만료 3개월전 대상 고객 리스트 집계
    --연체여부 및 중도완납 여부와 관계없이 대상 포함
    --매월 1일 10시에 발송
    --350건씩 30분 간격으로 발송
	--240924 개선 > 500건 15분 간격 메시지발송으로 수정
    INSERT INTO RTSD0301 (SEND_YM, SEND_DT, CUST_NM, MOB_NO, ORD_NO, MAT_NM, PROC_DAY, CNT_CD, PERIOD_CD, OS_DAY_F, OS_DAY_T, SERV_01, SERV_02, SERV_03, SERV_04, SERV_05, SERV_06, SERV_07, SERV_08, REG_ID, REG_DT)
    SELECT V_SEND_YM SEND_YM, TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD') || '10:00:00', 'yyyy/mm/dd hh24:mi:ss') + (15 * (FLOOR(ROWNUM / 500)) / (24 * 60)) AS SEND_DT, CUST_NM, MOB_NO, ORD_NO, MAT_NM, PROC_DAY, CNT_CD, PERIOD_CD, OS_DAY_F, OS_DAY_T, SERV_01, SERV_02, SERV_03, SERV_04, SERV_05, SERV_06, SERV_07, SERV_08, 'kstka', SYSDATE FROM (
        SELECT MAX(CUST_NM) CUST_NM, MAX(MOB_NO) MOB_NO, MAX(ORD_NO) ORD_NO, MAX(MAT_NM) MAT_NM, MAX(PROC_DAY) PROC_DAY, MAX(CNT_CD) CNT_CD, MAX(PERIOD_CD) PERIOD_CD, MAX(MONF) OS_DAY_F, MAX(MONT) OS_DAY_T, MAX(COL1) SERV_01, MAX(COL2) SERV_02, MAX(COL3) SERV_03, MAX(COL4) SERV_04, MAX(COL5) SERV_05, MAX(COL6) SERV_06, MAX(COL7) SERV_07, MAX(COL8) SERV_08 FROM (
            SELECT A.CUST_NM, A.MOB_NO, B.ORD_NO, E.MAT_NM, B.PROC_DAY, TO_CHAR(TO_NUMBER(B.CNT_CD)) CNT_CD, B.PERIOD_CD, TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)), -3), 'yyyy-mm-dd') MONF, TO_CHAR(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)) - 1, 'YYYY-MM-DD') MONT,
                   NVL(DECODE(D.PRS_DCD, 'B00001', SERV_CNTR, NULL), 0) - Pkg_Rtcs0009.f_sRtcs0009DlvrCnt(B.ORD_NO) COL1, NVL(DECODE(D.PRS_DCD, 'B00002', SERV_CNTR, NULL), 0) COL2, NVL(DECODE(D.PRS_DCD, 'B00003', SERV_CNTR, NULL), 0) COL3, NVL(DECODE(D.PRS_DCD, 'B00004', SERV_CNTR, NULL), 0) COL4, NVL(DECODE(D.PRS_DCD, 'B00005', SERV_CNTR, NULL), 0) COL5, NVL(DECODE(D.PRS_DCD, 'B00006', SERV_CNTR, NULL), 0) COL6, NVL(DECODE(D.PRS_DCD, 'B00007', SERV_CNTR, NULL), 0) - Pkg_Rtcs0010.f_sRtcs0010DlvrCnt(B.ORD_NO) COL7, NVL(DECODE(D.PRS_DCD, 'B00008', SERV_CNTR, NULL), 0) COL8 
            FROM RTSD0100 A, RTSD0108 B, RTSD0106 C, RTSD0013 D, RTSD0005 E
            WHERE A.CUST_NO = B.CUST_NO
                  AND B.ORD_NO = C.ORD_NO
                  AND C.ORD_NO = D.ORD_NO
                  AND C.MAT_CD = E.MAT_CD
                  AND B.STAT_CD = '04'
                  AND TO_CHAR(SYSDATE, 'YYYYMMDD') BETWEEN TO_CHAR(ADD_MONTHS(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)), -3), 'yyyymmdd') 
                  AND TO_CHAR(TO_DATE(ADD_MONTHS(TO_DATE(TO_DATE(SUBSTR(B.PROC_DAY, 0, 4) || '/' || SUBSTR(B.PROC_DAY, 5, 2) || '/' || SUBSTR(B.PROC_DAY, 7, 2) || '00:00:00', 'yyyy/mm/dd hh24:mi:ss')), B.PERIOD_CD)) -1, 'YYYYMMDD')
                  AND A.CUST_NM IS NOT NULL
                  AND B.MFP_YN = 'N'
        )
        GROUP BY CUST_NM, ORD_NO, MAT_NM, PROC_DAY, CNT_CD, PERIOD_CD, MONF, MONT
    ) F;
    
    
    --집계된 대상리스트 발송 내용 생성        
    FOR CUR IN (SELECT SEND_YM, SEND_DT, CUST_NM, MOB_NO, ORD_NO, MAT_NM, PROC_DAY, CNT_CD, PERIOD_CD, OS_DAY_F, OS_DAY_T, SERV_01, SERV_02, SERV_03, SERV_04, SERV_05, SERV_06, SERV_07, SERV_08 
                FROM RTSD0301 
                WHERE SEND_YM = V_SEND_YM) LOOP
    
        V_PRS_DCD := '';
        V_ZFB_DAY := '';
       
        SELECT TO_CHAR(TO_DATE(MAX(ZFB_DAY)), 'YYYY-MM-DD') INTO V_ZFB_DAY	--[20250530_01]마지막 청구일자 SMS 메시지 내용 추가
          FROM RTSD0109
         WHERE ORD_NO = CUR.ORD_NO;
        
        V_SMS_MSG := '[넥센타이어] 안녕하세요. ' || CUR.CUST_NM || ' 고객님 (계약번호: ' || CUR.ORD_NO || ', ' || CUR.MAT_NM || ', ' || CUR.CNT_CD || '본)' || CHR(13) || CHR(10);
        V_SMS_MSG := V_SMS_MSG || '고객님께서 이용하고 계시는 넥센타이어 렌탈계약의 종료일은 ' || CUR.OS_DAY_T || '입니다.(렌탈료 마지막 출금일 : ' || V_ZFB_DAY || ')' || CHR(13) || CHR(10);	--[20250530_01]마지막 청구일자 SMS 메시지 내용 추가	
        
        --20190306 서비스 없는 내역 확인
        IF CUR.SERV_01 > 0 OR CUR.SERV_02 > 0 OR CUR.SERV_04 > 0 OR CUR.SERV_05 > 0 OR CUR.SERV_06 > 0 OR CUR.SERV_07 > 0 OR CUR.SERV_08 > 0 THEN
            
            V_SMS_MSG := V_SMS_MSG || '현재 고객님의 잔여서비스는 ';
            
            IF CUR.SERV_01 > 0 THEN
               
               V_PRS_DCD := V_PRS_DCD || '엔진오일 서비스 ' || CUR.SERV_01 || '회 '; 
            END IF;
            
            IF CUR.SERV_02 > 0 THEN
            
               IF V_PRS_DCD IS NOT NULL THEN
                    V_PRS_DCD := V_PRS_DCD || ',';
               END IF;
               
               V_PRS_DCD := V_PRS_DCD || '위치교환 서비스 ' || CUR.SERV_02 || '회 '; 
            END IF;
            
            --방문점검 서비스 횟수는 제외
    --        IF CUR.SERV_03 > 0 THEN
    --        
    --           IF V_PRS_DCD IS NOT NULL THEN
    --                V_PRS_DCD := V_PRS_DCD || ',';
    --           END IF;
    --           
    --           V_PRS_DCD := V_PRS_DCD || '방문점검 서비스 ' || CUR.SERV_03 || '회 '; 
    --        END IF;
            
            IF CUR.SERV_04 > 0 THEN
            
               IF V_PRS_DCD IS NOT NULL THEN
                    V_PRS_DCD := V_PRS_DCD || ',';
               END IF;
               
               V_PRS_DCD := V_PRS_DCD || '윈터보관 서비스 ' || CUR.SERV_04 || '회 '; 
            END IF;
            
            IF CUR.SERV_05 > 0 THEN
            
               IF V_PRS_DCD IS NOT NULL THEN
                    V_PRS_DCD := V_PRS_DCD || ',';
               END IF;
               
               V_PRS_DCD := V_PRS_DCD || '윈터교체 서비스 ' || CUR.SERV_05 || '회 '; 
            END IF;
            
            IF CUR.SERV_07 > 0 THEN
            
               IF V_PRS_DCD IS NOT NULL THEN
                    V_PRS_DCD := V_PRS_DCD || ',';
               END IF;
               
               V_PRS_DCD := V_PRS_DCD || '타이어 무상 교체 서비스 ' || CUR.SERV_07 || '회 '; 
            END IF;
            
            IF CUR.SERV_08 > 0 THEN
            
               IF V_PRS_DCD IS NOT NULL THEN
                    V_PRS_DCD := V_PRS_DCD || ',';
               END IF;
               
               V_PRS_DCD := V_PRS_DCD || '얼라인먼트 서비스 ' || CUR.SERV_08 || '회 '; 
            END IF;
            
            V_SMS_MSG := V_SMS_MSG || V_PRS_DCD || '가 남아 있습니다.' || CHR(13) || CHR(10);
        
        END IF;
        
        V_SMS_MSG := V_SMS_MSG || '계약기간(' || CUR.OS_DAY_T || ')이 종료된 이후부터는 모든 서비스가 소멸됩니다.' || CHR(13) || CHR(10);    
        V_SMS_MSG := V_SMS_MSG || '렌탈계약기간이 종료된 이후에는 반납없이 지속 사용하실 수 있으며, 미납금이 없을 경우 렌탈료는 청구되지 않습니다.' || CHR(13) || CHR(10);    
        V_SMS_MSG := V_SMS_MSG || '오늘 하루도 안전운전 하시기 바랍니다.';--|| CHR(13) || CHR(10) || CHR(13) || CHR(10); 
        
--        V_SMS_MSG := V_SMS_MSG || '[서비스 신청 방법]' || CHR(13) || CHR(10);
--        V_SMS_MSG := V_SMS_MSG || '■타이어 무상교체서비스: 콜센터(1855-0100), 홈페이지(http://www.tirerental.co.kr), 런플랫, TPMS 장착 차량 추가 요금 부과됨.' || CHR(13) || CHR(10);
--        V_SMS_MSG := V_SMS_MSG || '■엔진오일 무상교체서비스: 콜센터(1855-0100), 홈페이지(http://www.tirerental.co.kr), 수입차는 부품만 제공, 공임은 별도 결제.' || CHR(13) || CHR(10);
--        V_SMS_MSG := V_SMS_MSG || '■위치교환서비스: 가까운 렌탈전문점(홈페이지에서 가능점포 확인)' || CHR(13) || CHR(10);
--        V_SMS_MSG := V_SMS_MSG || '■얼라인먼트서비스: 가까운 렌탈전문점(홈페이지에서 가능점포 확인)' || CHR(13) || CHR(10) || CHR(13) || CHR(10); 
        
        --dbms_output.put_line(V_SMS_MSG);
        
        --SMS발송(예약발송)
        --SMS 코드는 S040
        PKG_RTSD0205.p_Rtsd0205InterfaceNew('R', TO_CHAR(CUR.SEND_DT,'YYYYMMDDHH24MISS'), CUR.MOB_NO, '18550100', V_SMS_MSG, 'S040', CUR.ORD_NO, '2', 'RENTAL00000000000072', 'admin', V_SUCCESS_CODE, V_RETURN_MESSAGE, V_ERRORTEXT);
        
        V_SUCCESS_CODE := 0;
        V_RETURN_MESSAGE := '';
        V_ERRORTEXT := '';
        
    END LOOP;
    
    COMMIT;
     
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
        
  END p_SmsAgregate;
  
  /*****************************************************************************
  -- RUN SQL
  -- 2020.12.22 K.S.T.
  *****************************************************************************/
  PROCEDURE p_RunSql (
    V_SQL               IN VARCHAR2,
    V_SUCCESS_CODE      OUT NUMBER,
    V_RETURN_MESSAGE    OUT VARCHAR2,
    V_ERRORTEXT         OUT VARCHAR2
  )  IS
    
    e_Error EXCEPTION;
    
  BEGIN
    
    EXECUTE IMMEDIATE V_SQL;
    
    V_SUCCESS_CODE := 0;
    V_RETURN_MESSAGE := '';
    V_ERRORTEXT := '';
     
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
        
  END p_RunSql;
  
END Pkg_COMM;