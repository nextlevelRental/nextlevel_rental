CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0001 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0001
   PURPOSE   Â÷Á¾ ¸¶½ºÅÍ °ü¸®

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-06-26  jemcarry         1. Created this package body.
   1.1        2017-11-06  wjim             [20171106_01] Á¤·Ä±âÁØ º¯°æ
                                           - Â÷Á¾
*******************************************************************************/

  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Count
  *****************************************************************************/
  FUNCTION f_sRtsd0001Count(
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,         /*Â÷Á¾                */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE       /*»ç¾ç                */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTSD0001
    WHERE   MODEL_CD    = v_Model_Cd
    AND     CONTENTS_CD = v_Contents_Cd;
    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtsd0001Count;

  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0001 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*Ä«¸ÞÀÌÄ¿              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*Â÷Á¾                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*»ç¾ç                  */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*»ç¿ë¿©ºÎ              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE          /*µî·ÏÀÚ ID             */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAKER_CD,                  /*Ä«¸ÞÀÌÄ¿            */
            A.MODEL_CD,                  /*Â÷Á¾                */
            A.CONTENTS_CD,               /*»ç¾ç                */
            A.USE_YN,                    /*»ç¿ë¿©ºÎ            */
            A.REG_ID,                    /*µî·ÏÀÚ ID           */
            A.REG_DT,                    /*µî·ÏÀÏ              */
            A.CHG_ID,                    /*º¯°æÀÚ ID           */
            A.CHG_DT                     /*º¯°æÀÏ              */
    FROM    RTSD0001 A
    WHERE   (v_Maker_Cd     IS NULL OR A.MAKER_CD    = v_Maker_Cd)
    AND     (v_Model_Cd     IS NULL OR A.MODEL_CD    = v_Model_Cd)
    AND     (v_Contents_Cd  IS NULL OR A.CONTENTS_CD = v_Contents_Cd)
    AND     (v_Use_Yn       IS NULL OR A.USE_YN      = v_Use_Yn)
    AND     (v_Reg_Id       IS NULL OR A.REG_ID      = v_Reg_Id);

  END p_sRtsd0001;

  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*Â÷Á¾                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*»ç¾ç                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*Ä«¸ÞÀÌÄ¿              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*»ç¿ë¿©ºÎ              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*µî·ÏÀÚ ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTSD0001 (
            MODEL_CD,
            CONTENTS_CD,
            MAKER_CD,
            USE_YN,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT
            )
    VALUES  (
            v_Model_Cd,
            v_Contents_Cd,
            v_Maker_Cd,
            v_Use_Yn,
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

  END f_InsertRtsd0001;

  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*Â÷Á¾                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*»ç¾ç                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*Ä«¸ÞÀÌÄ¿              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*»ç¿ë¿©ºÎ              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*µî·ÏÀÚ ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0001
    SET    MAKER_CD    = v_Maker_Cd,
           USE_YN      = v_Use_Yn,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  MODEL_CD    = v_Model_Cd
    AND    CONTENTS_CD = v_Contents_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0001;

  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Delete
  *****************************************************************************/
  FUNCTION f_DeleteRtsd0001 (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*Â÷Á¾                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*»ç¾ç                  */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*µî·ÏÀÚ ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN
    UPDATE RTSD0001
    SET    USE_YN      = 'N',
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  MODEL_CD    = v_Model_Cd
    AND    CONTENTS_CD = v_Contents_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtsd0001;

  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ °ü¸®(IUD)
  *****************************************************************************/
  PROCEDURE p_IUDRtsd0001 (
    v_Comm_Dvsn      IN CHAR,                         /*Ã³¸®±¸ºÐ(I,U,D)       */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*Â÷Á¾                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*»ç¾ç                  */
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,       /*Ä«¸ÞÀÌÄ¿              */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*»ç¿ë¿©ºÎ              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*µî·ÏÀÚ ID             */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN


    -- ÇÊ¼ö°ª: Â÷Á¾, »ç¾ç,Ä«¸ÞÀÌÄ¿,  »ç¿ë¿©ºÎ ,µî·ÏÀÚ ID
    IF TRIM(v_Model_Cd) IS NULL THEN
        v_Return_Message := 'Â÷Á¾('||v_Model_Cd||') : ÇÊ¼ö ÀÔ·Â°ª ´©¶ôÀ¸·Î Ã³¸®°¡ ºÒ°¡ ÇÕ´Ï´Ù!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Contents_Cd) IS NULL THEN
        v_Return_Message := '»ç¾ç('||v_Contents_Cd||') : ÇÊ¼ö ÀÔ·Â°ª ´©¶ôÀ¸·Î Ã³¸®°¡ ºÒ°¡ ÇÕ´Ï´Ù!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Maker_Cd) IS NULL THEN
        v_Return_Message := 'Ä«¸ÞÀÌÄ¿('||v_Maker_Cd||') : ÇÊ¼ö ÀÔ·Â°ª ´©¶ôÀ¸·Î Ã³¸®°¡ ºÒ°¡ ÇÕ´Ï´Ù!';
        RAISE e_Error;
    END IF;

    IF TRIM(v_Use_Yn) IS NULL THEN
        v_Return_Message := '»ç¿ë¿©ºÎ('||v_Use_Yn||') : ÇÊ¼ö ÀÔ·Â°ª ´©¶ôÀ¸·Î Ã³¸®°¡ ºÒ°¡ ÇÕ´Ï´Ù!';
        RAISE e_Error;
    END IF;

    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := 'µî·ÏÀÚ ID('||v_Reg_Id||') : ÇÊ¼ö ÀÔ·Â°ª ´©¶ô ¶Ç´Â Àß¸øµÈ °ª ÀÔ·ÂÀ¸·Î Ã³¸®°¡ ºÒ°¡ ÇÕ´Ï´Ù!';
        RAISE e_Error;
    END IF;


    IF 0 = f_sRtsd0001Count(v_Model_Cd, v_Contents_Cd) THEN

        IF 0 != f_InsertRtsd0001(v_Model_Cd, v_Contents_Cd, v_Maker_Cd, v_Use_Yn,
                                 v_Reg_Id, v_ErrorText) THEN
            v_Return_Message := 'Â÷Á¾ ¸¶½ºÅÍ µî·Ï ½ÇÆÐ!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;

    ELSE

        IF v_Comm_Dvsn IN ('I', 'U') THEN

            IF 0 != f_UpdateRtsd0001(v_Model_Cd, v_Contents_Cd, v_Maker_Cd, v_Use_Yn,
                                     v_Reg_Id, v_ErrorText) THEN
                v_Return_Message := 'Â÷Á¾ ¸¶½ºÅÍ ¼öÁ¤ ½ÇÆÐ!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSIF v_Comm_Dvsn = 'D' THEN

            IF 0 != f_DeleteRtsd0001(v_Model_Cd, v_Contents_Cd, v_Reg_Id, v_ErrorText) THEN
               v_Return_Message := 'Â÷Á¾ ¸¶½ºÅÍ »èÁ¦ ½ÇÆÐ!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
               RAISE e_Error;
           END IF;

        ELSE
            v_Return_Message := 'Ã³¸®±¸ºÐ(I,U,D)°ª ¿À·ù!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;

    END IF;

    v_Success_code := 0;
    v_Return_Message := 'Á¤»óÀûÀ¸·Î µî·ÏµÇ¾ú½À´Ï´Ù';
    v_ErrorText := '';
    --COMMIT;

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0001.p_IUDRtsd0001(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '½Ã½ºÅÛ°ü¸®ÀÚ¿¡°Ô ¹®ÀÇ¹Ù¶ø´Ï´Ù!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtsd0001.p_IUDRtsd0001(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtsd0001;


  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Select - Ä«¸ÞÀÌÄ¿·Î ¸ðµ¨¸í Á¶È¸(Â÷Á¾°ú »ç¾ç)- »óÇ° ¸¶½ºÅÍ Á¶È¸ ÆË¾÷
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelName(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE        /*Ä«¸ÞÀÌÄ¿              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  ROWNUM RN,
            A.MAKER_CD,                  /*Ä«¸ÞÀÌÄ¿            */
            A.MODEL_CD,                  /*Â÷Á¾                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)  MODEL_NM,      /*Â÷Á¾¸í                */
            A.CONTENTS_CD,               /*»ç¾ç                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD) CONTENTS_NM, /*»ç¾ç¸í                */
            B.FR_CD,                     /*ÀüÈÄ ±¸ºÐ           */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)
                || ' ' ||
                Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD)
                || ' ' ||
                DECODE(B.FR_CD,'Z',NULL,'F','¾Õ','R','µÚ') MC_NM                /*¸ðµ¨¸í                */
    FROM    RTSD0001 A,
            RTSD0002 B
    WHERE   A.MODEL_CD    = B.MODEL_CD
    AND     A.CONTENTS_CD = B.CONTENTS_CD
    AND     A.MAKER_CD    = v_Maker_Cd
    AND     A.USE_YN      = 'Y'
    AND     B.USE_YN      = 'Y'
    ORDER   BY MODEL_NM, CONTENTS_NM, MC_NM DESC;

  END p_sRtsd0001ModelName;

  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Select - Â÷Á¾ Á¶È¸
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*Ä«¸ÞÀÌÄ¿              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE         /*Â÷Á¾                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.MODEL_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD) AS MODEL_NM
    FROM    RTSD0001 A
    WHERE   (v_Maker_Cd IS NULL OR A.MAKER_CD = v_Maker_Cd)
    AND     (v_Model_Cd IS NULL OR A.MODEL_CD = v_Model_Cd)
    ORDER   BY MODEL_NM ASC;

  END p_sRtsd0001ModelSelect;


    /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Select - Â÷Á¾ Á¶È¸
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ContentsSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*Ä«¸ÞÀÌÄ¿              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE         /*Â÷Á¾                  */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  DISTINCT
            A.CONTENTS_CD,
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD) AS CONTENTS_NM
    FROM    RTSD0001 A
    WHERE   (v_Maker_Cd IS NULL OR A.MAKER_CD = v_Maker_Cd)
    AND     (v_Model_Cd IS NULL OR A.MODEL_CD = v_Model_Cd)
    ORDER   BY CONTENTS_NM ASC;

  END p_sRtsd0001ContentsSelect;
  
  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Select - Â÷Á¾ Á¶È¸
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-11-06  wjim             [20171106_01] Á¤·Ä±âÁØ º¯°æ
                                           - ¿µ¾î > ÇÑ±Û > ¼ýÀÚ ¼ø ¿À¸§Â÷¼ø Á¤·Ä
  *****************************************************************************/
  PROCEDURE p_sRtsd0001ModelByClassSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*Ä«¸ÞÀÌÄ¿              */
    v_Class_Cd       IN RTSD0004.CLASS_CD%TYPE         /*Â÷·®ºÐ·ù              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  *
      FROM  (
                SELECT  DISTINCT A.MODEL_CD,
                                Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD) MODEL_NM,
                                
                                A.CLASS_CD,
                                B.MAKER_CD,
                                Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',B.MAKER_CD) MAKER_NM
                        FROM    RTSD0004 A,
                                RTSD0001 B
                        WHERE   B.MAKER_CD      = v_Maker_cd      /*Â÷Á¾(S001)          */
                        AND     A.CLASS_CD      = v_Class_Cd
                        AND     A.USE_YN        = 'Y'
                        AND     A.MODEL_CD      = B.MODEL_CD      /*Â÷Á¾(S001)          */
                        AND     A.CONTENTS_CD   = B.CONTENTS_CD   /*»ç¾ç(S002,S003)     */
                        AND     B.USE_YN        = 'Y'
            )
     ORDER  BY CASE
                WHEN SUBSTR(MODEL_NM, 1, 1) BETWEEN '0' AND '9' THEN 3 
                WHEN MODEL_NM BETWEEN '°¡' AND 'ÆR' THEN 2            
                ELSE 1
            END 
         ,  UPPER(MODEL_NM) -- [20171106_01]
    ;

  END p_sRtsd0001ModelByClassSelect;

  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Select - Â÷Á¾Á¤º¸°ü¸®  Á¶È¸
  *****************************************************************************/
  PROCEDURE p_sRtsd0001CarMasterSelect(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Maker_Cd       IN RTSD0001.MAKER_CD%TYPE,        /*Ä«¸ÞÀÌÄ¿              */
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,        /*Â÷Á¾                   */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,     /*Â÷Á¾                   */
    v_Use_Yn         IN RTSD0002.USE_YN%TYPE           /*»ç¿ë¿©ºÎ              */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.MAKER_CD,                                                             /*Ä«¸ÞÀÌÄ¿            */
            A.MODEL_CD,                                                             /*Â÷Á¾                */
            A.CONTENTS_CD,                                                          /*»ç¾ç                */
            B.FR_CD,                                                                /*ÀüÈÄ±¸ºÐ            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S001',A.MAKER_CD)     AS MAKER_NM,    /*Ä«¸ÞÀÌÄ¿            */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S002',A.MODEL_CD)     AS MODEL_NM,    /*Â÷Á¾                */
            Pkg_Rtcm0051.f_sRtcm0051CodeName('S003',A.CONTENTS_CD)  AS CONTENTS_NM, /*»ç¾ç                */
            DECODE(B.FR_CD,'Z',NULL,'F','¾Õ','R','µÚ')              AS FR_NM,       /*ÀüÈÄ±¸ºÐ            */
            B.MC_NM,                                                                /*Â÷Á¾-»ç¾ç¸í         */
            B.USE_YN                                                                /*»ç¿ë¿©ºÎ            */
    FROM    RTSD0001 A,
            RTSD0002 B
    WHERE   A.MODEL_CD     = B.MODEL_CD
    AND     A.CONTENTS_CD  = B.CONTENTS_CD
    AND     (v_Maker_Cd    IS NULL OR A.MAKER_CD    =  v_Maker_Cd)
    AND     (v_Model_Cd    IS NULL OR A.MODEL_CD    =  v_Model_Cd)
    AND     (v_Contents_Cd IS NULL OR A.CONTENTS_CD =  v_Contents_Cd)
    AND     (v_Use_Yn      IS NULL OR B.USE_YN      =  v_Use_Yn)
    ORDER   BY MAKER_CD, MODEL_CD, CONTENTS_CD, FR_CD;

  END p_sRtsd0001CarMasterSelect;


  /*****************************************************************************
  -- Â÷Á¾ ¸¶½ºÅÍ Update
  *****************************************************************************/
  FUNCTION f_UpdateRtsd0001UseYn (
    v_Model_Cd       IN RTSD0001.MODEL_CD%TYPE,       /*Â÷Á¾                  */
    v_Contents_Cd    IN RTSD0001.CONTENTS_CD%TYPE,    /*»ç¾ç                  */
    v_Use_Yn         IN RTSD0001.USE_YN%TYPE,         /*»ç¿ë¿©ºÎ              */
    v_Reg_Id         IN RTSD0001.REG_ID%TYPE,         /*µî·ÏÀÚ ID             */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTSD0001
    SET    USE_YN      = v_Use_Yn,
           CHG_ID      = v_Reg_Id,
           CHG_DT      = SYSDATE
    WHERE  MODEL_CD    = v_Model_Cd
    AND    CONTENTS_CD = v_Contents_Cd;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtsd0001UseYn;

END Pkg_Rtsd0001;
/
