package egovframework.ntrms.kr.co.comm.api;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class KafkaConsumerApi implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		KafkaConsumerWorker kafkaConsumerWorker = new KafkaConsumerWorker();
		new Thread(kafkaConsumerWorker).start();
		Runtime.getRuntime().addShutdownHook(new Thread(new KafkaConsumerCloser(kafkaConsumerWorker)));
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}

}
