CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtcs0002 AS
/*******************************************************************************
   NAME      Pkg_Rtcs0002
   PURPOSE   ī����Ÿ ������ ����

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2015-08-12  jemcarry         1. Created this package body.
   1.1        2017-03-28  wjim             [20170328_01] �ε�� ã�� �˾� ��ȸ���� ����
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
   1.3        2017-06-22  wjim             [20170622_01] ������� �ε�� ��ȸ��� �߰�
   1.4        2017-06-22  wjim             [20170622_02] �ε�� �˾� ��ȸ���� �߰�
                                           - �ٹ�����
*******************************************************************************/

  /*****************************************************************************
  -- ī����Ÿ ������ Count
  *****************************************************************************/
  FUNCTION f_sRtcs0002Count(
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE      /*ī����Ÿ ���       */
    ) RETURN NUMBER IS
    v_curr_cunt   NUMBER DEFAULT 0;
  BEGIN

    SELECT  COUNT(*)
    INTO    v_curr_cunt
    FROM    RTCS0002
    WHERE   CARMASTER_NU = v_Carmaster_Nu;

    RETURN v_curr_cunt;

    EXCEPTION
      WHEN OTHERS THEN
        RETURN 0;

  END f_sRtcs0002Count;

  /*****************************************************************************
  -- ī����Ÿ ������ Select
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  PROCEDURE p_sRtcs0002 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE    /*ī����Ÿ ���         */
    ) IS

  BEGIN

    OPEN Ref_Cursor FOR
    SELECT  A.CARMASTER_NU,              /*ī����Ÿ ���       */
            A.CARMASTER_NM,              /*ī����Ÿ ��         */
            A.SALES_GROUP,               /*�����ڵ�            */
            A.SALES_OFFICE,              /*�����ڵ�            */
            A.AGENCY_CD,                 /*�븮���ڵ�          */
            A.MOB_NO,                    /*�ڵ�����ȣ          */
            A.TEL_NO,                    /*��ȭ��ȣ            */
            A.POS_CD,                    /*�����ȣ            */
            A.CITY,                      /*�ּ�                */
            A.STREET,                    /*���ּ�            */
            A.STR_DAY,                   /*�Ի���              */
            A.END_DAY,                   /*�����              */
            A.USE_YN,                    /*�ٹ�����            */
            A.ETC1,                      /*��Ÿ1               */
            A.ETC2,                      /*��Ÿ2               */
            A.REG_ID,                    /*�����ID            */
            A.REG_DT,                    /*�����              */
            A.CHG_ID,                    /*������ID            */
            A.CHG_DT,                    /*������              */
            A.ORD_AGENT                  /*�Ǹ��ι�ȣ          */           
    FROM    RTCS0002 A
    WHERE   A.CARMASTER_NU = v_Carmaster_Nu;

  END p_sRtcs0002;

  /*****************************************************************************
  -- ī����Ÿ ������ Insert
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  FUNCTION f_InsertRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*ī����Ÿ ���         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTCS0002.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*���ּ�              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*�Ի���                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*�����                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*�ٹ�����              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*��Ÿ1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*��Ÿ2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*�����ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    INSERT  INTO RTCS0002 (
            CARMASTER_NU,
            CARMASTER_NM,
            SALES_GROUP,
            SALES_OFFICE,
            AGENCY_CD,
            MOB_NO,
            TEL_NO,
            POS_CD,
            CITY,
            STREET,
            STR_DAY,
            END_DAY,
            USE_YN,
            ETC1,
            ETC2,
            REG_ID,
            REG_DT,
            CHG_ID,
            CHG_DT,
            ORD_AGENT,
            RENTAL_GROUP,
            RENTAL_OFFICE
            )
    VALUES  (
--            v_Carmaster_Nu,
            -- ����� �ڵ����� MAX �� + 1 �������� ����.
            (SELECT DECODE(MAX(CARMASTER_NU),NULL,1,MAX(TO_NUMBER(CARMASTER_NU)) +1) AS MAXNU FROM RTCS0002),
            v_Carmaster_Nm,
            v_Sales_Group,
            v_Sales_Office,
            v_Agency_Cd,
            v_Mob_No,
            v_Tel_No,
            v_Pos_Cd,
            v_City,
            v_Street,
            v_Str_Day,
            v_End_Day,
            v_Use_Yn,
            v_Etc1,
            v_Etc2,
            v_Reg_Id,
            SYSDATE,
            v_Reg_Id,
            SYSDATE,
            v_Ord_Agent,
            v_Rental_Group,
            v_Rental_Office
            );
    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_InsertRtcs0002;

  /*****************************************************************************
  -- ī����Ÿ ������ Update
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  FUNCTION f_UpdateRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*ī����Ÿ ���         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTCS0002.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*���ּ�              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*�Ի���                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*�����                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*�ٹ�����              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*��Ÿ1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*��Ÿ2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*�����ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0002
    SET    CARMASTER_NM = v_Carmaster_Nm,
           SALES_GROUP  = v_Sales_Group,
           SALES_OFFICE = v_Sales_Office,
           AGENCY_CD    = v_Agency_Cd,
           MOB_NO       = v_Mob_No,
           TEL_NO       = v_Tel_No,
           POS_CD       = v_Pos_Cd,
           CITY         = v_City,
           STREET       = v_Street,
           STR_DAY      = v_Str_Day,
           END_DAY      = v_End_Day,
           USE_YN       = v_Use_Yn,
           ETC1         = v_Etc1,
           ETC2         = v_Etc2,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE,
           ORD_AGENT    = v_Ord_Agent,
           RENTAL_GROUP = v_Rental_Group,
           RENTAL_OFFICE = v_Rental_Office
    WHERE  CARMASTER_NU = v_Carmaster_Nu;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_UpdateRtcs0002;

  /*****************************************************************************
  -- ī����Ÿ ������ Delete
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  FUNCTION f_DeleteRtcs0002 (
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*ī����Ÿ ���         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTCS0002.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*���ּ�              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*�Ի���                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*�����                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*�ٹ�����              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*��Ÿ1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*��Ÿ2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*�����ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */    
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER IS
  BEGIN

    UPDATE RTCS0002
    SET    CARMASTER_NU = v_Carmaster_Nu,
           CARMASTER_NM = v_Carmaster_Nm,
           SALES_GROUP  = v_Sales_Group,
           SALES_OFFICE = v_Sales_Office,
           AGENCY_CD    = v_Agency_Cd,
           MOB_NO       = v_Mob_No,
           TEL_NO       = v_Tel_No,
           POS_CD       = v_Pos_Cd,
           CITY         = v_City,
           STREET       = v_Street,
           STR_DAY      = v_Str_Day,
           END_DAY      = v_End_Day,
           USE_YN       = v_Use_Yn,
           ETC1         = v_Etc1,
           ETC2         = v_Etc2,
           CHG_ID       = v_Reg_Id,
           CHG_DT       = SYSDATE,
           ORD_AGENT    = v_Ord_Agent, 
           RENTAL_GROUP = v_Rental_Group,
           RENTAL_OFFICE = v_Rental_Office
    WHERE  CARMASTER_NU = v_Carmaster_Nu;

    RETURN SQLCODE;

    EXCEPTION
      WHEN OTHERS THEN
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        RETURN SQLCODE;

  END f_DeleteRtcs0002;

  /*****************************************************************************
  -- ī����Ÿ ������ ����(IUD)
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�
  *****************************************************************************/
  PROCEDURE p_IUDRtcs0002 (
    v_Comm_Dvsn      IN CHAR,                         /*ó������(I,U,D)       */
    v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE,   /*ī����Ÿ ���         */
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Sales_Group    IN RTCS0002.SALES_GROUP%TYPE,    /*�����ڵ�              */
    v_Sales_Office   IN RTCS0002.SALES_OFFICE%TYPE,   /*�����ڵ�              */
    v_Agency_Cd      IN RTCS0002.AGENCY_CD%TYPE,      /*�븮���ڵ�            */
    v_Mob_No         IN RTCS0002.MOB_NO%TYPE,         /*�ڵ�����ȣ            */
    v_Tel_No         IN RTCS0002.TEL_NO%TYPE,         /*��ȭ��ȣ              */
    v_Pos_Cd         IN RTCS0002.POS_CD%TYPE,         /*�����ȣ              */
    v_City           IN RTCS0002.CITY%TYPE,           /*�ּ�                  */
    v_Street         IN RTCS0002.STREET%TYPE,         /*���ּ�              */
    v_Str_Day        IN RTCS0002.STR_DAY%TYPE,        /*�Ի���                */
    v_End_Day        IN RTCS0002.END_DAY%TYPE,        /*�����                */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE,         /*�ٹ�����              */
    v_Etc1           IN RTCS0002.ETC1%TYPE,           /*��Ÿ1                 */
    v_Etc2           IN RTCS0002.ETC2%TYPE,           /*��Ÿ2                 */
    v_Reg_Id         IN RTCS0002.REG_ID%TYPE,         /*�����ID              */
    v_Ord_Agent      IN RTCS0002.ORD_AGENT%TYPE,      /*�Ǹ��ι�ȣ            */
    v_Rental_Group   IN RTCS0002.RENTAL_GROUP%TYPE,    /*��Ż���� �ڵ� */
    v_Rental_Office  IN RTCS0002.RENTAL_OFFICE%TYPE,    /*��Ż���� �ڵ� */
    v_Success_Code   OUT NUMBER,
    v_Return_Message OUT VARCHAR2,
    v_ErrorText      OUT VARCHAR2
    ) IS

    e_Error EXCEPTION;
  BEGIN

    -- �ʼ���: ����� ID
    IF (TRIM(v_Reg_Id) IS NULL) OR (0 = Pkg_Rtcm0001.f_sRtcm0001Count(v_Reg_Id)) THEN
        v_Return_Message := '����� ID('||v_Reg_Id||') : �ʼ� �Է°� ���� �Ǵ� �߸��� �� �Է����� ó���� �Ұ� �մϴ�!';
        RAISE e_Error;
    END IF;
    
    -- �Ǹ��ι�ȣ ����
    IF (0 = Pkg_Rtsd0113.f_sRtsd0113Count(v_Ord_Agent)) THEN
        v_Return_Message := '��ȿ���� ���� �Ǹ��ι�ȣ('||v_Ord_Agent||') �Դϴ�!';
        RAISE e_Error;
    END IF;

    IF 0 = f_sRtcs0002Count(v_Carmaster_Nu) THEN

        IF 0 != f_InsertRtcs0002(v_Carmaster_Nu, v_Carmaster_Nm, v_Sales_Group, v_Sales_Office, v_Agency_Cd,
                                 v_Mob_No,v_Tel_No, v_Pos_Cd,v_City, v_Street, v_Str_Day, v_End_Day, v_Use_Yn,
                                 v_Etc1, v_Etc2, v_Reg_Id, v_Ord_Agent, v_Rental_Group, v_Rental_Office, v_ErrorText 
                                ) THEN
            v_Return_Message := 'ī����Ÿ ��� ����!!!'||'-'||v_ErrorText;
            v_ErrorText := v_ErrorText;
            RAISE e_Error;
        END IF;
        
    ELSE
    
        IF v_Comm_Dvsn = 'U' THEN
        
            IF 0 != f_UpdateRtcs0002(v_Carmaster_Nu, v_Carmaster_Nm, v_Sales_Group, v_Sales_Office, v_Agency_Cd,
                                     v_Mob_No,v_Tel_No, v_Pos_Cd, v_City, v_Street, v_Str_Day, v_End_Day, v_Use_Yn,
                                     v_Etc1, v_Etc2, v_Reg_Id, v_Ord_Agent, v_Rental_Group, v_Rental_Office,v_ErrorText 
                                    ) THEN
                v_Return_Message := 'ī����Ÿ ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;


        ELSIF v_Comm_Dvsn = 'D' THEN
        
            IF 0 != f_DeleteRtcs0002(v_Carmaster_Nu, v_Carmaster_Nm, v_Sales_Group, v_Sales_Office, v_Agency_Cd,
                                     v_Mob_No, v_Tel_No, v_Pos_Cd, v_City, v_Street, v_Str_Day, v_End_Day, v_Use_Yn,
                                     v_Etc1, v_Etc2, v_Reg_Id, v_Ord_Agent,  v_Rental_Group, v_Rental_Office, v_ErrorText
                                     ) THEN
                v_Return_Message := 'ī����Ÿ ���� ����!!!'||'-'||v_ErrorText;
                v_ErrorText := v_ErrorText;
                RAISE e_Error;
            END IF;

        ELSE
            v_Return_Message := 'ó������(I,U,D)�� ����!!!['||v_Comm_Dvsn||']';
            RAISE e_Error;

        END IF;
    END IF;

    v_Success_code := 0;
    v_Return_Message := '���������� ��ϵǾ����ϴ�';
    v_ErrorText := '';

    EXCEPTION
      WHEN e_Error THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := v_Return_Message;
        v_ErrorText := SUBSTR(SQLERRM, 1, 200)||':'||TRIM(v_ErrorText);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0002.p_IUDRtcs0002(1)', v_ErrorText, v_Return_Message);

      WHEN OTHERS THEN
        ROLLBACK;
        v_Success_code := -1;
        v_Return_Message := NVL( TRIM(v_Return_Message), '�ý��۰����ڿ��� ���ǹٶ��ϴ�!.');
        v_ErrorText := SUBSTR(SQLERRM, 1, 200);
        Pkg_Utility.p_ErrorFileWrite('Pkg_Rtcs0002.p_IUDRtcs0002(2)', v_ErrorText, v_Return_Message);

  END p_IUDRtcs0002;

  
  /*****************************************************************************
  -- ī����Ÿ �˾�
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.1        2017-03-28  wjim             [20170328_01] �ε�� ã�� �˾� ��ȸ���� ����
                                           - �������� �ε�ȸ� ��ȸ
   1.2        2017-05-19  wjim             [20170519_01] �Ǹ��ι�ȣ �߰�     
   1.4        2017-06-22  wjim             [20170622_02] '�ٹ�����' ��ȸ���� �߰�                                  
  *****************************************************************************/
  PROCEDURE p_sRtcs0002carmasterPopup(
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Carmaster_Nm   IN RTCS0002.CARMASTER_NM%TYPE,   /*ī����Ÿ ��           */
    v_Use_Yn         IN RTCS0002.USE_YN%TYPE          /*�ٹ�����              */
    ) IS
  
  BEGIN
  
      OPEN Ref_Cursor FOR
      SELECT  A.CARMASTER_NU,      /*ī����Ÿ ���         */
              A.CARMASTER_NM,      /*ī����Ÿ ��           */
              A.SALES_GROUP,       /*�����ڵ�              */
              Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', SALES_GROUP) SALES_GROUP_NM,     /*�����         */
              A.SALES_OFFICE,      /*�����ڵ�              */
              Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SALES_OFFICE_NM, /*������         */
              A.AGENCY_CD,         /*�븮���ڵ�            */
              Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD) AGENCY_NM,                  /*�븮����       */
              A.MOB_NO,            /*�ڵ�����ȣ            */
              A.TEL_NO,            /*��ȭ��ȣ              */
              A.STR_DAY,           /*�Ի���                */
              A.END_DAY,           /*�����                */
              A.USE_YN,            /*�ٹ�����              */
              A.POS_CD,            /*�����ȣ              */
              A.CITY,              /*�ּ�                  */
              A.STREET,            /*���ּ�              */
              A.ETC1,              /*��Ÿ1                 */
              A.ETC2,              /*��Ÿ2                 */
              A.ORD_AGENT,         /*�Ǹ��ι�ȣ          */
              A.RENTAL_GROUP,
              B.CD_NM RENTAL_GROUP_NM,
              A.RENTAL_OFFICE,
              C.CD_NM RENTAL_OFFICE_NM
      FROM    RTCS0002 A
                LEFT OUTER JOIN (
                    SELECT CD,
                           CD_NM
                      FROM RTCM0051
                     WHERE 1=1
                       AND CD_GRP_CD = 'S301'
                ) B ON
                        A.RENTAL_GROUP = B.CD
                LEFT OUTER JOIN (
                    SELECT CD,
                           CD_NM,
                           RFR_1,
                           RFR_2
                      FROM RTCM0051
                     WHERE 1=1
                       AND CD_GRP_CD = 'S302'
                       AND RFR_1 = 'S301'
                ) C ON
                        A.RENTAL_GROUP = C.RFR_2
                    AND A.RENTAL_OFFICE = C.CD 
      WHERE   A.CARMASTER_NM LIKE '%'||v_Carmaster_Nm||'%'
--        AND   A.USE_YN = 'Y'  --[20170328_01]
        AND   A.USE_YN LIKE v_Use_Yn||'%'  --[20170622_02]
      ORDER   BY A.CARMASTER_NU;
                     
  END p_sRtcs0002carmasterPopup;
  
  /*****************************************************************************
  -- ������� �ε�� ���� ��ȸ
  
   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.3        2017-06-22  wjim             [20170622_01] ����߰�
  *****************************************************************************/
  PROCEDURE p_sRtcs0002carmasterNu (
      Ref_Cursor       IN OUT SYS_REFCURSOR
    , v_Carmaster_Nu   IN RTCS0002.CARMASTER_NU%TYPE    /*�ε�� ���         */
  ) IS
  
  BEGIN
  
      OPEN Ref_Cursor FOR
      SELECT  A.CARMASTER_NU,      /*ī����Ÿ ���         */
              A.CARMASTER_NM,      /*ī����Ÿ ��           */
              A.SALES_GROUP,       /*�����ڵ�              */
              Pkg_Rtcm0051.f_sRtcm0051CodeName('S018', SALES_GROUP) SALES_GROUP_NM,     /*�����         */
              A.SALES_OFFICE,      /*�����ڵ�              */
              Pkg_Rtcm0051.f_sRtcm0051CodeName('S019', A.SALES_OFFICE) SALES_OFFICE_NM, /*������         */
              A.AGENCY_CD,         /*�븮���ڵ�            */
              Pkg_Rtsd0007.f_sRtsd0007AgencyNm(A.AGENCY_CD) AGENCY_NM,                  /*�븮����       */
              A.MOB_NO,            /*�ڵ�����ȣ            */
              A.TEL_NO,            /*��ȭ��ȣ              */
              A.STR_DAY,           /*�Ի���                */
              A.END_DAY,           /*�����                */
              A.USE_YN,            /*�ٹ�����              */
              A.POS_CD,            /*�����ȣ              */
              A.CITY,              /*�ּ�                  */
              A.STREET,            /*���ּ�              */
              A.ETC1,              /*��Ÿ1                 */
              A.ETC2,              /*��Ÿ2                 */
              A.ORD_AGENT,         /*�Ǹ��ι�ȣ            */
              A.RENTAL_GROUP,
              -- (select RENTAL_GROUP_NM from rtsd0052 B where a.RENTAL_GROUP=b.RENTAL_GROUP) as RENTAL_GROUP_NM,
              B.CD_NM RENTAL_GROUP_NM,
              A.RENTAL_OFFICE,
              -- (select RENTAL_OFFICE_NM from rtsd0053 C ,rtsd0052 B where a.RENTAL_OFFICE=c.RENTAL_OFFICE and B.RENTAL_GROUP=c.RENTAL_GROUP) as RENTAL_OFFICE_NM
              C.CD_NM RENTAL_OFFICE_NM
      FROM    RTCS0002 A
                LEFT OUTER JOIN (
                    SELECT CD,
                           CD_NM
                      FROM RTCM0051
                     WHERE 1=1
                       AND CD_GRP_CD = 'S301'
                ) B ON
                        A.RENTAL_GROUP = B.CD
                LEFT OUTER JOIN (
                    SELECT CD,
                           CD_NM,
                           RFR_1,
                           RFR_2
                      FROM RTCM0051
                     WHERE 1=1
                       AND CD_GRP_CD = 'S302'
                       AND RFR_1 = 'S301'
                ) C ON
                        A.RENTAL_GROUP = C.RFR_2
                    AND A.RENTAL_OFFICE = C.CD 
      WHERE   A.CARMASTER_NU = v_Carmaster_Nu;
                     
  END p_sRtcs0002carmasterNu;  
  
  
  /*****************************************************************************
 -- AS������ ���ϱ�
 *****************************************************************************/  
  PROCEDURE p_sRtcs0002getmaxnu(
    v_Carmaster_Nu   OUT  RTCS0002.CARMASTER_NU%TYPE   /*ī����Ÿ ���         */
    ) IS
  
  BEGIN

    SELECT  DECODE(MAX(CARMASTER_NU),NULL,1,MAX(TO_NUMBER(CARMASTER_NU)) +1) AS MAXNU 
    INTO    v_Carmaster_Nu
    FROM    RTCS0002;
                     
  END p_sRtcs0002getmaxnu;
  
END Pkg_Rtcs0002;
/
