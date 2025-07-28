CREATE OR REPLACE PACKAGE BODY NXRADMIN.PKG_DEBUG_KSG AS
/******************************************************************************
   NAME:       PKG_DEBUG_KSG
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-12-24      mastersg       1. Created this package.
******************************************************************************/

  PROCEDURE PROC_DEBUG(V_OUT OUT SYS_REFCURSOR) AS
  
  BEGIN
    
    PKG_RNT_COM.PRC_LIST_RENTAL_OFFICE(V_OUT, '01', NULL, '101', NULL);
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;

  END PROC_DEBUG;

END PKG_DEBUG_KSG;