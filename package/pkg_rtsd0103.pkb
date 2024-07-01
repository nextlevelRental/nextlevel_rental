CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0103 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0103
   PURPOSE   결합 고객 이력 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-07-08  jemcarry         1. Created this package body.
*******************************************************************************/

  /*****************************************************************************
  -- 결합 고객 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0103Count(
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,           /*고객결합번호        */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE           /*고객번호            */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0103
    WHERE   GRP_NO  = v_Grp_No
    AND     CUST_NO = v_Cust_No;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0103Count;

  /*****************************************************************************
  -- 결합 고객 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0103 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE          /*고객결합번호          */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.GRP_NO,                    /*고객결합번호        */
            A.CUST_NO,                   /*고객번호            */
            A.GRP_DAY,                   /*결합일자            */
            A.SPT_DAY,                   /*분리일자            */
            A.GRP_YN,                    /*결합여부            */
            A.REG_ID,                    /*등록자 ID           */
            A.REG_DT,                    /*등록일              */
            A.CHG_ID,                    /*변경자 ID           */
            A.CHG_DT,                    /*변경일              */
            (
            SELECT  DECODE(COUNT(GRP_NO),0 ,'Y','N' )
            FROM    RTSD0103 B
            WHERE   A.CUST_NO = B.CUST_NO
            AND     B.GRP_YN = 'Y'
            ) AS INSERT_FLAG            /*변경여부             */
    FROM    RTSD0103 A
    WHERE   (v_Grp_No IS NULL OR A.GRP_NO = v_Grp_No)
    ORDER   BY A.CUST_NO ASC;
    
  END p_sRtsd0103;

  /*****************************************************************************
  -- 결합 고객 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*고객결합번호          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0103 (
            GRP_NO,
            CUST_NO,
            GRP_DAY,
            SPT_DAY,
            GRP_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Grp_No,
            v_Cust_No,
            TO_CHAR(SYSDATE,'YYYYMMDD'),
            v_Spt_Day,
            v_Grp_Yn,
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

  END f_InsertRtsd0103;

  /*****************************************************************************
  -- 결합 고객 이력 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*고객결합번호          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0103
    SET    GRP_DAY = DECODE(v_Grp_Yn,'Y',TO_CHAR(SYSDATE,'YYYYMMDD'),v_Grp_Day),
           SPT_DAY = DECODE(v_Grp_Yn,'N',TO_CHAR(SYSDATE,'YYYYMMDD'),''),
           GRP_YN  = v_Grp_Yn,
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  GRP_NO  = v_Grp_No
    AND    CUST_NO = v_Cust_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0103;

  /*****************************************************************************
  -- 결합 고객 이력 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0103 (
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*고객결합번호          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0103
    SET    GRP_YN  = 'N',
           CHG_ID  = v_Reg_Id,
           CHG_DT  = SYSDATE
    WHERE  GRP_NO  = v_Grp_No
    AND    CUST_NO = v_Cust_No;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0103;

  /*****************************************************************************
  -- 결합 고객 이력 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0103 (
    v_Comm_Dvsn      IN CHAR,                         /*처리구분(I,U,D)       */
    v_Grp_No         IN RTSD0103.GRP_NO%TYPE,         /*고객결합번호          */
    v_Cust_No        IN RTSD0103.CUST_NO%TYPE,        /*고객번호              */
    v_Grp_Day        IN RTSD0103.GRP_DAY%TYPE,        /*결합일자              */
    v_Spt_Day        IN RTSD0103.SPT_DAY%TYPE,        /*분리일자              */
    v_Grp_Yn         IN RTSD0103.GRP_YN%TYPE,         /*결합여부              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Grp_No) IS NULL THEN
        v_Return_Message := '고객결합번호('||v_Grp_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Cust_No) IS NULL THEN
        v_Return_Message := '고객번호('||v_Cust_No||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF TRIM(v_Grp_Yn) IS NULL THEN
        v_Return_Message := '결합여부('||v_Grp_Yn||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF 0 = f_sRtsd0103Count(v_Grp_No, v_Cust_No) THEN

        IF 0 != f_InsertRtsd0103(v_Grp_No, v_Cust_No, v_Grp_Day, v_Spt_Day, v_Grp_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := '결합 고객 이력 등록 실패!!!'||'-'||v_ErrorText;
            v_ErrorText  := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtsd0103(v_Grp_No, v_Cust_No, v_Grp_Day, v_Spt_Day, v_Grp_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := '결합 고객 이력 수정 실패!!!'||'-'||v_ErrorText;
                v_ErrorText  := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtsd0103(v_Grp_No, v_Cust_No, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := '결합 고객 이력 삭제 실패!!!'||'-'||v_ErrorText;
                v_ErrorText  := v_ErrorText;
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
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0103.p_IUDRtsd0103(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        --Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0103.p_IUDRtsd0103(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0103;

  /*****************************************************************************
  -- 결합 고객 INSERT - 저장에 따른 고객 체크 RETURN  : 고객결합번호
  *****************************************************************************/
  FUNCTION p_sRtsd0103_SelectCustNo(
    v_Cust_No         IN RTSD0103.CUST_NO%TYPE          /*고객번호            */
    ) RETURN VARCHAR2 IS

    v_Grp_No   RTSD0103.GRP_NO%TYPE DEFAULT '';         /*고객결합번호        */
  BEGIN

    SELECT  GRP_NO
    INTO    v_Grp_No
    FROM    RTSD0103
    WHERE   CUST_NO = v_Cust_No
    AND     GRP_YN  = 'Y';

    RETURN v_Grp_No;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END p_sRtsd0103_SelectCustNo;


  /*****************************************************************************
  -- 결합 고객 할인 처리
  *****************************************************************************/
  PROCEDURE p_BatchRtsd0103Discount (
    v_Appl_Ym        IN VARCHAR2,                     /*적용년월              */
    v_Reg_Id         IN RTSD0103.REG_ID%TYPE,         /*등록자 ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    -- 고객결합등록 건 
    CURSOR  Cur_Rtsd0103 IS 
    SELECT  A.GRP_NO    GRP_NO
           ,B.GRP_YN    GRP_YN
           ,B.ORD_NO    ORD_NO
    FROM    RTSD0103 A
           ,RTSD0108 B
    WHERE   A.CUST_NO = B.CUST_NO
    AND     B.MFP_YN  = 'N'
    AND     B.OS_YN   = 'N'
    AND     B.GRP_YN  = 'N'        -- 결합연결 이후 접수되어 연계된 건 제외
    AND     A.GRP_YN  = 'Y'
    AND     A.GRP_DAY BETWEEN TO_CHAR(ADD_MONTHS(v_Appl_Ym||'01',-1),'YYYYMMDD')
                          AND TO_CHAR(LAST_DAY(v_Appl_Ym||'01'),'YYYYMMDD')
    AND A.GRP_NO IN
     (
        SELECT  GRP_NO
        FROM    RTSD0103
        WHERE   GRP_NO IN (
            SELECT A.GRP_NO
              FROM RTSD0103 A
             WHERE A.GRP_YN = 'Y'
               AND A.GRP_DAY BETWEEN TO_CHAR(ADD_MONTHS(v_Appl_Ym||'01',-1),'YYYYMMDD')
                                 AND TO_CHAR(LAST_DAY(v_Appl_Ym||'01'),'YYYYMMDD')
        )
        AND     GRP_YN = 'Y'
        GROUP BY GRP_NO
        HAVING COUNT(*) > 1
     );


    e_Error EXCEPTION;
    v_curr_cunt  NUMBER;

    v_Sale_Amt      RTSD0109.SALE_AMT%TYPE;
    v_Schd_Seq      RTSD0109.SCHD_SEQ%TYPE;
    v_Recp_Nu       RTSD0109.RECP_NU%TYPE;
    v_Dc_Rate       RTSD0009.DC_RATE%TYPE;
    v_Dc_Amt        RTSD0009.DC_AMT%TYPE;
    v_G_DcAmt       RTSD0112.G_DCAMT%TYPE;

    v_Sale_Amt0     RTSD0109.SALE_AMT%TYPE;    /* 변경전 렌탈료 보관 - 이력 저장용 */         
                  
    -- 렌탈료(VAT 포함), 렌탈료(VAT 제외), 렌탈료 (VAT 금액 계산)
    v_Sale_Amt2     RTSD0109.SALE_AMT%TYPE;
    v_Sale_Namt2    RTSD0112.SALE_NAMT%TYPE;
    v_Sale_Vamt2    RTSD0112.SALE_VAMT%TYPE;
    
    v_Seq           RTSD0106.SEQ%TYPE;
    

  BEGIN

    IF TRIM(v_Appl_Ym) IS NULL THEN
        v_Return_Message := '적용년월('||v_Appl_Ym||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '등록자 ID('||v_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;

    
    v_curr_cunt := 0;
    FOR CUR_0103 IN Cur_Rtsd0103 LOOP
        EXIT WHEN Cur_Rtsd0103%NOTFOUND;

        v_curr_cunt  := v_curr_cunt + 1;

        BEGIN
         -- 기존 렌탈료
         SELECT SALE_AMT
               ,SCHD_SEQ
               ,RECP_NU
           INTO v_Sale_Amt
               ,v_Schd_Seq
               ,v_Recp_Nu
           FROM RTSD0109
          WHERE ORD_NO  = CUR_0103.ORD_NO
            AND RECP_TP = '11'
            AND DEMD_DT LIKE v_Appl_Ym||'%';

        EXCEPTION
        WHEN OTHERS THEN
            v_Return_Message := '기존렌탈료 대상-'||CUR_0103.ORD_NO||' : 자료가 존재하지 않습니다!';
--            RAISE e_Error;
        END;

        -- 3) 렌탈료 할인액 계산 : 현재 렌탈료에 할인율(금액) 가져와서 계산
        BEGIN
         -- 할인액(OR 할인율)
         v_Dc_Rate := 0;
         v_Dc_Amt  := 0;
         SELECT DC_RATE
               ,DC_AMT
           INTO v_Dc_Rate
               ,v_Dc_Amt
           FROM RTSD0009
          WHERE DC_TP  = '0002'
            AND MAT_CD = 'Z'
            AND STR_DAY <= TO_CHAR(LAST_DAY(v_Appl_Ym||'01'),'YYYYMMDD')
            AND END_DAY >= TO_CHAR(LAST_DAY(v_Appl_Ym||'01'),'YYYYMMDD')
            AND USE_YN = 'Y';

        EXCEPTION
        WHEN OTHERS THEN
            v_Return_Message := '할인액(OR 할인율)-'||CUR_0103.ORD_NO||' : 자료가 존재하지 않습니다!';
--            RAISE e_Error;
        END;

        IF v_Dc_Rate IS NOT NULL AND v_Dc_Rate > 0 THEN
            v_G_DcAmt := v_Sale_Amt * (v_Dc_Rate / 100);
        ELSE
            v_G_DcAmt := v_Dc_Amt;     
        END IF;
              
        v_Sale_Amt0  := v_Sale_Amt;    /* 변경전 렌탈료 보관 - 이력 저장용 */         
                  
        -- 렌탈료(VAT 포함), 렌탈료(VAT 제외), 렌탈료 (VAT 금액 계산)
        v_Sale_Amt2  := TRUNC((v_Sale_Amt - v_G_DcAmt) + 9, -1);    -- 금액은 10미만 올림처리
        v_Sale_Namt2 := ROUND(v_Sale_Amt2 / 1.1, 0);
        v_Sale_Vamt2 := v_Sale_Amt2 - v_Sale_Namt2;

        -- 4) 차월 렌탈료 이체~최종까지 할인금액 적용 (스케줄 데이터 변경)
        IF 0 != Pkg_Rtsd0109.f_UpdateRtsd0109Discount
                                        ( CUR_0103.ORD_NO,  v_Schd_Seq,
                                          v_Sale_Amt2,      v_Sale_Namt2,  v_Sale_Vamt2,
                                          v_Reg_Id,         v_ErrorText
                                        ) THEN
            v_Return_Message := '스케줄 데이터 변경 실패!!!-'||CUR_0103.ORD_NO||'-'||v_Errortext;
            RAISE e_Error;
        END IF;

        -- 5) RTSD0106.MON_AMT UPDATE f_UpdateRtsd0106Discount
        IF 0 != Pkg_Rtsd0106.f_UpdateRtsd0106Discount
--                                        ( v_Ord_No,  v_Mon_Amt,      
                                        ( CUR_0103.ORD_NO,  v_Sale_Amt2,      
                                          v_Reg_Id,         v_ErrorText
                                        ) THEN
            v_Return_Message := 'RTSD0106.MON_AMT 변경 실패!!!-'||CUR_0103.ORD_NO||'-'||v_Errortext;
            RAISE e_Error;
        END IF;
           
        -- 6) RTSD0107 (RTSD0106 이력) INSERT
        v_Seq    := Pkg_Rtsd0106.f_sRtsd0106Seq(CUR_0103.ORD_NO) - 1;
        IF 0 != Pkg_Rtsd0107.f_InsertRtsd0107
                                        ( CUR_0103.ORD_NO,  v_Seq,      
                                          v_ErrorText
                                        ) THEN
            v_Return_Message := 'RTSD0107 (RTSD0106 이력) 생성 실패!!!-'||CUR_0103.ORD_NO||'-'||v_Errortext;
            RAISE e_Error;
        END IF;
  
        -- 7) RTSD0112 (결합금액 변경이력) INSERT
        v_Seq := Pkg_Rtsd0112.f_sRtsd0112Seq(CUR_0103.ORD_NO);
--        IF 0 != Pkg_Rtsd0112.f_InsertRtsd0112 ( v_Ord_No,  Seq,       Job_Day,  Grp_Yn,  
--                                                Grp_No,    Rent_Amt,  C_Dcamt,  G_Dcrate,
--                                                G_Dcamt,   L_Dcrate,  L_Dcamt,  F_Dcamt,  
--                                                Mon_Amt,   Grp_Yn2,   Grp_No2,  Rent_Amt2,   
--                                                C_Dcamt2,  G_Dcrate2, G_Dcamt2, L_Dcrate2,
--                                                L_Dcamt2,  F_Dcamt2,  Mon_Amt2, Sale_Namt, 
--                                                Sale_Vamt, Recp_Nu,   
        IF 0 != Pkg_Rtsd0112.f_InsertRtsd0112 ( CUR_0103.ORD_NO,  v_Seq,             TO_CHAR(SYSDATE, 'YYYYMMDD'),  NULL,  
                                                NULL,             0,                 0,                 0,
                                                0,                0,                 0,                 0,  
                                                v_Sale_Amt0,      CUR_0103.GRP_YN,   CUR_0103.GRP_NO,   0,   
                                                0,                v_Dc_Rate,         v_Dc_Amt,          0,
                                                0,                0,                 v_Sale_Amt2,       v_Sale_Namt2, 
                                                v_Sale_Vamt2,     v_Recp_Nu,   
                                                v_Reg_Id,         v_ErrorText
                                               ) THEN
            v_Return_Message := 'RTSD0112 (결합금액 변경이력) 생성 실패!!!-'||CUR_0103.ORD_NO||'-'||v_Errortext;
            RAISE e_Error;
        END IF;
  
        -- 8) RTSD0108 (장착정보 결합고객) UPDATE
        IF 0 != Pkg_Rtsd0108.f_UpdateRtsd0108Discount
--                                        ( v_Org_No,         v_Grp_Yn,   v_Grp_No,      
                                        ( CUR_0103.ORD_NO,  'Y',        CUR_0103.GRP_NO,      
                                          v_Reg_Id,         v_ErrorText
                                        ) THEN
            v_Return_Message := 'RTSD0108 (장착정보 결합고객) 변경 실패!!!-'||CUR_0103.ORD_NO||'-'||v_Errortext;
            RAISE e_Error;
        END IF;
           
          
    END LOOP;    
    
    
    IF Cur_Rtsd0103%ISOPEN THEN
        CLOSE Cur_Rtsd0103;
    END IF;    


    IF v_curr_cunt > 0 THEN
        v_Success_code := 0;
        v_Return_Message := '정상적으로 처리되었습니다';
        v_ErrorText := '';
        --COMMIT;
    ELSE
        v_Return_Message := '적용년월('||v_Appl_Ym||') : 처리건이 존재하지 않습니다!';
        RAISE e_Error;
    END IF;



    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0103.p_BatchRtsd0103Discount(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '시스템관리자에게 문의바랍니다!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0103.p_BatchRtsd0103Discount(2)', v_ErrorText, v_Return_Message);

  END p_BatchRtsd0103Discount;

  
END Pkg_Rtsd0103;
/