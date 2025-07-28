package egovframework.ntrms.kr.co.comm.api;

import java.util.Properties;

import org.apache.kafka.clients.producer.Callback;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;
import org.apache.kafka.common.serialization.StringSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class KafkaSenderApi {

//	@Value("${kafka.server.host}")
//	private String bootServerHost;
	
	private KafkaProducer<String, String> createProducer() {
		
		Properties props = new Properties();
		props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "172.17.0.135:9092");
		props.put(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
		props.put(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG, StringSerializer.class);
		return new KafkaProducer<>(props);
	}
	
	public void sendAsync(String message){
		
		final Producer<String, String> producer = createProducer();
		final ProducerRecord<String, String> record = new ProducerRecord<String, String>("sms_send_01", message);
		
		producer.send(record, new Callback() {
			
			@Override
			public void onCompletion(RecordMetadata metadata, Exception exception) {
				
				if(metadata != null){
					System.out.println("====================================");
					System.out.println("record(key)::" + record.key());
					System.out.println("record(value)::" + record.value());
					System.out.println("meta(partition)::" + metadata.partition());
					System.out.println("meta(offset)::" + metadata.offset());
					System.out.println("====================================");
				} else {
					System.out.printf("KafkaCallBack - Exception", exception.getCause());
	                exception.printStackTrace();
				}
				
			}
		});
		
	}
}
