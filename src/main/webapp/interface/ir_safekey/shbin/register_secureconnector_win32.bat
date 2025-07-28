
@ECHO OFF


SETLOCAL

REM #####################################################
REM # JAVA 설치 위치
REM #####################################################
SET JAVA_HOME=C:\eGovFrame-3.2\jdk1.7.0_21



REM #####################################################
REM # NICE SecureConnector 위치
REM #####################################################
SET PGM_BASE_DIR=C:\eGovFrame-3.2\workspace\nexen_new\src\main\webapp\interface\ir_safekey
SET PGM_LIB_DIR=%PGM_BASE_DIR%\lib
SET PGM_BIN_DIR=%PGM_BASE_DIR%\bin
SET PGM_CFG_DIR=%PGM_BASE_DIR%\config


REM #####################################################
REM # CLASSPATH 설정
REM # log4j.profile도 classpath에 있어야 함
REM #####################################################
SET CLASSPATH=%CLASSPATH%;%PGM_LIB_DIR%\commons-codec-1.9.jar
SET CLASSPATH=%CLASSPATH%;%PGM_LIB_DIR%\log4j-1.2.17.jar
SET CLASSPATH=%CLASSPATH%;%PGM_LIB_DIR%\MagicCrypto\MagicCrypto.jar
SET CLASSPATH=%CLASSPATH%;%PGM_BIN_DIR%\nice-secureconnector-1.2.jar
SET CLASSPATH=%CLASSPATH%;%PGM_CFG_DIR%

REM #####################################################
REM # Magic Crypto V2.0을 사용하기 위한 환경 변수
REM # DLL 파일의 위치가 PATH에 잡혀 있어야 정상적으로 실행됨
REM #####################################################
PATH=%PATH%;%PGM_LIB_DIR%\MagicCrypto\win.32


REM #####################################################
REM # 프로그램 실행
REM #####################################################
"%JAVA_HOME%\bin\java" -Dlog4j.configuration=log4j.properties -Dbatch.prop=system.prop com.nice.secureconnector.SecureConnectorRegister %*


ENDLOCAL

pause

