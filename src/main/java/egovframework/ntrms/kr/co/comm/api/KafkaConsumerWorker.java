package egovframework.ntrms.kr.co.comm.api;

import java.time.Duration;
import java.util.Collections;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.common.errors.WakeupException;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.easymock.LogicalOperator;
import org.springframework.stereotype.Service;

@Service
public class KafkaConsumerWorker implements Runnable {

	protected Log logger = LogFactory.getLog(this.getClass());	
	
	final KafkaConsumer<String, String> consumer = createConsumer();
	
	private KafkaConsumer<String, String> createConsumer() {
		
		Properties props = new Properties();
		props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "172.17.0.135:9092");
		props.put(ConsumerConfig.GROUP_ID_CONFIG, "nexen");
		props.put(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
		props.put(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
		props.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, false);
		return new KafkaConsumer<>(props);
	}

	@Override
	public void run() {
		
		consumer.subscribe(Collections.singletonList("sms_send_01"));
		
		try{
			
			while (true) {
	            ConsumerRecords<String, String> records = consumer.poll(Duration.ofSeconds(1).getSeconds());
	
	            for (ConsumerRecord<String, String> record : records){
	            	System.out.println("====================================");
					System.out.println("record(key)::" + record.key());
					System.out.println("record(value)::" + record.value());
					System.out.println("record(offset)::" + record.offset());
					System.out.println("====================================");
	            }
	            
	            consumer.commitSync();
	        }
		} catch(WakeupException e) {
			
		} finally {
			consumer.commitSync();
			consumer.close();
		}
	}
	
	void shutdown() throws InterruptedException {
        consumer.wakeup();
    }
}
