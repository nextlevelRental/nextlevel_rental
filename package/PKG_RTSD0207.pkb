CREATE OR REPLACE PACKAGE BODY NXRADMIN.Pkg_Rtsd0207 AS
/*******************************************************************************
   NAME      Pkg_Rtsd0207
   PURPOSE   SMS ���� ���� ��ȸ

   REVISIONS
   Ver        Date        Author           Description
   ---------  ----------  ---------------  -------------------------------------
   1.0        2020-09-22  kstka         1. Created this package body.                                        
*******************************************************************************/  
  
  /*****************************************************************************
  -- �������� SMS �߼۳��� Select
  *****************************************************************************/
  PROCEDURE p_sSmsCollectionList (
    Ref_Cursor      IN OUT SYS_REFCURSOR,
    v_Close_Ym      IN VARCHAR2,                /*������             */
    v_Send_Tp       IN VARCHAR2                 /*�߼۱���           */
    ) IS

  BEGIN
    
    OPEN Ref_Cursor FOR
    SELECT SUBSTR(RESERVED_DTTM, 1, 8) AS SEND_DAY
         , MSG_SNDER_NM AS SEND_TP
         , CASE WHEN TEMPLATE_CODE LIKE 'RENTAL%' OR TEMPLATE_CODE LIKE 'NXO2O%' THEN 'KAKAO' ELSE TEMPLATE_CODE END AS SEND_COM
         , COUNT(*) AS SEND_CNT
    FROM RTSD0205 A, RTSD0207 B 
    WHERE A.CMP_MSG_ID = B.MSG_ID 
    AND RESERVED_DTTM BETWEEN v_Close_Ym || '000000' AND v_Close_Ym || '235959'
    AND (v_Send_Tp IS NULL OR MSG_SNDER_NM  = v_Send_Tp)
    AND RESULT_CD = 'OK'
    GROUP BY SUBSTR(RESERVED_DTTM, 1, 8)
           , MSG_SNDER_NM
           , CASE WHEN TEMPLATE_CODE LIKE 'RENTAL%' OR TEMPLATE_CODE LIKE 'NXO2O%' THEN 'KAKAO' ELSE TEMPLATE_CODE END
    ORDER BY MSG_SNDER_NM
           , SUBSTR(RESERVED_DTTM, 1, 8)
           , CASE WHEN TEMPLATE_CODE LIKE 'RENTAL%' OR TEMPLATE_CODE LIKE 'NXO2O%' THEN 'KAKAO' ELSE TEMPLATE_CODE END;

  END p_sSmsCollectionList;
   
END Pkg_Rtsd0207;
/