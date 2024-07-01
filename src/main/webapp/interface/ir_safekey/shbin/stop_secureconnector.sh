
CNT_1=`ps -ef | grep svc=SecureConnector | grep -v grep | wc -l `
if [ $CNT_1 -gt 0 ]
then
	echo "NICE SecureConnector를 종료 합니다."
	ps -ef | grep svc=SecureConnector | grep -v grep
	kill -9 `ps -ef | grep svc=SecureConnector | grep -v grep | awk '{print  $2}'  `


	CNT_2=`ps -ef | grep svc=SecureConnector | grep -v grep | wc -l `
	if [ $CNT_2 -eq 0 ]
	then
		echo "NICE SecureConnector를 종료 했습니다."
	else
		echo "NICE SecureConnector 종료에 실패 했습니다."
	fi


else
	echo "실행중인 NICE SecureConnector가 없습니다."
fi
