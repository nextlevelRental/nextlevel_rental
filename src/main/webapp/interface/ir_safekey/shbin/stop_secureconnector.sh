
CNT_1=`ps -ef | grep svc=SecureConnector | grep -v grep | wc -l `
if [ $CNT_1 -gt 0 ]
then
	echo "NICE SecureConnector�� ���� �մϴ�."
	ps -ef | grep svc=SecureConnector | grep -v grep
	kill -9 `ps -ef | grep svc=SecureConnector | grep -v grep | awk '{print  $2}'  `


	CNT_2=`ps -ef | grep svc=SecureConnector | grep -v grep | wc -l `
	if [ $CNT_2 -eq 0 ]
	then
		echo "NICE SecureConnector�� ���� �߽��ϴ�."
	else
		echo "NICE SecureConnector ���ῡ ���� �߽��ϴ�."
	fi


else
	echo "�������� NICE SecureConnector�� �����ϴ�."
fi
