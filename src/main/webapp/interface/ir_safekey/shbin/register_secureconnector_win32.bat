
@ECHO OFF


SETLOCAL

REM #####################################################
REM # JAVA ��ġ ��ġ
REM #####################################################
SET JAVA_HOME=C:\eGovFrame-3.2\jdk1.7.0_21



REM #####################################################
REM # NICE SecureConnector ��ġ
REM #####################################################
SET PGM_BASE_DIR=C:\eGovFrame-3.2\workspace\nexen_new\src\main\webapp\interface\ir_safekey
SET PGM_LIB_DIR=%PGM_BASE_DIR%\lib
SET PGM_BIN_DIR=%PGM_BASE_DIR%\bin
SET PGM_CFG_DIR=%PGM_BASE_DIR%\config


REM #####################################################
REM # CLASSPATH ����
REM # log4j.profile�� classpath�� �־�� ��
REM #####################################################
SET CLASSPATH=%CLASSPATH%;%PGM_LIB_DIR%\commons-codec-1.9.jar
SET CLASSPATH=%CLASSPATH%;%PGM_LIB_DIR%\log4j-1.2.17.jar
SET CLASSPATH=%CLASSPATH%;%PGM_LIB_DIR%\MagicCrypto\MagicCrypto.jar
SET CLASSPATH=%CLASSPATH%;%PGM_BIN_DIR%\nice-secureconnector-1.2.jar
SET CLASSPATH=%CLASSPATH%;%PGM_CFG_DIR%

REM #####################################################
REM # Magic Crypto V2.0�� ����ϱ� ���� ȯ�� ����
REM # DLL ������ ��ġ�� PATH�� ���� �־�� ���������� �����
REM #####################################################
PATH=%PATH%;%PGM_LIB_DIR%\MagicCrypto\win.32


REM #####################################################
REM # ���α׷� ����
REM #####################################################
"%JAVA_HOME%\bin\java" -Dlog4j.configuration=log4j.properties -Dbatch.prop=system.prop com.nice.secureconnector.SecureConnectorRegister %*


ENDLOCAL

pause

