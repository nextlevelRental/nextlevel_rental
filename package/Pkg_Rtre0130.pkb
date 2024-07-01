CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtre0130 AS
/*******************************************************************************
   NAME      Pkg_Rtre0130
   PURPOSE   벤더 관리

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2010-09-01  kstka             [20200901_01] 신규생성
*******************************************************************************/

  /*****************************************************************************
  -- 벤더 정보 Select
  *****************************************************************************/
  PROCEDURE p_sRtre0130 (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , ps_Lifnr           IN RTRE0130.LIFNR%TYPE                   /*벤더코드              */
    , ps_Vndr_Nm     IN RTRE0130.VNDR_NM%TYPE             /*벤더명                */
    , ps_Agency_Cd   IN RTRE0130.AGENCY_CD%TYPE           /*대리점코드           */
  ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A1.LIFNR
         ,  A1.VNDR_NM
         ,  A1.TEL_NO
         ,  A1.MOB_NO
         ,  A1.AGENCY_CD
         ,  A1.TAX_RQCD
         ,  A1.RNT_OFC
         ,  B1.CD_NM AS RNT_OFC_NM
         ,  A1.RNT_PNT
         ,  C1.CD_NM AS RNT_PNT_NM
         ,  A1.USE_YN
         ,  A1.PI_DSTRY_YN
         ,  A1.PI_DSTRY_ID
         ,  A1.PI_DSTRY_DT
         ,  A1.REG_ID
         ,  A1.REG_DT
         ,  A1.CHG_ID
         ,  A1.CHG_DT
      FROM  RTRE0130 A1
         ,  RTCM0051 B1
         ,  RTCM0051 C1
     WHERE  A1.LIFNR = DECODE(ps_Lifnr, NULL, A1.LIFNR, ps_Lifnr)
       AND  A1.VNDR_NM LIKE '%' || ps_Vndr_Nm  || '%'
       AND  A1.AGENCY_CD  = DECODE(ps_Agency_Cd, NULL, A1.AGENCY_CD , ps_Agency_Cd)
       AND  A1.RNT_OFC = B1.CD(+)
       AND  B1.CD_GRP_CD(+) = 'S301'
       AND  A1.RNT_PNT = C1.CD(+)
       AND  C1.CD_GRP_CD(+) = 'S302'
    ;

  END p_sRtre0130;
  
  /*****************************************************************************
  -- 벤더정보 존재여부 Select
  *****************************************************************************/
  FUNCTION f_SelectRtre0130 (
      ps_Lifnr             IN RTRE0130.LIFNR%TYPE               /*벤더코드            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  
  v_Cnt NUMBER;
  
  BEGIN
  
  SELECT COUNT(*)
  INTO v_Cnt
  FROM RTRE0130
  WHERE LIFNR = ps_Lifnr;
  
  RETURN v_Cnt;
  
  EXCEPTION
    WHEN OTHERS THEN
        rs_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_SelectRtre0130;
  
  /*****************************************************************************
  -- 출금스케쥴 정보 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtre0130 (
      ps_Lifnr             IN RTRE0130.LIFNR%TYPE               /*벤더코드            */
    , ps_Vndr_Nm       IN RTRE0130.VNDR_NM%TYPE         /*벤더명     */
    , ps_Tel_No          IN RTRE0130.TEL_NO%TYPE            /*전화번호            */
    , ps_Mob_No        IN RTRE0130.MOB_NO%TYPE          /*휴대폰번호            */
    , ps_Agency_Cd     IN RTRE0130.AGENCY_CD%TYPE       /*대리점코드            */
    , ps_Tax_Rqcd       IN RTRE0130.TAX_RQCD%TYPE        /*세금계산서발행방법            */
    , ps_Rnt_Ofc         IN RTRE0130.RNT_OFC%TYPE           /*등록자ID            */
    , ps_Rnt_Pnt         IN RTRE0130.RNT_PNT%TYPE           /*등록자ID            */
    , ps_Use_Yn          IN RTRE0130.USE_YN%TYPE             /*사용여부            */
    , ps_Pi_Dstry_Yn     IN RTRE0130.PI_DSTRY_YN%TYPE       /*등록자ID            */
    , ps_Pi_Dstry_Id     IN RTRE0130.PI_DSTRY_ID%TYPE        /*등록자ID            */
    , ps_Pi_Dstry_Dt     IN RTRE0130.PI_DSTRY_DT%TYPE        /*등록자ID            */
    , ps_Reg_Id          IN RTRE0130.REG_ID%TYPE            /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    INSERT INTO RTRE0130 (
            LIFNR
         ,  VNDR_NM
         ,  TEL_NO
         ,  MOB_NO
         ,  AGENCY_CD
         ,  TAX_RQCD
         ,  RNT_OFC
         ,  RNT_PNT
         ,  USE_YN
         ,  PI_DSTRY_YN
         ,  PI_DSTRY_ID
         ,  PI_DSTRY_DT
         ,  REG_ID
         ,  REG_DT
         ,  CHG_ID
         ,  CHG_DT            
    ) VALUES (
          ps_Lifnr            
        , ps_Vndr_Nm      
        , ps_Tel_No         
        , ps_Mob_No        
        , ps_Agency_Cd     
        , ps_Tax_Rqcd       
        , ps_Rnt_Ofc         
        , ps_Rnt_Pnt         
        , ps_Use_Yn          
        , ps_Pi_Dstry_Yn     
        , ps_Pi_Dstry_Id     
        , ps_Pi_Dstry_Dt    
        , ps_Reg_Id
        , SYSDATE
        , ps_Reg_Id
        , SYSDATE  
    );
    
    RETURN SQLCODE;

  EXCEPTION
    WHEN OTHERS THEN
        rs_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtre0130;
  
  
  /*****************************************************************************
  -- 벤더 정보 Update
  *****************************************************************************/
  FUNCTION f_UpdateRtre0130 (
      ps_Lifnr             IN RTRE0130.LIFNR%TYPE               /*벤더코드            */
    , ps_Vndr_Nm       IN RTRE0130.VNDR_NM%TYPE         /*벤더명     */
    , ps_Tel_No          IN RTRE0130.TEL_NO%TYPE            /*전화번호            */
    , ps_Mob_No        IN RTRE0130.MOB_NO%TYPE          /*휴대폰번호            */
    , ps_Agency_Cd     IN RTRE0130.AGENCY_CD%TYPE       /*대리점코드            */
    , ps_Tax_Rqcd       IN RTRE0130.TAX_RQCD%TYPE        /*세금계산서발행방법            */
    , ps_Rnt_Ofc         IN RTRE0130.RNT_OFC%TYPE           /*등록자ID            */
    , ps_Rnt_Pnt         IN RTRE0130.RNT_PNT%TYPE           /*등록자ID            */
    , ps_Use_Yn          IN RTRE0130.USE_YN%TYPE             /*사용여부            */
    , ps_Pi_Dstry_Yn     IN RTRE0130.PI_DSTRY_YN%TYPE       /*등록자ID            */
    , ps_Pi_Dstry_Id     IN RTRE0130.PI_DSTRY_ID%TYPE        /*등록자ID            */
    , ps_Pi_Dstry_Dt     IN RTRE0130.PI_DSTRY_DT%TYPE        /*등록자ID            */
    , ps_Reg_Id          IN RTRE0130.REG_ID%TYPE            /*등록자ID            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    UPDATE  RTRE0130
       SET  VNDR_NM = ps_Vndr_Nm
         ,  TEL_NO  = ps_Tel_No
         ,  MOB_NO =    ps_Mob_No
         ,  AGENCY_CD = ps_Agency_Cd
         ,  TAX_RQCD  = ps_Tax_Rqcd
         ,  RNT_OFC   = ps_Rnt_Ofc
         ,  RNT_PNT   = ps_Rnt_Pnt
         ,  PI_DSTRY_YN =   ps_Pi_Dstry_Yn
         ,  PI_DSTRY_ID  =  ps_Pi_Dstry_Id
         ,  PI_DSTRY_DT =   ps_Pi_Dstry_Dt
         ,  USE_YN  = ps_Use_Yn
         ,  CHG_ID  = ps_Reg_Id
         ,  CHG_DT  = SYSDATE
     WHERE  LIFNR = ps_Lifnr;

    RETURN SQLCODE;

  EXCEPTION
      WHEN OTHERS THEN
        rs_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtre0130;

  /*****************************************************************************
  -- 벤더 정보 Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtre0130 (
      ps_Lifnr             IN RTRE0130.LIFNR%TYPE       /*벤더코드            */
    , rs_ErrorText      OUT VARCHAR2
  ) RETURN NUMBER IS
  BEGIN

    DELETE  RTRE0130
     WHERE  LIFNR = ps_Lifnr;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        rs_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtre0130;
  
  
  /*****************************************************************************
  -- 벤더 정보 관리(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtre0130 (
      ps_Comm_Dvsn       IN CHAR                        /*처리구분(I,U,D)     */
    , ps_Lifnr             IN RTRE0130.LIFNR%TYPE               /*벤더코드            */
    , ps_Vndr_Nm       IN RTRE0130.VNDR_NM%TYPE         /*벤더명     */
    , ps_Tel_No          IN RTRE0130.TEL_NO%TYPE            /*전화번호            */
    , ps_Mob_No        IN RTRE0130.MOB_NO%TYPE          /*휴대폰번호            */
    , ps_Agency_Cd     IN RTRE0130.AGENCY_CD%TYPE       /*대리점코드            */
    , ps_Tax_Rqcd       IN RTRE0130.TAX_RQCD%TYPE        /*세금계산서발행방법            */
    , ps_Rnt_Ofc         IN RTRE0130.RNT_OFC%TYPE           /*등록자ID            */
    , ps_Rnt_Pnt         IN RTRE0130.RNT_PNT%TYPE           /*등록자ID            */
    , ps_Use_Yn          IN RTRE0130.USE_YN%TYPE             /*사용여부            */
    , ps_Pi_Dstry_Yn     IN RTRE0130.PI_DSTRY_YN%TYPE       /*등록자ID            */
    , ps_Pi_Dstry_Id     IN RTRE0130.PI_DSTRY_ID%TYPE        /*등록자ID            */
    , ps_Pi_Dstry_Dt     IN RTRE0130.PI_DSTRY_DT%TYPE        /*등록자ID            */
    , ps_Reg_Id          IN RTRE0130.REG_ID%TYPE            /*등록자ID            */
    , rn_Success_Code   OUT NUMBER
    , rs_Return_Message OUT VARCHAR2
    , rs_ErrorText      OUT VARCHAR2
  ) IS

    e_Error EXCEPTION;
    
  BEGIN
    
    IF (TRIM(ps_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(ps_Reg_Id)) THEN
        rs_Return_Message := '등록자 ID('||ps_Reg_Id||') : 필수 입력값 누락 또는 잘못된 값 입력으로 처리가 불가 합니다!';
        RAISE e_Error;
    END IF;
    

    IF ps_Comm_Dvsn = 'I' THEN

        IF 0 = f_SelectRtre0130 (ps_Lifnr, rs_ErrorText) THEN
        
            IF 0 != f_InsertRtre0130(
                  ps_Lifnr            
                , ps_Vndr_Nm      
                , ps_Tel_No         
                , ps_Mob_No        
                , ps_Agency_Cd     
                , ps_Tax_Rqcd       
                , ps_Rnt_Ofc         
                , ps_Rnt_Pnt         
                , ps_Use_Yn          
                , ps_Pi_Dstry_Yn     
                , ps_Pi_Dstry_Id     
                , ps_Pi_Dstry_Dt    
                , ps_Reg_Id
                , rs_ErrorText
            ) THEN
                rs_Return_Message := '벤더정보 등록 실패!!!'||'-'||rs_ErrorText;
                rs_ErrorText      := rs_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
        
            IF 0 != f_UpdateRtre0130(
                  ps_Lifnr            
                , ps_Vndr_Nm      
                , ps_Tel_No         
                , ps_Mob_No        
                , ps_Agency_Cd     
                , ps_Tax_Rqcd       
                , ps_Rnt_Ofc         
                , ps_Rnt_Pnt         
                , ps_Use_Yn          
                , ps_Pi_Dstry_Yn     
                , ps_Pi_Dstry_Id     
                , ps_Pi_Dstry_Dt    
                , ps_Reg_Id
                , rs_ErrorText
            ) THEN
                rs_Return_Message := '벤더정보 수정 실패!!!'||'-'||rs_ErrorText;
                rs_ErrorText      := rs_ErrorText;
                RAISE e_Error;
            END IF;
        
        END IF;

    ELSE

        IF ps_Comm_Dvsn = 'U' THEN

            IF 0 != f_UpdateRtre0130(
                  ps_Lifnr            
                , ps_Vndr_Nm      
                , ps_Tel_No         
                , ps_Mob_No        
                , ps_Agency_Cd     
                , ps_Tax_Rqcd       
                , ps_Rnt_Ofc         
                , ps_Rnt_Pnt         
                , ps_Use_Yn          
                , ps_Pi_Dstry_Yn     
                , ps_Pi_Dstry_Id     
                , ps_Pi_Dstry_Dt    
                , ps_Reg_Id
                , rs_ErrorText
            ) THEN
                rs_Return_Message := '벤더정보 수정 실패!!!'||'-'||rs_ErrorText;
                rs_ErrorText      := rs_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF ps_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtre0130(
                  ps_Lifnr
                , rs_ErrorText
            ) THEN
                rs_Return_Message := '벤더정보 삭제 실패!!!'||'-'||rs_ErrorText;
                rs_ErrorText      := rs_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            rs_Return_Message := '처리구분(I,U,D)값 오류!!!['||ps_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
        
    END IF;

    rn_Success_Code := 0;
    rs_Return_Message := '정상적으로 등록되었습니다';
    rs_ErrorText := '';

  EXCEPTION
    WHEN e_Error THEN
        ROLLBACK;
        rn_Success_Code   := -1;
        rs_Return_Message := rs_Return_Message;
        rs_ErrorText      := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(rs_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0130.p_IUDRtre0130(1)', rs_ErrorText, rs_Return_Message);

    WHEN OTHERS THEN
        ROLLBACK;
        rn_Success_Code   := -1;
        rs_Return_Message := NVL(TRIM(rs_Return_Message), '시스템관리자에게 문의바랍니다!.');
        rs_ErrorText      := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtre0130.p_IUDRtre0130(2)', rs_ErrorText, rs_Return_Message);

  END p_IUDRtre0130;
      
END Pkg_Rtre0130;
/
