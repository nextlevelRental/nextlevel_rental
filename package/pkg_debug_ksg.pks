CREATE OR REPLACE PACKAGE NXRADMIN.PKG_DEBUG_KSG AS
/******************************************************************************
   NAME:       PKG_DEBUG_KSG
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        2018-12-24      mastersg       1. Created this package.
******************************************************************************/

  PROCEDURE PROC_DEBUG(V_OUT OUT SYS_REFCURSOR);

END PKG_DEBUG_KSG;
/
