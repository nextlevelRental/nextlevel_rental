
########################################################
# Java 설치 위치
########################################################
JAVA_HOME=/usr/java/jdk1.6.0_30

########################################################
# NICE SecureConnector 위치
########################################################
PGM_BASE_DIR=/NCB01/ncbdev/prod/anylinkt/secureconnector
PGM_LIB_DIR=${PGM_BASE_DIR}/lib
PGM_BIN_DIR=${PGM_BASE_DIR}/bin
PGM_CONFIG_DIR=${PGM_BASE_DIR}/config

########################################################
# CLASSPATH 설정
# log4j.properties도 classpath 에 있어야 함
########################################################
CLASSPATH=${CLASSPATH}:${PGM_LIB_DIR}/log4j-1.2.17.jar
CLASSPATH=${CLASSPATH}:${PGM_LIB_DIR}/commons-codec-1.9.jar
CLASSPATH=${CLASSPATH}:${PGM_LIB_DIR}/MagicCrypto/MagicCrypto.jar
CLASSPATH=${CLASSPATH}:${PGM_BIN_DIR}/nice-secureconnector-1.2.jar
CLASSPATH=${CLASSPATH}:${PGM_CONFIG_DIR}
export CLASSPATH


########################################################
# Magic Crypto V2.0을 사용하기 위한 환경 변수
########################################################
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${PGM_LIB_DIR}/MagicCrypto/linux26.32
export LD_LIBRARY_PATH

${JAVA_HOME}/bin/java -Dlog4j.configuration=log4j.properties -Dbatch.prop=system.prop com.nice.secureconnector.SecureConnectorRegister $*
