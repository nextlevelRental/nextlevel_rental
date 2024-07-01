
########################################################
# Java ��ġ ��ġ
########################################################
JAVA_HOME=/usr/java/jdk1.6.0_30

########################################################
# NICE SecureConnector ��ġ
########################################################
PGM_BASE_DIR=/NCB01/ncbdev/prod/anylinkt/secureconnector
PGM_LIB_DIR=${PGM_BASE_DIR}/lib
PGM_BIN_DIR=${PGM_BASE_DIR}/bin
PGM_CONFIG_DIR=${PGM_BASE_DIR}/config

########################################################
# CLASSPATH ����
# log4j.properties�� classpath �� �־�� ��
########################################################
CLASSPATH=${CLASSPATH}:${PGM_LIB_DIR}/log4j-1.2.17.jar
CLASSPATH=${CLASSPATH}:${PGM_LIB_DIR}/commons-codec-1.9.jar
CLASSPATH=${CLASSPATH}:${PGM_LIB_DIR}/MagicCrypto/MagicCrypto.jar
CLASSPATH=${CLASSPATH}:${PGM_BIN_DIR}/nice-secureconnector-1.2.jar
CLASSPATH=${CLASSPATH}:${PGM_CONFIG_DIR}
export CLASSPATH


########################################################
# Magic Crypto V2.0�� ����ϱ� ���� ȯ�� ����
########################################################
LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${PGM_LIB_DIR}/MagicCrypto/linux26.32
export LD_LIBRARY_PATH

${JAVA_HOME}/bin/java -Dlog4j.configuration=log4j.properties -Dbatch.prop=system.prop com.nice.secureconnector.SecureConnectorRegister $*
