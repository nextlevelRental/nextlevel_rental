CREATE OR REPLACE PACKAGE NXRADMIN.Pkg_Rtsd0119 AS
/*******************************************************************************
   NAME:      Pkg_Rtsd0119
   PURPOSE   대리점 정보 이력 관리

   REVISIONS   
   Ver      Date        Author      Description
   ----     ----------  ---------   -------------------------------------
   1.0      2015-12-16  jemcarry    1. Created this package body.
   1.1      2016-09-05  임욱재     채널대/중분류, 온라인장착 가능여부 항목 추가
*******************************************************************************/

  /*****************************************************************************
  -- 대리점 정보 이력 Count
  *****************************************************************************/
  FUNCTION f_sRtsd0119Count(
    v_Agency_Cd      IN RTSD0119.AGENCY_CD%TYPE,        /*대리점코드          */
    v_Seq            IN RTSD0119.SEQ%TYPE               /*순번                */
    ) RETURN NUMBER;

  /*****************************************************************************
  -- 대리점 정보 이력 Select
  *****************************************************************************/
  PROCEDURE p_sRtsd0119 (
    Ref_Cursor       IN OUT SYS_REFCURSOR,
    v_Agency_Cd      IN RTSD0119.AGENCY_CD%TYPE,      /*대리점코드            */
    v_Seq            IN RTSD0119.SEQ%TYPE             /*순번                  */
    );

  /*****************************************************************************
  -- 대리점 정보 이력 Insert
  *****************************************************************************/
  FUNCTION f_InsertRtsd0119 (
    v_Agency_Cd      IN RTSD0119.AGENCY_CD%TYPE,      /*대리점코드            */
    v_ErrorText      OUT VARCHAR2
    ) RETURN NUMBER;

END Pkg_Rtsd0119;